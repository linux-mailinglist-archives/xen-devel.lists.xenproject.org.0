Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C11E68DC02
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491189.760219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFQ-00058Z-Ue; Tue, 07 Feb 2023 14:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491189.760219; Tue, 07 Feb 2023 14:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFQ-00056n-O8; Tue, 07 Feb 2023 14:47:04 +0000
Received: by outflank-mailman (input) for mailman id 491189;
 Tue, 07 Feb 2023 14:47:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFP-00043Z-1c
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:47:03 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482f607f-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:47:02 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id g6so5812540wrv.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:47:02 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:47:01 -0800 (PST)
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
X-Inumbo-ID: 482f607f-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZbJvpQHfICiARUPdSaE3T2PkEjqSCE47Uwko84j3uw=;
        b=GVtSuZg1axNOgd53uaa0Kr+pnNaG5LGEC0bMA4qUijmsPrE5UxNqPA8h5nELV7ZCdz
         AoThuRXw3lWb+3mAYdw+iQdVf41u8s1RTDkoeqDXU86rQyu/Cm/BJkh3rFHw9VrH9UVZ
         RdHcxfYUXwiYi1OZHOL9mydJnq4C5gm95b0QxJCBdtnDJRwH9oH48aoIa8O4m+XiYLJ3
         RnLrjFjQPotwK0fkAqUs88XUkJHzMoF8pg9s2P/Z5p2ZjrlqKGHAYz7QFkHV9T6K0HTL
         CMGFRuwLeOIWQu4oqoCPuf0l5SacqftDs5gyo+jO/QjRFzzcu6AAAOImMre3LHzIwmKA
         /J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZbJvpQHfICiARUPdSaE3T2PkEjqSCE47Uwko84j3uw=;
        b=fYU9poOyLmmu94FcFA5b+RTMaJtRmsGKfTXMPsyXXkoF61qiO3pyfSl3wDTGS38LDu
         USKcqp5TGqy/Q6AnDoRTDwkNoIIf9s+U+UqdGk62J4Ys+RseBaj6Z3MO7dMBdEFrNqgS
         zi70o1bnWgq7LGiMkz4npXGLNwb4mWwJl2mX1WkH3SS27lLsxZpXRat3dNgwO6VfCsJA
         sWZQONmU+AuyHqCW5H4IzPg9esOngfSvxH1SJrYXTjwYUQ9nDtYeIzNqTrYLCb+VKXf+
         ao4Uz3qjjfww+m3gdoi2zdzf2dGc95elJK9CIebHnUXdyxoeCwSuUuOzyaLZ6+QZe+Dv
         bOEA==
X-Gm-Message-State: AO0yUKVvSQSjknedmYOfhpzLCEWYU0ECOPfLAyesm8RXNw9S2NGRK9yd
	kCV3lbyL4Xa+RJxzL+ZOvUqWFp3wzXY=
X-Google-Smtp-Source: AK7set/83iLuQppbz9zdeLU6RBjnX0wck/UfT2HChKiNCZZppvs+dYzLgd/1LctfNATlSL03MOswTg==
X-Received: by 2002:a5d:6707:0:b0:2bf:da34:2b37 with SMTP id o7-20020a5d6707000000b002bfda342b37mr3091845wru.3.1675781221864;
        Tue, 07 Feb 2023 06:47:01 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 05/14] xen/riscv: introduce empty <asm/string.h>
Date: Tue,  7 Feb 2023 16:46:40 +0200
Message-Id: <cbf967f44dd6bfc07bd7e2dd370adf3701886f34.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675779308.git.oleksii.kurochko@gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To include <xen/lib.h> <asm/string.h> is required

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
  - <asm/string.h> is a new empty header which is required to include
    <xen/lib.h>
---
 xen/arch/riscv/include/asm/string.h | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/string.h

diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
new file mode 100644
index 0000000000..a26ba8f5c6
--- /dev/null
+++ b/xen/arch/riscv/include/asm/string.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_STRING_H
+#define _ASM_RISCV_STRING_H
+
+#endif /* _ASM_RISCV_STRING_H */
-- 
2.39.0


