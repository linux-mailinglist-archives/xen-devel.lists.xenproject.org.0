Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605CCA1D33D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877482.1287612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLJV-0003z6-Bn; Mon, 27 Jan 2025 09:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877482.1287612; Mon, 27 Jan 2025 09:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLJV-0003wC-91; Mon, 27 Jan 2025 09:21:49 +0000
Received: by outflank-mailman (input) for mailman id 877482;
 Mon, 27 Jan 2025 09:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wC6S=UT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tcLJU-0003w0-HA
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:21:48 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 202752de-dc90-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 10:21:44 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so812720166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:21:44 -0800 (PST)
Received: from [127.0.0.1] (dynamic-093-128-047-181.93.128.pool.telefonica.de.
 [93.128.47.181]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760b76acsm548940966b.113.2025.01.27.01.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 01:21:43 -0800 (PST)
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
X-Inumbo-ID: 202752de-dc90-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737969704; x=1738574504; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UuFjFlXx2cpy2FEWdZ5KX6cphMe20KLc2czhmRa7OM=;
        b=CEvNpAUK17+BX1C3hnd+eQTfCHBXMP3QkyrVsPub85bxJDFhU43CLUa9oIsjWFZjDs
         SEGHGajn1O9UJAWlKe2JhWt5Cbk9f1942BioDJj0VMm9rZJ1ZR/QMmewSi/cQRA3TiXi
         K+gpqbxYYlpqbaEWV7miZcRQV1nUDmuuEdpfuEZH/NcAcOPCns/rg78B+rDPp7/UX0T3
         XuBSCgnkmK2f+OBeriyj9mQcdYGbjlBrgWaPG23jEKDmPq+fhwhw/cdmzGZbDt80jWxA
         so+KTyg850aRLGaT5ibNSclAsEPtEnPF7jp1ZU1v8MtNlgQ6dyErGogXVN321AaN1rFo
         LOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969704; x=1738574504;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UuFjFlXx2cpy2FEWdZ5KX6cphMe20KLc2czhmRa7OM=;
        b=Oadre+cMqybODNpyHtcJXi06Fq+okBAH+olETlr6fAV8OC+X0Um7PMqB0ynwxW1OSA
         1Rm+GUmi8gTer4DDX7iQ7w23WTfD+H8XyL5hbv/9QevUfqcn9gO5YnjUb5Pn3Jn/piyp
         Oy40m5oVZgjPVCb2GxVGFVvMYu9VjkcLeisS8eRCJItFAZrF5DRSdEZs8zTxRYU5vidA
         x0IW0vxwuR2FdKlxseHzR+5k2QtAxJSxdHozKjYuochIefM390CDxyONQN0GRpg2uzZW
         qdR1rLoW3ejMRaYafR+XqxiCrhwZShcw3SZMbkAtH2ltGnA+Jxn1ASNR5pALtzQzHXxV
         0i4g==
X-Forwarded-Encrypted: i=1; AJvYcCV05kxYXrtY/wQvJBOP/u2a00Ooe0pIWhRKXOUKlMBjl7zloidREleitAwRTfmCnkC29OQJGF7AG5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBKwznQnkt9zVr5F3SG2SQt5phcSP6Dyq1+BFOP/galI2pm4Ty
	7rbr3fpLgiz4HFBdW2zRWECP4epFUYhPl3SZA1QOFfl470KlpV05
X-Gm-Gg: ASbGncucjkBmg5pfjEbDPqNFB0sc1lkCXxLj1SPWPQ9nscRSd10M+4zsgeJrX1B2+hU
	4xs4OeqoEOcH9u+yaKBaDuOLd/c72uvjbnFrmJ0g8ybSGsxDfNF0psMRzPK6GHVgQvgiZfj83oF
	oy8V6RMykhEInLOuwLMJOLeYM8COmEEl1hIHCgjy5h2W1qWZ57fJpmiyNmFC85a2b5l/Kcywpkb
	hIZnRKs0kwNHfMDjk9rF/UboG7DTdfDRcE0UhMMT5Q2kXV7u4GqNNOXasutlBoS7EnNXa91HTpt
	LM2v3RCrVpkSF5FpTPju96da79mwquC0JoZVu0ks+KcGIJT7HMlYabAvOTszFpyBAZU=
X-Google-Smtp-Source: AGHT+IEkfmy1lj+GPVFBL2FtqWCYO3YjtUx8arnMB2aNAPatwxoDM48FZF5ggzn93a2OlFcmqgnFTQ==
X-Received: by 2002:a17:906:f5a2:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab38b3db4d1mr3880527066b.49.1737969703759;
        Mon, 27 Jan 2025 01:21:43 -0800 (PST)
Date: Mon, 27 Jan 2025 09:21:42 +0000
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_7/9=5D_hw/net=3A_Have_eTSEC_dev?=
 =?US-ASCII?Q?ice_inherit_from_DYNAMIC=5FSYS=5FBUS=5FDEVICE?=
In-Reply-To: <20250125181343.59151-8-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org> <20250125181343.59151-8-philmd@linaro.org>
Message-ID: <0EF260B4-A6E0-47A5-9EA4-7E90F7261F5B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 25=2E Januar 2025 18:13:41 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Because the network eTSEC device can be optionally plugged on the
>TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>
Acked-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> hw/net/fsl_etsec/etsec=2Ec | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/hw/net/fsl_etsec/etsec=2Ec b/hw/net/fsl_etsec/etsec=2Ec
>index 781b9003954=2E=2E3ce4fa2662d 100644
>--- a/hw/net/fsl_etsec/etsec=2Ec
>+++ b/hw/net/fsl_etsec/etsec=2Ec
>@@ -425,14 +425,12 @@ static void etsec_class_init(ObjectClass *klass, vo=
id *data)
>     dc->realize =3D etsec_realize;
>     device_class_set_legacy_reset(dc, etsec_reset);
>     device_class_set_props(dc, etsec_properties);
>-    /* Supported by ppce500 machine */
>-    dc->user_creatable =3D true;
> }
>=20
> static const TypeInfo etsec_types[] =3D {
>     {
>         =2Ename          =3D TYPE_ETSEC_COMMON,
>-        =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>+        =2Eparent        =3D TYPE_DYNAMIC_SYS_BUS_DEVICE,
>         =2Einstance_size =3D sizeof(eTSEC),
>         =2Eclass_init    =3D etsec_class_init,
>         =2Einstance_init =3D etsec_instance_init,

