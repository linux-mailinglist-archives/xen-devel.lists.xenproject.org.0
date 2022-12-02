Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAD640A4F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 17:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452105.709923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18c7-0004fK-OV; Fri, 02 Dec 2022 16:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452105.709923; Fri, 02 Dec 2022 16:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18c7-0004dR-Kc; Fri, 02 Dec 2022 16:10:11 +0000
Received: by outflank-mailman (input) for mailman id 452105;
 Fri, 02 Dec 2022 16:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ddoq=4A=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1p18c6-0004dL-6J
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 16:10:10 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6d5ef3-725b-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 17:10:08 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h7so2469248wrs.6
 for <xen-devel@lists.xenproject.org>; Fri, 02 Dec 2022 08:10:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a0560001b0600b002415dd45320sm7259614wrz.112.2022.12.02.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 08:10:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8823B1FFB7;
 Fri,  2 Dec 2022 16:10:05 +0000 (GMT)
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
X-Inumbo-ID: ca6d5ef3-725b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nukBQmCgTM/TGz+Uoo8zfQps6NjeFMphRLVnkBHi0B0=;
        b=uH/NNJnHBaiF/ZWR+bBe6PXZy4vTg4iDZubdB195ncN2C/c8k8y8FouaudFLgZULkC
         ISNe4b4WBY/QOx9YDJ8BYWwmgyzok+7dASy8UIKUWRcQOnhtOzkt6IwRb47mGK3Xu67W
         rId1+M9H0YmtL1thgJdbJ6+DFXU7dCQNLCOLL78cs0ttIXuLpvH+AI3hr0zK0U0vk6JC
         YM5zYyvbGxQO5R/qkvCpgfz3l5/sDRcPDHF9CutoeDk58DjzqRzoP9wmDm+GOwjZnv5D
         9WfqXt0paWCeeb+eUdHysVO7h3NBZiAfZ/RPy/b0v4ab0ge/es60BnAZ+ae/a/qwW1Pd
         PtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nukBQmCgTM/TGz+Uoo8zfQps6NjeFMphRLVnkBHi0B0=;
        b=VnxCchcfGxg4BmBgXptl666NA3msgJnFhoSMi/Ro5PA5heYgu0E0yDsZuDYXljUPVP
         sRBC0nP2rm41YFZQ0k4AAANPiPSb256hqNffcu4vG+E5RaEWxIN4BuuedrfSGK+qV9Ay
         cNWUZsIiQAbisQWd2Ngt7Sgav05Uis0RTXoTitl80S7Zb1YW3oUoF9wq6is2mWnfKRod
         UatdJpb0OJ9R7UoxawUMjtSde7lq5cretAYEsOkRWAywJcTzPf6eHYRkI7gpAhZ0hYO8
         pa5lczksf8a+oYdGDnsHcHnUnYKBlXo46PlUp4arF8aTislayF5ySUYKvAYXc7c/Kb8e
         vRtg==
X-Gm-Message-State: ANoB5pnRNnCnnH7JeHzBGOwbdncbcf0E7jNJajni4A6WDkIDlnjRiEgJ
	Pc85tKko3nw46pYg/LKx0MnWfA==
X-Google-Smtp-Source: AA0mqf44T6El1WEuJi/EQhVnetD6wVWF4WPQyHuqRva0rErHPoXh+PyMk2COyz2SPc2TyBcUWrV6pA==
X-Received: by 2002:adf:d84c:0:b0:236:6f1a:955 with SMTP id k12-20020adfd84c000000b002366f1a0955mr43106920wrl.111.1669997407792;
        Fri, 02 Dec 2022 08:10:07 -0800 (PST)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org
Subject: Re: [QEMU][PATCH v2 00/11] Introduce xenpv machine for arm
 architecture
Date: Fri, 02 Dec 2022 16:07:02 +0000
In-reply-to: <20221202030003.11441-1-vikram.garhwal@amd.com>
Message-ID: <87wn79aisi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Hi,
> This series add xenpv machine for aarch64. Motivation behind creating xen=
pv
> machine with IOREQ and TPM was to enable each guest on Xen aarch64 to hav=
e it's
> own unique and emulated TPM.
>
> This series does following:
>     1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so th=
ose can
>        be used for aarch64.
>     2. We added a minimal xenpv arm machine which creates an IOREQ server=
 and
>        support TPM.

So I've managed to test the basics:

  16:02:33 [root@latte:~] # xl create simple-guest.conf
  Parsing config from simple-guest.conf
  libxl: info: libxl_create.c:120:libxl__domain_build_info_setdefault: qemu=
-xen is unavailable, using qemu-xen-traditional instead: No such file or di=
rectory
  16:02:43 [root@latte:~] # xl list
  Name                                        ID   Mem VCPUs      State   T=
ime(s)
  Domain-0                                     0  4096     4     r-----    =
  25.6
  xenpv-test-guest                             2  4095     2     r-----    =
  14.9
  16:02:51 [root@latte:~] # ps ax  | grep qemu
      578 ?        Sl     0:00 /home/alex/lsrc/qemu.git/builds/xen/qemu-sys=
tem-aarch64 -xen-domid 0 -xen-attach -name dom0 -nographic -M xenpv -daemon=
ize -monitor /dev/null -serial /dev/null -parallel /dev/null -pidfile /var/=
run/xen/qemu-dom0.pid
     2053 pts/2    S+     0:00 grep --color=3Dauto qemu

However I'm a little lost on how to add HW to this machine. Is it all
via the guest configuration?

I think it would be worthwhile adding some documentation for this
machine to the manual, maybe docs/system/xen/xenpv.rst and then it can
be linked to from the appropriate target-arm.rst.

>
> Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
> moving old code to new place which was not QEMU code style compatible.
> No new add code was added.
>
> Regards,
> Vikram
>
> ChangeLog:
>     v1 -> v2
>     Merged patch 05 and 06.
>     04/12: xen-hvm-common.c:
>         1. Moved xen_be_init() and xen_be_register_common() from
>             xen_register_ioreq() to xen_register_backend().
>         2. Changed g_malloc to g_new and perror -> error_setg_errno.
>         3. Created a local subroutine function for Xen_IOREQ_register.
>         4. Fixed build issues with inclusion of xenstore.h.
>         5. Fixed minor errors.
>
> Stefano Stabellini (5):
>   hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
>   xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
>   include/hw/xen/xen_common: return error from xen_create_ioreq_server
>   hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration
>     failure
>   meson.build: do not set have_xen_pci_passthrough for aarch64 targets
>
> Vikram Garhwal (6):
>   hw/i386/xen/: move xen-mapcache.c to hw/xen/
>   hw/i386/xen: rearrange xen_hvm_init_pc
>   hw/xen/xen-hvm-common: Use g_new and error_setg_errno
>   accel/xen/xen-all: export xenstore_record_dm_state
>   hw/arm: introduce xenpv machine
>   meson.build: enable xenpv machine build for ARM
>
>  accel/xen/xen-all.c              |    2 +-
>  hw/arm/meson.build               |    2 +
>  hw/arm/xen_arm.c                 |  175 +++++
>  hw/i386/meson.build              |    1 +
>  hw/i386/xen/meson.build          |    1 -
>  hw/i386/xen/trace-events         |   19 -
>  hw/i386/xen/xen-hvm.c            | 1084 +++---------------------------
>  hw/xen/meson.build               |    7 +
>  hw/xen/trace-events              |   19 +
>  hw/xen/xen-hvm-common.c          |  888 ++++++++++++++++++++++++
>  hw/{i386 =3D> }/xen/xen-mapcache.c |    0
>  include/hw/arm/xen_arch_hvm.h    |    9 +
>  include/hw/i386/xen_arch_hvm.h   |   11 +
>  include/hw/xen/arch_hvm.h        |    5 +
>  include/hw/xen/xen-hvm-common.h  |   98 +++
>  include/hw/xen/xen.h             |    2 +
>  include/hw/xen/xen_common.h      |   13 +-
>  meson.build                      |    4 +-
>  18 files changed, 1323 insertions(+), 1017 deletions(-)
>  create mode 100644 hw/arm/xen_arm.c
>  create mode 100644 hw/xen/xen-hvm-common.c
>  rename hw/{i386 =3D> }/xen/xen-mapcache.c (100%)
>  create mode 100644 include/hw/arm/xen_arch_hvm.h
>  create mode 100644 include/hw/i386/xen_arch_hvm.h
>  create mode 100644 include/hw/xen/arch_hvm.h
>  create mode 100644 include/hw/xen/xen-hvm-common.h


--=20
Alex Benn=C3=A9e

