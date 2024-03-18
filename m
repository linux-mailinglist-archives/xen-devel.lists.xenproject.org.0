Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6C87EDA4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694891.1084112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxw-0005Rt-FY; Mon, 18 Mar 2024 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694891.1084112; Mon, 18 Mar 2024 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxw-0005L7-CD; Mon, 18 Mar 2024 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 694891;
 Mon, 18 Mar 2024 16:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFxu-0005JO-W2
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:35:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c415ae-e545-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:35:57 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a468004667aso469316066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:35:57 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:35:56 -0700 (PDT)
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
X-Inumbo-ID: 98c415ae-e545-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779756; x=1711384556; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpzmmaoi0pJueucz7Za6oBj+S2IXaqOnagU2yAyCJ44=;
        b=JP9orS50tij7AR5qSry6psj3uSxN+dqggrNruuOGAo5lKFRepM6iDtccLLDS4d9j00
         VnwGA6p4Td7d7Wv54zs+62zDQWslgbV73ZJ9fLnovz8D5dq7o+cvrrQAC28b+kWRgbOJ
         bXoHqmAIInr8qAHHC18zjjlx7sw8l978xW9Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779756; x=1711384556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpzmmaoi0pJueucz7Za6oBj+S2IXaqOnagU2yAyCJ44=;
        b=if/w0DYXDIzTg/uEBxgo1+1IBfN40KJ8/Z/LPFHMMMkynANIpJiO7XAVlBn9i4zQRo
         PMtKLrddf0vcjaE4JXNPczYDpdo/Y2ZoADBv+hL5hCEtduryqgpICM/U+0YVWOa0xJKN
         wp8uakLmSi2metjuiOQ2rNrdSuswiPQcufLVC+4Dii7VwD4/lmvVEx975QdEbXL+nDi2
         LmSCb70opR1dLL23R8E+2/uxIMaVFjX0+P2IFA5oqZyoMs/lEBJqlkPYCFA1dfyA5AhU
         0FlXY5h/LLRHutSHGzeab8/WO4a8k0uV7lyuNgQ3FDPXJrG3lP/zTdBoWtS3BdqLW+gs
         YIPw==
X-Gm-Message-State: AOJu0YytK9Pjhfss0KWzSNRlBdbA9nLO7tCn8HH/V89oz8zDfmv+m9e1
	slZzXZIPM1zZBsMB37rC/PAOGoNl2jfr+IoSvp4fU8MOqt0IUU6+ZenX2EiRHR6tv7X2OyblJW9
	k
X-Google-Smtp-Source: AGHT+IFlFP6MCdOoAYd9kZM9daEwNdNvAgjw0dy0gDaSkJUU2uztyqS390yRXY9RR7dsxHNJEWQejw==
X-Received: by 2002:a17:906:81d0:b0:a46:d304:fce2 with SMTP id e16-20020a17090681d000b00a46d304fce2mr617114ejx.35.1710779756410;
        Mon, 18 Mar 2024 09:35:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 1/7] xen/trace: Introduce new API
Date: Mon, 18 Mar 2024 16:35:46 +0000
Message-Id: <20240318163552.3808695-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trace() and trace_time(), in function form for struct arguments, and macro
form for simple uint32_t list arguments.

This will be used to clean up the mess of macros which exists throughout the
codebase, as well as eventually dropping __trace_var().

There is intentionally no macro to split a 64-bit parameter in the new API,
for MISRA reasons.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

v3:
 * Extend with trace() and trace_time()
 * Delete TRACE_PARAM64() for MISRA reasons.
---
 xen/common/trace.c      |  5 +++++
 xen/include/xen/trace.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index 4e7b080e6154..c94ce1f7dc90 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -808,6 +808,11 @@ void __trace_var(u32 event, bool cycles, unsigned int extra,
         tasklet_schedule(&trace_notify_dom0_tasklet);
 }
 
+void trace(uint32_t event, unsigned int extra, const void *extra_data)
+{
+    __trace_var(event, event & TRC_HD_CYCLE_FLAG, extra, extra_data);
+}
+
 void __trace_hypercall(uint32_t event, unsigned long op,
                        const xen_ulong_t *args)
 {
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 055883287e8c..f184844e1b55 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -37,6 +37,9 @@ int tb_control(struct xen_sysctl_tbuf_op *tbc);
 
 int trace_will_trace_event(u32 event);
 
+/* Create a trace record, with pre-constructed additional parameters. */
+void trace(uint32_t event, unsigned int extra, const void *extra_data);
+
 void __trace_var(uint32_t event, bool cycles, unsigned int extra, const void *);
 
 static inline void trace_var(uint32_t event, bool cycles, unsigned int extra,
@@ -66,6 +69,9 @@ static inline int trace_will_trace_event(uint32_t event)
     return 0;
 }
 
+static inline void trace(
+    uint32_t event, unsigned int extra, const void *extra_data) {}
+
 static inline void trace_var(uint32_t event, bool cycles, unsigned int extra,
                              const void *extra_data) {}
 static inline void __trace_var(uint32_t event, bool cycles, unsigned int extra,
@@ -74,6 +80,30 @@ static inline void __trace_hypercall(uint32_t event, unsigned long op,
                                      const xen_ulong_t *args) {}
 #endif /* CONFIG_TRACEBUFFER */
 
+/* Create a trace record with time included. */
+static inline void trace_time(
+    uint32_t event, unsigned int extra, const void *extra_data)
+{
+    trace(event | TRC_HD_CYCLE_FLAG, extra, extra_data);
+}
+
+/*
+ * Create a trace record, packaging up to 7 additional parameters into a
+ * uint32_t array.
+ */
+#define TRACE(_e, ...)                                          \
+    do {                                                        \
+        if ( unlikely(tb_init_done) )                           \
+        {                                                       \
+            uint32_t _d[] = { __VA_ARGS__ };                    \
+            BUILD_BUG_ON(ARRAY_SIZE(_d) > TRACE_EXTRA_MAX);     \
+            trace(_e, sizeof(_d), sizeof(_d) ? _d : NULL);      \
+        }                                                       \
+    } while ( 0 )
+
+/* Create a trace record with time included. */
+#define TRACE_TIME(_e, ...) TRACE((_e) | TRC_HD_CYCLE_FLAG, ##__VA_ARGS__)
+
 /* Convenience macros for calling the trace function. */
 #define TRACE_0D(_e)                            \
     do {                                        \
-- 
2.30.2


