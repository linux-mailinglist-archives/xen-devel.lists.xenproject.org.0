Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3A433693
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213168.371301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcol0-0002Mp-Gt; Tue, 19 Oct 2021 13:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213168.371301; Tue, 19 Oct 2021 13:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcol0-0002K1-DQ; Tue, 19 Oct 2021 13:02:18 +0000
Received: by outflank-mailman (input) for mailman id 213168;
 Tue, 19 Oct 2021 13:02:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5uN=PH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcoky-0002Jt-Pj
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:02:16 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c84faea2-30dc-11ec-8312-12813bfff9fa;
 Tue, 19 Oct 2021 13:02:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1273C1FD32;
 Tue, 19 Oct 2021 13:02:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8F2413CC9;
 Tue, 19 Oct 2021 13:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bF2mN9bBbmGyIgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 19 Oct 2021 13:02:14 +0000
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
X-Inumbo-ID: c84faea2-30dc-11ec-8312-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634648535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YTVHRMRzc/pj1UF6HL+N4N8fehWh+rniyCOu3yYFgRY=;
	b=gEFgK/EYdVjVgpprQSVLewGDBEgAuwB1M03xw2ETTwnx/MAA+JlbFUUfL3eLyeG191NcCV
	QIaVUl6ZIZGQ1m7D2Kx7nUNxq1vXink+TfH4355CqWis8MD/VTDVrVbO/3YW1/QAD8tAfF
	QRRPiuKvkDhZenZbKdBhXKdXwMu4SrM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] OSStest: explicitly enable building qemu-traditional
Date: Tue, 19 Oct 2021 15:02:11 +0200
Message-Id: <20211019130211.32233-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is planned to no longer build qemu-traditional per default.

In order to be able to continue running tests with ioemu-stubdom run
configure with --enable-qemu-traditional.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 ts-xen-build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ts-xen-build b/ts-xen-build
index af0dd894..75fbfe0e 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -144,6 +144,7 @@ END
 sub build () {
     my $xend_opt= $r{enable_xend} =~ m/true/ ? "--enable-xend" : "--disable-xend";
     my $ovmf_opt= $r{enable_ovmf} =~ m/true/ ? "--enable-ovmf" : "--disable-ovmf";
+    my $qemutrad_opt = "--enable-qemu-traditional";
 
     my $configure_prefix = $r{cmdprefix_configure} // '';
     my $configure_suffix = $r{cmdsuffix_configure} // '';
@@ -157,8 +158,11 @@ sub build () {
                 if grep -q -- $ovmf_opt tools/configure ; then
                     ovmf=$ovmf_opt
                 fi
+                if grep -q -- $qemutrad_opt tools/configure ; then
+                    qemutrad=$qemutrad_opt
+                fi
 END
-               $configure_prefix ./configure --sysconfdir=/etc \$xend \$ovmf $configure_suffix @configure_args
+               $configure_prefix ./configure --sysconfdir=/etc \$xend \$ovmf \$qemutrad $configure_suffix @configure_args
 END
             fi
 END
-- 
2.26.2


