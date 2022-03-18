Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B384DDCAD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 16:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292095.496030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEQG-0000ZK-VT; Fri, 18 Mar 2022 15:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292095.496030; Fri, 18 Mar 2022 15:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVEQG-0000XT-SR; Fri, 18 Mar 2022 15:21:48 +0000
Received: by outflank-mailman (input) for mailman id 292095;
 Fri, 18 Mar 2022 15:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gqp6=T5=citrix.com=prvs=069a58476=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nVEQF-0000XN-LB
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 15:21:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e93b109-a6cf-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 16:21:46 +0100 (CET)
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
X-Inumbo-ID: 1e93b109-a6cf-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647616906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bD51oc3fFHUmBMRLA7q9xjq+GlAdyO24wqP8e+Xkck=;
  b=Up1J4+p92kvHLzHdRYcsFWpHXnFPB8QUYtX+dOln7ZsZe9S7qupLV8vu
   XM0h3soG+l/YuoSyQIGDPcqiuOnB7hfL+ghQXsfxFFQ+C0dCtx4RzIaw3
   etXqP7A9J0Z7LJqKz2i3bT01SbzVHXgY+d7m3bUqwMTDOGz5cY5RHejzQ
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66611436
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3tr3CKMpj3DW0FjvrR1zl8FynXyQoLVcMsEvi/4bfWQNrUpxhmRTz
 WIcXjyFPv6KZmv3KNpxbY+2p0gD7Z/UzoVmGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi294w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 I9p7p+QdloTb6CPpPksV1pJEDNhBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQ6iHP
 pZCN1KDajzlO0VdYQc9OakbwvX3mGX9QyYf80mK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u1270GA0APdqTjz+M6Guxh/TnlDn+HokVEdWQ7eJnjlSVwSoIFBQcWF+/oP+4ol6/X9NZO
 wof/S9GhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHu7SPRXWQ3rydtz+1NG4eKmpqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMWGq5
 2uJjBdjveQezvIW5qH47FPVnAv58/AlUTUJzgnQW2uk6CZwa4ike5Gk5DDn0BpQEGqKZgLf5
 SZZwqBy+MhLVMjQz3LVHI3hCZnzv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/3lP3NcebgKrrUqzGKJQM8/y/Dpg4ifIUPvBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbtCjOFyn3tmmDuKLXwe8/hB+eDCDJJyYe1YWGZik8hjtP/UyOkr2
 4s32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQMHtNv1jFOQTl7Y9eImOtJU9U8w8x9y7eZl
 lngCxQw4Aeu2hX6xfCiNykLhEXHBs0k8xrW/EUEYD6V5pTUSd32vflFKMdvI+VPGS4K5accc
 sTpsv6oWpxnIgkrMRxEM8KVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:RVDf1K5srncOmfgo7QPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.90,192,1643691600"; 
   d="scan'208";a="66611436"
Date: Fri, 18 Mar 2022 15:20:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <bertrand.marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 1/2] gitlab-ci: add qemu-system-arm to the existing
 tests-artifacts container
Message-ID: <YjSjW/4dnQXqW65V@perard.uk.xensource.com>
References: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop>
 <20220317014653.2427386-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220317014653.2427386-1-sstabellini@kernel.org>

On Wed, Mar 16, 2022 at 06:46:52PM -0700, Stefano Stabellini wrote:
> +qemu-system-aarch64-6.0.0-arm32-export:
> +  stage: build
> +  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
> +  script:
> +    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
> +  artifacts:
> +    paths:
> +      - binaries/qemu-system-arm
> +  tags:
> +    - arm64
>  

I wonder whether there's a better way to make available these kind of
test artifacts than using containers. But I don't have a good answer for
now.

Anyway, the patch looks good enough:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

