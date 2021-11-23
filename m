Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A145A941
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229785.397301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0U-0004XI-0J; Tue, 23 Nov 2021 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229785.397301; Tue, 23 Nov 2021 16:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0T-0004QF-SW; Tue, 23 Nov 2021 16:50:57 +0000
Received: by outflank-mailman (input) for mailman id 229785;
 Tue, 23 Nov 2021 16:50:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0004O2-1H
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0007yy-0P
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0R-0000Rv-Va
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:55 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mpZ0P-00073B-Ng; Tue, 23 Nov 2021 16:50:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=eHsV/RneBYh6dTunU90nMqBrHD9YuZKeEe6t7vIHjHg=; b=QKG6cCDX51Hxeg9ABWUs+kxZos
	mDKhBYjYAoIgMUgjDBRvZq7XUf3O9ftqwhrdB/0norQnVUiM1dJIE3GDqUjeJ3k6ruXnqdgPuMeCM
	el5NGYRFppvZCxBqM4dJd2RoYC93wVb8rVQO7lYxXhGRU0NA5ulXbrYs0ay4bRm4Mid0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.16 1/3] Config.mk: switch to named tags (for stable branch)
Date: Tue, 23 Nov 2021 16:50:42 +0000
Message-Id: <20211123165044.29546-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211123165044.29546-1-iwj@xenproject.org>
References: <20211123165044.29546-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Config.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Config.mk b/Config.mk
index 6be010c7ce..b32a185efc 100644
--- a/Config.mk
+++ b/Config.mk
@@ -239,17 +239,15 @@ SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
-QEMU_UPSTREAM_REVISION ?= b6e539830bf45e2d7a6bd86ddfdf003088b173b0
-MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9
+QEMU_UPSTREAM_REVISION ?= qemu-xen-4.16.0-rc4
+MINIOS_UPSTREAM_REVISION ?= xen-4.16.0-rc4
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 
 
-QEMU_TRADITIONAL_REVISION ?= 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764
-# Wed Jul 15 10:01:40 2020 +0100
-# qemu-trad: remove Xen path dependencies
+QEMU_TRADITIONAL_REVISION ?= xen-4.16.0-rc4
 
 # Specify which qemu-dm to use. This may be `ioemu' to use the old
 # Mercurial in-tree version, or a local directory, or a git URL.
-- 
2.20.1


