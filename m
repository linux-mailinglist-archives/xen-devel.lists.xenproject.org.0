Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCA867ED7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685696.1066873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewk-000105-H1; Mon, 26 Feb 2024 17:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685696.1066873; Mon, 26 Feb 2024 17:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewk-0000va-BJ; Mon, 26 Feb 2024 17:39:22 +0000
Received: by outflank-mailman (input) for mailman id 685696;
 Mon, 26 Feb 2024 17:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewi-0007o5-9I
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:20 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7e4da54-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:18 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso53510311fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:18 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:17 -0800 (PST)
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
X-Inumbo-ID: f7e4da54-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969157; x=1709573957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eivVMumAvXMrEoExb3VSoypb50X29skE1zCwutaVn60=;
        b=NTbUmIcsaJYyu1/MgZgvqf3H96ZIsl3SJmbf6PNDTP7EiPVQ8WuXbIu1oOZGqHnbtT
         ed2DasKbbOT8f1rnW4zQzuRWI57LdGmiZJ6BcgniolSh/XgBpLflarszVZrpGEbt02RS
         ZUD3KKIzJHnN+AhAdONK84fV3H3arvuQ5RQgCTPBNhyOrXla0bC5kVWMv/2Wx2B+YJYX
         4tZHdo+aJXvsdq4NFoUJkotn2znMNsno0Q78jjYpxuN8ChjiCld53l0F+wN0VzaJcrhj
         tnS1I8ltFRnk/I2+FwzdP9A7grsKvtVRZISRzGiI0jJOBtP0+nYxC1hLHPA5WR9xvanx
         L0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969157; x=1709573957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eivVMumAvXMrEoExb3VSoypb50X29skE1zCwutaVn60=;
        b=tYR8jCVrq1Kfr7WFTmhdQUx2QXVCkGi9tGR4qHpW7bSOngbK70fBOf46E0H2w4+vW6
         +5vfvoN8C2VHvxqsTRLOT2mef6V2da0AT6shzvG4WGC/RT9VLyS7n9cxDUCIyK5Nx+o7
         8oziGvyUmvuofT0Tk39/kZuFkXYfd1vyK4Kt5R+tNV+zGRFVE1aq8SVtpzOFF61ddf8D
         lAtcZ916WnS8aErxuablTEFsbGOxCFVt2aIUPT1tZ3grK9O85AI13uAnBm9Ze76P+/Zn
         XCAPYFMeny4Tk3Un3eKmAATxTOJkWA/skvWbLF4cLdQBA7+MBA7/ceYZLxpHl0DGAjcO
         qW1A==
X-Gm-Message-State: AOJu0YwRUKoEpvq9kOFbRsr0qpPNsn/S9wRgxKEmAmAM2t1Lf2j7T7or
	BJxTYPx15Us2pMdahLhsqoSaa10Nzd1aqBMEVz5++V8yYuEDnZDoAW4b1h4l
X-Google-Smtp-Source: AGHT+IEeMZ/eHi/bYLV/U1FBIMclQJSUe6RCUzqCHjHTnw3w3bZD2rpAWXJhGJjEYOmFib6YAXHCwg==
X-Received: by 2002:a2e:8217:0:b0:2d2:6574:4011 with SMTP id w23-20020a2e8217000000b002d265744011mr4335694ljg.30.1708969157499;
        Mon, 26 Feb 2024 09:39:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 06/23] xen/asm-generic: introduce generic ffz()
Date: Mon, 26 Feb 2024 18:38:48 +0100
Message-ID: <a5b5c23122ee55cad72dad74b47cb7a539ebbc01.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic ffz() can be useful for architectures
that don't have corresponding arch-specific instruction.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
   - new patch
---
 xen/include/asm-generic/bitops/ffz.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 xen/include/asm-generic/bitops/ffz.h

diff --git a/xen/include/asm-generic/bitops/ffz.h b/xen/include/asm-generic/bitops/ffz.h
new file mode 100644
index 0000000000..5932fe6695
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffz.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFZ_H_
+#define _ASM_GENERIC_BITOPS_FFZ_H_
+
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ *
+ * ffz() is defined as __ffs() and not as ffs() as it is defined in such
+ * a way in Linux kernel (6.4.0 ) from where this header was taken, so this
+ * header is supposed to be aligned with Linux kernel version.
+ * Also, most architectures are defined in the same way in Xen.
+ */
+#define ffz(x)  __ffs(~(x))
+
+#endif /* _ASM_GENERIC_BITOPS_FFZ_H_ */
-- 
2.43.0


