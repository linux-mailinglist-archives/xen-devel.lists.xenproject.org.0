Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9359E6F23D5
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 11:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527573.820259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psgrZ-00039a-Ew; Sat, 29 Apr 2023 09:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527573.820259; Sat, 29 Apr 2023 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psgrZ-00036l-C0; Sat, 29 Apr 2023 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 527573;
 Sat, 29 Apr 2023 09:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NroF=AU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1psgrX-00036f-BP
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 09:27:27 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d4cc94c-e670-11ed-8611-37d641c3527e;
 Sat, 29 Apr 2023 11:27:25 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso970277e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 29 Apr 2023 02:27:25 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a19760f000000b004d57a760e4dsm3677721lff.37.2023.04.29.02.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 02:27:24 -0700 (PDT)
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
X-Inumbo-ID: 0d4cc94c-e670-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682760445; x=1685352445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mYJiKwSRaUWtPwC5UKGwfjq/gWyGJiPpfL51KGBsvn0=;
        b=ntVhqD6Ip3+xEqbqSIGyxZH4SDl0AFXLl7mdkMjZKMWggTtTnfMgDSN6SHPr1+cyKp
         xn94Ay//sHuvaR4TrurBuagDaE4/zExoSsfiPqCYp+oOWIc47v/t7LsdjqYA4WVN2DZY
         cnVxHFSTqXPRuNPUv7C5eosZeD4vhbSjPDj2kOOFKc9nP91YomExGvVTiGj7uW/sm1Wx
         uD86VHBXuRm9M3tn8rcp6Vjf/C2YshxK0YZ/NPJv3Yrcm8ymndRuNay5a6Fe/kzVFuLA
         DQqgaOPgMJ62T1o5h9X5gwWwrnPxM7wxiZooY30NN1AGbdF9mZnJ2dPCe66ZCjh2V/6S
         yzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682760445; x=1685352445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYJiKwSRaUWtPwC5UKGwfjq/gWyGJiPpfL51KGBsvn0=;
        b=lcEGYRdLGX3k9suNdyYemIgu29VReILD1oJf9JQhMZhx2Yq+pA6F0GQGaoWKyPOUq+
         zVGCQ6r5+RFs5kjXuGvtN3/JU9dmrA3r9zlVTTC9iNCi8d+Q1uRUpAdCSdFpo42fcjWM
         lh9go7XxM8C5W5aTac0DHWpRPNLxdTWZZkN3h7RE8gX3UqSu2eOydALAkZQ5sd6cQRQ2
         2YHWq4iWYbiuiXM/emXRJ4gkHj9Lumm/66RIum7xaoM018SO42sfzToljym7D6B/Ffoi
         qXgpgfFMJMI9WeteVAYf92Yzx3huc/f2z0Ens+wviL2IwmFNcLtF+yxrO/DYpLGIyRRO
         aXVA==
X-Gm-Message-State: AC+VfDyORr/o+33pJovc6McbU9UiJ6AqUolwgIxyNEdB/kzsgWNbciNI
	MFTaUCJOEUkrkLulwf8L5Eg=
X-Google-Smtp-Source: ACHHUZ7jwvXhsOgAR0JgUljjJd0nqT17FmV2pViDO7ZjeTlMffZpFhqrQsVYjjS2RvRqFLtqGIohhg==
X-Received: by 2002:a19:f018:0:b0:4eb:3bb5:81c5 with SMTP id p24-20020a19f018000000b004eb3bb581c5mr2002476lfc.15.1682760444501;
        Sat, 29 Apr 2023 02:27:24 -0700 (PDT)
Message-ID: <6de9bb09b395ae15316a6c7fc523d72d8570c5ef.camel@gmail.com>
Subject: Re: [XEN] xen/riscv: Updated the license header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Cc: bobbyeshleman@gmail.com, alistair.francis@wdc.com, connojdavis@gmail.com
Date: Sat, 29 Apr 2023 12:27:23 +0300
In-Reply-To: <20230428180952.22708-1-ayan.kumar.halder@amd.com>
References: <20230428180952.22708-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

Hi Ayan,

On Fri, 2023-04-28 at 19:09 +0100, Ayan Kumar Halder wrote:
> Updated the license header in a separate comment of its own.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>=20
> This was highlighted in the following review -
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg141930.htm=
l
>=20
> =C2=A0xen/arch/riscv/include/asm/csr.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> =C2=A0xen/arch/riscv/include/asm/riscv_encoding.h | 3 +--
> =C2=A02 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/riscv/include/asm/csr.h
> b/xen/arch/riscv/include/asm/csr.h
> index 8215562343..be57dcce1c 100644
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -1,6 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0/*
> - * SPDX-License-Identifier: GPL-2.0-only
> - *
> =C2=A0 * Copyright (C) 2015 Regents of the University of California
> =C2=A0 */
> =C2=A0
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h
> b/xen/arch/riscv/include/asm/riscv_encoding.h
> index 43dd4f6981..58abe5eccc 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -1,6 +1,5 @@
> +/* SPDX-License-Identifier: BSD-2-Clause */
> =C2=A0/*
> - * SPDX-License-Identifier: BSD-2-Clause
> - *
> =C2=A0 * Copyright (c) 2019 Western Digital Corporation or its affiliates=
.
> =C2=A0 *
> =C2=A0 * Authors:

Looks fine to me.

I'll do my best to stick to what was mentioned here:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg141930.html

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

