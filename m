Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43489041B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699025.1091491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps9B-0005PR-Fv; Thu, 28 Mar 2024 15:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699025.1091491; Thu, 28 Mar 2024 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps9B-0005N8-At; Thu, 28 Mar 2024 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 699025;
 Thu, 28 Mar 2024 15:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps81-00071m-3g
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4cd983-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:57:19 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5688eaf1165so1563121a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:19 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 eb16-20020a170907281000b00a4e0df9e793sm887845ejc.136.2024.03.28.08.57.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:18 -0700 (PDT)
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
X-Inumbo-ID: db4cd983-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641439; x=1712246239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZcClnRjP7+/0e8fY+P9N5bd75aoGZ6efgZZhKhlNAY=;
        b=urCTAc0pM2fSVMVe4942E6e03pP7UrNwM+65tC2gLhhpT89TRnUFjPCagACF9b9Haa
         N8pAl0FH4karCohbzNmdO86SKN6I8sP8IOab/99ULp/4VfKtOcrqjx1Cq8UI0+X1l6Sb
         OJxoMRABGW2qolkfB55gckFkIajVQYY/7x2hpYqnW25i0oGuYIlU8wqVEBvLiLAXTp0V
         VMnhGKT/gKdDsY7lhnod41uXOxMSgwOgeUcrwTeAmahbkLRGNVgyX1hoXz+7iE4IVJjM
         Zml0aKYLisScG3UbXeYBQ74wqEZ7hE4z0nizHC3DvNsprLWIeFbXgq7T9weywnqer6cF
         Ulcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641439; x=1712246239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZcClnRjP7+/0e8fY+P9N5bd75aoGZ6efgZZhKhlNAY=;
        b=EzjWqr6KpZ1mjewm7ZHX5r0WZN7Y4sgAZpLVe4b/ysS6mP5YSV15PrXftTkdIV6m2T
         wS3KQraV40O5gvNT5443iJJsqjySeIveG0DT8sxJCGGYONOjGDwn4VVqmsRuJA7+ipAm
         ijERbN6dIZSu7T1xhkYFduxhOIQ9ICvO0r5Bsoie6G9jImcJsabe1y6q9KHIeeke5dyR
         aJFJcLvFqEbtJ1FO/hlcncPSqhPuLfUPawBzVA9iKvVI4yuSH9aAyoSl7Ihc5CAaUmsL
         68GEaUtaAPQjcWA2NVOOwlGjQSrwnYdy2vIwfv7fohOQ4qKihKngZDETZ6ozv9HkADHe
         1CEw==
X-Forwarded-Encrypted: i=1; AJvYcCXFV+NewaBYXYz9mALMU8oF9VxidU6PDvLydR7lndZupFnaLpNgJOF7lFwfcERK+jKR/U8ER0LjwcgL5cVVaJWYErBQzJNGcvtaEviZOvk=
X-Gm-Message-State: AOJu0Yy4OrAOA3ca4FSzyQn7M+/JIXRrFZ7YZX4KKGg+ixcSVuBEHlX8
	bhaHCkUxXYn4w/9uJFVjPySi967O90EAG/zsvfEIUlt63NcXsKQg4BljS6dpFeE=
X-Google-Smtp-Source: AGHT+IFt2sBCHTR2Jv1SbwhNWwKdKTxoa7hJqsQNpLxVlwdOrAYikOdlndg+94qQnyUkEffbEuTZKw==
X-Received: by 2002:a17:907:971c:b0:a46:a1d0:8451 with SMTP id jg28-20020a170907971c00b00a46a1d08451mr2602412ejc.16.1711641439232;
        Thu, 28 Mar 2024 08:57:19 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 25/29] hw/i386/fw_cfg: Replace smbios_defaults() by !smbios_legacy_mode()
Date: Thu, 28 Mar 2024 16:54:33 +0100
Message-ID: <20240328155439.58719-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

smbios_defaults() and smbios_legacy_mode() are logical
opposite. Simplify using the latter.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index ffa60a4a33..df05fe060c 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -49,11 +49,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
 }
 
 #ifdef CONFIG_SMBIOS
-static bool smbios_defaults(PCMachineState *pcms)
-{
-    return pc_machine_is_pci_enabled(pcms);
-}
-
 static bool smbios_legacy_mode(PCMachineState *pcms)
 {
     return !pc_machine_is_pci_enabled(pcms);
@@ -70,7 +65,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
 
-    if (smbios_defaults(pcms)) {
+    if (!smbios_legacy_mode(pcms)) {
         /* These values are guest ABI, do not change */
         smbios_set_defaults("QEMU", mc->desc, mc->name);
     }
-- 
2.41.0


