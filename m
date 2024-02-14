Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED358548A0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680617.1058647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeH-0005hH-BX; Wed, 14 Feb 2024 11:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680617.1058647; Wed, 14 Feb 2024 11:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeH-0005e5-89; Wed, 14 Feb 2024 11:41:57 +0000
Received: by outflank-mailman (input) for mailman id 680617;
 Wed, 14 Feb 2024 11:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeG-0005Pc-C4
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:41:56 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0de73d36-cb2e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:41:55 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so394416f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:41:55 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x4-20020ac84d44000000b0042c4f46a994sm1934179qtv.75.2024.02.14.03.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:41:54 -0800 (PST)
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
X-Inumbo-ID: 0de73d36-cb2e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910914; x=1708515714; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94Zht/z5Je72hcNo+d2tbsOKFvcKaoSfFgtITaQ3n5U=;
        b=SW360cwWTfLDuLpOY9V1ckMfL2Kt97p8VYEqHCE8pqMVfaE6hsZHYQMrD+T0H7dhFY
         R1frgzZVSJ/a4zzRpWUQPnS0YaJ0c8dx1OXB84ZoUYgdBOuSsYrTtlfm5xtZkyUa6eED
         2w9JAire+NWB+QQSPaLF0ToIOgXaQDOVCondY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910914; x=1708515714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94Zht/z5Je72hcNo+d2tbsOKFvcKaoSfFgtITaQ3n5U=;
        b=S6t8SlIC7Vhg5tOcOsb0mange8t+HrBDC/r6xf/09kMdvo87zofCXyTGSAtIsUK+YZ
         +gfNZgIZqvOOlRXdpUtYc1Xvfk6WSlvcaNFsilEUAHflAGtVVvPEW7eBSy2RVT6nZ4Po
         XoLYqyV/5cr0sZVyS2IHPoSKYgsWtzDWYcbllmbxjzOV7GqJZE4vfaE4FkaohxTvZL30
         T1GE+RQMEAYxh0AlaAOBvJsKA/HMjkt4mkx5G9jyXQkUD4khs/nzCyyDvAm/LfG7Qe4S
         KIp8tW/NXWBp3aOclv4xVDrFGTtBWcQeauqnTiWckX7txbJqvCNcRxPkx41LBlJ0j6uv
         VNqw==
X-Gm-Message-State: AOJu0YytBTQlVOIDwgEkuscssnvhAR0SK7iDjUtoIlnUCI11XlX/2Vct
	4+VeSndL/cVZtwpB6HUI7Q/gW+kg0QDWMTevJSWNQcsrO7XPY2xNqx+JmDiMafmA+O0F+lZ7sd6
	B
X-Google-Smtp-Source: AGHT+IEkEoDh/AVgNK/zEUbyRj4HeKXLiM43nhLSJLRhxeMK+hvruqQDYd8uOhDgGtSNqa7Q9Z+CbA==
X-Received: by 2002:a5d:6387:0:b0:33b:81b3:78a8 with SMTP id p7-20020a5d6387000000b0033b81b378a8mr1777186wru.18.1707910914756;
        Wed, 14 Feb 2024 03:41:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWey/ui9yHUSZHbl2yekfFjQ4UyqIIZVpK+rsjQvNtNmInYGZTW6tKzTJKzBHZ6pdX8SDkn/d9cysiCciMLbPln1flWtSSE/UZYrUgeRLnI
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH 1/5] iommu/x86: fix IVMD/RMRR range checker loop increment
Date: Wed, 14 Feb 2024 11:37:37 +0100
Message-ID: <20240214103741.16189-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-1-roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mfn_add() doesn't store the incremented value in the parameter, and instead
returns it to the caller.  As a result, the loop in iommu_unity_region_ok()
didn't make progress.  Fix it by storing the incremented value.

Fixes: e45801dea17b ('iommu/x86: introduce a generic IVMD/RMRR range validity helper')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 1c8cf3271a09..a3fa0aef7c37 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -804,7 +804,7 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
            "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
            prefix, mfn_x(start), mfn_x(end));
 
-    for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
+    for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
     {
         unsigned int type = page_get_ram_type(addr);
 
-- 
2.43.0


