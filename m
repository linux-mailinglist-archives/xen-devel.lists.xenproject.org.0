Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035998C87B7
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 16:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724260.1129541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7yCz-0005UP-UK; Fri, 17 May 2024 14:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724260.1129541; Fri, 17 May 2024 14:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7yCz-0005QU-Pe; Fri, 17 May 2024 14:05:17 +0000
Received: by outflank-mailman (input) for mailman id 724260;
 Fri, 17 May 2024 14:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4QDV=MU=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7yCy-0005Nn-5R
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 14:05:16 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b1f8177-1456-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 16:05:13 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 973458009E;
 Fri, 17 May 2024 15:05:13 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 73F292016C; Fri, 17 May 2024 15:05:13 +0100 (BST)
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
X-Inumbo-ID: 7b1f8177-1456-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715954713;
	bh=/lU9yTgpboEAtXceuLIDss8GmkMWmz9roeXA4WqyFzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeKEDUoIMtzl6EmCLfeTsvLFR1NFFx/nn7+0tUmg9kju+CjdEemopvyXefryc4FMl
	 su7fEiYrJwChL/JFX0lWVeUIKsHNZ5wANkxs231xIFyMDEm6kc4MIp+AsFEWMaZXly
	 +U3HhyoLjmizKmeW90iB0eVdtkpKTqMmwUMgnAN0=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v4 2/2] tools/examples: Example Linux bridge VLAN config
Date: Fri, 17 May 2024 15:05:06 +0100
Message-Id: <20240517140506.8460-3-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240517140506.8460-1-leigh@solinno.co.uk>
References: <20240517140506.8460-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new directory linux-bridge-vlan with example files showing
how to configure systemd-networkd to support a bridge VLAN
configuration.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 docs/misc/linux-bridge-vlan/README         | 68 ++++++++++++++++++++++
 docs/misc/linux-bridge-vlan/br0.netdev     |  7 +++
 docs/misc/linux-bridge-vlan/br0.network    |  8 +++
 docs/misc/linux-bridge-vlan/enp0s0.network | 16 +++++
 4 files changed, 99 insertions(+)
 create mode 100644 docs/misc/linux-bridge-vlan/README
 create mode 100644 docs/misc/linux-bridge-vlan/br0.netdev
 create mode 100644 docs/misc/linux-bridge-vlan/br0.network
 create mode 100644 docs/misc/linux-bridge-vlan/enp0s0.network

diff --git a/docs/misc/linux-bridge-vlan/README b/docs/misc/linux-bridge-vlan/README
new file mode 100644
index 0000000000..9a048bca39
--- /dev/null
+++ b/docs/misc/linux-bridge-vlan/README
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
+   is also a [BridgeVLAN] section for each VLAN allowed on the external
+   interface. Note, if you want to create an internal VLAN private to the
+   host, do not include its VLAN ID in this file.
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
+        'max=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=20' ]
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
diff --git a/docs/misc/linux-bridge-vlan/br0.netdev b/docs/misc/linux-bridge-vlan/br0.netdev
new file mode 100644
index 0000000000..ae1fe487c3
--- /dev/null
+++ b/docs/misc/linux-bridge-vlan/br0.netdev
@@ -0,0 +1,7 @@
+[NetDev]
+Name=br0
+Kind=bridge
+MACAddress=xx:xx:xx:xx:xx:xx
+
+[Bridge]
+VLANFiltering=on
diff --git a/docs/misc/linux-bridge-vlan/br0.network b/docs/misc/linux-bridge-vlan/br0.network
new file mode 100644
index 0000000000..b56203b66a
--- /dev/null
+++ b/docs/misc/linux-bridge-vlan/br0.network
@@ -0,0 +1,8 @@
+[Match]
+Name=br0
+
+[Network]
+DNS=8.8.8.8
+#Domains=example.com
+Address=10.1.1.10/24
+Gateway=10.1.1.1
diff --git a/docs/misc/linux-bridge-vlan/enp0s0.network b/docs/misc/linux-bridge-vlan/enp0s0.network
new file mode 100644
index 0000000000..6ee3154dfc
--- /dev/null
+++ b/docs/misc/linux-bridge-vlan/enp0s0.network
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


