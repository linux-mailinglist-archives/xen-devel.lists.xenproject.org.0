Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02D08903FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699022.1091461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6d-00037J-G4; Thu, 28 Mar 2024 15:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699022.1091461; Thu, 28 Mar 2024 15:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6d-00032U-Cz; Thu, 28 Mar 2024 15:55:55 +0000
Received: by outflank-mailman (input) for mailman id 699022;
 Thu, 28 Mar 2024 15:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6b-0001AK-3D
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7723f0c-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:55:52 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-568c714a9c7so1312485a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:52 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 u23-20020aa7d897000000b0056ba017ca7fsm953482edq.87.2024.03.28.08.55.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:51 -0700 (PDT)
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
X-Inumbo-ID: a7723f0c-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641352; x=1712246152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ3NIU3pO9930vwNFx0mYgma5e7GvztHkS/rmyU15RU=;
        b=BG/FPI3FZWPijrJvR/3GBAQnfxn8sdeqkyr7hR50D3lgiBXWShG1ghMVZ166fM/tcN
         5f7/TVUdmDpx4sYFkUyz4Scr4XziUsWn79NHVUGylQNBqHOqWebyawbemLf9lcRq61ri
         n26f5bpXO2+lKQjtL5zxY7gQCzp34sM56Vt6+2wjYJGi7fuKwMJDXG+Z9zcw+P502ei3
         b29ZTlAbwNQuREr0LvgqnmCYL7p3BsxEfo7nc2ACVJ7rMk1Yc5/2PrCemulqT9NgcMVI
         6jvu4gKt3Aon0tI10eehKstbT/UYj0+tdMIbWQd+DCGLiwPB6WxrX1YqxlJpAWnTdwvD
         DFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641352; x=1712246152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ3NIU3pO9930vwNFx0mYgma5e7GvztHkS/rmyU15RU=;
        b=ik4KjRkBzMXycBAxThV6Ba0BT+UNR0JBsYxKIceZILrvhj9s0xtlEs29hrESJ0pIM/
         rQdzYydtK9coHjch/VAEKgh4c7MGrPvAGsk5/xif9XMyUY6xNmff84CPoKoGYQ+VxR+h
         6EISkiD43xcs5/V7p2A0eEBVl+fQOphRw7TLXyHaL2sB02rEknsCRZxth9ajCU9LRqH9
         iwytAF/OF0o3evouBYd+jx2+2pcEyU1wi3phaDXCYZy6fb/qaz0SIRCd0F3cGF/Ce/eN
         2ZwPCBkEFwRle34zfugSvWzGrjJkLZzwvDhiHLpvQplI3gCKBb/6pzYZHgDRQ3ymVNxW
         rMHw==
X-Forwarded-Encrypted: i=1; AJvYcCX8JMWghPzm5yDKErBc9aoBPERzSilRTWf4693dAS776w43SRbBRHk6ZabEpAiurOF9NlbPe8vSLdzE3OPuRxR2U5HoY/V7Mgz4z1CFnLg=
X-Gm-Message-State: AOJu0YzdqVakuRaisnoixowfPjhufu6V8fgYQL3EgJr5UYgsVFSbEkzG
	wJ+a4OZOaWQgBYMnuuQg1whweLYtMCX7hGvkdLckqSZ8cqXkYk2nDQfHMX6/uss=
X-Google-Smtp-Source: AGHT+IH3/f3B+fppMfqmjp05mNuhqqUlRQgmruUJACUpH3wuIu7IVWjtNOwP7TTyrIw4MimWKbfy0Q==
X-Received: by 2002:a50:d6d8:0:b0:568:ae7:bc0 with SMTP id l24-20020a50d6d8000000b005680ae70bc0mr2301236edj.34.1711641351948;
        Thu, 28 Mar 2024 08:55:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 11/29] hw/i386/pc: Move acpi_setup() call to pc_pci_machine_done()
Date: Thu, 28 Mar 2024 16:54:19 +0100
Message-ID: <20240328155439.58719-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

acpi_setup() returns early if acpi_build_enabled is not set:

  2752 void acpi_setup(PCMachineState *pcms)
  2753 {
   ...
  2768     if (!pcms->acpi_build_enabled) {
  2769         ACPI_BUILD_DPRINTF("ACPI build disabled. Bailing out.\n");
  2770         return;
  2771     }

acpi_build_enabled is only set on PCI-based machines, so it
is pointless to call acpi_setup() from non-PCI like the ISA-only
machine, move the call to pc_pci_machine_done().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f0dc04e2fc..47fe3a7c02 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -601,7 +601,6 @@ void pc_machine_done(Notifier *notifier, void *data)
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    acpi_setup(pcms);
     if (x86ms->fw_cfg) {
         fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
@@ -627,6 +626,8 @@ static void pc_pci_machine_done(Notifier *notifier, void *data)
     }
 
     fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
+
+    acpi_setup(pcms);
 }
 
 /* setup pci memory address space mapping into system address space */
-- 
2.41.0


