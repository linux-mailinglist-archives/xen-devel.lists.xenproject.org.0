Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB89A1C4DF
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877067.1287283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbklw-0001Ti-OW; Sat, 25 Jan 2025 18:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877067.1287283; Sat, 25 Jan 2025 18:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbklw-0001S9-LO; Sat, 25 Jan 2025 18:20:44 +0000
Received: by outflank-mailman (input) for mailman id 877067;
 Sat, 25 Jan 2025 18:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfw-0004aj-G7
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3899b430-db48-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 19:14:30 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so20164085e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm6225313f8f.13.2025.01.25.10.14.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:29 -0800 (PST)
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
X-Inumbo-ID: 3899b430-db48-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828870; x=1738433670; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjNRCKPy/l7f95vUUTcVvrIiqVVOepFXrbHeokjkTeQ=;
        b=R3aVdPAUhguLT5kpNme6AZC88RmfolhJpPq54ZQm0eqMCjpOAlhNXCXdS8G7uccpVb
         4bWLW6rEgLB75skcTm0t5isdAwig+IxBo3pWxrqB19xc3QfiwJk5+p9TPMuzeHY2deUO
         EuZf6wtw/OoXBmsDKvzZUnDrZwc+oNDpxczCUebGzhA421uDkPjzYNtJuYeI5OybkwEH
         WwzbyjSGJlGHXkFNOFAt/vXxGd6XvefWbGQE5yzyNo7yFQmCKP73Kdp4TFxlj7aAn8Bg
         D3/61m2dgz8ztKU8rtoGAQws6qF8EgjEDedgOvBgF7ltnoJlHbwdibnp5vhdRWcrEaYi
         JvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828870; x=1738433670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjNRCKPy/l7f95vUUTcVvrIiqVVOepFXrbHeokjkTeQ=;
        b=k9o9cwLbx/AyogCSTJkdqKmthAUYrESUqiYlApGuC7LCrMOqZXryOhfh1nvPkzudWk
         kwuWDwH9PK1spnOq2tlnVe17plgZF49c90j1oJjFP2N4LwNpwuBz7vfCIr7PNlXnbC7k
         JEbFN8uv66Q37RMBXnKYm25cdBHzkckfdRZE2b7mtwrgohbthay0X0qr/EeJbeL4Y3h7
         o4q9RC0GfyV7xbuyx4VAwXQYDYxxdiVSP1XgdsnwOpColZOGmDNWt8bxv6nKBSD7qjUC
         1RwS6W5N1q7DghUQ8ywimOdmnVb9woYK1ISu8hnPyt10dJIxKWQpyOhHgjrvMDop7uBM
         75MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXw9CAg1gbMnfAEEuNlPgA8h+9TtTynPKDyHCfqBDCKF2Z14oMGlc/Or36rEUWDdHQWkQ12fHHwu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9s42p1RXgEcA79qzmjk26Sf2b43FjvwHOEZBiz96IZWvVHlXg
	Zbf1mxrBUTFD5lZ5Zj3FY9pa52hFEbUPHkF7cwyFZSpXVttJVq3dmIyPdHXuGiM=
X-Gm-Gg: ASbGnct7hZ1Cg8pnh0AcNwsIK+enJUZY8aFOnHKoaIn1wRSX9LPePf4l2FbeW33U9Z6
	gbAGKbvqvWzgBh2aRD7T3tyZulglDgKmt73I6WmTsQTa+oAg2KXVOBPbaFcUHWTAkK5lM44mT2m
	O8HLGmAEaLh0M3zFDzPrKaQ4Qz7mrPWnkIs8Vu/EP+StuSPoJklGeStx6AD5CHYw0QvZiHIbH+T
	McMxSPj2vlE8OOeIR7GYvyA3BQZtBIS9iCloHdjgb4nk4LDb5KCTn9u/CUTPR9zmyt+xFDW4iCp
	RypO7Z1YJJl71f2I3yPkW2ZvjfqM2wakBBlKHuIUo5GA0NvIVqNdFTFl6Zfe
X-Google-Smtp-Source: AGHT+IGsW1rE0tr04FeKYA2KGXlK/mvTNA5dlL64lnJuwONXDJIce4w6YtcdzlGTbIKmz0lEq52uwg==
X-Received: by 2002:a5d:4d83:0:b0:385:f195:2a8 with SMTP id ffacd0b85a97d-38bf566cd2emr22422454f8f.30.1737828870120;
        Sat, 25 Jan 2025 10:14:30 -0800 (PST)
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
Subject: [PATCH 8/9] hw/tpm: Have TPM TIS sysbus device inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:42 +0100
Message-ID: <20250125181343.59151-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because the TPM TIS sysbus device can be optionally plugged on the
TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/tpm/tpm_tis_sysbus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index ee0bfe9538e..4f187690a28 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -133,7 +133,6 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
     dc->vmsd  = &vmstate_tpm_tis_sysbus;
     tc->model = TPM_MODEL_TPM_TIS;
     dc->realize = tpm_tis_sysbus_realizefn;
-    dc->user_creatable = true;
     device_class_set_legacy_reset(dc, tpm_tis_sysbus_reset);
     tc->request_completed = tpm_tis_sysbus_request_completed;
     tc->get_version = tpm_tis_sysbus_get_tpm_version;
@@ -142,7 +141,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo tpm_tis_sysbus_info = {
     .name = TYPE_TPM_TIS_SYSBUS,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .instance_size = sizeof(TPMStateSysBus),
     .instance_init = tpm_tis_sysbus_initfn,
     .class_init  = tpm_tis_sysbus_class_init,
-- 
2.47.1


