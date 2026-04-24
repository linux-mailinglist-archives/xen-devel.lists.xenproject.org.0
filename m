Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPUfBxJ362kQNAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:58:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018345FE4B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 15:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293571.1571214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiP-0002wN-F6; Fri, 24 Apr 2026 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293571.1571214; Fri, 24 Apr 2026 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiP-0002tG-Bc; Fri, 24 Apr 2026 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1293571;
 Fri, 24 Apr 2026 13:37:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wGGiN-0002dY-RT
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:37:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGGiN-00EP0d-88
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:37:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71e7-2eae-0a2a0a5409dd-0a2a450bc858-42
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:03 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71fe-212f-0a2a450b0019-d155a72fa495-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:03 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a10d130b37so7847646e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 06:37:03 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a5241f6583sm3649078e87.39.2026.04.24.06.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 06:37:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777037822; x=1777642622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/RZ80b7VFUK2z86zIRDb2DVaNRf6KFOtP42XANEu1E=;
        b=WWEcydPAnyslEO2fQ2ZRiw3DyvUaSPq/ygEQYBhKHLqOWKo4KV5t9T70OcamQlXLeu
         JZyFxsJqsO5+cmiuXiBNGcDb1URmINFTRLNj8Ido+n+oF9IuhyWuQeIJ7AEb2hai3LGO
         6qZncYVTiuQhrH56SSnKw7yb9bt7MIMqFR+CdF0ri34nkO5F1ERduvKFQ5oYMbAytV/K
         Zpd2VDAqsb/XrHjriPqm0wQJ4aNObI1h3pjJ9MuG0W//d+5jgcZtPMTMt//vYMIp8S5I
         5Fak5VLMvHYAR8BQ1p75PffFt0cwq4AwJGqsCYE3a+7zCi2ASmT6dvDZOlg0cADteXJo
         nClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037822; x=1777642622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0/RZ80b7VFUK2z86zIRDb2DVaNRf6KFOtP42XANEu1E=;
        b=Hfi2jPfdUGwlymR1yQL2R5hfy8+3wnSODZaPMLZe6Nje/cqDztZ0g52TIZxquruUVv
         S0JSN2/nMnSxNieBmfiohO23KwHtBRWJ9DaDBnW7jFdrHtO3hPbuDlwJPN6Q3YQ9rQUA
         ohf/jv+TaS4xUBeEo136pHTrMBfZBL3k25vIflpDObaTOP40rbLXbKJrI/gQLl1uneMV
         m3k4I4/0gPcpDCqCT+8RJC2LV89anLLoG4gszaty7FIgKCD0HKpcDsI204kv5q/AVVmG
         xKQxMn+8akFGsW2/1J/+fAbQ8u/2DdirTJkjXJMYtYJPYjgpcT4ZeTyElcn1nxI/La2c
         zDRQ==
X-Gm-Message-State: AOJu0Yz1/1xqvLxk3R/+FQ9Y2BQLrs0Vuzi/CswDizpR3k5+DYveraRx
	kvvrHz4xsrv2Vn21kz3kTtHTxv62DAmYUqa4LNYWs09Iux9MXIK5EzBi/uowCQ==
X-Gm-Gg: AeBDietbQsx3sDIG1qv1rVQB3bVHuWHg3TcuQ9xV90P5eQ6Ad8zSW608Tgc7SZduPEA
	KGv4fg6Qo4sOr8dGmd6hIFEqXZb8JmZXRWavpK8sl/boaG4ryB7pNP33z4UcK7LpcmIfrxkgXvN
	DctdPUsUhUjXXhLaNbKBuSAabZYysPgmQ4b3pcvRYBfoE0/C9FwdGzwc1R3YWk9yi3zj3XMpN20
	Q9Uihl+lD6qBAabAjCHAcCL//g2tT+4S30eUSdLtZCx6w8C6p25joBadTAnl5VmaDOBg3mlO9bk
	AV/eOuoMn27U5eRhEfR7ve4KrqQUhFmEDTgtGd/YzfdsNB4Pplurt9nRc8uakc8dsXFvdiajqiX
	lIHpANhOiS3DgQOpr4xm62mnFxiOwmEMVnM3KTFihtqHKUlvBBevmxsoAWhF+LBYNMaEXLYlk1Y
	ZItt3dRKdmi0NqcmTkIwkIbX/vJCpjD3V8p08/DdJG1Kn5MA/RPS1BNJh0cVr+Z9QysxMoYUNXP
	ROM
X-Received: by 2002:a05:6512:3094:b0:5a4:165:3ddb with SMTP id 2adb3069b0e04-5a417299a02mr10621418e87.12.1777037821762;
        Fri, 24 Apr 2026 06:37:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/3] xen/dom0less: pass kernel_info struct instead of fdt to make_cpus_node()
Date: Fri, 24 Apr 2026 15:36:50 +0200
Message-ID: <23edbf2f4b102ff68aacdc744ac9968aedbc6854.1776957840.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776957840.git.oleksii.kurochko@gmail.com>
References: <cover.1776957840.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1777037823-244B4F3B-88265D88/10/73395122804
X-purgate-type: spam
X-purgate-size: 3199
X-Rspamd-Queue-Id: 8018345FE4B
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

There are two reasons of this change:
1. Align prototype with what other make_*_node() are passed.
2. A follow-up RISC-V patch will call get_next_free_phandle() inside
   make_cpus_node(), requiring mutable access to kinfo->free_phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Look at the footer to the prev. patch to understand why phandle is needed
inside cpu node.
---
Changes in v3:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
Changes in v2:
 - Properly initialize local variable fdt in Arm's
   make_cpus_node().
---
---
 xen/arch/arm/domain_build.c             | 5 +++--
 xen/common/device-tree/dom0less-build.c | 2 +-
 xen/include/xen/fdt-domain-build.h      | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6c17a84b2633..a3ff70102376 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1163,7 +1163,7 @@ int __init make_psci_node(void *fdt)
     return res;
 }
 
-int __init make_cpus_node(const struct domain *d, void *fdt)
+int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 {
     int res;
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
@@ -1177,6 +1177,7 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
     /* Keep the compiler happy with -Og */
     bool clock_valid = false;
     uint64_t mpidr_aff;
+    void *fdt = kinfo->fdt;
 
     dt_dprintk("Create cpus node\n");
 
@@ -1625,7 +1626,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
-        res = make_cpus_node(d, kinfo->fdt);
+        res = make_cpus_node(d, kinfo);
         if ( res )
             return res;
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9787ee264975..6d6882a34b5a 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -534,7 +534,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_cpus_node(d, kinfo->fdt);
+    ret = make_cpus_node(d, kinfo);
     if ( ret )
         goto err;
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index fd2ba01ff0f4..0d40d8cfa105 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -25,7 +25,7 @@ int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int construct_hwdom(struct kernel_info *kinfo,
                     const struct dt_device_node *node);
 int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
+int make_cpus_node(const struct domain *d, struct kernel_info *kinfo);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
 int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-- 
2.53.0


