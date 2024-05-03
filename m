Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9CC8BAF23
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716520.1118688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002iP-UC; Fri, 03 May 2024 14:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716520.1118688; Fri, 03 May 2024 14:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002ZN-Pa; Fri, 03 May 2024 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 716520;
 Fri, 03 May 2024 14:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QA1=MG=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s2u6b-0002U7-Je
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:41:45 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cc299f-095b-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 16:41:42 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id D1DED80064;
 Fri,  3 May 2024 15:41:41 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id A727620175; Fri,  3 May 2024 15:41:41 +0100 (BST)
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
X-Inumbo-ID: 41cc299f-095b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1714747301;
	bh=cdGs513PBK2hbMNX29q5EIK8D//y8QcA4L1hJTCLoOY=;
	h=From:To:Cc:Subject:Date:From;
	b=FbAE+OGdlIjs0P/Qwc1fwKPXRjmbs8YQScxXKVL6jX3GhnArzk7Y/sZZKmVaVT0rB
	 lK8DB5qhRGmwcLsmO5quYE88nRad6WZYyeRDiU45JIJ9RultUG7dYBcuCP0d+RFexy
	 WuxpqEEEVTvNzQXwEdyFOxuKKqVyHfXhY0NHZCo4=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH 0/5] Add bridge VLAN support
Date: Fri,  3 May 2024 15:41:19 +0100
Message-Id: <20240503144124.12931-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For many years I have been configuring VLANs on my Linux Dom0 by
creating VLAN interfaces for each VLAN I wanted to connect a domain
to and then a corresponding bridge. So I would tend to have things
like:

enp0s0	  -> br0     -> vif1, vif2
enp0s0.10 -> br0vl10 -> vif3, vif4
enp0s0.20 -> br0vl20 -> vif5
dummy0    -> br1     -> vif6

I recently discovered that iproute2 supports creating bridge VLANs that
allows you to assign a VLAN to each of the interfaces associated to a 
bridge. This allows a greatly simplified configuration where a single 
bridge can support all the domains, and the iproute2 bridge command can 
assign each VIF to the required VLAN.  This looks like this:

# bridge vlan
port              vlan-id  
enp0s0            1 PVID Egress Untagged
                  10
                  20
br0               1 PVID Egress Untagged
vif1.0            1 PVID Egress Untagged
vif2.0            10 PVID Egress Untagged
vif3.0            10 PVID Egress Untagged
vif4.0            20 PVID Egress Untagged
vif5.0            20 PVID Egress Untagged
vif6.0            30 PVID Egress Untagged

This patch set enables this capability as follows:

1. Adds `vid' as a new member of the libxl_device_nic structure;
2. Adds support to read and write vid from the xenstore;
3. Adds `vid' as a new keyword for the vif configuration option;
4. Adds support for assign the bridge VLAN in the Linux hotplug scripts.

I don't believe NetBSD or FreeBSD support this capability, but if they
do please point me in the direction of some documentation and/or examples.

NB: I'm not very familiar with Xen code base so may have missed
something important, although I have tested it and it is working well
for me.

Cheers,

Leigh.


leigh@solinno.co.uk (5):
  tools/libs/light: Add vid field to libxl_device_nic
  tools/xl: add vid keyword vif option
  tools/hotplug/Linux: Add bridge VLAN support
  docs/man: document VIF vid keyword
  tools/examples: Examples Linux bridge VLAN config

 docs/man/xl-network-configuration.5.pod.in    |  6 +++
 tools/examples/linux-bridge-vlan/README       | 52 +++++++++++++++++++
 tools/examples/linux-bridge-vlan/br0.netdev   |  7 +++
 tools/examples/linux-bridge-vlan/br0.network  |  8 +++
 .../examples/linux-bridge-vlan/enp0s0.network | 16 ++++++
 tools/hotplug/Linux/xen-network-common.sh     |  9 ++++
 tools/libs/light/libxl_nic.c                  | 20 +++++++
 tools/libs/light/libxl_types.idl              |  1 +
 tools/xl/xl_parse.c                           |  2 +
 9 files changed, 121 insertions(+)
 create mode 100644 tools/examples/linux-bridge-vlan/README
 create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
 create mode 100644 tools/examples/linux-bridge-vlan/br0.network
 create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network

-- 
2.39.2


