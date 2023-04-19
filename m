Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6616E81EE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 21:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523763.814111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppDWs-0001tE-4I; Wed, 19 Apr 2023 19:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523763.814111; Wed, 19 Apr 2023 19:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppDWs-0001qI-0s; Wed, 19 Apr 2023 19:31:46 +0000
Received: by outflank-mailman (input) for mailman id 523763;
 Wed, 19 Apr 2023 19:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGcS=AK=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1ppDWq-0001qC-As
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 19:31:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07953ae-dee8-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 21:31:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id b16so1098771ejz.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 12:31:43 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-003-214.77.183.pool.telefonica.de.
 [77.183.3.214]) by smtp.gmail.com with ESMTPSA id
 hr33-20020a1709073fa100b0094f71c73d35sm4932629ejc.145.2023.04.19.12.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 12:31:41 -0700 (PDT)
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
X-Inumbo-ID: d07953ae-dee8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681932702; x=1684524702;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX+LAQk2HqYVss/aZUAQt/9OzhHNeQrU+BnfsGMovN4=;
        b=HxeWSwrMem+6qghIookMXWlSJMAxjoDLmGG2GFJ4sX2M70DvIpn9jZjQPx4ptIIxHy
         JmQgrxda+zuIdlWSFeW5CzUy+AEh4V+rhqBW6fXk0Ng94j5qHSe7nHwfidHQ+4Z+K3k4
         LcHCpVHBTgZ9fWdaCPnzJSw54v3OHnr/KAp3iY1M3WCY42W84ajtX9HnvdSBqUQXUUr2
         qOihFZtssVs8/nIkAbpvur0rhT3qdLSq5NeiiA2UHZtQ6oi/+/o8rlDUADUlGV3nIEu5
         xeBr2DAJYPj5MsXct4m79D2ehSRFukE0URKHnXzYUy94z0FVMXd0bii8/grxLFp7YkPo
         LlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681932702; x=1684524702;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX+LAQk2HqYVss/aZUAQt/9OzhHNeQrU+BnfsGMovN4=;
        b=guXRyFGRMtWUhxPrsjnhj7tcACuqOBP9++7bpix6qa2JyHylx2p7J6kQ7kPlo9WUy6
         2kZYbJvSY+ji5rhNiY3os80RPoxNEkh2jNVngxKkpc4F3LPMXQkaTgzuTUZN9d4QNlIp
         7yJTBogM0s8PofYoIBc4CRkFLAQuFsa6HLtYKtl22Qm/X1UmpyszbgivI1uR+kwpw1kq
         vTgwXi4SxZSc7iaesDHkL5w1qk/ItsNpUUblW6PwMHur9ErF+/eYrRaOfKjbrTVq8a92
         WLhulMUqpkYRuJNTmqgYcv3GAgqZ58mRYFMiPyY29HmiSCHXZ2iXABAzV1Onxo3wzWVo
         J6aQ==
X-Gm-Message-State: AAQBX9cnAxY8upGvUirmjIbxHocRdkPzlgyZXNBdIZcfKR5B4Yzw8lw6
	1oVaeSoEOrMceJ25cbIbJ9U=
X-Google-Smtp-Source: AKy350aKGpFJubkKktMayOWdACPXwfPdtTZaagCkoJdP4zKiUQ+blYrEZa3km7cNMrFTvwaUujLZMA==
X-Received: by 2002:a17:906:82c1:b0:953:8322:a99f with SMTP id a1-20020a17090682c100b009538322a99fmr293399ejy.0.1681932702210;
        Wed, 19 Apr 2023 12:31:42 -0700 (PDT)
Date: Wed, 19 Apr 2023 19:31:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_2/7=5D_hw/pci/pci=2Ec=3A_Don=27t_l?= =?US-ASCII?Q?eak_PCIBus=3A=3Airq=5Fcount=5B=5D_in_pci=5Fbus=5Firqs=28=29?=
In-Reply-To: <20230403074124.3925-3-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com> <20230403074124.3925-3-shentey@gmail.com>
Message-ID: <C82C3BC0-E328-4AE8-B182-ADACF3E34A45@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 3=2E April 2023 07:41:19 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>When calling pci_bus_irqs() multiple times on the same object without cal=
ling
>pci_bus_irqs_cleanup() in between PCIBus::irq_count[] is currently leaked=
=2E
>Let's fix this because Xen will do just that in a few commits, and becaus=
e
>calling pci_bus_irqs_cleanup() in between seems fragile and cumbersome=2E
>
>Note that pci_bus_irqs_cleanup() now has to NULL irq_count such that
>pci_bus_irqs() doesn't do a double free=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Ping PCI maintainers

>---
> hw/pci/pci=2Ec | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/hw/pci/pci=2Ec b/hw/pci/pci=2Ec
>index def5000e7b=2E=2Ebe1c5d16ec 100644
>--- a/hw/pci/pci=2Ec
>+++ b/hw/pci/pci=2Ec
>@@ -558,6 +558,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq=
,
>     bus->set_irq =3D set_irq;
>     bus->irq_opaque =3D irq_opaque;
>     bus->nirq =3D nirq;
>+    g_free(bus->irq_count);
>     bus->irq_count =3D g_malloc0(nirq * sizeof(bus->irq_count[0]));
> }
>=20
>@@ -573,6 +574,7 @@ void pci_bus_irqs_cleanup(PCIBus *bus)
>     bus->irq_opaque =3D NULL;
>     bus->nirq =3D 0;
>     g_free(bus->irq_count);
>+    bus->irq_count =3D NULL;
> }
>=20
> PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,

