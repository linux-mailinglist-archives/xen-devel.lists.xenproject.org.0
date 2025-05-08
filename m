Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED9AB00D4
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 19:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979533.1366113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD4dJ-0006U7-Ps; Thu, 08 May 2025 17:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979533.1366113; Thu, 08 May 2025 17:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD4dJ-0006S6-Ms; Thu, 08 May 2025 17:02:05 +0000
Received: by outflank-mailman (input) for mailman id 979533;
 Thu, 08 May 2025 17:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGkx=XY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uD4dH-0006Rv-V5
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 17:02:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a6385e-2c2e-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 19:02:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so167543466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 10:02:01 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be6d7sm11669266b.157.2025.05.08.10.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 10:01:59 -0700 (PDT)
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
X-Inumbo-ID: 28a6385e-2c2e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746723720; x=1747328520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svV216COIFgHM/2K92/3WYhrsgYMfWGjXZ9ca1Af6v0=;
        b=NMyG/gyIlm3n+NpFFQOYySIFPy4d+GkZnGyz6MiWiow7tY+U8FiBAGNMbOIbu1DERc
         cvdRg8oXP2U2H4/8GZsrfZcNF15ptmIQSWsb4Wq2xEwV7NyFoRxAvRMwzs2sWvb5ztH4
         C/OdPT92tz8y5L4JswA+dXz6bQlSlNWK2eV6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746723720; x=1747328520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svV216COIFgHM/2K92/3WYhrsgYMfWGjXZ9ca1Af6v0=;
        b=iVReZbLNCpnJ5DCwo2vHVwJ5je9LZqjNvlt832SF/6TTOc7a65x6h/E656nSR/nLfP
         Wly1AqLihEG1Ijz08Uok75kOMZpx3wVuAMJHYA+Y9f5e+yA7EBLQdZ9Ryed97rlvGNrK
         qDPTQulxCvcVBeIZCqcowGOqUY+pjw43XbSJ/QmoLKDeDVwB5OatCfA8FaDIOG7kL0VR
         +QYEPN9z2G/dGpey2y6oo5wIie1i9in0ZYyO4SIM4/xqM1vDEKo4b4bGQsx7xso1lezr
         t0JU49PJDmFaexRHp2Ke0vJJV9jrtCXXdg34/r9dfoqPo5mltNlD2AawXel4fRMSalyH
         mFEQ==
X-Gm-Message-State: AOJu0Yy2S5rP+9rI6bAuNA55zjvcJqHA/jeA0YbeU/TRE1MS4q+tZlzi
	hkoUbZTvpmtMg0JiSCqgZd8rCIK6+/6jOlfROD0PHAyHLcQsHURzH5VNaThrrQmbo9m661dy6Ho
	=
X-Gm-Gg: ASbGncv8GW81Rjl33cAItQOnd89D/EKhy5jxCoeh/s2EK9VkEhYJanT0u5H1ACb+Vfx
	Z9x+imfFO5eKI8xEOL8gZd2yXYwqB6d8g2HpxKKbVCPkhNjLf4kYeTqxM7wdTxwdKxhjMIHu+t+
	X55EtrgLDJ51pTrSBdGUbSfelDQYrynEYr3y46lgX6HvYu9EQUp3nXzUK+tQdZOBDrd0cqA8dqn
	b+FoiNj/s3zzyNI1G8MaBHH/nqHAe+quqExAOrML7ONsNpK++5/D5J4wQXlV54nDOmLYbsDeuJa
	yaciqbvVeMyp0EnI1e8lXJHmHB6VQyxIXMaU6Y70xv4lX1uh6H050o6yBYgFXZ1p
X-Google-Smtp-Source: AGHT+IHGemGNy+Yzyuspx8Nc/iVVq/FO96sw/M2WjuMroEh4CB4QyLlfMjGB0ELXvKT3AjvCUGh4Xw==
X-Received: by 2002:a17:907:6a13:b0:ace:6f45:b5c6 with SMTP id a640c23a62f3a-ad218edd00cmr48084366b.22.1746723719996;
        Thu, 08 May 2025 10:01:59 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2] livepatch: Pass buffer size to list sysctl
Date: Thu,  8 May 2025 18:01:56 +0100
Message-ID: <20250508170156.558291-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Lampis <kevin.lampis@cloud.com>

The livepatch list sysctl writes metadata into a buffer provided by the
caller. The caller is expected to allocate an appropriately sized buffer
but this is racy and may result in Xen writing beyond the end of the
buffer should the metadata size change.

The name buffer is expected to be an array of elements with size
XEN_LIVEPATCH_NAME_SIZE to avoid this kind of race but the xen-livepatch
tool allocates only as many bytes as needed, therefore encountering the
same potential race condition.

Fix both these issues by requiring the caller to pass in the size of the
name and metadata buffers and then not writing beyond the allocated
size.

The sysctl interface version is bumped due to the change in semantics of
the fields.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:

Change type to size_t and fix line length.

 tools/libs/ctrl/xc_misc.c   |  3 +++
 xen/common/livepatch.c      | 23 ++++++++++++++++++-----
 xen/include/public/sysctl.h | 12 ++++++++----
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 6a60216bda03..33e87bac2868 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -867,6 +867,9 @@ int xc_livepatch_list(xc_interface *xch, const unsigned int max,
         set_xen_guest_handle(sysctl.u.livepatch.u.list.metadata, metadata);
         set_xen_guest_handle(sysctl.u.livepatch.u.list.metadata_len, metadata_len);
 
+        sysctl.u.livepatch.u.list.name_total_size = name_sz;
+        sysctl.u.livepatch.u.list.metadata_total_size = metadata_sz;
+
         rc = do_sysctl(xch, &sysctl);
         /*
          * From here on we MUST call xc_hypercall_bounce. If rc < 0 we
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index be9b7e367553..fc250c338da9 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1311,11 +1311,10 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
         return -EINVAL;
     }
 
-    list->name_total_size = 0;
-    list->metadata_total_size = 0;
     if ( list->nr )
     {
         size_t name_offset = 0, metadata_offset = 0;
+        size_t name_total_copied = 0, metadata_total_copied = 0;
 
         list_for_each_entry( data, &payload_list, list )
         {
@@ -1328,10 +1327,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
             status.rc = data->rc;
 
             name_len = strlen(data->name) + 1;
-            list->name_total_size += name_len;
-
             metadata_len = data->metadata.len;
-            list->metadata_total_size += metadata_len;
+
+            if ( (name_total_copied + name_len) > list->name_total_size ||
+                 (metadata_total_copied + metadata_len) >
+                 list->metadata_total_size )
+            {
+                rc = -ENOMEM;
+                break;
+            }
 
             if ( !guest_handle_subrange_okay(list->name, name_offset,
                                              name_offset + name_len - 1) ||
@@ -1355,6 +1359,9 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
                 break;
             }
 
+            name_total_copied += name_len;
+            metadata_total_copied += metadata_len;
+
             idx++;
             name_offset += name_len;
             metadata_offset += metadata_len;
@@ -1362,9 +1369,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
             if ( (idx >= list->nr) || hypercall_preempt_check() )
                 break;
         }
+
+        list->name_total_size = name_total_copied;
+        list->metadata_total_size = metadata_total_copied;
     }
     else
     {
+        list->name_total_size = 0;
+        list->metadata_total_size = 0;
+
         list_for_each_entry( data, &payload_list, list )
         {
             list->name_total_size += strlen(data->name) + 1;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index b0fec271d36f..9eca72865b87 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -26,9 +26,9 @@
  * (e.g. adding semantics to 0-checked input fields or data to zeroed output
  * fields) don't require a change of the version.
  *
- * Last version bump: Xen 4.17
+ * Last version bump: Xen 4.21
  */
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000016
 
 /*
  * Read console content from Xen buffer ring.
@@ -1101,8 +1101,12 @@ struct xen_sysctl_livepatch_list {
                                                amount of payloads and version.
                                                OUT: How many payloads left. */
     uint32_t pad;                           /* IN: Must be zero. */
-    uint32_t name_total_size;               /* OUT: Total size of all transfer names */
-    uint32_t metadata_total_size;           /* OUT: Total size of all transfer metadata */
+    uint32_t name_total_size;               /* IN: Size of name buffer
+                                               OUT: Total size of transferred
+                                               names */
+    uint32_t metadata_total_size;           /* IN: Size of metadata buffer
+                                               OUT: Total size of transferred
+                                               metadata */
     XEN_GUEST_HANDLE_64(xen_livepatch_status_t) status;  /* OUT. Must have enough
                                                space allocate for nr of them. */
     XEN_GUEST_HANDLE_64(char) name;         /* OUT: Array of names. Each member
-- 
2.49.0


