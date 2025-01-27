Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C3A1D3D2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877526.1287658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLhA-0001C2-0u; Mon, 27 Jan 2025 09:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877526.1287658; Mon, 27 Jan 2025 09:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLh9-00019a-U1; Mon, 27 Jan 2025 09:46:15 +0000
Received: by outflank-mailman (input) for mailman id 877526;
 Mon, 27 Jan 2025 09:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wC6S=UT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tcLh8-00019S-AB
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:46:14 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b991408-dc93-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 10:46:13 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab651f1dd36so841494366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:46:13 -0800 (PST)
Received: from [127.0.0.1] (dynamic-093-128-047-181.93.128.pool.telefonica.de.
 [93.128.47.181]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e12505sm564891866b.17.2025.01.27.01.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 01:46:12 -0800 (PST)
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
X-Inumbo-ID: 8b991408-dc93-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737971173; x=1738575973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=musWy1n7TogM8KXZsXOnvhQhrXqQAkckhg6RXEq4Bko=;
        b=MLJXYiiBPknbl7u+9JuYpUu3chjWtDswYCfQ+tHjci/W0eccFnTeQZI4IdLT4nPaLo
         8o1MTfsHG4ubGCqSvuPCsrQ3wL25n/xQKyox3JkqD97fl4/6QTa6fi7IQOYYEYAkcBEX
         oUlVt72PJi1u1ye+X3ujrU26FJOIMlh7rUuvIbD6S4ENkKX7qWvnCoSZ4OOvlxmSOQAR
         XGzvjYWqAxLcvwgE6+sJoEuD3RlaUpbk3tbUB/DT8fdqf/yYNaORqQ727h/A9oT3ki7B
         9W61aZgPyjm2GazJCApplCNXlU3CctQAbVd8RXVrtweW7ddg70af1NGqaK2v127aFYKV
         ZlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971173; x=1738575973;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=musWy1n7TogM8KXZsXOnvhQhrXqQAkckhg6RXEq4Bko=;
        b=BAvllIri0qXBQYsX/HuDF8Z4FXrZ25Ocyad+aagcNgAAfcsS6yDRuPiXvxkUKXoVJm
         WOw5pgAAiJElGpH5K1MJEsaV2DBheUHy+RQYn3EYos5C+FSo/wJHkzb7Q08Rx9ZvFbTu
         y2X6zMsLkmC0HyydU3/yTo0dIRWMrvkFcoulnZjoyoFgqGJKHw44juFQlptYMWBltmQZ
         1Dx+ro785Rz8v+ybAWkEG4hKrMu71iKqzxSBGBHbrDYDxYONNX4bAPy7iWMYLZpDu0t0
         Qa1nayw6ttYNVeNYcWClx3gbVUxQdeYX3azIcKWc9cZA1mvscngfjmKtJqRLPwCQW5VT
         Dl8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIoMFA1TaVoXsezjfmzBJaI3MlBp0Sm1umAOQ4Dv/n+jmIsvDGpRepGieG1nAcHMDcERqc9qtjd40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMfpU174EFZZN+ZmxHR36uat/EtM5slnKXorfUJT9FTER4ca8e
	29VttGfnPva7g4NmkuE0ha9GBJgEG2DyPki3CUQebOdYeDNu2EOb
X-Gm-Gg: ASbGncs80RjjS2DIysuBqmGt+MqWxjFJ93h8/EM9NT7kDEr3ymmkpKTFkrpfhYDaH/R
	sPi1J+H34DT6EVBLC4fXRP/TQRW70dFqo3pVweZ4HtrkXAeyECppDPoV4ys3+C+9/0eaGttIXP4
	ytTpckfoc97xXHpk5+1vPS2lwJu+F/E94rPVtnVLKW2ad9auHZNsToPzXGsiOo/3K/sOERZFtn4
	xyukvuH8o92fHPxfM/hvIqsKiHFOAKoVCZ8O7+grpKhwjWewhuFK2C4+9KgYry7OM4z3AvtLBIo
	4vO1FATAYaKHytxwkDlUEjoZhiCLoY9EUz1V8YU08Zhp7gwmItjIUuvz
X-Google-Smtp-Source: AGHT+IHG0IaOyPVMUP/MqBB9v9/fX+0a85D1lpF7KinDYCL9eJYDjqGVvqsM8FHH5W5762wb2tK/pA==
X-Received: by 2002:a17:907:6ea4:b0:ab2:bffb:4b5c with SMTP id a640c23a62f3a-ab38b24bd9emr3486146266b.18.1737971172417;
        Mon, 27 Jan 2025 01:46:12 -0800 (PST)
Date: Mon, 27 Jan 2025 09:46:12 +0000
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_9/9=5D_hw/xen=3A_Have_legacy_Xen?=
 =?US-ASCII?Q?_backend_inherit_from_DYNAMIC=5FSYS=5FBUS=5FDEVICE?=
In-Reply-To: <20250125181343.59151-10-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org> <20250125181343.59151-10-philmd@linaro.org>
Message-ID: <9A2B297A-6270-4482-B1B6-81F518C07C1E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 25=2E Januar 2025 18:13:43 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Because the legacy Xen backend devices can optionally be plugged on the
>TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE=2E
>Remove the implicit TYPE_XENSYSDEV instance_size=2E
>
>Untested, but I'm surprised the legacy devices work because they
>had a broken instance size (QDev instead of Sysbus=2E=2E=2E), so accesses
>of XenLegacyDevice fields were overwritting sysbus ones=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> include/hw/xen/xen_pvdev=2Eh  | 3 ++-
> hw/xen/xen-legacy-backend=2Ec | 7 ++-----
> 2 files changed, 4 insertions(+), 6 deletions(-)
>
>diff --git a/include/hw/xen/xen_pvdev=2Eh b/include/hw/xen/xen_pvdev=2Eh
>index 0c984440476=2E=2E48950dc2b57 100644
>--- a/include/hw/xen/xen_pvdev=2Eh
>+++ b/include/hw/xen/xen_pvdev=2Eh
>@@ -32,7 +32,8 @@ struct XenDevOps {
> };
>=20
> struct XenLegacyDevice {
>-    DeviceState        qdev;
>+    SysBusDevice parent_obj;

This then needs sysbus=2Eh rather than qdev-core=2Eh include=2E

Moreover, the patch in the reply needs to be inserted into the series befo=
re this patch=2E

Both are needed for the patch to compile=2E

Best regards,
Bernhard

>+
>     const char         *type;
>     int                dom;
>     int                dev;
>diff --git a/hw/xen/xen-legacy-backend=2Ec b/hw/xen/xen-legacy-backend=2E=
c
>index 118c571b3a7=2E=2E4d079e35d83 100644
>--- a/hw/xen/xen-legacy-backend=2Ec
>+++ b/hw/xen/xen-legacy-backend=2Ec
>@@ -640,16 +640,14 @@ static void xendev_class_init(ObjectClass *klass, v=
oid *data)
>     DeviceClass *dc =3D DEVICE_CLASS(klass);
>=20
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>-    /* xen-backend devices can be plugged/unplugged dynamically */
>-    dc->user_creatable =3D true;
>     dc->bus_type =3D TYPE_XENSYSBUS;
> }
>=20
> static const TypeInfo xendev_type_info =3D {
>     =2Ename          =3D TYPE_XENBACKEND,
>-    =2Eparent        =3D TYPE_DEVICE,
>+    =2Eparent        =3D TYPE_DYNAMIC_SYS_BUS_DEVICE,
>     =2Eclass_init    =3D xendev_class_init,
>-    =2Einstance_size =3D sizeof(struct XenLegacyDevice),
>+    =2Einstance_size =3D sizeof(XenLegacyDevice),
> };
>=20
> static void xen_sysbus_class_init(ObjectClass *klass, void *data)
>@@ -672,7 +670,6 @@ static const TypeInfo xensysbus_info =3D {
> static const TypeInfo xensysdev_info =3D {
>     =2Ename          =3D TYPE_XENSYSDEV,
>     =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>-    =2Einstance_size =3D sizeof(SysBusDevice),
> };
>=20
> static void xenbe_register_types(void)

