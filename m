Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA01EA4DA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOh-00071P-89; Mon, 01 Jun 2020 13:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOg-00070X-3m
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:34 +0000
X-Inumbo-ID: e14aa228-a40a-11ea-8993-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e14aa228-a40a-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 13:22:02 +0000 (UTC)
IronPort-SDR: k2VvIlGHeuF5FHzawTp51swC4PNEusRm4BONrgxIy4XUSIsaVdm4B5QWKqUU3dwKOQqQwiyGkW
 OKZxsiPGsWJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:22:01 -0700
IronPort-SDR: H1aV+v7D8iqBCn+kOObTwwAklxRSIFRI2v89rHm0OiToMY/GQuN4Op2Uk9MAHvIs6P9uNmgRXf
 XwA23kt8+UuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887330"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:22:00 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 13/13] tools/xl: document fork-vm command
Date: Mon,  1 Jun 2020 06:21:47 -0700
Message-Id: <ec4931e5c3fb995514daf6f2c2cf261d6b15ec46.1591017086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591017086.git.tamas.lengyel@intel.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 docs/man/xl.1.pod.in | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 09339282e6..9e87b0314f 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -708,6 +708,45 @@ above).
 
 =back
 
+=item B<fork-vm> [I<OPTIONS>] I<domain-id>
+
+Create a fork of a running VM.  The domain will be paused after the operation
+and remains paused while forks of it exist.  Experimental and x86 only.
+Forks can only be made of domains with HAP enabled and on Intel hardware.  The
+parent domain must be created with the xl toolstack and its configuration must
+not manually define max_grant_frames, max_maptrack_frames or max_event_channels.
+
+B<OPTIONS>
+
+=over 4
+
+=item B<-p>
+
+Leave the forked VM paused after creating it.  The parent always remains paused
+while there are forks active from it and that's enforced by the hypervisor.
+
+=item B<--launch-dm>
+
+Specify whether the device model (QEMU) should be launched for the fork.  Late
+launch allows to start the device model for an already running fork previously
+created with "--launch-dm no".
+
+=item B<-C>
+
+The config file to use when launching the device model.  Currently required when
+launching the device model.  Most config settings MUST match the parent domain
+exactly, only change VM name, disk path and network configurations.
+
+=item B<-Q>
+
+The path to the QEMU save file to use when launching the device model.  Currently
+required when launching the device model.  Generate it by connecting to the parent
+domain's QMP socket and issuing:
+ { "execute": "qmp_capabilities" }
+ { "execute": "xen-save-devices-state", "arguments": { "filename": "/path/to/qemu.save", "live": false} }
+
+=back
+
 =item B<sharing> [I<domain-id>]
 
 Display the number of shared pages for a specified domain. If no domain is
-- 
2.25.1


