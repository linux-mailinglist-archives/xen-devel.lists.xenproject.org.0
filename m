Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OwkKkGMF2o5IwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4C5EB3BA
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320864.1587975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObd-0007MC-Dt; Thu, 28 May 2026 00:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320864.1587975; Thu, 28 May 2026 00:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObd-0007KF-8f; Thu, 28 May 2026 00:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1320864;
 Thu, 28 May 2026 00:28:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSObb-0007Hk-Hu
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSOba-000CGb-UG
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:28:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178bd3-2eae-0a2a0a5409dd-0a2a45068b06-16
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:10 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c1a-7371-0a2a45060019-d155d036d155-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:10 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6886be3d39bso9749586a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:28:10 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm655205266b.40.2026.05.27.17.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 17:28:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779928090; x=1780532890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg8AqMmDF3yKBovZvD64poEMRLvOHDqQeZLyKNm919c=;
        b=pVIZ6yWmUuxFV+PnDoNVq32g0EshANmCGlQcwcmeXIi8HsadwDFH/IWmVY6w8TBKUR
         TERLhTItBXCUjwtua0ZqFaO6mtuo5fFBtfmGtmMctgGX+6ayo7Ai1gwk5HEcIR44eb5i
         60AKXq+WGCaOjgxIgLRI/ywSHs6hzjQtuQ0P/aU2LcEMWL6Cfx1n2x0UvdYfaORmsmWN
         SRnJJoP1nne62LlzTf8khZcRrf4M/K9e1pkKnzu75IMtIss7RgRGo0ahJ0q3sSi6ULR6
         AIQG+Xt+qwjOC0YOg5+JjDApenccfPicJddRqt9R01SF7yVM0BGBvNCvIPZOSEkNId6h
         fM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779928090; x=1780532890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yg8AqMmDF3yKBovZvD64poEMRLvOHDqQeZLyKNm919c=;
        b=sw6TmDGJce2pXlS+lJY2R32bKw9qHZgkXpFP/H8G/NeLAP8m8QLXj24IPNTuGkVjpx
         l7KVkbnzvQzAEfEAyjZSnRpUX+yZZf+NJLn0dmLZVh+XNIZKaYI+hUHsJp0e7bUIGOfa
         poVTpjf9gseipVUHH6eTpye9nlqvVmsiHDcjSvGYtu89v4u5LI1ApwQCwOhOp5nu+jHt
         Am6zTKRWotdboHjO8pW+/V7XQvu1oNtb8wwxj0T+wzQRrDnXY82PS9adv/aQXxtbMo7/
         g2p42xr8myvtTelbkZpFGuiHIXw3naS/WvPgiiClZUu7sU7UPtEGm8nSHUO6R4VtDB/a
         BkJA==
X-Gm-Message-State: AOJu0YzsX/FpUoEL51jPhib5xEV4+1z7c4zcx91oVsbvJVNsxn0yLKrb
	O49bVaaYgHri1XMraQ11RWyoysyVWO8YodTxD8v/nIgvg4VlQvbdHX3VW76q2g==
X-Gm-Gg: Acq92OGbZjIEhEqbYQcvbPps4/aHialt35SZymC0PZawb/vFb7G8nYLP5n+X6yNtnbN
	cDI6es6Vsb9jF6XrDxgi5xzRE4bQh71gSCxGNyU9Fs7L+7YTUlq77l0Y/nop7ylNmHMbGixNZtn
	rTF/Plg4tyyRTON63chu13L55zA8heP9R2rMUwP0p1aEAxK1DxZpTFFvgs6Qmhmhdl/OJIENFE9
	vsUqzv2Wc4kAqlcoub0ipCPd3H7XI10HpvbVJk/TJP/CYXSOsYObBN81ebfa/AlfyGEdAQ9BlZW
	3k/swIZvhNUV/0120Ucp8GpJkDa54+6rVJ3lfkcQKfPjdFSvbuID1sRm9/LUVfCdk45lYKmRYgJ
	eBEso5+iy/jQg1Nd3/vzbC/6Qb6Kz21Eap0PepZVkXjlGoyik90sBLAfZaupeV7piHD4IjsSAo7
	wjuLYu/R+BMJgzTpJ8s1EOdovUZmjT5xhsxm1M
X-Received: by 2002:a17:907:c80c:b0:bc9:d864:2735 with SMTP id a640c23a62f3a-bdd2aada46fmr1592794266b.34.1779928090335;
        Wed, 27 May 2026 17:28:10 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v2 1/4] xen/arm: gic: defer host LPI allocation until after ITS init
Date: Thu, 28 May 2026 03:25:49 +0300
Message-ID: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779922874.git.mykola_kvach@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1779928090-8C67DD75-5CF5C166/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 10A4C5EB3BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

gicv3_lpi_init_host_lpis() allocates host LPI state, including the
host LPI lookup table, CPU notifier state and the boot CPU pending table.
Those allocations use gicv3_its_get_memflags().

ITS workarounds are discovered from gicv3_its_init(), so allocating host
LPI state from gicv3_dist_init() can happen before the memory restrictions
required by the ITS are known. On affected systems this can leave
Redistributor LPI state allocated and programmed with the default memory
policy.

Move host LPI initialization after gicv3_its_init(), and only run it when
a host ITS was found. The old call ignored the return value. Now that the
call is made from gicv3_init(), check it and panic on failure because
Redistributor LPI initialization relies on that state being available.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Replace the v1 ITS pre-initialization hook with the less invasive
  approach suggested during review: move the existing host LPI
  initialization after gicv3_its_init().
- Check gicv3_lpi_init_host_lpis() and panic on failure, matching the fatal
  nature of host LPI setup once ITS initialization succeeded.
---
 xen/arch/arm/gic-v3.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 17ff85ef5d..acdac22953 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -764,9 +764,6 @@ static void __init gicv3_dist_init(void)
     type = readl_relaxed(GICD + GICD_TYPER);
     nr_lines = 32 * ((type & GICD_TYPE_LINES) + 1);
 
-    if ( type & GICD_TYPE_LPIS )
-        gicv3_lpi_init_host_lpis(GICD_TYPE_ID_BITS(type));
-
     /* Only 1020 interrupts are supported */
     nr_lines = min(1020U, nr_lines);
     gicv3_info.nr_lines = nr_lines;
@@ -1990,6 +1987,17 @@ static int __init gicv3_init(void)
         res = gicv3_its_init();
         if ( res )
             panic("GICv3: ITS: initialization failed: %d\n", res);
+
+        /*
+         * Host LPI allocation uses ITS-derived memory attributes, so defer it
+         * until after gicv3_its_init() has discovered ITS workarounds.
+         */
+        if ( gicv3_its_host_has_its() )
+        {
+            res = gicv3_lpi_init_host_lpis(intid_bits);
+            if ( res )
+                panic("GICv3: LPI initialization failed: %d\n", res);
+        }
     }
 
     res = gicv3_cpu_init();
-- 
2.43.0


