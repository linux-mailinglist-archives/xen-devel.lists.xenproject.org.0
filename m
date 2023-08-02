Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90E076DB3B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 01:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575865.901384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsI-0003ks-Nz; Wed, 02 Aug 2023 23:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575865.901384; Wed, 02 Aug 2023 23:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsI-0003d6-Ey; Wed, 02 Aug 2023 23:03:26 +0000
Received: by outflank-mailman (input) for mailman id 575865;
 Wed, 02 Aug 2023 23:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRKsG-0002ha-KE
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:03:24 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c630ba31-3188-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 01:03:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3BCD58286985;
 Wed,  2 Aug 2023 18:03:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id stl2bWSDymwU; Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CD8ED8286986;
 Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id awEEu_sSYccA; Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 3AB2A8285801;
 Wed,  2 Aug 2023 18:03:18 -0500 (CDT)
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
X-Inumbo-ID: c630ba31-3188-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CD8ED8286986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691017398; bh=IRB/k9AAEsYW3GbnY7XYEQDTmCQcNBCKgPHrjMuNqBM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=fVtp3qJ4toRy7w4GJ53dyAY6jo82bfhuX8WVP11rW4I0gi3pk+YORa4cvIfurrRXQ
	 4ShGAVQcjKAz7qxmUpFWA3zjko7bewpCdf4gcgv1yF93fuoipyQXvwYMltFPxC2n3A
	 BICoRsAchBTkZGHBYusdrJ+kXEuk/uyjA+y2kxM0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 7/9] xen/ppc: Define bug frames table in linker script
Date: Wed,  2 Aug 2023 18:03:03 -0500
Message-Id: <65e26bb63977749cc50daad4ecaf891bf7cc6b0a.1691016993.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691016993.git.sanastasio@raptorengineering.com>
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Define the bug frames table in ppc's linker script as is done by other
architectures.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 2fa81d5a83..692aa34add 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -41,6 +41,16 @@ SECTIONS
     . =3D ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata =3D .;          /* Read-only data */
+        /* Bug frames table */
+       __start_bug_frames =3D .;
+       *(.bug_frames.0)
+       __stop_bug_frames_0 =3D .;
+       *(.bug_frames.1)
+       __stop_bug_frames_1 =3D .;
+       *(.bug_frames.2)
+       __stop_bug_frames_2 =3D .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 =3D .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
--=20
2.30.2


