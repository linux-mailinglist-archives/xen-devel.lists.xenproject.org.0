Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44EA6AA82
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922842.1326659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIKz-0008AE-5R; Thu, 20 Mar 2025 16:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922842.1326659; Thu, 20 Mar 2025 16:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIKz-00087x-2m; Thu, 20 Mar 2025 16:01:41 +0000
Received: by outflank-mailman (input) for mailman id 922842;
 Thu, 20 Mar 2025 16:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvIKx-00087p-ST
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:01:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b8152f9-05a4-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 17:01:39 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso6989235e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:01:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d46edba08sm43918815e9.18.2025.03.20.09.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 09:01:37 -0700 (PDT)
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
X-Inumbo-ID: 9b8152f9-05a4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742486498; x=1743091298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/QAGOtgVtywff/ttmjmtkxl+ELqSOOpLhcIJcP6dUn0=;
        b=HzvKoKdejHgpM5i8bQB93mYpDE/qR0zIO1fYJQdckPCkDrnC3fyorUC5l7X4f9SwOo
         t7fjNRnlLG4I3OOY5fAvL2WqRF06anvntlnM13ya1UEb85z0Se2fuR/GQFTdzKqEGB8/
         GqSkfmMqn3OXcTN3SFb1k8Du0ZjG4ppnBc598=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486498; x=1743091298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QAGOtgVtywff/ttmjmtkxl+ELqSOOpLhcIJcP6dUn0=;
        b=LeazEpemmhRxGJ9xfmPmRPIxc2lfj+tsJCW8GlZgg6i5zS1X9KBi6hTZaCPveb0JjM
         Eo/63P4ZMVY7ioxlow9MXr5ae1dQvXCXi4HBkvWFzPLhts7kHyGIUaplH15qjcnmcABC
         as2saLcT5DAPd5eaVEx8UXdnU0Xf2jQIWG3CvynfQR++RGzQF9E4X4NRYU6cH8+j5NK8
         6AjftXsUIzU4X8zxLUzxlmH1Nmwuj6j5GirllQIpTvg5mGfUST2EUHgo9MUyHS+vEAuc
         cgT3Qz1cMWAgEFdE5cwrqEDX4SUNnnOSfQncLBph2+Aqlry2WXdRFTSwTNpIDkcG5eAy
         nDGA==
X-Gm-Message-State: AOJu0Yx/bj8QIBq2PGb4K1wl6wn+YMRJV27f5+f3XHH34baRvKzdjdjC
	G7t6h+msVcrumsEqoq48lUbitFF2siHuaHjMrry8djHDCOHsPea7OyA7DRovfS6k/mFPfVGIK8O
	y
X-Gm-Gg: ASbGnctS8rVBZPQYqdPyqTp5GTR4XbpfkjPgkqyRhGRGiiF2n1SvL/6v20AV5TdlMMf
	CbXK8mZKF0WZTU0qtSt//cMXfmUCFIQTb3YAYYhxFAeZqZiGXXIIFC1UBPYF5TmNs19hXEcG69R
	K3CQQ90f5KBwiTG+a40ITkRLNV4kiXmtLXdW++CpQQj9UzinjIO8PZ22lhq9+xDgxquIhVED+AV
	+kKFz47SIm+pm5bGspfQciBRRQ5obzG4sVyTPHY+eDlNjlM/lOBSTh1KE49mbHCv7e+QvajgxFE
	wocox704PTjd6+im6eP6NixCMfvT+UukWc3UpQ0sEFhFmBaWywOhPYWLqPLGPKb109YOyNqnADO
	Rl1F1zjVvKg==
X-Google-Smtp-Source: AGHT+IHoE0h9SrCLr/i8IWHoPpjrCwwWBg0cr+ZDJLMpBAQKFGmfKr9XuhS0UTFFazRX+nO9IKCqug==
X-Received: by 2002:a05:600c:1d8b:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43d495a42d4mr35530735e9.25.1742486498057;
        Thu, 20 Mar 2025 09:01:38 -0700 (PDT)
Message-ID: <ef8fbae6-e231-4348-843b-bf84eaf0ef52@citrix.com>
Date: Thu, 20 Mar 2025 16:01:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] CI: Update build tests based on new minimum toolchain
 requirements
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
 <20250320155908.43885-2-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250320155908.43885-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Test, to try and figure out what inumbo is choking on.

~Andrew

On 20/03/2025 3:59 pm, Andrew Cooper wrote:
> Drop CentOS 7 entirely.  It's way to old now.
>
> Ubuntu 22.04 is the oldest Ubuntu with a suitable version of Clang, so swap
> the 16.04 clang builds for 22.04.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/build/centos/7.dockerfile | 72 ----------------------------
>  automation/gitlab-ci/build.yaml      | 30 ++++--------
>  2 files changed, 10 insertions(+), 92 deletions(-)
>  delete mode 100644 automation/build/centos/7.dockerfile
>
> diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
> deleted file mode 100644
> index f41dda732084..000000000000
> --- a/automation/build/centos/7.dockerfile
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -# syntax=docker/dockerfile:1
> -FROM --platform=linux/amd64 centos:7
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -RUN mkdir /build
> -WORKDIR /build
> -
> -RUN <<EOF
> -    set -e
> -
> -    # Fix up Yum config now that mirror.centos.org doesn't exist
> -    sed -e 's/mirror.centos.org/vault.centos.org/g' \
> -        -e 's/^#.*baseurl=https\?/baseurl=https/g' \
> -        -e 's/^mirrorlist=https\?/#mirrorlist=https/g' \
> -        -i /etc/yum.repos.d/*.repo
> -
> -    # Add the EPEL repo to get dev86
> -    yum -y install epel-release
> -
> -    # Update everything (Base container is out of date)
> -    yum -y update
> -
> -    DEPS=(
> -        # Xen
> -        binutils
> -        gcc
> -        make
> -        python
> -        # Kconfig
> -        bison
> -        flex
> -        # Flask
> -        checkpolicy
> -
> -        # Tools (general)
> -        git
> -        gzip
> -        patch
> -        perl
> -        pkgconfig
> -        wget
> -        # libxenguest dombuilder
> -        bzip2-devel
> -        lz4-devel
> -        lzo-devel
> -        xz-devel
> -        zlib-devel
> -        zstd-devel
> -        # libacpi
> -        acpica-tools
> -        # libxl
> -        libuuid-devel
> -        yajl-devel
> -        # RomBIOS
> -        dev86
> -        # Header Check
> -        gcc-c++
> -        # xentop
> -        ncurses-devel
> -        # Python bindings
> -        python-devel
> -
> -        # Stubdom download/extract
> -        bzip2
> -    )
> -
> -    yum -y install "${DEPS[@]}"
> -
> -    yum clean all
> -    rm -rf /var/cache/yum
> -EOF
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index f633068c312b..2513908b059b 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -545,16 +545,6 @@ archlinux-gcc-debug:
>      CONTAINER: archlinux:current
>    allow_failure: true
>  
> -centos-7-gcc:
> -  extends: .gcc-x86-64-build
> -  variables:
> -    CONTAINER: centos:7
> -
> -centos-7-gcc-debug:
> -  extends: .gcc-x86-64-build-debug
> -  variables:
> -    CONTAINER: centos:7
> -
>  debian-12-x86_64-gcc-ibt:
>    extends: .gcc-x86-64-build
>    variables:
> @@ -607,16 +597,6 @@ fedora-41-x86_64-gcc-debug:
>    variables:
>      CONTAINER: fedora:41-x86_64
>  
> -ubuntu-16.04-x86_64-clang:
> -  extends: .clang-x86-64-build
> -  variables:
> -    CONTAINER: ubuntu:16.04-x86_64
> -
> -ubuntu-16.04-x86_64-clang-debug:
> -  extends: .clang-x86-64-build-debug
> -  variables:
> -    CONTAINER: ubuntu:16.04-x86_64
> -
>  ubuntu-16.04-x86_64-gcc:
>    extends: .gcc-x86-64-build
>    variables:
> @@ -637,6 +617,16 @@ ubuntu-20.04-x86_64-gcc:
>    variables:
>      CONTAINER: ubuntu:20.04-x86_64
>  
> +ubuntu-22.04-x86_64-clang:
> +  extends: .clang-x86-64-build
> +  variables:
> +    CONTAINER: ubuntu:22.04-x86_64
> +
> +ubuntu-22.04-x86_64-clang-debug:
> +  extends: .clang-x86-64-build-debug
> +  variables:
> +    CONTAINER: ubuntu:22.04-x86_64
> +
>  ubuntu-22.04-x86_64-gcc:
>    extends: .gcc-x86-64-build
>    variables:


