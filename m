Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31D49283D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258547.445373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pME-0003T1-OZ; Tue, 18 Jan 2022 14:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258547.445373; Tue, 18 Jan 2022 14:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pME-0003Qu-L0; Tue, 18 Jan 2022 14:21:10 +0000
Received: by outflank-mailman (input) for mailman id 258547;
 Tue, 18 Jan 2022 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdM9=SC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9pMC-0003Qo-AB
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:21:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df60f8f3-7869-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 15:21:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64434212B9;
 Tue, 18 Jan 2022 14:21:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A3F813AAD;
 Tue, 18 Jan 2022 14:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FKkXBdHM5mEROwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Jan 2022 14:21:05 +0000
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
X-Inumbo-ID: df60f8f3-7869-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642515665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y8mU3P7cNOu8GPigvqeeGPam6gyJRsQM2Giy0P8gEK4=;
	b=tkBSeNKC61ghN4GIQnZkAZoEHaXgklVRnYRqQuZJrjmBKW+7u/TWMJlJJAdCc1iJWZTSl4
	z5LieIU1ROIKSO93EaLKLTKgHErOaKCvUIZWAjYNukeGmJ6h4nZrkfFhSNoNhjvFXGElSZ
	wQRyB3qP9JI/jy+xbcxI9weNh5uv6kU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] config: use more recent mini-os commit
Date: Tue, 18 Jan 2022 15:21:02 +0100
Message-Id: <20220118142102.22796-1-jgross@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be able to use the recent Mini-OS features switch to the
most recent commit.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 1c1998a5a8..5c8c737fe4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -231,7 +231,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9
+MINIOS_UPSTREAM_REVISION ?= a91161eb0f92dac4ad6d41f91117268bc23ef28d
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
-- 
2.31.1


