Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W7hMEH6CMmqt1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB6698EFB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IpNC0CkQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340089.1601142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHc-0002Cd-I4; Wed, 17 Jun 2026 11:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340089.1601142; Wed, 17 Jun 2026 11:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHc-00024a-1u; Wed, 17 Jun 2026 11:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1340089;
 Wed, 17 Jun 2026 11:18:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHa-0001l5-3p
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHZ-008nTo-Gn
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-bab6-0a2a0a5309dd-0a2a4504bf4a-10
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:09 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328271-1dec-0a2a45040019-d155802fed26-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:09 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so53247215e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:09 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695089; x=1782299889; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua5oAufZEffqM5l46feS+w0Dh95aYTaQPQ9PFyogonw=;
        b=IpNC0CkQ67LpilMvPxhag1CSawgSj9v/47D6by18WWvGwyXkGx4SVy1hD9kO2kPU9I
         0Eifoq+s5XThiX2qD1FLqga8Uh9F7ScOEFhtlrGuki36hiicE4kN4wVUvRn8bwy99dgD
         AXqfi1WG+Hn6z3E88Wbbo+fImALMsnipycnLFZHDrb76KMg8XiYWsw0/NfPGWYdswf02
         KdR6DS4CeoqVUQT7526kvPgTh8MNXTyoxNmjU0/6iPA47OCLpBd1fd9VMuFTm9CEM2wp
         YpfVtjfaHEZD0hTEZZ80e+aiRJv9uTr+QtRbNIOWiOsPBwXfD7ZKDnbiHbF1rY6SQ6dT
         nLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695089; x=1782299889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ua5oAufZEffqM5l46feS+w0Dh95aYTaQPQ9PFyogonw=;
        b=Ru5IecZUN8tXn7e25O8eOWqSWcG3wlTdvwg3mOjMr80MROSpffpqs4K8mEryB+Dzcf
         oZaI0wd1Qr68vSHjr8zYIt7Y/CSIv2eLdPrB49/Y9kqcDBQQd8sfUU78g+CLzXc+y6iF
         bIf7Ayi/OQCeNsZ0Q3Y/I/9WYIY1mUdh3Sj2xHScxDpgbeaqZZEx69f7t1Yd7wb62SWH
         VpYJKYP1Ef9W8igw+3Ptgri2iG33Yopx/ohhLVLAl+fZtaF7CQU8j935414+zJKC0mwA
         8Li6fh9TZX5i9fAmxzVTPjFluF/8ipWasTHJSJTLfw61IRvwfjr73AJajGsbCgKt8QS5
         y5Fg==
X-Gm-Message-State: AOJu0YybRcNnkEqDYLG6SG4T8sUGUNdu1XiuBh3O0KtNWL5mHieZjS1N
	aYGU1vt0SzHw2HCG6vNdyKCityeUYw8zkfDsOHjtiBrFGICU5Le40/KrwK6DkQ==
X-Gm-Gg: Acq92OFfjoLCdpdZh5tF7C6UbE7/2OsKTquqHrlVJ+1/rV87HmLR6lh3+I0ne0tXANx
	fT+7kRWAgchO2trQxDPl3+2DkuIN6SsCyRjdA1pvJUMSkCVYnlp9nLjYp9VF6X8vvHToyZYDvwJ
	+M4sBSXLvrTP4spS08h0IQb1U+Z6IO+Y6sdY5ZzSsXbh6DIEL9O0BwemnTZ7P9osAxiIJ+vA7Dn
	1bHZb3p4CEaof+coHUcTIBqGeMfVFiZlwIc0qNBdRnUrm+jgdWwQ5BoPFc3bUYaT6qj7ubNRn6R
	nok6uH0NnpG4KgGYV97vmTxgXCaDGm29juflJpIk3y1MMl/5DZN+h5GqQtP9JHwdr39/6xnh7zg
	FCWyO78pKP9HwyWvqzmvQY6qUdU7MI7ECnRduT944CGL4rUHcz2I2znjFkw/oKt7gORyOE2VtkB
	NvFEJLWXhMFwz+nbd+Th4HHH5H7ko8Ttcbv7upfJdXA5TYn1fmCgMqueTmiQ==
X-Received: by 2002:a05:600c:a319:b0:490:e170:b80b with SMTP id 5b1f17b1804b1-492333debc8mr52137195e9.32.1781695088580;
        Wed, 17 Jun 2026 04:18:08 -0700 (PDT)
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
Subject: [PATCH v3 08/23] xen/riscv: implement make_timer_node()
Date: Wed, 17 Jun 2026 13:17:36 +0200
Message-ID: <85c87a6e2a8116a8fa8a9a0ea03c8084d95728f6.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781695089-4866B3FF-7533A809/10/73395122804
X-purgate-type: spam
X-purgate-size: 1616
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
X-Rspamd-Queue-Id: 30AB6698EFB

Generally, in DT for RISC-V there is a document which describes a timer
node (riscv,timer.yaml or sifive,clint.yaml), but the Linux timer driver
is declared with TIMER_OF_DECLARE(riscv_timer, "riscv", ...).
It matches the CPU node (compatible "riscv"), not the timer node itself.
It then calls of_find_compatible_node(NULL, NULL, "riscv,timer") only to
read the optional riscv,timer-cannot-wake-cpu property.

Since Xen does not care about that property for now, make_timer_node() is
implemented to return 0, as no timer node needs to be created for RISC-V
guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
 - Update the commit message.
---
---
 xen/arch/riscv/domain-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index c1cbc4386312..4c21ef37a6e1 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,6 +3,7 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/fdt-kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
@@ -154,3 +155,10 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 
     return fdt_end_node(fdt);
 }
+
+int __init make_timer_node(const struct kernel_info *kinfo)
+{
+    /* There is no need for timer node for RISC-V. */
+
+    return 0;
+}
-- 
2.54.0


