Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80611C657
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 08:23:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifIkR-0006ER-Ir; Thu, 12 Dec 2019 07:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifIkP-0006EM-Q9
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 07:18:53 +0000
X-Inumbo-ID: a46e9676-1caf-11ea-8cc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a46e9676-1caf-11ea-8cc8-12813bfff9fa;
 Thu, 12 Dec 2019 07:18:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92C27AD95;
 Thu, 12 Dec 2019 07:18:48 +0000 (UTC)
To: Nicholas Tsirakis <niko.tsirakis@gmail.com>, boris.ostrovsky@oracle.com
References: <CAFqpmVJ90bAV4vasH1Z0DcTUjT7asCJFPeJBxtxGZwAhTVP7=w@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b02d053f-1b07-bd4f-20fc-9a26106145d1@suse.com>
Date: Thu, 12 Dec 2019 08:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFqpmVJ90bAV4vasH1Z0DcTUjT7asCJFPeJBxtxGZwAhTVP7=w@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------FA289E34BBAF792FD09929E5"
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] Xen-ballooned memory never returned to domain
 after partial-free
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------FA289E34BBAF792FD09929E5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.12.19 23:08, Nicholas Tsirakis wrote:
> Hello,
> 
> The issue I'm seeing is that pages of previously-xenballooned memory are getting
> trapped in the balloon on free, specifically when they are free'd in batches
> (i.e. not all at once). The first batch is restored to the domain properly, but
> subsequent frees are not.
> 
> Truthfully I'm not sure if this is a bug or not, but the behavior I'm seeing
> doesn't seem to make sense. Note that this "bug" is in the balloon driver, but
> the behavior is seen when using the gnttab API, which utilizes the balloon in
> the background.
> 
> ------------------------------------------------------------------------------
> 
> This issue is better illustrated as an example, seen below. Note that the file
> in question is drivers/xen/balloon.c:
> 
> Kernel version: 4.19.*, code seems consistent on master as well
> Relevant configs:
>      - CONFIG_MEMORY_HOTPLUG not set
>      - CONFIG_XEN_BALLOON_MEMORY_HOTPLUG not set
> 
> * current_pages = # of pages assigned to domain
> * target_pages = # of pages we want assigned to domain
> * credit = target - current
> 
> Start with current_pages/target_pages = 20 pages
> 
> 1. alloc 5 pages with gnttab_alloc_pages(). current_pages = 15, credit = 5.
> 2. alloc 3 pages with gnttab_alloc_pages(). current_pages = 12, credit = 8.
> 3. some time later, free the last 3 pages with gnttab_free_pages().
> 4. 3 pages go back to balloon and balloon worker is scheduled since credit > 0.
>      * Relevant part of balloon worker shown below:
> 
>      do {
>          ...
> 
>          credit = current_credit();
> 
>          if (credit > 0) {
>              if (balloon_is_inflated())
>                  state = increase_reservation(credit);
>              else
>                  state = reserve_additional_memory();
>          }
> 
>          ...
> 
>      } while (credit && state == BP_DONE);
> 
> 5. credit > 0 and the balloon contains 3 pages, so run increase_reservation. 3
>     pages are restored to domain, correctly. current_pages = 15, credit = 5.
> 6. at this point credit is still > 0, so we loop again.
> 7. this time, the balloon has 0 pages, so we call reserve_additional_memory,
>     seen below. note that CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is disabled, so this
>     funciton is very sparse.
> 
>      static enum bp_state reserve_additional_memory(void)
>      {
>          balloon_stats.target_pages = balloon_stats.current_pages;
>          return BP_ECANCELED;
>      }
> 
> 8. now target = current = 15, which drops our credit down to 0.

And I think this is the problem. We want here:

     balloon_stats.target_pages = balloon_stats.current_pages +
                                  balloon_stats.target_unpopulated;

This should fix it. Thanks for the detailed analysis!

Does the attached patch work for you?

And are you fine with the "Reported-by:" added?


Juergen

--------------FA289E34BBAF792FD09929E5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-balloon-fix-ballooned-page-accounting-without-ho.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-balloon-fix-ballooned-page-accounting-without-ho.pa";
 filename*1="tch"

From 7cf6cf2b94ee11002dab439fb4ed5c7dcc1a971b Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Thu, 12 Dec 2019 08:12:26 +0100
Subject: [PATCH] xen/balloon: fix ballooned page accounting without hotplug
 enabled

When CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not defined
reserve_additional_memory() will set balloon_stats.target_pages to a
wrong value in case there are still some ballooned pages allocated via
alloc_xenballooned_pages().

This will result in balloon_process() no longer be triggered when
ballooned pages are freed in batches.

Reported-by: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/balloon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 4f2e78a5e4db..0c142bcab79d 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -394,7 +394,8 @@ static struct notifier_block xen_memory_nb = {
 #else
 static enum bp_state reserve_additional_memory(void)
 {
-	balloon_stats.target_pages = balloon_stats.current_pages;
+	balloon_stats.target_pages = balloon_stats.current_pages +
+				     balloon_stats.target_unpopulated;
 	return BP_ECANCELED;
 }
 #endif /* CONFIG_XEN_BALLOON_MEMORY_HOTPLUG */
-- 
2.16.4


--------------FA289E34BBAF792FD09929E5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------FA289E34BBAF792FD09929E5--

