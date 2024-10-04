Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDCB98FECC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810089.1222761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVI-0006qZ-Bl; Fri, 04 Oct 2024 08:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810089.1222761; Fri, 04 Oct 2024 08:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVI-0006iz-1l; Fri, 04 Oct 2024 08:17:36 +0000
Received: by outflank-mailman (input) for mailman id 810089;
 Fri, 04 Oct 2024 08:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVF-0005Vm-B4
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:33 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae34822-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:32 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so238614866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:32 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:31 -0700 (PDT)
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
X-Inumbo-ID: 1ae34822-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029852; x=1728634652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=ATYdJm6CAYVbeY6FGO/m1iId3zjRBvEB4AnkbrxKATvT71Ozz25tVy/Lnuj+ex8JQn
         nnbMmORb7k/gSm0pNWnPiWjyYBnLN7tMlygDSuo1ibSPOuQDL2jLKE/NYEIHD9oDZ0LI
         rCjtHVD5h2RLZqeGUDVGqFW+3XylCCfqErLIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029852; x=1728634652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5H5vzGEUHF5T8160M9z8v6UqIQnE5siB1MdqRXTDEQ=;
        b=Nfb5fRYXsF2iYLxA7KVhrbyvfV8unJeVX2nFizwQL46Qssf7PmRPRBAEnpb4QIvN41
         0DVNlQlWumwEGtdDDNCOX7ggyBnUa7od6FrhsG4SXJ+Ufc2PKUOTXHfe2iXxuijdfwiR
         qqKQ7SY4Ama3ljLMbSLZNtGVE8o+b+ObUIzVG7Batp+xEgmPWZPXAcKcohH5DmcYHsRR
         dZVtSEAIClIeys8g/bl1hrrIjRf0XgN1aMRyj+RW2q23W+MJSd+CAyTTdYn4z8Dl73Bz
         a++QQeO8mxPMDX+NiAqBaeAsUqKueYcHayE6+AdrreSOkT01jUr+EpAORRodVEEgKJ12
         zQ0g==
X-Gm-Message-State: AOJu0YyDM72RgVPmHy0fR74S5IbvaaT01w+Q+bAocSopLggMD2U6zva9
	iIHDNKqFTrK7XVmjyhH3GZ5I70AUAe9oT7QT+kUs9EkAGF4G/4jw9rlyeQnDRrkh7z2OoMhnbsz
	h
X-Google-Smtp-Source: AGHT+IFRku3DSXH+ZeCg792f2LXNioPS03GFMkCUiU0UN7yjBY0V9pPZ/cCcre283JLlxqgDYpH+mw==
X-Received: by 2002:a17:907:9484:b0:a8d:35cf:85f6 with SMTP id a640c23a62f3a-a991c00ededmr171869766b.57.1728029852027;
        Fri, 04 Oct 2024 01:17:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 08/19] xen: Update header guards - HYPFS
Date: Fri,  4 Oct 2024 09:17:02 +0100
Message-Id: <20241004081713.749031-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
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


