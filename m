Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C030A439CC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895564.1304246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOk-0000IK-Ot; Tue, 25 Feb 2025 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895564.1304246; Tue, 25 Feb 2025 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmrOk-0000Et-LO; Tue, 25 Feb 2025 09:38:42 +0000
Received: by outflank-mailman (input) for mailman id 895564;
 Tue, 25 Feb 2025 09:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3GQ=VQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tmrOi-0007uj-RN
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:38:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 461b1daa-f35c-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:38:31 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 628394EEF417;
 Tue, 25 Feb 2025 10:38:30 +0100 (CET)
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
X-Inumbo-ID: 461b1daa-f35c-11ef-9897-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740476310;
	b=UgHK9SUHjxkog9+ljIoXBvg075L4hczi7boVL00JrO2Rcnz+8wXYhtusuJVxhS9EZqqU
	 AnTagonxtRM9w9KVv9+SMVQdiyBrYZTndUgcof36r0gALeQJwstnYR4i+tmJtZOkQNuVv
	 UmyZsyOJJD9ozeqBNcmRprs/pXMWlAtr2lkcK4NpDzyTrIJzVp5EjE3iTLnFY3iHNjQ+o
	 Y2ExdOZ3h8Ca87NtAiylOaOLfUNBchb/PxivkyTYsVDzTeguH6/K0s16ZKfrRUdOFL5sY
	 Lmx+xPeikSiGJ+bDVYgjLLuFoxgyDU1XCvMrY1eoGdhvLZVoIhmPiZk0ZaPaMlK+sAlkD
	 AXcIQaPP4iGtxOb5ORBjkylesy0Ht6Ra/lU/X6WgLz7sykztZgrA1cGkgLNPGLQkVUgk6
	 VnMS747js7s8jllWH4aIJFadzwFgSOuDwJAf9K0ezBfjQHz49tsPFDQKkj0D8HNZaFNMw
	 BMLAUVDl5z0S48KZtvw/9ZxwjMMb2j8ufUY6coLI9ilgw80HS2YJwpWRO+AXD6A13WYQS
	 9f0nkKPx68/JwqG9AIyklx8KbbF+nJmB2qasijowXBOmqMpjaDlXeq8uTmmBBEBKRx4TU
	 tLk9l/aMWuPdH4Fpa1HrXk5CPjEhKHuY9BnPDg1yjVOGqcCWrHrvVQ5ig2VSbhM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740476310;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NaFM1ueXPHGKYX1U4ZSt2Db8MZfE259Ddc2DPa/4Sw4=;
	b=zT6IoJmiGL0WofYBpGe5gIVyHZBRR+ukecXu6olx1MlwOlc2f8MTTcHoUHoj3idQSPv+
	 TWOE/QAncA5kRKNq3NhYGMNuPhQg3dKRzmhrx6o53Kvgak58zg9blZrkGpeGH1CuY1i/H
	 BkCAipNolktmKYnjY/O8mc5ylBAqALprWAQcADUYDRYQIBEG78ejpOWmyZiBslMNsQOoO
	 1RkVlzo6uydXMRTjkFR0BmplCHMkQDphT8JexcE4vUV5mlBhWaH0sbai0leZFVom5MXWo
	 /dTYPgCl5lgHFUPxUQUcTvMFdrWp+I2oqOIgkF+ZoGiAVfXJgp6pJEkMPCdUWz0bAHJ/Y
	 tzn/zs/n8SgXcqnqZ1pNCs8KKr7KLXLsxxhhKL7OFzLTxP1jvhTFwkjKYOmw6ESVaNnuv
	 rO16qztLLlxG2Nfkj3yarEdoaKEAQvjptHEbgpbCqaqvqwfMi4t3U4H1+yuQ3yUmN289u
	 zQuDd7e3XcKLGAmSIm3x2owqnOoYVKd1TABZrz0Z899KL01N6Jq1TATPP0AbVfHq7P3eR
	 dO4FzLqA5FHY5OkOr1SUdqlpejjv3Uhov//Hja+idu+Y+OHp6oifROxfmBvxAJuCoqJEx
	 nIGZHyYUoN54VnJ/FLtLLClEUmAE2UjkFUkNsPAOO6arCe8uBhPzPIHH9q8W9jU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740476310; bh=ng7o1c8BcckGiZwxtkPfaKrDbbxTxj9uS+gE48lZqZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uDUd5xGo2rf79k0eD8Al7YpNvEwm0J07t6Ub2YN1uYcCpG5R/91uhX2qNbtgK7ahN
	 s2f/edDdmRuh1QMgnqMAQJ9GUsyNIB8uLEqVjMHa0Hx11h13RVmB2ArmUiCn2QR1f6
	 vfQ298kHES2ptVXpR5XHdobzHEdyPgnlU1fMiW3WvRFhl7JuHu1dLwmdQ7++Gg1pBd
	 LBpv/88OPStjgfGkgzgk53pZwL4K3b0d9w3GS0D1uhTJvEW/gvn8KdLbn9HnZj3lFX
	 uNtSgw/QTqjb8WCfmtb4cy729Y1+sOK8hdY0nRh5baumDl3tDxoiUQz1qpcJNVYXg0
	 /5fooF9chDRgw==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 1/3] xen/arm: platform: address violation of MISRA C Rule 7.2
Date: Tue, 25 Feb 2025 10:38:22 +0100
Message-ID: <fac07fdeb80489697f3afa2d2ecc75fb4209ec23.1740476096.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740476096.git.nicola.vetrini@bugseng.com>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 7.2 states: "A u or U suffix shall be applied to all integer
constants that are represented in an unsigned type".

Some PM_* constants are unsigned quantities, despite some
of them being representable in a signed type, so a 'U' suffix
should be present.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This fix is needed in order to keep the rule clean when the
Xen configuration under static analysis is changed later in patch 3
of this series.

Only PM_RSTC_WRCFG_CLR is strictly needed to conform to the rule,
but the other constants have a 'U' added for consistency. PM_RSTC
and PM_WDOG are used as offsets, so in principle they can be negative,
therefore they are left as is.
---
 xen/arch/arm/platforms/brcm-raspberry-pi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
index 407ec07f63b8..d49460329cc8 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -47,11 +47,11 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
 };
 
 
-#define PM_PASSWORD                 0x5a000000
+#define PM_PASSWORD                 0x5a000000U
 #define PM_RSTC                     0x1c
 #define PM_WDOG                     0x24
-#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
-#define PM_RSTC_WRCFG_CLR           0xffffffcf
+#define PM_RSTC_WRCFG_FULL_RESET    0x00000020U
+#define PM_RSTC_WRCFG_CLR           0xffffffcfU
 
 static void __iomem *rpi4_map_watchdog(void)
 {
-- 
2.43.0


