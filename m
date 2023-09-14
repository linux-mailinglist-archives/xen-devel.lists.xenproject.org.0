Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C4C7A0823
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602369.939011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmZ-0006eR-Gx; Thu, 14 Sep 2023 14:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602369.939011; Thu, 14 Sep 2023 14:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmY-0006J3-AR; Thu, 14 Sep 2023 14:57:26 +0000
Received: by outflank-mailman (input) for mailman id 602369;
 Thu, 14 Sep 2023 14:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmT-0002WX-An
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:21 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c98717-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:19 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bd0d135ca3so17408501fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:18 -0700 (PDT)
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
X-Inumbo-ID: 00c98717-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703439; x=1695308239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd3/ASfal0zkAAp1bRz+HwPmAgboUa4bs082ZF03pek=;
        b=DeNY3RIR83XMAo2VG94ifBNrMh/JSbYl0kntm/e9Dhj+Vg2VxIO5DiqSEwK2lt1n0B
         Fze6wotB2E/AGc9pFZ7Gsme3bar//oLT0vRHFeFrgQC5IpnLDyyF8TmvZSwHJ46omWzH
         6FZf/9aw/Ju3PPlc5rzsf7qEEMwb7mWMG89VezTAW35Eah//XtwrGyrv55fEL4foUypq
         3RrvGMDMeId2aFbt0uu6ZKXfQrJj+kzkLy0G9uFBHYtzsw+FsFAlJVB0Ym65qy45PsIS
         H0x4+rKDVrDzSWk9AhNUmCwK+N7+ZTXWx+tjF9eWLuews/ooqSzeQEYJFMUgscuWteed
         pxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703439; x=1695308239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd3/ASfal0zkAAp1bRz+HwPmAgboUa4bs082ZF03pek=;
        b=lsx29N0PtsugRi9Bz/saOxPPLLID3XUCA5/V1WE6FzXauPG0ILnUcdxQoPeEURpcG0
         kLY11r9r8Ic0Kf6qrNeIy0HSMaiurKGiW+mtPYHKjd/xYJlxgwSgucSq9qTIYXcEAmyb
         TgXaxxR6p1bQPjFCO9BHlngSIfkjtRZn1YmNj8OISG/LaOFM/enVwg1jaQhATzs2JP2C
         eU5mMPQ1Kj09ifLpT8lKCxE6t2u9wPl22HqLm5gSwGWK97573ejf6gynxdRpAvHW+2u3
         +t2/pF8axs8Fo/hIy5WSWfLjOt7LZrTYikCm/a5sQBOCSYg6+E/M+Hcwxe/b/YCNWsmz
         wuWw==
X-Gm-Message-State: AOJu0YzJQ+rAGDmlFV0AEKKzStG23XDgSvqNPUUxhxHxz5/zZLp43j1H
	1pJ9FblpLDzZAQulFGPXVHx10h9PbGg=
X-Google-Smtp-Source: AGHT+IG0FhU5Dx903IWeGZXwqjMJHc2mW4zyOBCiqQMT28ZQZt72zg1isChvAMfjOF62qGlgaZz5pw==
X-Received: by 2002:a2e:98c4:0:b0:2bf:b182:9b7f with SMTP id s4-20020a2e98c4000000b002bfb1829b7fmr4856579ljj.26.1694703439132;
        Thu, 14 Sep 2023 07:57:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 15/29] xen/asm-generic: introduce stub header xenoprof.h
Date: Thu, 14 Sep 2023 17:56:36 +0300
Message-ID: <0b7805d6bd5f16d06656093d964d5d90030958d7.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/xenoprof.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 xen/include/asm-generic/xenoprof.h

diff --git a/xen/include/asm-generic/xenoprof.h b/xen/include/asm-generic/xenoprof.h
new file mode 100644
index 0000000000..8ee3408b77
--- /dev/null
+++ b/xen/include/asm-generic/xenoprof.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_XENOPROF_H__
+#define __ASM_GENERIC_XENOPROF_H__
+
+#endif /* __ASM_GENERIC_XENOPROF_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


