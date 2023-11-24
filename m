Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8447F7173
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640367.998408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSt-0006yl-FY; Fri, 24 Nov 2023 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640367.998408; Fri, 24 Nov 2023 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSt-0006s0-AK; Fri, 24 Nov 2023 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 640367;
 Fri, 24 Nov 2023 10:31:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSr-0006hy-V9
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:13 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970990cd-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:12 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so233131966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:10 -0800 (PST)
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
X-Inumbo-ID: 970990cd-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821872; x=1701426672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/LhKdH+wsJ4FACKp1nkzTY24/9rMB7kNhSD30IVABI=;
        b=YJFRmy0S4I0kYmBwkZK6WR20uDuvTyvS7N2YKBbeZ1b1dPjO/BYlcOvlzhGEEQx0Xf
         DMwfak8Cuv/8GGhGO8QDHq9co3kOgNKZ/0NlUJ/TWsMUODrA88BMXUAf9yvqcXbbxGcH
         VHowzWz1mNd7b9Uu0AuRuJ+OqnBn7Gxpee2/Eonhpj0NLdN5g7E3f9ksovAiKDoKTpqH
         6er0rkPk/tA/pCVV38/bInQZXPXZoafHfroIqqLXH15oBD+QLDB8k2u8gBEXykxdlZVM
         yGb8f0jnz0CiO3G0DKAY6tlFjH7Q8zSxhIbbt9CUCIi5FtuM8Cv4NS1daGE2rcNCdQhu
         ka1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821872; x=1701426672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/LhKdH+wsJ4FACKp1nkzTY24/9rMB7kNhSD30IVABI=;
        b=CPSxpFU/KGgvbMtuVZm9nM13FvVDQeFEQkwyPwNEj+xaXeQd/ul8mKjh5Mt0PAfXKX
         lfkAXWbUM8iQh5HMqH93GQ53ngTQhkAjNZIVz31BS0xBh/kfTf1y0Jc2dbRrClTrIZZ6
         /k/d/VnIZXiPvFxpzTfr5kYgOC18CubV0XVFflGfT+4fTeiY8fkuc/twtiIrcsYQ31gK
         KZScUJRc3jUhfkUg7zqhbjbha4cKN57hZo4yxwATeUtNRQFPHK/VXdTj2ZIeoYBInphM
         dsIpa6KJDDe3HDLFFvmVw0J/6x5rn0Ea2kiNSodSBexF32Ss8dVheIhLLAr3hT26gZMy
         uk4A==
X-Gm-Message-State: AOJu0YxLYeMW8AYZXtMH6N3LdDxQnkh7zNQIsjf4SYwqJFI/j+HKaUwW
	0P2S3iIEBBg8RWTTaMWv5ra180lwMrsONQ==
X-Google-Smtp-Source: AGHT+IHemo474FYP5BLuyhXRaIFO7m1r16zvpKHW5xicKFBse67/hxU7ae1o8ypgT7DVwFviLgplKQ==
X-Received: by 2002:a17:906:d4:b0:9e3:fbab:e091 with SMTP id 20-20020a17090600d400b009e3fbabe091mr1757101eji.15.1700821871566;
        Fri, 24 Nov 2023 02:31:11 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/39] xen/riscv: use some asm-generic headers
Date: Fri, 24 Nov 2023 12:30:22 +0200
Message-ID: <90beae5dfa2bc4c27108ca4dea630306dfdfe81f.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers are the same as asm-generic verions of them
so use them instead of arch-specific headers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New commit introduced in V2.
---
 xen/arch/riscv/include/asm/Makefile | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/Makefile

diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
new file mode 100644
index 0000000000..4da0c70cc0
--- /dev/null
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+generic-y += altp2m.h
+generic-y += device.h
+generic-y += div64.h
+generic-y += hardirq.h
+generic-y += hypercall.h
+generic-y += iocap.h
+generic-y += monitor.h
+generic-y += numa.h
+generic-y += paging.h
+generic-y += percpu.h
+generic-y += random.h
+generic-y += softirq.h
+generic-y += vm_event.h
-- 
2.42.0


