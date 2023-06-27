Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8D73FACF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 13:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556075.868319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6bV-0007U3-2G; Tue, 27 Jun 2023 11:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556075.868319; Tue, 27 Jun 2023 11:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6bU-0007RQ-VT; Tue, 27 Jun 2023 11:11:24 +0000
Received: by outflank-mailman (input) for mailman id 556075;
 Tue, 27 Jun 2023 11:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l5D/=CP=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qE6bT-00078S-TB
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 11:11:23 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59cac562-14db-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 13:11:23 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so4089192e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 04:11:23 -0700 (PDT)
Received: from [127.0.0.1] ([90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003faabd8fcb8sm4411668wmi.46.2023.06.27.04.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 04:11:21 -0700 (PDT)
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
X-Inumbo-ID: 59cac562-14db-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864283; x=1690456283;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuduRVloJOVw7jW4g3I3eFfyX2ilk9akjT9KLl191qk=;
        b=TDoACJzckX9CCQtr3x+2iKY1Wpf9JPbZr9Tmac61Yrls/8jq1PEuy/0e16W9lYfBKt
         CX5uC1mt/uFzHpuLVDMX+61rxme4sPuE0PAaqkupSSyHq8aB9MClZQozkwR7L5EGQWEy
         Lbcr+F6YnU2wYx59+jPuZ3eXVie2PXbUGFqCRhU/xSPmq1lSAOpAlAgnVtE/DeH70WAU
         /xZGKCB9ZoLyyTdaKN/r8RwdrnBXuWjsXO1E0D5MHjNGYFjz1E4MIzxHi7PLFTd+tnQ8
         iiHhNj44gPCUuQhFqEMr6iuOnpfzFDMq+/BRXnNnHFXgYCWTOxhKQrl9Haq8lcEdTA6s
         hypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864283; x=1690456283;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuduRVloJOVw7jW4g3I3eFfyX2ilk9akjT9KLl191qk=;
        b=GB0bK3I8A9Bcbr3Hk6hdXYm0+MTNSPFU6QJ1aC66h3C/V1ef8cv1vUUwp0H2HvvpFr
         9HA5zKJryMOAOp4kpPpZ7av2RPhdf1dj8bYNoyOId89XF0wsuGjRmoljBrp/qVzQJFJd
         geYTjSQCfa5omRKBP/Q1YvPw6lQNynZn3U8zMB7pVzSSqLSE3dbBXQPGh8VFBOzo8YUm
         w0uqgOQGNLB+5A0xx0ow7EKpACtE5oYc36pd3h2GCv3EgAJH12IVSyktL+JJefyIS408
         0TSJteuszKs68wbgJHKVWAkURoaPQjZZmqzbSnN3EUh6oCfxY5h1govaOUgSGVFk6fOy
         kj7g==
X-Gm-Message-State: AC+VfDwnqgrE8pKf1FDVKE95j5KdGLBNgeAwtm1uI9nuqEkp4/S6xfD+
	ciY+sTsrLGdijH9GJ/keGws=
X-Google-Smtp-Source: ACHHUZ7J5RrJuR4cS5VYw9/2DPvrBv3doY3V0OY17oqYQcbyWh46th0VA2CJ3pt7g/atF7ipiMo3Fg==
X-Received: by 2002:a05:6512:2090:b0:4fb:893a:d322 with SMTP id t16-20020a056512209000b004fb893ad322mr428099lfr.68.1687864282417;
        Tue, 27 Jun 2023 04:11:22 -0700 (PDT)
Date: Tue, 27 Jun 2023 10:12:50 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Olaf Hering <olaf@aepfle.de>, John Snow <jsnow@redhat.com>
CC: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
Message-ID: <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 27=2E Juni 2023 07:11:33 UTC schrieb Paolo Bonzini <pbonzini@redhat=2Ec=
om>:
>On 6/26/23 23:19, Olaf Hering wrote:
>> I need advice on how to debug this=2E
>>=20
>> One thing that stands out is uhci_irq()=2E
>> It reads a u16 from the USBSTS register=2E
>>=20
>> On the qemu side, this read is served from bmdma_read=2E Since the read
>> size is 2, the result is ~0, and uhci_irq() turns the controller off=2E
>> In other words, memory_region_ops_read from addr=3D0xc102 is served fro=
m "piix-bmdma"
>>=20
>> If the pci_set_word calls in piix_ide_reset are skipped, the read is
>> served from uhci_port_write=2E This is the expected behavior=2E
>> In other words, memory_region_ops_read from addr=3D0xc102 is served fro=
m "uhci"=2E
>
>I think what's happening is that
>
>    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>
>is setting the BAR to 0xC100, therefore overlapping the UHCI device's reg=
ion=2E  In principle this line shouldn't be necessary at all though; it's e=
nough to clear the COMMAND register=2E

Interesting=2E The BAR is a 32 bit register whose default value is 0x00000=
001=2E I think what's supposed to happen here is a pci_set_long() rather th=
an a pci_set_byte()=2E

Bits 4=2E=2E15 represent the BAR address, and pci_set_byte() only clears b=
its 4=2E=2E7, leaving bits 8=2E=2E15 unchanged=2E Perhaps this causes the B=
AR to be moved into the UHCI region? Does changing the call to pci_set_long=
() fix the problem?

Best regards,
Bernhard

>
>Can you check the value of the COMMAND register (pci_conf + 0x04, 16 bits=
, little endian)?  Something might be causing the register to be set back t=
o a nonzero value, therefore re-enabling the I/O at the address that overla=
ps the UHCI device=2E
>
>Paolo
>
>

