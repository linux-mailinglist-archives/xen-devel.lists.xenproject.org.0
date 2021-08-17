Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CD3EEA5B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 11:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167687.306131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoh-00087c-Hu; Tue, 17 Aug 2021 09:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167687.306131; Tue, 17 Aug 2021 09:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFvoh-00084P-DC; Tue, 17 Aug 2021 09:55:31 +0000
Received: by outflank-mailman (input) for mailman id 167687;
 Tue, 17 Aug 2021 09:55:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OoW9=NI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mFvof-0007HZ-QJ
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 09:55:29 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 370c78c1-ff41-11eb-a498-12813bfff9fa;
 Tue, 17 Aug 2021 09:55:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 805191FF2A;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 50B9113318;
 Tue, 17 Aug 2021 09:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cEsyEoCHG2FEDwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 17 Aug 2021 09:55:12 +0000
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
X-Inumbo-ID: 370c78c1-ff41-11eb-a498-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629194112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7e67WuvV4pKmdIXjVMDTNBcSJU1S8WTkTBIrXnVCNo=;
	b=nWFEioz4JgFpFDtLsmXwKUIjBQgufaQmMJankVSMenhEkuE0MvmQ3SQwix2GdbqoUbCPvG
	BjsN1jXHh5koKWK2TpcD4WOZ/eY9I4GnV2xdxFo6nrloS5kW7DbUIw3Ieja+oPmGiEvnhO
	eKco3UZL6Q52yL1qqn9SNy3Mf1OMCKQ=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] mini-os: make config handling more generic
Date: Tue, 17 Aug 2021 11:54:58 +0200
Message-Id: <20210817095459.27671-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210817095459.27671-1-jgross@suse.com>
References: <20210817095459.27671-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding a new CONFIG_ variable this needs to be done in multiple
places. Change the handling to be more generic.

This at once fixes a bug with CONFIG_XC which was not defined for the
C preprocessor (it seems that this never resulted in any real issues,
though).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Config.mk | 66 +++++++++++++++++++++++--------------------------------
 1 file changed, 28 insertions(+), 38 deletions(-)

diff --git a/Config.mk b/Config.mk
index cb823c2..15311ef 100644
--- a/Config.mk
+++ b/Config.mk
@@ -171,49 +171,39 @@ endif
 # CONFIG_ variables.
 
 # Configuration defaults
+CONFIG-y += CONFIG_START_NETWORK
+CONFIG-y += CONFIG_SPARSE_BSS
+CONFIG-y += CONFIG_BLKFRONT
+CONFIG-y += CONFIG_NETFRONT
+CONFIG-y += CONFIG_FBFRONT
+CONFIG-y += CONFIG_KBDFRONT
+CONFIG-y += CONFIG_CONSFRONT
+CONFIG-y += CONFIG_XENBUS
+CONFIG-y += CONFIG_XC
+CONFIG-n += CONFIG_QEMU_XS_ARGS
+CONFIG-n += CONFIG_TEST
+CONFIG-n += CONFIG_PCIFRONT
+CONFIG-n += CONFIG_TPMFRONT
+CONFIG-n += CONFIG_TPM_TIS
+CONFIG-n += CONFIG_TPMBACK
+CONFIG-n += CONFIG_BALLOON
+# Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
+# console apart of standard dom0 handled console.
+CONFIG-n += CONFIG_USE_XEN_CONSOLE
 ifeq ($(TARGET_ARCH_FAM),x86)
-CONFIG_PARAVIRT ?= y
+CONFIG-y += CONFIG_PARAVIRT
 else
-CONFIG_PARAVIRT ?= n
+CONFIG-n += CONFIG_PARAVIRT
 endif
-CONFIG_START_NETWORK ?= y
-CONFIG_SPARSE_BSS ?= y
-CONFIG_QEMU_XS_ARGS ?= n
-CONFIG_TEST ?= n
-CONFIG_PCIFRONT ?= n
-CONFIG_BLKFRONT ?= y
-CONFIG_TPMFRONT ?= n
-CONFIG_TPM_TIS ?= n
-CONFIG_TPMBACK ?= n
-CONFIG_NETFRONT ?= y
-CONFIG_FBFRONT ?= y
-CONFIG_KBDFRONT ?= y
-CONFIG_CONSFRONT ?= y
-CONFIG_XENBUS ?= y
-CONFIG_XC ?=y
-CONFIG_LWIP ?= $(lwip)
-CONFIG_BALLOON ?= n
-# Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
-# console apart of standard dom0 handled console.
-CONFIG_USE_XEN_CONSOLE ?= n
+CONFIG-$(lwip) += CONFIG_LWIP
+
+$(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
+$(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
+
+CONFIG-all := $(CONFIG-y) $(CONFIG-n)
 
 # Export config items as compiler directives
-DEFINES-$(CONFIG_PARAVIRT) += -DCONFIG_PARAVIRT
-DEFINES-$(CONFIG_START_NETWORK) += -DCONFIG_START_NETWORK
-DEFINES-$(CONFIG_SPARSE_BSS) += -DCONFIG_SPARSE_BSS
-DEFINES-$(CONFIG_QEMU_XS_ARGS) += -DCONFIG_QEMU_XS_ARGS
-DEFINES-$(CONFIG_PCIFRONT) += -DCONFIG_PCIFRONT
-DEFINES-$(CONFIG_BLKFRONT) += -DCONFIG_BLKFRONT
-DEFINES-$(CONFIG_TPMFRONT) += -DCONFIG_TPMFRONT
-DEFINES-$(CONFIG_TPM_TIS) += -DCONFIG_TPM_TIS
-DEFINES-$(CONFIG_TPMBACK) += -DCONFIG_TPMBACK
-DEFINES-$(CONFIG_NETFRONT) += -DCONFIG_NETFRONT
-DEFINES-$(CONFIG_KBDFRONT) += -DCONFIG_KBDFRONT
-DEFINES-$(CONFIG_FBFRONT) += -DCONFIG_FBFRONT
-DEFINES-$(CONFIG_CONSFRONT) += -DCONFIG_CONSFRONT
-DEFINES-$(CONFIG_XENBUS) += -DCONFIG_XENBUS
-DEFINES-$(CONFIG_BALLOON) += -DCONFIG_BALLOON
-DEFINES-$(CONFIG_USE_XEN_CONSOLE) += -DCONFIG_USE_XEN_CONSOLE
+$(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
 
 DEFINES-y += -D__XEN_INTERFACE_VERSION__=$(XEN_INTERFACE_VERSION)
 
-- 
2.26.2


