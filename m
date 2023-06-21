Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CC737832
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 02:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552408.862480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBldW-0002r9-N5; Wed, 21 Jun 2023 00:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552408.862480; Wed, 21 Jun 2023 00:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBldW-0002oQ-Jx; Wed, 21 Jun 2023 00:23:50 +0000
Received: by outflank-mailman (input) for mailman id 552408;
 Wed, 21 Jun 2023 00:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRi+=CJ=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qBldU-0002oK-VD
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 00:23:49 +0000
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [2607:f8b0:4864:20::e36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e08891-0fc9-11ee-b234-6b7b168915f2;
 Wed, 21 Jun 2023 02:23:47 +0200 (CEST)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-43dd7791396so1607821137.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 17:23:47 -0700 (PDT)
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
X-Inumbo-ID: e2e08891-0fc9-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687307026; x=1689899026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiX1gCrrdbmMdY9MbQ4DmiMp/CnEAXeloA4vSiw0EUw=;
        b=ZdDep5yXy2smIAWyCayIcgVmwEFCIXHNp5o5/nfCL4q88yh9KiiraiLjJLrUis4tHt
         y3S6cwXZOcqBXNMYqmE0dgk4YPWxyT7y4rm49kNGzmjXA3qMxdORAe/ldfthODf5cVUS
         F0t7HzKS3/85hew6GAEcHFkrZQwRbyOQkTQ623rg0Ei7QqiqkafLVerVtHp5/J2fLgd7
         iisOSBvhovENniUonlqVOge/TMOGkG1H/UdsFRdGXm74grz/K4+sq7ba2V6Pd+iiQl5g
         vwJKhwGdjn91wpqRlVNInEZUXPoZ/wkAvNCZ/MkwWBYeOZFwf43wE9OmffZNsmSo4fCf
         3k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687307026; x=1689899026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiX1gCrrdbmMdY9MbQ4DmiMp/CnEAXeloA4vSiw0EUw=;
        b=EKeq05aP1x5RHO8tLYjWyChqpEQN3433IX2mBDJnuzrc80BRRMw9aIGIPfttz7lM71
         4yHhKZLujMP24LJhHFtxI33ZkRw9omfPa/DxIANU3TlvflGaVFzvw3AJ14gqwNI1YLJ/
         /3zJKO3vSAKy4HeO2k6k8VQHgQxNNmTtFvXlHzGrwJzdNHGFAc7ObkUeAfjBB1Tvu5dq
         e3IjWPkG6Gd3n4OuFvvwmezcwcUVmZAsiygQ4aYsKpvWUw/t1O39R+xLdSElRrO1bfd2
         zk6cRUrXNeP9/3q9H5AI+3UN7OjIy8zuZfAAczF3vkH7AJ3OYv8c9nbl0Q4aB69OPmIl
         PehA==
X-Gm-Message-State: AC+VfDxWjKsufx2Pemq1mvz56kaouST5DkIQva0k4CzRZ1ysaMXsU9ro
	McZJfrZW8fj8LkhMqGPbCHFGhypNeYHEYZG9MOY=
X-Google-Smtp-Source: ACHHUZ7eDhRGLsoYvFdcbsnps8qrg4kCot14zm/ruin/ZtBC8uOan041amlx89xgrR4RLJZRrGqEIA2nNdidRiOdsiQ=
X-Received: by 2002:a67:f99a:0:b0:440:339f:b1d3 with SMTP id
 b26-20020a67f99a000000b00440339fb1d3mr5261774vsq.31.1687307025841; Tue, 20
 Jun 2023 17:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Jun 2023 10:23:19 +1000
Message-ID: <CAKmqyKOoED05T0OXdTEOPbn2k-Jdn7M3Ac=MBSfi-YMjX8WLPg@mail.gmail.com>
Subject: Re: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 4:07=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> These aren't used, and are not obvious useful either.
>
> tools/ does have some logic which works on $(XEN_OS) directly, and some o=
n
> CONFIG_$(XEN_OS) too, but this isn't how we typically refer to things.
>
> The only user ever of this scheme was introduced in c0fd920e987 (2006) an=
d
> deleted in fa2244104b4 (2010).
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>
> The necessary rune is:
>
>   git grep -E "CONFIG_(X86|ARM|RISCV)_(FreeBSD|Linux|MiniOS|NetBSD|OpenBS=
D|SunOS)"
> ---
>  config/arm32.mk   | 1 -
>  config/arm64.mk   | 1 -
>  config/riscv64.mk | 1 -
>  config/x86_32.mk  | 1 -
>  config/x86_64.mk  | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/config/arm32.mk b/config/arm32.mk
> index f95228e3c079..c38d89cb30fc 100644
> --- a/config/arm32.mk
> +++ b/config/arm32.mk
> @@ -1,6 +1,5 @@
>  CONFIG_ARM :=3D y
>  CONFIG_ARM_32 :=3D y
> -CONFIG_ARM_$(XEN_OS) :=3D y
>
>  CONFIG_XEN_INSTALL_SUFFIX :=3D
>
> diff --git a/config/arm64.mk b/config/arm64.mk
> index aa45772b6173..c4662f67d044 100644
> --- a/config/arm64.mk
> +++ b/config/arm64.mk
> @@ -1,6 +1,5 @@
>  CONFIG_ARM :=3D y
>  CONFIG_ARM_64 :=3D y
> -CONFIG_ARM_$(XEN_OS) :=3D y
>
>  CONFIG_XEN_INSTALL_SUFFIX :=3D
>
> diff --git a/config/riscv64.mk b/config/riscv64.mk
> index a5a21e5fa220..91c6e53da6f8 100644
> --- a/config/riscv64.mk
> +++ b/config/riscv64.mk
> @@ -1,5 +1,4 @@
>  CONFIG_RISCV :=3D y
>  CONFIG_RISCV_64 :=3D y
> -CONFIG_RISCV_$(XEN_OS) :=3D y
>
>  CONFIG_XEN_INSTALL_SUFFIX :=3D
> diff --git a/config/x86_32.mk b/config/x86_32.mk
> index bc96ff013d74..3cc046d9bcf3 100644
> --- a/config/x86_32.mk
> +++ b/config/x86_32.mk
> @@ -1,6 +1,5 @@
>  CONFIG_X86 :=3D y
>  CONFIG_X86_32 :=3D y
> -CONFIG_X86_$(XEN_OS) :=3D y
>
>  CONFIG_MIGRATE :=3D y
>  CONFIG_XCUTILS :=3D y
> diff --git a/config/x86_64.mk b/config/x86_64.mk
> index 4afef4414129..8614457b03d0 100644
> --- a/config/x86_64.mk
> +++ b/config/x86_64.mk
> @@ -1,6 +1,5 @@
>  CONFIG_X86 :=3D y
>  CONFIG_X86_64 :=3D y
> -CONFIG_X86_$(XEN_OS) :=3D y
>
>  CONFIG_MIGRATE :=3D y
>  CONFIG_XCUTILS :=3D y
>
> base-commit: 43e863a02d81f5fff32763b23d2a39f041f7e62b
> --
> 2.30.2
>
>

