Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075853098BB
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 00:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79109.144055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zGr-00036K-3b; Sat, 30 Jan 2021 23:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79109.144055; Sat, 30 Jan 2021 23:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zGr-00035v-06; Sat, 30 Jan 2021 23:03:13 +0000
Received: by outflank-mailman (input) for mailman id 79109;
 Sat, 30 Jan 2021 23:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N63w=HB=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l5zGo-00035q-S6
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 23:03:10 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22b9206e-f5a6-4a7a-957f-180819b309b5;
 Sat, 30 Jan 2021 23:03:09 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10UN38RR026350;
 Sun, 31 Jan 2021 00:03:08 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10UN36T3007150;
 Sun, 31 Jan 2021 00:03:07 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 7DC67A9E7D; Sun, 31 Jan 2021 00:03:06 +0100 (MET)
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
X-Inumbo-ID: 22b9206e-f5a6-4a7a-957f-180819b309b5
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/2] Document qemu-ifup on NetBSD
Date: Sun, 31 Jan 2021 00:03:00 +0100
Message-Id: <20210130230300.11664-2-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130230300.11664-1-bouyer@netbsd.org>
References: <20210130230300.11664-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 31 Jan 2021 00:03:08 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Document that on NetBSD, the tap interface will be configured by the
qemu-ifup script. Document the arguments, and XEN_DOMAIN_ID environnement
variable.
---
 docs/man/xl-network-configuration.5.pod | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
index af058d4d3c..f6eb6c31fc 100644
--- a/docs/man/xl-network-configuration.5.pod
+++ b/docs/man/xl-network-configuration.5.pod
@@ -172,6 +172,10 @@ add it to the relevant bridge). Defaults to
 C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
 scripts are installed in C<XEN_SCRIPT_DIR>.
 
+On NetBSD, HVM guests will always use
+C<XEN_SCRIPT_DIR/qemu-ifup> to configure the tap interface. The first argument
+is the tap interface, the second is the bridge name. the environnement variable
+C<XEN_DOMAIN_ID> contains the domU's ID.
 
 =head2 ip
 
-- 
2.29.2


