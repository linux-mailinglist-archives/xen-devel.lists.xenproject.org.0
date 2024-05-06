Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071528BCA9B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717379.1119513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uc3-0002CG-HB; Mon, 06 May 2024 09:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717379.1119513; Mon, 06 May 2024 09:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uc3-0002A9-ER; Mon, 06 May 2024 09:26:23 +0000
Received: by outflank-mailman (input) for mailman id 717379;
 Mon, 06 May 2024 09:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3uc1-0002A3-O2
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:26:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2af1702-0b8a-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:26:20 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so18102685e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:26:20 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fc20-20020a05600c525400b00418accde252sm15317484wmb.30.2024.05.06.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 02:26:19 -0700 (PDT)
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
X-Inumbo-ID: b2af1702-0b8a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714987580; x=1715592380; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYgY7/acmMjSfvzNvh+PS5/dhdYt9UhirRx9JlwSFo=;
        b=Smh9vHPJWZVF51D0zHmOI8iXDNjYg9/cIpwab+VyYDLpgq/1EUlnKrLhSJP1ZVxNFG
         /vx2ig4PQzaz6AZ29LXVQp0xnpPMK9czOf8i+2oyeU1e04gfqqBYSjP1cee5sdrGXDB0
         FaOVcq7MequB6i/QqsPUF+fHU7K1h+WO2ZXoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987580; x=1715592380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypYgY7/acmMjSfvzNvh+PS5/dhdYt9UhirRx9JlwSFo=;
        b=EWcZ9Up+jOAUjJJGhG+1RXh+T9yTiOdUVlAd8GebL/3hUhRyma5zS8jOkGnzY5z2ul
         y3OzvaL5byO33NPFor8sPp+NaihFQvZXhfVI1KvabJg4nKZEsTXi4ZIheJdOhTQZfcT8
         OEStdG93ricv52PIUkpa6g0XVF4TpeM51UqW14UpMDVXY8xHsAQMU15EuzW+oBqnUrja
         D6PIPNi+pIQw9fO2pnvbjOW9jr3eP3G7M0thP/gPhKPAdXXulSWJodUyqEHyfNNMn5+B
         GhOfbCdjxTV60qhxUREbr7bGItOaL7bdmDkC88zEWTaznWV0ggk/sHshlmL074R2smMw
         M9cw==
X-Gm-Message-State: AOJu0YwYTKGcGCcSZF5jgP1f5FxOa94iOAlEYQ0S9Jjn7c5BlDBciQ+O
	wO/XkcKBXJ+5Kf1R1DGIjXBm03eXJRtdMCNZgNd705z6sy24VKLA1tC67YQusGVlqjR14Q39TJW
	J
X-Google-Smtp-Source: AGHT+IGCK+ZiAgLW+S8Af5odW7em2DXVEZNuFT4mNgnIgTJQr2/fBL2FUQZcDQkuF4BJScKcKmEZVw==
X-Received: by 2002:a05:600c:3c9f:b0:418:f6b7:429a with SMTP id bg31-20020a05600c3c9f00b00418f6b7429amr8582990wmb.27.1714987579844;
        Mon, 06 May 2024 02:26:19 -0700 (PDT)
Date: Mon, 6 May 2024 11:26:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
	community.manager@xenproject.org, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Xen 4.19 release status tracking list [ May ]
Message-ID: <ZjiiOtvJq1KjXo5F@macbook>
References: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>

On Fri, May 03, 2024 at 06:54:40PM +0200, Oleksii wrote:
> Hello everyone,
> 
> I would like to share with you a list for status tracking based on Xen
> ML and community members comments:
> 
> *** Arm ***:
>   * Arm cache coloring [
> https://lore.kernel.org/xen-devel/20240502165533.319988-1-carlo.nonato@minervasys.tech/
> ]:
>     - new patch series version [v8] was sent
> 
>   * PCI devices passthrough on Arm, part 3 [
> https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebrand@amd.com/
> ]
>  
>   * DOMCTL-based guest magic region allocation for 11
> domUs [
> https://lore.kernel.org/xen-devel/20240409045357.236802-1-xin.wang2@amd.com/
> ]
>      - new patch series verstion [v4] was sent
>  
>   * [XEN v6 0/3] xen/arm: Add emulation of Debug Data Transfer
> Registers [
> https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/
> ]
> 
> *** PPC ***:
>   * [PATCH v4 0/6] Early Boot Allocation on Power [
> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/
> ]:
>     new patch series version [v4] was sent
> 
> *** RISC-V ***:
>   * [PATCH v8 00/17] Enable build of full Xen for RISC-V
> https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@gmail.com/
> ]:
>     - several patches were merged
>     - new patch series version [v8] were sent
> 
> 
> *** x86 ***:
>   * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
> https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
> ]:
>     - almost patch series have been merged already except the patch:
>         [PATCH 4/4] iommu/x86: make unity range checking more strict
> 
>   * [PATCH 0/8] x86: support AVX10.1 [
> https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com/
> ]:
>     - two patches of patch series are waitng to merged/reviewed:
>       [PATCH 1/4] amd-vi: fix IVMD memory type checks
>       [PATCH 4/4] iommu/x86: make unity range checking more strict 
>   
>   * APX support?
> 
>   * [PATCH v4 0/8] x86emul: misc additions [
> https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com/
> ]
>    
>   * [PATCH v2 00/12] VT-d: SATC handling; ATS: tidying[
> https://lore.kernel.org/xen-devel/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/
> ]:
>     new version was sent [ v2 ]
> 
>   * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
> https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
> ]
> 
>   * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
> fallout [
> https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com/
> ]
>     - 6/12 are merged.
>  
>   * [PATCH v6 0/4] x86/pvh: Support relocating dom0 kernel [
> https://patchew.org/Xen/20240327215102.136001-1-jason.andryuk@amd.com/
> ]

Isn't this done? (at least the Xen side):

dfc9fab00378 x86/PVH: Support relocatable dom0 kernels

I have some minor stuff that was posted one day after feature
freeze:

xen/x86: support foreign mappings for HVM
https://lore.kernel.org/xen-devel/20240430165845.81696-1-roger.pau@citrix.com/

and

tools/xen-cpuid: switch to use cpu-policy defined names
https://lore.kernel.org/xen-devel/20240502114922.94288-1-roger.pau@citrix.com/

Which I think would be nice to have for the release.

The first one because it enables work on PVH-based QEMU stubdomains,
the second it's a nice cleanup that makes it easier to introduce new
CPUID features.

Some series that I posted before the freeze:

livepatch: minor bug fixes and improvements
https://lore.kernel.org/xen-devel/20240424081957.34326-1-roger.pau@citrix.com/
Patches 3 and 4 are pending review.

xen: introduce Kconfig function alignment option
https://lore.kernel.org/xen-devel/20240207145547.89689-1-roger.pau@citrix.com/
Patch 2 is missing review.

And then some patches that I don't expect to make progress:

x86/shutdown: change default reboot method preference
https://lore.kernel.org/xen-devel/20230915074347.94712-1-roger.pau@citrix.com/

x86/time: prefer CMOS over EFI_GET_TIME
https://lore.kernel.org/xen-devel/20240315114242.33309-1-roger.pau@citrix.com/

I find it quite funny how everyone complains about all downstreams
carrying similar patches to deal with firmware bugs, yet when I
attempt to formally post them I get zero interest from such
downstreams.  Maybe raising them here will help get some eyes.

Thanks, Roger.

