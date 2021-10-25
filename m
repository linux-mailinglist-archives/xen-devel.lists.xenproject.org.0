Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9132439312
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 11:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215712.375066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewgn-0003dN-Sn; Mon, 25 Oct 2021 09:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215712.375066; Mon, 25 Oct 2021 09:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mewgn-0003ak-PO; Mon, 25 Oct 2021 09:54:45 +0000
Received: by outflank-mailman (input) for mailman id 215712;
 Mon, 25 Oct 2021 09:54:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRlh=PN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mewgl-0003ae-FA
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 09:54:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f3d40c7-5f3f-4c0a-8428-32388e3ea140;
 Mon, 25 Oct 2021 09:54:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49CCC1FD34;
 Mon, 25 Oct 2021 09:54:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FAD013B95;
 Mon, 25 Oct 2021 09:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BBZwBuF+dmHOXAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 25 Oct 2021 09:54:41 +0000
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
X-Inumbo-ID: 9f3d40c7-5f3f-4c0a-8428-32388e3ea140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635155681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zuhw31BsRK3OYlO9yFpJVkgPAidWSbJ+Jnf/NuhTprs=;
	b=PqU67S0gWEPpHPUV9ZR8dF0vtFZA/Vx8mRwMyB9K2u8rG7ibxZxQ7LDgWpQfCWkKXYwKav
	irEe2IX+H9FVa/0n6MJ7e9SdlDCfJhEYGAR+V7gZ2ngefX5kdg/FEc8bIUAGu+gwOPmkFF
	iml1kNx/ZjLLvECz84YtziAINQHKjQ8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] OSStest: explicitly enable building qemu-traditional
Date: Mon, 25 Oct 2021 11:54:38 +0200
Message-Id: <20211025095438.27599-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is planned to no longer build qemu-traditional per default.

In order to be able to continue running tests with ioemu-stubdom run
configure with --enable-qemu-traditional.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set --enable-qemu-traditional on x86 only (Ian Jackson)
---
 ts-xen-build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ts-xen-build b/ts-xen-build
index af0dd894..fdf55521 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -144,6 +144,7 @@ END
 sub build () {
     my $xend_opt= $r{enable_xend} =~ m/true/ ? "--enable-xend" : "--disable-xend";
     my $ovmf_opt= $r{enable_ovmf} =~ m/true/ ? "--enable-ovmf" : "--disable-ovmf";
+    my $qemutrad_opt = $r{arch} =~ m/amd64|i386/ ? "--enable-qemu-traditional" : "";
 
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


