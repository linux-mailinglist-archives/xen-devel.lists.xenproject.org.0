Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C02417D6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEr-00042i-IB; Tue, 11 Aug 2020 08:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEp-0003tU-Ge
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:27 +0000
X-Inumbo-ID: 764ba1c8-d299-41f0-8d8c-eee0084d7b95
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 764ba1c8-d299-41f0-8d8c-eee0084d7b95;
 Tue, 11 Aug 2020 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CMw0RcWu/LXhzXxdRQOMwsBd24sui0EzlfPHLuiHcFQ=; b=JZGxjTOiGRxLxYjyguj/5ZR1+5
 kviMy5oF4IkRlmX/4+uf5IQTay4PNOlAmiZIOuyCGXn1FxCkZTKwBbfwLEYnWl0Qfa4f2NGzqrCn+
 XsP/G3/4GtMWcn6httDpaOgdoWqxQ6qvtchnbwlxEf+Zwe7xCGhBF1h/+HBgz5h1pIqM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEa-0003vg-Vd; Tue, 11 Aug 2020 08:02:12 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEa-0000k5-OI; Tue, 11 Aug 2020 08:02:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 7/8] xl: add 'mtu' option to network configuration
Date: Tue, 11 Aug 2020 09:02:01 +0100
Message-Id: <20200811080202.31163-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200811080202.31163-1-paul@xen.org>
References: <20200811080202.31163-1-paul@xen.org>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch adds code to parse a value for MTU from the network configuration
if it is present. The documentation in xl-network-configuration.5.pod is
also modified accordingly.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v3:
 - New in v3
---
 docs/man/xl-network-configuration.5.pod | 6 ++++++
 tools/xl/xl_cmdtable.c                  | 2 +-
 tools/xl/xl_parse.c                     | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl-network-configuration.5.pod b/docs/man/xl-network-configuration.5.pod
index 0ac24c4a18..af058d4d3c 100644
--- a/docs/man/xl-network-configuration.5.pod
+++ b/docs/man/xl-network-configuration.5.pod
@@ -249,3 +249,9 @@ on the underlying netback implementation.
 Specifies the devid manually instead of letting xl choose the lowest index available.
 
 NOTE: This should not be set unless you have a reason to.
+
+=head2 mtu
+
+Specifies the MTU (i.e. the maximum size of an IP payload, exclusing headers). The
+default value is 1500 but, if the VIF is attached to a bridge, it will be set to match
+unless overridden by this parameter.
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 08335394e5..2b8e1b321a 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -338,7 +338,7 @@ struct cmd_spec cmd_table[] = {
       "Create a new virtual network device",
       "<Domain> [type=<type>] [mac=<mac>] [bridge=<bridge>] "
       "[ip=<ip>] [script=<script>] [backend=<BackDomain>] [vifname=<name>] "
-      "[rate=<rate>] [model=<model>] [accel=<accel>]",
+      "[rate=<rate>] [model=<model>] [accel=<accel>] [mtu=<mtu>]",
     },
     { "network-list",
       &main_networklist, 0, 0,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7b7e..cae8eb679c 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -563,6 +563,8 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token)
         fprintf(stderr, "the accel parameter for vifs is currently not supported\n");
     } else if (MATCH_OPTION("devid", token, oparg)) {
         nic->devid = parse_ulong(oparg);
+    } else if (MATCH_OPTION("mtu", token, oparg)) {
+        nic->mtu = parse_ulong(oparg);
     } else {
         fprintf(stderr, "unrecognized argument `%s'\n", token);
         return 1;
-- 
2.20.1


