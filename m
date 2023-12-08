Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8E8098A5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650304.1015706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPmp-0008HB-OM; Fri, 08 Dec 2023 01:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650304.1015706; Fri, 08 Dec 2023 01:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBPmp-0008FQ-KW; Fri, 08 Dec 2023 01:36:15 +0000
Received: by outflank-mailman (input) for mailman id 650304;
 Fri, 08 Dec 2023 01:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBPmo-0008FJ-DW
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:36:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a94c716-956a-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 02:36:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6668262232;
 Fri,  8 Dec 2023 01:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDEFC433C7;
 Fri,  8 Dec 2023 01:36:08 +0000 (UTC)
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
X-Inumbo-ID: 2a94c716-956a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701999369;
	bh=eRMXlxabaTlTEyBx4wLUSrc1e/RDO1qo/KJueNgJkNY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XSbAZxpuNJLbnAcfgNXyzfIW4wtRg7F1bGPb8Z/x4p/HtaUJaZWutphvJ4fenW66m
	 GQJr9ntFvK59oIpgLPGa220zvly8FlFrDYN7fPF9co1socXb2P6ywwZ63BbgfOPIlb
	 Q68Q4z9MPXpgBCGSCGSsI2xLgnBhobopxkAzbfb++Ib+9am/eoQ/LjHukMG6/i67A3
	 h3rntW2J6ePJldBqe5YvJAuFqVUFA7yMcdFjzh/lKXMsFiCH2bkPpzdur9A7eGlu9K
	 BcG8gikU9tZPADbzLX+ybFXDFmLXXtFFeatN5qgiimm8XCnLMhs9pThI3DxWIYyRHJ
	 hUOVd7+bHUd2A==
Date: Thu, 7 Dec 2023 17:36:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
In-Reply-To: <20231207135318.1912846-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312071722250.1265976@ubuntu-linux-20-04-desktop>
References: <20231207135318.1912846-1-Henry.Wang@arm.com> <20231207135318.1912846-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Henry Wang wrote:
> Fixed Virtual Platforms (FVPs) are complete simulations of an Arm
> system, including processor, memory and peripherals. These are set
> out in a "programmer's view", which gives programmers a comprehensive
> model on which to build and test software. FVP can be configured to
> different setups by its cmdline parameters, and hence having the FVP
> in CI will provide us with the flexibility to test Arm features and
> setups that we find difficult to use real hardware or emulators.
> 
> This commit adds a Dockerfile for the new arm64v8 container with
> FVP installed, based on the debian bookworm-arm64v8 image. This
> container will be used to run the FVP test jobs. Compared to the
> debian bookworm-arm64v8 image, the packages in the newly added FVP
> container does not contain the `u-boot-qemu`, and adds the `expect`
> to run expect scripts introduced by following commits, `telnet` to
> connect to FVP, and `tftpd-hpa` to provide the TFTP service for
> the FVP.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  .../debian/bookworm-arm64v8-fvp.dockerfile    | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> 
> diff --git a/automation/build/debian/bookworm-arm64v8-fvp.dockerfile b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> new file mode 100644
> index 0000000000..3b87dc5a5b
> --- /dev/null
> +++ b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile

Please move this container under automation/tests-artifacts/ because the
container is only meant to be used for tests as opposed as to build Xen.
I know that in other cases we have reused the build container but that
just because it was already there an working for the purpose.

Also please name it based on the fvp rather than debian:

automation/tests-artifacts/armfvp/11.23_9-arm64v8.dockerfile

Everything else looks fine.



> @@ -0,0 +1,64 @@
> +FROM --platform=linux/arm64/v8 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ARG FVP_BASE_VERSION="11.23_9_Linux64_armv8l"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        zlib1g-dev \
> +        libncurses5-dev \
> +        libssl-dev \
> +        python3-dev \
> +        python3-setuptools \
> +        xorg-dev \
> +        uuid-dev \
> +        libyajl-dev \
> +        libaio-dev \
> +        libglib2.0-dev \
> +        clang \
> +        libpixman-1-dev \
> +        pkg-config \
> +        flex \
> +        bison \
> +        acpica-tools \
> +        libfdt-dev \
> +        bin86 \
> +        bcc \
> +        liblzma-dev \
> +        libnl-3-dev \
> +        ocaml-nox \
> +        libfindlib-ocaml-dev \
> +        markdown \
> +        transfig \
> +        pandoc \
> +        checkpolicy \
> +        wget \
> +        git \
> +        nasm \
> +        # for test phase, fvp-smoke-* jobs
> +        u-boot-tools \
> +        expect \
> +        device-tree-compiler \
> +        curl \
> +        cpio \
> +        busybox-static \
> +        telnet \
> +        tftpd-hpa \
> +        && \
> +        apt-get autoremove -y && \
> +        apt-get clean && \
> +        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +RUN wget https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz && \
> +    mkdir -p /FVP/FVP_Base_RevC-2xAEMvA && \
> +    tar -xvzf FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz -C /FVP/FVP_Base_RevC-2xAEMvA && \
> +    rm FVP_Base_RevC-2xAEMvA_${FVP_BASE_VERSION}.tgz
> -- 
> 2.25.1
> 

