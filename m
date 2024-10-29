Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC439B51AE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827801.1242570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmH-0000me-9P; Tue, 29 Oct 2024 18:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827801.1242570; Tue, 29 Oct 2024 18:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmH-0000jM-3Z; Tue, 29 Oct 2024 18:17:13 +0000
Received: by outflank-mailman (input) for mailman id 827801;
 Tue, 29 Oct 2024 18:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qmF-0007bP-O3
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:11 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02dc4537-9622-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:17:09 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cb615671acso3556382a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:09 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:17:08 -0700 (PDT)
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
X-Inumbo-ID: 02dc4537-9622-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyZGM0NTM3LTk2MjItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI1ODI5LjQ0MDE5OSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225829; x=1730830629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlNOfvbEUH68SFYddIu2H52O+/CuAeFVRrD11ZLL/cA=;
        b=W7Mak5ts4jbcJnqn+AFA7C3RANiy3jk5fNWDhN99ZA4b6fNOkZ+Iph6w3dV0r0cIRR
         N+7GatYJE2cwyZpuXj03/sa1sgtA1biwaIVodvK18UmvG0HYQ2EHxRuMt3RtoO7Jx6AW
         1Dg7A6vikE/t1vmobQSVDhyzEjXeeEh1mNzD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225829; x=1730830629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlNOfvbEUH68SFYddIu2H52O+/CuAeFVRrD11ZLL/cA=;
        b=Z+1xxPuyynXVqqFQbJ5NKGbRLQhc1jwK9QdK6mpo2NGhwbj/8uNuUqB68IA/c9Upal
         OWXy6AtDlEPBstfWOgWObX14PyepdL9qpRhLhPiJ4p4sVOOC/oODm9D/g081eHkM179V
         rT1Wr9xH2P9DW33beSVkQ+tBVWNfcTn9qxK0FY5koFNFJEvrNjb8qw1/iBKW9867QIG3
         ldiNXBqOOys/o3Au6zjtHXFZOxhbGlPu/yifXPNkouIUGKjJo3Iy3vETMfUxEHHO8qB4
         uL7qAzF2GUNHxRt5u3GOHnALhDKtPFVhYa+/4ImQVkxzga+SIdu9AkGJQkevRqgDAlTD
         Ooug==
X-Gm-Message-State: AOJu0YwgiLO5o4PZ3nIhaaBrwarTmptJoCdUf2AS9MkZ+uI8GASvborH
	l/KO0uevjj7ivmaHqyIEpQc+/NTgotQynq8WL7fwJOsuLRWxARgqaWHcM8uN8b5n0cw1JhHzqHh
	Q
X-Google-Smtp-Source: AGHT+IFubUz7zr6S8J//8W0qF4by33zcAeFp8hTScDVl0+3znHLfjan6Unn5BKLmej3g/KH/hRAS2g==
X-Received: by 2002:a05:6402:4584:b0:5cb:728e:926b with SMTP id 4fb4d7f45d1cf-5cbbf8c2eacmr15114750a12.17.1730225828578;
        Tue, 29 Oct 2024 11:17:08 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 6/6] xen/common: Rename grant_opts to grant_version
Date: Tue, 29 Oct 2024 18:16:32 +0000
Message-ID: <20241029181632.69600-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and remove the macros that no longer exist.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/common/domain.c           | 6 +++---
 xen/common/grant_table.c      | 3 +--
 xen/include/xen/grant_table.h | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbdc5..86f0e99e0d4a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -579,9 +579,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->grant_opts & ~XEN_DOMCTL_GRANT_version_mask )
+    if ( config->rsvd0[0] | config->rsvd0[1] | config->rsvd0[2] )
     {
-        dprintk(XENLOG_INFO, "Unknown grant options %#x\n", config->grant_opts);
+        dprintk(XENLOG_INFO, "Rubble in rsvd0 padding\n");
         return -EINVAL;
     }
 
@@ -788,7 +788,7 @@ struct domain *domain_create(domid_t domid,
 
     if ( (err = grant_table_init(d, config->max_grant_frames,
                                  config->max_maptrack_frames,
-                                 config->grant_opts)) != 0 )
+                                 config->max_grant_version)) != 0 )
         goto fail;
     init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8cdd..51a3f72a9601 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1963,10 +1963,9 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames, unsigned int options)
+                     int max_maptrack_frames, uint8_t max_grant_version)
 {
     struct grant_table *gt;
-    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
     if ( !max_grant_version )
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 50edfecfb62f..f3edbae3c974 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -73,9 +73,9 @@ int gnttab_acquire_resource(
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
                                    int max_maptrack_frames,
-                                   unsigned int options)
+                                   uint8_t max_grant_version)
 {
-    if ( options )
+    if ( max_grant_version )
         return -EINVAL;
 
     return 0;
-- 
2.47.0


