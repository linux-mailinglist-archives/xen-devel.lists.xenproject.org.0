Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7E8C74E9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723123.1127679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ymw-0007dL-3a; Thu, 16 May 2024 10:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723123.1127679; Thu, 16 May 2024 10:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ymw-0007ba-0d; Thu, 16 May 2024 10:56:42 +0000
Received: by outflank-mailman (input) for mailman id 723123;
 Thu, 16 May 2024 10:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujgU=MT=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7Ymu-0007XN-3m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:56:40 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7bf26b8-1372-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:56:39 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2ADF580079;
 Thu, 16 May 2024 11:56:37 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 0717220189; Thu, 16 May 2024 11:56:37 +0100 (BST)
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
X-Inumbo-ID: f7bf26b8-1372-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715856997;
	bh=LkdaObEdft/zf4OSzmj6Efknxagk941/qBlw5l8npDY=;
	h=From:To:Cc:Subject:Date:From;
	b=DfPwOGuyitd8UeDM6qs0VoU3k1rZHEqjkWf2+vXMiuHfTv/SvV3TYz25OsJwS0+Jl
	 UVGDa4lB98HBximp0AYEvue5X6jrWRbTDKYYnyFu49iKpia9zcK8cIhqJGNtXnFDvc
	 LYyQpvmmeTGq382c0pmBosp6SaBeg8ECRMwl5n/0=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 0/4] Add bridge VLAN support
Date: Thu, 16 May 2024 11:56:08 +0100
Message-Id: <20240516105612.15306-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello All,

I have addressed all the feedback from Jason and merged patch 4 and 2 as
requested by Andrew.

Summary of changes from RFC v2 to v3:

- xen-network-common.sh: use fatal() directly instead of $error variable
- xen-network-common.sh: bridge command not being available is now fatal
- Move examples to docs/misc/linux-bridge-vlan
- README: Make explanation of [BridgeVLAN] section clearer
- Use spaces consistently for indentation
- Merge previous patch 2 and 4 into a single patch 2


Blurb for RFC v2:

I realised over the weekend that there is a valid use case for providing
a VIF to a domain that has access to multiple VLANs, e.g. a router. Yes,
you can create a VIF per VLAN, but if you start having several VLANs (as
I do), it would be nicer to create a single interface that has access to
all the relevant VLANs (e.g. enX0.10, enX0.20, etc.).

So, version 2 changes the name and type of the parameter from an integer
called `vid' to a string called `vlan'. The vlan parameter is then
parsed by the vif-bridge script (actually, the functions called by it in
xen-network-common.sh).

As it quite a common practice to allocate VLANs in round numbers, I also
implemented the ability to specify contiguous or non-contiguous ranges.
You can specify whether a VLAN is tagged or untagged, and which VLAN is
the PVID (only one PVID is allowed).  For example,

vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10p/20-29' ]

will setup the VIF so that 10 is the PVID and VLAN IDs 20 through 29
are permitted with tags. Another example:

vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=1p/10+10x9' ]

will setup the bridge to set 1 as the PVID and permit access with
tags for VLAN IDs 10, 20, 30, 40, 50, 60, 70, 80 and 90.

This patch set enables this capability as follows:

1. Adds `vlan' as a new member of the libxl_device_nic structure;
2. Adds support to read and write the vlan parameter from the xenstore;
3. Adds `vlan' as a new keyword for the vif configuration option;
4. Adds support to assign the bridge VLANs in the Linux hotplug scripts;
5. Updated xl-network-configuration(5) manpage and example configs.


Original blurb below:

For many years I have been configuring VLANs on my Linux Dom0 by
creating VLAN interfaces for each VLAN I wanted to connect a domain
to and then a corresponding bridge. So I would tend to have things
like:

enp0s0    -> br0     -> vif1, vif2
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
vif2.0            1 PVID Egress Untagged
vif3.0            10 PVID Egress Untagged
vif4.0            10 PVID Egress Untagged
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

-- 

Leigh Brown (4):
  tools/libs/light: Add vlan field to libxl_device_nic
  tools/xl: add vlan keyword to vif option
  Update add_to_bridge shell function to read the vlan parameter from
    xenstore and set the bridge VLAN configuration for the VID.
  tools/examples: Example Linux bridge VLAN config

 docs/man/xl-network-configuration.5.pod.in |  38 ++++++++
 docs/misc/linux-bridge-vlan/README         |  68 ++++++++++++++
 docs/misc/linux-bridge-vlan/br0.netdev     |   7 ++
 docs/misc/linux-bridge-vlan/br0.network    |   8 ++
 docs/misc/linux-bridge-vlan/enp0s0.network |  16 ++++
 tools/hotplug/Linux/xen-network-common.sh  | 103 +++++++++++++++++++++
 tools/libs/light/libxl_nic.c               |  10 ++
 tools/libs/light/libxl_types.idl           |   1 +
 tools/xl/xl_parse.c                        |   2 +
 9 files changed, 253 insertions(+)
 create mode 100644 docs/misc/linux-bridge-vlan/README
 create mode 100644 docs/misc/linux-bridge-vlan/br0.netdev
 create mode 100644 docs/misc/linux-bridge-vlan/br0.network
 create mode 100644 docs/misc/linux-bridge-vlan/enp0s0.network

-- 
2.39.2


