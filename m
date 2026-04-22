Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNqfDeCd6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:07:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5514446CF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 12:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290139.1569830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8J-0005sx-Kd; Wed, 22 Apr 2026 09:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290139.1569830; Wed, 22 Apr 2026 09:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFU8J-0005rM-E2; Wed, 22 Apr 2026 09:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1290139;
 Wed, 22 Apr 2026 09:44:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFU8H-0005eD-VS
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:44:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFU8H-006sRK-CS
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:44:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89881-2eae-0a2a0a5409dd-0a2a4506d542-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:33 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e89881-7371-0a2a45060019-d155a72ac892-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:44:33 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59e4a04f059so5864904e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:44:33 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a41cc7f832sm3494193e87.28.2026.04.22.02.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 02:44:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776851072; x=1777455872; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGnMzW9+BkykHD5n+WLa+P6dRUGCjGxLUe0gqWqrB9w=;
        b=DTKI43cFmWzOX9EQhcs1yh7CGi1npJH5N0TAriT5SMgNEH5KRpnQ6hyE4UlK6yVwLD
         Vk6hnIEKzd3afNn/mKnR7qrv2YKtQKc5p/GuMYpE+MZWIpg0D87juJaO3/1jJW2V1iVS
         M3MDDhYn0UOKaFFzy9vsC3XSrdztuxq5805z+6lRo/ew53Z/Coxr1Tee/aiMD3Ux/W5H
         dLqKUS9oL10q3/49FIu2Z7QPCQgAVXS/g6q7ZcjDwipWSyx8W9UyvC4p+3kksd33Zhij
         2+CnKQhaBICo3DWzHmLXCY1ojk6Yw3kDGGodY3wdqWdbPyHAEx2Gif2tHbFWZajnwiUJ
         4GYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851072; x=1777455872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nGnMzW9+BkykHD5n+WLa+P6dRUGCjGxLUe0gqWqrB9w=;
        b=HOXcXH7n8zzo/wFYQlNBa2/iaBUHflNYM8PI1jggHGLvAgvnIDRbIJqBNb2ySgwKfo
         LHprTNn66sNNZHNaoNETJkWYWyIh9NcSkoj+m98e5vDpoNaFa1gtUNx75Q8yKy7WzAzT
         y9aGm7piT/ge15XvW4XC/seZysuNxAcsJRFJsMj0sr9c3Fj8LfyOPhOE2fEOk562CRuH
         cPI3Q9CIHzmOWdAQexJPeaynxfD5QbbggOKM6OjoGChykgcXsA64ZqyQKd/53zM5hiTW
         AVWirYa9dZU1s+TK2y9D9GNZjsOb7YFGc1S0UJjTHN4hJ8EfLSo40RzW9ETFUkUY8+GM
         +bGA==
X-Gm-Message-State: AOJu0YwxC17unZY7RsO4ZM8ol/Qr+1NyoGHERl/DOj39pDrdUvFG65yu
	Eg5tz0uklSff9qpanazBSjZzMmf1quFRS1W4tWjp4sp01BwD1pH0ebn0wHFwtw==
X-Gm-Gg: AeBDietfLp7S3UIZhBSHUUshZshDOzrxW9C1LDGI7q/5ZW7ATPUVhf1CL+ExI5S1ZHa
	rDkeuU62NCiuxE7RWoQrypi7Hq7h/UODduxV9oZNs6V+FWHEyhVlcoWfxT0nYjDU42pGTA6S30y
	qdY9leLQGx0QcNqdICzUOngUdJ1liTtQ5qIX49G8hfPrqbsR/RSX1DOyQ2/GDXA6F8nwjie6XMw
	PaUXWB7RvwgXrgcEK83NExTbLlPdklnPSQJ/glqB69dMQgYBeFEg2aRsHTW19dXJJWWxh6IyXEU
	GSsWNESfYvo/jeyBopK7DycLLWd7TPJwYZTZ8LiCcaARv2no7MtEFZVwzgR5q1dAiWr2VzmrGwm
	9JD8z+dYlMdnvJquRBrew6lQueeSghBCnACUNYj5X5BYT9AInMRE7MPutxB4RCIkH9/q/T2+Ac8
	o+g3Ca98K/GPlQRKMJ+1BnUh9j78dGIKQhR9zAnLJXh1cFmPytW068sYd0K5x1Od6vEH4//c/7x
	a6B
X-Received: by 2002:a05:6512:398c:b0:5a4:7ed:3e4d with SMTP id 2adb3069b0e04-5a4172de851mr8467999e87.27.1776851071830;
        Wed, 22 Apr 2026 02:44:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/3] xen/dom0less: pass kernel_info struct instead of fdt to make_cpus_node()
Date: Wed, 22 Apr 2026 11:44:18 +0200
Message-ID: <2617586205ec7b07a302fcb8dd9dd39f3eb2c5ed.1776780944.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776780944.git.oleksii.kurochko@gmail.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776851073-91587D75-018CB061/10/73395122804
X-purgate-type: spam
X-purgate-size: 3065
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.964];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A5514446CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are two reasons of this change:
1. Align prototype with what other make_*_node() are passed.
2. A follow-up RISC-V patch will call get_next_free_phandle() inside
   make_cpus_node(), requiring mutable access to kinfo->free_phandle.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Look at the footer to the prev. patch to understand why phandle is needed
inside cpu node.
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
index 60a7cbf915a5..98f5dab35e83 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1164,7 +1164,7 @@ int __init make_psci_node(void *fdt)
     return res;
 }
 
-int __init make_cpus_node(const struct domain *d, void *fdt)
+int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 {
     int res;
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
@@ -1178,6 +1178,7 @@ int __init make_cpus_node(const struct domain *d, void *fdt)
     /* Keep the compiler happy with -Og */
     bool clock_valid = false;
     uint64_t mpidr_aff;
+    void *fdt = kinfo->fdt;
 
     dt_dprintk("Create cpus node\n");
 
@@ -1626,7 +1627,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
-        res = make_cpus_node(d, kinfo->fdt);
+        res = make_cpus_node(d, kinfo);
         if ( res )
             return res;
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index ca3ac84a3ef3..f8b1166e4169 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -535,7 +535,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_cpus_node(d, kinfo->fdt);
+    ret = make_cpus_node(d, kinfo);
     if ( ret )
         goto err;
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index a604f3983fe6..b7f6b1fc36a9 100644
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


