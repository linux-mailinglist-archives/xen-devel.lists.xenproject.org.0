Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF597B1BE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 17:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800006.1209931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqa4L-0003Ip-4h; Tue, 17 Sep 2024 15:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800006.1209931; Tue, 17 Sep 2024 15:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqa4L-0003Fe-1h; Tue, 17 Sep 2024 15:24:45 +0000
Received: by outflank-mailman (input) for mailman id 800006;
 Tue, 17 Sep 2024 15:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqa4J-0003FY-Jo
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 15:24:43 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5bb2d0b-7508-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 17:24:41 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f75c0b78fbso61444691fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 08:24:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d3267e3sm10526801fa.68.2024.09.17.08.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 08:24:40 -0700 (PDT)
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
X-Inumbo-ID: f5bb2d0b-7508-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726586681; x=1727191481; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UuKdODiYRyV/g4K7J9UfrKhcZsjjaemzBhi1yPpAqxc=;
        b=WF+IGT0hKLo2J+wmocEDi737pYSsYTrco4uRzcoo/z+AN+rVsFAD9pysvSn8ymfJWH
         MCup+KY92Y9GaiRVPKWXzC2ePA8Rsqw8cTgxfZWeGWLlOVNpqvsRA6AWYiQEJAHj4AzG
         PRjKMqr5pN8GmdUZ44VK7HQjy5M/DU896DXhK4BrQ4UhUcN1tMN7JUL6DQ9WIzDfNlDt
         lqUDCh9qzxTNh4Dw4rIZt5Zjro4QtdAKHD64wm9HfDgLt/Ym5rvGmQSkkD8PeXIgnzmQ
         /WpPGuv1lGYD8YQLqPKbPIDwoU5f5AtaNHXXNnhQofwycuZ3BucE9p3x9aXzIdo1KSHE
         tuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726586681; x=1727191481;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuKdODiYRyV/g4K7J9UfrKhcZsjjaemzBhi1yPpAqxc=;
        b=ZhIOtZ2CdCcJM+IODXBnJ9CmQFKxpEM2YkRpsSstmh7PjpJ7vtPyeH//fMo+np9Qe4
         Ps82ZVag7W5U4P9ykw9W8SYssfotvZqUrN9ah9jzVUEP7rmPfn75VvvwMo6uN+Z4WUoO
         miNPAiZA3F8eSuPtErUDi7zNznvGs34llEcl6WKCCYGOy8ei0K0ZMKBqvbCLT+ydYyG9
         sPljtJ48EdX5MC0yUWXc2Ad1pXWYkqGg8rLxwriBkAm6xy7aPiWftj7cxFNrMUfikuVN
         2FdVDkQtiltCB/7GaF17KQcySIkOmeKt8DY5gHkNj9+FnEmnYoBmDCN3ZV7xFD01IcpG
         ySJg==
X-Forwarded-Encrypted: i=1; AJvYcCU7j7NcUJr24iyz23ov33t6H4Q8JBLAraOXGuufhElWSoXPTc/7rDx1uQVX8e6lDnmmbD031Vos/1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxu+WWkiY4BoCkRU+JZl1wkssbsjSpwKqLpisClNwzqXFcrjKY2
	uFX+iYzqpfa5kwX/PHz77ylULn1KoyezH1PTDOaYfJyjhvH6Kitn
X-Google-Smtp-Source: AGHT+IE6i2qqpADFFSme+ZPWiFwQjQNxUJEQhTwI3D6pYnnRsRKXeWuhSbkeOg0ImfpMowB0gtmWjg==
X-Received: by 2002:a2e:a587:0:b0:2f7:5d73:92a3 with SMTP id 38308e7fff4ca-2f787edbc0dmr120338951fa.24.1726586680372;
        Tue, 17 Sep 2024 08:24:40 -0700 (PDT)
Message-ID: <61854b484b6076538dc36d8ede01a02a63d98c4b.camel@gmail.com>
Subject: Re: [PATCH v1 0/5] xen/arm: Add support for S32CC platforms and
 LINFlexD UART
From: oleksii.kurochko@gmail.com
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, 
	xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Date: Tue, 17 Sep 2024 17:24:39 +0200
In-Reply-To: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hello,

I think it would be a good idea to update the CHANGELOG.md as well and
mention that support for the S32CC platform has been added.

Thanks.

~ Oleksii
On Tue, 2024-09-10 at 17:34 +0300, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> This patch series adds support for NXP Automotive S32CC platform
> family, which includes S32G [0] and S32R [1].
>=20
> First patch adds the driver for the NXP LINFlexD UART, available
> on S32V, S32G and S32R automotive processors. The compatibles in
> the driver match the ones in upstream Linux [2]. The second patch
> adds early printk support via LINFlexD UART.
>=20
> The third patch introduces the S32CC platforms and adds the
> platform-specific code, which enables forwarding SCMI over SMC
> calls to software running at EL3. The fourth patch adds support
> for an early printk menuconfig option for S32CC platforms using
> the LINFlexD UART.
>=20
> The fifth patch enables the workaround for ARM Cortex-A53 erratum
> 1530924, already implemented in Xen for other cores via
> ARM64_WORKAROUND_AT_SPECULATE.
>=20
> [0]
> https://www.nxp.com/products/processors-and-microcontrollers/s32-automoti=
ve-platform/s32g-vehicle-network-processors:S32G-PROCESSORS
> [1]
> https://www.nxp.com/products/processors-and-microcontrollers/s32-automoti=
ve-platform/s32r-radar-processing:S32R-FAMILY
> [2]
> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/devicetre=
e/bindings/serial/fsl,s32-linflexuart.yaml#L27
>=20
> Andrei Cherechesu (5):
> =C2=A0 xen/arm: Add NXP LINFlexD UART Driver
> =C2=A0 xen/arm: Add NXP LINFlexD UART early printk support
> =C2=A0 xen/arm: platforms: Add NXP S32CC platform code
> =C2=A0 xen/arm: Enable early printk for S32CC via LINFlexD UART
> =C2=A0 xen/arm: Enable workaround for Cortex-A53 erratum #1530924
>=20
> =C2=A0docs/misc/arm/silicon-errata.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/arch/arm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 ++
> =C2=A0xen/arch/arm/arm64/debug-linflex.inc=C2=A0=C2=A0=C2=A0 |=C2=A0 58 +=
+++
> =C2=A0xen/arch/arm/cpuerrata.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0xen/arch/arm/include/asm/linflex-uart.h |=C2=A0 62 ++++
> =C2=A0xen/arch/arm/platforms/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +
> =C2=A0xen/arch/arm/platforms/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/arch/arm/platforms/s32cc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 84 ++++++
> =C2=A0xen/drivers/char/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> =C2=A0xen/drivers/char/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0xen/drivers/char/linflex-uart.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 365
> ++++++++++++++++++++++++
> =C2=A011 files changed, 614 insertions(+)
> =C2=A0create mode 100644 xen/arch/arm/arm64/debug-linflex.inc
> =C2=A0create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
> =C2=A0create mode 100644 xen/arch/arm/platforms/s32cc.c
> =C2=A0create mode 100644 xen/drivers/char/linflex-uart.c
>=20


