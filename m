Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMiiCWJSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0AC255607
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250548.1548038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00io-0004Wk-DX; Tue, 10 Mar 2026 17:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250548.1548038; Tue, 10 Mar 2026 17:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00io-0004Ur-A5; Tue, 10 Mar 2026 17:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1250548;
 Tue, 10 Mar 2026 17:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aQ-0001Q4-I4
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:38 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea6f992a-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:36 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4853510b4f3so41190585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:36 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:35 -0700 (PDT)
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
X-Inumbo-ID: ea6f992a-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162576; x=1773767376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJVP2CNX14UgxmTAWNMtAQ5gdpc3OGAi5Vg/Vni1k8k=;
        b=gLgGsN8SmUSsWitN/PB72s1+nqVMlU3K4dhUR7Y0ngWHxHby5cakYuynZMNdvMXGYz
         qoOmFWXtorZE/9IJyvBzNk6vTtyCkRmkjlMPX19A5Jk1UIFeWLBmCGXh6zJ+MKtJJty9
         lvmKGn4/ZYKLXDgQwsi7WHmy373b8H9+G4LiuH5PmTdfLSjJNfJKa5o3td7f+B/AVlmq
         SjMDkOtlR/W40ht91XOjZIEa+lI3E5AKTjUf2Wcfagb1MHoxpryG1lEUMarZTWfTz7r+
         hIfUDMuJTxZbHPeTePlegX419LD1lIYHawBTaIvOw7PpD+IPSsSWIZDqgDSO5/b55wlL
         9Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162576; x=1773767376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yJVP2CNX14UgxmTAWNMtAQ5gdpc3OGAi5Vg/Vni1k8k=;
        b=PI0WoY1KdrYkmC94pZmdh8B4TmZswHwtcDXjGs2tT2BgQdEnp2pLjpi11JikqWdYiT
         gEaQUjz0OQQwxDHaMGDA2gd3/Frai2v6snROZtOFQ6N7iCXEoAO/sdDOPTPUWZyfIYa5
         5aRB/btThnExKpsHseyvBXQxwoWbLK35rolV7SP3gO0nR+cFBZfk8OsN/8wEsotWNCx4
         kkMd4ppUigRGE/eGGp2zqlcNYmurZ6yKgVw9aLA+ro+Qfj16OKGsVWA9ezAD4nIAra5/
         kFG9TSMiK/954VVi1S4FBTrytLS+By2FPPPQAJ9fXNvcgmC3TSs0W3h3z6A+MkZ/mHeP
         SoHQ==
X-Gm-Message-State: AOJu0Yz8gMkYhuzA5lxjyzLBarABcYRWq+0g2LI+919IzFr1ZSL9VdZo
	Y82NJUZVyiwtlapKY4p+J+NsnARpbMFg/1cbvxCjF8AlOwbYTNgcLZs72Qmfnmtc
X-Gm-Gg: ATEYQzzutfvmvGRD+M8AIosLcyxvDo11ODD2zPcWQfhAQzEF8QNKI4ZgreR9STffxtB
	r2rcyjedaOqT70a2y7f6tB1L2oo0O5R/GAhJxa0w18QolZEB6mk+3MoRjuhFdFnoT9CBsVjSUNC
	7PA6tSxvoofrg7XmbyxXd5ZZ4SpUQm196pbm3hwxfj662me1bweRYmlvzJn/UIDGqg3c5h8wXm1
	I9RRRJfclDTOBwkv5QWehrz11PKS47E3bkqlsCBZrfpcLH39EvBoJhR3uMOsefSxwUEc11fTZ1k
	meP5boI4XwsJa4wRsTpEQBcK7ERmwD4mX41Zf+WntgbYROBk9o6zmbE12oSjek2MsGqZGF9LWqJ
	ODmd5Ky/5D4VElxQALrHbQp6TqDRyR+fPXwJ2Uyjb2uTUx2R8NIApyKNbYX+ze+AW5wLryVgvkr
	ar6wRq+h09NKlN2gySZ+t6gJ6hm055yd57YTrm/UfUrdv89coiuFbNi+tcZ4UWFwEyQRP0SrqbK
	ZHfPqAS
X-Received: by 2002:a05:600c:6306:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-48540ed03fdmr88457825e9.17.1773162575630;
        Tue, 10 Mar 2026 10:09:35 -0700 (PDT)
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
Subject: [PATCH v1 22/27] xen/riscv: implement init_intc_phandle()
Date: Tue, 10 Mar 2026 18:08:55 +0100
Message-ID: <b0669c89d963c31426acb239bc7c436c13d6ba45.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EA0AC255607
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/dom0less-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 312c5d7d4979..180d653e5780 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,9 +2,26 @@
 
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/intc.h>
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "intc") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     intc_make_domu_dt_node(kinfo);
-- 
2.53.0


