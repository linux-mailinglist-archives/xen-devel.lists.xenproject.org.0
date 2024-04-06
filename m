Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9389AA5D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Apr 2024 12:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701467.1095897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3RV-0001zh-Ax; Sat, 06 Apr 2024 10:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701467.1095897; Sat, 06 Apr 2024 10:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3RV-0001xD-7u; Sat, 06 Apr 2024 10:38:37 +0000
Received: by outflank-mailman (input) for mailman id 701467;
 Sat, 06 Apr 2024 10:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Kac=LL=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rt3RT-0001x0-8w
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2024 10:38:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1513347-f401-11ee-afe6-a90da7624cb6;
 Sat, 06 Apr 2024 12:38:34 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a51a20a6041so180930766b.0
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2024 03:38:34 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-220-023.77.13.pool.telefonica.de.
 [77.13.220.23]) by smtp.gmail.com with ESMTPSA id
 nb33-20020a1709071ca100b00a4628cacad4sm1870100ejc.195.2024.04.06.03.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Apr 2024 03:38:32 -0700 (PDT)
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
X-Inumbo-ID: d1513347-f401-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712399913; x=1713004713; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=katZgpXheBWu/q6Hj0m0PLK3Zp+Dqpr33WEzx5gAdMI=;
        b=b43Nr3pcOSKb/4TZMK/IbNvJdfiYJzERWWeuSzJJsm3z1jX708yeFg1sc2bDnG31sy
         v4wBBGs7WznUOhathOJBv/r6E+xbqVmTIBpC/hJqqFQTR/7gzkQd7v2L3DMNj1NsBcLz
         ugVTB5aRkQuHWylVQUcSYRFkQyvE92Gq/70q+lyAsDDdl2TT2shBMZCGkmt0uPw9tdZx
         PDvvkHZ0Mbu4mL3dBLnuKzaFpReRKvoev/r7mGtbemEec7himKfGkf0Qh78Xa+veBolE
         kOie7Zk/rANgdQn+n1k3y8f+l1hZ4cYVjWs1m0uQv9BfqhBui8eTeFpDZPBs8h/wz3dq
         hX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712399913; x=1713004713;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=katZgpXheBWu/q6Hj0m0PLK3Zp+Dqpr33WEzx5gAdMI=;
        b=Gjbs1rnlCy4zwLU+RqyCovYudaLzvWp8mBT9HPJBzLrmQR58EghKRerlLUDCv8miwG
         t5Voe8/t7P0+Oh4oTDHkZOAcJJM5q6S9SyBRHJhht7G73lCPIgLqpZwcn7TWR3zAuMil
         xs6BCR+dPbukrMhzsCghd+zwUyNSdlmVoRQaqHOYLczW9umu1BH1AaADyEexso7F5hY6
         o3U1bTOFjuFEqP9S20YE3VUA5G9kpwtvOHbAzn1zaWVINgP4e6V5JKCkmlOD5AtvuQKd
         dPdDRSJnFi7NXstEZutR5Nf1/+ZKKXdk08AFo4mx/7TAaqurjSECbHqDa3uTu4wOwci3
         P4Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUEuvsQBKQ3eDmX713/tZ7O2mcktx28+gEbVat85Kg7oacp4mtGkq/hRcHhPVIqStdrdj0uFeofHWYwzy5u+Cwv4lBVLAqbzG1I+igRcDo=
X-Gm-Message-State: AOJu0YylGmN5137wfYpcoRZnyhgV/mnl5FONy2O4tXT6Jjm7MKzQMUUb
	J4n/iwFawW62q6KUtfvHXGIRPjMNNDNmcqFNrMbzFtWwT37N07lZ
X-Google-Smtp-Source: AGHT+IE37mkMY75cSujzRGF6ERkZ9H+hOCgYE/IiYgC0qWxnHTAEtopYDUeK2NRAdz/uFiOlMmqlhg==
X-Received: by 2002:a17:906:3546:b0:a51:7b86:671e with SMTP id s6-20020a170906354600b00a517b86671emr2304903eja.8.1712399913278;
        Sat, 06 Apr 2024 03:38:33 -0700 (PDT)
Date: Sat, 06 Apr 2024 10:38:30 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Ani Sinha <anisinha@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E1_09/29=5D_hw/i386/pc=3A_P?=
 =?US-ASCII?Q?ass_PCMachineState_argument_to_acpi=5Fsetup=28=29?=
In-Reply-To: <20240328155439.58719-10-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org> <20240328155439.58719-10-philmd@linaro.org>
Message-ID: <B476D63B-DE8E-4DB0-A876-ADC61B08D5A3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 28=2E M=C3=A4rz 2024 15:54:17 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>acpi_setup() caller knows about the machine state, so pass
>it as argument to avoid a qdev_get_machine() call=2E
>
>We already resolved X86_MACHINE(pcms) as 'x86ms' so use the
>latter=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

This patch looks like good material on its own=2E

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> hw/i386/acpi-build=2Eh | 3 ++-
> hw/i386/acpi-build=2Ec | 5 ++---
> hw/i386/pc=2Ec         | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/hw/i386/acpi-build=2Eh b/hw/i386/acpi-build=2Eh
>index 0dce155c8c=2E=2E31de5bddbd 100644
>--- a/hw/i386/acpi-build=2Eh
>+++ b/hw/i386/acpi-build=2Eh
>@@ -2,6 +2,7 @@
> #ifndef HW_I386_ACPI_BUILD_H
> #define HW_I386_ACPI_BUILD_H
> #include "hw/acpi/acpi-defs=2Eh"
>+#include "hw/i386/pc=2Eh"
>=20
> extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>=20
>@@ -9,7 +10,7 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_d=
smio;
> #define ACPI_PCIHP_SEJ_BASE 0x8
> #define ACPI_PCIHP_BNMR_BASE 0x10
>=20
>-void acpi_setup(void);
>+void acpi_setup(PCMachineState *pcms);
> Object *acpi_get_i386_pci_host(void);
>=20
> #endif
>diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>index 6e8e32e5d2=2E=2Ee702d5e9d2 100644
>--- a/hw/i386/acpi-build=2Ec
>+++ b/hw/i386/acpi-build=2Ec
>@@ -2749,9 +2749,8 @@ static const VMStateDescription vmstate_acpi_build =
=3D {
>     },
> };
>=20
>-void acpi_setup(void)
>+void acpi_setup(PCMachineState *pcms)
> {
>-    PCMachineState *pcms =3D PC_MACHINE(qdev_get_machine());
>     X86MachineState *x86ms =3D X86_MACHINE(pcms);
>     AcpiBuildTables tables;
>     AcpiBuildState *build_state;
>@@ -2771,7 +2770,7 @@ void acpi_setup(void)
>         return;
>     }
>=20
>-    if (!x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
>+    if (!x86_machine_is_acpi_enabled(x86ms)) {
>         ACPI_BUILD_DPRINTF("ACPI disabled=2E Bailing out=2E\n");
>         return;
>     }
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index 6d87d1d4c2=2E=2Edfc0247bb6 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -601,7 +601,7 @@ void pc_machine_done(Notifier *notifier, void *data)
>     /* set the number of CPUs */
>     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
>=20
>-    acpi_setup();
>+    acpi_setup(pcms);
>     if (x86ms->fw_cfg) {
>         fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_poin=
t_type);
>         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);

