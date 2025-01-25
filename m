Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86019A1C4C8
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877006.1287213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfJ-0004rr-86; Sat, 25 Jan 2025 18:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877006.1287213; Sat, 25 Jan 2025 18:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfJ-0004ot-4a; Sat, 25 Jan 2025 18:13:53 +0000
Received: by outflank-mailman (input) for mailman id 877006;
 Sat, 25 Jan 2025 18:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfI-0004aj-70
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:13:52 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213dc56b-db48-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 19:13:51 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so35550265e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:13:51 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4e49sm6227077f8f.98.2025.01.25.10.13.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:13:50 -0800 (PST)
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
X-Inumbo-ID: 213dc56b-db48-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828831; x=1738433631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/se+ZOUWHI4guWWCfgPKU8ovKC99g/6LRZidVGKe1oI=;
        b=LRHBJHLWm7gqxXEu8WXxnmKG3n89uc5bSbcx1rG8HfUc6m/wy+Ft0El7SI79t44d8F
         ufbHGqNRJpjbXQknnJxdIcVYRhT9A0C6Xv2fiC008I883D6kU/C1QphM2p3Nheq+37qv
         6si0JLjwGaMxvkn3uLNFL89V5Hhu0GOPOiVfnSZmnBpnEhQo9DvsVRAPac6hcR2q0ffV
         KDtl+j6SdFlUo+Poims3zileJZz+qEJ0sRlM+lssJGPydgMyEmWYh52DxN5XaNkPCqu9
         d7erUjS01Q7oHKvM/pw6UAp953sIESOQrgZFLu6C7Eb5AVlV4Bz/xQVCUtLs2xqgOKnZ
         Moyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828831; x=1738433631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/se+ZOUWHI4guWWCfgPKU8ovKC99g/6LRZidVGKe1oI=;
        b=w5LUVltpk88pQrnwXjgZGp7K0QLrpPMuHNvXGvU7vV30YGUA/gkw0Puikji9Uu33Hq
         TOUOtZDldtvOEWG/sDkQvYZYyWlt4D1N4yndZT8y2rbW6hO1udNHZ7VJYfAj9Llv3P9I
         2H4FhRaiVZmJaE2dZWHVffiAJcEDC4mtV6FRYNAC41bsvcZ4BY1l3bYVAT4g4z0dTKI4
         TpHA59DebJKHNGj5UMKevlsBqDNVHOFgqVJ540fD14gBBTYbOPg/tMQwMLRTFtWSq0Bx
         RczUubyl5vxyRvRbdDnR1lImSR3E4qMNDg1dugDC2zjHLKXsZIXq5koo7exf2qW/f5VF
         wUSg==
X-Forwarded-Encrypted: i=1; AJvYcCWeVBHglOY2vDriEwI6HPThPBPPUmd23oDTJDwjMiSypEnl4nUN7O0puTImnBy1lA4iPRvUgmVHo+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQnDdqUCilr8H2rkEXjNtCQkra4ZE9zZ4vLSDBhppD0Bb9TKW3
	JTjtvHlkU5Zl/JLEfQ60TZyWbBk14c6NEw9kVVsvWNMVkbbIs0Ta8euzYrIRc0w=
X-Gm-Gg: ASbGncuDfjvoKXWCnCyMTXso0CLiZ2ryRZb3UHVxug2IRLAytSaSB0lxL5+3dB8vBOl
	dQKKlN4N1EdIFaOtAbOUcZL/a2NKukatDKVKJblVPcrkRrcMRD2z40wt8q7C4GuNlM8GSmN64x3
	31vWZ4dePZXdZs4KTlQt+ZiWebVy8ekwxlxEidljJYosTHfsKAiO+sno+qWZmhS+flPdRtlgJh/
	7BzLkFNlycCqyr2nKOgRDhIu0jV0ip8+k/wSU7pKdSq5qYGiOkDwfYpC5eUzf/RnQcQH0MyemsY
	tcSwKUkaQ1wo8giigsDYgDp3OXRCbDCFLtLAkrKFD3LwTpQmbcoEvEWyOaIw
X-Google-Smtp-Source: AGHT+IGP2iaXKLI15CkhKDP5NBlnFOMSHwCbGSNXKLvJxawalslRdLF5wYi0CoJhDHevjTYCGWh83g==
X-Received: by 2002:a05:600c:3d86:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-4389143c306mr335517805e9.31.1737828830945;
        Sat, 25 Jan 2025 10:13:50 -0800 (PST)
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
Subject: [PATCH 1/9] hw/sysbus: Use sizeof(BusState) in main_system_bus_create()
Date: Sat, 25 Jan 2025 19:13:35 +0100
Message-ID: <20250125181343.59151-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rather than using the obscure system_bus_info.instance_size,
directly use sizeof(BusState).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 9355849ff0a..f713bbfe04f 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -323,8 +323,8 @@ static void main_system_bus_create(void)
      * assign main_system_bus before qbus_init()
      * in order to make "if (bus != sysbus_get_default())" work
      */
-    main_system_bus = g_malloc0(system_bus_info.instance_size);
-    qbus_init(main_system_bus, system_bus_info.instance_size,
+    main_system_bus = g_new0(BusState, 1);
+    qbus_init(main_system_bus, sizeof(BusState),
               TYPE_SYSTEM_BUS, NULL, "main-system-bus");
     OBJECT(main_system_bus)->free = g_free;
 }
-- 
2.47.1


