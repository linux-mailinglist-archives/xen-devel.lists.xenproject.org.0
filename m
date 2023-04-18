Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1BF6E687A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522984.812686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponW6-0007qO-1I; Tue, 18 Apr 2023 15:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522984.812686; Tue, 18 Apr 2023 15:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponW5-0007o6-UT; Tue, 18 Apr 2023 15:45:13 +0000
Received: by outflank-mailman (input) for mailman id 522984;
 Tue, 18 Apr 2023 15:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7BjK=AJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ponW3-0007mc-RH
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:45:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc16f2e-ddff-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 17:45:10 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-5hH2RS9OPUeBpaTsb3BCaw-1; Tue, 18 Apr 2023 11:45:07 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f08ed462c0so42522965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Apr 2023 08:45:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c715:3f00:7545:deb6:f2f4:27ef?
 (p200300cbc7153f007545deb6f2f427ef.dip0.t-ipconnect.de.
 [2003:cb:c715:3f00:7545:deb6:f2f4:27ef])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a5d654a000000b002daeb108304sm13380984wrv.33.2023.04.18.08.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 08:45:05 -0700 (PDT)
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
X-Inumbo-ID: ffc16f2e-ddff-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681832709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27YuiGTc/1Ayk3pIwHwifC0cK9cQSm41NYDsP6qMI7E=;
	b=CDPJWjw7922+HWw5MqXWuotkaTCG5XVEvGU1OSihcrxAc9NydIVybPt59TN32MBRtuA/5m
	UFxuV07/YeaK2h96WTHKE4Xc2Lrlnzyri5go6ZXhcHvV4A47wf/QxXJa4YP8FT4DCwQ8QM
	+Mu/7eMO8xZc5VF/cbvXjIiEcZcwDkE=
X-MC-Unique: 5hH2RS9OPUeBpaTsb3BCaw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681832706; x=1684424706;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27YuiGTc/1Ayk3pIwHwifC0cK9cQSm41NYDsP6qMI7E=;
        b=c8P0YZdRCMs56jb1Pyj9l4vwKmf//YYdNP4JteeKDm6u/tUZePhFzVSdRrTZeTvQz9
         +8DSJdJvpHxCm27go79Mx8EptBa2ovDKUKAV7HM2vpbHrK1QOcVnsrT/2ckLzta1/nsO
         pdAw8R8/sDrENW/ic6F+KIw44nUFVKu5LHIGd4ciWyrMul8GOe1hJU9kAFwVB+DSlOd/
         qNzAwAYxVHnX+QtXpsM/gLnHoc9dCRRPNTXeJvvrs8QG8z0xgY7R3cfuHvzVy1ayOGXq
         ZUFuDWrrZZBQAWdp3r+VdlDsY8et4uT/gD3goXbu4nola7YiNgWYSOFkuBZAUhcJyjdb
         XcWg==
X-Gm-Message-State: AAQBX9csBihzehVtQyX3S/Gl2HudE/QXYdYGBT+R5+azviqmrundvHV7
	dKTv4LCOX+6nroUZAKUGHFmyqFdg1fj66GIDYya8knZAeQ+IJnkTFrmzv4Fo2cAHdQSbQT8wl+N
	Uzj/KBkpw3vrvZ0RTkrXluccbrIw=
X-Received: by 2002:a5d:6dcc:0:b0:2ef:b8ae:8791 with SMTP id d12-20020a5d6dcc000000b002efb8ae8791mr2341926wrz.10.1681832706618;
        Tue, 18 Apr 2023 08:45:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350boD2pgyaTgtT87B/OGZT/ZiXFytTcP4U4+Qx8x/yMODSTgYDG7+n20ySQtuSYJgFc2NPKTdg==
X-Received: by 2002:a5d:6dcc:0:b0:2ef:b8ae:8791 with SMTP id d12-20020a5d6dcc000000b002efb8ae8791mr2341904wrz.10.1681832706235;
        Tue, 18 Apr 2023 08:45:06 -0700 (PDT)
Message-ID: <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
Date: Tue, 18 Apr 2023 17:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230417205048.15870-2-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> s390 uses page->index to keep track of page tables for the guest address
> space. In an attempt to consolidate the usage of page fields in s390,
> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> 
> This will help with the splitting of struct ptdesc from struct page, as
> well as allow s390 to use _pt_frag_refcount for fragmented page table
> tracking.
> 
> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> before freeing the pages as well.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

[...]

> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 3fc9e680f174..2616d64c0e8c 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -144,7 +144,7 @@ struct page {
>   		struct {	/* Page table pages */
>   			unsigned long _pt_pad_1;	/* compound_head */
>   			pgtable_t pmd_huge_pte; /* protected by page->ptl */
> -			unsigned long _pt_pad_2;	/* mapping */
> +			unsigned long _pt_s390_gaddr;	/* mapping */
>   			union {
>   				struct mm_struct *pt_mm; /* x86 pgds only */
>   				atomic_t pt_frag_refcount; /* powerpc */

The confusing part is, that these gmap page tables are not ordinary 
process page tables that we would ordinarily place into this section 
here. That's why they are also not allocated/freed using the typical 
page table constructor/destructor ...

-- 
Thanks,

David / dhildenb


