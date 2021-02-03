Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BFF30E028
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80971.148678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQf-0003Kr-7W; Wed, 03 Feb 2021 16:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80971.148678; Wed, 03 Feb 2021 16:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LQf-0003KP-3U; Wed, 03 Feb 2021 16:54:57 +0000
Received: by outflank-mailman (input) for mailman id 80971;
 Wed, 03 Feb 2021 16:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rCV=HF=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l7LQd-0003Jr-QC
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:54:55 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf125cb7-1473-43ae-b2db-b1daf8ee0b89;
 Wed, 03 Feb 2021 16:54:54 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 113GsrDn009511;
 Wed, 3 Feb 2021 17:54:53 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 113GsrfB012214;
 Wed, 3 Feb 2021 17:54:53 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id ACEECAA8BB; Wed,  3 Feb 2021 17:54:53 +0100 (MET)
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
X-Inumbo-ID: cf125cb7-1473-43ae-b2db-b1daf8ee0b89
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Wei Liu <wl@xen.org>,
        Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3] Document qemu-ifup on NetBSD
Date: Wed,  3 Feb 2021 17:54:20 +0100
Message-Id: <20210203165421.1550-3-bouyer@netbsd.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203165421.1550-1-bouyer@netbsd.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 03 Feb 2021 17:54:53 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

Document that on NetBSD, the tap interface will be configured by the
qemu-ifup script.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 docs/man/xl-network-configuration.5.pod | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
index af058d4d3c..8e5fd909fa 100644
--- a/docs/man/xl-network-configuration.5.pod
+++ b/docs/man/xl-network-configuration.5.pod
@@ -172,6 +172,9 @@ add it to the relevant bridge). Defaults to
 C<XEN_SCRIPT_DIR/vif-bridge> but can be set to any script. Some example
 scripts are installed in C<XEN_SCRIPT_DIR>.
 
+Note on NetBSD HVM guests will ignore the script option for tap
+(emulated) interfaces and always use
+C<XEN_SCRIPT_DIR/qemu-ifup> to configure the interface in bridged mode.
 
 =head2 ip
 
-- 
2.29.2


