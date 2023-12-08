Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36180A33C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 13:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650618.1016324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBa0Q-0006gU-22; Fri, 08 Dec 2023 12:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650618.1016324; Fri, 08 Dec 2023 12:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBa0P-0006dk-Vb; Fri, 08 Dec 2023 12:30:57 +0000
Received: by outflank-mailman (input) for mailman id 650618;
 Fri, 08 Dec 2023 12:30:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBa0O-0006de-D6
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 12:30:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBa0O-0006Jb-1a; Fri, 08 Dec 2023 12:30:56 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.116]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBa0N-0001OW-P3; Fri, 08 Dec 2023 12:30:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jmFwlcRPJUFGG7s2JVaM8TZLaEvqNv+svByGXiHsEag=; b=vbN58JkhhstM3pcyfm9ifih1p1
	HuJmDXQd4y4ZdbikDw1+IOX/GilKLi00Mw3SyAs7oxpJp9kd6Bu2Vciz5BP2K1RSnuQLFpLpIeZie
	B6zPrnfl+uyheIjQxzcQTIr/vLLt8FA0vyZJjI73TlO9cmQ7UfRLLSM7z7Txajn7XmXs=;
Message-ID: <9978c881-9d1a-4554-b0f8-577a1cf6fc35@xen.org>
Date: Fri, 8 Dec 2023 12:30:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] automation: Add a Dockerfile for running FVP_Base
 jobs
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231208054637.1973424-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2023 05:46, Henry Wang wrote:
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
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v2:
> - Add Stefano's Reviewed-by tag.
> ---
>   .../debian/bookworm-arm64v8-fvp.dockerfile    | 64 +++++++++++++++++++
>   1 file changed, 64 insertions(+)
>   create mode 100644 automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> 
> diff --git a/automation/build/debian/bookworm-arm64v8-fvp.dockerfile b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
> new file mode 100644
> index 0000000000..3b87dc5a5b
> --- /dev/null
> +++ b/automation/build/debian/bookworm-arm64v8-fvp.dockerfile
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

I vaguely recall some discussions on whether it was ok for us to publish 
a container with the FVP model due to the license agreement.

I guess this has now been resolved because the download can be done 
without sign-in to the account. Can you confirm?

It would also be good that the commit message indicates whether there is 
any implicit license agreement from Xen Project (or any user that decide 
to use our scripts).

Cheers,

-- 
Julien Grall

