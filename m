Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC2AAE6E7
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 18:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978695.1365506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uChnd-0002iu-3i; Wed, 07 May 2025 16:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978695.1365506; Wed, 07 May 2025 16:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uChnd-0002hQ-0D; Wed, 07 May 2025 16:39:13 +0000
Received: by outflank-mailman (input) for mailman id 978695;
 Wed, 07 May 2025 16:39:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWiO=XX=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uChnb-0002hK-IL
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 16:39:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb545b7-2b61-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 18:39:09 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ace98258d4dso323966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 09:39:09 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189508af1sm941267566b.147.2025.05.07.09.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 09:39:08 -0700 (PDT)
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
X-Inumbo-ID: ccb545b7-2b61-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746635949; x=1747240749; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pj3WIJKwSUiFTNa+6cJxVnMD8JH3cpCY8YhiAIwxJRo=;
        b=RStDcI2vWzrq8X8MYf9WPfrJOB7dOmVcx42Af/LHFaa17yCeQZuB5lb5PRHLHIbcb3
         bf1x5fucgKcjEVbLgdgXi74nV29Mi4iKNUHtQ96c9UgIqvMxT/yILOnMqLp/fIiTodzN
         ZW0pS7j8n+1XcvdIGwR04KWJoG+nKX1D6idDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635949; x=1747240749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pj3WIJKwSUiFTNa+6cJxVnMD8JH3cpCY8YhiAIwxJRo=;
        b=XRWoB3GLB8uI+MKn44hgeR4vgNjYJn71F3KfaFFnhbWF5YSvStHZRUpkRugTZ1j7gG
         m0xV69oeZM8g1sF1tbFpdyzNJHy//wNZM3eFDV+LAv+F+NhrEjBmqB4t6w6ZB5TpSvtp
         FlSxbC+a38qbB5rybCakYXioisOePaOi7cHYvEg0Xoajf9WNRu3PhKsmEQXof5d71HVJ
         ip/WeNtSqso1Bf5mj1xOEK00TKb4UFrWqffnCOjdPCBV0GoHsJNbXo5tLBQyOTIsCdt7
         8ReBTvGra4ew23pZFgqOKeZ5EkYD3GSg+km5sr9cSZ+v7S0+UbhfVvol6SUoAcvsrmHX
         BGEA==
X-Gm-Message-State: AOJu0YyqydVCRdM3HEKV98eOqlFNoKx5qsw+370GHX6IB5wXkO8C4HD5
	6yLuFFlGt02QL912czQnRY8xJbSxPto1ABYiMIh21jS1q+tNA7X97GcLoDvAB91hciAYnRwbm40
	=
X-Gm-Gg: ASbGncsQ9XS86EHIShtrAZSwHoy3eVEmjpHeVxIFcsJSXvVMmS6M5UoLnZLeUmF0ubA
	UxpRsy13Ne74CTtQv/PqFsaGCSC86ephdowFPkz62o29KYwqjRhgiXuIxsDGv1Y+TQTCFaTGnNo
	Nw6LXOZuVhaE4bOLyNfWmZ3rRKGBpSqDZvzCVl6baufdLAfY3G2XhDvLNqoyQbgWEO9P33aeBzs
	Zzbp0qafSjoxgnUTBKa4P0bmGbYYQkonSOtPhXoIW2QImBYfRjnKnCrc56xq5qYKeIRJGpfpdIv
	HTtbNAppR3nABlu1BcEU59tfR6t7X2TBa5EuNMqnVIKcWhO7khG7n1snScbskWfw
X-Google-Smtp-Source: AGHT+IF8J0XdvD8QU/maG8TaKcsWM2RLbJDzLr6ZhL3MOc8ZzEtuAAg1uCd4pMl20/YIIskSNQh3pA==
X-Received: by 2002:a17:906:d54a:b0:ac7:3918:50f3 with SMTP id a640c23a62f3a-ad1e8d4098fmr389730866b.58.1746635948610;
        Wed, 07 May 2025 09:39:08 -0700 (PDT)
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
Subject: [PATCH] livepatch: Pass buffer size to list sysctl
Date: Wed,  7 May 2025 17:38:59 +0100
Message-ID: <20250507163859.354711-1-ross.lagerwall@citrix.com>
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
 tools/libs/ctrl/xc_misc.c   |  3 +++
 xen/common/livepatch.c      | 22 +++++++++++++++++-----
 xen/include/public/sysctl.h | 12 ++++++++----
 3 files changed, 28 insertions(+), 9 deletions(-)

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
index be9b7e367553..72ef22bea5d2 100644
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
+        uint32_t name_total_copied = 0, metadata_total_copied = 0;
 
         list_for_each_entry( data, &payload_list, list )
         {
@@ -1328,10 +1327,14 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
             status.rc = data->rc;
 
             name_len = strlen(data->name) + 1;
-            list->name_total_size += name_len;
-
             metadata_len = data->metadata.len;
-            list->metadata_total_size += metadata_len;
+
+            if ( ((uint64_t)name_total_copied + name_len) > list->name_total_size ||
+                 ((uint64_t)metadata_total_copied + metadata_len) > list->metadata_total_size )
+            {
+                rc = -ENOMEM;
+                break;
+            }
 
             if ( !guest_handle_subrange_okay(list->name, name_offset,
                                              name_offset + name_len - 1) ||
@@ -1355,6 +1358,9 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
                 break;
             }
 
+            name_total_copied += name_len;
+            metadata_total_copied += metadata_len;
+
             idx++;
             name_offset += name_len;
             metadata_offset += metadata_len;
@@ -1362,9 +1368,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
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


