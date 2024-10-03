Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E698F5AB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809691.1222218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ79-0000OE-Rr; Thu, 03 Oct 2024 17:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809691.1222218; Thu, 03 Oct 2024 17:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ79-0000CX-F0; Thu, 03 Oct 2024 17:59:47 +0000
Received: by outflank-mailman (input) for mailman id 809691;
 Thu, 03 Oct 2024 17:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ77-0006qR-7o
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:45 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43a23eb7-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:41 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b3e1so1682255a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:41 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:40 -0700 (PDT)
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
X-Inumbo-ID: 43a23eb7-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978381; x=1728583181; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=Zwo4jlMqRIkuo9aOFaoZqfl/Zz90GVQz/KTxFalpJBra78EkPkOaoiymj864VF9lme
         l5NhYUNDjDUGy7/eJZiWrdTzXOQBMWmIvYLjy0KXlqbB62YVgfIreNhHeOwHqQ3lcIc0
         MLDZtGfNfiZuEzWKcC5v6G5m3OYZLoeMkesWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978381; x=1728583181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=oeAGsqmWj0fHBXv0ZTHgK8dv4dCMVTXxr6lz3/O06eO0XHECPdKH3DleQ53o/MuRbL
         k+GYTNH8SQSOV0nfLxLIXKqN1Wo0605NTYgyDx1lAoLlnW/ZsxquM5FabEbSIiiCGQBE
         adcdKqi24gpUMqMCGu7srHwXA0klzRlr0aMR1+NNt/ppb7EbodJ+9XlZihuMQKPFzDoI
         Jg6G5fNS0ZypQ0elwJscEMI/oY1+CcG/BAIgThxA+81uzychpEOqT+miWRZUDItLAcrP
         k9Ji47Q0ZattbZe5zQLktkrVu4CPfpoWlUj6jQi3nC1uPGMaxOMF7/kFKbzvxLYFj2Qi
         x6HA==
X-Gm-Message-State: AOJu0Yx921Wg+xW/KTtingRdELwSdl55wj4FouE0zl1yd+qaWH0vcD64
	zZ0OANpb4Q51pMW5Cf4qs+PNsVnK6/iGCPuIfoI9ytQAyaIelqeTbvi7D3Gpby37GHGqdE2wCDq
	B
X-Google-Smtp-Source: AGHT+IHmeQUHZPmc8iPrJIjuIzCdQw3ZXJkUj7BsND84KEb5v+REaWhBPvZugWwjiy4b37RnVDOBGw==
X-Received: by 2002:a17:907:3d8f:b0:a8d:1655:a423 with SMTP id a640c23a62f3a-a991c077e2bmr15511866b.56.1727978380897;
        Thu, 03 Oct 2024 10:59:40 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 08/19] xen: Update header guards - HYPFS
Date: Thu,  3 Oct 2024 18:59:08 +0100
Message-Id: <20241003175919.472774-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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


