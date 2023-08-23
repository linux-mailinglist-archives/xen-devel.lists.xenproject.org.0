Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F078612F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589516.921491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8i-0005c8-Pe; Wed, 23 Aug 2023 20:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589516.921491; Wed, 23 Aug 2023 20:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8i-0005Sg-Iy; Wed, 23 Aug 2023 20:07:40 +0000
Received: by outflank-mailman (input) for mailman id 589516;
 Wed, 23 Aug 2023 20:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8g-0004Vt-A0
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3144e82-41f0-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 22:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 886A58285AAD;
 Wed, 23 Aug 2023 15:07:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JI6P4Lpkb6Si; Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7F1E082869C3;
 Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1aMetp_PCimj; Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 23104828673D;
 Wed, 23 Aug 2023 15:07:33 -0500 (CDT)
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
X-Inumbo-ID: b3144e82-41f0-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7F1E082869C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821253; bh=GeGECnKBSpninCMh4v2k/q/3WkfOACULzVkAztOkkWU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=gk5eRib8yTv1SeODNU176oFuRMTBaL0ZyZHLBO1Pfc1giUpmLfSJYTP2gFFypnMhQ
	 Yw7vVLuCqgsgqR//uUzSu34Jv391y1PpI4INmGLNtAIyeAqMk0YFuCDlqOgdqT0OHy
	 SEiWFQ54jUp4HiX9vCkjjn1i01JFFn1C/ZTZZMIQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 6/8] xen/ppc: Define bug frames table in linker script
Date: Wed, 23 Aug 2023 15:07:17 -0500
Message-Id: <f81914771ec96a48adf25c55329aa5f739f174d0.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692816595.git.sanastasio@raptorengineering.com>
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Define the bug frames table in ppc's linker script as is done by other
architectures.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add extra space to fix alignment of newly added lines
 xen/arch/ppc/xen.lds.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 2fa81d5a83..9e46035155 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -41,6 +41,16 @@ SECTIONS
     . =3D ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata =3D .;          /* Read-only data */
+        /* Bug frames table */
+        __start_bug_frames =3D .;
+        *(.bug_frames.0)
+        __stop_bug_frames_0 =3D .;
+        *(.bug_frames.1)
+        __stop_bug_frames_1 =3D .;
+        *(.bug_frames.2)
+        __stop_bug_frames_2 =3D .;
+        *(.bug_frames.3)
+        __stop_bug_frames_3 =3D .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
--
2.30.2


