Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4876504B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570982.893692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOxdi-0004s8-1A; Thu, 27 Jul 2023 09:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570982.893692; Thu, 27 Jul 2023 09:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOxdh-0004pB-Tm; Thu, 27 Jul 2023 09:50:33 +0000
Received: by outflank-mailman (input) for mailman id 570982;
 Thu, 27 Jul 2023 09:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOxdg-0004p5-BI
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:50:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f6ef42-2c63-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 11:50:28 +0200 (CEST)
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
X-Inumbo-ID: 03f6ef42-2c63-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690451429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tu42iGY8C5IV0AXXoKFmGk7Z3IhlsoOFTrmklBED3VU=;
  b=Ekey2SyxHwgMqYEEKIlR+ahqg2On3hK+L1zKzAL5VxH700HSwnOLPLlB
   SjIDwAZE5YQy4IFMIANvSxyl9BLtFFeB0cKjAcJFlR7n3disZIS4HTeGj
   crizXsDEMdAkJcPetBwN5Ju2El9q+o6AufQV6MUNRjYwq77qzY/Ds1wbA
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120249465
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tokWpai6L3XT/KQtiwxfqN16X161hhAKZh0ujC45NGQN5FlHY01je
 htvDG2APPeKNjGmKNsnat7koBxQvJWHytZjHFM+qSAwEiwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxFw4dNwLbv97pza65FOB83Z8eMczSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 DqcozWlXExy2Nq3xiSE+1KcnLD2ryLAH4BMPYSztaVFjwjGroAUIEJPDgbqyRWjsWa5X99cM
 FAF4SoGoq079UjtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnMgySD8x3
 1mFheT1FCdvu72YT3Ga3rqMpDb0Mi8QRUcdYQcUQA1D5MPsyKkxgQjIVc1LC7Oug5v+HjSY6
 y6LtiUlh/MQkMsCzY2//FbOmTXqoYLGJiY8/gjNV3ipxh94boWiIYev7DDmAe1oddjDCAPb5
 T5dxpbYtbpVZX2QqMCTaMwyIqHw9a69DGLRnVwxFol6rAmw/kf2KOi8/wpCyFdV3tcsIGG4O
 BSC4lMJuPe/L1PxM/YpPtvZ59ACiPG5SI+7Dq28gs9mOMAZSeORwM15iad8NUjJmVNkr6wwM
 IzznS2EXSdDUvQPINZbqo4gPV4XKsMWnzm7qWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUQHC7ygOHaGqtZMRbzvEZTdLcqowyCwXrfdSjeK5Ul7U6OBqV/fU9INc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u2NauTWUkTZHR2VX7xgihLXGpaxPtHH3fBVeV9pbMLID8dZ
 6VtRvhs9dwWFW+cpmVCNcKmxGGgHTzy7T+z0+OeSGBXV/Zdq8bhobcIoiOHGPEyMxeK
IronPort-HdrOrdr: A9a23:9DRafq58yULtO2tNiQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: =?us-ascii?q?9a23=3Asex2vWvdwKYF/yCkqM3Knfcn6IsMTUPNlWWIG3P?=
 =?us-ascii?q?nBHprFrSFEgSt5aZdxp8=3D?=
X-Talos-MUID: 9a23:ZQbKFgb74YBdWuBTuCHtjRFSLphR0aWVT0JTuKwN+JKrOnkl
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="120249465"
Date: Thu, 27 Jul 2023 10:50:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Message-ID: <670c22f9-135d-4022-8272-78af3e28c011@perard>
References: <20230726141459.985463-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726141459.985463-1-olekstysh@gmail.com>

On Wed, Jul 26, 2023 at 05:14:59PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Without it being present it won't be possible to use some
> libxl__device_type's callbacks for virtio devices as the common code
> can only invoke these callbacks (by dereferencing a pointer) for valid
> libxl__device_type's elements when iterating over device_type_tbl[].

Did you notice an issue with it been missing from device_type_tbl[] ?
Because to me it looks like all the functions that are using
device_type_tbl will just skip over virtio devtype.

domcreate_attach_devices:
    skip virtio because ".skip_attach = 1"

libxl__need_xenpv_qemu:
    skip virtio because "dm_needed" is NULL

retrieve_domain_configuration_end:
    skip because "compare" is "libxl_device_virtio_compare" which is NULL

libxl__update_domain_configuration:
    skip because "update_config" is NULL.

So, I think the patch is fine, adding virtio to the device_type_tbl
array is good for completeness, but the patch description may be
misleading.

Did I miss something?

Thanks,

-- 
Anthony PERARD

