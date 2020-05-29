Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F771E7D16
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jee30-0001dI-UJ; Fri, 29 May 2020 12:23:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jee2z-0001dD-Ar
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:23:37 +0000
X-Inumbo-ID: 38337a12-a1a7-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38337a12-a1a7-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 12:23:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CA4BAE96;
 Fri, 29 May 2020 12:23:35 +0000 (UTC)
Subject: Re: [PATCH v2 11/14] x86/alt: Adjust _alternative_instructions() to
 not create shadow stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-12-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e6d1503-40a8-55b9-9bd3-750cf301220d@suse.com>
Date: Fri, 29 May 2020 14:23:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-12-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 21:18, Andrew Cooper wrote:
> @@ -398,6 +399,19 @@ static void __init _alternative_instructions(bool force)
>          panic("Timed out waiting for alternatives self-NMI to hit\n");
>  
>      set_nmi_callback(saved_nmi_callback);
> +
> +    /*
> +     * When Xen is using shadow stacks, the alternatives clearing CR0.WP and
> +     * writing into the mappings set dirty bits, turning the mappings into
> +     * shadow stack mappings.
> +     *
> +     * While we can execute from them, this would also permit them to be the
> +     * target of WRSS instructions, so reset the dirty after patching.
> +     */
> +    if ( cpu_has_xen_shstk )
> +        modify_xen_mappings(XEN_VIRT_START + MB(2),
> +                            (unsigned long)&__2M_text_end,
> +                            PAGE_HYPERVISOR_RX);

Am I misremembering, or did you post a patch before that should
be part of this series, as being a prereq to this change,
making modify_xen_mappings() also respect _PAGE_DIRTY as
requested by the caller?

Additionally I notice this

        if ( desc->Attribute & (efi_bs_revision < EFI_REVISION(2, 5)
                                ? EFI_MEMORY_WP : EFI_MEMORY_RO) )
            prot &= ~_PAGE_RW;

in efi_init_memory(). Afaict we will need to clear _PAGE_DIRTY
there as well, with prot starting out as PAGE_HYPERVISOR_RWX.

Jan

