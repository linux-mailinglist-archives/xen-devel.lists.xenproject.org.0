Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532442113F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201542.356114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOol-0007zv-Kn; Mon, 04 Oct 2021 14:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201542.356114; Mon, 04 Oct 2021 14:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOol-0007xq-Gj; Mon, 04 Oct 2021 14:19:47 +0000
Received: by outflank-mailman (input) for mailman id 201542;
 Mon, 04 Oct 2021 14:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7SE7=OY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXOoj-0007UW-R5
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:19:45 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb28ed18-8dd0-44f3-b308-9b2cd0eaf583;
 Mon, 04 Oct 2021 14:19:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90F1820208;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 679A913AEF;
 Mon,  4 Oct 2021 14:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gL4rGHANW2EjcAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 04 Oct 2021 14:19:28 +0000
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
X-Inumbo-ID: eb28ed18-8dd0-44f3-b308-9b2cd0eaf583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633357168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH3DuqnGZJpT+DNy0zo8NCI7OWmYxQHUzvQItaNzehQ=;
	b=KNCxsc5Tvfa4QZzFM/Ijgv0HbzzfqF41gbC0lJPL8exwmbYrfbyQcKFCbChlwsQOHOmfre
	xity+WYdsZ2I0ZHUooPKjABuxS2xDWDPpygv/CWaILHvinmf1E1DXb1s4Ocwpfji83wJQ4
	0koLcmspZmP2bLr067oGSw342JTVEEY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] mini-os: fix testbuilds regarding CONFIG_XC
Date: Mon,  4 Oct 2021 16:19:23 +0200
Message-Id: <20211004141924.7088-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211004141924.7088-1-jgross@suse.com>
References: <20211004141924.7088-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_GC is requiring external support, so disable it in testbuilds.

The only reason this is working right now is its usage being inside
a HAVE_LIBC section.

Make that more obvious by making the default setting of CONFIG_XC
depending on libc being available.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk                     | 3 ++-
 arch/x86/testbuild/all-yes    | 3 ++-
 arch/x86/testbuild/newxen-yes | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Config.mk b/Config.mk
index 15311ef..8f4cea9 100644
--- a/Config.mk
+++ b/Config.mk
@@ -62,6 +62,7 @@ MINIOS_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
 MINIOS_TARGET_ARCH     ?= $(MINIOS_COMPILE_ARCH)
 endif
 
+stubdom ?= n
 libc = $(stubdom)
 
 XEN_INTERFACE_VERSION ?= 0x00030205
@@ -179,7 +180,6 @@ CONFIG-y += CONFIG_FBFRONT
 CONFIG-y += CONFIG_KBDFRONT
 CONFIG-y += CONFIG_CONSFRONT
 CONFIG-y += CONFIG_XENBUS
-CONFIG-y += CONFIG_XC
 CONFIG-n += CONFIG_QEMU_XS_ARGS
 CONFIG-n += CONFIG_TEST
 CONFIG-n += CONFIG_PCIFRONT
@@ -195,6 +195,7 @@ CONFIG-y += CONFIG_PARAVIRT
 else
 CONFIG-n += CONFIG_PARAVIRT
 endif
+CONFIG-$(libc) += CONFIG_XC
 CONFIG-$(lwip) += CONFIG_LWIP
 
 $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 8732e69..5464342 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -13,7 +13,8 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
-CONFIG_XC = y
+# XC is special: it needs support from outside
+CONFIG_XC = n
 # LWIP is special: it needs support from outside
 CONFIG_LWIP = n
 CONFIG_BALLOON = y
diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
index 9c30c00..2a3ed2e 100644
--- a/arch/x86/testbuild/newxen-yes
+++ b/arch/x86/testbuild/newxen-yes
@@ -13,7 +13,8 @@ CONFIG_FBFRONT = y
 CONFIG_KBDFRONT = y
 CONFIG_CONSFRONT = y
 CONFIG_XENBUS = y
-CONFIG_XC = y
+# XC is special: it needs support from outside
+CONFIG_XC = n
 # LWIP is special: it needs support from outside
 CONFIG_LWIP = n
 CONFIG_BALLOON = y
-- 
2.26.2


