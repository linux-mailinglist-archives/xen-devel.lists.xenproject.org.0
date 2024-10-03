Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CF098EF0A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809331.1221638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKns-0005kI-Lc; Thu, 03 Oct 2024 12:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809331.1221638; Thu, 03 Oct 2024 12:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKns-0005bb-CP; Thu, 03 Oct 2024 12:19:32 +0000
Received: by outflank-mailman (input) for mailman id 809331;
 Thu, 03 Oct 2024 12:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnp-00043W-Vf
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:29 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc7b6462-8181-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:19:28 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5399041167cso1458781e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:28 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:27 -0700 (PDT)
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
X-Inumbo-ID: bc7b6462-8181-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957968; x=1728562768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=hw3BqC7yrpokaKnjL/PQHed5zvBM6DotqfZres8QRYZjXTrGRA29/IDDwi44G0fmSF
         y3qXnP6O1+kOXbsIOwK/YsubuqDnBpqmNKaZXM+nqB6ldr+UfcapegY8dl/IL22nda/w
         l54d8+lavCsr4MbSt+EN5VWpnGqHgu0dYaFEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957968; x=1728562768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=fIN+ay7K/XDv23W1es1JvVdO8ujuqZhXriBJUP8ZFOzGLnzh3qVo8XtVOIHlInmbHa
         m712aPCBl2i97/Jrh2MR5cOHCIoTdCZU/UMXMdBU8OPvv6Eia3NhjIzL9qTBB5Z77Twm
         OCdv/12dmLM4m8iibvA7tDRWCgBDv1G36jLz4Y3On8q2Y0++CicZXfEMwRQCS3bhF4x9
         BpbjvuKDYwdmT8RGpFvmIvK4FMSkTtg59r2RsQSfokoyijhWlBGHSNMlHzNpcDZiAEWA
         28suzwFCYh5wWtwUuRiQxil2/PNlt2j/SjOhddGMjvsBoVWz9B9AMD6o9jXePcWYlNky
         l57g==
X-Gm-Message-State: AOJu0YzcjNIyyglytJ0YSrK/dExk/DPrw1UQHEliXYma0YOoRXMX2SX1
	wdkkMFTTo91jR/8j/yOiDLG0fL8I5OEROzzPhdok3oqzx7SLSuhpXqw+hW5Prx+KiNjMqyCeSta
	P
X-Google-Smtp-Source: AGHT+IGL5x4+MVjNlJWb1+E57yRrRCzzN/es9laf3hJyOm9QMpXF7n3UozNauxlIhv8NTRHmQuTi+w==
X-Received: by 2002:a05:6512:3b06:b0:539:8d2c:c01a with SMTP id 2adb3069b0e04-539a067aff1mr6598414e87.29.1727957967733;
        Thu, 03 Oct 2024 05:19:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 08/20] xen: Update header guards - HYPFS
Date: Thu,  3 Oct 2024 13:18:56 +0100
Message-Id: <20241003121908.362888-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to HYPFS.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/hypfs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index d8fcac23b4..d6f5725221 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_HYPFS_H__
-#define __XEN_HYPFS_H__
+#ifndef XEN__HYPFS_H
+#define XEN__HYPFS_H
 
 #ifdef CONFIG_HYPFS
 #include <xen/lib.h>
@@ -206,4 +206,4 @@ unsigned int hypfs_dynid_entry_size(const struct hypfs_entry *template,
                                     unsigned int id);
 #endif
 
-#endif /* __XEN_HYPFS_H__ */
+#endif /* XEN__HYPFS_H */
-- 
2.34.1


