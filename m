Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07FA1D33F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877491.1287622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLLK-0004Y4-N6; Mon, 27 Jan 2025 09:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877491.1287622; Mon, 27 Jan 2025 09:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLLK-0004Vo-KU; Mon, 27 Jan 2025 09:23:42 +0000
Received: by outflank-mailman (input) for mailman id 877491;
 Mon, 27 Jan 2025 09:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wC6S=UT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tcLLJ-0004Vi-Pp
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:23:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64ed1d12-dc90-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 10:23:40 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso578109566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:23:39 -0800 (PST)
Received: from [127.0.0.1] (dynamic-093-128-047-181.93.128.pool.telefonica.de.
 [93.128.47.181]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e1373esm546856666b.1.2025.01.27.01.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 01:23:38 -0800 (PST)
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
X-Inumbo-ID: 64ed1d12-dc90-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737969819; x=1738574619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdp6qM5HkNGE6pm93Ya34vtciW0eBxcidQ8OmMD0mDI=;
        b=SJX1ksleR7jJSObs1g8YDIPno0rraN3TrOjuGrbblRm9JGQ3qiFhMRyHwGTY6QRx2j
         SarVq+OD7P8d25GCmAxhkiqzo8hzS/Y+BgHWo1h5jJsaIDN9QycwENpcpk+ugCOugYvN
         w1lH6dixBIKSTuLcsfnLnPVg+QnhsyqaR2RCRDJIZIzH7vuIK2ASTK+5AQywzfMW2Vxd
         yWjAKlybFud7EMX0zK6hH8w4LoYc+Mo9vDXarriuGPZsQvfF/XVDRiyWMC/dl3edBpSc
         dt5I5a5csiRUIkAhsukqXExV9657RcJxSYJ4inmMtgFTNGha052LoQSEVI6s5c3aFTIp
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969819; x=1738574619;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdp6qM5HkNGE6pm93Ya34vtciW0eBxcidQ8OmMD0mDI=;
        b=qJ2ySMguTulAD7BvIJKZ0VYfnVrmOMqBOl9Bc/2IUYs3oNcMHmkwP16PA+mPUoKQCG
         4wGkctnp4rg1bF6IYCa0JbgCgLje+7cIBXy0pmyfgHH0GRdLQ5UZwoZjsaqcFYZWMmYx
         M9lhUV3kWA0M9NWLrAjTQNY6rqqf679bqqibll+fkVSdE790K+bAU6HDmMpR6ZqHF04T
         S6DNOe+erpuQhIE2GMgJpZ4qy6rPrei/ZxAl5pElXamRL2gjphPXPV4mBeDkwxeQjn4/
         /5A0h77iBwt+oBWejlxlRVP44Q8TnWx0scIMAHGBF3s4v3sp4m+NKnp3TmJWRaFwEG+2
         XRpg==
X-Forwarded-Encrypted: i=1; AJvYcCVxaS+RnEW9djPCNl+nwi88jaC8t2Ogq3NEQu7pjGeH/Tz9//eJ9wUI97txW6TRWoINl/HJpNsRSAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTCJvvG1FpPY0BHNZkBI2zfuyf20wHD9ZjPzQaUsVide6EdMNU
	+C2QEZNHol2rLu4tPwqD7J5/htwo5eagQ7HchlxgZ4PGfiGpc+MF
X-Gm-Gg: ASbGncv/W8ByO1IVpchyitO3tslLGdZr0BZC/Y4DNmsii2i6H6zoU/4QhA/vUl7Q/l0
	dNqtONsSIFXVOwHhROLcHq2/eOjWCaKHOGGr68raxZudDCSyQiyn1H3LeM/3wLCUznKoMZ+Cwks
	KFELL57NzcK2o+E6D+r0t7rJKzaNQNbnB7PXoXcK1HtBo/5VyJ9pioKXblbrkBozt8VxhQ/bpJj
	2P9VH8vcwTFj7em1bcHxrKjmUBjsdN8wGZZRQNZJy2vDZnUKEBQ21jStJVxLjuYUSBQ4BJSp8CP
	I7ASBuKZnjgfNfJltn603E1l03vMw9gemJYEbb/+Cc4NRnj7XSaAYyaN
X-Google-Smtp-Source: AGHT+IGGdDiQNlIruAHADHHYWkF49cOK1bT139jWgdCV4iDBjNSzB0gu/pftWQhhkzbn6APXXw+Bbw==
X-Received: by 2002:a17:907:3602:b0:aaf:74b3:80db with SMTP id a640c23a62f3a-ab38b0b90f1mr3823978866b.3.1737969819097;
        Mon, 27 Jan 2025 01:23:39 -0800 (PST)
Date: Mon, 27 Jan 2025 09:23:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>,
 =?ISO-8859-1?Q?Cl=E9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/9=5D_hw/sysbus=3A_Declare_?=
 =?US-ASCII?Q?QOM_types_using_DEFINE=5FTYPES=28=29_macro?=
In-Reply-To: <20250125181343.59151-3-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org> <20250125181343.59151-3-philmd@linaro.org>
Message-ID: <003404AB-0220-474C-B9DC-4CD88225C420@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 25=2E Januar 2025 18:13:36 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>When multiple QOM types are registered in the same file,
>it is simpler to use the the DEFINE_TYPES() macro=2E In
>particular because type array declared with such macro
>are easier to review=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/core/sysbus=2Ec | 39 +++++++++++++++++----------------------
> 1 file changed, 17 insertions(+), 22 deletions(-)
>
>diff --git a/hw/core/sysbus=2Ec b/hw/core/sysbus=2Ec
>index f713bbfe04f=2E=2E306f98406c0 100644
>--- a/hw/core/sysbus=2Ec
>+++ b/hw/core/sysbus=2Ec
>@@ -80,13 +80,6 @@ static void system_bus_class_init(ObjectClass *klass, =
void *data)
>     k->get_fw_dev_path =3D sysbus_get_fw_dev_path;
> }
>=20
>-static const TypeInfo system_bus_info =3D {
>-    =2Ename =3D TYPE_SYSTEM_BUS,
>-    =2Eparent =3D TYPE_BUS,
>-    =2Einstance_size =3D sizeof(BusState),
>-    =2Eclass_init =3D system_bus_class_init,
>-};
>-
> /* Check whether an IRQ source exists */
> bool sysbus_has_irq(SysBusDevice *dev, int n)
> {
>@@ -306,15 +299,6 @@ static void sysbus_device_class_init(ObjectClass *kl=
ass, void *data)
>     k->user_creatable =3D false;
> }
>=20
>-static const TypeInfo sysbus_device_type_info =3D {
>-    =2Ename =3D TYPE_SYS_BUS_DEVICE,
>-    =2Eparent =3D TYPE_DEVICE,
>-    =2Einstance_size =3D sizeof(SysBusDevice),
>-    =2Eabstract =3D true,
>-    =2Eclass_size =3D sizeof(SysBusDeviceClass),
>-    =2Eclass_init =3D sysbus_device_class_init,
>-};
>-
> static BusState *main_system_bus;
>=20
> static void main_system_bus_create(void)
>@@ -337,10 +321,21 @@ BusState *sysbus_get_default(void)
>     return main_system_bus;
> }
>=20
>-static void sysbus_register_types(void)
>-{
>-    type_register_static(&system_bus_info);
>-    type_register_static(&sysbus_device_type_info);
>-}
>+static const TypeInfo sysbus_types[] =3D {
>+    {
>+        =2Ename           =3D TYPE_SYSTEM_BUS,
>+        =2Eparent         =3D TYPE_BUS,
>+        =2Einstance_size  =3D sizeof(BusState),
>+        =2Eclass_init     =3D system_bus_class_init,
>+    },
>+    {
>+        =2Ename           =3D TYPE_SYS_BUS_DEVICE,
>+        =2Eparent         =3D TYPE_DEVICE,
>+        =2Einstance_size  =3D sizeof(SysBusDevice),
>+        =2Eabstract       =3D true,
>+        =2Eclass_size     =3D sizeof(SysBusDeviceClass),
>+        =2Eclass_init     =3D sysbus_device_class_init,
>+    },
>+};
>=20
>-type_init(sysbus_register_types)
>+DEFINE_TYPES(sysbus_types)

Can now omit the "qom/module=2Eh" include=2E With that changed:

Reviewed-by: Bernhard Beschow

