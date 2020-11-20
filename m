Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BD2BAA6D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32144.63087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5pj-00054z-Kr; Fri, 20 Nov 2020 12:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32144.63087; Fri, 20 Nov 2020 12:48:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5pj-00054a-HE; Fri, 20 Nov 2020 12:48:11 +0000
Received: by outflank-mailman (input) for mailman id 32144;
 Fri, 20 Nov 2020 12:48:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg5ph-00052v-Ha
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:48:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 705721be-47c8-42c3-98f2-f8bc4662558a;
 Fri, 20 Nov 2020 12:48:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B54AEAC2F;
 Fri, 20 Nov 2020 12:48:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg5ph-00052v-Ha
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:48:09 +0000
X-Inumbo-ID: 705721be-47c8-42c3-98f2-f8bc4662558a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 705721be-47c8-42c3-98f2-f8bc4662558a;
	Fri, 20 Nov 2020 12:48:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605876486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W5SKfLxS9P8Oy1kRO1B1GHv3bqQeOd6wIJNTG5W8Ek=;
	b=CNhFFOc/6PWwhGSiqBGd6pxgF4pkdlppFCpL8UOLoD/zbHG8bTCFZGM7FXx6Cd8II1I30P
	EDlzXHUT/JnyI7+YpNYsRQ7EQGOOQ+snqgxdz29sXob2lkOdMyffkP4pmDyrqv3myZctHg
	KzjvQX3kNlCXQkugBG+1k4Zmkqz4zxg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B54AEAC2F;
	Fri, 20 Nov 2020 12:48:06 +0000 (UTC)
Subject: Ping: [PATCH v2] x86/PV: make post-migration page state consistent
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
Message-ID: <b733914b-1bfd-d95d-470e-af3ca7a4f69f@suse.com>
Date: Fri, 20 Nov 2020 13:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.11.2020 08:56, Jan Beulich wrote:
> When a page table page gets de-validated, its type reference count drops
> to zero (and PGT_validated gets cleared), but its type remains intact.
> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
> such pages. An intermediate write to such a page via e.g.
> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
> return. In libxc the decision which pages to normalize / localize
> depends solely on the type returned from the domctl. As a result without
> further precautions the guest won't be able to tell whether such a page
> has had its (apparent) PTE entries transitioned to the new MFNs.
> 
> Add a check of PGT_validated, thus consistently avoiding normalization /
> localization in the tool stack.
> 
> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
> open coding it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Don't change type's type.

Ping?

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -215,7 +215,7 @@ long arch_do_domctl(
>  
>          for ( i = 0; i < num; ++i )
>          {
> -            unsigned long gfn = 0, type = 0;
> +            unsigned long gfn = 0, type = XEN_DOMCTL_PFINFO_NOTAB;
>              struct page_info *page;
>              p2m_type_t t;
>  
> @@ -255,6 +255,8 @@ long arch_do_domctl(
>  
>                  if ( page->u.inuse.type_info & PGT_pinned )
>                      type |= XEN_DOMCTL_PFINFO_LPINTAB;
> +                else if ( !(page->u.inuse.type_info & PGT_validated) )
> +                    type = XEN_DOMCTL_PFINFO_NOTAB;
>  
>                  if ( page->count_info & PGC_broken )
>                      type = XEN_DOMCTL_PFINFO_BROKEN;
> 


