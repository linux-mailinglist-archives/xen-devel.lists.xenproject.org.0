Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91196227C63
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:02:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxp6V-0002CZ-No; Tue, 21 Jul 2020 10:02:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pac=BA=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1jxp6U-0002CU-4L
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:02:30 +0000
X-Inumbo-ID: 491d8a46-cb39-11ea-a09c-12813bfff9fa
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 491d8a46-cb39-11ea-a09c-12813bfff9fa;
 Tue, 21 Jul 2020 10:02:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jxp6H-0000Kf-Mg; Tue, 21 Jul 2020 10:02:17 +0000
From: Colin King <colin.king@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: [PATCH][next] x86/ioperm: initialize pointer bitmap with NULL rather
 than 0
Date: Tue, 21 Jul 2020 11:02:17 +0100
Message-Id: <20200721100217.407975-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Colin Ian King <colin.king@canonical.com>

The pointer bitmap is being initialized with a plain integer 0,
fix this by initializing it with a NULL instead.

Cleans up sparse warning:
arch/x86/xen/enlighten_pv.c:876:27: warning: Using plain integer
as NULL pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index c46b9f2e732f..2aab43a13a8c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -873,7 +873,7 @@ static void xen_load_sp0(unsigned long sp0)
 static void xen_invalidate_io_bitmap(void)
 {
 	struct physdev_set_iobitmap iobitmap = {
-		.bitmap = 0,
+		.bitmap = NULL,
 		.nr_ports = 0,
 	};
 
-- 
2.27.0


