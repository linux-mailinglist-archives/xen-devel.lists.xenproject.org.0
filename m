Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA09BA169
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829515.1244487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7H3q-0003FW-3P; Sat, 02 Nov 2024 16:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829515.1244487; Sat, 02 Nov 2024 16:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7H3p-0003E1-VU; Sat, 02 Nov 2024 16:33:13 +0000
Received: by outflank-mailman (input) for mailman id 829515;
 Sat, 02 Nov 2024 16:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7H3o-0003Dv-9U
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:33:12 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23447041-9938-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 17:33:07 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730565182351194.75751678778875;
 Sat, 2 Nov 2024 09:33:02 -0700 (PDT)
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
X-Inumbo-ID: 23447041-9938-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg0LjU3IiwiaGVsbyI6InNlbmRlcjMtb2YtbzU3LnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIzNDQ3MDQxLTk5MzgtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY1MTg4LjA3MDMyNSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730565183; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P5GreseDsdwy9ML2Uy1z0Gz3pbMlrjarfEd9/tTnuFL5FjD/k4gdU7W9s/cLrKGiFIM+YWXsYmlr0qdP/Fo+w4Ep6gBz69oxxTz6iI41hlII5l3G6Jtd8NioCUJAOaqunCLS8nGgv5LnzVKKATvkmEuFtTIzQfQpmiRmRednpJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730565183; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=577al6AUsH/YZfxszpyCrhb8GwB1W6lNnp/itBUhGu0=; 
	b=hCsu9My0xmwZWe62OxZmi3HnfndYgtBVhHEHh/nO9v5kmK8IKDC5ChMDpRMKJqm4MtCOwOWyxHiUBE6e+4R5WMl4l8gYXtvauJjKSN7nZCGuRT0WM4ocpAfTMOwnRC7qkGtV9tMVn3j5D+WJ0NDmE1dN8qBNYwI66pmCTS+t6Xg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730565183;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=577al6AUsH/YZfxszpyCrhb8GwB1W6lNnp/itBUhGu0=;
	b=eeQg1hytESvGu7mvqhNEoy3eGL+ZQiktyUr6/S6a0EJyRRkaAkU8FQ1Tfx0QSBAv
	ROf0qXE1cIySDijo6bvcBFnuOC+sb6cTflWTeAS2EqlhtXa2O2r8i30+qHqgKECnXEY
	M0pWZoJjJgKollhoLCp3hLGkZ9pq7xjkUjd8LcKo=
Message-ID: <d68a6509-a79e-4ea7-ad39-da77243a36e7@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:33:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] x86/ucode: Fold microcode_grab_module() into its
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-6-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/cpu/microcode/core.c | 23 +++++++++--------------
>   1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 0b00e70f3b07..4c4003bf9687 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -205,19 +205,6 @@ static void __init microcode_scan_module(struct boot_info *bi)
>       }
>   }
>   
> -static void __init microcode_grab_module(struct boot_info *bi)
> -{
> -    if ( ucode_mod_idx < 0 )
> -        ucode_mod_idx += bi->nr_modules;
> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> -         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
> -        goto scan;
> -    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> -scan:
> -    if ( ucode_scan )
> -        microcode_scan_module(bi);
> -}
> -
>   static struct microcode_ops __ro_after_init ucode_ops;
>   
>   static DEFINE_SPINLOCK(microcode_mutex);
> @@ -831,7 +818,15 @@ static int __init early_microcode_load(struct boot_info *bi)
>       size_t size;
>       struct microcode_patch *patch;
>   
> -    microcode_grab_module(bi);
> +    if ( ucode_mod_idx < 0 )
> +        ucode_mod_idx += bi->nr_modules;
> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> +         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
> +        goto scan;
> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> + scan:
> +    if ( ucode_scan )
> +        microcode_scan_module(bi);
>   
>       if ( !ucode_mod.mod_end && !ucode_blob.size )
>           return 0;

Just a suggestion, but would it be useful to add a comment to explain 
the three conditions of ucode_mod_idx that are being handled before 
scanning is attempted? These being negative value, a valid module index, 
and module index wasn't already claimed in the module map.

Otherwise,

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

