Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AUvFJSU2GkgfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:11:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5D3D2912
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278327.1563196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB55G-00009B-TD; Fri, 10 Apr 2026 06:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278327.1563196; Fri, 10 Apr 2026 06:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB55G-00006g-QV; Fri, 10 Apr 2026 06:11:14 +0000
Received: by outflank-mailman (input) for mailman id 1278327;
 Fri, 10 Apr 2026 06:11:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wB55F-00006a-AR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:11:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB55E-00Bh0V-GS
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:11:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d89479-2eae-0a2a0a5409dd-0a2a450196f2-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:11:12 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8947f-6fc9-0a2a45010019-d155da2ec4e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:11:11 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so294463966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:11:11 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.238])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6e7f188fsm52032866b.59.2026.04.09.23.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 23:11:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801471; x=1776406271; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCtlxjlSuMwXsDsVN4yMlT8R3p+rWiyVWAPY7xiKyxQ=;
        b=HVr6NVeEWsc0BBGRXYsFf3aqNFOj8A36gPEO/gTqz1tBnuwOEsmg3Yx7HQJsvDMqAw
         gT9K5jJ4/WM1LxOs3sgQSaBlIHW3VGpjQ8W5u7+vm2HadnafrwQgelbD6qJOIE4q7JsT
         rkPHFdzhmI/14tIWekHL66kc6wt81qa/5NiLAEL0sFfVcZZzT3sI9dSaLHm4dTXV5hrC
         m81pDsH4UD+D019JjS6dS5wLVS7dtjFo1SSfrrlVDatPklzI5mKFzAkK2NMJaCsFgmEx
         jao8UmLSgansdQWYEE9+GLo3XAU3DyfVy2w147H+SCuztRzf/P61slWUQa1UnWlyHvuw
         B8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801471; x=1776406271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCtlxjlSuMwXsDsVN4yMlT8R3p+rWiyVWAPY7xiKyxQ=;
        b=mrmHrw2PGyglamIDS3/qO4dkDmG06UOhuDlPeG4e2pFtvP+gaw8PZFQcnEjAa6HmIL
         YhUGCmYoU2pa1ErBkC4m1lwAIz6/mJmmPo2MgtucL5ls4IuL5/NUK+j+qT/BuDYQdyQn
         u3DbXL3lzsBgFTu344BEN2/4ujuFuRAoF07Vsz/Fnv1WaNZ9D/F5FArGNs2tI5zUWW7H
         We2NrnzgcKxgKTFwbgs0n4OrmdOhuHK9ygom1Ev53y1yGFSqzERGq8/IcaL3on2fMiVe
         M3oAydKiS1G0hAAT1N+D/khmBWDZv/VRxKpWVvLszIUUAjYxY+l9oVxuV3OO9j5MV11f
         3kaQ==
X-Gm-Message-State: AOJu0YzkNcPFGKU/hR40WZRlrcnc+1al2LE+hGi9rXr0lBt8UmllvX7r
	ejwyE60oPMWVSVLBhtnjUbUmQ5yiJnUIM81ZE4uLKRH7pa3OHcGV2QFO+V47xQbV
X-Gm-Gg: AeBDiesFviOOT1Ipn6HG5qDYANLaC7nSLWTPGi8r+lq8kG3KQanbWZO1NWg74EjQoRg
	vaMlMTqnOxBBNXVizRnbTHlP9aAlJWFzdx+qIA1yBjDZ0dC7apYyov9iDG6pmwy5n08nJd/QVAT
	nBEMO0wVmtAXYdpGdpem9J/SMFkrd8+f3J8Qfu47QfUr+A8CkznCKGDwIA1+uElWY42nmYOEcw2
	I0ryUyvGdpiNilPUWtmNADvzmABORAhdTgAhEMah+L0i9OwrThvBksYIJGj2bpFJAHJT1dgfuA6
	bsqS3Z8v8ZA0d9PyrO8W+ERJNlK4gPlwMOqBXlDJ3fXlDxRzLm9q5At4cuuwKPpApJWp9DuPKEV
	EHkkLyYAXCo1msLw5/M7pvwT4xkPtJbX+Qptw0rXPcqZp9GchOXcGHMxLC6bUW3OruDuRrQAOxE
	tJJt52oPlDxtJXFOG5s8mdUx6zx94=
X-Received: by 2002:a17:907:980b:b0:b98:d58:f75e with SMTP id a640c23a62f3a-b9d7243623cmr114048266b.2.1775801470858;
        Thu, 09 Apr 2026 23:11:10 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH] arm/its: Decode BASER cacheability field before comparing
Date: Fri, 10 Apr 2026 09:09:03 +0300
Message-ID: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1775801471-B7CFA185-74CD3192/0/0
X-purgate-type: clean
X-purgate-size: 1256
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E0B5D3D2912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

GITS_BASER_INNER_CACHEABILITY_MASK is a shifted mask. Comparing the
masked but unshifted value against GIC_BASER_CACHE_nC, which is an
unshifted value, leads to incorrect detection of non-cacheable
table mappings.

Shift the masked value to properly detect if the BASER backing memory
requires flushing.

Fixes: 05238012b86 ("ARM: GICv3 ITS: allocate device and collection table")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 9ba068c46f..6a46bcc8af 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -496,7 +496,8 @@ retry:
         }
         attr = regc & BASER_ATTR_MASK;
     }
-    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
+          GITS_BASER_INNER_CACHEABILITY_SHIFT) <= GIC_BASER_CACHE_nC )
         clean_and_invalidate_dcache_va_range(buffer, table_size);
 
     /* If the host accepted our page size, we are done. */
-- 
2.43.0


