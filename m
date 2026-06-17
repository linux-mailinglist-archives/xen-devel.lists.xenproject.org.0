Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HaQcJX+CMmqz1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335D698F0C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IQNUT+ak;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340090.1601153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHe-0002bb-NP; Wed, 17 Jun 2026 11:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340090.1601153; Wed, 17 Jun 2026 11:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHe-0002Qu-27; Wed, 17 Jun 2026 11:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1340090;
 Wed, 17 Jun 2026 11:18:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHb-00020I-7f
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHa-00CoIJ-JW
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-2eae-0a2a0a5409dd-0a2a4506b2ec-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328272-7371-0a2a45060019-d1558035b8fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b7866869so57377375e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:10 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:09 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695090; x=1782299890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QqUVygSKuOYRxT6E8v4W6Rx56YdB/LiXLrQt30w45I=;
        b=IQNUT+ake2+WZNYsyellpUM2s+TkjhM3jQj4/9osbBC0j9+D3jzjVqL8AGEpXLbwku
         abLzfD5ZRCET6cr/j4W7dlvQ5lOhsDF+5iEEVUCV3Q9XUNMia2aZIXhQLDKArA+syj0M
         FPgigHJGBMlmCXLUjyOMBRmZXVC1HYcErIlCRt9otGLKTDGTrPR0GJY0B5tFTozEPUfH
         3nyUlY4cvVQvd7IoJWOcqTWd3UC8WglhRQIwJ5vvYaKNh7S0b0I5CC/WqYJaFO5AHxL9
         5wD+k+8SqP1Cq5mNbVYIkeHF4s96dTAOGA2ZrIGQ04s9IEdarPbztQj0NKKjV1pRO0uN
         VIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695090; x=1782299890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4QqUVygSKuOYRxT6E8v4W6Rx56YdB/LiXLrQt30w45I=;
        b=EKCDLuQPFQRq66K+rJyMqi5hVwNjVCUgCbz0jjRI9MjW63rxHdliNCfJDeCbNNxajc
         Y6IJ4p9lYKSEyQ4adWGeOR2WhhaphsabisPejVdjWnYQE2cWRRIpH07mwucz/CLfTUfX
         nOWW21UEZI5nHBvfHtvqTXWejWCBYWvUtyRssIQq3JVXUjsGgpO/ZVqRjHfG2ofz5TDI
         +uZLtrV5hHzpvlCA240j6y7f/8lnkW+TgMPD6mexiYm2CCnG1ouHEig6OPoLWYPaalZL
         npGKSbDtqJpUOE4HrZqsk4Gbrjl+z1EM/YnW0FD5tEx8QdNXao3xOEX77XhAGp42O2Ib
         /JZA==
X-Gm-Message-State: AOJu0YyKfnCpUOMSzDySRepNELyYhHyJlhcsd/bC6MYxVHGftSbMSXzH
	5ahIXsEEI4Jt2bmtWjDu9Zdm3OG6yMVaZQs0gESTcvKrqvqpLvJsOJlde6664Q==
X-Gm-Gg: Acq92OEkviSc2xApF/pHnDhTUTKTDgvGHURGrj/41JkQMijEz8CiNhhCgElY10M2Il7
	h1C+8wIXd2rGHozrrtkXJ9aLSRqV1/0peZwskbKReoC1ATmbgzoFm2XOHczGKOOSoSEPQPxoJOm
	w/BtZrrxs3rVHOoi0ljntQVnm3q4WFYWWi76n81v6DjPKQdJPrUiyp7279z2HuFW6kDHp5SHLRt
	UxYgL7/oOUK59mJYFjrHZIQsiKJ2dI5jwGyPJAifrZ8daPT8mASMLHER67VLUXgtsLGRoSd3u+g
	nF3AHA+CL5Jv6m5DWerwdAypVhA/BTOzKyrFZINJPgebcMUUFLhgKlGAdr+4kkLZSZjeMmnn11j
	31rU2Y4FQ+e5ERGV5CKaYrE0ajM4lCRHbhbeCVzyfo9V9E4wD0YQ1lx3XnB1W2Lr5hEGBhhIchM
	URm9tmO6wCSXH0ZSqppHjHOqPPMxTCZu2GMOA9UaJPQeINTI95vkaKm+ri8g==
X-Received: by 2002:a05:600c:4644:b0:490:9d1b:f06a with SMTP id 5b1f17b1804b1-4923410388dmr26929715e9.10.1781695089636;
        Wed, 17 Jun 2026 04:18:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 09/23] xen/riscv: implement make_arch_nodes()
Date: Wed, 17 Jun 2026 13:17:37 +0200
Message-ID: <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781695090-8797CD75-58EC785F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1230
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8335D698F0C

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a683972e9235..4cc00012aa8d 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,10 +2,18 @@
 
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
 #include <asm/p2m.h>
 
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
-- 
2.54.0


