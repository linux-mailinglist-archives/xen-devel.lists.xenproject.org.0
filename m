Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDD4ECCE5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 21:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296501.504755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZddB-0002Kn-JP; Wed, 30 Mar 2022 19:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296501.504755; Wed, 30 Mar 2022 19:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZddB-0002HN-Ed; Wed, 30 Mar 2022 19:05:21 +0000
Received: by outflank-mailman (input) for mailman id 296501;
 Wed, 30 Mar 2022 19:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZdd9-0001VT-8X
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 19:05:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 560afc2e-b05c-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 21:05:18 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648667098306644.7320036155761;
 Wed, 30 Mar 2022 12:04:58 -0700 (PDT)
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
X-Inumbo-ID: 560afc2e-b05c-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648667100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PAvk23Bp7OtwQ34hjKg724vdDXmYp6UIWNv4TDRbpKCX7HyxO2AOGo2MnX2CxV5sjrmbXak7X8QD+HAj6BRk72yilMYNpxVHDdx07cPtoSTnbrM/SFCl9Up2erpztzZ+8lljUp6i6FUJQkNFOi2VviY2CBXQOPMwAbbWLvxfVGA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648667100; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dB9qOZNsWI6cdhi3GPQMvCqqeva+kPJ+omKewxXhvII=; 
	b=jMRIkmlwpqBXCDmGVKiO1J7il6k/RLDL3Xq13V2/8PIJEMLXGVFQClGOlnIyxWS9PLcKNIVkZx4HzjU+lO2GPg3J1HYZduxmFPEU8TQKd1QqCJDJNgjEMk2upIDsQ1b7e/qQz3fM7XKVpMyWyAY0rs/inyKVJFSW2FjWw2oELP0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648667100;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=dB9qOZNsWI6cdhi3GPQMvCqqeva+kPJ+omKewxXhvII=;
	b=uk3A1857UhrOj+FEX5+zWliaVJduT9HgfOaCYkUQplgjGzFRXXT+u2Apki667jlV
	I1pVnlIJIB+WS6PpwLKv2sFSr0p7UuOktkTF9nNP7wiV/TGAPgRIt9dzpJqQC6/TogK
	s7pfv522ajyftOZdqblzm7u/zoUkzAGDJb0UK4uU=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] arch: ensure idle domain is not left privileged
Date: Wed, 30 Mar 2022 19:05:49 -0400
Message-Id: <20220330230549.26074-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220330230549.26074-1-dpsmith@apertussolutions.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

It is now possible to promote the idle domain to privileged during setup.  It
is not desirable for the idle domain to still be privileged when moving into a
running state. If the idle domain was elevated and not properly demoted, it is
desirable to fail at this point. This commit adds an assert for both x86 and
Arm just before transitioning to a running state that ensures the idle is not
privileged.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/arm/setup.c | 3 +++
 xen/arch/x86/setup.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7968cee47d..3de394e946 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -973,6 +973,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     /* Hide UART from DOM0 if we're using it */
     serial_endboot();
 
+    /* Ensure idle domain was not left privileged */
+    ASSERT(current->domain->is_privileged == false) ;
+
     system_state = SYS_STATE_active;
 
     create_domUs();
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 885919d5c3..b868463f83 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -589,6 +589,9 @@ static void noinline init_done(void)
     void *va;
     unsigned long start, end;
 
+    /* Ensure idle domain was not left privileged */
+    ASSERT(current->domain->is_privileged == false) ;
+
     system_state = SYS_STATE_active;
 
     domain_unpause_by_systemcontroller(dom0);
-- 
2.20.1


