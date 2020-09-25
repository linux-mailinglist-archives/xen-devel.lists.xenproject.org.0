Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97622784CD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 12:12:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLkhm-0002xu-QG; Fri, 25 Sep 2020 10:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLkhl-0002xp-QS
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 10:11:53 +0000
X-Inumbo-ID: 56cf123d-6c3e-431c-8234-6cdd97da9110
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56cf123d-6c3e-431c-8234-6cdd97da9110;
 Fri, 25 Sep 2020 10:11:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601028711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NG0OrJgM5uOXfafgj6N9/hIxz/Mxn1NzqyKKMmujJRs=;
 b=k6k9NIWYGUGqjHrkfCWCI0YCOS3zb/9xVYikaeqvqaNL9IdDiu4yiys1lKPv0F8vsItlaG
 RjsujkDUKUOtYVHkr0ofyuZ2UBrbHPj5JnE8M1eCpKBEll0msGPImE0l251H2GLzahDTgl
 QcPuY+dskEla5387e8iQgzprAvBnOa8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0B23ACBA;
 Fri, 25 Sep 2020 10:11:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org
Subject: [PATCH] x86/xen: disable Firmware First mode for correctable memory
 errors
Date: Fri, 25 Sep 2020 12:11:48 +0200
Message-Id: <20200925101148.21012-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When running as Xen dom0 the kernel isn't responsible for selecting the
error handling mode, this should be handled by the hypervisor.

So disable setting FF mode when running as Xen pv guest. Not doing so
might result in boot splats like:

[    7.509696] HEST: Enabling Firmware First mode for corrected errors.
[    7.510382] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 2.
[    7.510383] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 3.
[    7.510384] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 4.
[    7.510384] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 5.
[    7.510385] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 6.
[    7.510386] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 7.
[    7.510386] mce: [Firmware Bug]: Ignoring request to disable invalid MCA bank 8.

Reason is that the HEST ACPI table contains the real number of MCA
banks, while the hypervisor is emulating only 2 banks for guests.

Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 22e741e0b10c..065c049d0f3c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1296,6 +1296,14 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 	xen_smp_init();
 
+#ifdef CONFIG_ACPI
+	/*
+	 * Disable selecting "Firmware First mode" for correctable memory
+	 * errors, as this is the duty of the hypervisor to decide.
+	 */
+	acpi_disable_cmcff = 1;
+#endif
+
 #ifdef CONFIG_ACPI_NUMA
 	/*
 	 * The pages we from Xen are not related to machine pages, so
-- 
2.26.2


