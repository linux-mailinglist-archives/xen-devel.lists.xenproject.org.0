Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5dMgFQqfPmoVJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7C6CEA40
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bfzfneAB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346279.1604793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8le-0002Bu-Cd; Fri, 26 Jun 2026 15:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346279.1604793; Fri, 26 Jun 2026 15:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8le-00026a-88; Fri, 26 Jun 2026 15:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1346279;
 Fri, 26 Jun 2026 15:46:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lc-0001nt-Lm
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lc-00D1eP-2U
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ed4-5cb7-0a2a0a5109dd-0a2a4505c00c-36
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:56 +0200
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eef-3cb2-0a2a45050019-d155a733e845-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:56 +0200
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ad5e719157so1023729e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:55 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488815; x=1783093615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB2c1Qc5sQgY4mzQM5bvoIPB8oNENMm9Ls9IP71fSNs=;
        b=bfzfneABRezBGUbQkRz7USViUt6+d0tlpPpsJVhMSlma06lUiXLzYgDPq9aoE46d9g
         V70hm2k2oUlQMQGQLmO/js0yNCOWolQfQRBIbfRYSG9ayXEQGzXVvE5KVOf9prT4rDc8
         zuQhsxS9saizxqXwGXy4Ax3cZRbLiw8GUCNS0FZpQGw4oBuv7daOSnd//yfMQSXrMRBn
         XpG+pgZ0tUvkQ80Qi9BBDU2iFJxZnvF7QbN9JYsAsLjTBHr/3nBx4QmX0WVw5NCqTeuy
         j0ej81QfFIgutOQ/apE00B+Ux13DzJXVEDeB+rLIIU49vc9gfPhlnOl4mKJdOOcz9eDy
         1Azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488815; x=1783093615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qB2c1Qc5sQgY4mzQM5bvoIPB8oNENMm9Ls9IP71fSNs=;
        b=lUdDoljaeHswf9LfxuhdCLzZEDs0RC4exwQsbNXoL0ZIZ40xo/al1FcHJnrojROwN0
         w6CmBJhEdcvT1oUtcswbjmlkXpDFDG/0M9a6rBwYBbqbY3y0Vp/RSfweJbV8bNK+UNXS
         EYmZUnSwe+lW+jg6nMuBSVQFmKzgjFOAZapVYtcqw239KZ0Ze4j/k7Yfu4tHYLh3sPb+
         GklieQB1axrde15HbQtvWw0BVvo5PrjPH64d2BxKbeFzlI3WHEx2UtpyvrKsAeiSptq2
         0K/D2rfUdyJ4qYaDEUwsXJIyEGkswMfJuQMxjL9R6GB3TvCEtd09Qu0s4PmxpwTKN0ni
         V3iA==
X-Gm-Message-State: AOJu0YxcPXBhlUJOmz7CVBkrlncLcsMWiSz4iX2WoX7HCc64td4A1wkZ
	P8QkHIWBDT3ITHqjg1IWsdiEucaaR9iBR/WTvXa0C+OKXFLBr/3OKufFMu8cYw==
X-Gm-Gg: AfdE7ckywEnERiQl7a+38OCpT+VnT04byWmtHK57aI432ymdHwLVP6DlKVdZTIRsK4b
	BW5HVkr3lxC7NbHas6IvJi//SEtM9BhZXMdr5TQG2mOMJ7uYq2tKPfzoiI35ImVvBoTGKENWLxA
	mn3JAhfkyDHcLaGAj9M9qWWIGVZF/QY1jhqeawAFEYvq2SohWQON/YFDfpTi3ljYgZCGJL6oBOg
	LvEffpRKriaM9WmKz4Qs6zCOcCTYjV1cUFplPH0plYV+68cdm65mRKNaCSPpcQBgedgjPqsjWRH
	iYtz1fgC5Ub9tNd+CIDFzDVXBjz30ZZURQHcDgDnKKkoKg8rCzAEWAW6j8BZrJyx2SnG5jQNjKO
	57KxYlUAGxYiC3SqzbT5BQDDQmysB+4VwrkzgbmjXrmVWEo6OujrngSJr205S+F3qxiqHl60lUy
	F+GCziVpqJk1+lm0FFw+eXiKky8mpcKzCSYBeUSYQpxNm8zn2QfqZyNgd/fQ==
X-Received: by 2002:a05:6512:3e13:b0:5ae:9dcd:d071 with SMTP id 2adb3069b0e04-5aea1f4b410mr2461758e87.25.1782488815091;
        Fri, 26 Jun 2026 08:46:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 10/25] xen/riscv: implement make_timer_node()
Date: Fri, 26 Jun 2026 17:46:19 +0200
Message-ID: <02032a8d2fc06025ee8863617be71f3873ca1e26.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782488816-1771B2B8-5D8B6865/10/73395122804
X-purgate-type: spam
X-purgate-size: 1618
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: 02F7C6CEA40

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
Changes in v3-4:
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
index 198a420f55a7..54ecd301c49c 100644
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


