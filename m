Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535592BA35
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756255.1164805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAR8-0003ca-5i; Tue, 09 Jul 2024 12:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756255.1164805; Tue, 09 Jul 2024 12:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAR8-0003aM-2o; Tue, 09 Jul 2024 12:59:14 +0000
Received: by outflank-mailman (input) for mailman id 756255;
 Tue, 09 Jul 2024 12:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XjVV=OJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sRAR5-0003aG-TG
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 12:59:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08c565e6-3df3-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 14:59:10 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b5f7bf3edso3178765a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 05:59:10 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bba548f3sm1044895a12.10.2024.07.09.05.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 05:59:09 -0700 (PDT)
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
X-Inumbo-ID: 08c565e6-3df3-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720529950; x=1721134750; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG18fm06j50PrqXn/TzPqWy99jWqJaEaljHVn90LuGk=;
        b=WEyEfulH2XcWsvbv5lUYsF+HhX67aEa3rxkkyYN+T0pt/Wm9SHb+nAwsfkyDXWiD/D
         rkf/I0SqjGE6tYS8sxABGc5Y7J9CvmpWa7jlkyh9A3ZK2jl7R9CqdleOgnas1gCGhZXp
         BmxlF2I9XjsGakleGdmsum//1tduHQCLeMa0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529950; x=1721134750;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BG18fm06j50PrqXn/TzPqWy99jWqJaEaljHVn90LuGk=;
        b=DJBjXRoSym1fBUfnXzaosHabFNahscOmgtgMs9YrQCMQF4Incly6EA8wxoEQaLYq9p
         2cFz6nCVLJyZ4JstXRMCFamCaHaffldfC/KwBN50eg8fWOW+kW+qlpRuDT74r3932lBn
         X0ED1WMpDkXdXblTrUqHH9S5tvJsW+viLn+K2Ne3Wooxoh0rYJ9xfrkSb+qQVL40Drr/
         WwVYqPccS2+0h+CjMD93AC7NyQFm9+A+txoO1N7fANWaqTEW0UyK+ZHOD4EFicSKrlog
         /2V0lRfdmyq/Q2MG0VGVJfru/ckGNce8/pm//hk/SppHkdeflRjFNnyRxDWScQg/Jdwn
         qpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW95uUgEvKWeZIQMXBt9glVfXT/RQnCe5xp/BaIXnDbwlnmZjwC8E3UV2RwadmakpZEAufbtH2sTS0uXSUgJ02Gc+J6q/TjJerPriuk7jg=
X-Gm-Message-State: AOJu0Yw6SNFmjY+ZHguXHxneQUdO6hynCte6WQY1qpzKtHvJtrz2sB8G
	DsZiPe+BhoUuD+VbmgR2z8lxtEZMJfGreyMxGiwvKF9vpm6xJMC4cf3MAOxViJuwnepcT9T2kyi
	G
X-Google-Smtp-Source: AGHT+IEBq2+ttsamhEI5Z7cIdXXIQZN1J8lnnr6mp7OjYlPXCPf/9G/cAf6eh5wmFYKOQPR7EwTPsw==
X-Received: by 2002:a50:fb0b:0:b0:57d:42f6:63fe with SMTP id 4fb4d7f45d1cf-594bb773f1bmr1986162a12.22.1720529950043;
        Tue, 09 Jul 2024 05:59:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jul 2024 13:59:08 +0100
Message-Id: <D2L0YQOMMQ3G.GLD8N5NQ50JS@cloud.com>
Cc: "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20] automation: Use a different ImageBuilder
 repository URL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240709122117.48051-1-michal.orzel@amd.com>
In-Reply-To: <20240709122117.48051-1-michal.orzel@amd.com>

On Tue Jul 9, 2024 at 1:21 PM BST, Michal Orzel wrote:
> Switch to using https://gitlab.com/xen-project/imagebuilder.git which
> should be considered official ImageBuilder repo.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
>  automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scr=
ipts/qemu-smoke-dom0-arm32.sh
> index d91648905669..5b62e3f691f1 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -73,7 +73,7 @@ UBOOT_SOURCE=3D"boot.source"
>  UBOOT_SCRIPT=3D"boot.scr"' > config
> =20
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git

For this clone and all others:

You probably want "git clone --depth 1 <url>" to pull the tip of the repo a=
nd
not its history.

>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> =20
>  rm -f ${serial_log}
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scr=
ipts/qemu-smoke-dom0-arm64.sh
> index e0bb37af3610..ca59bdec1b2b 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -87,7 +87,7 @@ LOAD_CMD=3D"tftpb"
>  UBOOT_SOURCE=3D"boot.source"
>  UBOOT_SCRIPT=3D"boot.scr"' > binaries/config
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binar=
ies/config
> =20
> =20
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation=
/scripts/qemu-smoke-dom0less-arm32.sh
> index 1e2b939aadf7..11804cbd729f 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -125,7 +125,7 @@ if [[ "${test_variant}" =3D=3D "without-dom0" ]]; the=
n
>  fi
> =20
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> =20
>  # Run the test
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation=
/scripts/qemu-smoke-dom0less-arm64.sh
> index 292c38a56147..4b548d1f8e54 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -198,7 +198,7 @@ NUM_CPUPOOLS=3D1' >> binaries/config
>  fi
> =20
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binar=
ies/config
> =20
> =20
> diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/s=
cripts/qemu-xtf-dom0less-arm64.sh
> index a667e0412c92..59f926d35fb9 100755
> --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> @@ -45,7 +45,7 @@ UBOOT_SOURCE=3D"boot.source"
>  UBOOT_SCRIPT=3D"boot.scr"' > binaries/config
> =20
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binar=
ies/config
> =20
>  # Run the test
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automati=
on/scripts/xilinx-smoke-dom0less-arm64.sh
> index 4a071c6ef148..e3f7648d5031 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -122,7 +122,7 @@ if [[ "${test_variant}" =3D=3D "gem-passthrough" ]]; =
then
>  fi
> =20
>  rm -rf imagebuilder
> -git clone https://gitlab.com/ViryaOS/imagebuilder
> +git clone https://gitlab.com/xen-project/imagebuilder.git
>  bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/co=
nfig
> =20
>  # restart the board

Cheers,
Alejandro

