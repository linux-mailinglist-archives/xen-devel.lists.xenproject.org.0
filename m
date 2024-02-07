Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B2A84CE1F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677776.1054625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwi-0003wW-W7; Wed, 07 Feb 2024 15:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677776.1054625; Wed, 07 Feb 2024 15:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjwi-0003ub-TB; Wed, 07 Feb 2024 15:34:44 +0000
Received: by outflank-mailman (input) for mailman id 677776;
 Wed, 07 Feb 2024 15:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjwh-0003S2-LK
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:34:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6986bc28-c5ce-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 16:34:42 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so11075215e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:34:42 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a05600c518700b0040ef3ae26cdsm2436907wmb.37.2024.02.07.07.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 07:34:40 -0800 (PST)
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
X-Inumbo-ID: 6986bc28-c5ce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707320081; x=1707924881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvplvaESko/5mMtO6f7pTc5NpoSjdl4OVHnVT3YtPaA=;
        b=sRNbGtjozI7jsBmiv6wWsMD9W42cQjB2QWz5wbCA4VKFP+TN9HBcQ8IamaA3cpWFxM
         vBh3HMy/o7HRZkS7s1Pt6v5FrrUjCL/t18yfpcwNDmMKPrBLLbQUZy0P8IiSulGQF9C/
         AEy1NUumpw/LAmKkKj/1iQa2diFSHpPxxCKmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320081; x=1707924881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvplvaESko/5mMtO6f7pTc5NpoSjdl4OVHnVT3YtPaA=;
        b=XV7aUKm2qmo7OQlT/zYBr7GrKf/td5Yi0/9S4v4lRfZmfZMZQQ9dL8nsxSV2fFsCzW
         O/n/6RsOCk9dt4Kw/XRK2szFW1y9L8sUkZyxMYZmeDwo9TH46NCHUG/jK8foPGkiPMKU
         4jKkUUu5Bg/aAl/L9K9O6ovRijL14GJvQbwnardR3lY714erbBf2JroHFG0juFnL+XA3
         7+OZP8zBfoUh1TtHH4PVVthDo8+Hp3rpofQGZiNlyYS15Bek2Dzkr+1ZZ+filtHconk2
         RXpr9xbn4j0w107qdzsDSfItTOBbnS4969APXUF4XrvHwlNG5GDqy67YoRDjuP9rBSpj
         4Qmw==
X-Gm-Message-State: AOJu0YyLvZ3X92CmrUQGYBpf6AWrFqP/JDlfhO2G/OA8+HQS0Arsae/0
	/eHzmlB7Km9dWvcppQKOMcal++xFeW7/VpSHOKyBqiGkjerguUSzYSlgi0kbtNcwThz4MdqEGwD
	e
X-Google-Smtp-Source: AGHT+IFkS/KQnrbwKgRj5eFfG/1jKpAO+OKO8YN/8QkkTtfBcLgsExK9uaG+sSyEdWxyTU9ZOPpW2g==
X-Received: by 2002:a05:600c:3552:b0:40f:b69e:aa1e with SMTP id i18-20020a05600c355200b0040fb69eaa1emr9583718wmq.13.1707320080960;
        Wed, 07 Feb 2024 07:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEuOBcJ3Alw3uB8O9HITmnlttfnBK6KRhKaEwkWf8MNCIcisvQNBCf9Jn4+syC4ScYJNdapPguiKYrkqXmARi4bV1Iq2/Bls/z+Lig+1Ydl1eFECOqrKogka1yRTAnRMYuXcKGVREpuNr8XwW3hSCPOSY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR checker
Date: Wed,  7 Feb 2024 16:34:17 +0100
Message-ID: <20240207153417.89975-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207153417.89975-1-roger.pau@citrix.com>
References: <20240207153417.89975-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the newly introduced generic unity map checker.

Also drop the message recommending the usage of iommu_inclusive_mapping: the
ranges would end up being mapped anyway even if some of the checks above
failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
is not supported for PVH, and it's deprecated.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust to changes in the previous patch.
 - Expand commit message.
---
 xen/drivers/passthrough/vtd/dmar.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 07772f178fe6..76aade816c08 100644
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
+    if ( !iommu_unity_region_ok("RMRR", maddr_to_mfn(base_addr),
+                                maddr_to_mfn(end_addr)) )
+        return -EIO;
 
     rmrru = xzalloc(struct acpi_rmrr_unit);
     if ( !rmrru )
-- 
2.43.0


