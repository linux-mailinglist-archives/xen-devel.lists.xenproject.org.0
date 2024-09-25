Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BCC9855B9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803573.1214242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc4-0005dO-R4; Wed, 25 Sep 2024 08:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803573.1214242; Wed, 25 Sep 2024 08:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc4-0005ch-LZ; Wed, 25 Sep 2024 08:43:08 +0000
Received: by outflank-mailman (input) for mailman id 803573;
 Wed, 25 Sep 2024 08:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc2-0005NX-St
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:06 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e87d1c4-7b1a-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 10:43:05 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso5114209a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4974a6sm1620662a12.39.2024.09.25.01.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:03 -0700 (PDT)
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
X-Inumbo-ID: 2e87d1c4-7b1a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253784; x=1727858584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmANCqOCNLuCE6WgFe5IkbUtz4Dl4MOkNZ8FdlMteZ4=;
        b=V+Pl2q8YhftYc7znEWOsw7Xd/KvnbmQRt5JLV77HKkG+ZnsOdh9kDr/J6nVOf+Xcyc
         msNW00PK6wTLTXfsYLo9kuDnC4YoJzOdY4iZ0psTTIgU8QpNgAcEfSyvnxxtkxksQNUs
         eqQI4HWvzt/nFsJFmVujUgw62etdBQ8rbvAmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253784; x=1727858584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmANCqOCNLuCE6WgFe5IkbUtz4Dl4MOkNZ8FdlMteZ4=;
        b=Oipwomul/FYBhcCj0A/fFS+rf6soUu+VL2CTtj3a7GxoyzWkW2nDplq+USvzdaa3+U
         XV/jhSX0u6UDu+Y55ekmPUAbYx1LszHrGYHjhqrXJ0rEZfJp5Q9eRAiyIqXnFmUODif4
         OEpy96PxsJvEkSgQUFq1y06S1aWwd+7sBODQa0Kp5abYuwkEb9uQ8uUod3gEPQbM3360
         umu8P7hK7k+Mn+0RWm+Gn2LnczrpKpL+4MbxPB2C6xGo8lTPqjX1wR4jZZ8NNy0aqaaj
         YU+nah5SO9SiuKH5gmTZ8FPhWeOHVBW/ZNBLuQuAAJFncOjtZPWq/5ybMyfNAKEp/atM
         6/OA==
X-Gm-Message-State: AOJu0YyaVz91cMZgwHgvKxUwBmPL3FL0iG2s0Cp26dSd1V3yajMDI9Ex
	hXdpvGM8z3mlLneepbuA+f+K+tt3noiFF1Kw7+HTyHNM3yF/xRuHAjujRgaCsq7mRERvDNOk3dQ
	k
X-Google-Smtp-Source: AGHT+IHcKk7PadNzltiCJe7/SxHQQeAdUrJQe22On1AgtTHr+7rrO+39rxXpoqDaHmR24SJX5+V7XQ==
X-Received: by 2002:a05:6402:4416:b0:5c5:c5c0:74ec with SMTP id 4fb4d7f45d1cf-5c7206449d6mr1554436a12.24.1727253784120;
        Wed, 25 Sep 2024 01:43:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/6] xen/livepatch: remove useless check for duplicated sections
Date: Wed, 25 Sep 2024 10:42:34 +0200
Message-ID: <20240925084239.85649-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current check for duplicated sections in a payload is not effective.  Such
check is done inside a loop that iterates over the sections names, it's
logically impossible for the bitmap to be set more than once.

The usage of a bitmap in check_patching_sections() has been replaced with a
boolean, since the function just cares that at least one of the special
sections is present.

No functional change intended, as the check was useless.

Fixes: 29f4ab0b0a4f ('xsplice: Implement support for applying/reverting/replacing patches.')
Fixes: 76b3d4098a92 ('livepatch: Do not enforce ELF_LIVEPATCH_FUNC section presence')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/common/livepatch.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d93a556bcda2..df41dcce970a 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -473,7 +473,6 @@ static int check_special_sections(const struct livepatch_elf *elf)
     static const char *const names[] = { ELF_LIVEPATCH_DEPENDS,
                                          ELF_LIVEPATCH_XEN_DEPENDS,
                                          ELF_BUILD_ID_NOTE};
-    DECLARE_BITMAP(found, ARRAY_SIZE(names)) = { 0 };
 
     for ( i = 0; i < ARRAY_SIZE(names); i++ )
     {
@@ -493,13 +492,6 @@ static int check_special_sections(const struct livepatch_elf *elf)
                    elf->name, names[i]);
             return -EINVAL;
         }
-
-        if ( test_and_set_bit(i, found) )
-        {
-            printk(XENLOG_ERR LIVEPATCH "%s: %s was seen more than once\n",
-                   elf->name, names[i]);
-            return -EINVAL;
-        }
     }
 
     return 0;
@@ -517,7 +509,7 @@ static int check_patching_sections(const struct livepatch_elf *elf)
                                          ELF_LIVEPATCH_PREREVERT_HOOK,
                                          ELF_LIVEPATCH_REVERT_HOOK,
                                          ELF_LIVEPATCH_POSTREVERT_HOOK};
-    DECLARE_BITMAP(found, ARRAY_SIZE(names)) = { 0 };
+    bool found = false;
 
     /*
      * The patching sections are optional, but at least one
@@ -544,16 +536,11 @@ static int check_patching_sections(const struct livepatch_elf *elf)
             return -EINVAL;
         }
 
-        if ( test_and_set_bit(i, found) )
-        {
-            printk(XENLOG_ERR LIVEPATCH "%s: %s was seen more than once\n",
-                   elf->name, names[i]);
-            return -EINVAL;
-        }
+        found = true;
     }
 
     /* Checking if at least one section is present. */
-    if ( bitmap_empty(found, ARRAY_SIZE(names)) )
+    if ( !found )
     {
         printk(XENLOG_ERR LIVEPATCH "%s: Nothing to patch. Aborting...\n",
                elf->name);
-- 
2.46.0


