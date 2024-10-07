Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1958992E30
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812020.1224675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoKm-0004WK-Rv; Mon, 07 Oct 2024 14:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812020.1224675; Mon, 07 Oct 2024 14:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoKm-0004TJ-Oj; Mon, 07 Oct 2024 14:03:36 +0000
Received: by outflank-mailman (input) for mailman id 812020;
 Mon, 07 Oct 2024 14:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68k9=RD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sxoKk-0004TD-Pr
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:03:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff805ef-84b4-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 16:03:32 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9963e47b69so27454466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:03:32 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7840b6sm381824866b.101.2024.10.07.07.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:03:31 -0700 (PDT)
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
X-Inumbo-ID: eff805ef-84b4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728309812; x=1728914612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIibmESNiAHxwibKuOWS9nvVl03nkcPOYAxCILNTlPk=;
        b=EWgnLWjF/nFRc0vzUhhgQi3n3XkP+emVrSd++wLE4YdG8zBdMhzT5KHl9/2Gs0jRUf
         qq3aUEPB/4/mzZJawL0eo3GuEKXm6yBqZpauL4L5wbXnR5+1I0sYbzxHLQ0mICDPLBJW
         fF5vzl7lakuxDcPBKQ+KTGWgTkUjTtsRHq3bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309812; x=1728914612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIibmESNiAHxwibKuOWS9nvVl03nkcPOYAxCILNTlPk=;
        b=WLNx8arVxcFiuf1Ny+FqGwC8RZwLODaumS0A3ivpvoDc3/bpJGuR0SbXzK59CzwELC
         Ab4/Ldf0yvcUPNpvr15OaGwNev6PZYC6Fn4HyduN27AirpcxoFyfubfxZeFhz4zaJniY
         9VPQ27oRhsGIBmlUPtLs9RRl0sYUtRBhGU/c43CLT5o9clu57hTDwB1CHMYawuZgDYN3
         GKs8itClbt18E56ZAzdVV9fbWW+NZKwv+x3RhYhhJ7FaG252faFAkbXSSyVoxrfHFg4K
         I/qgrwJJa5Ql0YNfo2yQL7gJ3AP6GnN+jD5MbsItSlN7L4sQXMOQT1vOJgOLvC4dRf6Y
         TpSg==
X-Gm-Message-State: AOJu0Yw7/jO9uYWQxo4TEoQXrYqgqEY831Ho2E8cPfEKijl1E8R8cvVb
	9xyUp78WPh5cfYxuJXc3TvBgJ81VUeR5A/GzygeXualZLt1pd4oIxTXWlUc1/MGhaKOG7zwUF0I
	A
X-Google-Smtp-Source: AGHT+IFpnlGhKvrQdlxuo5jEFRzMdphsLWx6zGErXfZyCU73LLnfRAH2gFOxi0phbxKOxupSrdWmxg==
X-Received: by 2002:a17:907:7248:b0:a99:5110:7a4d with SMTP id a640c23a62f3a-a99511081f3mr465254466b.61.1728309811812;
        Mon, 07 Oct 2024 07:03:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/msr: add log messages to MSR state load error paths
Date: Mon,  7 Oct 2024 16:03:17 +0200
Message-ID: <20241007140317.67478-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some error paths in the MSR state loading logic don't contain error messages,
which makes debugging them quite hard without adding extra patches to print the
information.

Add two new log messages to the MSR state load path that print information
about the entry that failed to load.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 69a25571db8d..c71087f636c4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1598,10 +1598,19 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
             rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
 
             if ( rc != X86EMUL_OKAY )
+            {
+                printk(XENLOG_G_ERR
+                       "HVM%d.%d load MSR %#x with value %#lx failed: %d\n",
+                       d->domain_id, vcpuid, ctxt->msr[i].index,
+                       ctxt->msr[i].val, rc);
                 return -ENXIO;
+            }
             break;
 
         default:
+            printk(XENLOG_G_ERR
+                   "HVM%d.%d attempted load of unhandled MSR %#x\n",
+                   d->domain_id, vcpuid, ctxt->msr[i].index);
             return -ENXIO;
         }
     }
-- 
2.46.0


