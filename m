Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9973A233947
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1EY3-0003pE-Mx; Thu, 30 Jul 2020 19:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1EY2-0003p9-44
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:49:02 +0000
X-Inumbo-ID: b73ccbb6-d29d-11ea-8dc5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b73ccbb6-d29d-11ea-8dc5-bc764e2007e4;
 Thu, 30 Jul 2020 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PZ8lbk66NMZFhcqCNLy0A0GihyZxJjuJBPFA0eXIoLI=; b=WL+RBSoci0h3L6nuZjOJpCZ9GF
 uRiXJdh04YGDQYVyWuvL+9tiCI8I0GqbF2WdPTHCgOV0wlNzZfcPM1k7U1zxyhhzpJe2qKNLMABWN
 4wASWkQ+kybALla91Ww50QCxX74ak62qaaaLtKUKteSwN5mtwwcRWHYafhzbu1X3D/W0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY1-0001Ka-7k; Thu, 30 Jul 2020 19:49:01 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1EY0-0004CS-V5; Thu, 30 Jul 2020 19:49:01 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/4] tools: propagate bridge MTU to vif frontends
Date: Thu, 30 Jul 2020 20:48:54 +0100
Message-Id: <20200730194858.28523-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This is long missing functionality

Paul Durrant (4):
  tools/hotplug: add remove_from_bridge() and improve debug output
  tools/hotplug: combine add/online and remove/offline in vif-bridge...
  public/io/netif: specify MTU override node
  tools/hotplug: modify set_mtu() to inform the frontend via xenstore

 tools/hotplug/Linux/vif-bridge            | 20 +++------
 tools/hotplug/Linux/xen-network-common.sh | 51 +++++++++++++++++++----
 xen/include/public/io/netif.h             | 12 ++++++
 3 files changed, 60 insertions(+), 23 deletions(-)

-- 
2.20.1


