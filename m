Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP0SI2hU/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8E4E55D8
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302333.1576324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZd-0003OL-LQ; Thu, 07 May 2026 08:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302333.1576324; Thu, 07 May 2026 08:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZd-0003L1-FG; Thu, 07 May 2026 08:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1302333;
 Thu, 07 May 2026 08:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZb-0002t8-Lg
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZb-00CM1g-2P
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc544c-5cb7-0a2a0a5109dd-0a2a4504a78a-46
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:11 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545e-1dec-0a2a45040019-d155d034d04a-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:11 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-67179ed133dso641972a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:11 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144350; x=1778749150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRsnnevu9J7EHdsbqnkGstxc8WDNRA7C/OR2k/OqOes=;
        b=VZDDzy87ZqmYpTAR3Yf7Jp3GqcWI9w6fIIsRTMYXUhqovRhJ0I5BXNaF0zOxjKijQq
         PNmac2nU65sagx+iEyTjDtqUsnqnKJjzPREQbiFEZWLOMUSyQAUr910ymrd4YkHZA7SJ
         FM+9r13FRMlMx1uEGsJlqxr/AcI9sNgLbmRP3vid/H+pmODKMqzlMQbZcCfuV+iAZ81w
         7LyuKDfIsLq5OppPeFywWjemaya4BGfIHdGQCdGrIE2UwB4D7hMMj4L8JYu1212g6yzL
         dh++zcdJD9YnPhlTF5D2ltOZu2EPKan2t24edr13VJcHYhnCAO4TuortR/6Gbka/MTWA
         U/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144350; x=1778749150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRsnnevu9J7EHdsbqnkGstxc8WDNRA7C/OR2k/OqOes=;
        b=sjXcGJpNyJKQkcnSbgI26c6eICpUMPsM5FFstLUzgUJHACFH0aeGnfzfl/6F9owFPZ
         4oP9fTJ9OH3b9ndDCV+3H32IxJfFIBjgr/rSB9RWQjQ7Kxq7UIQpgF0RO0UV0hD3JlID
         Q8sc6mml805PKNvE2T2VKQcLCwDPxwcsA9Da8FP9APgqPDDgNjs6sysHhSyFZX7lGE1I
         ZOS1KqD59TnR4kUC47jwrMJDL0dGStj7xffjBcXihlprtde9hXdaFj7UNX53UDo6rkoF
         pGSGF6hv9QKvRlGZYTyQf0fuVNEGu/kyXnFACJUOzHPEy9jrJSXntJDav+dXrUvHu9tf
         G4hg==
X-Gm-Message-State: AOJu0YyAg5VzxWYlACL5zTibdCAjQh2cLSQMSWpYy+JIwHsUx2kQd0fW
	bMT3KdvcuZ7AY1D/BN5tyAkXo9wQOuerhu/1nMB2WBUQzCwSHtwJvjV44RkKng==
X-Gm-Gg: AeBDiesr4qKWDiUpEmcLZxY/k7bm7nO7dvawQ01h7wEONL2OBPynR6TD8OumveTRqPS
	k3DP9FQoMSvd7uct0wCjMaEpYBUFELShQUefYMdSmnVLz5W+FDCptFl6ff+DFImsSuTWnPPZaaI
	SAcXsRySV1MEflZs1xcmk6MTvvZ72u2B71omcvctNJcOE0/hbnz0X/776YbMlAhlkljW29YzqEH
	4U2COsSrMts7HcxS01m0ffhHkekrm98YRK82kPppcPAHOKJbxMmos0Kr+oc1OIounYjJaUT+7yD
	o2HauPoV4Gl8pVwjCqbSaIA8lDsolWo8W+kQzpg7IPfEc76qa9avQSWE8rATWY6+2P4JROILs2F
	EJ3kxug487ReZV4eFyDLTumJJnJKxzJI7Wp/l4WoK/owyhzh9yWKlk/cM4gM/tFaua0GTB/tNuE
	0oT5NaUBgqHFy/b6MOR2MOyLTT+5CLE2owDL1UIOXDpXWa1K3BxtNF9RIM5mxRlgs010FiGwJXe
	VmA+xLl6rnNVns=
X-Received: by 2002:a17:907:930b:b0:bc1:1716:2e9c with SMTP id a640c23a62f3a-bc56b1272a7mr400444166b.16.1778144350078;
        Thu, 07 May 2026 01:59:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 05/11] xen/device-tree: use p2m_gpa_bits in common code
Date: Thu,  7 May 2026 10:58:44 +0200
Message-ID: <da9139f28ec72a7a2b9be949e67d57693af8b780.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778144351-4197A3FF-E9835FCC/10/73395122804
X-purgate-type: spam
X-purgate-size: 1927
X-Rspamd-Queue-Id: 39B8E4E55D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
p2m_gpa_bits to use architecture-neutral naming in
xen/common/device-tree/ code.

No functional changes.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v5:
 - Rephraze commit subject.
 - Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>.
---
Changes in v4:
 - Nothing changed only rebase.
---
Changes in v3:
 - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
   renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
   changes clearer and keep using Arm-specific terminolgy inside
   Arm code.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/arm/include/asm/p2m.h        | 2 ++
 xen/common/device-tree/domain-build.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..7957dbd96e57 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,6 +14,8 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
+#define p2m_gpa_bits p2m_ipa_bits
+
 #define MAX_VMID_8_BIT  (1UL << 8)
 #define MAX_VMID_16_BIT (1UL << 16)
 
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6949203dacdc..2a760b007b57 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -221,7 +221,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  cb, free_regions);
     if ( res )
-- 
2.54.0


