Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610B737391
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552205.862155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqv-0006VG-Kq; Tue, 20 Jun 2023 18:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552205.862155; Tue, 20 Jun 2023 18:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfqv-0006Oq-Hn; Tue, 20 Jun 2023 18:13:17 +0000
Received: by outflank-mailman (input) for mailman id 552205;
 Tue, 20 Jun 2023 18:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5hq=CI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBfqu-00067X-Fm
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:13:16 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dee4ccf-0f96-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 20:13:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6EA9D82859E7;
 Tue, 20 Jun 2023 13:13:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 38AnmEvMLNfY; Tue, 20 Jun 2023 13:13:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E4D7982858A5;
 Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mu5uMGs8Cf1g; Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6F94D8285961;
 Tue, 20 Jun 2023 13:13:09 -0500 (CDT)
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
X-Inumbo-ID: 1dee4ccf-0f96-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E4D7982858A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687284789; bh=rVt9yBHkvSuTJqNy14y8pMgN4FxatTVDACL6loAkQJw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZSg6R2+36jor4eGAGoaaz+SvWz6ktLoXIafOyavEwzRAlefrWrhRQUJdW7+8dVgkB
	 carn8cyC54WZ+GixGAKi9wgkRE1rMSjQ3DmFi8WLfX4UE2GXNqYSnP7CLQDU04/glp
	 aN+tj9OR/CJVySLrJwAqVlEieQdj4du7kTFm4bwg=
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
Subject: [PATCH v5 3/3] maintainers: Add ppc64 maintainer
Date: Tue, 20 Jun 2023 13:12:49 -0500
Message-Id: <29f8ad82955a08a5a76a3edd641efd52e302074e.1687283294.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687283294.git.sanastasio@raptorengineering.com>
References: <cover.1687283294.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a07949e1d..64c9cc89ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -458,6 +458,10 @@ X:	xen/arch/x86/acpi/lib.c
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


