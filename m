Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE925DEE3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 18:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEE8t-0004Lr-D4; Fri, 04 Sep 2020 16:00:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9O1=CN=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kEE8r-0004Lm-Fu
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:00:45 +0000
X-Inumbo-ID: aa541a22-18fe-47c9-b2ff-7859cef009cd
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa541a22-18fe-47c9-b2ff-7859cef009cd;
 Fri, 04 Sep 2020 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=PfjE2CARQ43l9ToWqn45hv2yhOg6NowQXb3kRhskSdw=; b=wl6DEK/79isF1sPcaofVrIn/a+
 NyYN5E2yVtrpa4neZrMuqEzSkz/rpa6dHSQKpbPTthVmXmGVuEDidpuou2ENl8T8x5CaHVx4yRrwh
 X4k+a3qu4M294nS/GFEfGmgSPaW4vQV9c6TUwbNm7Jo4hQStI4MdGwq9b/ZEgj2vBwFo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kEE8q-0000gZ-3P
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:00:44 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kEE8p-0002Eo-WB
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 16:00:44 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kEE8o-0008MM-5M; Fri, 04 Sep 2020 17:00:42 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] minios: Revert recent change and revert to working minios
Date: Fri,  4 Sep 2020 17:00:34 +0100
Message-Id: <20200904160034.11456-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently, xen.git#staging does not build in many environments because
of issues with minios master.  This regression was introduced in an
uncontrolled manner by an update to mini-os.git#master.

This is because in e013e8514389 "config: use mini-os master for
unstable" we switched to tracking minios master in an uncontrolled
manner.  At the time we thought it was unlikely that minios changes
would break the Xen build.  This turns out to have been overly
optimistic.

Xen currently uses unstable internal interfaces of minios.  Until this
can be sorted out, internal changes to minios can require lockstep
changes in Xen.

All this means that "config: use mini-os master for unstable" was
wrong.  We should undo it.  Instead, we go back to the previous
situation: xen.git names a specific minios commit.

This scheme is the model used for qemu-xen-traditional.

That nailed commit must be updated manually, to have xen.git pick up
changes from minios.  If the minios changes require changes in xen.git
too, to avoid breaking the Xen build, they can be made freely in
minios without adverse consequences.  When the minios commitid is
updated in xen.git, the corresponding changes to the actual source
files in xen.git should be bundled together.

For example, when minios is fixed, 8d990807ec2c "stubdom/grub: update
init_netfront() call for mini-os" will need to be reapplied, folded
into the same commit as updates MINIOS_UPSTREAM_REVISION.  For now
that commit must be reverted as we are going back to a previous
version of minios.

This reverts commit 8d990807ec2cde3061222a5ed2df62aba78bace9.
This reverts commit e013e8514389b739153016349e49f5a78e34ddf0.

CC: Jan Beulich <jbeulich@suse.com>
CC: Costin Lupu <costin.lupu@cs.pub.ro>
CC: Wei Liu <wl@xen.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Config.mk              | 2 +-
 stubdom/grub/mini-os.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 8269503f73..db434ee2c6 100644
--- a/Config.mk
+++ b/Config.mk
@@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
 OVMF_UPSTREAM_REVISION ?= a3741780fe3535e19e02efa869a7cac481891129
 QEMU_UPSTREAM_REVISION ?= master
-MINIOS_UPSTREAM_REVISION ?= master
+MINIOS_UPSTREAM_REVISION ?= 0b4b7897e08b967a09bed2028a79fabff82342dd
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
 
diff --git a/stubdom/grub/mini-os.c b/stubdom/grub/mini-os.c
index b33dbf02fb..4fc052a255 100644
--- a/stubdom/grub/mini-os.c
+++ b/stubdom/grub/mini-os.c
@@ -291,6 +291,8 @@ struct netfront_dev *net_dev;
 int
 minios_probe (struct nic *nic)
 {
+    char *ip;
+
     if (net_dev)
         return 1;
 
@@ -298,7 +300,7 @@ minios_probe (struct nic *nic)
     grub_memset ((char *) arptable, 0,
                  MAX_ARP * sizeof (struct arptable_t));
 
-    net_dev = init_netfront(NULL, (void*) -1, nic->node_addr, NULL, NULL, NULL);
+    net_dev = init_netfront(NULL, (void*) -1, nic->node_addr, &ip);
     if (!net_dev)
         return 0;
 
-- 
2.20.1


