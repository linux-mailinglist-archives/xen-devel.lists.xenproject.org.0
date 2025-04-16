Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C6A90E68
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 00:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956701.1350033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ArI-0006lQ-9E; Wed, 16 Apr 2025 22:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956701.1350033; Wed, 16 Apr 2025 22:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ArI-0006jV-6U; Wed, 16 Apr 2025 22:03:52 +0000
Received: by outflank-mailman (input) for mailman id 956701;
 Wed, 16 Apr 2025 22:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5ArH-0006jP-JG
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 22:03:51 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac01ac56-1b0e-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 00:03:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2E156156A;
 Wed, 16 Apr 2025 22:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2DAC4CEE2;
 Wed, 16 Apr 2025 22:03:45 +0000 (UTC)
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
X-Inumbo-ID: ac01ac56-1b0e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744841026;
	bh=cC0ablkiefFiUWFXjgW4PLnZWHchzGaQ56t4I01BkAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BYReslRUVLV2nuo337I0G0U9SDcJ3GgGFWkCbh6/5M2PMt2qigpvyRhGCaf/osbYK
	 kw6xMxy0JAqTFSKRM2UJdFodqb8WUhR7JPNLMOWkpgtSe8EDkemaIEaeZs63hX0wWT
	 djgOg12D+r0yaTiUEfWZ13uxQ53vvq6mR5PyhELL7yQ1uvEzB2W10wQhiZmza8cWUX
	 vvwthCk6bmJg1BmjFLDQfn3CvuuS6uuQjUILuM64oFFYlKhgVEiKAM8PAzxqTEIxHx
	 tTe8spdcwJVIOBObR7b3J7CnY37AyRwKaTVSD4jnnzbaVILiQ8bIPn7OLRw8rSNwM4
	 LYfQkqAMX99wQ==
Date: Wed, 16 Apr 2025 15:03:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Alejandro Vallejo <agarciav@amd.com>
Subject: Re: [ImageBuilder v2] uboot-script-gen: add xen xsm policy loading
 support
In-Reply-To: <20250415070128.1938253-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504161503150.8008@ubuntu-linux-20-04-desktop>
References: <20250415070128.1938253-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Apr 2025, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> This patch adds Xen XSM policy loading support.
> 
> The configuration file XEN_POLICY specifies Xen hypervisor
> XSM policy binary to load.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v2:
> - fix conditional statements for XEN_POLICY
> - add XSM policy binary check
> 
>  README.md                |  2 ++
>  scripts/uboot-script-gen | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 137abef153ce..9106d2a07302 100644
> --- a/README.md
> +++ b/README.md
> @@ -91,6 +91,8 @@ Where:
>  - XEN specifies the Xen hypervisor binary to load. Note that it has to
>    be a regular Xen binary, not a u-boot binary.
>  
> +- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
> +
>  - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
>    and is in the format startcolor-endcolor
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index c4d26caf5e0e..208eafdecfeb 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -315,6 +315,15 @@ function xen_device_tree_editing()
>      dt_set "/chosen" "#size-cells" "hex" "0x2"
>      dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>  
> +    if test -n "$XEN_POLICY" && test "$xen_policy_addr" != "-"
> +    then
> +        local node_name="xen-policy@${xen_policy_addr#0x}"
> +
> +        dt_mknode "/chosen" "$node_name"
> +        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
> +        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
> +    fi
> +
>      if test "$DOM0_KERNEL"
>      then
>          local node_name="dom0@${dom0_kernel_addr#0x}"
> @@ -900,6 +909,15 @@ xen_file_loading()
>      kernel_addr=$memaddr
>      kernel_path=$XEN
>      load_file "$XEN" "host_kernel"
> +
> +    xen_policy_addr="-"
> +    if test -n "$XEN_POLICY"
> +    then
> +        check_file_type "${XEN_POLICY}" "SE Linux policy"
> +        xen_policy_addr=$memaddr
> +        load_file "$XEN_POLICY" "xen_policy"
> +        xen_policy_size=$filesize
> +    fi
>  }
>  
>  linux_file_loading()
> @@ -939,6 +957,22 @@ bitstream_load_and_config()
>  
>  create_its_file_xen()
>  {
> +    if test -n "$XEN_POLICY" && test "$xen_policy_addr" != "-"
> +    then
> +        cat >> "$its_file" <<- EOF
> +        xen_policy {
> +            description = "Xen XSM policy binary";
> +            data = /incbin/("$XEN_POLICY");
> +            type = "kernel";

This should be "firmware". Aside from that, the patch is fine.
If you are OK with it, I can fix it on commit.



> +            arch = "arm64";
> +            os = "linux";
> +            compression = "none";
> +            load = <$xen_policy_addr>;
> +            $fit_algo
> +        };
> +	EOF
> +    fi
> +
>      if test "$DOM0_KERNEL"
>      then
>          if test "$ramdisk_addr" != "-"
> -- 
> 2.34.1
> 

