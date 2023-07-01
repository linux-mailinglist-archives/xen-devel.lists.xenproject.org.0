Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAFA74484F
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 11:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557838.871529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFXIF-0005ZP-0U; Sat, 01 Jul 2023 09:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557838.871529; Sat, 01 Jul 2023 09:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFXIE-0005Xj-Tl; Sat, 01 Jul 2023 09:53:26 +0000
Received: by outflank-mailman (input) for mailman id 557838;
 Sat, 01 Jul 2023 09:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=idbm=CT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qFXID-0005Xd-NI
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 09:53:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df6f974-17f5-11ee-8611-37d641c3527e;
 Sat, 01 Jul 2023 11:53:23 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51d9bf5411aso2849494a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 02:53:23 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-173-083.89.12.pool.telefonica.de.
 [89.12.173.83]) by smtp.gmail.com with ESMTPSA id
 v9-20020aa7cd49000000b005187a42b44fsm7606875edw.58.2023.07.01.02.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 02:53:22 -0700 (PDT)
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
X-Inumbo-ID: 1df6f974-17f5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688205203; x=1690797203;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6qzh5zT5TRYd5Sip4g9abjelR/5v1OLZh8dWj8GBAE=;
        b=g1lntXpKHUXhdYIGb1g2NFGLAg9i2q1sGxEt/vbVZeLtWuht/fvm9vwV1MLjKUwjkU
         oBauakppnvcoYODDuxCIFDW27tsbkAmV97KExEJ+esKI9lF0NATFWtezMBCCNDDlwLLS
         uxWFI19OAoe8qiLMwJeTqSnkpi8JvTrAXTtN5Wez5YTPfIArk8mIm/F1S4SngQLnG2DU
         HBThsEgZCVfXdPnf00KvUAYFQG2kX0p/T5O+vC1t3jjiSjsDhLEKKZ4hFnwrUOhhaH8b
         O2AZns8c6R5KXJIvqnEfC5tTTupGkpy8hJ1iWkxzQ//Y/RuyaV+JheQxKwn+2WL1126u
         9yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688205203; x=1690797203;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6qzh5zT5TRYd5Sip4g9abjelR/5v1OLZh8dWj8GBAE=;
        b=gd1T4CQcl18AHqR10qM0gtZHMrTN3pg1TXc01htETFenTp19OsL2Cc8yi6cT7AE4pX
         DpfUGfkrc//t4L56C32s9773q0MqEEXs1CJtwDcp1MVZjeDRPziY6ZOlsLeNGTnsN1ES
         1d9O49ayIaDedUw2fybvWTE1qXk3S5GB4wap/osBiAl94BoQlgbgs/9LdUbO+xtG5vx0
         kj06ghd+e4NKyXrMlO5sLrRuOzsxSeKH9LlPqohNRtxTqbyKp3XdCH407n8IhgEkB6OY
         poyBR2xPgRMC52fyCAzB4YTafSX22XZGAeCYH/yl2OeE2PDh3wcULXq5NmzSEn7LCg7A
         PKJQ==
X-Gm-Message-State: AC+VfDyRcaHA7egay8FBkI0HmtHj+JY+SDvNY1EDSNjxeYoDn2tjcnaF
	zTRZFra/C3TIyvQ3AWq/FPMvqUBG71k=
X-Google-Smtp-Source: APBJJlHaXRaHawJGh8EcQEbPNbdz3SpEWVXwBe9z3waKnvOCHY7coyJ32yStWcR97XEgIaTVX5NGgQ==
X-Received: by 2002:a17:906:b7c8:b0:984:bd75:6a3 with SMTP id fy8-20020a170906b7c800b00984bd7506a3mr3527933ejb.58.1688205202474;
        Sat, 01 Jul 2023 02:53:22 -0700 (PDT)
Date: Sat, 01 Jul 2023 09:53:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
CC: Olaf Hering <olaf@aepfle.de>, qemu-devel <qemu-devel@nongnu.org>,
 John Snow <jsnow@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <CABgObfamZEHv0W3B6kPXGTiT1f2G__S=Bi1-_PYeSomsiVFaFg@mail.gmail.com>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com> <20230627140740.2736f6e8.olaf@aepfle.de> <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com> <CABgObfamZEHv0W3B6kPXGTiT1f2G__S=Bi1-_PYeSomsiVFaFg@mail.gmail.com>
Message-ID: <3987B0DB-46F2-49F1-AEA5-B88BC61A633F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 30=2E Juni 2023 08:48:02 UTC schrieb Paolo Bonzini <pbonzini@redhat=2Ec=
om>:
>Il mer 28 giu 2023, 13:28 Bernhard Beschow <shentey@gmail=2Ecom> ha scrit=
to:
>
>>
>>
>> Am 27=2E Juni 2023 12:07:40 UTC schrieb Olaf Hering <olaf@aepfle=2Ede>:
>> >Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail=2Ecom>=
:
>> >
>> >> The BAR is a 32 bit register whose default value is 0x00000001=2E I =
think
>> what's supposed to happen here is a pci_set_long() rather than a
>> pci_set_byte()=2E
>> >
>> >Indeed, the u32 at that address changes from c121 to c101 with the
>> current code=2E
>>
>> Neat! Would you mind sending a patch fixing the BMIBA register to be re=
set
>> as 32 bit?
>>
>
>I think we should also check why writing the command register is not
>disabling the BAR as well=2E

So IIUC the BMIBA register is managed internally by QEMU's PCI code and we=
 shouldn't have to mess with the register at all=2E We should actually remo=
ve the explicit reset of BMIBA, correct?

I've tried debugging the PCI code when working on the VIA IDE controller t=
o understand it better=2E But despite QEMU being compiled with --enable-deb=
ug it seemd to be compiled with -O2 still, making debugging quite hard=2E I=
'm not sure if any compile flags leak into my build environment though=2E

Best regards,
Bernhard=20
>
>Paolo
>
>
>> Best regards,
>> Bernhard
>> >
>> >Olaf
>>
>>

