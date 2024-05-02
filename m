Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA08B976D
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 11:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715698.1117521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Sao-0002JZ-0H; Thu, 02 May 2024 09:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715698.1117521; Thu, 02 May 2024 09:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2San-0002Hl-Tc; Thu, 02 May 2024 09:19:05 +0000
Received: by outflank-mailman (input) for mailman id 715698;
 Thu, 02 May 2024 09:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUhA=MF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s2Sam-0002Hf-Pv
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 09:19:04 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 038b4ee0-0865-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 11:19:02 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 862961B026;
 Thu,  2 May 2024 05:19:01 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 5473D1B025;
 Thu,  2 May 2024 05:19:01 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id C77E21B023;
 Thu,  2 May 2024 05:18:59 -0400 (EDT)
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
X-Inumbo-ID: 038b4ee0-0865-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=wfkSN8qgSwdu2/Uw/g3XHdw7o
	vhuKayF/PQY78NPsFw=; b=kSAmzF3NmmTz+1KvaAiBPC15BgbZ0kwibq9PTkHib
	brWg1t3SXhWxinar4awFs2ilaSdgZFIw0qCC9nnGEpPyvPY7NgtsFR4PLCmaG/f8
	egobJMbfq20EyxHin8hjsGs/L26RhO4ellJa1c2hZ0ivZ2HmGetuXM9eMUd6ZWef
	YA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 4/5] x86/MCE: guard {intel/amd}_mcheck_init() calls
Date: Thu,  2 May 2024 12:18:57 +0300
Message-Id: <ef74d26d98cb533d148fcc83c354919443ebaa74.1714640459.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 027E4D10-0865-11EF-ADD8-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Guard calls to CPU-specific mcheck init routines in common MCE code
using new INTEL/AMD config options.

The purpose is not to build platform-specific mcheck code and calls to it=
,
if this platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
 - use #ifdef/#endif in switch instead of IS_ENABLED
---
 xen/arch/x86/cpu/mcheck/mce.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index d179e6b068..fb943addae 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -760,11 +760,13 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
=20
     switch ( c->x86_vendor )
     {
+#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
     case X86_VENDOR_HYGON:
         inited =3D amd_mcheck_init(c, bsp);
         break;
-
+#endif
+#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         switch ( c->x86 )
         {
@@ -774,7 +776,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
             break;
         }
         break;
-
+#endif
     default:
         break;
     }
--=20
2.25.1


