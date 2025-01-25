Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593BA1C4CF
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877038.1287272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfs-0007RL-0L; Sat, 25 Jan 2025 18:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877038.1287272; Sat, 25 Jan 2025 18:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfr-0007Mw-SZ; Sat, 25 Jan 2025 18:14:27 +0000
Received: by outflank-mailman (input) for mailman id 877038;
 Sat, 25 Jan 2025 18:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfq-0004aj-8j
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3583c3d5-db48-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 19:14:25 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso20866275e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d29cesm69824895e9.35.2025.01.25.10.14.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:23 -0800 (PST)
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
X-Inumbo-ID: 3583c3d5-db48-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828865; x=1738433665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6WqpNLLgPHFQ99I41LLhDNBlDQghx4mWgl59MS9KjI=;
        b=PAiFrCXOUDqU7nzb8Yrw2aUD8pdEjbr5FIK8KmdIyHq59pvaV4KI5FpJ1ZL0dxv2BU
         LpBsvBlcdsjr98+ZExv+tiR0TlXPijW4kk7l8wQMVXNudH3elPXK+sqoKmZlF57SHrJ5
         DPCXnvVr915yY9mSP0DCQaI+xzgdDARW4Q8VrjTwImcK0OmG9LoGnjMXQbye/Pm/MXKz
         G2dujPk2KmeZ6VFLKcS31ZsxUpuNGbepj+219vUShp03j3IABQWJ7qhJrqd0mW9NreNB
         Ul9RRjXZHy+CBRv61p5ZqgNZ8Yk5mFSA0v+JUWODjkznr2oQUSe6VLWk7s4e6gZ1wgQd
         EfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828865; x=1738433665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6WqpNLLgPHFQ99I41LLhDNBlDQghx4mWgl59MS9KjI=;
        b=jnpcUvy8pzPJU+0yoInxRioXg4QGKDNnpnfRghSICSNGEm0BoL8nAb+3HpqLsnYKrv
         mtJc5niI1lXE2Ug41ZsUCvBUv1ci/Po3ZwccrOxmi7kq/8pjzt3yqVBivr6WucWuOeQN
         ddProj+5MoMGxX/ANq6TbcF9KTu1Qgj6X8OP5YmNIxtimgqJPq+cfpc+aG8V4xJybgpY
         S3o0M8GjKS3cVnOPEvIyh1EA6yM3+YNbOhOjCfBcmjzlYXutQBV9vuDEjbuW87b7FduN
         2IjxyW0D1gHvC8pJi8zg8uIIlzKvlf9sG4AMfCU2Q6Vir6f3ktoTOZc0alOzZN4d4peR
         j3+g==
X-Forwarded-Encrypted: i=1; AJvYcCW85B297nJktt6g6FDN/rAqH2MG+fxpp1po/QVvevQ7f+Uupj+5zv1vue6oTUdbpYbHJgsFe8bIia4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwREfUbzw2qWbaVu8JCaaxKrspal/lY7atts09m9aR7PJKWWd/L
	HMKW94F6z35DzUdJtN4IPhAbmVWQVPaInmZraqWPQ8EWGBy6iR2B8ulP47UV3yg=
X-Gm-Gg: ASbGncu8TsudT+gwo4irg0DrYW4NndNa7fANyZZjVpEBKPylGWT0zyVgffMnE3ub3Re
	eY0Wva02BEAIxFHWQwZv4vo1GV1YqFX7Tv07svmroFgmHP4wOk/A2G8WWvfIPFF1CeadlmCM3Qs
	9LIFIYTwm03aX7VmlVOIqbDBiJwnKcZ08kKfAhEaVpFdv+FfM9nHdiSoDVu1bRtvcmTR56WX+mm
	r8N8RXasJOM5NyrCJyOT4OvLIuebqSflZ/3ZYM6pDtCRPR3yYs/byoW87IRyNEpEjo2peCtP+tU
	3TLzjMjbniXdD9xzMbCdtwlb4dclGN/OJoJQma3WM8Fwnl1xfbzFaO6kJoWS
X-Google-Smtp-Source: AGHT+IHtukcUsuBgToag1rm73vPOv6PLwBxDIv19SmO8jk0VeznszQ2sl5L6woNkrDfICXUGMJC2jg==
X-Received: by 2002:a05:600c:1f86:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-438913db2cfmr312879235e9.13.1737828864896;
        Sat, 25 Jan 2025 10:14:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/9] hw/net: Have eTSEC device inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:41 +0100
Message-ID: <20250125181343.59151-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because the network eTSEC device can be optionally plugged on the
TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/fsl_etsec/etsec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 781b9003954..3ce4fa2662d 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -425,14 +425,12 @@ static void etsec_class_init(ObjectClass *klass, void *data)
     dc->realize = etsec_realize;
     device_class_set_legacy_reset(dc, etsec_reset);
     device_class_set_props(dc, etsec_properties);
-    /* Supported by ppce500 machine */
-    dc->user_creatable = true;
 }
 
 static const TypeInfo etsec_types[] = {
     {
         .name          = TYPE_ETSEC_COMMON,
-        .parent        = TYPE_SYS_BUS_DEVICE,
+        .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
         .instance_size = sizeof(eTSEC),
         .class_init    = etsec_class_init,
         .instance_init = etsec_instance_init,
-- 
2.47.1


