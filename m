Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443552DF9C6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 09:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57300.100232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGHV-0004vY-C0; Mon, 21 Dec 2020 08:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57300.100232; Mon, 21 Dec 2020 08:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGHV-0004v9-8V; Mon, 21 Dec 2020 08:11:01 +0000
Received: by outflank-mailman (input) for mailman id 57300;
 Mon, 21 Dec 2020 08:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGHT-0004v4-7u
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:10:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 028be536-b425-4054-89e2-94ebb5a07192;
 Mon, 21 Dec 2020 08:10:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60C27AD45;
 Mon, 21 Dec 2020 08:10:57 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 028be536-b425-4054-89e2-94ebb5a07192
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608538257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ma1MYWHLgJyLaOiBow43xe5cjJSTbgU999BVjooDWq8=;
	b=hiubR8nAhO5U2mRG4sil/AjtUsn64hixCEPA2X6/Vq8qGV1btsqF8gzSVmiRieVzqffhOJ
	1jmmYe0BSgTsyZW7ZSxENPwlTBUIPTypbUzuCiMwkTBdvR40tzzFlOJaO1cOSke6O96ILJ
	1HMVHXBwACT1gAEimvLbssXXB7e1QHo=
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
Date: Mon, 21 Dec 2020 09:10:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 20:18, Andrew Cooper wrote:
> On 15/12/2020 16:26, Jan Beulich wrote:
>> This is together with its only caller, xenmem_add_to_physmap_one().
> 
> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
> follow-on from the subject sentence.
> 
>>  Move
>> the latter next to p2m_add_foreign(), allowing this one to become static
>> at the same time.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

So I had to ask Andrew to revert this (I was already at home when
noticing the breakage), as it turned out to break the shim build.
The problem is that xenmem_add_to_physmap() is non-static and
hence can't be eliminated altogether by the compiler when !HVM.
We could make the function conditionally static
"#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
looks uglier to me than this extra hunk:

--- unstable.orig/xen/common/memory.c
+++ unstable/xen/common/memory.c
@@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
     union add_to_physmap_extra extra = {};
     struct page_info *pages[16];
 
-    ASSERT(paging_mode_translate(d));
+    if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
+        return -EACCES;
+    }
 
     if ( xatp->space == XENMAPSPACE_gmfn_foreign )
         extra.foreign_domid = DOMID_INVALID;

Andrew, please let me know whether your ack stands with this (or
said alternative) added, or whether you'd prefer me to re-post.

Jan

