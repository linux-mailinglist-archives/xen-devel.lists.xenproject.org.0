Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id towDGwmfPmoSJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31E6CEA31
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h5DM2rO0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346271.1604739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lX-0000iB-Am; Fri, 26 Jun 2026 15:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346271.1604739; Fri, 26 Jun 2026 15:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lX-0000ft-6m; Fri, 26 Jun 2026 15:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1346271;
 Fri, 26 Jun 2026 15:46:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lV-0000Ux-H6
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lU-00Ad3u-Qv
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ebb-e002-0a2a0a5209dd-0a2a4508984a-42
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:48 +0200
Received: from [209.85.208.175] (helo=mail-lj1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee8-edec-0a2a45080019-d155d0afb018-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:48 +0200
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-39979f72d0cso6178671fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:48 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488808; x=1783093608; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/JdhyxbZhpV2hEcQ308jQnWzAFQCSs6VvGpVq3IvD0=;
        b=h5DM2rO0ENQXZg12l0R9PLcLh8Pc0QuOOSdX61FQ8GvHPikgJK/rDNkgQ3q0tVCXK2
         1FR3ITl6CwSOrSCpMHL23RdGIwDBjyXrFnFYeJzeby3tSwLTyoXPnJonv9dkB4qxH76s
         i4c0yJhOjJIp/B7/eikbpkWHuh2QNozaQdRSXDfIBPnygCU79HKDEz5ecIMIkURIhez2
         YiXMkja+MBixiH7uJZPmN5cNegr/+raTOkM6KhXXFdE4Yo5b+3h6gK1ATixNYhpmSNlp
         JUcuvAAk6BWeEJSUi654YD1Cufvmi7+zmzawvrwbQ0LW6XQs0oVqTHimy51bG6qKD6ne
         6Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488808; x=1783093608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/JdhyxbZhpV2hEcQ308jQnWzAFQCSs6VvGpVq3IvD0=;
        b=GGjM672dFYoFJmxF7W77VTHZVSUjgD13JrtoIr6drHw+xBvi85pawLKTGT740WlV1g
         6hxBh86LuUcgTgtXJwa/LbU9g/8aGVMpox0h2m3x5IyXvKvBjRyaf+bgd3f7BFMOKwUF
         k/ydUKL4ZglEr2jlKda6rhBsiSzWVnSwa3357VPSMhsDE7Wr+6bqG8RNqSfV4EsKXv1n
         IWWRSn5yxlb+6SINEV/DnLBetXOVzKSuvOp9iQT0Fc0yvMADCMYXQ0DYyulhSem+6Wv+
         Q14EXK50tnyWr+zZ/3gVBe5o1JqnOVtpz3VY/W0Cozh4mGAGuNgZ5EvGplA95CsTMcMP
         O7Fw==
X-Gm-Message-State: AOJu0YxiDcM5V8VC9Vj491XLSHCbugz3TegvouYzAAq1A95ZYXRkwWS6
	CLV3caej4//FHEvxXhzkjrSlxpkiHKexJZH1mFjQi7ooCr0clKF9qUdLe4ivng==
X-Gm-Gg: AfdE7cncKnWbAUMmBnB65EVKbyUsFAWMSvEzDk83H9wt2YA813zWJK5bMeiXTUX0qso
	au7k4tbzDnQaQGDPNtoowZZnvk9+RGQ0LJghTi8tiweYlgvGarokTNfVzrUlLuK1/A4sI61xbhw
	7iY+EFfFNv9b6sPYOUDlY4Ymu5p5lG4rVQj1gdaLtZwSZ3nMLyfUfe6lyq3oXlwbrVJUjYrgDev
	sLFhYL9k0yEp2FKGSQYHeNULblv2+3etWXug9BWZAmMmo5NrOHIUNlPE3MlaoWAEINGzBOjI336
	SBr3pgndK/0s8rWHAOCblMqef18fIMIgDowYEt6TWekBPxe9Rp4/2O0WGkfDFZfcDGYv5IH4fkB
	QpAaKfCpsbC79aHx7vTtN3jWl1otiXUimXhIv4FZi9eGrSEKCdHKdlGf65bh1CoZ86/j1dRB8E+
	Fw3IC7XN33CjUUzJprxL3Pr0RqF4AcKZ3ANRN3JpiKGcRJ4ris6/A/gFVoAq7+FyYW9hvx
X-Received: by 2002:a05:6512:2285:b0:5aa:6d11:187c with SMTP id 2adb3069b0e04-5aea9450128mr305171e87.8.1782488808000;
        Fri, 26 Jun 2026 08:46:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 04/25] xen/Kconfig: introduce HAS_STATIC_MEMORY
Date: Fri, 26 Jun 2026 17:46:13 +0200
Message-ID: <ae555155a60327e3aebb70fcaeade33349910a69.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782488808-A0D2B3FC-71C9598F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1815
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
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 1C31E6CEA31

Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
disabled on a per-architecture basis. ARM selects the new flag; RISC-V
does not, so CONFIG_STATIC_MEMORY is unavailable on RISC-V and
randconfig builds no longer require an explicit STATIC_MEMORY=n override
to avoid a compilation error.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Reword the commit message to explain that HAS_STATIC_MEMORY allows
   STATIC_MEMORY to be {en,dis}abled per-arch, dropping the reference to
   guest_physmap_add_pages().
 - Split the STATIC_MEMORY dependency into two separate "depends on"
   lines.
---
Changes in v3:
 - New patch.
---
---
 xen/arch/arm/Kconfig | 1 +
 xen/common/Kconfig   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 683ab7d25a1e..d748404e82da 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -22,6 +22,7 @@ config ARM
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
+	select HAS_STATIC_MEMORY
 	select HAS_UBSAN
 
 config ARCH_DEFCONFIG
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 8b48d84c79e8..5b289e444fa5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_SHARED_INFO
 	bool
 
+config HAS_STATIC_MEMORY
+	bool
+
 config HAS_SOFT_RESET
 	bool
 
@@ -196,6 +199,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_STATIC_MEMORY
 	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Static Allocation refers to system or sub-system(domains) for
-- 
2.54.0


