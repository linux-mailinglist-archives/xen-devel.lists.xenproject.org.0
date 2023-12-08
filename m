Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9380AECA
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 22:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650798.1016585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBiHD-0007ZV-BB; Fri, 08 Dec 2023 21:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650798.1016585; Fri, 08 Dec 2023 21:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBiHD-0007WA-7e; Fri, 08 Dec 2023 21:20:51 +0000
Received: by outflank-mailman (input) for mailman id 650798;
 Fri, 08 Dec 2023 21:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBiHC-0007W3-47
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 21:20:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a67d1e93-960f-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 22:20:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 90FE0CE2136;
 Fri,  8 Dec 2023 21:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD32C433C8;
 Fri,  8 Dec 2023 21:20:42 +0000 (UTC)
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
X-Inumbo-ID: a67d1e93-960f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702070443;
	bh=EAbGuGot/DUK/c5T1KmEehAn53IC4HyfWRG4dpuS6oo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aXG82K8KVelxuen7RZz9j9376W/ebY/s6CEDaRIx9atEDQ3XBvJfHlp3u5A5IjAAo
	 6HZ8y2HP8TwOdSmlf1/+yxgtdX/hmx36EO9soHgZdawdqt3tezWor7sNq/UL5xo3/8
	 dE7cbJu/OzJW7uFp1UEsGCJq1re11BaOPTTcaSIdnazWR1c4K09UPH+LYSaUzMsbvi
	 HeEKoR+8qkhb4KfvnIR2k1EG1KPnfpZgMzaHt0NbiIGTK7yH92WBWeYjj/OFlzCI8w
	 ux2Ej0EjKNhxUh1PsfaYHNHAc//1tvbpUfp//SuQP7ZnQi30TC+f/IzlWEXFB3h9mu
	 dyyJIO97fHXSA==
Date: Fri, 8 Dec 2023 13:20:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2 2/5] automation: Add the Dockerfile to build TF-A and
 U-Boot for FVP
In-Reply-To: <CC528228-94A0-4D22-897F-24BDD5A5A11E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312081320320.1703076@ubuntu-linux-20-04-desktop>
References: <20231208054637.1973424-1-Henry.Wang@arm.com> <20231208054637.1973424-3-Henry.Wang@arm.com> <beb72672-4ff6-4fce-a3bd-2a7ead9e64ec@amd.com> <CC528228-94A0-4D22-897F-24BDD5A5A11E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-391461717-1702070443=:1703076"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-391461717-1702070443=:1703076
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 8 Dec 2023, Henry Wang wrote:
> Hi Michal,
> 
> > On Dec 8, 2023, at 16:39, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Hi Henry,
> > 
> > On 08/12/2023 06:46, Henry Wang wrote:
> >> 
> >> Unlike the emulators that currently being used in the CI pipelines,
> >> the FVP must start at EL3. Therefore we need the firmware, i.e. the
> >> TrustedFirmware-A (TF-A), for corresponding functionality.
> >> 
> >> There is a dedicated board (vexpress_fvp) in U-Boot (serve as the
> >> BL33 of the TF-A) for the FVP platform, so the U-Boot should also be
> >> compiled for the FVP platform instead of reusing the U-Boot for the
> >> existing emulators used in the CI pipelines.
> >> 
> >> To avoid compiling TF-A and U-Boot everytime in the job, adding a
> >> Dockerfile to the test artifacts to build TF-A v2.9.0 and U-Boot
> >> v2023.10 for FVP. The binaries for the TF-A and U-Boot, as well as
> >> the device tree for the FVP platform, will be saved (and exported by
> >> the CI job introduced by following commits). Note that, a patch for
> >> the TF-A will be applied before building to enable the virtio-net
> >> and the virtio-rng device on the FVP. The virtio-net device will
> >> provide the networking service for FVP, and the virtio-rng device
> >> will improve the speed of the FVP.
> >> 
> >> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> >> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >> ---
> >> v2:
> >> - Add Stefano's Reviewed-by tag.
> >> ---
> >> +# Build U-Boot and TF-A
> >> +RUN curl -fsSLO https://ftp.denx.de/pub/u-boot/u-boot-"$UBOOT_VERSION".tar.bz2 && \
> >> +    tar xvf u-boot-"$UBOOT_VERSION".tar.bz2 && \
> >> +    cd u-boot-"$UBOOT_VERSION" && \
> >> +    make -j$(nproc) V=1 vexpress_fvp_defconfig && \
> >> +    make -j$(nproc) V=1 all && \
> > Do we need 'all'? Can't we just build target 'u-boot' for u-boot.bin?
> 
> I think your suggestion makes sense, and I can have a try, if changing all to u-boot works,
> I will use that in v3.
> 
> >> +    cd .. && \
> >> +    git clone --branch "$TFA_VERSION" --depth 1 https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git && \
> >> +    cd trusted-firmware-a && \
> >> +    curl -fsSLO https://git.yoctoproject.org/meta-arm/plain/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch \
> >> +         --output 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> >> +    git config --global user.email "you@example.com" && \
> >> +    git config --global user.name "Your Name" && \
> > If this is needed for git am, you could get away using 'patch -p1'
> 
> Hmmm right, then probably we can even not install git and use the tarball instead of
> git clone.
> 
> 
> >> +    git am 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> >> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t all && \
> >> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t fip BL33=../u-boot-"$UBOOT_VERSION"/u-boot.bin && \
> >> +    cp build/fvp/debug/bl1.bin / && \
> >> +    cp build/fvp/debug/fip.bin / && \
> >> +    cp build/fvp/debug/fdts/fvp-base-gicv3-psci-1t.dtb / && \
> >> +    cd /build && \
> >> +    rm -rf u-boot-"$UBOOT_VERSION" trusted-firmware-a
> > You forgot to remove u-boot tar file
> 
> oops, nice catch, thanks. Will also remove that in v3.
> 
> > Other than that:
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks!
> 
> Stefano: Can I keep your Reviewed-by tag after addressing Michal’s comments above?

Yes

Cheers,

Stefano
--8323329-391461717-1702070443=:1703076--

