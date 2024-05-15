Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8165E8C6365
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722039.1125849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AcW-0001tB-Rf; Wed, 15 May 2024 09:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722039.1125849; Wed, 15 May 2024 09:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AcW-0001qn-O4; Wed, 15 May 2024 09:08:20 +0000
Received: by outflank-mailman (input) for mailman id 722039;
 Wed, 15 May 2024 09:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AcV-0001qh-9A
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:08:19 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa98e4b2-129a-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:08:18 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 547F11BBAA;
 Wed, 15 May 2024 05:08:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 4C5F31BBA9;
 Wed, 15 May 2024 05:08:16 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id D60251BB9F;
 Wed, 15 May 2024 05:08:12 -0400 (EDT)
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
X-Inumbo-ID: aa98e4b2-129a-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=4MpdoyoH5pC3p0CFUByX+/dhz
	ItVV3D2aq0lad6vARM=; b=slkyQBGbA00raAtKOXj3hYlqwltBL6XIVBq5bBpXU
	nukisjagm1x3pCikaxgkYmrQEGV4gla6hIW/It/FJpHcGHXDhX9VkHLRepkzC1bX
	6KhU1LL0k6Ftduu70/WXtIF6QbzlBD4ea1Ch9w3+jJFF3JCv/t+nZHwBIXUZNKTx
	ZQ=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [XEN PATCH v2 05/15] x86: introduce CONFIG_ALTP2M Kconfig option
Date: Wed, 15 May 2024 12:08:09 +0300
Message-Id: <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 A8418106-129A-11EF-8833-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

Add new option to make altp2m code inclusion optional.
Currently altp2m support provided for VT-d only, so option is dependant o=
n VMX.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 8c9f8431f0..2872b031a7 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -358,6 +358,11 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
=20
+config ALTP2M
+	bool "Alternate P2M support"
+	def_bool y
+	depends on VMX && EXPERT
+
 endmenu
=20
 source "common/Kconfig"
--=20
2.25.1


