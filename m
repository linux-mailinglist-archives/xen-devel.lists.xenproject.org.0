Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF49AE73D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 16:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825334.1239538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yRk-0000ar-VN; Thu, 24 Oct 2024 14:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825334.1239538; Thu, 24 Oct 2024 14:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yRk-0000Yu-Si; Thu, 24 Oct 2024 14:04:16 +0000
Received: by outflank-mailman (input) for mailman id 825334;
 Thu, 24 Oct 2024 14:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3yRk-0000Yo-08
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 14:04:16 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d95be973-9210-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 16:04:13 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so139088866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 07:04:13 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee100sm625582466b.62.2024.10.24.07.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 07:04:11 -0700 (PDT)
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
X-Inumbo-ID: d95be973-9210-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729778653; x=1730383453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rv81b7pTqWmZCoPXe+GeBoWK/2gTppDUb1Xdf0RRWxI=;
        b=XxqwDew6q+iO7uJJ9gciIvrXkmK4YSL/3W1Acha+TY6nqmXhoeV9uNz0rUSJ4X0tvW
         3RP90NcPwpnVUWecfvEqrtRa5uQtwqD4L6FEldnAWpw2FoJVxj3MZAtxLw4zqLO9tnw2
         1FiOM7uXIAL7vETUcVJihtd9vG34RnDcnu7Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778653; x=1730383453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv81b7pTqWmZCoPXe+GeBoWK/2gTppDUb1Xdf0RRWxI=;
        b=dM5jJjKRjyGLpfBNHx3ul0OWVSEke9x+Eedm90HLfz/nNXNKBQXLnCk3aFtyvDA8/1
         4jHIkYvo2tgtpg1Fp++GQz/Pa0fLdMGqROktm7JNqTMAKJmAyvOR6eGTQS87ymrN6ilA
         xFlOxSaYyQT+M4O2OG7EiiZw1cMNnTmchaRzxClFIBp75cuNZOFiKQT9Lakg8u/xnD1C
         6DkhKFVAMvKvpfR/hqcI6vUDKz4Dc6AWPkihZkqnKfwy0xskbbiFnIBWrBJNoZiUXmoq
         Ey2qoNCkwdrRYBs20BFdvrJSqU/xGHFFCwrqYYfWPc4KbZHTv0Dq4+5AmTSlMgOfLpFn
         WPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlyQGBKDxDzFV5h88ov/Ywbiqu9wCahN7YGIdnYkqDcpVtJSnCkdwj9ik3dqZYAhs6KPos+6/Yu1I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5tEQ8L5QbXx2bjhATq6cmVI8DWIhT+IakEdNmcKo1pzSf6pak
	IKf2RbUbHU03c+NMLjHerJ1yUkRfa8FfN9b9OL1M4lpPe2KzYvMnPTkJU4aRYJM=
X-Google-Smtp-Source: AGHT+IHaa65aS5SSpOSVjuHlSQNsX6RqIc72yZOPbholahHEPPGbcegCXOSsVzjXVxa3yjqssQvJ8Q==
X-Received: by 2002:a17:907:3d91:b0:a99:e4a2:1cda with SMTP id a640c23a62f3a-a9ad285ee55mr189928866b.56.1729778652522;
        Thu, 24 Oct 2024 07:04:12 -0700 (PDT)
Message-ID: <f8452748-067d-48d3-8ed3-3adc98566aa3@citrix.com>
Date: Thu, 24 Oct 2024 15:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/6] CI: Refresh the Debian 12 x86_64 container
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2024 11:04 am, Javi Merino wrote:
> Rework the container to use heredocs for readability, and use
> apt-get --no-install-recommends to keep the size down.
>
> This reduces the size of the (uncompressed) container from 3.44GB to 1.67GB.

!!

>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  automation/build/debian/12-x86_64.dockerfile | 68 ++++++++++++++++++++
>  automation/build/debian/bookworm.dockerfile  | 57 ----------------
>  automation/gitlab-ci/build.yaml              | 20 +++---
>  automation/gitlab-ci/test.yaml               | 14 ++--
>  automation/scripts/containerize              |  2 +-
>  5 files changed, 86 insertions(+), 75 deletions(-)
>  create mode 100644 automation/build/debian/12-x86_64.dockerfile
>  delete mode 100644 automation/build/debian/bookworm.dockerfile
>
> diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
> new file mode 100644
> index 000000000000..e0ca8b7e9c91
> --- /dev/null
> +++ b/automation/build/debian/12-x86_64.dockerfile
> @@ -0,0 +1,68 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"

This wants to become two LABEL lines.

> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +# build depends
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu

Doesn't this need a `useradd --create-home user` here?

[Edit] Oh, no, because of the script change.  In which case can you note
this in the commit message and says a root container for now, until some
other CI scripts can be adjusted.

> +
> +    apt-get update

apt-get -y


> +    DEPS=(
> +        # Xen
> +        bison
> +        build-essential
> +        checkpolicy
> +        clang
> +        flex
> +
> +        # Tools (general)
> +        ca-certificates

Interestingly, we've gained ca-certificates and dropped apt-transport-https.

ca-certificates is a side effect of --no-install-recommends, so is
fine.  I recall there being a specific reason why we needed
apt-transport-https, but I can't recall why exactly.  Something about
the LetsEncrypt Cert used by xenbits IIRC.

Anthony - do you remember?


> +        expect

Expect is only for the test phase, so should move later.

> +        git-core
> +        libnl-3-dev

libnl-3-dev should be down in the #libxl section.  It's only for COLO
support.

> +        pkg-config
> +        wget
> +        # libxenguest dombuilder
> +        liblzma-dev
> +        zlib1g-dev

This is also fun.  In Ubuntu, I've got:

    libbz2-dev
    libzstd-dev
    liblzo2-dev
    liblzma-dev
    zlib1g-dev

which I think is all the algorithms we support in libxenguest.

Any decompressor which we don't find a suitable devel package gets the
hypervisor form instead.

> +        # To build the documentation
> +        pandoc

I know we had pandoc before, but I'd like to drop it.

I'm intending to turn off docs generally, and do them separately in a
single job that has *all* the docs build dependencies, not a misc subset
that the build system happens not to complain at.


I'm on the fence about the Qemu build things.  It's off by default now,
but the container never previously had meson/ninja so it wouldn't have
built either.  Perhaps leave them out until someone complains.


One thing you did drop which probably wants to stay is golang.  We have
golang bindings for libxl which (like Ocaml) are built conditionally on
finding the toolchain.

~Andrew

