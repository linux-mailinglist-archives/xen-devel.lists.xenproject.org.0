Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92DA36711
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889051.1298292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZP-0008Ec-Md; Fri, 14 Feb 2025 20:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889051.1298292; Fri, 14 Feb 2025 20:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZP-0008Ct-JB; Fri, 14 Feb 2025 20:45:55 +0000
Received: by outflank-mailman (input) for mailman id 889051;
 Fri, 14 Feb 2025 20:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKzd=VF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tj2ZN-0007yt-NU
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:45:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae1ec817-eb14-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 21:45:52 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 99A024EF5132;
 Fri, 14 Feb 2025 21:45:50 +0100 (CET)
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
X-Inumbo-ID: ae1ec817-eb14-11ef-9aa4-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739565952;
	b=xPwuqNYGQ0eAGFGRyfwh4anRtFtqfBrMOU7h5kXDlLzVlXBny3XABWt3cSG9B+G9wsA/
	 PEfQ1l22a8f1gGqtes44KEsui9Dl9SBb98SEghuxT6PpbVbdZGZ+0J2ixHZqNx9IyfNE1
	 acxg5z+Flu7X5ISXS8NCKG9GCbwS9O0PzK7NOcF0UXncf7bzHIU+X9Byxs2D5yTaOa39F
	 tnReLasA2dMIXUzxHzTI+8mXtf4h9Cqg36P6AgUNhlA+ToF/9rEuyZ+JWe48TS0/gNq7K
	 4cZVfHQlQz/1JrgR+j3cfOL8AcvGecL/B21ttz4wWM/wMNOBLMorjMl4XhO8qpL+svi1o
	 0JA7LUmXHaTVbn5uyl7+Z5dR1OF2uu1tGRutVf71cji7qjXvnQeL65Ygk2d1A3z4Soky7
	 FATO9HwF2tLpEANZC7Aksh54z4EC9Nok3QRn9tLIJD4VvE5YbZ5jqOYjmesuGxkRgl2RD
	 m6OYbJemT7Az2G+jlghogq+0Ikd+X8Qw0Ocs0hiaoZlxyoR66qRXrogjyiBTwBm8/M0yy
	 pQ7fcd+NkbF58XZyHHxvfODuGqP+bb1I2W/Z50Jv9VZtXhG9WM+0SvKy1wPgQexxCXtI0
	 k0QVGS5mtQ9DgKDM76N+a1t36YXr8wBf66COQ31VwwbloLm6heVI//8MKFR2MyM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739565952;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ianbSJP6MU89q0CSVCoMWfu1NYhsn60Q7ly6lHvCE5w=;
	b=LSZJ78zPVUeyrJX1daXA08Y2o23D4PEBao0W/FAGuWqLXGMN2Sj7qVqDCW/rnkSm3dfy
	 QcL3ftJBHbwBl9WTqfeuZQ2TcZBpafKpRgtWkgIhsj3NqHVujbk8FGd1X22BjTz4COqfE
	 lf7IGmFQnN83tRVdwRunlGo/avheqifL2vKZ41w/X3jaA9CHW0NOYRUKQ/mZUIy0y2HGz
	 M93Gpfg2nafSKOLHY0tEm/ub2uwY+dWFh9+DcghaibWzMb80rHYjTYJzgIf/KoCyIYaVR
	 MkHwS/MEv2HJ+AneWfzspYUWWLFKFVSQFJAo5O/cWZ4eem2eDmIRyg8FwygvwscCysF9H
	 zAE2+XkUWYA9S0IrQ4bcGfOmrc09r6o3zypuVTEvaCFUtNvaLCd7PmQ50fzPwBk2ha8Ci
	 fVUFeB6FKvkfrlt3iOqL6pDs0KEm10t5pO7MsgDUadhaclZOT5kQNppamNBvWyWczPoIw
	 HOHEuMGjxMXrDoANjvqglHTE4vPEfjq7JzL6nmE9GIQxElivSmdsUCEnI0D48bY6PbnMj
	 u8XhunfoJjJK4YYFOQeZ+d0BEGtNYlFBVmUUyD3IzhkGMNmIv0TW+r4PWUx/uCMCUH0Zw
	 5BPOQ3QqJOnKAxz9PtBxpvXXYlMmDH89YhprOxJsd7vMrYu0UR7lDvjx1fNTdr4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739565952; bh=Yt2wbyQXx3BTPDFqXdXdqKA0/5JzMgkgfEVNWnh+UN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FkoA6NkZ3d5/ILa9gZJUr2AoSyg3D1O50kTpjdAJ+FOfXBI0ynxXmeQ9MyZR9k+v7
	 NTlNEqJiFyFWQZYRGZkps1x9zD35TCocEEz7KAwZbsagFsOPOs5S5M3YvdMlJ/DTRj
	 7/lfPZPxyb/dKX1GKKZcn9wdJIeAYzJFUx8lKtk5sl62P4/IL2tHdedw2cDpT6t7oK
	 ksKMM1zOJ+JP2XtYV0PRz+l/uocp0L0WIToV7NIlviuy6GUH3wuX17i55BfP6c5C7J
	 dU9MM7+p+iTwM3UH/CZYTuFc+v5qwHLv88PXZ86EN8uC593wfZIwzXgw7SZqTDRzt+
	 fCoTomOuN3QyA==
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
Subject: [XEN PATCH 1/3] xen/arm: platform: address violation of MISRA C Rule 7.2
Date: Fri, 14 Feb 2025 21:45:21 +0100
Message-ID: <33f3ba81af293a92fb27d55b42e620b807f1a5b3.1739564781.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739564781.git.nicola.vetrini@bugseng.com>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 7.2 states: "A u or U suffix shall be applied to all integer
constants that are represented in an unsigned type".

Some PM_* constants are unsigned quantities, despite some
of them being representable in a signed type, so a 'U' suffix
should be present.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
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


