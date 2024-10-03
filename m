Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8869E98EF0D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809336.1221683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKny-00070l-2v; Thu, 03 Oct 2024 12:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809336.1221683; Thu, 03 Oct 2024 12:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnx-0006tM-Ct; Thu, 03 Oct 2024 12:19:37 +0000
Received: by outflank-mailman (input) for mailman id 809336;
 Thu, 03 Oct 2024 12:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnt-00043u-Ua
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7752cf-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so117374166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:31 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:30 -0700 (PDT)
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
X-Inumbo-ID: be7752cf-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957971; x=1728562771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=TgGNZXGM88dk2nvaXgt8GGXDyC69YB6/LmwzK8wTvBVafMV7QAsAK3vi7juvbIcfQH
         4P9t9BvwLhnTrt6EC/BbQzH8J9Ns1ZfAJ3rxoBsEqn2VeyxMHhy4MfM/eOZ8g+i4BirR
         XYcVNrCJazcn2+25zUE5e3n8AfyIku9l/Noh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957971; x=1728562771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=h1fMBgZcYhBPVXEKKlIpdxpC0jcbxoAoEpULKufKhs28OF2SUOnpW21a99l4Kxt2GU
         n5KJ9y+4QXnoqY/y9BrqGwUqw9WV9Qbz7BeXpv/PbN1wS1rgwAyRcanV3r0fZEMmI9YX
         tNJVsM+KwrsziMWIr07VYFAx52oTD+bpyrDHuQd3vcQF0sSK+Q7fLOiI5O82FKhU50DU
         I5wm5jjIwy8B7fz/hkoj1LMC/brteMXzPpeiEv3HOjo7VT+aCpyL5aBp++F6fwg6N/lm
         AUif1NALbeQOlT7Uq6dXVvsh1viU0WAmwRAZO9CstgcGiV/lmSTMXl/U3Fjo1heLr6ZG
         F9dg==
X-Gm-Message-State: AOJu0YzNNiAXbbkPV4/wcQuAuCqUBtFKiqECjFxeLD34ovDlOGuArgFF
	1g180F9eNfc64g0CJxFwMsQTG6GHmL4vkvGRyzQEKf0dPh/LLm2XUWljtDorQaGAvzqqVt/BuSV
	u
X-Google-Smtp-Source: AGHT+IGOhSwTCr3X6dn4q1VWB2rQCWw5f55k4Sd8LXVO+G8Icl3NGLvpKNoV2CXmLLkI97IsRhGKWg==
X-Received: by 2002:a17:907:3605:b0:a90:344a:7db6 with SMTP id a640c23a62f3a-a98f838ddfbmr565931466b.62.1727957971089;
        Thu, 03 Oct 2024 05:19:31 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 12/20] xen: Update header guards - KEXEC
Date: Thu,  3 Oct 2024 13:19:00 +0100
Message-Id: <20241003121908.362888-13-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
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


