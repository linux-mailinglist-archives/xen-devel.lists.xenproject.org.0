Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AB225A8E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:56:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRa2-0001Dj-Eh; Mon, 20 Jul 2020 08:55:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxRa0-0001Db-Qs
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 08:55:24 +0000
X-Inumbo-ID: bf0251c0-ca66-11ea-9f71-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf0251c0-ca66-11ea-9f71-12813bfff9fa;
 Mon, 20 Jul 2020 08:55:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95AE0B145;
 Mon, 20 Jul 2020 08:55:28 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/shadow: l3table[] and gl3e[] are HVM only
To: Tim Deegan <tim@xen.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
 <a3b9b496-e860-e657-2afc-c0658871fa3f@suse.com>
 <20200718182037.GA48915@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1baa0d50-86a4-b0ba-d43a-ad0c0446b54b@suse.com>
Date: Mon, 20 Jul 2020 10:55:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200718182037.GA48915@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.07.2020 20:20, Tim Deegan wrote:
> At 12:00 +0200 on 15 Jul (1594814409), Jan Beulich wrote:
>> ... by the very fact that they're 3-level specific, while PV always gets
>> run in 4-level mode. This requires adding some seemingly redundant
>> #ifdef-s - some of them will be possible to drop again once 2- and
>> 3-level guest code doesn't get built anymore in !HVM configs, but I'm
>> afraid there's still quite a bit of disentangling work to be done to
>> make this possible.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Looks good.  It seems like the new code for '3-level non-HVM' in
> guest-walks ought to have some sort of assert-unreachable in them too
> - or is there a reason to to?

You mean this piece of code

+#elif !defined(CONFIG_HVM)
+    (void)root_gfn;
+    memset(gw, 0, sizeof(*gw));
+    return false;
+#else /* PAE */

If so - sure, ASSERT_UNREACHABLE() could be added there. It simply
didn't occur to me. I take it your ack for the entire series holds
here with this addition.

Jan

