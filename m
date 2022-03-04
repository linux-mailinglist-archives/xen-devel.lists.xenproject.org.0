Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FB4CDC29
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284481.484016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCVB-0000X3-JD; Fri, 04 Mar 2022 18:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284481.484016; Fri, 04 Mar 2022 18:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV8-0008PX-Ui; Fri, 04 Mar 2022 18:18:02 +0000
Received: by outflank-mailman (input) for mailman id 284481;
 Fri, 04 Mar 2022 17:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2W-0005R5-Uy
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:28 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c4464a7-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:28 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2V-0000Il-KE; Fri, 04 Mar 2022 18:48:27 +0100
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
X-Inumbo-ID: 4c4464a7-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 34/36] doc, xl.cfg: introduce coloring configuration option
Date: Fri,  4 Mar 2022 18:46:59 +0100
Message-Id: <20220304174701.1453977-35-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

The color selection has to be specified in the configuration file of the
virtual machine with the new parameter 'colors'. This parameter
defines the colors to be assigned to that particular VM, expressed as a
list of ranges.
Add documentation for the new 'colors' parameter.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 docs/man/xl.cfg.5.pod.in | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..98c2da0c9e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2865,6 +2865,20 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=over 4
+
+=item B<colors=[ "COLORS_RANGE", "COLORS_RANGE", ...]>
+
+Specify the color configuration for the guest. B<COLORS_RANGE> is expressed
+using colors numbers. The range starts always from 0 up to the maximum amount
+of available colors.
+The number of available colors depends on the LLC layout of the specific
+platform and determines the maximum allowed value.  This number can be either
+calculated or read from the output given by the hypervisor during boot, if
+DEBUG logging is enabled.
+
+=back
+
 =head3 x86
 
 =over 4
-- 
2.30.2


