Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F2E845E0E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674568.1049638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSC-0007gY-4U; Thu, 01 Feb 2024 17:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674568.1049638; Thu, 01 Feb 2024 17:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaSB-0007bP-U0; Thu, 01 Feb 2024 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 674568;
 Thu, 01 Feb 2024 17:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVaSA-0007Wp-Lm
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:18 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a74d3c51-c123-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 18:02:17 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a357cba4a32so159191166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b00a2b1a20e662sm7368698ejc.34.2024.02.01.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:02:15 -0800 (PST)
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
X-Inumbo-ID: a74d3c51-c123-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706806936; x=1707411736; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UloEpPKCM7G82luLru9QjRBa08XW6aQ69k/jBsglyGw=;
        b=rNbPd2z6k1d03ehIATXiBtiO+aDVtXpX4K5tQpGZmtFiq/LY33nsoVcRmKD21l4l8u
         RVHSWcClSRMdpzVLEl6yRSzyEahGvdjJMgPsEz4JJ0T7vk8igobml+QAm7bA/JVeCLmP
         UW19WIipZPnMk4+PmfysralqiLq5u9Xgz+YGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806936; x=1707411736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UloEpPKCM7G82luLru9QjRBa08XW6aQ69k/jBsglyGw=;
        b=JdNWZsxBO+Ii5htEvhm/g9K3ti/lNh1/TeEFyDtlp/c76VXQNsVdvFcHF1682yz9Fy
         0ytg4qj5QH2e9W530nE/pgjgswHrsxeFc6lup7r1ByKTFXK1aOfbLQbOJVahm9S+Rdvh
         9ZCSbQn0LSrwk2Ys2zvHFFZM2q43S5Aej4bpWuVLQnOabtEABrixhQVKmEk21Ex3KMqz
         vKw/VwCuoktGVD2erjnMQHnHf6d0Y5HF8s9jpe5t1nVubAa7rHr/g+diz5KTOlYQ472Z
         U8MUPADt7tS9WUOCob0qsZHrD2o9BnzgePXOehC68OExvNdYZuBgbsCIeMV1g8Y4RPC+
         b/dQ==
X-Gm-Message-State: AOJu0Yx2UVHkzkWxaD7J+dNFsoc99iu9nfVxYTtKr+L+52B0XM+L29Tt
	bGdN7btVXhuun3TX/xHGZJzUlr8/N7Fseh3X+2ELZXWNc6aLIVdjUOzYg7kxmzxZUUGeMLQniIm
	w
X-Google-Smtp-Source: AGHT+IE1ioEOtkHXIsPlEbxeCQ5KNW6gZONtNKo7ovJn0q0tGWZV/t+8E8s+EtazaGjUEAvRtXy5GA==
X-Received: by 2002:a17:906:3515:b0:a36:2dc:1903 with SMTP id r21-20020a170906351500b00a3602dc1903mr2272370eja.68.1706806936197;
        Thu, 01 Feb 2024 09:02:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXRcHbpgIR2NyN9m6tWAgLtB7nbJPyYIh6UIkvdWkRs8hEq9Bn5Xp1NNCrN4gxyPsb4MxHHLpBB+H/4soWBdQS6v6r3gQ==
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 3/4] iommu/vt-d: switch to common RMRR checker
Date: Thu,  1 Feb 2024 18:01:58 +0100
Message-ID: <20240201170159.66330-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201170159.66330-1-roger.pau@citrix.com>
References: <20240201170159.66330-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the newly introduced generic unity map checker.

Also drop the message recommending the usage of iommu_inclusive_mapping: the
ranges would end up being mapped anyway even if some of the checks above
failed, regardless of whether iommu_inclusive_mapping is set.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/dmar.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 07772f178fe6..005b42706a34 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -642,17 +642,9 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
            return -EEXIST;
        }
 
-    /* This check is here simply to detect when RMRR values are
-     * not properly represented in the system memory map and
-     * inform the user
-     */
-    if ( !e820_all_mapped(base_addr, end_addr + 1, E820_RESERVED) &&
-         !e820_all_mapped(base_addr, end_addr + 1, E820_NVS) &&
-         !e820_all_mapped(base_addr, end_addr + 1, E820_ACPI) )
-        printk(XENLOG_WARNING VTDPREFIX
-               " RMRR [%"PRIx64",%"PRIx64"] not in reserved memory;"
-               " need \"iommu_inclusive_mapping=1\"?\n",
-                base_addr, end_addr);
+    if ( !iommu_unity_region_ok(maddr_to_mfn(base_addr),
+                                maddr_to_mfn(end_addr + PAGE_SIZE)) )
+        return -EIO;
 
     rmrru = xzalloc(struct acpi_rmrr_unit);
     if ( !rmrru )
-- 
2.43.0


