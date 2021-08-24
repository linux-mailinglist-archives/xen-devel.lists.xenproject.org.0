Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB27C3F5C69
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170918.312000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1k-0005ge-D2; Tue, 24 Aug 2021 10:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170918.312000; Tue, 24 Aug 2021 10:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1k-0005dI-7N; Tue, 24 Aug 2021 10:51:32 +0000
Received: by outflank-mailman (input) for mailman id 170918;
 Tue, 24 Aug 2021 10:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1i-0001EC-9F
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:30 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e70fb7b-8b13-40da-bd22-5cd12aced9c2;
 Tue, 24 Aug 2021 10:51:03 +0000 (UTC)
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
X-Inumbo-ID: 7e70fb7b-8b13-40da-bd22-5cd12aced9c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aeF7Kv7O4DhLszrRehfv9wqocK16xFjPyQnD/pOHJvE=;
  b=igjrcCscg2+nQDxvLdIdD4T0XMV76WNL5ZpWZIXuzuh9ujZvH/vtmDz3
   BZm3Avo6U85Z00OZhOh3CfxdC8Of8V1Im/9qODLaqFPxTp8J+laHJKxjT
   4M7xrGjWOI7At4ASCRVhbV0x/m0BzJO0ozIXmGHE8BPVIoAh8oSY3v9xe
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lrXu+DHBj+AeJaQBq0MAWxjoaL+0yaNtvNLPbzW7baavHMgkl8cjdAqAkexlhzmLQ4WR6eARv6
 a/XimwmpGrzwO5wKaQcbn7T/5QXtJLemMfst68o/hJgdvNSYMiqd0eQk2gAhmc7v2o89OcwZlx
 ET20SgetBXTvgdyfB5GoowYYoE+635KSqg1Zyyi6tI0wwI8pWvLyMZij9j7yh9XqxGlGk22MFd
 GZwM1Lm+443lfyEpLorAtdn1pbELskKkUWnk9UL7oAL6wG+GfR+kKWnCGtiMXqXJLTYQRb1tuH
 pIEo8LsyN/S1m7SitTUMMxHU
X-SBRS: 5.1
X-MesageID: 51153521
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3VkvwKPCKF354MBcT33155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE7gr4WBkb+exoS5PwOE80lKQFqrX5Uo3SODUO1FHHEGgA1/qp/9SDIVyYygc178
 4JH8dD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5Nv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVaUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZszY
 GFqX222kyQiYD69vbu7R6R032Qoqqi9jJ3Pr3MtiHSEESotu/nXvUkZ1TIhkFMnAjm0idQrD
 CLmWZsAy070QKqQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MuTvL10TtVgDhH6t
 M944tZjesnMTrQ2CDmo9TYXRBjkUS55XIkjO4IlnRaFY8TcqVYo4AT9F5cVM5oJlOz1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGclzJWgHd6xU0Fw9F3pAZIyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBdC6D2TcKCi8RV564W6XZp3vHki91aIfzI9FmN1CSaZ4v6fawq
 6xLW+wnVRCBH7GGImU2oFX/lTXXGCwNA6duv1j2w==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153521"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 09/51] build: use subdir-y in test/Makefile
Date: Tue, 24 Aug 2021 11:49:56 +0100
Message-ID: <20210824105038.1257926-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows Makefile.clean to recurse into livepatch without help.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/test/Makefile | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/test/Makefile b/xen/test/Makefile
index aaa499664396..41e4d7bdb78b 100644
--- a/xen/test/Makefile
+++ b/xen/test/Makefile
@@ -4,15 +4,10 @@ tests all: build
 
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
-SUBDIRS += livepatch
+subdir-y += livepatch
 endif
 
 install build subtree-force-update uninstall: %:
-	set -e; for s in $(SUBDIRS); do \
+	set -e; for s in $(subdir-y); do \
 		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
 	done
-
-clean::
-	set -e; for s in $(SUBDIRS); do \
-		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $@; \
-	done
-- 
Anthony PERARD


