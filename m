Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9AA1BF88F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8j5-000370-3a; Thu, 30 Apr 2020 12:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU8j4-00036p-6K
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:55:38 +0000
X-Inumbo-ID: e297f320-8ae1-11ea-9a43-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e297f320-8ae1-11ea-9a43-12813bfff9fa;
 Thu, 30 Apr 2020 12:55:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3D4CAE84;
 Thu, 30 Apr 2020 12:55:34 +0000 (UTC)
Subject: Re: [PATCH v6 10/15] efi: switch to new APIs in EFI code
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <f5fba4470f6d0a6a62e9e2139d6ef260a5c901f9.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5ca6bf6-d093-f8d7-0adc-29356590f0a7@suse.com>
Date: Thu, 30 Apr 2020 14:55:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f5fba4470f6d0a6a62e9e2139d6ef260a5c901f9.1587735799.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 16:09, Hongyan Xia wrote:
> --- a/xen/arch/x86/efi/runtime.h
> +++ b/xen/arch/x86/efi/runtime.h
> @@ -1,12 +1,18 @@
> +#include <xen/domain_page.h>
> +#include <xen/mm.h>
>  #include <asm/atomic.h>
>  #include <asm/mc146818rtc.h>
>  
>  #ifndef COMPAT
> -l4_pgentry_t *__read_mostly efi_l4_pgtable;
> +mfn_t __read_mostly efi_l4_mfn = INVALID_MFN_INITIALIZER;
>  
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
>  {
> -    if ( efi_l4_pgtable )
> +    if ( !mfn_eq(efi_l4_mfn, INVALID_MFN) )
> +    {
> +        l4_pgentry_t *efi_l4_pgtable = map_domain_page(efi_l4_mfn);
>          l4e_write(efi_l4_pgtable + l4idx, l4e);

Blank line between declaration(s) and statement(s) please.

Also, while I realize the choice of name of the local variable
is (presumably) to avoid further code churn, I think it isn't
really suitable for a local variable (also elsewhere below).

> @@ -1489,6 +1493,7 @@ static bool __init rt_range_valid(unsigned long smfn, unsigned long emfn)
>  void __init efi_init_memory(void)
>  {
>      unsigned int i;
> +    l4_pgentry_t *efi_l4_pgtable;
>      struct rt_extra {
>          struct rt_extra *next;
>          unsigned long smfn, emfn;
> @@ -1603,8 +1608,9 @@ void __init efi_init_memory(void)
>       * Set up 1:1 page tables for runtime calls. See SetVirtualAddressMap() in
>       * efi_exit_boot().
>       */
> -    efi_l4_pgtable = alloc_xen_pagetable();
> -    BUG_ON(!efi_l4_pgtable);
> +    efi_l4_mfn = alloc_xen_pagetable_new();
> +    BUG_ON(mfn_eq(efi_l4_mfn, INVALID_MFN));
> +    efi_l4_pgtable = map_domain_page(efi_l4_mfn);
>      clear_page(efi_l4_pgtable);
>  
>      copy_mapping(0, max_page, ram_range_valid);

Why don't you pass the already mapped L4 table into this function,
rather than mapping the same page a 2nd time there?

> @@ -1681,11 +1693,17 @@ void __init efi_init_memory(void)
>              extra_head = extra->next;
>              xfree(extra);
>          }
> +
> +        unmap_domain_page(l1t);
> +        unmap_domain_page(pl2e);
> +        unmap_domain_page(pl3e);

All three should be pulled further up, each to the earliest
possible place (and then using the uppercase version of the
construct as suitable).

Jan

