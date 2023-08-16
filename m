Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E041F77DE71
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584329.914981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdc-000669-Jm; Wed, 16 Aug 2023 10:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584329.914981; Wed, 16 Aug 2023 10:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdc-00060J-1J; Wed, 16 Aug 2023 10:20:28 +0000
Received: by outflank-mailman (input) for mailman id 584329;
 Wed, 16 Aug 2023 10:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdZ-0003R9-9P
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8378e00e-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:24 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe8a158fcbso44441095e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:24 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:23 -0700 (PDT)
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
X-Inumbo-ID: 8378e00e-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181224; x=1692786024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Z1GOv0L7eneEE03UUszqK5L6QB9SaAg0ZlPLu+8KY=;
        b=nY8c6UHXlOSIEzV1EUmuKYTtZRYZM6+OZt7TXs4smPLts6f9VjCuA51vPmiS+Wbd9Q
         QADtAsAR9g3jZQvoAcJK2ud00TLDOnAEZb0I3/xQoWDhzYYAreDOCMGoxiOYTCtcV0E6
         086E2dJlVeCozv5pirXSNqKdw8QflpqnncA90RNeB2KksM2to20adUgMNTednJtYMCF4
         A4rVdSviuXmi9msWwt60NLrcZJl4MLPooEEAoCh5AFtQsCZj/pu3bIEm3DqpOG9RlDib
         fgb6PEfffUITzg0FK8UgkovSBBTaKnvl2dfyqTS4ynm1fxuGWTYhyiOwkeoTFI2X+Dwa
         nBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181224; x=1692786024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/Z1GOv0L7eneEE03UUszqK5L6QB9SaAg0ZlPLu+8KY=;
        b=LhhGiIYnSNz27XBn4QIQLU8g60p0gvmRihT5JSedXhcSTY0UKLKlvHcMUVheSZ5eJE
         YELPIuMY6YyS3oP9nkrx+i2/94hlCOwnniH10PLarV+tJbRrKOAV8qUkrGbKrJXVR+fq
         3XYTfczfYFF4nhnQP2vzjqHhFFHTsDToj7vj8w9LZkfHZFfmfA1BMeoPyVnV0AD9IO/0
         VtirYBm6zsvzyFRngmyFjIMaSZOf9KlrH4cyYMxA0KAIw3S7hpevCwRGiJ/woN6F9zwm
         YmDf1bwjXttHKm25ZRI/06kN4Hl3XzTE/1R5NLBKmi3GPTRWMbMNaSfvujK4TvS2VSBw
         yYng==
X-Gm-Message-State: AOJu0YyW2RuPzgbhenm6L3mueyMfNlGuXgAahC+GiYbpoJ7RJHbp/qoN
	zGrvvt6Du1zwoHzTjdLdiur4fuADSYhctK0A
X-Google-Smtp-Source: AGHT+IGxRneje/D4AvLeXzQcfk3RipsGhwAdKBYqpnjptg8mvedJt/mKWVR7QpRMIrSCcwsesyLP1Q==
X-Received: by 2002:adf:cd06:0:b0:316:ff0e:81b6 with SMTP id w6-20020adfcd06000000b00316ff0e81b6mr1441065wrm.32.1692181224118;
        Wed, 16 Aug 2023 03:20:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 12/57] xen/riscv: introduce asm/hypercall.h
Date: Wed, 16 Aug 2023 13:19:22 +0300
Message-ID: <35b62b1741e585e2c617ee39ff807468ad39875b.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/hypercall.h | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/hypercall.h

diff --git a/xen/arch/riscv/include/asm/hypercall.h b/xen/arch/riscv/include/asm/hypercall.h
new file mode 100644
index 0000000000..f58c2f2761
--- /dev/null
+++ b/xen/arch/riscv/include/asm/hypercall.h
@@ -0,0 +1,4 @@
+#ifndef __ASM_RISCV_HYPERCALL_H__
+#define __ASM_RISCV_HYPERCALL_H__
+
+#endif /* __ASM_RISCV_HYPERCALL_H__ */
\ No newline at end of file
-- 
2.41.0


