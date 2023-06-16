Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F32473379F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 19:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550339.859367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYg-0002GN-Rl; Fri, 16 Jun 2023 17:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550339.859367; Fri, 16 Jun 2023 17:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYg-0002Cn-NZ; Fri, 16 Jun 2023 17:48:26 +0000
Received: by outflank-mailman (input) for mailman id 550339;
 Fri, 16 Jun 2023 17:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qADYf-0001uA-1o
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 17:48:25 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb0e02b3-0c6d-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 19:48:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 873A48285ACC;
 Fri, 16 Jun 2023 12:48:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vkaCJmTDLPFp; Fri, 16 Jun 2023 12:48:19 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 049988285717;
 Fri, 16 Jun 2023 12:48:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UWbTFFnjXTEL; Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7CD2E8285A31;
 Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
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
X-Inumbo-ID: fb0e02b3-0c6d-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 049988285717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686937699; bh=jA1LG42ATJrlkAxSkcwEOBWl2olUCKNn9Ak/VcBw2PI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=lpCxyXxe9bQRo9OOm8PmakAcyC3N+ki6Ebw9EEzBaTElZRcYvvE7S7ZgS9xeqOBEj
	 lctpbvwM0XOi6RoBmQEHf+9L1KbCA3nmzUWBboU17sDoX0FGSHoLTmxpMuW2+WDc8A
	 Jx8xRoNatW/Ofsqv0q4/DXFqeb/paoUbsg4QMgD0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 4/4] maintainers: Add ppc64 maintainer
Date: Fri, 16 Jun 2023 12:48:03 -0500
Message-Id: <ee1b287eaeeeebc2426c71ddbf18f68515876c3e.1686936278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1686936278.git.sanastasio@raptorengineering.com>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bb7a6a839..25139fe4a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -460,6 +460,10 @@ X:	xen/arch/x86/acpi/lib.c
 F:	xen/drivers/cpufreq/
 F:	xen/include/acpi/cpufreq/
=20
+PPC64
+M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+F:	xen/arch/ppc/
+
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
 M:	Juergen Gross <jgross@suse.com>
 S:	Supported
--=20
2.30.2


