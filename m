Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BCADBE76
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 03:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017617.1394601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRKsi-0004ou-Ja; Tue, 17 Jun 2025 01:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017617.1394601; Tue, 17 Jun 2025 01:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRKsi-0004ln-GW; Tue, 17 Jun 2025 01:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1017617;
 Tue, 17 Jun 2025 01:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6Tl=ZA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uRKsg-0004lh-BN
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 01:12:54 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30376a1b-4b18-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 03:12:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 175012276011683.16054328213681;
 Mon, 16 Jun 2025 18:12:40 -0700 (PDT)
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
X-Inumbo-ID: 30376a1b-4b18-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1750122762; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PRnnLn8asxGjdrc+NW8IDYvPBW2MZQ3bPKZe1SCXlFsZ0hdqcX9H6bKP34GTWv2UpzENQQ0MbJux2n+A2yYrAU21HhWCHniI08/GlSCyts0CMCffxv8TJM554N7/tzykhK0kK9QpCzVvXRs0dBVtJUhGeqRFEwRKOptI1428PAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750122762; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ytmJcUszrbSRxoCYO2hzwfhrhHHlfDtLLipssx5+Fr8=; 
	b=e3ZgBt7cNQhfrSweWpqTUuvQymmInGdAmVJ/kgmrp/Z/idpLE2LhQB3/shypJzL9lNj1IEn11/Kxwfvr2PE4aZ+LQ4UZ3ZbnHl217fH1bYHnq6vVUiumBDduuimb9PihSoRaEWaTpXWJDNIvFXRwX2W2NjaUTRQqB7xS2XYiF6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750122762;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ytmJcUszrbSRxoCYO2hzwfhrhHHlfDtLLipssx5+Fr8=;
	b=nGkQElnn8088OouzTKElTijp+Hl6zyPn5MQkMGaHzFhij4hTFsrjTLA3wez22pqC
	0Sp5rReHh+OMYo2rnEjuFGsihCWjY+M66f5OwZdyal0INpbQPdPoNJXwjLttGjwbLxb
	/GLz5yIx4LvDwhciytu/gnKJ2wfsLoYqRQTvdrgs=
Message-ID: <5b4e69b1-b8da-46db-97a1-1bd90f292613@apertussolutions.com>
Date: Mon, 16 Jun 2025 21:12:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] xen: Rename bootmodule{,s} to boot_module{,s}
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-5-agarciav@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20250613151612.754222-5-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 6/13/25 11:13, Alejandro Vallejo wrote:
> ... in alignment with the new coding style on word splitting for type
> names.
> 
> This aligns its name with the largely duplicate boot_module struct
> in x86. While there's no equivalent to "struct bootmodules" in x86,
> changing one and not the other is just confusing. Same with various
> comments and function names.
> 
> Rather than making a long subfield name even longer, remove the
> _bootmodule suffix in the kernel, initrd and dtb subfields.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>   xen/arch/arm/domain_build.c             |  4 +-
>   xen/arch/arm/efi/efi-boot.h             |  6 +--
>   xen/arch/arm/kernel.c                   |  4 +-
>   xen/arch/arm/llc-coloring.c             |  8 ++--
>   xen/arch/arm/mmu/setup.c                | 10 ++---
>   xen/arch/arm/setup.c                    | 10 ++---
>   xen/common/device-tree/bootfdt.c        |  4 +-
>   xen/common/device-tree/bootinfo.c       | 52 ++++++++++++-------------
>   xen/common/device-tree/dom0less-build.c | 25 ++++++------
>   xen/common/device-tree/domain-build.c   |  2 +-
>   xen/common/device-tree/kernel.c         | 22 +++++------
>   xen/include/xen/bootfdt.h               | 26 ++++++-------
>   xen/include/xen/fdt-kernel.h            |  7 ++--
>   xen/xsm/xsm_policy.c                    |  2 +-
>   14 files changed, 90 insertions(+), 92 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
> index 7f70d860bd..1f88b4fc5a 100644
> --- a/xen/xsm/xsm_policy.c
> +++ b/xen/xsm/xsm_policy.c
> @@ -68,7 +68,7 @@ int __init xsm_multiboot_policy_init(
>   #ifdef CONFIG_HAS_DEVICE_TREE
>   int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>   {
> -    struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_XSM);
> +    struct boot_module *mod = boot_module_find_by_kind(BOOTMOD_XSM);
>       paddr_t paddr, len;
>   
>       if ( !mod || !mod->size )

Acked-By: Daniel P. Smith <dpsmith@apertussolutions.com>

