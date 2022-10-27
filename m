Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8B60F2AF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 10:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430936.683250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyS2-0001af-NR; Thu, 27 Oct 2022 08:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430936.683250; Thu, 27 Oct 2022 08:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyS2-0001YS-Kb; Thu, 27 Oct 2022 08:41:22 +0000
Received: by outflank-mailman (input) for mailman id 430936;
 Thu, 27 Oct 2022 08:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onyS0-0001YE-Lk
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:41:20 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20db39d9-55d3-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 10:41:19 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id j15so989869wrq.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 01:41:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d43d0000000b00236733f0f98sm524419wrr.107.2022.10.27.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:41:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61DFE1FFB7;
 Thu, 27 Oct 2022 09:41:18 +0100 (BST)
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
X-Inumbo-ID: 20db39d9-55d3-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciO9wzqDJBohEQ8HfojpLhNd+QMTSlu+YI/hytMwZ1w=;
        b=v0mfmniZbpC86gyjj1j07A1k6oA7cmZVznvQ8L6eMMYweqS64J9MxRroVRX6sC6Rna
         RB2HBJ+2hFZAM3XUBxk46pPy6DgNre5qZAm5n60d+ZGoPeT06fFE0pCrAN2Mwypy7A0y
         ULufsH0Efl5YYtPwDt3rTMEW8qJ6Hrz+gPopoTbFrKGx4V4jks1cTjoMlX7aADaNTC/m
         b7vkfRpl2hOtjynlFt9aPjV8fSPrkIY3uzc8/Ed8fihn/px6Ue8u84fjPqLhMkJWEsQU
         C5VYQpmSLBypHTZUeVfDuZUe0B1KVIVmvB78f18RVPTc5N6lhKfPFGbjVm4FPqZPWh5D
         ntfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ciO9wzqDJBohEQ8HfojpLhNd+QMTSlu+YI/hytMwZ1w=;
        b=3/I+ERsYLYEfbONasNA96/QKWEGr6++i0uVr9kCXFLvacjOWkpDNylvLvcj1dxZzoe
         T0SZ6794XP0DND5LYrgm8QX6vQH4DBzHXHD2D1ixIttyNbbs5kYP7ayCatb/a7RmERJ5
         lxRev8hEciiS6KMmmJOAAr/uSklBNWjZNaH7Y0kHBNJ2vs3xNB9yV6IdhMZcMN79LrpT
         wN5tABv3q3cLxaeHpumEYiU/MbQLG7uY6Fc3D+RvtdvjltAWglhcvhjAllMdN1cNjeTg
         pqBsAeqSQ134EoXtVDVANuxbJBftVQcjd+Dh26CWioTI+r4VY630/BuSmgkdXTXyHPoF
         Fe2w==
X-Gm-Message-State: ACrzQf1gkg7yPy9qCG4On+QiCeiDqqwrfWMj5yzAg9HKYfpMrDq0zY5y
	RGCQBHlgg31bxxmfuVdeiHbfHg==
X-Google-Smtp-Source: AMsMyM638r8gzQZMR8CORrK9O03zbBgnd6gqJhp7ycsjV8TfmSVTN7UJj+OFIHVG8gJkH2fYp2m0xA==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id l15-20020a056000022f00b002364f8ea913mr22270263wrz.240.1666860079283;
        Thu, 27 Oct 2022 01:41:19 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:40:20 +0100
In-reply-to: <20221015050750.4185-11-vikram.garhwal@amd.com>
Message-ID: <87fsf93bgx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
<snip>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
<snip>
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    mc->desc =3D "Xen Para-virtualized PC";
> +    mc->init =3D xen_arm_init;
> +    mc->max_cpus =3D 1;
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);

This needs #ifdef CONFIG_TPM because while doing --disable-tpm to try
and get the cross build working it then fails with:

../../hw/arm/xen_arm.c: In function =E2=80=98xen_arm_machine_class_init=E2=
=80=99:
../../hw/arm/xen_arm.c:148:48: error: =E2=80=98TYPE_TPM_TIS_SYSBUS=E2=80=99=
 undeclared (first use in this function)
  148 |     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
      |                                                ^~~~~~~~~~~~~~~~~~~
../../hw/arm/xen_arm.c:148:48: note: each undeclared identifier is reported=
 only once for each function it appears in

--=20
Alex Benn=C3=A9e

