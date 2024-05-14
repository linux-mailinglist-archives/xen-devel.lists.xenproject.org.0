Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820B8C4DAD
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721234.1124504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nSi-0000kG-1G; Tue, 14 May 2024 08:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721234.1124504; Tue, 14 May 2024 08:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nSh-0000ij-Uk; Tue, 14 May 2024 08:24:39 +0000
Received: by outflank-mailman (input) for mailman id 721234;
 Tue, 14 May 2024 08:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XrDB=MR=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s6nSg-0000iZ-Cc
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:24:38 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66826b46-11cb-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:24:37 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 968412C438;
 Tue, 14 May 2024 04:24:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 8E7272C437;
 Tue, 14 May 2024 04:24:36 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id AC54B2C436;
 Tue, 14 May 2024 04:24:35 -0400 (EDT)
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
X-Inumbo-ID: 66826b46-11cb-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=DOe4Y1iXkxyUp7tFZfnk+wWTi
	6MegcBusy617K955Vw=; b=dNnzQyHHXWisF2UCubKxGdLgpD9nzaxPIPYosfrfM
	s66sjbB3m2gP4ksCMxBS0LM600DhTUOMrCXG19R0A/Tb0cMxhWSKkhlKMJwTC/6I
	kVXYckDxmwS7mLtc5jhee8Fgrx+J9kexgsBbtT0t5Mp3AUW/DuOPaS78GvGh4kU1
	fk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 4/6] x86/MCE: guard {intel/amd}_mcheck_init() calls
Date: Tue, 14 May 2024 11:24:34 +0300
Message-Id: <f79e54859b54e3fdc4aec1f41365169f4428cb8f.1715673586.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 65E4360C-11CB-11EF-B5B5-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Guard calls to CPU-specific mcheck init routines in common MCE code
using new INTEL/AMD config options.

The purpose is not to build platform-specific mcheck code and calls to it=
,
if this platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
- neither of the blank lines dropped
changes in v2:
 - use #ifdef/#endif in switch instead of IS_ENABLED
---
 xen/arch/x86/cpu/mcheck/mce.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index d179e6b068..fb9dec5b89 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -760,11 +760,14 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
=20
     switch ( c->x86_vendor )
     {
+#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
     case X86_VENDOR_HYGON:
         inited =3D amd_mcheck_init(c, bsp);
         break;
+#endif
=20
+#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         switch ( c->x86 )
         {
@@ -774,6 +777,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
             break;
         }
         break;
+#endif
=20
     default:
         break;
--=20
2.25.1


