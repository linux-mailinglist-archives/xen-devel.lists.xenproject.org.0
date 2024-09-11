Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FE974F38
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796369.1205956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDV-0004Pn-TG; Wed, 11 Sep 2024 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796369.1205956; Wed, 11 Sep 2024 10:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKDV-0004MC-Oj; Wed, 11 Sep 2024 10:04:53 +0000
Received: by outflank-mailman (input) for mailman id 796369;
 Wed, 11 Sep 2024 10:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soKDT-0003qL-Nd
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:04:51 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4849b66a-7025-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 12:04:50 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f752d9ab62so62261731fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:04:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffc9d6sm15338281fa.42.2024.09.11.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 03:04:47 -0700 (PDT)
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
X-Inumbo-ID: 4849b66a-7025-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726049089; x=1726653889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnZ4PyJt9lC/ZKtcJqrE5tYdg4IwjKtttouG4oOrql0=;
        b=RsIbHubCce6QWkrJ/YvqCYmfyMoTgZ9MAykkxFTuhPFqL6/W11GbG7Ws5oSC/w27ZV
         YrX784XwvpxGyKRnwyfBXKHcLlmaKXge1q4qnaHvkMbSUWktWiuhPmuJ4rIGQ3UMKZya
         FGY7tMt97UO7Ge7a+9BOcgei6Qab0g/LpOIPXfG3p4TzbiOcsXa2VOdGEzrG1Hkp20ny
         2+SqbvbpMDvZ2eopLgKDT01WUMtXbe9niZyWs2xO/J8XnG8zneSqrIlCxg5p3x6vCp54
         Bc+24dttbBXhChQstuOe8sQ4LU0nPqZlIudrWWyswVmfL05bgqwzUVNh4XvdFLnu2FZq
         luDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049089; x=1726653889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnZ4PyJt9lC/ZKtcJqrE5tYdg4IwjKtttouG4oOrql0=;
        b=u3u6eyXME4o4j/H+kBZslW5peBBcjkinO3i6+eIVraaRdX6r/wCMeMPUoO4FlSULhy
         QBuN+qzbeMvMS1fQBSliyiVpaUmxKL228GpOu04FUo6UJWAtPotZzS6Lxbx6h5V2hbtS
         xIoj8i3lRpo6VV+3PcCIOYzHp2JFQlaiFMQRKNF4It11x2BlGgEdwufp8g/v2lQBcKdD
         HeZvSxNu8pcpqdhqLyJL15hNuCkDdGd2MxqwxAYk8xzzpFXqSgP4cs5Ey2dsCURH8JNU
         2oMXw8jokd+8hbd2eQ4MQ/9spt41nm1rmLMhh6pIhvqemFcQzR8kWAy299pH96uAOHfc
         S2IA==
X-Gm-Message-State: AOJu0Yxj4Wr5WdkL0Jc4KWJtP3q4GpGDm5OiydhQp0IQWwQeO63c975f
	85ajN2Rp/H9pWcDSHTQwtSmqMLqK2tONAs6ZY2Vv6eQUJn+LXH6iiZgigg==
X-Google-Smtp-Source: AGHT+IHqnXu7p8otAESKMD/0cX4MQdhb4k2AhXwRJRxW2JVNp4NkMmaBMArCzweTmHCi7Z/EB2pJBg==
X-Received: by 2002:a2e:a544:0:b0:2f6:4f17:aeaf with SMTP id 38308e7fff4ca-2f75b942356mr71375041fa.45.1726049087844;
        Wed, 11 Sep 2024 03:04:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/3] xen/riscv: add section for device information in linker script
Date: Wed, 11 Sep 2024 12:04:42 +0200
Message-ID: <e0d5d5505c89a81997240a4099090c96d37c1bee.1726048521.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726048521.git.oleksii.kurochko@gmail.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the RISC-V linker script to
handle device-specific information.
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/xen.lds.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 070b19d915..e65707ce3f 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -157,6 +157,14 @@ SECTIONS
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
     } :text
+
+    . = ALIGN(POINTER_ALIGN);
+    .dev.info : {
+      _sdevice = .;
+      *(.dev.info)
+      _edevice = .;
+    } :text
+
     _end = . ;
 
     /* Section for the device tree blob (if any). */
-- 
2.46.0


