Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652CF82D07E
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jan 2024 13:23:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667113.1038136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOzVE-00009j-3p; Sun, 14 Jan 2024 12:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667113.1038136; Sun, 14 Jan 2024 12:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOzVE-000075-12; Sun, 14 Jan 2024 12:22:12 +0000
Received: by outflank-mailman (input) for mailman id 667113;
 Sun, 14 Jan 2024 12:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rPIO=IY=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rOzVC-00006z-NU
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2024 12:22:10 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8944d22d-b2d7-11ee-9b0f-b553b5be7939;
 Sun, 14 Jan 2024 13:22:08 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50eaaf2c7deso8800177e87.2
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jan 2024 04:22:08 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-249-018.77.183.pool.telefonica.de.
 [77.183.249.18]) by smtp.gmail.com with ESMTPSA id
 d14-20020a170906c20e00b00a298e2f6b3csm3998496ejz.213.2024.01.14.04.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jan 2024 04:22:06 -0800 (PST)
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
X-Inumbo-ID: 8944d22d-b2d7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705234928; x=1705839728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4WLy0Jn5L0bRVN3nquFYC5ivaTwn2STN2BPox24LN8=;
        b=kvm6ZrrK7SJK4IQwSP14cWbXYv76LwQK6i1802bREt6NrJOAy9J0g2WvLZFB/2hvTS
         Nk9tqMusG1/QBJoMqoYvTBuJBXeDRswhlrffA/QxgN0zUJvrm2uJcCPOv4Yj79LHYEqr
         335aYewkojUwys+4AKWL1KjNogjt6qczH/voLzPrXe45SgixU2TJtoMZIf8FQ9lBzqTh
         O/Y/qGYsic2fXE4IHKeWJ6hLy3aNKkpS7XJ6+eM486gNuSIcPi9Viy5DZfZJlqOVuohc
         m81hqkY7/cxBw+655DA19aLSFne8CSEXyrSTX8nUgh+3QTSSiainJozasyC2h0cKHNiX
         KvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705234928; x=1705839728;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4WLy0Jn5L0bRVN3nquFYC5ivaTwn2STN2BPox24LN8=;
        b=ZviKduUr37Ymy0+49FB4IubJS2uyhqAfO7Koo6n6MCFGftDnaezITBb8g2X59LgLlk
         VVB6M+zh/4nIkiv258HmN8HA1NEWZIEDRspyxigLTYd6XMo6Ni50NHGubdiP7tCeLDbO
         fmVVi1ruOWCwtH5E/zm9S6oKZRVnoFGwRB5DSeuLMD/Y/3bOs4zAyMJ+8XnLdrvZqHn6
         i8o6dMohXscfi5ti/OJtCKpWrUljSKzhY57hI/zkUAzJuk0wUDPo5xlWhYCn6iBx8fhd
         we5uO1irbnwXDTzN/98gfWhSKslLU4KzUjPkGGtPpkWJoGYLn9/Q26Auld8JOdCM3Wcs
         ys9g==
X-Gm-Message-State: AOJu0YxkuTjRmlPqbyht/PE9/02UHEfB1Ejhuv8w20x1jSy0FhRsDjlo
	6p1IpUqgFKjqv6Y5gVeaO8E=
X-Google-Smtp-Source: AGHT+IGffXqbfcTbgvg/M/WX4Vodo0S9K719nbuFypYeXJPw/acIGJ2/C85yJ2piMEImH0Z207xfCg==
X-Received: by 2002:a05:6512:39d5:b0:50e:aa46:2a95 with SMTP id k21-20020a05651239d500b0050eaa462a95mr2216499lfu.18.1705234927908;
        Sun, 14 Jan 2024 04:22:07 -0800 (PST)
Date: Sun, 14 Jan 2024 12:21:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Chuck Zmudzinski <brchuckz@aol.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_hw/i386/pc=5Fpiix=3A_Make_piix=5Fintx=5Fr?= =?US-ASCII?Q?outing=5Fnotifier=5Fxen=28=29_more_device_independent?=
In-Reply-To: <20240107231623.5282-1-shentey@gmail.com>
References: <20240107231623.5282-1-shentey@gmail.com>
Message-ID: <B404ABCE-E6B5-4716-BA60-3CEE74B72701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 7=2E Januar 2024 23:16:23 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-speci=
fic
>variant of piix3_write_config()" which introduced
>piix_intx_routing_notifier_xen()=2E This function is implemented in board=
 code but
>accesses the PCI configuration space of the PIIX ISA function to determin=
e the
>PCI interrupt routes=2E Avoid this by reusing pci_device_route_intx_to_ir=
q() which
>makes piix_intx_routing_notifier_xen() more device-agnostic=2E
>
>One remaining improvement would be making piix_intx_routing_notifier_xen(=
)
>agnostic towards the number of PCI interrupt routes and move it to xen-hv=
m=2E
>This might be useful for possible Q35 Xen efforts but remains a future ex=
ercise
>for now=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Hi Michael,

could you tag this, too? Or do we need another R-b?

Best regards,
Bernhard

>---
> hw/i386/pc_piix=2Ec | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>
>diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>index 042c13cdbc=2E=2Eabfcfe4d2b 100644
>--- a/hw/i386/pc_piix=2Ec
>+++ b/hw/i386/pc_piix=2Ec
>@@ -92,13 +92,10 @@ static void piix_intx_routing_notifier_xen(PCIDevice =
*dev)
> {
>     int i;
>=20
>-    /* Scan for updates to PCI link routes (0x60-0x63)=2E */
>+    /* Scan for updates to PCI link routes=2E */
>     for (i =3D 0; i < PIIX_NUM_PIRQS; i++) {
>-        uint8_t v =3D dev->config_read(dev, PIIX_PIRQCA + i, 1);
>-        if (v & 0x80) {
>-            v =3D 0;
>-        }
>-        v &=3D 0xf;
>+        const PCIINTxRoute route =3D pci_device_route_intx_to_irq(dev, i=
);
>+        const uint8_t v =3D route=2Emode =3D=3D PCI_INTX_ENABLED ? route=
=2Eirq : 0;
>         xen_set_pci_link_route(i, v);
>     }
> }

