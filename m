Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E299F15D3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857148.1269568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMBN9-0002gZ-Tq; Fri, 13 Dec 2024 19:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857148.1269568; Fri, 13 Dec 2024 19:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMBN9-0002eE-QW; Fri, 13 Dec 2024 19:30:47 +0000
Received: by outflank-mailman (input) for mailman id 857148;
 Fri, 13 Dec 2024 19:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMBN8-0002e8-Gr
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:30:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bee7d81c-b988-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 20:30:44 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so2982485e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:30:44 -0800 (PST)
Received: from stoup.. ([91.209.212.67]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c01051sm6972e87.156.2024.12.13.11.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:30:43 -0800 (PST)
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
X-Inumbo-ID: bee7d81c-b988-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734118244; x=1734723044; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks6G+A84FfZ3IMwYe7rtmCGNogRG46Y1v4JaJo0a9Is=;
        b=S+PZ3DHfsJ0S9wjWF0R8cacakxTf31oZVROvgLOyb2MHSO5N0+OHgBalb/5/Hfq+SS
         VIRFd8lwme4lMOX1E6SDa639d0aFK6jGCgMtvxKnoFlDAXAMz4l7KiYV23SQr+eDh7BG
         BAX90NAiVsltKhOP47SQ10OHIeIyhGnqYS1/5R7T36RPERwkOCIhZ6/TrcyEVVsgBiaD
         AvRPy51pzOocKVhMRGgg0hkX4XbDmIXt704Se+LWYWMhrhSgyuG8PDHnWhiMxTvVd/E+
         85VN4zmQatP8A3Pcz1msQluaalA7WxMq5EfVHPTwA8YuhzdldmSc1rG5EuGfHx2t4cqG
         LoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734118244; x=1734723044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks6G+A84FfZ3IMwYe7rtmCGNogRG46Y1v4JaJo0a9Is=;
        b=FdCUFeiCki8FIAW6XiDsXKDI4g5b3mvaMUaBDmPZQ5R6Rki41tEhWbrU8un5u1hmj/
         7Ht0sJe1CzLWJJ9fS/nNNXvAbLqXT86S5GWRD8c33Sgh2EfTpFFVrXE8blu/LWB18BX2
         wwk05GOlrO7VTeQghkSZSDKlSFNx6F+0cdyhjP+f+LAKQ4W7u0PAmivi8ozmHHIj7SFk
         zWgJgvpoc8nxFqqqW3JDNGgjrAqjHYJx4FJymIL+/aWaIIpLepPYwyhwC5uBiczSukH1
         3/Zok734e6p0ZJDMTpKG6XwEJxfxKpqvGz1h50ui+uPmhHgo1f4yLGscC6Ra3u2OL+LJ
         OyQA==
X-Forwarded-Encrypted: i=1; AJvYcCXlKqZF0K4zRvDyw6rf+d0XBnmd0KnV19cfI1KmM1lvIpiweg6XzhsZqcNT7CYFU62kwRcVlvzYm3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdYwSUKgSwS8ncVeenWICLm0PiEIQyMhWerRZ8z3LzghJp3arv
	DhOv5LKtDso86UcKvAxIhEP65Dq8L3TbfffJFWvtCUTkCtBJOTU9GC+zWsw5/sw=
X-Gm-Gg: ASbGncuRYIZ/gSdPmnZYPOMR2YS0zYDoTjisBgCesjispW05yrwjiKhkpu9CJbL+IVA
	9pokZbsP8jIGIWx8j115iNOiyA4x/NwK33VemfQbtqBzcQUsIHuScAS46FBqkjRzMPSJPstFg6X
	0C1/DiBnBaQAvlfGwN29CAx9u7hQpD0SO1k0P9/G3i5BV1iPvQEH/c7E/yVwWvowoLSMfSePb84
	tK7LYM0KxK44CpIwtMzX0k7lUbDOOFmGe9Ig1aVGSOb5RTRnQu8cor6Zbwd6A==
X-Google-Smtp-Source: AGHT+IFGZJIZIUb5LjrLjVc0WvQwaJBK5eY0K7njVad3ONjLROwm4SnNIJX99T953BtT5rEvxmgCfA==
X-Received: by 2002:a05:6512:3e07:b0:53e:2fdb:4de3 with SMTP id 2adb3069b0e04-540905955ccmr1343488e87.44.1734118243635;
        Fri, 13 Dec 2024 11:30:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 68/71] hw/xen: Constify all Property
Date: Fri, 13 Dec 2024 13:30:02 -0600
Message-ID: <20241213193004.2515684-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213193004.2515684-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213193004.2515684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/xen/xen-bus.c            | 2 +-
 hw/xen/xen-legacy-backend.c | 4 ++--
 hw/xen/xen_pt.c             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 95b207ac8b..0d7defb8cd 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1092,7 +1092,7 @@ unrealize:
     xen_device_unrealize(dev);
 }
 
-static Property xen_device_props[] = {
+static const Property xen_device_props[] = {
     DEFINE_PROP_UINT16("frontend-id", XenDevice, frontend_id,
                        DOMID_INVALID),
     DEFINE_PROP_END_OF_LIST()
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index e8e1ee4f7d..b15393e934 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -635,7 +635,7 @@ int xen_be_bind_evtchn(struct XenLegacyDevice *xendev)
 }
 
 
-static Property xendev_properties[] = {
+static const Property xendev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -674,7 +674,7 @@ static const TypeInfo xensysbus_info = {
     }
 };
 
-static Property xen_sysdev_properties[] = {
+static const Property xen_sysdev_properties[] = {
     {/* end of property list */},
 };
 
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 3635d1b39f..557aa98be4 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -931,7 +931,7 @@ static void xen_pt_unregister_device(PCIDevice *d)
     xen_pt_destroy(d);
 }
 
-static Property xen_pci_passthrough_properties[] = {
+static const Property xen_pci_passthrough_properties[] = {
     DEFINE_PROP_PCI_HOST_DEVADDR("hostaddr", XenPCIPassthroughState, hostaddr),
     DEFINE_PROP_BOOL("permissive", XenPCIPassthroughState, permissive, false),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.43.0


