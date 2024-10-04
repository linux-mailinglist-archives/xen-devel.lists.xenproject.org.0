Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3398FECF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810094.1222800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVM-0007k4-GY; Fri, 04 Oct 2024 08:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810094.1222800; Fri, 04 Oct 2024 08:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVL-0007Zy-Js; Fri, 04 Oct 2024 08:17:39 +0000
Received: by outflank-mailman (input) for mailman id 810094;
 Fri, 04 Oct 2024 08:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVI-0005Vm-Fy
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cc1f655-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:36 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so216182066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:36 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:34 -0700 (PDT)
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
X-Inumbo-ID: 1cc1f655-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029855; x=1728634655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=IuXtHddlJF4EVBm4cqlg6dny3eR6w2F+vRxFaUPx3+WlJ1gglEHZisEgjHVzWEknht
         axH92xjNeZbahM1RtLAv4xemTNvJoWfy+2JQJ3KUEazidRhWGe1CQQx0I9ZwiSNcl2JP
         6+emAUnryy0Hnrt+WV7ST8+F9um2Ufec73jGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029855; x=1728634655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=rVD9v3LDrBx61BhH6xDS7sDtfAARMrBJ3/04fRG09xVxe+0eEv6BrjZQ0QfBCLjL/8
         DxcG2U6tSOPQIyL3AfLlfTAz0R8uUscIFTJh9b9/CB0DBM/I2NDJ2l3vxPfgX8xD8dJm
         KdjCv6yMIcdY9pTv3BiC/oqjZ1YB4TbJFo03i+/p/EhAPVuJskM5Ygx4RIgmZBnWyyL5
         pvWzkXiaHyYF2XHwj3nR3fYGiwVhIGKKrbBfUfWVLqOlqXuR91MBafAe3ECvZ6ZP6wsG
         3Mo2WotV+lOY7rsHDYwh0CcMljLM6leKPB4I0sNXbTxq0JzL70ceLnyeBInLEp7dtkYa
         7D5Q==
X-Gm-Message-State: AOJu0YwsV3x6Kx5cu25aUvzBmWbLdhk44WnVd0KyT9MC4y+/NrxJbFK/
	Fm2Tl8vRwe6F0gZ2VCmpid96Q5Epkjnbr6JnoQn3PrVY5s/xU/oZKC4lP1nBlS9uDW0F/MU+Pvi
	L
X-Google-Smtp-Source: AGHT+IG8JPvjC/d5jR3p1u5p5sQB7WkJpeE9C11xw13r1L+TkaUuny8oO0QufPVblaJ0CDtACtb4/Q==
X-Received: by 2002:a17:907:3e03:b0:a99:bb:735d with SMTP id a640c23a62f3a-a991c00e0ebmr174070666b.54.1728029855274;
        Fri, 04 Oct 2024 01:17:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 12/19] xen: Update header guards - KEXEC
Date: Fri,  4 Oct 2024 09:17:06 +0100
Message-Id: <20241004081713.749031-13-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to KEXEC.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/kexec.h  | 6 +++---
 xen/include/xen/kimage.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e66eb6a8e5..d9d79902a9 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_KEXEC_H__
-#define __XEN_KEXEC_H__
+#ifndef XEN__KEXEC_H
+#define XEN__KEXEC_H
 
 #include <xen/keyhandler.h>
 
@@ -94,7 +94,7 @@ static inline void set_kexec_crash_area_size(u64 system_ram) {}
 
 #endif
 
-#endif /* __XEN_KEXEC_H__ */
+#endif /* XEN__KEXEC_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 348f07f5c8..139d4366ab 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_KIMAGE_H__
-#define __XEN_KIMAGE_H__
+#ifndef XEN__KIMAGE_H
+#define XEN__KIMAGE_H
 
 #define IND_DESTINATION  0x1
 #define IND_INDIRECTION  0x2
@@ -55,7 +55,7 @@ int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_KIMAGE_H__ */
+#endif /* XEN__KIMAGE_H */
 
 /*
  * Local variables:
-- 
2.34.1


