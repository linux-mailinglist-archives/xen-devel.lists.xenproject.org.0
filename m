Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253E43B377
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 15:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216453.376070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMwg-0002iU-3S; Tue, 26 Oct 2021 13:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216453.376070; Tue, 26 Oct 2021 13:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMwf-0002fV-Vr; Tue, 26 Oct 2021 13:56:53 +0000
Received: by outflank-mailman (input) for mailman id 216453;
 Tue, 26 Oct 2021 13:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oSYy=PO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfMwf-0002fP-3p
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 13:56:53 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e8f656-3664-11ec-842f-12813bfff9fa;
 Tue, 26 Oct 2021 13:56:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 14CD31FCA3;
 Tue, 26 Oct 2021 13:56:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E78B913B06;
 Tue, 26 Oct 2021 13:56:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t86+NiIJeGFEBgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 26 Oct 2021 13:56:50 +0000
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
X-Inumbo-ID: 91e8f656-3664-11ec-842f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635256611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H03k2PldCmMg5lMqnhyq49VN6e7pFnyJAuAX5qZZoXg=;
	b=nHhvKuAASQcpxTJy/kZkGvd04FyiLxxPQnQbLZXm5++PoXLystNQ/OYbWhDtnxAVF4UvWo
	WejCB+3ZPrPBy948pycfbRXcPgWh4cHdiilUbQ6lCnO3qGuTBN6X0YCL5/wofV3YSJxz2T
	5Ar5Ujn6fmO4OhvNB718yH7XpfVMQc4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] osstest: explicitly set either enable or disable qemu-traditional
Date: Tue, 26 Oct 2021 15:56:45 +0200
Message-Id: <20211026135645.31488-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of setting "--enable-qemu-traditional" or not, switch to
setting "--enable-qemu-traditional" or "--disable-qemu-traditional".

This avoids a latent bug in the disable case, as the availability
of the option is tested via grep, which will otherwise grep for
nothing.

Reported-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 ts-xen-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-build b/ts-xen-build
index fdf55521..ccb2aba2 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -144,7 +144,7 @@ END
 sub build () {
     my $xend_opt= $r{enable_xend} =~ m/true/ ? "--enable-xend" : "--disable-xend";
     my $ovmf_opt= $r{enable_ovmf} =~ m/true/ ? "--enable-ovmf" : "--disable-ovmf";
-    my $qemutrad_opt = $r{arch} =~ m/amd64|i386/ ? "--enable-qemu-traditional" : "";
+    my $qemutrad_opt = $r{arch} =~ m/amd64|i386/ ? "--enable-qemu-traditional" : "--disable-qemu-traditional";
 
     my $configure_prefix = $r{cmdprefix_configure} // '';
     my $configure_suffix = $r{cmdsuffix_configure} // '';
-- 
2.26.2


