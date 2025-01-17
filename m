Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911DAA14708
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 01:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873837.1284792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYaHD-00014z-17; Fri, 17 Jan 2025 00:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873837.1284792; Fri, 17 Jan 2025 00:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYaHC-00012j-UJ; Fri, 17 Jan 2025 00:31:54 +0000
Received: by outflank-mailman (input) for mailman id 873837;
 Fri, 17 Jan 2025 00:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYaHB-00012b-Hi
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 00:31:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7091a171-d46a-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 01:31:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 60E9AA41BC6;
 Fri, 17 Jan 2025 00:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E479BC4CED6;
 Fri, 17 Jan 2025 00:31:47 +0000 (UTC)
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
X-Inumbo-ID: 7091a171-d46a-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737073909;
	bh=EtUVYei0Ssjo061yq3sHLWqSi2Ur2ERypmCb1H2SLt8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IHutaP6GhlmGHCamSsvQHgYTs6EQ1ZpMiKbv20G+2ICpZAt2atUHZc3MdLA5IhJvY
	 nHVXVq7IBKDHatirJgmxqOr1ILlNfCEzHJkg6mvVSZraiOIkjwciEZiZeVv5bMxsB1
	 3ZVdtq5ei8qgn5jQQIX8aCT1w/KvU8qAyhdqIOopS7p65QYxzq5J3008LZkSI+cW6C
	 pSEinZk4dIyeyXNMyCKx9bUqEseEaeZgqc7Uyjuow/AIQkww9MRfi7lDHrDoPjGnPE
	 cUpbf07bT4YxuLbG3QgchRfKTH6eCW3h3/N92TmVCxFZ/Fo3Q8vtDANY4eDQRpowgZ
	 4jGEtjem/U6bw==
Date: Thu, 16 Jan 2025 16:31:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    sergiy_kibrik@epam.com
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
In-Reply-To: <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com> <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Mar 2023, Jan Beulich wrote:
> While we want certain things turned off in shim-exclusive mode, doing
> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
> a result. Yet allyesconfig wants to enable as much of the functionality
> as possible.
> 
> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
> C code using it can remain as is. This isn't just for less code churn,
> but also because I think that symbol is more logical to use in many
> (all?) places.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> ---
> The new Kconfig control's name is up for improvement suggestions, but I
> think it's already better than the originally thought of
> FULL_HYPERVISOR.

I think the approach in general is OK, maybe we can improve the naming
further. What about one of the following?

NO_PV_SHIM_EXCLUSIVE
PV_SHIM_NOT_EXCLUSIVE
ADD_PV_SHIM
PV_SHIM_AND_HYPERVISOR

This is because I think the option should be tied to PV_SHIM. Keep in
mind that users are supposed to be able to use "make menuconfig" and
pick good options based on the menu. An option called UNCONSTRAINED or
FULL_HYPERVISOR or any other name that has nothing to do with PV_SHIM is
very confusing to me.


> Secondary Kconfig changes could be omitted; in all of the cases I wasn't
> really sure whether do the adjustments. I think to avoid setting a bad
> precedent we want to avoid "depends on !..." (and hence also the
> functionally equivalent "if !..."), but any default settings or prompt
> controls could also be left as they were (or could be done the other way
> around in subsequent patches).
> 
> The Requested-by: isn't for what exactly is done here, but for the
> underlying principle of avoiding the negative dependencies we've grown.
> 
> Outside of Arm-specific code we have two more negative "depends on":
> COVERAGE requires !LIVEPATCH and SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
> requires !ENFORCE_UNIQUE_SYMBOLS. The latter could apparently be
> switched to a choice (enforce, warn, don't warn), but then I'm not sure
> how well choices play with allyesconfig (I guess the default setting is
> used).
> ---
> v2: New.
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -103,7 +103,7 @@ config PV_LINEAR_PT
>  
>  config HVM
>  	bool "HVM support"
> -	depends on !PV_SHIM_EXCLUSIVE
> +	depends on UNCONSTRAINED
>  	default !PV_SHIM
>  	select COMPAT
>  	select IOREQ_SERVER
> @@ -145,7 +145,7 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
> +	default UNCONSTRAINED
>  	depends on PV || HVM
>  	---help---
>  
> @@ -196,7 +196,7 @@ config HVM_FEP
>  config TBOOT
>  	bool "Xen tboot support (UNSUPPORTED)"
>  	depends on UNSUPPORTED
> -	default !PV_SHIM_EXCLUSIVE
> +	default UNCONSTRAINED
>  	select CRYPTO
>  	---help---
>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
> @@ -276,17 +276,19 @@ config PV_SHIM
>  
>  	  If unsure, say Y.
>  
> -config PV_SHIM_EXCLUSIVE
> -	bool "PV Shim Exclusive"
> -	depends on PV_SHIM
> -	---help---
> -	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
> -	  option is only intended for use when building a dedicated PV Shim
> -	  firmware, and will not function correctly in other scenarios.
> +config UNCONSTRAINED
> +	bool "do NOT build a functionality restricted hypervisor" if PV_SHIM
> +	default y
> +	help
> +	  Do NOT build Xen in a way which unconditionally assumes PV_SHIM mode.
>  
> -	  If unsure, say N.
> +	  If unsure, say Y.

Yes, the option should not be visible and default y unless PV_SHIM is
selected, like you did.

I think this patch is fine overall, I only suggest a renaming of
UNCONSTRAINED to something to ties it to PV_SHIM.


> +config PV_SHIM_EXCLUSIVE
> +	def_bool y
> +	depends on !UNCONSTRAINED
>  
> -if !PV_SHIM_EXCLUSIVE
> +if UNCONSTRAINED
>  
>  config HYPERV_GUEST
>  	bool "Hyper-V Guest"
> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -3,7 +3,7 @@ CONFIG_PV=y
>  CONFIG_XEN_GUEST=y
>  CONFIG_PVH_GUEST=y
>  CONFIG_PV_SHIM=y
> -CONFIG_PV_SHIM_EXCLUSIVE=y
> +# CONFIG_UNCONSTRAINED is not set
>  CONFIG_NR_CPUS=32
>  CONFIG_EXPERT=y
>  # Disable features not used by the PV shim
> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -3,10 +3,10 @@ config VIDEO
>  	bool
>  
>  config VGA
> -	bool "VGA support" if !PV_SHIM_EXCLUSIVE
> +	bool "VGA support" if UNCONSTRAINED
>  	select VIDEO
>  	depends on X86
> -	default y if !PV_SHIM_EXCLUSIVE
> +	default y if UNCONSTRAINED
>  	---help---
>  	  Enable VGA output for the Xen hypervisor.
>  
> 
> 

