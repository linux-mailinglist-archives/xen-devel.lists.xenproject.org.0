Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D29A0B3D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 15:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820049.1233549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13uy-0002HO-Qv; Wed, 16 Oct 2024 13:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820049.1233549; Wed, 16 Oct 2024 13:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13uy-0002FY-OM; Wed, 16 Oct 2024 13:18:24 +0000
Received: by outflank-mailman (input) for mailman id 820049;
 Wed, 16 Oct 2024 13:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1se3=RM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t13uw-0002FR-LE
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 13:18:22 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c360cf6-8bc1-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 15:18:19 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 84A16114013E;
 Wed, 16 Oct 2024 09:18:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 16 Oct 2024 09:18:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 09:18:16 -0400 (EDT)
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
X-Inumbo-ID: 1c360cf6-8bc1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1729084698; x=1729171098; bh=s2ageYzmRMVOBzBDyKeAk2S28uEKx0t2
	1pPmPlvo4Fk=; b=i57UdOrIw9euhqy4IO23j9TiyvdrvMGNFoaJOhYBF7PmMQbZ
	notYNnzSBjTU4jm8LZo5njGwWWurqfR8nWLC0ykunoWOuR8En81GH5G9y+Zltrp2
	ThpwDjXQQdFv2lO4B4ErU4tKqdhLKltvcbyTntrCmPhiymZ8ILh5M/qWEXhgb2rF
	5nBBlRey4bS841X6LIoQIAHdG431B5aer26PftYAhur6wvcXiicaeGXbP9yaDtz5
	Lqm9nz3TOLtkzhirvTbAWkXqhxZYFvu9xXZkM3yo/2Zms3/c134cZm63PNVqootc
	nIoWjt+yDmsWfmhV756HBE45bcrDmb3Bn9O+kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1729084698; x=1729171098; bh=s2ageYzmRMVOB
	zBDyKeAk2S28uEKx0t21pPmPlvo4Fk=; b=NlPAgdJhEsEV3l1gVdmng0fWpSSOV
	P3FEWudD2TKuzGoO2CtLhQa9ElCEPx34uPoELYSNEGuONBVT7bU/3mQaHU2I94y7
	xhvEy21QrKoSLRt45LCYtWILq/y7puM+R4VUdj3wjZ1VKdves/OjclnIBOpJHhWy
	k355G+9UN7HPTiLkwI/BHJcZfoHpRrpbFWbpwU+iiCiBJWDxdTsDzwgRzP5cAFwQ
	vyEV0EAeb/xFTp5SfOhTC2wHeeb0Ifsixs3jkGbOx1zcC1mTFq4c62hLecKoIrH3
	ASItU/UQmQjbHOnVfnqfNWYx6Qxjpo0p2J/6IRI+NgL+zOHPPakKZ2kjw==
X-ME-Sender: <xms:Gr0PZ1ifKdyzQ4PcfGFMOlClV6EV_lxrMQlPkeA4cHGf6-CCUXrrKg>
    <xme:Gr0PZ6AE-J_ww230TvNnL2aMojH5VhkCFuTbVwJzaheEleFAYEKy2ATH7VZCxgIry
    roz9qwJ0-NK0Q>
X-ME-Received: <xmr:Gr0PZ1EQouvHJ7sUL6U61hG-HN4v4Isf503RtnQbzoqoJ3cYDleJHwr6Jc8FSdq6xK9-CSMfSN2Z3fI3B5Ga1IfNfVwoy0ujjH843HO4TA5Pt5N7Gdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeehlefggeekleeghe
    fhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthht
    oheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhope
    hjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghn
    rdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Gr0PZ6QkOXzccpQL012FtF3IvJvtb61PgumIMAK3EgBJZGm3XpIjEQ>
    <xmx:Gr0PZyy2s3ZY2EBG3mN4nUU9nCeLDWoqJdgf932Ky7PlZf82DlvFRQ>
    <xmx:Gr0PZw61ppmtm7FoCIKn3J-vias5r5KT5oRbGmYi2H28G_LJA7KzPg>
    <xmx:Gr0PZ3w8K7LW4FwiWFG2RHuYEfGW8G8gvC9tX4D_t-aeiPKxgDJKzQ>
    <xmx:Gr0PZ5q0LBJLnIiUDvFusdTRX9ZGIDyB28JXYkW1R412nfYTpuZiOt1F>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] docs: update documentation of reboot param
Date: Wed, 16 Oct 2024 15:17:58 +0200
Message-ID: <20241016131813.801242-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reflect changed default mode, and fix formatting of `efi` value.

Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- wrap
- update Default: line too
---
 docs/misc/xen-command-line.pandoc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 5ce63044ade8..293dbc1a957b 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2139,7 +2139,7 @@ callbacks are safe to be executed. Expressed in milliseconds; maximum is
 ### reboot (x86)
 > `= t[riple] | k[bd] | a[cpi] | p[ci] | P[ower] | e[fi] | n[o] [, [w]arm | [c]old]`
 
-> Default: `0`
+> Default: system dependent
 
 Specify the host reboot method.
 
@@ -2153,14 +2153,14 @@ Specify the host reboot method.
 
 `kbd` instructs Xen to reboot the host via the keyboard controller.
 
-`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT.
+`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT (this
+is default mode if available).
 
 `pci` instructs Xen to reboot the host using PCI reset register (port CF9).
 
 `Power` instructs Xen to power-cycle the host using PCI reset register (port CF9).
 
-'efi' instructs Xen to reboot using the EFI reboot call (in EFI mode by
- default it will use that method first).
+`efi` instructs Xen to reboot using the EFI reboot call.
 
 `xen` instructs Xen to reboot using Xen's SCHEDOP hypercall (this is the default
 when running nested Xen)
-- 
2.46.0


