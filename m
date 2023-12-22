Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F281CC27
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659543.1029257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhOV-0006vE-1T; Fri, 22 Dec 2023 15:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659543.1029257; Fri, 22 Dec 2023 15:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhOU-0006qP-Th; Fri, 22 Dec 2023 15:24:58 +0000
Received: by outflank-mailman (input) for mailman id 659543;
 Fri, 22 Dec 2023 15:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDd-0007Ie-GL
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f175bc-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:45 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e3901c2e2so2351849e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:45 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:43 -0800 (PST)
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
X-Inumbo-ID: b2f175bc-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258024; x=1703862824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZhPBjyZBqgBpywqHlV+02WIfS08ciwegVuM8jISg+I=;
        b=JYdOztOXinll0LmJyP05WBLtWHGtTirUPn71s4MTMdEwlh6paQJzo8oW5fTknFwBdJ
         3DDQVaNZLFu74Gz1D3OIlqXWDBYvt7tCphJTPHachZ54RzXPBSAOz6ONDoLjkJHC9hvR
         /ZN3TL7zTaTDvDncZnaTFwNqHSeViSe5Ah1Te6ZQA+6YOUu0GShQjFdGkB4cmOk6NsBP
         VWdFJJth9YBFub2Vs7tWSEaNC7DdGLjbMHJ6UU/GjxE1JChx7KCYBWFtCW6vtiVx0smb
         w5mJmDiTePDUTf1xqsODTX3qd4MxjzQeiJBqwfxBQK7vciY5sGR1uNXYXfIdfVEpKxVN
         xPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258024; x=1703862824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZhPBjyZBqgBpywqHlV+02WIfS08ciwegVuM8jISg+I=;
        b=Ihg4UawVpkf2fMeHuD92rc1NqQFe52oPQQtyD7yKq3QFENMsO20lUdXig2iIOTjscT
         96UpEre1YJPrTfUlI7cO5bkppymXYWonHOyKkXGELR6Hu+LEvEQQRP9scEGObj4ZD/0s
         KCCngP/bC+U/4lhRP6VcpNbzeZcrRAVO71eAwDzlIgr1x1w1W8cXseolQYJGrfBJb70c
         zSTIq1LuiA4T/rFOuBQKHqa1hRHpRjT+F/P+RHHqehGXWCS3HWAw3Tzj6CUlaJkZuH5E
         Zop499b7IBZSoyIrhvRIs2baZ9o/QnfyJdJZewPk4ZQMISggKFnnNC2F+hNC32phZD9J
         7+wg==
X-Gm-Message-State: AOJu0YxhbToXC7E8Gda1LWVPqn6SHvSrEkADc0cL+nRiqfQJZ6v9jmas
	eoCBaLn4IQIv6pkoutR94+ZOAM7oJLc=
X-Google-Smtp-Source: AGHT+IHL6pMsv/sCdYNQ/iuKnuHjGlxcfIEdKyveSyp3rrjxlVpyxCEIKR0IY0dQpPtuOGuumoo3Bw==
X-Received: by 2002:a19:e01e:0:b0:50b:f83c:2449 with SMTP id x30-20020a19e01e000000b0050bf83c2449mr714243lfg.69.1703258023958;
        Fri, 22 Dec 2023 07:13:43 -0800 (PST)
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
Subject: [PATCH v3 19/34] xen/riscv: introduce guest_access.h
Date: Fri, 22 Dec 2023 17:13:03 +0200
Message-ID: <dd1741ee7ed3332106c08a2caf0daf8926570664.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All necessary dummiy implementation of functions in this header
will be introduced in stubs.c

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - remove unnessary inclusion of types.h header.
 - drop copy_to_guest_phys. it isn't needed yet
 - add SPDX
 - add comment above guest_handle_okay()
 - update the commit message
---
Changes in V2:
 - change xen/mm.h to xen/types.h
---
 xen/arch/riscv/include/asm/guest_access.h | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h

diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
new file mode 100644
index 0000000000..c55951f538
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_GUEST_ACCESS_H__
+#define __ASM_RISCV_GUEST_ACCESS_H__
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
+unsigned long raw_clear_guest(void *to, unsigned int len);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+#define __raw_clear_guest raw_clear_guest
+
+/*
+ * Pre-validate a guest handle.
+ * Allows use of faster __copy_* functions.
+ */
+/* All RISCV guests are paging mode external and hence safe */
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+#endif /* __ASM_RISCV_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


