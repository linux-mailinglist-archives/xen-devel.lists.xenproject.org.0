Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2789AA5B
	for <lists+xen-devel@lfdr.de>; Sat,  6 Apr 2024 12:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701465.1095886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3Ot-0001Qw-VM; Sat, 06 Apr 2024 10:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701465.1095886; Sat, 06 Apr 2024 10:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rt3Ot-0001O5-SJ; Sat, 06 Apr 2024 10:35:55 +0000
Received: by outflank-mailman (input) for mailman id 701465;
 Sat, 06 Apr 2024 10:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Kac=LL=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rt3Os-0001Nx-5C
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2024 10:35:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 705ef193-f401-11ee-a1ef-f123f15fe8a2;
 Sat, 06 Apr 2024 12:35:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a51a742c273so151723266b.1
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2024 03:35:51 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-220-023.77.13.pool.telefonica.de.
 [77.13.220.23]) by smtp.gmail.com with ESMTPSA id
 og42-20020a1709071dea00b00a4e657a5f1asm1860284ejc.112.2024.04.06.03.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Apr 2024 03:35:50 -0700 (PDT)
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
X-Inumbo-ID: 705ef193-f401-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712399751; x=1713004551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTzEXs39efSP0D1vIf8LgwE3n50e92VC9ryCdX6S+WA=;
        b=mcl12uxuGW+VvWgYor+Jvds6FDL+0W34mcM+t5IP2hcg33FAryzNzYBGCXSJcXK3CG
         wkAYSXfBTUB8T+lBaPFtybtruR/IUvdmHjFCfzXqEH4Nx6EWIqzRs/qysVVnCMtRcQtm
         L1Fv+Rw58eOT/lKQxZhNtBhsq2ETJPC863u8sDk+oQa9fRPKKyM50RE0MGo3SV4eZl4H
         q1KcVnYgTKQyv7BkLw11OjCRqdJQGu0yDt8GmexjPD7eDly4KTzONQjj1UWByFCgPze/
         p+iwXKyXDNHm9ZXqF/aaoYD+Ggktl8ibAnNb3qu4Doajz5YVmhCcGjAg8I9tIFSKNqof
         z/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712399751; x=1713004551;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTzEXs39efSP0D1vIf8LgwE3n50e92VC9ryCdX6S+WA=;
        b=oSZu1ZRizD0t7kdlTVRXBjUQbGqQGz73ihgqMBD6A7ORGTaZ1Lk+zcV30BOm/9vL49
         r3YI/yfdTzyvEPAEzPHSqFbFSBVEK0qZvjTGzIm8c9ulhAR0l1cTV5H0DYGAKdcToAxG
         TbRSuPJzRsSUF6n0xqBZ84k1iQr66JUWgfGwrMRl5eh6xxezzYw0T9vDqgV/ZgMWT0I2
         Rr7aSJNNd/pmVhCEwMx5YIBTkErOV1dJAK+VU1MOmEbsbjIYrGSQFCQlbmKjprNljSqs
         /ZADUOQ3QZ6TjzqkJojNfdZZsaUwQNeQYN438d4GomzKypmZMnEXqzpdBub3+ybc+TNq
         pFSw==
X-Forwarded-Encrypted: i=1; AJvYcCXu4I7u8qog5S2hhpE74xOWWyQEdMiQTDo+85T+HbMokektU7P0FQezZiXnTFncVZXXP3R3hnSEtCKFqY/nji7kX4VSojhkJ6i5FkBA+CA=
X-Gm-Message-State: AOJu0YzQBhEEyrDJnwvKPI/OjV5fugyW/12UFiou/67rg4mSp2k5fTAU
	bRlImwEPrELiDQCFY8QqwO9hDl5A89Q3fVejHLyw+Hgba4HKadNn
X-Google-Smtp-Source: AGHT+IGbcRVdg5kMQaFwVbyuLd1okzwpm7IOgExQ3yqwmajrZzwx+/t0cPkPqlZ5tPPZxtOgSNqS/A==
X-Received: by 2002:a17:906:2488:b0:a46:8daa:436f with SMTP id e8-20020a170906248800b00a468daa436fmr2432052ejb.69.1712399750635;
        Sat, 06 Apr 2024 03:35:50 -0700 (PDT)
Date: Sat, 06 Apr 2024 10:35:45 +0000
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E1_13/29=5D_hw/i386/pc=3A_Remo?=
 =?US-ASCII?Q?ve_non-PCI_code_from_pc=5Fsystem=5Ffirmware=5Finit=28=29?=
In-Reply-To: <20240328155439.58719-14-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org> <20240328155439.58719-14-philmd@linaro.org>
Message-ID: <857F87E8-3876-4083-A1D0-F867649582A9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 28=2E M=C3=A4rz 2024 15:54:21 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>x86_bios_rom_init() is the single non-PCI-machine call
>from pc_system_firmware_init()=2E Extract it to the caller=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/i386/pc=2Ec       | 6 +++++-
> hw/i386/pc_sysfw=2Ec | 5 +----
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index f184808e3e=2E=2E5b96daa414 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -956,7 +956,11 @@ void pc_memory_init(PCMachineState *pcms,
>     }
>=20
>     /* Initialize PC system firmware */
>-    pc_system_firmware_init(pcms, rom_memory);
>+    if (pci_enabled) {
>+        pc_system_firmware_init(pcms, rom_memory);
>+    } else {
>+        x86_bios_rom_init(machine, "bios=2Ebin", rom_memory, true);
>+    }
>=20
>     option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
>     memory_region_init_ram(option_rom_mr, NULL, "pc=2Erom", PC_ROM_SIZE,
>diff --git a/hw/i386/pc_sysfw=2Ec b/hw/i386/pc_sysfw=2Ec
>index 862a082b0a=2E=2E541dcaef71 100644
>--- a/hw/i386/pc_sysfw=2Ec
>+++ b/hw/i386/pc_sysfw=2Ec
>@@ -202,10 +202,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
>     int i;
>     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
>=20
>-    if (!pc_machine_is_pci_enabled(pcms)) {
>-        x86_bios_rom_init(MACHINE(pcms), "bios=2Ebin", rom_memory, true)=
;
>-        return;
>-    }
>+    assert(pc_machine_is_pci_enabled(pcms));

AFAICS nothing refers to pci in the whole file any longer=2E The only reas=
on for checking pci_enabled before seems for filtering out the x86_bios_rom=
_init() case=2E This has been moved to the caller=2E Can we thus drop the a=
ssert? This allows for further removal of code in this patch and avoids sup=
erficial barriers for reusing this code=2E Or do I miss something?

Anyway, this patch looks like good material on its own and could be tagged=
 independently=2E

With dropping the assert considered:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>=20
>     /* Map legacy -drive if=3Dpflash to machine properties */
>     for (i =3D 0; i < ARRAY_SIZE(pcms->flash); i++) {

