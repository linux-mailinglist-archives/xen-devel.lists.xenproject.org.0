Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id slnaMa+CMmrc1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B4698F8C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hA9PlVgc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340116.1601258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIH-0007zW-Je; Wed, 17 Jun 2026 11:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340116.1601258; Wed, 17 Jun 2026 11:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIF-0007hM-Nl; Wed, 17 Jun 2026 11:18:51 +0000
Received: by outflank-mailman (input) for mailman id 1340116;
 Wed, 17 Jun 2026 11:18:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHr-00049U-89
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHq-003J0D-FR
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328279-bab6-0a2a0a5309dd-0a2a4504a088-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:26 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328282-1dec-0a2a45040019-d1558031bc18-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:26 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so38395805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:26 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695106; x=1782299906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAKichfwvXiqlJdvvQBNjiMjpG5MCqx/29voflyMUog=;
        b=hA9PlVgck2nFu7OaJPeTnpRkkPvmKjxL2s1G1npZYM9/mmXozPu/31CLB2+rJalhIU
         paQIVaehNqEBWoNT3cp04iIznPQShXWHN4uR3cpym5YnQQunudBnQgnoxt6YmcYeh3MR
         cLFmfHXxhi+8/M/ysE67Yn8puByNjcGaxTPKyu50mu3VN1N2h4ep++OEmwIS40YReEc4
         CH7L2O85IhKplFnS8S5o2sSLrjUX7EBWHqX41Q64oCcItHtRNpb6qu8QhZpUUMoa2Iz5
         fWEqew1/mJhLwQ4bNICrBFyN4xDQnNk7wZFGRSc/YdU7bjCXVgI5MQoUFKq3zXO9DBk4
         sTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695106; x=1782299906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LAKichfwvXiqlJdvvQBNjiMjpG5MCqx/29voflyMUog=;
        b=n8hf5vWYIjMD4dm8VABQ/sHbynLRA1XzaEro/+KZST0eq2jmOH4gHX1BNsav6ZK90V
         95LIPaU0qPnq7InLUZxwhoxNvWzTnny+5RPaHBFTuwLcGjljTFAY7IsrI1ClBrCPU9rc
         Za9YMhacNRwO/1yjJVcXsH4SosIZXpuPy2y0nvxVVRxMmjR9abR4YJMKr2nTRFHDeEW+
         wXde3BHU3epkboUD6UE+PCHvxB3IqXdQFObBHGNCVZ/fV2qTcDKvv+5U11ta+SJm6+4H
         fGJ3IH0jGHTYEMbK5X2GmydHeVT6+MwLNnPd0hz/KiIwo8Ia+vY4S3I5p3GkZw5CwR/V
         Vl7Q==
X-Gm-Message-State: AOJu0YzgMGWnzlrV6SHp1NgaHUwWdJhHJ1sow0einnRxDMWypFc4DP6Z
	AK7QQfS9PRbEDJG5Czx6woSehzMy/k+wQqdIqwYMORKsyyx+J4CJv+GjMnHq9Q==
X-Gm-Gg: Acq92OFhNjptczDFGOxrtem7NZ89Q1s8t9GCI+BYA6LMHpIvtiYFSyxhM3z9/ZZBQ8k
	jXWHyyczRP7R6aHG5N2LWDS6p99GcZW2QyHeadrD7UeD+HyOHaTodAJErdhAzw86LxoBUcJ2VnL
	kvCI8h0ti0YxlsQpVDb11IX0sKD/5mptOXfmzfu2Nr/1HSwwWMAuhgMRoSZQ+ly2m5A+7rLO95d
	iCVRPAyZIHtYprsk5y/Eb1T+/urdppFV83IbLoxBRfCFtKZoNiiviYYYLwBqSHNgTXoJaIxuE8j
	M3fF/zdQ8JDgphht9BlIl0tqwHj3Pje3/juZwLy6uCs8MVv5N6iS0JvP56ZfuB3qGNK1Jjy6HoC
	BC7ROA1Pe06RPbJWc9iyW6QgBWHKgtRt51D25NvVRqTIxHk+vXwJrqru85oYTghU23gy09nagWR
	hCqRnp6OOjkc4BlYggS3c9rAN8Y3Lkf+pwWW47xpU1rWD2bWs4OKpW77oa7w==
X-Received: by 2002:a05:600c:590c:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-49234139cdamr30781995e9.29.1781695105673;
        Wed, 17 Jun 2026 04:18:25 -0700 (PDT)
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
Subject: [PATCH v3 22/23] xen/Kconfig: introduce HAS_STATIC_MEMORY
Date: Wed, 17 Jun 2026 13:17:50 +0200
Message-ID: <22c02e188a0b38806f08b7a87f00f03c14aad742.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781695106-411763FF-9ED0E3E4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1677
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
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 781B4698F8C

Architectures that implement guest_physmap_add_pages() select
HAS_STATIC_MEMORY; STATIC_MEMORY then depends on it.  ARM selects the
new flag; RISC-V does not, so CONFIG_STATIC_MEMORY is unavailable there
and randconfig builds no longer require an explicit STATIC_MEMORY=n
override to avoid a compilation error.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - New patch.
---
---
 xen/arch/arm/Kconfig | 1 +
 xen/common/Kconfig   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

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
index 8b48d84c79e8..6e24f7f4e43b 100644
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
 
@@ -196,7 +199,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
+	depends on HAS_STATIC_MEMORY && DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
-- 
2.54.0


