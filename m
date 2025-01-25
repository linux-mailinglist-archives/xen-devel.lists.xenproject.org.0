Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD2A1C4E0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877076.1287294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkmU-000250-1C; Sat, 25 Jan 2025 18:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877076.1287294; Sat, 25 Jan 2025 18:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkmT-00022L-Tm; Sat, 25 Jan 2025 18:21:17 +0000
Received: by outflank-mailman (input) for mailman id 877076;
 Sat, 25 Jan 2025 18:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkg1-000565-Dx
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:37 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bb8d6d0-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:14:35 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38634c35129so2839719f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176490sm6041968f8f.1.2025.01.25.10.14.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:34 -0800 (PST)
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
X-Inumbo-ID: 3bb8d6d0-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828875; x=1738433675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl6x3NGb6owz3SHDZJmiiZ4r1za5TcxmylUs2G0w4SA=;
        b=MzxmPvjlGOARY7CzHWPsCrATcH3j5+MVdYyjAzrqoWQrOQR2+0+sSyci+/mBFkM3TP
         2x51gqia362cVAj67XryFhVDi2wI068GQNkMlvmKkt3NwcRycy7OhoXSePGd5gw8E74K
         XPOjObItHTA15eEq7txG4Dfecu/gvEta2JTW+C01a176YD/cGPmfoNkHXKmAfJ4hiL96
         JY6UikE1/1jPi2nGlHyx4o3VcQXquXjwcIjy93EPTaUrZYJVJ79FXhpjd4PiYdpfUqdv
         YYjuGjTxPglhJgwBGleHXJH+zr1osCT+Bz7Hw/Sf37Ju5w45N5FyJXh8VMD+RLZhgC5V
         15wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828875; x=1738433675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl6x3NGb6owz3SHDZJmiiZ4r1za5TcxmylUs2G0w4SA=;
        b=B99hmk03Pxiqrmkl9m8AUmc3LZwhAEHB0L7ys3RvRd+yJiWG46RLVJMB/alizXl5ul
         0yst4MZpQ/+WUjLQRssus6IOkkvD8WPs1Vxwdo8AvDRdqkNMmidaUA3fTcFZ5YnjCfvX
         3/5RIpgZylJmYuaEBWSIV0z64i1bmF5Yr1ygzEQfhJsR9eH75qKKBQLwQTaSORNGc4od
         DiYKECuwFnBo7YA2RwswG/nBGlnGDSqxbhikLLkaZ1gEX64dKzP/TqOMc/757GF1nsu1
         TxyYrGd2l9QGJONZt4iLGIFvnj711mytaUd/jDatiQx2UAngPTQh/cZb90qA/XUZ/tWt
         zZJw==
X-Forwarded-Encrypted: i=1; AJvYcCVcwVc0U05VG1jgOBSfTtBoDEMEkSRBXfORhoG9rcd9Sbn98zNVWJ0EJ3AdJUPuJbMe9Y8Y/UwG8fs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypvZPtVKWOo48K+26ALr1Q13MNTCnnt2oQxrk5F2aHj2vtZLE2
	DysmPpowsnSvkEG7lArnyfQxpypH/4ZKv2O5tGIIJa8gojwAq3YwTpSfR8XPTgo=
X-Gm-Gg: ASbGncu1QnZ0bDz22a11rY8ZdgZnLsPRJugnhpcmK2NAbbDWArezTKTwbgRowPW+tFI
	IMdTkCqv+ytRQ1HuwvnTiysAGiDOBJFZqXnUJWxNHJdx/Y2pchRKe2VvOvOGnmpDTHYlOlk+UqG
	eteQldDsRkLAzrxlo8ULHHeArUFGxw/QvfZuj8NLGEGs4SUnPviccMxthJJ8G+B8y+8G6g7Jh00
	mR3HTcnrdPgZ0le6v9wX6kpKVv2PJeMJZsWXYKoyaOPgStOOSWqwvzsGTZyf7GXxphA+JfaWQYU
	/82JlF0d8jedt2L4dXizZ2GZ6sZzUlbTdrdMEnRV9F7e2PA2Wmo6agBESXkT
X-Google-Smtp-Source: AGHT+IH6Im9WAFP62p+c65YcO9soXGrjbd4TGzQetbCmkepXX8mf8yxKvYvU59Qz1V1TA9WTvs42GQ==
X-Received: by 2002:adf:f504:0:b0:385:ecdf:a30a with SMTP id ffacd0b85a97d-38bf57ab510mr28008868f8f.33.1737828875399;
        Sat, 25 Jan 2025 10:14:35 -0800 (PST)
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
Subject: [RFC PATCH 9/9] hw/xen: Have legacy Xen backend inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:43 +0100
Message-ID: <20250125181343.59151-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because the legacy Xen backend devices can optionally be plugged on the
TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.
Remove the implicit TYPE_XENSYSDEV instance_size.

Untested, but I'm surprised the legacy devices work because they
had a broken instance size (QDev instead of Sysbus...), so accesses
of XenLegacyDevice fields were overwritting sysbus ones.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen_pvdev.h  | 3 ++-
 hw/xen/xen-legacy-backend.c | 7 ++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index 0c984440476..48950dc2b57 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -32,7 +32,8 @@ struct XenDevOps {
 };
 
 struct XenLegacyDevice {
-    DeviceState        qdev;
+    SysBusDevice parent_obj;
+
     const char         *type;
     int                dom;
     int                dev;
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 118c571b3a7..4d079e35d83 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -640,16 +640,14 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    /* xen-backend devices can be plugged/unplugged dynamically */
-    dc->user_creatable = true;
     dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_DEVICE,
+    .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .class_init    = xendev_class_init,
-    .instance_size = sizeof(struct XenLegacyDevice),
+    .instance_size = sizeof(XenLegacyDevice),
 };
 
 static void xen_sysbus_class_init(ObjectClass *klass, void *data)
@@ -672,7 +670,6 @@ static const TypeInfo xensysbus_info = {
 static const TypeInfo xensysdev_info = {
     .name          = TYPE_XENSYSDEV,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
 };
 
 static void xenbe_register_types(void)
-- 
2.47.1


