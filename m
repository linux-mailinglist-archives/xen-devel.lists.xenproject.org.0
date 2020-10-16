Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D87C2902BB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 12:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7873.20765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMrZ-0002jc-7Z; Fri, 16 Oct 2020 10:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7873.20765; Fri, 16 Oct 2020 10:21:29 +0000
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
	id 1kTMrZ-0002jD-4N; Fri, 16 Oct 2020 10:21:29 +0000
Received: by outflank-mailman (input) for mailman id 7873;
 Fri, 16 Oct 2020 10:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTMrX-0002j8-Se
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:21:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25006e1c-c1df-4e4f-ac89-c0ab42d59e66;
 Fri, 16 Oct 2020 10:21:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 928EBAEEF;
 Fri, 16 Oct 2020 10:21:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTMrX-0002j8-Se
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:21:27 +0000
X-Inumbo-ID: 25006e1c-c1df-4e4f-ac89-c0ab42d59e66
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 25006e1c-c1df-4e4f-ac89-c0ab42d59e66;
	Fri, 16 Oct 2020 10:21:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602843685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcmxnvRUtgd5pwtZDJYRsRYYJtUit4eLtWDDXvSIsZA=;
	b=o1mH86nuLG+oZiXBJ815ysRWI7MJTtTamFh18yR9aCNFHFbcni3mN3kW36LxDyGCP/0lPW
	YuEdYKoRkZZoaICvm3QkNswkEjnB0sQK0/LiyGr9ow2JI9E1NuoWKoXdC8Dfzn+nDcpSBI
	KnjwDh4sUmyRSYMXuRsIYBdY4mC3RAo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 928EBAEEF;
	Fri, 16 Oct 2020 10:21:25 +0000 (UTC)
Subject: Ping: [PATCH] x86/PV: make post-migration page state consistent
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Message-ID: <f4804dc9-4a6f-6601-2fc9-9b6d4a3ae41a@suse.com>
Date: Fri, 16 Oct 2020 12:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.09.2020 12:34, Jan Beulich wrote:
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
> Alongside using XEN_DOMCTL_PFINFO_NOTAB instead of plain zero for the
> change at hand, also change the variable's initializer to use this
> constant, too. Take the opportunity and also adjust its type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think I did address all questions here.

Jan

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -215,7 +215,8 @@ long arch_do_domctl(
>  
>          for ( i = 0; i < num; ++i )
>          {
> -            unsigned long gfn = 0, type = 0;
> +            unsigned long gfn = 0;
> +            unsigned int type = XEN_DOMCTL_PFINFO_NOTAB;
>              struct page_info *page;
>              p2m_type_t t;
>  
> @@ -255,6 +256,8 @@ long arch_do_domctl(
>  
>                  if ( page->u.inuse.type_info & PGT_pinned )
>                      type |= XEN_DOMCTL_PFINFO_LPINTAB;
> +                else if ( !(page->u.inuse.type_info & PGT_validated) )
> +                    type = XEN_DOMCTL_PFINFO_NOTAB;
>  
>                  if ( page->count_info & PGC_broken )
>                      type = XEN_DOMCTL_PFINFO_BROKEN;
> 


