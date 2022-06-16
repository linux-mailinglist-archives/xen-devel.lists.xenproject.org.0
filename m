Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842654D6AE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 03:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350370.576699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1dqo-0001cS-2x; Thu, 16 Jun 2022 00:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350370.576699; Thu, 16 Jun 2022 00:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1dqn-0001Zh-Vc; Thu, 16 Jun 2022 00:59:09 +0000
Received: by outflank-mailman (input) for mailman id 350370;
 Thu, 16 Jun 2022 00:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1dql-0001ZY-Nw
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 00:59:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844bc1bb-ed0f-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 02:59:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFE3961B79;
 Thu, 16 Jun 2022 00:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D346BC3411A;
 Thu, 16 Jun 2022 00:59:02 +0000 (UTC)
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
X-Inumbo-ID: 844bc1bb-ed0f-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655341143;
	bh=aMI97DOFwNFKz/ZsDjbOQsoT3kpjQLZ0DQNTZ4x77Kk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BY2uOJsgNknE3iP+NRmDsaf7OX1EDGjjTV6r2VEtyocMnImiEu3NNNvyYMMJ+Z+x9
	 BsuEbVayvq0AWLUbXtB2TZbgt1wd0e9nzRLirG+aYsIK7btY/ZVmgjYYBsxxP3byZj
	 LXKF3l8sXMtog3Ps4UZzdRTFIATiaboVzt6kyyNst+jlvDd3GAHjx0MX7TmuSHoL5C
	 2Fvie22RWiWHeqR6WLxjOxoHD2IzCq6HKJw/WOQMtpXtFxmWuzY758YWkNbPx96xkR
	 Ai0Sv0uXFjyVpbs5a42FE/y0rjvllrZPcU7oMEq2ApNpXQBI6QwrVY8t+1/Drr+cdG
	 rz1vb4aPvgeUw==
Date: Wed, 15 Jun 2022 17:59:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    viryaos-discuss@lists.sourceforge.net
Subject: Re: [ImageBuilder] [PATCH v2] uboot-script-gen: Add
 DOMU_STATIC_MEM
In-Reply-To: <20220615185100.283754-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206151750570.2430546@ubuntu-linux-20-04-desktop>
References: <20220615185100.283754-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jun 2022, Xenia Ragiadakou wrote:
> Add a new config parameter to configure a dom0less VM with static allocation.
> DOMU_STATIC_MEM[number]="baseaddr1 size1 ... baseaddrN sizeN"
> The parameter specifies the host physical address regions to be statically
> allocated to the VM. Each region is defined by its start address and size.
> 
> For instance,
> DOMU_STATIC_MEM[0]="0x30000000 0x10000000 0x50000000 0x20000000"
> indicates that the host memory regions [0x30000000, 0x40000000) and
> [0x50000000, 0x70000000) are statically allocated to the first dom0less VM.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Hi Xenia, thanks for the patch!

It looks fine as is, only two minor code style issues (tabs instead of
spaces for indentation.)

I think this would work. However, when static-mem is specified also the
total memory for the guest needs to match. So for instance:

  #xen,static-mem-address-cells = <0x1>;
  #xen,static-mem-size-cells = <0x1>;
  xen,static-mem = <0x30000000 0x20000000>;

In this case memory has to be:

  memory = <0x0 0x80000>;

memory is in kilobytes, so 0x20000000/1024=0x80000.

In ImageBuilder "memory" is normally set by the DOMU_MEM variable,
although that is in megabytes.

I think it would make sense to automatically calculate "memory" DOMU_MEM
based on the sizes passed via DOMU_STATIC_MEM when DOMU_STATIC_MEM is
specified: summing all the sizes together and dividing by 1024.

That could be done either with something like

    if test "${DOMU_STATIC_MEM[$i]}"
    then
        local memory=[calculate memory]
        dt_set "/chosen/domU$i" "memory" "int" "0 $memory"
        add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"

Or it could be done by changing DOMU_MEM to be in kilobytes and simply
setting DOMU_MEM based on the DOMU_STATIC_MEM values when
DOMU_STATIC_MEM is specified.

Would you be OK to add that to this patch? If not, that's OK. This patch
is also good to have as is.



> ---
> 
> Notes:
>     v2: in add_device_tree_static_mem(), replace i with val because variable i
>         is already in use as an index
> 
>  README.md                |  4 ++++
>  scripts/uboot-script-gen | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 8ce13f0..876e46d 100644
> --- a/README.md
> +++ b/README.md
> @@ -154,6 +154,10 @@ Where:
>    automatically at boot as dom0-less guest. It can still be created
>    later from Dom0.
>  
> +- DOMU_STATIC_MEM[number]="baseaddr1 size1 ... baseaddrN sizeN"
> +  if specified, indicates the host physical address regions
> +  [baseaddr, baseaddr + size) to be reserved to the VM for static allocation.
> +
>  - LINUX is optional but specifies the Linux kernel for when Xen is NOT
>    used.  To enable this set any LINUX\_\* variables and do NOT set the
>    XEN variable.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 0adf523..3a5f720 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -108,6 +108,22 @@ function add_device_tree_passthrough()
>      dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
>  }
>  
> +function add_device_tree_static_mem()
> +{
> +    local path=$1
> +    local regions=$2
> +
> +    dt_set "$path" "#xen,static-mem-address-cells" "hex" "0x2"
> +    dt_set "$path" "#xen,static-mem-size-cells" "hex" "0x2"
> +
> +    for val in ${regions[@]}
> +    do
> +	cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
> +    done
> +
> +    dt_set "$path" "xen,static-mem" "hex" "${cells[*]}"
> +}
> +
>  function xen_device_tree_editing()
>  {
>      dt_set "/chosen" "#address-cells" "hex" "0x2"
> @@ -143,6 +159,10 @@ function xen_device_tree_editing()
>          dt_set "/chosen/domU$i" "#size-cells" "hex" "0x2"
>          dt_set "/chosen/domU$i" "memory" "int" "0 ${DOMU_MEM[$i]}"
>          dt_set "/chosen/domU$i" "cpus" "int" "${DOMU_VCPUS[$i]}"
> +	if test "${DOMU_STATIC_MEM[$i]}"
> +        then
> +	    add_device_tree_static_mem "/chosen/domU$i" "${DOMU_STATIC_MEM[$i]}"
> +        fi
>          dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
>          add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
> -- 
> 2.34.1
> 

