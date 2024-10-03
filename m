Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3469998EF07
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809326.1221594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKno-0004eg-TQ; Thu, 03 Oct 2024 12:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809326.1221594; Thu, 03 Oct 2024 12:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKno-0004b1-NQ; Thu, 03 Oct 2024 12:19:28 +0000
Received: by outflank-mailman (input) for mailman id 809326;
 Thu, 03 Oct 2024 12:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnm-00043u-Oz
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:26 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba1b09af-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:24 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso124076466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:24 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:23 -0700 (PDT)
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
X-Inumbo-ID: ba1b09af-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957964; x=1728562764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tis/X/p31Jv/hBo4GPRCJx3SzpdwRvuuxDnrw7zrjpc=;
        b=XxBHB2UFFFr9KgXtfJ9bBlfu4EXBdtLbVhGuXoWDKz+L5xdDPLqF1C1F3V+WdpQqFt
         TzKSpTC8+ztb08Ln3VxF4okkWj/RJVuQWnOAeWeVCptVS9sxEuzsYCnWi27gZYh5Knns
         jeyscff/Z6uRaUGdzMnhbniy/vvCa5wcvLRsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957964; x=1728562764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tis/X/p31Jv/hBo4GPRCJx3SzpdwRvuuxDnrw7zrjpc=;
        b=rwYvP6RpJ6gQPhcjitEFFNv6PWpchK9VYCsOlT6XnUFRaFoxnmyv949OWmy/OSkkj6
         dtLUvwVspymXOSAtRC5ZZc482nxF0DOiCkiWlL8pSCLbNVibT1IdCe6kzfVGXY9ULTZH
         w15q4Aab3Zh6ZieIWdUVVQzRXLk1NvC+1zsAMtd7lp505ty+Vp65zpUhsV55AvOrTKg4
         qbxdegyzm8722VbWYCyrz6vHUWyGv6ATJoozXOMScffI0nGzTLHSYp9bbYxk+Bp5N+h+
         qQk0/EsUDAIDFA/Kw+Z09VIZNxkE7KPeKuojJwysg7pFT+vvOUC1XkluPnaNyY5Few3n
         FHkA==
X-Gm-Message-State: AOJu0YxhsUqw8XsIBEInRuWP58OV53jxgbyKWkb3uTR8FRyaYt5atADg
	tp9PjIuQJ/fTMvCoAwLaA32ZN7PH4tnR23g4XbBjPFumj10ODH8Qmn5aULdTuXXjRx8AL06qY4X
	p
X-Google-Smtp-Source: AGHT+IHhifE9+JZN9of9L51528Ue5aRaZYwnw1J9r6hUn5hoQbGUOJv1kcoO1qj3K9dMhq/vH9R3Wg==
X-Received: by 2002:a17:907:2d8b:b0:a93:d4c4:6b26 with SMTP id a640c23a62f3a-a98f824a439mr515721566b.25.1727957963714;
        Thu, 03 Oct 2024 05:19:23 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 04/20] xen: Update header guards - ARGO
Date: Thu,  3 Oct 2024 13:18:52 +0100
Message-Id: <20241003121908.362888-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to ARGO.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/public/argo.h | 4 ++--
 xen/include/xen/argo.h    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/public/argo.h b/xen/include/public/argo.h
index 84a4cb118b..32e46c4b5c 100644
--- a/xen/include/public/argo.h
+++ b/xen/include/public/argo.h
@@ -9,8 +9,8 @@
  *
  */
 
-#ifndef __XEN_PUBLIC_ARGO_H__
-#define __XEN_PUBLIC_ARGO_H__
+#ifndef PUBLIC__ARGO_H
+#define PUBLIC__ARGO_H
 
 #include "xen.h"
 
diff --git a/xen/include/xen/argo.h b/xen/include/xen/argo.h
index fd4cfdd55c..3ef62dab19 100644
--- a/xen/include/xen/argo.h
+++ b/xen/include/xen/argo.h
@@ -12,8 +12,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __XEN_ARGO_H__
-#define __XEN_ARGO_H__
+#ifndef XEN__ARGO_H
+#define XEN__ARGO_H
 
 #include <xen/sched.h>
 
-- 
2.34.1


