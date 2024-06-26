Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283F918377
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749011.1157000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA0-0001LE-5E; Wed, 26 Jun 2024 13:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749011.1157000; Wed, 26 Jun 2024 13:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9z-0001F2-S8; Wed, 26 Jun 2024 13:58:07 +0000
Received: by outflank-mailman (input) for mailman id 749011;
 Wed, 26 Jun 2024 13:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9y-0000aq-J6
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:06 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c51c914-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:06 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6fd3d9f572fso3187114a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:06 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:04 -0700 (PDT)
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
X-Inumbo-ID: 1c51c914-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410285; x=1720015085; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeXJAa32g4UEe7AmZVpxSa6rawo1LbJSKY3deaYLOBo=;
        b=dw91qHep2LwHa7dnqyxLp9RKZ2E6b++Rodb7rMyCIZYlLaBk33Ki6xyjoNgwx7haaQ
         CYX997tkLQxtQDS7tQIxY81bXE1EKhTSzHRE301b2tl7c9jYD30+AjocsKpBURTsRAxu
         ZqGQFeYQKY+UBnU7ZLm7IzdVW9qu26+h1X960=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410285; x=1720015085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeXJAa32g4UEe7AmZVpxSa6rawo1LbJSKY3deaYLOBo=;
        b=Rky0HY7bzmsFc1H9bQ9x6N0RhuhcQguwdlHZDObUKT8E+S/rpsIu2GYR35hNYNafcl
         KunbWizmvJM3urbOymyDxtoJf3uF4aEWMlGEgbaVyqt5YHRx1yv0DVHoULECNiahYh3J
         u6B+PUSr7gAabGOP0HpDlMuLfkuNYe1nGCQ+ZY/zGKQsl6Lvslr+q1l3WSNqu4tU3k3v
         8VC3fF2x0nPdZzLyUoM2b6MLEK6WfxryJW2K3j7KMCZuBY+wT7Z0F8VtfnJSt4xDhAcW
         Xey4gQm1Fo9Flfi2a/L4OL2vxfmyKoZIhKPGv3FMB+dcqVes7LU8UOk6zKhG3hBgWcY6
         2R8A==
X-Gm-Message-State: AOJu0Yziw1QC+f/wXD9XQcwaxb7t/vbr1IcF8K+01BJlz9OtJdbYELYm
	dwremCgFY7EpwQDRwz4N1sgpgJAnrLt8qRPmn0c86PT4/G5r7mQQtCCq5MiaVrAoS2VMv18RIdn
	pLXs=
X-Google-Smtp-Source: AGHT+IHJesmEszuQOmOLW16x2yS6nMyF1lEaZlEgMRvbsep/0oYldxQi8lVX09o99u1oxbaAhpAY8A==
X-Received: by 2002:a9d:7cc6:0:b0:6f9:aa39:fd7d with SMTP id 46e09a7af769-700af8ad056mr11300588a34.6.1719410284675;
        Wed, 26 Jun 2024 06:58:04 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 05/14] xenalyze: Ignore vmexits where an HVM_HANDLER traces would be redundant
Date: Wed, 26 Jun 2024 14:38:44 +0100
Message-Id: <20240626133853.4150731-6-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VMX combines all exceptions into a single VMEXIT exit reason, and so
needs a separate HVM_HANDLER trace record (HVM_TRAP) to say which
exception happened; but for a number of exceptions, no further
information is put into the trace log.

SVM, by contrast, has a separate VMEXIT exit reason for each exception
vector, so HVM_TRAP would be redundant.

NB that VMEXIT_EXCEPTION_DB doesn't have an HVM_HANDLER for SVM yet;
but for VMX, there's a specific HVM_HANDLER trace record which
includes more information; so SVM really should record information as
well.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 46248e9a70..19b99dc66d 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -4641,6 +4641,14 @@ void hvm_generic_postprocess(struct hvm_data *h)
             {
             case VMEXIT_VINTR: /* Equivalent of PENDING_VIRT_INTR */
             case VMEXIT_PAUSE:
+                /*
+                 * VMX just has TRC_HVM_TRAP for these, which would be
+                 * redundant on SVM
+                 */
+            case VMEXIT_EXCEPTION_BP:
+            case VMEXIT_EXCEPTION_NM:
+            case VMEXIT_EXCEPTION_AC:
+            case VMEXIT_EXCEPTION_UD:
                 return;
             default:
                 break;
-- 
2.25.1


