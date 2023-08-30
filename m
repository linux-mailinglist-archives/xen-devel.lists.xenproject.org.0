Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C278D7B7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 18:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593170.926105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOUm-0002gz-GQ; Wed, 30 Aug 2023 16:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593170.926105; Wed, 30 Aug 2023 16:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOUm-0002eH-DG; Wed, 30 Aug 2023 16:56:44 +0000
Received: by outflank-mailman (input) for mailman id 593170;
 Wed, 30 Aug 2023 16:56:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6gQ=EP=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qbOUl-0002eB-Ec
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 16:56:43 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309c0c3f-4756-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 18:56:40 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-307d20548adso4931116f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 09:56:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05600c2a4e00b003fed70fb09dsm2797536wme.26.2023.08.30.09.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 09:56:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09DFB1FFBB;
 Wed, 30 Aug 2023 17:56:39 +0100 (BST)
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
X-Inumbo-ID: 309c0c3f-4756-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693414600; x=1694019400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:user-agent:from:to:cc:subject:date:message-id:reply-to;
        bh=k1Xb31+XM7zyf4p96PIo9CJeeb1rikbvP4JHVrcSM/U=;
        b=vXrdcVGoawYtV0sS1kQMveUCkMocu24LkkZzHbcCv0O1TSFpoOvs8zFAgyl0neNHkb
         yaGVNnc/OhiP0mCU2Cmq9zxuCJgQCK4RZmTAXlGvgexOxkPTHECbz8+6pkInqhGqTCF9
         acrPQNO4WIsuPrVn9MOLuEDrGp2T3ylh9UJ+pjShKJd22OUp4YKYZjzsL1HFZaXjTH7s
         K3rAl2G7JSqv/BDozKZAyF5DHmRggk9Ep7q7+TGy9u2Ay520P9aYEPkiM3XQVP8gJhs5
         kcbBGKz1Iwgs3+A7KbCO8WajR9r+pPaQYL9B4BVxyoPj54/52qLX56u2CcrTNgGgVvJS
         KB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414600; x=1694019400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:user-agent:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1Xb31+XM7zyf4p96PIo9CJeeb1rikbvP4JHVrcSM/U=;
        b=XjVHNInDaARnv0exXw0Y+lIMuGN4/WMznSEkvsrVy41JVEtuveeJmc8kjCRyL56WNU
         ziUELhYK8voy6B9wo17ddNsvn0s6qxJOTsyRHwMjRCvQRARHNiDYD6xkHUOZcBQTNW0u
         CAv52ZS0t02KHZBX//LdsyNUlr6dhcdU5kLz5xMV8RHwT4FYtivifqeOXhJKJLksLT2R
         W9CIhFA7trMz76B9mjZTDVXHB1N717iEHq/NR+nBhqzbG7x2oXB1YfjrvuK6zSODRc7J
         xLivqwcXGwnn8JY6TLgP6m/DUbn3py9M/FVlXUqGSyVcBp2t/qQ4Xfex6/041PQXbeb8
         BODw==
X-Gm-Message-State: AOJu0Ywj9YxWL614O4WCwlrcwcvLndfUdvyU5kPXsrFsX/UXQlvu2R85
	gZGt3Zm04KkBIG+LoFghRfwDFw==
X-Google-Smtp-Source: AGHT+IHGgTVU+REc/aEIU4qFjHGblxDqda4AQyqsdIdkvvPCfEUq+PlwvQDCu10lcyi+JsaaB31q1A==
X-Received: by 2002:a5d:6108:0:b0:317:7eec:5e9d with SMTP id v8-20020a5d6108000000b003177eec5e9dmr2314014wrt.16.1693414599909;
        Wed, 30 Aug 2023 09:56:39 -0700 (PDT)
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Xen-devel <xen-devel@lists.xenproject.org>, Stewart Hildebrand
 <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik
 <Sergiy_Kibrik@epam.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Vikram Garhwal
 <vikram.garhwal@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: QEMU features useful for Xen development?
Date: Wed, 30 Aug 2023 17:11:02 +0100
Message-ID: <87y1hspiyh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Dear Xen community,

Linaro is significantly invested in QEMU development, with a special
focus on Arm-related aspects. We recognize the value of QEMU as a
readily available software reference platform for projects that need to
test their software well before the availability of real hardware.

The primary focus of our effort is on adding core architectural elements
to the CPU emulation. For an overview of the current feature set, please
see:

  https://qemu.readthedocs.io/en/master/system/arm/emulation.html

Besides the -cpu max, providing an approximation of a v9.0 baseline CPU,
we have also recently added several specific CPU types like the
Neoverse-N1 and V1 processor types as well as numerous Cortex CPU
models.

Our most utilized machine model is "virt", which is primarily designed
for guest operation and therefore has minimal resemblance to actual
hardware. "sbsa-ref" was implemented to more closely simulate a real
machine that aligns with Arm's SBSA specification.

In our work on VirtIO, we often use QEMU. Most of our rust-vmm
vhost-device backends, for instance, were initially tested on QEMU.

Now that everyone is up-to-date, I would welcome any feedback from the
Xen community on features that would increase QEMU's usefulness as a
development target.

Do you have interest in any upcoming Arm CPU features? For example, we
recently added FEAT_RME support for Arm's new confidential computing,
but currently do not implement FEAT_NV/NV2.

How about the HW emulation in QEMU? Is the PCI emulation reliable enough
to ensure confidence while testing changes to Xen's PCI management? What
about the few peripherals that the hypervisor accesses directly?

Are there other development features you consider essential? Have you
noticed any limitations with gdbstub? Does anyone use the record/replay
or reverse debug functions? Has anyone tried TCG plugins for analysing
the behavior of the hypervisor?

While I cannot promise to implement every wish-list item (performance
counter emulation, for example, as we are not a uArch simulator), I am
eager to gather feedback on how QEMU could be improved to help the Xen
community deliver it's roadmap faster.

Thank you for your time and I look forward to any feedback :-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

