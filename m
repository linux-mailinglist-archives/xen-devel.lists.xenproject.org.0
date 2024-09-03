Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7179695DA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788712.1198170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOAZ-00080E-Vk; Tue, 03 Sep 2024 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788712.1198170; Tue, 03 Sep 2024 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOAZ-0007yi-Rj; Tue, 03 Sep 2024 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 788712;
 Tue, 03 Sep 2024 07:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0nne=QB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1slOAY-0007yW-0A
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:41:42 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f15d31e1-69c7-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:41:36 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 2B0AE20467;
 Tue,  3 Sep 2024 03:41:37 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 2163720466;
 Tue,  3 Sep 2024 03:41:37 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id ECFAC20465;
 Tue,  3 Sep 2024 03:41:35 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: f15d31e1-69c7-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=3u7X6484bcuyCSp6kCsrRUJyx4QPT4rN8y5zfWv5ihY=; b=Q0S/
	u9Tn+mZJd0LaUtuuOAiZzpPrbhhaGh7yzK19jea4XK6tANmCf6eUgbx07NOKErbE
	yZRFidC2XgTICo8m/PkL0rHsCF17WWL6q4ksEUNRpi72kuf0/T7IT4Q+LU8EvK0f
	gP7q1W4JckIoth1vfR4/ImEc7TJ4XzhWm4Ht8Vo=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/tboot: add Intel dependency
Date: Tue,  3 Sep 2024 10:41:34 +0300
Message-Id: <20240903074134.305012-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 F282FF7C-69C7-11EF-A8A0-2BAEEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Make the Intel-specific Trusted Boot implementation dependant on general =
Intel CPU support.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d0aaf359eb..89d17e7f2c 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -221,7 +221,7 @@ config HVM_FEP
=20
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
-	depends on UNSUPPORTED
+	depends on INTEL && UNSUPPORTED
 	default !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	help
--=20
2.25.1


