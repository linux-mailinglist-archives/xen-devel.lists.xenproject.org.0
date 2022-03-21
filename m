Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D991C4E2198
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 08:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292767.497161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCrA-00068i-JV; Mon, 21 Mar 2022 07:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292767.497161; Mon, 21 Mar 2022 07:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCrA-00066s-Fr; Mon, 21 Mar 2022 07:53:36 +0000
Received: by outflank-mailman (input) for mailman id 292767;
 Mon, 21 Mar 2022 07:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hCO=UA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWCr8-00066m-R8
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 07:53:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 019ca7b6-a8ec-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 08:53:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 242231F37F;
 Mon, 21 Mar 2022 07:53:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0BB313AD5;
 Mon, 21 Mar 2022 07:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHiSNfwuOGJOKwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Mar 2022 07:53:32 +0000
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
X-Inumbo-ID: 019ca7b6-a8ec-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647849213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hl2QIpxAUBr3xEmFUmxbY4ITkClOIKGVM/RNX9JH/2M=;
	b=eww3f7nAT+IpF08Pw7EWW+HAKGRuwrnGpVLKiNayDD/D3T4dVY8DUz+WzWyYS30nzg4rCg
	M5rDo1MpPAMRc4WT4aPJSPddM/8EtNiDeMIl7qEafw3YwUmffHRKRrKtaqFhi9rxvXpy2q
	yW+HG1dm1dm6k7oIjCK1O1j5Jz45r3o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/x86/hvm: add missing cf_check for hvm_physdev_op()
Date: Mon, 21 Mar 2022 08:53:29 +0100
Message-Id: <20220321075329.3302-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hypercall handler hvm_physdev_op() is missing a cf_check attribute.

Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 030243810e..62b5349e7d 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -78,7 +78,7 @@ static long cf_check hvm_grant_table_op(
 }
 #endif
 
-static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+static long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
-- 
2.34.1


