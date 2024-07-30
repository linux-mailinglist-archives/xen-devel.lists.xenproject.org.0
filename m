Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F318D941573
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767915.1178619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomt-0000Ry-Cf; Tue, 30 Jul 2024 15:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767915.1178619; Tue, 30 Jul 2024 15:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYomt-0000QU-9X; Tue, 30 Jul 2024 15:29:19 +0000
Received: by outflank-mailman (input) for mailman id 767915;
 Tue, 30 Jul 2024 15:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYomr-0000QJ-H1
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:29:17 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab31b12-4e88-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 17:29:16 +0200 (CEST)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-492aae5fd78so1114742137.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 08:29:15 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d7435577sm651787085a.96.2024.07.30.08.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 08:29:13 -0700 (PDT)
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
X-Inumbo-ID: 7ab31b12-4e88-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722353354; x=1722958154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jXomYbaE8u0KFR+xvRRy2AxaxaX7PmTtwsEZkUj+38=;
        b=EWCXYL733fq8vbh0vqqzDM3w960C9oWV15tvovDGbUH/KG3Rj+ExmJcec9q2GuRHRn
         5Xin/5qkVrwfdttYfdDOmGL3M6TjCcJmtkm/XrXXw0wmzu6LMgy4f2vLOkIFqjPrAX8T
         JQLaXPPG+S63FwcZSaSRGfraVmw+cTDToL+wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353354; x=1722958154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jXomYbaE8u0KFR+xvRRy2AxaxaX7PmTtwsEZkUj+38=;
        b=iYopWiJ01z0AHQO64XvN2JRmZK6erryNh6Sd/PVNnfVrEEm5hsaoA6etG0a5wXg08y
         PYNadc9Ta9khdrqm8ArYuSt4dSNQxB5ax73r3WiBr5RFhrx1MGfNVZOaaDk2jMe29z/L
         GRPslsMTtUYkqhiGO9q0yftfX/Q0y44jNdja5srAK8qe7rm3MwbM6FyO5n5eNyvKXnN3
         GSawrACfatTjZEj+85dqFkU+SgdvVo8XykUHSuE5uB/Gdb3grsrG+KG620bFySjUT3MD
         8vGkyn2My2zlIDf+zqY7jTAzp8xm6rcVgGkgZtrkM1lh2ynrBPOSIn4gKW/jr0RtD/kA
         klHQ==
X-Gm-Message-State: AOJu0YzYGfW67h123KV01mY1wYq4SNwAGs0hiOG3/LhW4gQF3qacdeuG
	Qv0N9oyDO4G0fyXcNVTuQhPBLPvEueljn/Yp/WeEPsiMtYNr/YVK8mB5Wi6f8w/V2KChw5/C4R0
	E
X-Google-Smtp-Source: AGHT+IG3qG4KX8gBOaTMf1dqfWFiaaPHVkikXVXnKiQA5hYLP73G2UP0tseY0EDRaD5ahxaZXSBfEA==
X-Received: by 2002:a05:6102:3f48:b0:48f:eb5f:84d8 with SMTP id ada2fe7eead31-493fad8baacmr14788749137.27.1722353354249;
        Tue, 30 Jul 2024 08:29:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/dom0: fix restoring %cr3 and the mapcache override on PV build error
Date: Tue, 30 Jul 2024 17:28:54 +0200
Message-ID: <20240730152855.48745-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730152855.48745-1-roger.pau@citrix.com>
References: <20240730152855.48745-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One of the error paths in the PV dom0 builder section that runs on the guest
page-tables wasn't restoring the Xen value of %cr3, neither removing the
mapcache override.

Fixes: 079ff2d32c3d ('libelf-loader: introduce elf_load_image')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/dom0_build.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a27..57e58a02e707 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -825,6 +825,8 @@ int __init dom0_construct_pv(struct domain *d,
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
     {
+        mapcache_override_current(NULL);
+        switch_cr3_cr4(current->arch.cr3, read_cr4());
         printk("Failed to load the kernel binary\n");
         goto out;
     }
-- 
2.45.2


