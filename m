Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCLxCfuWC2rXJgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:47:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D60B574C84
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 00:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312281.1582429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6jt-00058p-Kr; Mon, 18 May 2026 22:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312281.1582429; Mon, 18 May 2026 22:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP6jt-00056z-Gu; Mon, 18 May 2026 22:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1312281;
 Mon, 18 May 2026 22:47:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edgar.iglesias@gmail.com>) id 1wP6js-00056m-H4
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 22:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP6jr-004ZjV-TO
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:47:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edgar.iglesias@gmail.com>)
 id 6a0b969b-e002-0a2a0a5209dd-0a2a4503a918-40
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:47:07 +0200
Received: from [209.85.167.45] (helo=mail-lf1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <edgar.iglesias@gmail.com>)
 id 6a0b96eb-672d-0a2a45030019-d155a72dd8e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:47:07 +0200
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5a8fbe18b1dso4771316e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:47:07 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395882c41c1sm14934341fa.12.2026.05.18.15.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 15:47:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779144427; x=1779749227; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj9Q26Xnp9vgzseXLrlgwBsXJj51q6a2TH2ZhhhDnDU=;
        b=MYk0ymf8NLJITWwGuDHhYlIvtikKwbOhBTDvTHyLfR1P0H1un/bxgTOY5yhGixhdBd
         RWC+Na9BNPUjA1ATrTyzwqWq3GzeRho/rYPSIcDwupJ6ttnn52/fOcbhSENa/lr6LIyR
         nUMqLHOdULNZCjLziUkKw2zlrdKwvaIftkL6bliaNoHZCmtPW6gwVAwbVhpdluCE84+T
         hhpe7/oDOdHrOvn4rGM7Y9jdGZ94HEx1OEEEJW7zbnfSU4YkxHNnCvitLicUWEw8F/ud
         Z0LsiEKbTbKSYW6J63E3M02OUhN9Zbu79reMmrrPQZaLiaLw7KcsFG7Z5Wp9nPwDTlKo
         oUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144427; x=1779749227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gj9Q26Xnp9vgzseXLrlgwBsXJj51q6a2TH2ZhhhDnDU=;
        b=iC8l+KbxuFcMqD5Cji3xYdYM0yk2oUNojimRIlovdJYrVKzOiQ9IQ5IAWiitAIl7bq
         1lR3irqJNxD7Bv8g9uM1A4JdcJYP5YU6WIoTRjvECVTd4ERCkFB4KZqWcY4nFCedqKL8
         Lh5EFLKFd3AtbDsrqIL3Twbj2BZJNvtVTUcIJJ+FXOZezwUFrJXR5ilGcVtAsGWmHq03
         PdspdyNA+vQK7azJN3+e5+mHr0DrzI8ps61xvilGAq1QLbDXUYD6aRU5joBY/RAMV6b9
         qGw9dzxwvUnzulVIP6kU8AvCJ0taoWbxeVktgRVYcLR/jgkDqEoNgzuMgM+r3f49iRlo
         EFYQ==
X-Gm-Message-State: AOJu0YzeYnXV0a5aEqndnDgzRV/HIt4jGc8RBeCLiNLuOQnRmvhcebg+
	z5BKiHeZxafYQJ02a4emP8WfiiMwAHKHxXB2O8ZVMXzj+7ho+vnsA/wDwhZIHQ==
X-Gm-Gg: Acq92OEh/AYPlq0zjaQs5yOi8IA2VILh5ooDsF7bB+Vi5LHYssFsE1rF+moMnq8C8Xy
	i1D9rW/5FXMBe7LGel3neuq7qstxzB4Ly5JfFxLIXqTOmBQKXdSYLthipL2ui06vWGaXJ2oS0o1
	235xEXrtnJyLfEpHn/4FemuY7cdGdPuYgN/7+F0hNHE2JOKwJL/zvyvFeVM8AEXyfsJYUbIMxEs
	EVuFgyq3Q5KN8bblBPInYpLu20FJe9XR+p+Jq8gEDc7kDggPXDKV9/UjDmuDBx3ipSaTBeMHqk/
	U7lUl8mfir6K5LpLol6+EHQ2uC4xbzcLwHaPKJaSx+anIK7b4v/+JtshdY885iPzalWU9qW6Y/x
	Fr8ZJkZ0Jz60k/NgdkF3LT50yoI9+pP8Zo5LI+wYU47IZ3LSt+fXTyu4hsGbMLhxarPKthgHHs4
	Iug9/xML6LYBIgyZ3sn1o2CscCLGhc/eHwrkrXIq94xnv6ITZ4Du9Gb4VILIA=
X-Received: by 2002:a05:6512:3a85:b0:5a8:f984:142c with SMTP id 2adb3069b0e04-5aa0e742944mr4597322e87.12.1779144426918;
        Mon, 18 May 2026 15:47:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 1/1] xen/arm: gic-v3: Fix wake-up loop in gicv3_enable_redist
Date: Tue, 19 May 2026 00:46:52 +0200
Message-ID: <20260518224652.422864-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518224652.422864-1-edgar.iglesias@gmail.com>
References: <20260518224652.422864-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779144427-3B56F938-E1191340/0/0
X-purgate-type: clean
X-purgate-size: 849
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgariglesias@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1D60B574C84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

timeout starts as false and is only set on the timeout break, so the
loop always exits after one iteration and a stuck redistributor is
silently treated as woken. Use while ( 1 ) to match the sibling
gicv3_do_wait_for_rwp().

Fixes: bc183a0235 ("xen/arm: Add support for GIC v3")
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 7f365cdbe9..f03217282e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -828,7 +828,7 @@ static int gicv3_enable_redist(void)
         }
         cpu_relax();
         udelay(1);
-    } while ( timeout );
+    } while ( 1 );
 
     if ( timeout )
     {
-- 
2.43.0


