Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F62417D3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEX-0003tZ-9p; Tue, 11 Aug 2020 08:02:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEV-0003tU-Lt
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:07 +0000
X-Inumbo-ID: 453e3899-8766-4964-9a98-ad2a79907b3f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 453e3899-8766-4964-9a98-ad2a79907b3f;
 Tue, 11 Aug 2020 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TkZYeQpgUd1FHivM4BUwJruERlVtCbxqKit7za38K4g=; b=1mKHLl9jkpGw4pWY8y+LeIhSGW
 K+P0ujz0Kmyf1mgUg1U/H1wFFJ34f7AuN0lWFDDAEuWX9oKq7sYy/t1iY+dSEKTTp4yhApKfYmjdP
 cC1YQ7bpWqZXd/hLNrrbytAVLpMWHfVr5/CiclgmPy8ZHIBmN8ywTbF36+ZeV8hdlyl8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PET-0003uU-Vr; Tue, 11 Aug 2020 08:02:05 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PET-0000k5-LC; Tue, 11 Aug 2020 08:02:05 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/8] tools: propogate MTU to vif frontends
Date: Tue, 11 Aug 2020 09:01:54 +0100
Message-Id: <20200811080202.31163-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This is an expansion from v2 of the series to include the facility to set
the MTU in the vif config.

There is also one cleanup patch to remove the defunct 'vif2' script.

Paul Durrant (8):
  public/io/netif: specify MTU override node
  tools/hotplug/Linux: re-factor add_to_bridge() in
    xen-network-common.sh
  tools/hotplug/Linux: add remove_from_bridge()
  tools/hotplug/Linux: remove code duplication in vif-bridge
  libxl: wire the libxl_device_nic 'mtu' value into xenstore
  tools/hotplug/Linux: modify set_mtu() to optionally use a configured
    value...
  xl: add 'mtu' option to network configuration
  remove netchannel2 hotplug script... ancient history

 docs/man/xl-network-configuration.5.pod   |  6 +++
 docs/misc/xenstore-paths.pandoc           |  3 ++
 tools/hotplug/Linux/Makefile              |  1 -
 tools/hotplug/Linux/vif-bridge            | 20 +++----
 tools/hotplug/Linux/vif2                  | 54 -------------------
 tools/hotplug/Linux/xen-network-common.sh | 65 +++++++++++++++++++----
 tools/libxl/libxl_nic.c                   | 27 +++++++++-
 tools/xl/xl_cmdtable.c                    |  2 +-
 tools/xl/xl_parse.c                       |  2 +
 xen/include/public/io/netif.h             | 12 +++++
 10 files changed, 110 insertions(+), 82 deletions(-)
 delete mode 100644 tools/hotplug/Linux/vif2
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


