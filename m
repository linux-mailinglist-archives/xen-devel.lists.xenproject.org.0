Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444B2B78FA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:44:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29413.58791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ4g-0006Kl-AH; Wed, 18 Nov 2020 08:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29413.58791; Wed, 18 Nov 2020 08:44:22 +0000
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
	id 1kfJ4g-0006KM-6o; Wed, 18 Nov 2020 08:44:22 +0000
Received: by outflank-mailman (input) for mailman id 29413;
 Wed, 18 Nov 2020 08:44:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJ4e-0006KH-9h
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:44:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94311955-9a79-46a7-8e5d-12acd2e8ae4e;
 Wed, 18 Nov 2020 08:44:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51D47B234;
 Wed, 18 Nov 2020 08:44:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJ4e-0006KH-9h
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:44:20 +0000
X-Inumbo-ID: 94311955-9a79-46a7-8e5d-12acd2e8ae4e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 94311955-9a79-46a7-8e5d-12acd2e8ae4e;
	Wed, 18 Nov 2020 08:44:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605689058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7YsdtOzuRsahnU7pbqNXL1yMgQZIY2Ji5YlxLRYyaY=;
	b=fu5E8dtiHunr2lNlPkaggzJoe80FjH24zRd8jhiDU3c2Zfg+UDhY4+5JHSQ4hCC3tQHWre
	w8LE9o6ZAlWQaUrzCkNLP5U1vM3LZqf2mtYxO5uVKR4qwiK/tX0NClWvL4/2Sd5tadb2e4
	hgdMhBD/JHeStj00Fpgv+mExsp6BiJ4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 51D47B234;
	Wed, 18 Nov 2020 08:44:18 +0000 (UTC)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com
Cc: Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20201118005051.26115-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com>
Date: Wed, 18 Nov 2020 09:44:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118005051.26115-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 01:50, Stefano Stabellini wrote:
> 1) It is not obvious that "Configure standard Xen features (expert
> users)" is actually the famous EXPERT we keep talking about on xen-devel

Which can be addressed by simply changing the one prompt line.

> 2) It is not obvious when we need to enable EXPERT to get a specific
> feature
> 
> In particular if you want to enable ACPI support so that you can boot
> Xen on an ACPI platform, you have to enable EXPERT first. But searching
> through the kconfig menu it is really not clear (type '/' and "ACPI"):
> nothing in the description tells you that you need to enable EXPERT to
> get the option.

And what causes this to be different once you switch to UNSUPPORTED?

> So this patch makes things easier by doing two things:
> 
> - introduce a new kconfig option UNSUPPORTED which is clearly to enable
>   UNSUPPORTED features as defined by SUPPORT.md
> 
> - change EXPERT options to UNSUPPORTED where it makes sense: keep
>   depending on EXPERT for features made for experts
> 
> - tag unsupported features by adding (UNSUPPORTED) to the one-line
>   description

I am, btw, not fully convinced of the need for this redundancy. Wouldn't
it be enough to have just EXPERT as a setting, but varying (<reason>)
tokens in the prompt text?

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -34,8 +34,17 @@ config DEFCONFIG_LIST
>  	option defconfig_list
>  	default ARCH_DEFCONFIG
>  
> +config UNSUPPORTED
> +	bool "Configure UNSUPPORTED features"
> +	help
> +	  This option allows unsupported Xen options to be enabled, which

I'd recommend against "enabled" - a control may also be there to allow
disabling something.

> +	  includes non-security-supported, experimental, and tech preview
> +	  features as defined by SUPPORT.md. Xen binaries built with this
> +	  option enabled are not security supported.

Overall I'm a little afraid of possible inverse implications: Anything
_not_ dependent upon this option (and in particular anything not
dependent upon any Kconfig control) may be considered supported then.

Also the last sentence is already present for EXPERT, 

> +	default n

I realize you likely merely copied what EXPERT has, but this "default n"
is pretty pointless and hence would better be omitted imo.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -102,8 +102,8 @@ config HVM
>  	  If unsure, say Y.
>  
>  config XEN_SHSTK
> -	bool "Supervisor Shadow Stacks"
> -	depends on HAS_AS_CET_SS && EXPERT
> +	bool "Supervisor Shadow Stacks (UNSUPPORTED)"
> +	depends on HAS_AS_CET_SS && UNSUPPORTED
>  	default y

Andrew, I think I did ask on v1 already: Do we need to continue to
consider this unsupported? While perhaps not a change to make right in
this patch, it should perhaps be a pre-patch then to avoid the need to
touch it here.

> @@ -165,7 +165,7 @@ config HVM_FEP

Seeing just the patch context here, I think HVM_FEP may also want
converting.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -151,7 +151,7 @@ config KEXEC
>  	  If unsure, say Y.
>  
>  config EFI_SET_VIRTUAL_ADDRESS_MAP
> -    bool "EFI: call SetVirtualAddressMap()" if EXPERT
> +    bool "EFI: call SetVirtualAddressMap() (UNSUPPORTED)" if UNSUPPORTED

I have to admit I'm pretty unsure about what to do with this one.

> @@ -272,7 +272,7 @@ config LATE_HWDOM
>  	  If unsure, say N.
>  
>  config ARGO
> -	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
> +	bool "Argo: hypervisor-mediated interdomain communication (UNSUPPORTED)" if UNSUPPORTED

Perhaps better (EXPERIMENTAL)?

> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -15,7 +15,7 @@ config SCHED_CREDIT2
>  	  optimized for lower latency and higher VM density.
>  
>  config SCHED_RTDS
> -	bool "RTDS scheduler support (EXPERIMENTAL)"
> +	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default y
>  	---help---
>  	  The RTDS scheduler is a soft and firm real-time scheduler for
> @@ -23,14 +23,14 @@ config SCHED_RTDS
>  	  in the cloud, and general low-latency workloads.
>  
>  config SCHED_ARINC653
> -	bool "ARINC653 scheduler support (EXPERIMENTAL)"
> +	bool "ARINC653 scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default DEBUG
>  	---help---
>  	  The ARINC653 scheduler is a hard real-time scheduler for single
>  	  cores, targeted for avionics, drones, and medical devices.
>  
>  config SCHED_NULL
> -	bool "Null scheduler support (EXPERIMENTAL)"
> +	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
>  	default y
>  	---help---
>  	  The null scheduler is a static, zero overhead scheduler,

I'd like to see (EXPERIMENTAL) stay everywhere here.

Jan

