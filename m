Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C98C065A
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718970.1121591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0D-0004zv-TE; Wed, 08 May 2024 21:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718970.1121591; Wed, 08 May 2024 21:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0D-0004uc-Nx; Wed, 08 May 2024 21:39:05 +0000
Received: by outflank-mailman (input) for mailman id 718970;
 Wed, 08 May 2024 21:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nd4S=ML=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s4p0C-00044I-AS
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:39:04 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612663b5-0d83-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 23:38:59 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2D09B800A5;
 Wed,  8 May 2024 22:38:59 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 06DB42017F; Wed,  8 May 2024 22:38:59 +0100 (BST)
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
X-Inumbo-ID: 612663b5-0d83-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715204339;
	bh=bIUl73UyV+ayA8Z1TZOYtaBLcFb3iD439KxaXODeE/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCaiftnLTPj7TR5XUPM/tF9fgWEtaFVpTkhb0aVmdLKPFmotpT+z0OUNDZ6adEaJH
	 BRybjeI8ofZSoM9mirE/VKFFGGaAQpuDnFRHbHNuoOBv8451uLn/TJ5aXsnRDk6Snq
	 wNxjXBZTaPN67mOpMMWl9GfeWbfVsyeLBx2I9Fkg=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH v2 5/5] tools/examples: Example Linux bridge VLAN config
Date: Wed,  8 May 2024 22:38:24 +0100
Message-Id: <20240508213824.55824-6-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508213824.55824-1-leigh@solinno.co.uk>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new directory linux-bridge-vlan with examples files showing
how to configure systemd-networkd to support a bridge VLAN
configuration.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/examples/linux-bridge-vlan/README       | 68 +++++++++++++++++++
 tools/examples/linux-bridge-vlan/br0.netdev   |  7 ++
 tools/examples/linux-bridge-vlan/br0.network  |  8 +++
 .../examples/linux-bridge-vlan/enp0s0.network | 16 +++++
 4 files changed, 99 insertions(+)
 create mode 100644 tools/examples/linux-bridge-vlan/README
 create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
 create mode 100644 tools/examples/linux-bridge-vlan/br0.network
 create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network

diff --git a/tools/examples/linux-bridge-vlan/README b/tools/examples/linux-bridge-vlan/README
new file mode 100644
index 0000000000..83b9fa3fd6
--- /dev/null
+++ b/tools/examples/linux-bridge-vlan/README
@@ -0,0 +1,68 @@
+Linux Xen Dom0 single bridge multiple VLAN configuration with systemd
+=====================================================================
+
+Introduction
+------------
+
+This directory contains example files to be placed in /etc/systemd/network
+to enable a single bridge with multiple VLAN support.
+
+The example is to support the scenario where the Xen host network interface
+is connected to an Ethernet switch configured as a trunk port. Each domain
+VIF can then be configured with one or more VLAN IDs, one of which will be
+the PVID.
+
+The example files create a bridge device called br0, with a physical interface 
+called enp0s0. You will need to update this with your system's device name.
+
+Key points of the configuration are:
+
+1. In br0.netdev, VLANFiltering=on is set. This is required to ensure the
+   VLAN tags are handled correctly.  If it is not set then the packets
+   from the VIF interfaces will not have the correct VLAN tags set.
+
+2. In br0.network, a system IPv4 address is configured that can be updated
+   according to your local network settings.
+
+3. In enp0s0.network, Bridge=br0 sets the bridge device to connect to. There
+   is also a [BridgeVLAN] section for each VLAN you want to give access
+   to the switch. Note, if you want to create an internal VLAN private to
+   the host, do not include its VLAN ID in this file.
+
+
+Domain configuration
+--------------------
+
+Add the vlan= keyword to the vif definition in the domain. The simplest
+and most common example is a domain that wishes to connect to a single VLAN:
+
+vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10' ]
+
+If you wish to configure a domain to route between two VLANs, you have two
+options. Option 1 is to create multiple interfaces on different VLANs:
+
+vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10',
+	'max=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=20' ]
+
+Alternatively, you can create single interface:
+
+vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10p/20' ]
+
+In the domain, you would, for example, use enX0 for VLAN 10 and enX0.20 for 
+VLAN 20.
+
+
+Hints and tips
+--------------
+
+You can run the following commands on dom0 or a driver domain:
+
+1. To check if vlan_filtering is enabled:
+   # cat /sys/devices/virtual/net/<name>/bridge/vlan_filtering
+
+2. To check the bridge port VLAN assignments:
+   # bridge vlan
+
+3. To check the vlan setting in the xenstore (dom0 only):
+   # xenstore-ls -f | grep 'vlan ='
+
diff --git a/tools/examples/linux-bridge-vlan/br0.netdev b/tools/examples/linux-bridge-vlan/br0.netdev
new file mode 100644
index 0000000000..ae1fe487c3
--- /dev/null
+++ b/tools/examples/linux-bridge-vlan/br0.netdev
@@ -0,0 +1,7 @@
+[NetDev]
+Name=br0
+Kind=bridge
+MACAddress=xx:xx:xx:xx:xx:xx
+
+[Bridge]
+VLANFiltering=on
diff --git a/tools/examples/linux-bridge-vlan/br0.network b/tools/examples/linux-bridge-vlan/br0.network
new file mode 100644
index 0000000000..b56203b66a
--- /dev/null
+++ b/tools/examples/linux-bridge-vlan/br0.network
@@ -0,0 +1,8 @@
+[Match]
+Name=br0
+
+[Network]
+DNS=8.8.8.8
+#Domains=example.com
+Address=10.1.1.10/24
+Gateway=10.1.1.1
diff --git a/tools/examples/linux-bridge-vlan/enp0s0.network b/tools/examples/linux-bridge-vlan/enp0s0.network
new file mode 100644
index 0000000000..6ee3154dfc
--- /dev/null
+++ b/tools/examples/linux-bridge-vlan/enp0s0.network
@@ -0,0 +1,16 @@
+[Match]
+Name=enp0s0
+
+[Network]
+Bridge=br0
+
+# If Jumbo frames are required
+#[Link]
+#MTUBytes=9000
+
+[BridgeVLAN]
+VLAN=10
+
+[BridgeVLAN]
+VLAN=20
+
-- 
2.39.2


