Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8C773993
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579559.907585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJlo-0002VI-NA; Tue, 08 Aug 2023 10:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579559.907585; Tue, 08 Aug 2023 10:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJlo-0002S6-Jv; Tue, 08 Aug 2023 10:16:56 +0000
Received: by outflank-mailman (input) for mailman id 579559;
 Tue, 08 Aug 2023 10:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTJlm-0002Rh-NC
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:16:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af9c27b4-35d4-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:16:50 +0200 (CEST)
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
X-Inumbo-ID: af9c27b4-35d4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691489810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k1s+dkCK9zYbkDJ3cmihj8RjVYKk8Tzuz2jSQgZd5kU=;
  b=bzOBuLsZOWKQjBDSP/vLZ4WbY1xZQnSMJe6Xhs7aVhv8+bLBUygOB6pN
   5PF52vvQrf2PoiS8sNlZhWGDCpPQ81xWe0TeU2UPj+T7s19iwFG4p4jsw
   06gzwPlrIvr/SmYUiNAByUIipDL6MIzxCOcsW+PQMQSTligAMZKPSz6g4
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119265225
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JIoRIqoyAnznWcYmqFoi4S6qEXFeBmI5ZRIvgKrLsJaIsI4StFCzt
 garIBnSafuNZ2r9cownPoWw8x5Vu5TWy4VqGVQ6qiA1EHsapJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzyZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACFWP02M2LPm+uKyT8tKrN8RFfDJDLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrj6nX0tAabRzzxK4o0/2vsXvmB/Ze79DGZ6fxvVro0+Mkzl75Bo+CgLg/KjRZlSFc9BQM
 UsP4QI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vgHTF1uaeZYW6c/LyT6zi1PEAowXQqPHFeC1Ffup+6/d9110iUJjp+LEKrpsyuSGz/n
 GHalng3gpc1p9U57pyZzWmS1lpAuaP1ZgIy4wzWWEes4QV4eJOpauSU1LTL0RpTBN3HFwfc5
 RDoj+DbtblTVs/VyERhVc1XRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcJZBNGjoctOepd7vjGKoC+fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yXC9GUv89nWbmHrd1PVoXKscWnzq7eHwG507/jer2iIC9Ft/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnC/zGLnFnhTdSJTLcmv+6RqmhurflIO9JcJV6WAntvMuuVNw8xoqws/1
 irgBhEBkAKl1CGvxMfjQikLVY4DlK1X9RoTVRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:K4UO2qvSjbKcTpHGPQMx7r1i7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3A1ZpVI2nq70MPWo/h9B+lTNO994/XOWyGnSrffB7?=
 =?us-ascii?q?oMzZgTZ+zY0SiwZpGo/M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AIhMSIA0RS3aO6eTwUtRjTEXvMzUj3vWTUngnsZA?=
 =?us-ascii?q?6meq5ZCFTHAeWjRelXdpy?=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="119265225"
Date: Tue, 8 Aug 2023 11:16:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools: add configure option for disabling pygrub
Message-ID: <7826b9c0-38da-414c-813f-ee3ac4ee18ce@perard>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230804060000.27710-2-jgross@suse.com>

On Fri, Aug 04, 2023 at 07:59:59AM +0200, Juergen Gross wrote:
> Add a "--disable-pygrub" option for being able to disable the build
> and installation of pygrub.
> 
> There are two main reasons to do so:
> 
> - A main reason to use pygrub is to allow a PV guest to choose its
>   bitness (32- or 64-bit). Pygrub allows that by looking into the boot
>   image and to start the guest in the correct mode depending on the
>   kernel selected. With 32-bit PV guests being deprecated and the
>   possibility to even build a hypervisor without 32-bit PV support,
>   this use case is gone for at least some configurations.
> 
> - Pygrub is running in dom0 with root privileges. As it is operating
>   on guest controlled data (the boot image) and taking decisions based
>   on this data, there is a possible security issue. Not being possible
>   to use pygrub is thus a step towards more security.
> 
> Default is still to build and install pygrub.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

