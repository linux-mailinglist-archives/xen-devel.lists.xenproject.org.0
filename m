Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644712F1D0B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65226.115606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KX-0006n6-Hj; Mon, 11 Jan 2021 17:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65226.115606; Mon, 11 Jan 2021 17:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KX-0006mO-Bc; Mon, 11 Jan 2021 17:50:13 +0000
Received: by outflank-mailman (input) for mailman id 65226;
 Mon, 11 Jan 2021 17:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1El-0002a6-2L
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:15 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f70bf9f9-9d01-4a63-8e9f-ede50b08e041;
 Mon, 11 Jan 2021 17:42:44 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgTM3L
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:29 +0100 (CET)
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
X-Inumbo-ID: f70bf9f9-9d01-4a63-8e9f-ede50b08e041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386963;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=ti8CP/B9G6c5O+6wVpkEtLXEkgdKGjEhZREHyWZEFow=;
	b=GJjK49Yxqzkp6Pa1bPTpZFKFPvIUhTkTLoiBosEA+KkR77qS9jgqS6CLIBakywferL
	piGWxY4ughtnGl3Cxf9UTmpkoj2sRywPTynxx04NilIyukGNgvL0s43zi/V+BbXnh1Xp
	B4CAEsv8AiACDk98ZxbtVft716+avmcB09bELpqrUuHoA7bferUxlibQqLW/nA+4m3P/
	wIIeQy61dYJ9/EAVgpiS7t39a5XbX6JnHFSu9AuJ0F+R1nAY4K+E4tb+N8xEMURhLe/j
	RH6mSgPeelAdExsj7zf5z4JS6JTYu+vvnm8NiUA1i3ZFpr899rjsRAjqdON4rdPlV7Rq
	BjSg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 06/39] Use XEN_SCRIPT_DIR to refer to /etc/xen/scripts
Date: Mon, 11 Jan 2021 18:41:51 +0100
Message-Id: <20210111174224.24714-7-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all hardcoded paths to use XEN_SCRIPT_DIR to expand the actual location.

Update .gitignore.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 .gitignore                                                  | 3 +++
 docs/configure.ac                                           | 3 +++
 ...k-configuration.5.pod => xl-disk-configuration.5.pod.in} | 2 +-
 ...onfiguration.5.pod => xl-network-configuration.5.pod.in} | 4 ++--
 docs/man/xl.1.pod.in                                        | 2 +-
 docs/man/{xl.conf.5.pod => xl.conf.5.pod.in}                | 6 +++---
 docs/misc/block-scripts.txt                                 | 2 +-
 tools/xl/xl_cmdtable.c                                      | 2 +-
 8 files changed, 15 insertions(+), 9 deletions(-)
 rename docs/man/{xl-disk-configuration.5.pod => xl-disk-configuration.5.pod.in} (99%)
 rename docs/man/{xl-network-configuration.5.pod => xl-network-configuration.5.pod.in} (98%)
 rename docs/man/{xl.conf.5.pod => xl.conf.5.pod.in} (97%)

diff --git a/.gitignore b/.gitignore
index b169d78ed7..76c13f3189 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,7 +48,10 @@ dist/*
 docs/tmp.*
 docs/html/
 docs/man/xl.cfg.5.pod
+docs/man/xl-disk-configuration.5.pod
+docs/man/xl-network-configuration.5.pod
 docs/man/xl.1.pod
+docs/man/xl.conf.5.pod
 docs/man1/
 docs/man5/
 docs/man7/
diff --git a/docs/configure.ac b/docs/configure.ac
index cb5a6eaa4c..c2e5edd3b3 100644
--- a/docs/configure.ac
+++ b/docs/configure.ac
@@ -9,6 +9,9 @@ AC_CONFIG_FILES([
 ../config/Docs.mk
 man/xl.cfg.5.pod
 man/xl.1.pod
+man/xl-disk-configuration.5.pod
+man/xl-network-configuration.5.pod
+man/xl.conf.5.pod
 ])
 AC_CONFIG_AUX_DIR([../])
 
diff --git a/docs/man/xl-disk-configuration.5.pod b/docs/man/xl-disk-configuration.5.pod.in
similarity index 99%
rename from docs/man/xl-disk-configuration.5.pod
rename to docs/man/xl-disk-configuration.5.pod.in
index 46feedb95e..71d0e86e3d 100644
--- a/docs/man/xl-disk-configuration.5.pod
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -257,7 +257,7 @@ automatically determine the most suitable backend.
 
 Specifies that B<target> is not a normal host path, but rather
 information to be interpreted by the executable program I<SCRIPT>,
-(looked for in F</etc/xen/scripts>, if it doesn't contain a slash).
+(looked for in F<@XEN_SCRIPT_DIR@>, if it doesn't contain a slash).
 
 These scripts are normally called "block-I<SCRIPT>".
 
diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod.in
similarity index 98%
rename from docs/man/xl-network-configuration.5.pod
rename to docs/man/xl-network-configuration.5.pod.in
index af058d4d3c..be8c7313aa 100644
--- a/docs/man/xl-network-configuration.5.pod
+++ b/docs/man/xl-network-configuration.5.pod.in
@@ -169,8 +169,8 @@ number. Likewise the default tap name is C<vifDOMID.DEVID-emu>.
 
 Specifies the hotplug script to run to configure this device (e.g. to
 add it to the relevant bridge). Defaults to
-C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
-scripts are installed in C<XEN_SCRIPT_DIR>.
+C<@XEN_SCRIPT_DIR@/vif-bridge> but can be set to any script. Some example
+scripts are installed in C<@XEN_SCRIPT_DIR@>.
 
 
 =head2 ip
diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 765c169ed2..df98adc9e4 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -571,7 +571,7 @@ See the corresponding option of the I<create> subcommand.
 =item B<-N> I<netbufscript>
 
 Use <netbufscript> to setup network buffering instead of the
-default script (/etc/xen/scripts/remus-netbuf-setup).
+default script (@XEN_SCRIPT_DIR@/remus-netbuf-setup).
 
 =item B<-F>
 
diff --git a/docs/man/xl.conf.5.pod b/docs/man/xl.conf.5.pod.in
similarity index 97%
rename from docs/man/xl.conf.5.pod
rename to docs/man/xl.conf.5.pod.in
index dfea9d64ba..b48e99131a 100644
--- a/docs/man/xl.conf.5.pod
+++ b/docs/man/xl.conf.5.pod.in
@@ -107,7 +107,7 @@ Configures the default hotplug script used by virtual network devices.
 
 The old B<vifscript> option is deprecated and should not be used.
 
-Default: C</etc/xen/scripts/vif-bridge>
+Default: C<@XEN_SCRIPT_DIR@/vif-bridge>
 
 =item B<vif.default.bridge="NAME">
 
@@ -133,13 +133,13 @@ Default: C<None>
 
 Configures the default script used by Remus to setup network buffering.
 
-Default: C</etc/xen/scripts/remus-netbuf-setup>
+Default: C<@XEN_SCRIPT_DIR@/remus-netbuf-setup>
 
 =item B<colo.default.proxyscript="PATH">
 
 Configures the default script used by COLO to setup colo-proxy.
 
-Default: C</etc/xen/scripts/colo-proxy-setup>
+Default: C<@XEN_SCRIPT_DIR@/colo-proxy-setup>
 
 =item B<output_format="json|sxp">
 
diff --git a/docs/misc/block-scripts.txt b/docs/misc/block-scripts.txt
index eabab100a8..8020787a52 100644
--- a/docs/misc/block-scripts.txt
+++ b/docs/misc/block-scripts.txt
@@ -18,7 +18,7 @@ Setup
 
 It is highly recommended that custom hotplug scripts as much as
 possible include and use the common Xen functionality.  If the script
-is run from the normal block script location (/etc/xen/scripts by
+is run from the normal block script location (/usr/lib/xen/scripts by
 default), then this can be done by adding the following to the top of
 the script:
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 6ab5e47da3..37710880d3 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -521,7 +521,7 @@ struct cmd_spec cmd_table[] = {
       "-e                      Do not wait in the background (on <host>) for the death\n"
       "                        of the domain.\n"
       "-N <netbufscript>       Use netbufscript to setup network buffering instead of the\n"
-      "                        default script (/etc/xen/scripts/remus-netbuf-setup).\n"
+      "                        default script (" XEN_SCRIPT_DIR "/remus-netbuf-setup).\n"
       "-F                      Enable unsafe configurations [-b|-n|-d flags]. Use this option\n"
       "                        with caution as failover may not work as intended.\n"
       "-b                      Replicate memory checkpoints to /dev/null (blackhole).\n"

