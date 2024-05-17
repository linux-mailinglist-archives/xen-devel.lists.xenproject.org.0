Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD378C87B8
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 16:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724258.1129525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7yCw-0005B9-EC; Fri, 17 May 2024 14:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724258.1129525; Fri, 17 May 2024 14:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7yCw-00059d-BT; Fri, 17 May 2024 14:05:14 +0000
Received: by outflank-mailman (input) for mailman id 724258;
 Fri, 17 May 2024 14:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4QDV=MU=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7yCu-000588-7G
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 14:05:12 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78a2b814-1456-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 16:05:10 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2E9C580078;
 Fri, 17 May 2024 15:05:09 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 0B1B42016C; Fri, 17 May 2024 15:05:09 +0100 (BST)
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
X-Inumbo-ID: 78a2b814-1456-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715954709;
	bh=+qr5UyGF5YNpfNX83c8/e3HXP91//GFe1wX1VW+GKEs=;
	h=From:To:Cc:Subject:Date:From;
	b=zs8Onk7phf+jj5p9jQIag1gJa7zOHNAyTN2FURnCxILN+OE6/TmSsRua6x6bAaGfF
	 R6qZ1JSdTaFC6kmeKG8UYaOw9+MEjZB/FbC27gManqm0oRvJ4GyBDHnLg9HBSBan+R
	 wSQRya7kmp58WG/jRv98nVQ9Iwa49wkJmgmBtd3Y=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v4 0/2] Finalise bridge VLAN support
Date: Fri, 17 May 2024 15:05:04 +0100
Message-Id: <20240517140506.8460-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The first two patches have been merged so this version has the remaining
two. Only the first of these two patches has changed since v3.

Summary of changes from v3 to v4:
- Drop merged patches.
- _vif_vlan_setup: Add comment that we delete vid 1 due to it being
  automatically added.
- _vif_vlan_setup: Restructure to avoid using eval and simplify.
- _vif_vlan_membership: Add comment that we remove trailing spaces due
  to readarray behaviour and change the code to do it only on the last
  element of the array, prior to entering the loop.
- _vif_vlan_membership: Simplify the loop iterating through terms.

Regards,

Leigh.

---

Leigh Brown (2):
  tools/hotplug/Linux: Add bridge VLAN support
  tools/examples: Example Linux bridge VLAN config

 docs/misc/linux-bridge-vlan/README         |  68 +++++++++++++
 docs/misc/linux-bridge-vlan/br0.netdev     |   7 ++
 docs/misc/linux-bridge-vlan/br0.network    |   8 ++
 docs/misc/linux-bridge-vlan/enp0s0.network |  16 +++
 tools/hotplug/Linux/xen-network-common.sh  | 109 +++++++++++++++++++++
 5 files changed, 208 insertions(+)
 create mode 100644 docs/misc/linux-bridge-vlan/README
 create mode 100644 docs/misc/linux-bridge-vlan/br0.netdev
 create mode 100644 docs/misc/linux-bridge-vlan/br0.network
 create mode 100644 docs/misc/linux-bridge-vlan/enp0s0.network

-- 
2.39.2


