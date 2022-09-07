Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597475B1095
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 01:39:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402356.644272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4dW-0000Wp-AK; Wed, 07 Sep 2022 23:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402356.644272; Wed, 07 Sep 2022 23:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW4dW-0000Ts-7X; Wed, 07 Sep 2022 23:39:14 +0000
Received: by outflank-mailman (input) for mailman id 402356;
 Wed, 07 Sep 2022 23:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Or=ZK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oW4dU-0000Tm-W9
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 23:39:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45e180d8-2f06-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 01:39:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73690B81F28;
 Wed,  7 Sep 2022 23:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C341FC433C1;
 Wed,  7 Sep 2022 23:39:08 +0000 (UTC)
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
X-Inumbo-ID: 45e180d8-2f06-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662593949;
	bh=y6LPQxLnS+ZXbuHF2hCPfhKS2qafpqxlaGKdYoLS7CM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OvGF93/0PMcpenC9/eFJb/eH4MGnRysTW4yindHgibdH17BpTmjt2Rzs92cayTuIz
	 JzxShrQJhHaWmbAKW9uYzbJEKpTzowV8OKgvrqHhUMGjHnAyVKH6Q9MAic8A4yzhfe
	 Vkj3NOPjyh0A/6rTTS3ASZ7YXYj/z0A/YOlsROr3Hm9Nu+6CHow03GYw2Sm9e9ov9d
	 JyT/x4/109rOvH9QesFsQtYWT58X3C8C+BTxSxeNGA92W8gOCrAvZnxW6861f8GxAI
	 dzH5h+cAtpce05GEj+qIC5nL0lAKICKCDF5bC9ojMOfqvy+4IyahO1SVGuWcabpz6g
	 8HTTmIxBlNISg==
Date: Wed, 7 Sep 2022 16:39:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder v2 1/2] scripts/common: Introduce phandle_next
 and get_next_phandle()
In-Reply-To: <20220907110852.5673-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209071638430.157835@ubuntu-linux-20-04-desktop>
References: <20220907110852.5673-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Sep 2022, Michal Orzel wrote:
> When dealing with device trees, we need to have a solution to add
> custom phandles to the nodes we create/modify. Add a global variable
> phandle_next to act as a countdown counter starting with the highest
> valid phandle value 0xfffffffe. Add a new function get_next_phandle
> to get a value of the next available phandle and set it to a variable
> whose name is passed as a first argument. The global counter will be
> decremented with each call to this function.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> To make the interface to phandle_next as simple as possible, we just
> need a single function that will get us the next phandle and update the
> global counter. That is why we cannot use the following:
> - "phandle=$(get_next_phandle)" as a subshell cannot modify the environment
>   of its parent shell,
> - making use of return statement as it only works with values up to 255
> 
> The current solution with passing a variable name to a function that
> will modify its value using eval is the simplest one and serves our purpose.

I love the trick



> Changes in v2:
> - new patch
> ---
>  scripts/common | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/common b/scripts/common
> index 68938beb8557..25c041270c29 100644
> --- a/scripts/common
> +++ b/scripts/common
> @@ -13,6 +13,9 @@
>  tmp_files=()
>  tmp_dirs=()
>  
> +# Highest valid phandle. Will be decremented with each call to get_next_phandle
> +phandle_next="0xfffffffe"
> +
>  function remove_tmp_files()
>  {
>      for i in "${tmp_files[@]}"
> @@ -26,6 +29,14 @@ function remove_tmp_files()
>      done
>  }
>  
> +# Get next phandle and set it as a value (in hex) of a variable whose name is
> +# passed as a first argument. Decrement global counter phandle_next.
> +function get_next_phandle()
> +{
> +    eval "$1=$(printf "0x%x" $phandle_next)"
> +    phandle_next=$(( $phandle_next - 1 ))
> +}
> +
>  function sanity_check_partial_dts()
>  {
>      local domU_passthrough_path="$1"
> -- 
> 2.25.1
> 

