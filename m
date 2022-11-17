Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57A62CF88
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 01:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444439.699656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSj8-0006eI-7L; Thu, 17 Nov 2022 00:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444439.699656; Thu, 17 Nov 2022 00:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovSj8-0006bc-40; Thu, 17 Nov 2022 00:25:58 +0000
Received: by outflank-mailman (input) for mailman id 444439;
 Thu, 17 Nov 2022 00:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ovSj6-0006bG-Af
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 00:25:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d638c7-660e-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 01:25:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8D2CB81F6C;
 Thu, 17 Nov 2022 00:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4351C433C1;
 Thu, 17 Nov 2022 00:25:51 +0000 (UTC)
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
X-Inumbo-ID: 65d638c7-660e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668644752;
	bh=gSc4ImvW0k6TUo5yDYBWMl7ZWJJRvNGwdcKiYg787OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NHboADJ/EvbaxIu1BEPkpKglOrTW0/+wNl0c0L0lkcxa2qAZbtTM2DRhQASOuvjP6
	 NX7MqTT7bIzVDMghk5LE0lfBpzkOfH6RMehWbLyV/AFhJz3ZLKE/mRNnet7yg1BhoG
	 TtIbYiTz+U7eIkrnA4XIguD6/pMSROruQBXxMfYk1Vyf+vKDtHuv6SLdc0ttF2Ijnh
	 kLeNKrneX2pwuEn2o11yg0BORPuZh7KdiZX9ZxviFpthWoD7sN3WtFppf/aPSxOZaI
	 Dl91lbk0Xpq9S8LL6bU+efSQaZ9/whQiHTVjfJfMpytAJvlOv/6n7ow8Npi6D5BhcH
	 BtgmpsN/JqWRg==
Date: Wed, 16 Nov 2022 16:25:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Do not set #xen,static-mem-{address/size}-cells
In-Reply-To: <20221116085417.3159-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211161625310.4020@ubuntu-linux-20-04-desktop>
References: <20221116085417.3159-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Nov 2022, Michal Orzel wrote:
> Xen commit 942ac5fc15ec ("xen/arm, device-tree: Make static-mem
> use #{address,size}-cells") dropped these custom properties in favor of
> reusing regular #{address/size}-cells from the chosen node for the
> xen,static-mem property. Reflect this change in ImageBuilder.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> The master branch of ImageBuilder should reflect the current status of Xen.
> Apart from that, we might want to come up with some versioning system in
> ImageBuilder, because commits like this one are breaking the backwards
> compatibility.

Agreed


> ---
>  scripts/uboot-script-gen | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 0ef89b680348..7e5cc080407e 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -181,9 +181,6 @@ function add_device_tree_static_mem()
>      local cells=()
>      local val
>  
> -    dt_set "$path" "#xen,static-mem-address-cells" "hex" "0x2"
> -    dt_set "$path" "#xen,static-mem-size-cells" "hex" "0x2"
> -
>      for val in ${regions[@]}
>      do
>          cells+=("$(printf "0x%x 0x%x" $(($val >> 32)) $(($val & ((1 << 32) - 1))))")
> -- 
> 2.25.1
> 

