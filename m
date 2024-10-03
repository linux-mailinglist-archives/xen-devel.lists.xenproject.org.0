Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684398F5AC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809684.1222156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ74-0007ME-1s; Thu, 03 Oct 2024 17:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809684.1222156; Thu, 03 Oct 2024 17:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ73-0007HW-TD; Thu, 03 Oct 2024 17:59:41 +0000
Received: by outflank-mailman (input) for mailman id 809684;
 Thu, 03 Oct 2024 17:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ72-0006qR-6q
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:40 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41760afb-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:38 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so1866023e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:38 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:36 -0700 (PDT)
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
X-Inumbo-ID: 41760afb-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978377; x=1728583177; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tis/X/p31Jv/hBo4GPRCJx3SzpdwRvuuxDnrw7zrjpc=;
        b=fOzgTcbRP4nQW1zAH0l6QbWKF9D6RK8jva2LS1xMlHgF1e0MpHvIZ6pbGKvPhDMZal
         9qVfldsrpBO8zuNg2l5P5F8H/dKkhmD2MVRtR5kVcalY14lV0am8+Nvr+YJVoLNLZ1G+
         U1tiHHGu3oXERMUfxxcH7JdmiecEMderqLoHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978377; x=1728583177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tis/X/p31Jv/hBo4GPRCJx3SzpdwRvuuxDnrw7zrjpc=;
        b=X6oraX3hgrpsfpN493i0h6jV9ZP9tmeieL2CrEUD9BOLdL9fFoshsfFQouUnpJN+cH
         N+G6m62RiMVmKkzx5pEIayxnfgq+q9FmLlCn8cjrHU2ErD+EVIqjmF5fPfQcark9IQpA
         N6OKdyXCMLZx5K805+OdMsP7Snwbv5fxoRRlUTLjLtIhYa0+L+Nb3Z/lZkMy07YTJpQf
         x19G3AKSaeXNLT9q17OpQm4bxYlDrRrC7Tsfsmw0kwhznAaJG90pWCpjq2dyFFHpl2rL
         2szTN7iOhdbtcVsG2dbS3V20uZ/i4lECDmHOG5TAoLb9VUm3152EWymmXjHgN5P7so/1
         5WEg==
X-Gm-Message-State: AOJu0YyFJz1o37tBi7E/52g9wTuA5Dug5OvwMQ0j6M2e/dpKuftJL88W
	MCXKL7pTNcY5DEkoIX6T7fZpHv7ABT7pTp9W58EJSp7lHZXdjMtPdV9jsTCAx5izykOdA0I6Bl6
	A
X-Google-Smtp-Source: AGHT+IHWNtrEerC0l6TABn+oFr1YuLPwxe484b+d0gBWxci9wSQdrDpnJ3KTM4g8os1IiZiHDkxHjw==
X-Received: by 2002:a05:6512:33ca:b0:536:581c:9d9f with SMTP id 2adb3069b0e04-539ab858762mr150407e87.24.1727978377066;
        Thu, 03 Oct 2024 10:59:37 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 04/19] xen: Update header guards - ARGO
Date: Thu,  3 Oct 2024 18:59:04 +0100
Message-Id: <20241003175919.472774-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
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


