Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50939B51B0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827797.1242531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmB-00086C-1w; Tue, 29 Oct 2024 18:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827797.1242531; Tue, 29 Oct 2024 18:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmA-00083y-T7; Tue, 29 Oct 2024 18:17:06 +0000
Received: by outflank-mailman (input) for mailman id 827797;
 Tue, 29 Oct 2024 18:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qmA-0007Zv-3U
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fecc8c58-9621-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 19:17:02 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so2857439a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:02 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:17:00 -0700 (PDT)
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
X-Inumbo-ID: fecc8c58-9621-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZlY2M4YzU4LTk2MjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjI1ODIyLjY1NTU1OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225822; x=1730830622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mauj61DJ+HdnhGgV8L4W73l1Sj6rpokHLuR7Nm9WpIU=;
        b=cRWnmunZPwgmS9da3lN0MRqI4jHO6jVkVLM7Nxi5WNHfSX5eImuftEmY7rsB8y+dYb
         XMOQpPRPJvrh0azcOkay5KWsaIbM8pfUqu4Xtz4OolnN8eBkEHRMzQNCziD0b3dHV+4k
         TgjK3rgTs5/zEJOQg/3a/cFzhCUe2+/JbtKUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225822; x=1730830622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mauj61DJ+HdnhGgV8L4W73l1Sj6rpokHLuR7Nm9WpIU=;
        b=sHEi391NFOkEspKLpFvnfgOANAHwo58Hg7tQ3IhHlcHgaTUE4+164+7NFARF4rrjVK
         bm/YurpDyJRM/Sazo6s+k8x7Qlf/8CU2xbBtl0SoCfSI0yW1yEfJXnXQoNtsH38VxH75
         yAcWoqJt8GQjhBQ+wLqQPfYioCQYqUTaKqJSwtNZCZhZ1jlW8nfmkuDGuMJ8sL0eZpOm
         egjGYldd17dP3uN+Cbq4lJKR0VF9fsREPNj8WGaa5gcfh9ObqLOiX5SDi88Ni3UYVVtA
         fppzSl8cJSBzfzI0x7SyEhk1/iZvjTBOycPSBdEZOf8Dp7Hpl/MSG6iHnPGr07TVLAwD
         lpsA==
X-Gm-Message-State: AOJu0Ywfd2xiRlnD1yWXD2MeZL6wMAnUGxknWWl+hcO1RNxN2pAUr4yE
	LN3jUKd6LTw/ph9OIWdAzL/iDx2ylaj2arRFJeWGbtnBT69n8TTjKdP0WtGS4eAOGkNJtXdNExn
	x
X-Google-Smtp-Source: AGHT+IGxj78iBc6LxwwvBHGZ6VhJtiCCLp05sKsN5mEz30rmUVnax2pmQCPr1BZgIJjmB4hvQMgWrA==
X-Received: by 2002:a05:6402:27d2:b0:5cb:aad6:145c with SMTP id 4fb4d7f45d1cf-5cbbf8a3c8dmr15714972a12.8.1730225821719;
        Tue, 29 Oct 2024 11:17:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH 2/6] tools: Rename grant_opts to grant_version
Date: Tue, 29 Oct 2024 18:16:28 +0000
Message-ID: <20241029181632.69600-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and remove the macros that no longer exist.

No functional change

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/helpers/init-xenstore-domain.c             | 2 +-
 tools/libs/light/libxl_create.c                  | 2 +-
 tools/python/xen/lowlevel/xc/xc.c                | 2 +-
 tools/tests/paging-mempool/test-paging-mempool.c | 2 +-
 tools/tests/resource/test-resource.c             | 6 +++---
 tools/tests/tsx/test-tsx.c                       | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 01ca667d25d1..25e41cf5175f 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -96,7 +96,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
-        .grant_opts = XEN_DOMCTL_GRANT_version(1),
+        .grant_version = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index edeadd57ef5a..f952614b1f8d 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -646,7 +646,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
-            .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
+            .grant_version = b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
             .cpupool_id = info->poolid,
         };
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16..b3bbda6d955d 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -167,7 +167,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 #else
 #error Architecture not supported
 #endif
-    config.grant_opts = XEN_DOMCTL_GRANT_version(max_grant_version);
+    config.grant_version = max_grant_version;
 
     if ( (ret = xc_domain_create(self->xc_handle, &dom, &config)) < 0 )
         return pyxc_error_to_exception(self->xc_handle);
diff --git a/tools/tests/paging-mempool/test-paging-mempool.c b/tools/tests/paging-mempool/test-paging-mempool.c
index 1ebc13455ac2..dc90b3b41793 100644
--- a/tools/tests/paging-mempool/test-paging-mempool.c
+++ b/tools/tests/paging-mempool/test-paging-mempool.c
@@ -24,7 +24,7 @@ static struct xen_domctl_createdomain create = {
     .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
     .max_vcpus = 1,
     .max_grant_frames = 1,
-    .grant_opts = XEN_DOMCTL_GRANT_version(1),
+    .grant_version = 1,
 
     .arch = {
 #if defined(__x86_64__) || defined(__i386__)
diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1b10be16a6b4..33bdb3113d85 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -137,7 +137,7 @@ static void test_domain_configurations(void)
             .create = {
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .grant_version = 1,
             },
         },
         {
@@ -146,7 +146,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .grant_version = 1,
                 .arch = {
                     .emulation_flags = XEN_X86_EMU_LAPIC,
                 },
@@ -159,7 +159,7 @@ static void test_domain_configurations(void)
                 .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
                 .max_vcpus = 2,
                 .max_grant_frames = 40,
-                .grant_opts = XEN_DOMCTL_GRANT_version(1),
+                .grant_version = 1,
             },
         },
 #endif
diff --git a/tools/tests/tsx/test-tsx.c b/tools/tests/tsx/test-tsx.c
index 5af04953f340..86608c95d627 100644
--- a/tools/tests/tsx/test-tsx.c
+++ b/tools/tests/tsx/test-tsx.c
@@ -457,7 +457,7 @@ static void test_guests(void)
         struct xen_domctl_createdomain c = {
             .max_vcpus = 1,
             .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .grant_version = 1,
         };
 
         printf("Testing PV guest\n");
@@ -470,7 +470,7 @@ static void test_guests(void)
             .flags = XEN_DOMCTL_CDF_hvm,
             .max_vcpus = 1,
             .max_grant_frames = 1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(1),
+            .grant_version = 1,
             .arch = {
                 .emulation_flags = XEN_X86_EMU_LAPIC,
             },
-- 
2.47.0


