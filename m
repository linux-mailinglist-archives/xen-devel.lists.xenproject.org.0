Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F448A881D9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950179.1346567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Jq4-0005rb-DW; Mon, 14 Apr 2025 13:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950179.1346567; Mon, 14 Apr 2025 13:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Jq4-0005q9-Av; Mon, 14 Apr 2025 13:27:04 +0000
Received: by outflank-mailman (input) for mailman id 950179;
 Mon, 14 Apr 2025 13:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SLdQ=XA=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1u4Jq3-0005dp-Dd
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:27:03 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25c374d5-1934-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 15:27:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63F9E43D97;
 Mon, 14 Apr 2025 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5AFC4CEE9;
 Mon, 14 Apr 2025 13:26:58 +0000 (UTC)
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
X-Inumbo-ID: 25c374d5-1934-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637220;
	bh=NWePQQGyiJB1lF8JMRapZucVYoCavkai+t/0v9AbqlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+pxZj910uDVMYGVoXgeSt6ylbUY2TEQVHUEb0poqS0RrjNHnstveM/2So0R1d1QF
	 TqEdiAif+GwmH7FAL8v5pWJCYWsXfA+GeDj1Rpj/GlK4p3rBKLx7gOK9Unsl1WCdiC
	 0XESDuSesw3wtUtcBnn6kG/fdZBYAphtr1/eJhPCdHSm9xGGUtoJmGxifrZ3Jvuw0e
	 YA3NUvcqL84xwspG4Wy8faJkSkW8W/E0/lCkKLH62V/r2VzvXHusDoiYsf5Pnwwl5f
	 0JraiCnW+Jd2W/ZtJISR9EanNsAdLGcfN1uQgpgdVAnd2ilMWRgIhWQ9xKEvx3uRHb
	 jDHOzP6SHRvcg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.14 21/34] x86/xen: disable CPU idle and frequency drivers for PVH dom0
Date: Mon, 14 Apr 2025 09:25:57 -0400
Message-Id: <20250414132610.677644-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

[ Upstream commit 64a66e2c3b3113dc78a6124e14825d68ddc2e188 ]

When running as a PVH dom0 the ACPI tables exposed to Linux are (mostly)
the native ones, thus exposing the C and P states, that can lead to
attachment of CPU idle and frequency drivers.  However the entity in
control of the CPU C and P states is Xen, as dom0 doesn't have a full view
of the system load, neither has all CPUs assigned and identity pinned.

Like it's done for classic PV guests, prevent Linux from using idle or
frequency state drivers when running as a PVH dom0.

On an AMD EPYC 7543P system without this fix a Linux PVH dom0 will keep the
host CPUs spinning at 100% even when dom0 is completely idle, as it's
attempting to use the acpi_idle driver.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250407101842.67228-1-roger.pau@citrix.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/enlighten_pvh.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 0e3d930bcb89e..9d25d9373945c 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/cpufreq.h>
+#include <linux/cpuidle.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 
@@ -123,8 +125,23 @@ static void __init pvh_arch_setup(void)
 {
 	pvh_reserve_extra_memory();
 
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
 		xen_add_preferred_consoles();
+
+		/*
+		 * Disable usage of CPU idle and frequency drivers: when
+		 * running as hardware domain the exposed native ACPI tables
+		 * causes idle and/or frequency drivers to attach and
+		 * malfunction.  It's Xen the entity that controls the idle and
+		 * frequency states.
+		 *
+		 * For unprivileged domains the exposed ACPI tables are
+		 * fabricated and don't contain such data.
+		 */
+		disable_cpuidle();
+		disable_cpufreq();
+		WARN_ON(xen_set_default_idle());
+	}
 }
 
 void __init xen_pvh_init(struct boot_params *boot_params)
-- 
2.39.5


