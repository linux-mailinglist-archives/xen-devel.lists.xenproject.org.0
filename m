Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748287444BE
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 00:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557641.871171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMPH-0007jM-V1; Fri, 30 Jun 2023 22:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557641.871171; Fri, 30 Jun 2023 22:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFMPH-0007gu-Rt; Fri, 30 Jun 2023 22:15:59 +0000
Received: by outflank-mailman (input) for mailman id 557641;
 Fri, 30 Jun 2023 22:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDqp=CS=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qFMPG-0007gl-RO
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 22:15:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af1477de-1793-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 00:15:56 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so2780354a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 15:15:56 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-063-194.89.12.pool.telefonica.de.
 [89.12.63.194]) by smtp.gmail.com with ESMTPSA id
 e13-20020a50fb8d000000b0051d80d7a95bsm7012099edq.14.2023.06.30.15.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 15:15:54 -0700 (PDT)
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
X-Inumbo-ID: af1477de-1793-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688163355; x=1690755355;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhY4C5ZJRIijV3cIrjXpWAgQASRDI4B2VavHCpYmPB8=;
        b=M66Y8n3c5PBxCGpMSo4iaQl7x/9p03Qe8YKlCL7sjhjJiKMNgJFQU08+25pwfPEgtE
         61XyQBRIckB+XNuWqjM8GVuy8e7UTrqMG2rRBIyanbWcflivubIw26Gil4ZLqJGCoiBz
         zFI86tNBpbXBaubfXrMXPOB2DjemjSw+ZO3GiBokVsB1GQPurcpedSH3pAe4SmHBGfdi
         320EOSGlvu0lbVV2r3rMneh4F330B/zaY6Eq+1D5pZ4s+wz3NgAScCkzBlje2hHShkFx
         rIhTymtuZ4vADVgUjVJMZQQ5q5GRpS0r2fOwAYWw+PzOokpfauqVLrs5nT7Gq4AIyXvN
         aqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688163355; x=1690755355;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhY4C5ZJRIijV3cIrjXpWAgQASRDI4B2VavHCpYmPB8=;
        b=LUm/wQ5nHzv+ZcYjtYgkCCDpU132RnMfPwshli5x4YD6pyRhOZH3A82r4NlgMm3qwN
         Bd7E3cKpMN0+6kdfvfGY1YDCBzGrOoC3BVPnH0Jsyw1v3PHeClUNsNMimoBffrU+UDvU
         Izf+RNbxT2LVSXx+Nq5v2n4HYkB6Svz0dEytjkyOD3W7jb2VlkX6+SO/A2UqMOGUNxr/
         d4aUg1ZNUqZPgIz8++jQp9svweCvlGguMXWE7pFdHNoxGhAlJaGPenorxUaFo++P6IvH
         VG7YKrXvNEkoPuj0o9sC6mNOVLs86exZhRg5Up+Bh7L4DbVa86Df+cnP0SfnF2qq0iiq
         rIjg==
X-Gm-Message-State: ABy/qLbRpSdaI5dcHrejvTLrMe2/ZtFB0KGiJMTsPxhARo9Ykf1BMq8r
	UVhlLa1+ESuFc76e1aABs7U=
X-Google-Smtp-Source: APBJJlE6VPs33xp/N2N5bZ0za/J9ybzkK8/WVyZkxJ5BocgkkNrAJuSEnOUZU57Mk3FP+UZjXUzcpA==
X-Received: by 2002:aa7:d390:0:b0:51d:9b4d:66bd with SMTP id x16-20020aa7d390000000b0051d9b4d66bdmr2611559edq.9.1688163355371;
        Fri, 30 Jun 2023 15:15:55 -0700 (PDT)
Date: Fri, 30 Jun 2023 22:15:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <20230630133242.58e6d9ed.olaf@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com> <20230627140740.2736f6e8.olaf@aepfle.de> <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com> <20230630092921.392b302d.olaf@aepfle.de> <367317C5-DB65-40EF-B45B-97E0E802A994@gmail.com> <20230630133242.58e6d9ed.olaf@aepfle.de>
Message-ID: <EEF26EF5-F7EF-4F61-BB32-DEBC2C68E5A1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 30=2E Juni 2023 11:32:42 UTC schrieb Olaf Hering <olaf@aepfle=2Ede>:
>Fri, 30 Jun 2023 08:05:29 +0000 Bernhard Beschow <shentey@gmail=2Ecom>:
>
>> Yes=2E Have a look for piix3/piix4 here: https://www=2Eintel=2Ecom/desi=
gn/archives/chipsets/440/index=2Ehtm
>
>This is hidden behind a login or whatever=2E

None of the links ask annoying questions in my case=2E

Best regards,
Bernhard

>
>I should be able to come up with a commit message without hardware specs =
being available=2E
>
>
>Olaf

