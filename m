Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D64D8A28E6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 10:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704428.1100824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvBws-00086d-Ed; Fri, 12 Apr 2024 08:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704428.1100824; Fri, 12 Apr 2024 08:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvBws-00083Q-Bb; Fri, 12 Apr 2024 08:07:50 +0000
Received: by outflank-mailman (input) for mailman id 704428;
 Fri, 12 Apr 2024 08:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M3on=LR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rvBwr-00083K-6F
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 08:07:49 +0000
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [2607:f8b0:4864:20::930])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf8411c9-f8a3-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 10:07:48 +0200 (CEST)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7e406cf6263so262315241.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 01:07:47 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05621415c700b0069b56900ee4sm690518qvz.106.2024.04.12.01.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 01:07:45 -0700 (PDT)
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
X-Inumbo-ID: bf8411c9-f8a3-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712909266; x=1713514066; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Eggu8OwfYsxInXltLV9w+1KX7tbnbhCGlkg377I70M=;
        b=HrgJ0gBa/Drlz/vQzKX0ET4qG+GAvvZLDCHcu47lNab/x3lD8uwajW+Pw91Vo+OO4b
         lQ3dlr9w3h1VUzS3DmL/d+e0+zkKF6HpwyrtW3gx5/syBPGqH+HYx+58y6jsGyhtZOHZ
         +BACbeG4YNaWdpWOZR8P+Rxt5ug/9XVkFX5EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712909266; x=1713514066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Eggu8OwfYsxInXltLV9w+1KX7tbnbhCGlkg377I70M=;
        b=dubGwX7fXyphgDiyfkmvHX40GfUuUsCcS9KLgUU254C2ma89e8GDgBs23lDwkxd0/X
         FiTkprPl4xC/UcnAXSvijZVQuprLgpF2AIgyx2iolY/UKmZegkMhP2+1evAcNNunwMH7
         TN5IOl5vWT+mZYHdMRmRiC2A/H7htEn4DlgqukRKwpWWEpPaM8VpMppwE3KlnfUD11sv
         W2xAaTDKBS5bK7arVMJMADSjHFwFm5EMq7O6YMt5p6OLj8Ynv/C1ZPYzCz2xcuOrU66o
         86fHGFIg25uY612YOVGlsWv/JnH2djP/bxA+D4B1qINwie1/CLv4hfS4a7DyI07S75Ov
         GboQ==
X-Gm-Message-State: AOJu0YxE5fg5MGqS3GXqiukPOQFXPG/9TpQZJ2Fbg1RdqC7RdrCvnPbP
	+HgNssZ71lJfT98o4qf8FyLTtHxKwLI0e4DCVuLuCkwjnvOInKa889jksyG8R70TQD1k24DHUSK
	a
X-Google-Smtp-Source: AGHT+IFkWogs+eFGt0VHrMRKYUY8P0GF8G/MLVL6vuLBtX1FoemPxZixWEGvkOajhWBuwH/bqvqdaw==
X-Received: by 2002:a05:6122:2010:b0:4d4:42c6:b08d with SMTP id l16-20020a056122201000b004d442c6b08dmr2123769vkd.5.1712909265709;
        Fri, 12 Apr 2024 01:07:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] livepatch: refuse to resolve symbols that belong to init sections
Date: Fri, 12 Apr 2024 10:07:22 +0200
Message-ID: <20240412080722.75971-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Livepatch payloads containing symbols that belong to init sections can only
lead to page faults later on, as by the time the livepatch is loaded init
sections have already been freed.

Refuse to resolve such symbols and return an error instead.

Note such resolutions are only relevant for symbols that point to undefined
sections (SHN_UNDEF), as that implies the symbol is not in the current payload
and hence must either be a Xen or a different livepatch payload symbol.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch_elf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..25b81189c590 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -8,6 +8,9 @@
 #include <xen/livepatch_elf.h>
 #include <xen/livepatch.h>
 
+/* Needed to check we don't resolve against init section symbols. */
+extern char __init_begin[], __init_end[];
+
 const struct livepatch_elf_sec *
 livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
                           const char *name)
@@ -310,6 +313,20 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                     break;
                 }
             }
+            /*
+             * Ensure not an init symbol.  Only applicable to Xen symbols, as
+             * livepatch payloads don't have init sections or equivalent.
+             */
+            else if ( st_value >= (uintptr_t)&__init_begin &&
+                      st_value <= (uintptr_t)&__init_end )
+            {
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s: symbol %s is in init section, not resolving\n",
+                       elf->name, elf->sym[i].name);
+                rc = -ENXIO;
+                break;
+            }
+
             dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
                     elf->name, elf->sym[i].name, st_value);
             break;
-- 
2.44.0


