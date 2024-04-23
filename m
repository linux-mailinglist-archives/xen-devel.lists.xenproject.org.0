Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2F8AE055
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710450.1109690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBx7-0005c9-B9; Tue, 23 Apr 2024 08:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710450.1109690; Tue, 23 Apr 2024 08:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBx7-0005ZT-8S; Tue, 23 Apr 2024 08:56:37 +0000
Received: by outflank-mailman (input) for mailman id 710450;
 Tue, 23 Apr 2024 08:56:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKuO=L4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rzBx6-0005Yn-5q
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:56:36 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62e34d29-014f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:56:35 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 0A5961FD769;
 Tue, 23 Apr 2024 04:56:34 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 022721FD768;
 Tue, 23 Apr 2024 04:56:34 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id C113D1FD767;
 Tue, 23 Apr 2024 04:56:32 -0400 (EDT)
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
X-Inumbo-ID: 62e34d29-014f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=cIUMk06Iz/UdL/eIZeqDIguEs
	WgJvKn0D2mTsky2q7Q=; b=UJX65VpyP4bUaX3rMU8JvyDG0duxJcb+i221/pWHC
	ZzUvnR2fFIVtwH7MGW1XnnkgW4mEET+PNZbsmC1mjXxbegkxkQsW14GYpdGcbqJr
	FIr7+Uuzsa94RluQFqjlkFYNO4ek7zzSPXvHtzqk09v3wfHC6m94HFUfAwFP9MEg
	yA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 5/7] x86/MCE: guard {intel/amd}_mcheck_init() calls
Date: Tue, 23 Apr 2024 11:56:30 +0300
Message-Id: <0c7d28740db4d6581ebc81a158c970258e547959.1713860310.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 61E2A1EC-014F-11EF-8E73-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Guard calls to CPU-specific mcheck init routines in common MCE code
using new INTEL/AMD config options.

The purpose is not to build platform-specific mcheck code and calls to it=
,
if this platform is disabled in config.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.=
c
index 72dfaf28cb..42e84e76b7 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -761,7 +761,8 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     {
     case X86_VENDOR_AMD:
     case X86_VENDOR_HYGON:
-        inited =3D amd_mcheck_init(c, bsp);
+        inited =3D IS_ENABLED(CONFIG_AMD) ? amd_mcheck_init(c, bsp) :
+                                          mcheck_unset;
         break;
=20
     case X86_VENDOR_INTEL:
@@ -769,7 +770,8 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
         {
         case 6:
         case 15:
-            inited =3D intel_mcheck_init(c, bsp);
+            inited =3D IS_ENABLED(CONFIG_INTEL) ? intel_mcheck_init(c, b=
sp) :
+                                                mcheck_unset;
             break;
         }
         break;
--=20
2.25.1


