Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE97D0081
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 19:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619544.964792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWo2-0007u8-69; Thu, 19 Oct 2023 17:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619544.964792; Thu, 19 Oct 2023 17:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWo2-0007rm-3S; Thu, 19 Oct 2023 17:27:34 +0000
Received: by outflank-mailman (input) for mailman id 619544;
 Thu, 19 Oct 2023 17:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNdL=GB=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qtWo0-0007rg-LX
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 17:27:32 +0000
Received: from sender3-op-o19.zoho.com (sender3-op-o19.zoho.com
 [136.143.184.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6b6ea66-6ea4-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 19:27:30 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: from localhost.localdomain (c-174-169-89-112.hsd1.ma.comcast.net
 [174.169.89.112]) by mx.zohomail.com
 with SMTPS id 169773644253087.09436354385764;
 Thu, 19 Oct 2023 10:27:22 -0700 (PDT)
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
X-Inumbo-ID: c6b6ea66-6ea4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1697736444; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RjYl6r+MuhbiXz2QlrmkKPzizkgb27HA9OTvhFPy5UhJw/XIGIaiC/jlVy1AaC5T1sTp0N5AgX8CFaZQcKW3mqcyfuDKOEDRQPzH7s2NYh0u4qe9QPqwM8ZHUXyAPjjRTRR54W8cmN4s2XjpnyLhc0ulAD05h78JjAuCCEGvuUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1697736444; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2cUdy2EjT3oE/tz9MxRYlrZhTYSHPwH21W1FCL9DulM=; 
	b=HbHb+PZ1ukQd+a7+GzdvAYteJenhfREh/E34hYI5KLu3gAkvxrYKb/NEecH6MaZzB3Dbz1OVJMon6L2qVFCvBh+ajpIjNtRMOztpBylxE0Ao0aobFUx5OdkAN4gUjyVk9qCDmRC4hTdTJduWm/ZeqS+zWjUTmY/2txWxQ4uf2YY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697736444;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=2cUdy2EjT3oE/tz9MxRYlrZhTYSHPwH21W1FCL9DulM=;
	b=DTnp/aYp6lv51ErfnR9dGju7TqGtG8FyMnr80fLTMshzMYUT6d1xpi1foWYlJ8KU
	DEmVuzjZddQ2PjSdkMBj3nzaaERwcqjIZMTRXrf8G3kSld4ILMrmMdc/yCg6Dy0BH3G
	6/YyX23p9Gq9w0XZ/BQL5/VccGNrajneTcfYM7Ck=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.18] x86/mem_sharing: add missing m2p entry when mapping shared_info page
Date: Wed, 18 Oct 2023 04:02:42 -0400
Message-Id: <20231018080242.1213-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mapping in the shared_info page to a fork the m2p entry wasn't set
resulting in the shared_info being reset even when the fork reset was called
with only reset_state and not reset_memory. This results in an extra
unnecessary TLB flush.

Fixes: 1a0000ac775 ("mem_sharing: map shared_info page to same gfn during fork")
Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 94b6b782ef..142258f16a 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1847,6 +1847,8 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
                                 p2m_ram_rw, p2m->default_access, -1);
             if ( rc )
                 return rc;
+
+            set_gpfn_from_mfn(mfn_x(new_mfn), gfn_x(old_gfn));
         }
     }
 
-- 
2.34.1


