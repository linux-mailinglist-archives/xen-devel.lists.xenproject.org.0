Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39843918381
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749019.1157076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA9-0003ZZ-Ei; Wed, 26 Jun 2024 13:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749019.1157076; Wed, 26 Jun 2024 13:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA9-0003NA-1N; Wed, 26 Jun 2024 13:58:17 +0000
Received: by outflank-mailman (input) for mailman id 749019;
 Wed, 26 Jun 2024 13:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA6-0000aq-LN
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:14 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2137ce87-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:14 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-79c05c19261so97325085a.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:14 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:12 -0700 (PDT)
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
X-Inumbo-ID: 2137ce87-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410293; x=1720015093; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TUWwDLi1R2zJHBj9N1SaI7go8LX451Wfg2VkzZDApI=;
        b=DHlQYGcAYHYp6zr+at4420d2vigfHVwNhCdFEC6c5EdxGmh6gYsvd341eoPod/lr1a
         yU/iQUIZZLz6+gJXaiN6pi5mDYTYSTjfsB3pbKIE9FxkMIiqGAqXQv8mpi14Gf1eSXqS
         EXDS4TOMIZ4T0EdezQz5c4EfRsTdxs22ZlRDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410293; x=1720015093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TUWwDLi1R2zJHBj9N1SaI7go8LX451Wfg2VkzZDApI=;
        b=r6T62Rxr3VZeLmhANYvB9DIrG5ta2XoTk7XihECUlqpr9PanKRhpnNb5SK/Z//IEi3
         yOJ5BQVVsjIPtgLTMj1DsHAR52ly0He+ZVgtRHLH7FZ7EgEhxI6qEK1ZXB/cxsVBA/AP
         mfbWrrThqzfnRL8bZCQ/cZPOLQhgcSvBvHtxrsCfHtil1qtW3L01RpgwplvnCTAKzhJx
         7+0IUdidti4yYMXPkf3AMBAvwoajnDdLUBWNNF6aUDH1f3gZDXAtO7GEx3L5wFjem1yv
         MEk6rfnnrojKFz3OQgMvwMNgv85jIZlorncJDpISi1RVlqgdg5SEKt68mDQ9zodL1aub
         oSMA==
X-Gm-Message-State: AOJu0YwhNb60vAqK44Z0DX7cyzvFet4O9hqJ32SjRcmPrqhBP10W4XaC
	NP4hxujOjZCCjnh45u8QlaJkIr0NOHGNt/ixHOCUbrkNJidC2az0ajChMk8mImt1HMk3SD65S1h
	7fyI=
X-Google-Smtp-Source: AGHT+IGJ2lo2PMzNvloP71CWFEAIEwg6k06VIqoyJtqytdgCEBGc6bBZGCVD6c/8GEgw9Au8SXicJA==
X-Received: by 2002:a05:620a:28c5:b0:79c:ec3:f121 with SMTP id af79cd13be357-79c0ec3f47bmr354079385a.31.1719410292829;
        Wed, 26 Jun 2024 06:58:12 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 12/14] xenalyze: Basic processing for XSETBV exits and handlers
Date: Wed, 26 Jun 2024 14:38:51 +0100
Message-Id: <20240626133853.4150731-13-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Basically this means adding VMEXIT strings for XSETBV exit, and adding
the handlers and strings for them.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index eb0e60e6ef..d0e2788727 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -694,6 +694,8 @@ enum VMEXIT_EXITCODE
     VMEXIT_MONITOR          = 138,
     VMEXIT_MWAIT            = 139,
     VMEXIT_MWAIT_CONDITIONAL= 140,
+    VMEXIT_XSETBV           = 141, /* 0x8d */
+    VMEXIT_RDPRU            = 142, /* 0x8e */
     VMEXIT_NPF              = 1024, /* nested paging fault */
     VMEXIT_INVALID          =  -1
 };
@@ -853,6 +855,8 @@ const char * hvm_svm_exit_reason_name[HVM_SVM_EXIT_REASON_MAX] = {
     "VMEXIT_MWAIT",
     /* 140 */
     "VMEXIT_MWAIT_CONDITIONAL",
+    "VMEXIT_XSETBV",
+    "VMEXIT_RDPRU",
     [VMEXIT_NPF] = "VMEXIT_NPF", /* nested paging fault */
 };
 
@@ -946,6 +950,8 @@ enum {
     HVM_EVENT_TRAP,
     HVM_EVENT_TRAP_DEBUG,
     HVM_EVENT_VLAPIC,
+    HVM_EVENT_XCR_READ,
+    HVM_EVENT_XCR_WRITE,
     HVM_EVENT_HANDLER_MAX
 };
 const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
@@ -981,7 +987,9 @@ const char * hvm_event_handler_name[HVM_EVENT_HANDLER_MAX] = {
     "realmode_emulate",
     "trap",
     "trap_debug",
-    "vlapic"
+    "vlapic",
+    "xcr_read",
+    "xcr_write"
 };
 
 enum {
-- 
2.25.1


