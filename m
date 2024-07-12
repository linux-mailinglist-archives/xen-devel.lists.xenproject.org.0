Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C895492F9A1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 13:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757957.1167129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEcg-0001wf-JT; Fri, 12 Jul 2024 11:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757957.1167129; Fri, 12 Jul 2024 11:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEcg-0001uy-GV; Fri, 12 Jul 2024 11:39:34 +0000
Received: by outflank-mailman (input) for mailman id 757957;
 Fri, 12 Jul 2024 11:39:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSEcf-0001us-6F
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 11:39:33 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672b1567-4043-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 13:39:31 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77e7a6cfa7so243792466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 04:39:31 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bccb0sm333920866b.2.2024.07.12.04.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 04:39:29 -0700 (PDT)
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
X-Inumbo-ID: 672b1567-4043-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720784370; x=1721389170; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4JJm+GVDO4upd7e1Ii1ia6vkiZQ4HytQWGu1Zp8cYw=;
        b=GX9/BV3PqI+tW5FWrv6Co6cXIPTfatoOxN74lfAsNyA/+GG21E2AwU1+nj4QYpRX7l
         sXORn6ggQxlJxg9R6zVFNi1hvOMs9gNuB5djnRF2yYCBqcYtsfLu39TPDV08zdhOcAXH
         6SuYGUnfzURrvi+YQuqCf/bjvaBTrGhsS41kdhlCfM+Ky3Mg+5ZwC6Bx2Z8ILr3HXL7f
         f8vFv86egsABOA4/zZmuphqqf4ApMTrEHnRPYNZzhd/4+rBmWd3+0Xl6L5CNrFfhdWHh
         JZzGJyU9n9BC0LZWY+T997p6+H8O1Xf+XjQTu7STVl6D5EYN5iYWTsl6jO+L+p/wnGIi
         MLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720784370; x=1721389170;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4JJm+GVDO4upd7e1Ii1ia6vkiZQ4HytQWGu1Zp8cYw=;
        b=CMhst/qNOIRmAddwkfz63kLcMrOjSHNDwKLEm1VJQMhAeK/Eb0jyZ5xh99ALCYiLci
         S1/5T3LEUSBO33FrwrFr4JSMkNlmDaI5ILnlMmZB8yrZIgcqDbOz2FqFRGWkGkArnEqs
         SVUURYvWmBHc0ZZNvpf5UF8VbJUaG8yEr6YVTm9ZPGo1EJzPh6Z9CzfqYv7rY1DPfOJq
         6Fxz7byOz7gs+gfX1PvybXkKdrnXXQ1SooxjKCbV3TYMHKKPTYPpCHmjQXGbDXKPLeaB
         TQITT5W3vVu4WtrNgbsh6ETnFFu73a4EIWEPXSLXy6VZMmlJ8ZsarLEipCi5Swyn5eop
         y/uw==
X-Forwarded-Encrypted: i=1; AJvYcCWSNaG5GEc/RehZNF1nqHvAlIS/zusLBANRP8QFYsNxBMtTezBz54lQkHTi+y8oh4kkDjK6i0UbeR6ZbU4PDSxUokNWbemNoOHzKR0M9HA=
X-Gm-Message-State: AOJu0YwdyqKSw2iWsXWCaoFvGd3DwoWvt9K6TfFJr5b9YYrUXcJgVaxg
	9nuyaSBoSgE5P87y82rcW0cIRFQH5OfhVecJBOVxpbBH6OLPBeT1
X-Google-Smtp-Source: AGHT+IFyDIng5UL2YdTSfxmfGxjmTF4p51mf1nAUoqFdpas41QuK9yLy/rs/rebKFN9/5JnxgYn8uA==
X-Received: by 2002:a17:906:2bc5:b0:a77:aebc:8fb1 with SMTP id a640c23a62f3a-a780b6b1befmr695888866b.17.1720784370243;
        Fri, 12 Jul 2024 04:39:30 -0700 (PDT)
Message-ID: <1b6c7e57ea331d3ea9aeea7fafc9a0733f6e9147.camel@gmail.com>
Subject: Re: [PATCH 10/12] CI: Introduce debian:11/12-riscv64 containers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 12 Jul 2024 13:39:29 +0200
In-Reply-To: <20240711111517.3064810-11-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
	 <20240711111517.3064810-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 12:15 +0100, Andrew Cooper wrote:
> For starters, they're slightly smaller:
>=20
> =C2=A0 $ docker image list <snip>
> =C2=A0 registry.gitlab.com/xen-project/xen/debian=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 12-riscv64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 772MB
> =C2=A0 registry.gitlab.com/xen-project/xen/debian=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 11-riscv64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> 422MB
Do we really need both 11-riscv64 and 12-riscv64?

Generally this patch LGTM: Reviewed-by: Oleksii Kurochko
<oleksii.kurochko@gmail.com>

~ Oleksii
=20

> =C2=A0 registry.gitlab.com/xen-project/xen/archlinux=C2=A0=C2=A0 current-=
riscv64=C2=A0=C2=A0=C2=A0
> 2.32GB
>=20
> They also not rolling distros, so will be more predicatable testing
> for the
> stable trees in the future.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> =C2=A0automation/build/debian/11-riscv64.dockerfile | 33 ++++++++++++++++=
+
> =C2=A0automation/build/debian/12-riscv64.dockerfile | 36
> +++++++++++++++++++
> =C2=A02 files changed, 69 insertions(+)
> =C2=A0create mode 100644 automation/build/debian/11-riscv64.dockerfile
> =C2=A0create mode 100644 automation/build/debian/12-riscv64.dockerfile
>=20
> diff --git a/automation/build/debian/11-riscv64.dockerfile
> b/automation/build/debian/11-riscv64.dockerfile
> new file mode 100644
> index 000000000000..1c99bc89ea1a
> --- /dev/null
> +++ b/automation/build/debian/11-riscv64.dockerfile
> @@ -0,0 +1,33 @@
> +# syntax=3Ddocker/dockerfile:1
> +FROM --platform=3Dlinux/amd64 debian:bullseye-slim
> +LABEL maintainer.name=3D"The Xen Project"
> +LABEL maintainer.email=3D"xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +ENV CROSS_COMPILE=3Driscv64-linux-gnu-
> +ENV XEN_TARGET_ARCH=3Driscv64
> +
> +RUN <<EOF
> +#!/bin/bash
> +=C2=A0=C2=A0=C2=A0 set -e
> +
> +=C2=A0=C2=A0=C2=A0 useradd --create-home user
> +
> +=C2=A0=C2=A0=C2=A0 apt-get -y update
> +
> +=C2=A0=C2=A0=C2=A0 DEPS=3D(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Xen
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bison
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 checkpolicy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flex
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc-riscv64-linux-gnu
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-minimal
> +=C2=A0=C2=A0=C2=A0 )
> +
> +=C2=A0=C2=A0=C2=A0 apt-get -y --no-install-recommends install "${DEPS[@]=
}"
> +=C2=A0=C2=A0=C2=A0 rm -rf /var/lib/apt/lists/*
> +EOF
> +
> +USER user
> +WORKDIR /build
> diff --git a/automation/build/debian/12-riscv64.dockerfile
> b/automation/build/debian/12-riscv64.dockerfile
> new file mode 100644
> index 000000000000..03fd4b03059b
> --- /dev/null
> +++ b/automation/build/debian/12-riscv64.dockerfile
> @@ -0,0 +1,36 @@
> +# syntax=3Ddocker/dockerfile:1
> +FROM --platform=3Dlinux/amd64 debian:bookworm-slim
> +LABEL maintainer.name=3D"The Xen Project"
> +LABEL maintainer.email=3D"xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +ENV CROSS_COMPILE=3Driscv64-linux-gnu-
> +ENV XEN_TARGET_ARCH=3Driscv64
> +
> +RUN <<EOF
> +#!/bin/bash
> +=C2=A0=C2=A0=C2=A0 set -e
> +
> +=C2=A0=C2=A0=C2=A0 useradd --create-home user
> +
> +=C2=A0=C2=A0=C2=A0 apt-get -y update
> +
> +=C2=A0=C2=A0=C2=A0 DEPS=3D(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Xen
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bison
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-essential
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 checkpolicy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flex
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc-riscv64-linux-gnu
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-minimal
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Qemu for test phase
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu-system-riscv64
> +=C2=A0=C2=A0=C2=A0 )
> +
> +=C2=A0=C2=A0=C2=A0 apt-get -y --no-install-recommends install "${DEPS[@]=
}"
> +=C2=A0=C2=A0=C2=A0 rm -rf /var/lib/apt/lists/*
> +EOF
> +
> +USER user
> +WORKDIR /build


