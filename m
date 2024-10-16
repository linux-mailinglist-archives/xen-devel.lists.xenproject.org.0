Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6289A0A42
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 14:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820023.1233520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13Ly-0005Cs-OW; Wed, 16 Oct 2024 12:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820023.1233520; Wed, 16 Oct 2024 12:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t13Ly-00059y-LU; Wed, 16 Oct 2024 12:42:14 +0000
Received: by outflank-mailman (input) for mailman id 820023;
 Wed, 16 Oct 2024 12:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1se3=RM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t13Lx-00059s-G9
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 12:42:13 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f91172b-8bbc-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 14:42:11 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id A4F03138022B;
 Wed, 16 Oct 2024 08:42:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 16 Oct 2024 08:42:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 08:42:07 -0400 (EDT)
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
X-Inumbo-ID: 0f91172b-8bbc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1729082529; x=1729168929; bh=28ccFPUf7kgvqlDFaIKcVoBWTL1BQzci
	kKrseBZ65Qk=; b=hABnNig9tb8Fd9vWIj+AATbNIXftOPyHuiuTnSj50PQ8bsJL
	p+QPC2559ManIFrQBytksQOt+sIjukaOU8ZrLrEdW8CLh1dR78c85rM09mDgI33p
	VQsx4VAFcktU48sQxBUc/eYJ+Q1O+73lE/32XJIyZnXLDLwwJes+CYQm1+iVlL77
	3tvjIUOb3MpuI9SwMVnOfRcKc8HMhhWGX3N3J+RDSeKqbRxEHjvgIfiY/uIwAmtj
	l2hlRMGr4DU2pQJ5xOj6LRwZh00Yt5+YA7WvC+Ew6/646xC+axRw4hbdC4JvTaVx
	zcbA4+vRinGSC5AQaPGV4JEZB2k76PXBatL3iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1729082529; x=1729168929; bh=28ccFPUf7kgvq
	lDFaIKcVoBWTL1BQzcikKrseBZ65Qk=; b=WoJWguETwQZSfRU/ukhadFq4AM0Qb
	n8VyeumkYbIYuF4a4IuTQNbJwZvjhK531bcYBvYAYkXDmTvaYFa9nA6TBjcisuNg
	7nL3s1LvcQJi+9MIR0mHfbRdWvjU9WiCQiJ14tDbdBknVjfXp2m2mgNDnmoGChet
	1RpMOKIDsBLkPubCSmTVuO6nAchvNX2eWvKV6iDszldjcPFDrVhz6Weeg4DvcvZt
	6DZaIJs/RCzWSMh1FM7thA1kvpPqDWQUBY2MOHNbP/ADgVGaK/Kj+QWe6Nuuk/2I
	XExrZrmWe+we8bcxPE6UxkHZ+trmbVNBkCqY55IICA6x7UfyvSHNF/F0Q==
X-ME-Sender: <xms:obQPZ7nV1Qghcifu4zQBAapynQtxGDhtwAxX-fr7TzhnigpASKdr8A>
    <xme:obQPZ-1Rkp31asNZQlIOGwbppm3M3vq33sXIu-oChiDx8SsqljDW94hSMRVdQ14-B
    XUeOzZb6FwUfQ>
X-ME-Received: <xmr:obQPZxooxJBRnQfqQOme1wPSth3yh_NdOTSVYzaz7uFjfuMThY3FGdrbq5CMi2Yf__HyJsRDrC9TskcQEZcONGP126AA9L5tRr1Be2mNsbl9sDHelFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgheeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:obQPZznbZ6gt-5rY3n1ner0egjIP7Xq_omw-YuHvtXJFVueh4StHag>
    <xmx:obQPZ51R_cXBL6Z8gV-JlSIfrNfWFFBxxXkZ46aYqy7KuMwQGP4-Qw>
    <xmx:obQPZytq0cdQF42tq48JOo8NCTnbsf2XXQTAnWN33Pakf9xmbn4bJQ>
    <xmx:obQPZ9VnztUEJvweezeNNqr9Tx9az0iY6XWIUxl5Z_vnCpHmaIL0lA>
    <xmx:obQPZx-3DgRe7AfI9dIxorebqZdQgPxVhpWW-JpEfvpScNg-3Tzg5vNU>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: update documentation of reboot param
Date: Wed, 16 Oct 2024 14:41:53 +0200
Message-ID: <20241016124202.801139-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reflect changed default mode, and fix formatting of `efi` value.

Fixes: d81dd3130351 ("x86/shutdown: change default reboot method preference")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/misc/xen-command-line.pandoc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 5ce63044ade8..0e36608f13e6 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2153,14 +2153,13 @@ Specify the host reboot method.
 
 `kbd` instructs Xen to reboot the host via the keyboard controller.
 
-`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT.
+`acpi` instructs Xen to reboot the host using RESET_REG in the ACPI FADT (this is default mode if available).
 
 `pci` instructs Xen to reboot the host using PCI reset register (port CF9).
 
 `Power` instructs Xen to power-cycle the host using PCI reset register (port CF9).
 
-'efi' instructs Xen to reboot using the EFI reboot call (in EFI mode by
- default it will use that method first).
+`efi` instructs Xen to reboot using the EFI reboot call.
 
 `xen` instructs Xen to reboot using Xen's SCHEDOP hypercall (this is the default
 when running nested Xen)
-- 
2.46.0


