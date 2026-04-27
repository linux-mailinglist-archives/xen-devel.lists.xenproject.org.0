Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOXgHSCC72nmBwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:34:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EF475444
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 17:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295027.1571737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyp-000518-QY; Mon, 27 Apr 2026 15:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295027.1571737; Mon, 27 Apr 2026 15:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNyp-0004w1-Ls; Mon, 27 Apr 2026 15:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1295027;
 Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHNyn-0004hb-Ql
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:34:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNyn-00GEYf-7e
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:34:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef8208-bab6-0a2a0a5309dd-0a2a4503b6ae-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:37 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ef820d-672d-0a2a45030019-d1558029e86d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 17:34:37 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so89008875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 08:34:37 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c0354sm737076355e9.11.2026.04.27.08.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 08:34:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777304076; x=1777908876; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFryJZfQNF3su1ZPDgCjTPUOxEuDSdOZ8gDsjNuEUkM=;
        b=LmtuCGoXSm1qEW1SBQgogExYSB5mFiBiHFP3OfLC0zRKZQagY+BDLenOqSH0HsbmhX
         L9pc3bkg/cTGDaA7TwDZWXAsxsuVXqGuldexOStgAhOcbsWckMV3hxr7YUzaRUJAQ0ov
         BKU38ixfNuxAXG3DLf9pIlVCmPhX4JV2zxAnitoZ/o5hff4Kq1D4SFa7OpPFr6GfyVHj
         Nn9asE+xDgwYvKtGR7hD4umjvOYPEDaz15pgdZG7Ys1VwaVCj3ElNBC3t1lluwQ0LO5B
         naG2S2KH3OxtKvopmwkyA10Rm82jMVk05XWmRZK2S1lYc6onR1q3+iQEBO5uwnbUf82B
         Ah4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304076; x=1777908876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFryJZfQNF3su1ZPDgCjTPUOxEuDSdOZ8gDsjNuEUkM=;
        b=D4lLqkbUCS/0XNxP0ITQ/9BtBGspvCSkN9cIwT4sHf7zepIj8EqGvOaNLDGbuO587O
         c8iRP7dl64wZKGOxPnLmKXC9Y8NGrd6EbzhqKvV3Qhno+osRWWFn415iAw0GVFnhO7tw
         EEJqQ39qruFfe9k9OLDpLSTxPhwTaMve+p+PSmJ1GHotpfMwJPADUbj44/ffI4geox0V
         MbJQgGptGi0E9yMXjTZSVXq6XBhlWZI13LCx1OWnXjHHenukpMcIDpcvd0dZKq3r0eai
         /qXjd6pZgGZNe+3JPtfMRM7pp5pXCntd5CSnrwUIVu/BVajDB+BIpBI0E8Z2SjJ2oxp1
         TpaQ==
X-Gm-Message-State: AOJu0YxUaJaEfmI0rx3m/9XM8g2peEKqPwVAeHaRw84nuCS5H3Fmcgse
	kVIusI2SLUo5vC2kpbIS1rBelk/0JvTEhT+fvc1pp9jwAJWO9JqUzV+1g44Hdw==
X-Gm-Gg: AeBDietTAZTK34HpMxDzhmtt+FhEGdBbyejTKlYxh36GQxF6eBypy2H9w38Ija7bHGa
	CpSv2q8938xHSgQyYMJiy2ehOZpWJMWG18Qtbnm6v6vm8OnH3OWrMx++F8j41lHLVs6281stj7D
	3hOTHTHFXMwj4mMqqm/g7kVq7/SRNqdBk952EbWodIqghMrtXFFKSW/V5TLJ/3e0tF5G0cCxfLJ
	+MKSzD/8NeZj8YK93vzPH55ravR/LC1B+GzKLI9UQ0fWRz4uN2MVdaQyVbUuO/S167nK2foNZqi
	fi3wSMvFQX4y2LE3uzH9Np+w+tk/bERvMKS1Z3uRwUmrvtQSEZZh4QImq3A7oIC49U4g+jr6KQJ
	wJ5IAbVNO9RzJTjx0Iqhudf7DeMy3+mT5RmHv62feR5ENHxREVA7ozA6pNFZMy120HDe8Ufc5wE
	tK1uCTialvxjm2pYrzP3CJrbIyfEfcUTWXAcaexORrNVY+WAFwV6SmaP6db365ZtZInmBLG4jws
	qOO
X-Received: by 2002:a05:600c:8b55:b0:48a:57e1:d8cc with SMTP id 5b1f17b1804b1-48a57e1d8d4mr407546505e9.9.1777304076329;
        Mon, 27 Apr 2026 08:34:36 -0700 (PDT)
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
Subject: [PATCH v4 2/3] xen/dom0less: pass kernel_info struct instead of fdt to make_cpus_node()
Date: Mon, 27 Apr 2026 17:34:24 +0200
Message-ID: <d18b699f54fbd7b303f9dfbcd63e61f7eee8c0f2.1777296786.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777296786.git.oleksii.kurochko@gmail.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777304077-2B161938-1B3B62D1/10/73395122804
X-purgate-type: spam
X-purgate-size: 3249
X-Rspamd-Queue-Id: DF8EF475444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
Changes in v2:
 - Properly initialize local variable fdt in Arm's
   make_cpus_node().
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


