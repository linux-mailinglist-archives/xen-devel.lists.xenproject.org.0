Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959BAD46F0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 01:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011206.1389554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8cJ-0001EV-Cd; Tue, 10 Jun 2025 23:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011206.1389554; Tue, 10 Jun 2025 23:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8cJ-0001C0-A2; Tue, 10 Jun 2025 23:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1011206;
 Tue, 10 Jun 2025 23:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP8cG-0001Bu-RC
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 23:42:54 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c5ce0f6-4654-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 01:42:46 +0200 (CEST)
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
X-Inumbo-ID: 9c5ce0f6-4654-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749598965; x=1749858165;
	bh=FgKuZlenHMnzOx11+ti1TH7kOvkx0Yq6nS3Mop/uTv4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=IkhpadCpB/3enhogzOOgWd9PPaEBjJ5Tcs16eG5msMUVlRreC/BpwMpkRkcQKZWOd
	 YuhQoX91MAwrNPpczZpiN0KAEAy6frzo4w9JF5IAgGzGxBaW8gwCG2RH0MmSftWy+4
	 wf7PUinJ0YY/8S22uV0tju+jL1Vcj2zRo87JhDaqJpiOnz2ZLsEa5wE8dbXCBThnV2
	 KWr45TGvy3L2g9JcWuq3KnQDoke/m4DNJ5hxlQ0ToJxYg1/ZN584qbyhP/McwpqosK
	 WfHn05IAMtXebi8t7wNaRVGa2zRO+E1sVKTbbgsPzE3o7HclULmg3y/5vAKDlCrdpF
	 EMWyAiAxuAoOQ==
Date: Tue, 10 Jun 2025 23:42:37 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/domain: fix late hwdom feature
Message-ID: <20250610234105.1082890-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cb581d934730d99f39136349cdea041bbbc93e00
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Fix get_initial_domain_id() which how returns hardware_domid and breaks lat=
e
hwdom feature [1].

[1] https://lore.kernel.org/xen-devel/a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@=
xen.org/

Fixes: f147ccf2 ("xen/consoled: clean up console handling for PV shim")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 153cd75340..e566a18747 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2404,7 +2404,7 @@ domid_t get_initial_domain_id(void)
     if ( pv_shim )
         return pv_shim_get_initial_domain_id();
 #endif
-    return hardware_domid;
+    return 0;
 }
=20
 void freeze_domains(void)
--=20
2.34.1



