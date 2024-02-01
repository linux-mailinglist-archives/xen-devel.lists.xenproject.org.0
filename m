Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62201845E08
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674566.1049618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS8-0007BW-Fn; Thu, 01 Feb 2024 17:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674566.1049618; Thu, 01 Feb 2024 17:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS8-00075f-BC; Thu, 01 Feb 2024 17:02:16 +0000
Received: by outflank-mailman (input) for mailman id 674566;
 Thu, 01 Feb 2024 17:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaS7-0006n8-1s
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:15 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a8341b-c123-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 18:02:14 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so1537824a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:14 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h29-20020a0564020e9d00b0055cfb3f948fsm7002015eda.76.2024.02.01.09.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:02:13 -0800 (PST)
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
X-Inumbo-ID: a5a8341b-c123-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706806933; x=1707411733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGkbw6NMRmq84Zwm3toJg408+YkNymy6A8aNzx/GF0M=;
        b=WOgFGmp4wAlVZe5KSBYm4fBKBfSBdlk357RV5UIFLOIru8f2k4iKop1hFKpyyOsv+m
         9eTCf2nQTsmJtMbWPob3emXPsseqQ6Tyo163yfi79jv0fUyS3wXsaiHyRLTMkOknuix6
         rwiZdvEC0MCUlF73TCII3pjH6o4OkGBu8gGoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806933; x=1707411733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGkbw6NMRmq84Zwm3toJg408+YkNymy6A8aNzx/GF0M=;
        b=cswMIbBaMh+zeqbZqHUXNVTRszQ443nA03LvhFWvvvdrPz+7u5FhMn9ElEF5O7XAhY
         NsqabZco3oqGMFhoIa6AZIRCFOiEIFGaw9R5ZlF363FYOotD1V+AowWPrYBABhgOx1cX
         Ynmv/s6cBqr6xeiaHQfYodbzV0oo3+lC1WmqruMjGhtNFlbA61YRdpnWcs6P8sPuzhGJ
         NCrKUcLu0pNAO8SFQj1U7rveKMimGICvyLGhEIiammNb05MdPw5zdq/oFNzGdlkDMNpY
         gVGZtX52SSktFTnMZDZoQG7kU7/+Pgn9iePeSiWp4ARmdFF5/Dh2ejC4hxr3cFDb/jFH
         J9ng==
X-Gm-Message-State: AOJu0YwBWlLuUPfCz8KVb01b9ZfVFgLOn4NJ18wED09R4Zsrs+DS+hRs
	3mAh+fFmYgXwT7bhvjaC3E+RnGzK2hdMnX7sSgZfUDXKVu57hSgiT2vzHx1C9hLTnb/r2mNRuiE
	M
X-Google-Smtp-Source: AGHT+IGIMAX9xEfzp7fazur889a6R83N+pLnidiTerN578sP+ra2lpf0shXr+EPsnqASXyDum22iXA==
X-Received: by 2002:aa7:d5c6:0:b0:55e:dcdf:50b0 with SMTP id d6-20020aa7d5c6000000b0055edcdf50b0mr3590001eds.15.1706806933771;
        Thu, 01 Feb 2024 09:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXa7/kBApDrW+9oLGL5JuXgqFjsL7REMMsbCNkqEymxKzmK6rPiWX8gjFOgJ9L8ciruSynzi2zHvP4pAUa5PQrrhSdSTpsLNI5FKIRo7qkN7zxWhxL5+OreNCiZeAN0U91XWHZnH50iqfzKV8M=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	oxjo@proton.me
Subject: [PATCH 1/4] amd-vi: fix IVMD memory type checks
Date: Thu,  1 Feb 2024 18:01:56 +0100
Message-ID: <20240201170159.66330-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201170159.66330-1-roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code that parses the IVMD blocks is relaxed with regard to the
restriction that such unity regions should always fall into memory ranges
marked as reserved in the memory map.

However the type checks for the IVMD addresses are inverted, and as a result
IVMD ranges falling into RAM areas are accepted.  Note that having such ranges
in the first place is a firmware bug, as IVMD should always fall into reserved
ranges.

Fixes: ed6c77ebf0c1 ('AMD/IOMMU: check / convert IVMD ranges for being / to be reserved')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: oxjo@proton.me
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 2e3b83014beb..ca70f4f3ae2c 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -426,9 +426,14 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
                 return -EIO;
             }
 
-            /* Types which won't be handed out are considered good enough. */
-            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
-                           RAM_TYPE_UNUSABLE)) )
+            /*
+             * Types which aren't RAM are considered good enough.
+             * Note that a page being partially RESERVED, ACPI or UNUSABLE will
+             * force Xen into assuming the whole page as having that type in
+             * practice.
+             */
+            if ( type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
+                         RAM_TYPE_UNUSABLE) )
                 continue;
 
             AMD_IOMMU_ERROR("IVMD: page at %lx can't be converted\n", addr);
-- 
2.43.0


