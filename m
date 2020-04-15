Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0261F1A99C1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOepG-0007xe-Rv; Wed, 15 Apr 2020 09:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOepE-0007xW-V3
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:59:20 +0000
X-Inumbo-ID: c60a5f06-7eff-11ea-8a21-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c60a5f06-7eff-11ea-8a21-12813bfff9fa;
 Wed, 15 Apr 2020 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ia7EMmFXKoD8KY9+fWiHsKqYonOUWQS6sBZd18xK2Ww=; b=Z8jaX7nArqqVN8PQQK/71ZQUqQ
 MvZNRE0Dq2iW4iNimuy/3GxYZZi5DnmdDafSo+D+FfTJ70KsujmmR+40eqOGWN7qM9dGmZVBDMbVK
 wMxPHw4ai6+m7uOW7XSR7RLl5QaYVnQNVybZYhogqJHlxCZysFo9CaNQA0xACmAtWAHw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOepC-0008Ba-An; Wed, 15 Apr 2020 09:59:18 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=edge-m1-r3-181.e-iad16.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOepC-0008EA-0X; Wed, 15 Apr 2020 09:59:18 +0000
Message-ID: <aba418d9b5d8832a2331c3164dc1a9fa1653f6be.camel@xen.org>
Subject: Re: [PATCH 1/2] x86: drop unnecessary page table walking in compat
 r/o M2P handling
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 15 Apr 2020 10:59:16 +0100
In-Reply-To: <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
 <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-04-15 at 10:23 +0200, Jan Beulich wrote:
> We have a global variable where the necessary L2 table is recorded;
> no
> need to inspect L4 and L3 tables (and this way a few less places will
> eventually need adjustment when we want to support 5-level page
> tables).
> Also avoid setting up the L3 entry, as the address range never gets
> used
> anyway (it'll be dropped altogether in a subsequent patch).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -219,9 +219,7 @@ static void destroy_compat_m2p_mapping(s
>  {
>      unsigned long i, va, rwva, pt_pfn;
>      unsigned long smap = info->spfn, emap = info->spfn;
> -
> -    l3_pgentry_t *l3_ro_mpt;
> -    l2_pgentry_t *l2_ro_mpt;
> +    l2_pgentry_t *l2_ro_mpt = compat_idle_pg_table_l2;
>  
>      if ( smap > ((RDWR_COMPAT_MPT_VIRT_END -
> RDWR_COMPAT_MPT_VIRT_START) >> 2) )
>          return;
> @@ -229,12 +227,6 @@ static void destroy_compat_m2p_mapping(s
>      if ( emap > ((RDWR_COMPAT_MPT_VIRT_END -
> RDWR_COMPAT_MPT_VIRT_START) >> 2) )
>          emap = (RDWR_COMPAT_MPT_VIRT_END -
> RDWR_COMPAT_MPT_VIRT_START) >> 2;
>  
> -    l3_ro_mpt =
> l4e_to_l3e(idle_pg_table[l4_table_offset(HIRO_COMPAT_MPT_VIRT_START)]
> );
> -
> -    ASSERT(l3e_get_flags(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_V
> IRT_START)]) & _PAGE_PRESENT);
> -
> -    l2_ro_mpt =
> l3e_to_l2e(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)]);
> -
>      for ( i = smap; i < emap; )
>      {
>          va = HIRO_COMPAT_MPT_VIRT_START +
> @@ -323,7 +315,6 @@ static int setup_compat_m2p_table(struct
>      unsigned long i, va, smap, emap, rwva, epfn = info->epfn;
>      mfn_t mfn;
>      unsigned int n;
> -    l3_pgentry_t *l3_ro_mpt = NULL;
>      l2_pgentry_t *l2_ro_mpt = NULL;
>      int err = 0;
>  
> @@ -342,13 +333,7 @@ static int setup_compat_m2p_table(struct
>      emap = ( (epfn + ((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1 )) &
>                  ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) );
>  
> -    va = HIRO_COMPAT_MPT_VIRT_START +
> -         smap * sizeof(*compat_machine_to_phys_mapping);
> -    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
> -
> -    ASSERT(l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
> _PAGE_PRESENT);
> -
> -    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> +    l2_ro_mpt = compat_idle_pg_table_l2;
>  
>  #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
>  #define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
> @@ -627,16 +612,10 @@ void __init paging_init(void)
>  #undef MFN
>  
>      /* Create user-accessible L2 directory to map the MPT for compat
> guests. */
> -    BUILD_BUG_ON(l4_table_offset(RDWR_MPT_VIRT_START) !=
> -                 l4_table_offset(HIRO_COMPAT_MPT_VIRT_START));
> -    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(
> -        HIRO_COMPAT_MPT_VIRT_START)]);
>      if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
>          goto nomem;
>      compat_idle_pg_table_l2 = l2_ro_mpt;
>      clear_page(l2_ro_mpt);
> -    l3e_write(&l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)
> ],
> -              l3e_from_paddr(__pa(l2_ro_mpt),
> __PAGE_HYPERVISOR_RO));
>      l2_ro_mpt += l2_table_offset(HIRO_COMPAT_MPT_VIRT_START);
>      /* Allocate and map the compatibility mode machine-to-phys
> table. */
>      mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));

The code around here, I am wondering if there is a reason to put it in
this patch. If we bisect, we can end up in a commit which says the
address range of compat is still there in config.h, but actually it's
gone, so this probably belongs to the 2nd patch.

Apart from that,
Reviewed-by: Hongyan Xia <hongyxia@amazon.com>

I would like to drop relevant map/unmap patches and replace them with
the new clean-up ones (and place them at the beginning of the series),
if there is no objection with that.

Hongyan


