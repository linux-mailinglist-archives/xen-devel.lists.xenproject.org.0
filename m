Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FA8C0655
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718967.1121560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0A-0004As-Ph; Wed, 08 May 2024 21:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718967.1121560; Wed, 08 May 2024 21:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0A-00045T-Ma; Wed, 08 May 2024 21:39:02 +0000
Received: by outflank-mailman (input) for mailman id 718967;
 Wed, 08 May 2024 21:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nd4S=ML=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s4p09-00044I-KG
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:39:01 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611b41a1-0d83-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 23:38:59 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2561B8009E;
 Wed,  8 May 2024 22:38:59 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id F01BE20167; Wed,  8 May 2024 22:38:58 +0100 (BST)
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
X-Inumbo-ID: 611b41a1-0d83-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715204339;
	bh=aK+rR4WSKsfVDFqSo21YMhoedb8+5SFZWoGq++M/1CY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=z9Km2AAeaGZp8E5gVbHMQzWSZ/jxogBa0gsn7AqAHpBmYIJKLxo5nZbuQOgazXjGt
	 iyfZer4aO/4nefLHaj3Ga8/kZwRFta8c290LOz6Sqa8V801mBqVLH7eN1znO7hJm7X
	 1smoj4EfSIQ+IRk/HzDu82G0wjjuqOHaRLm2X8GI=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH v2 2/5] tools/xl: add vlan keyword to vif option
Date: Wed,  8 May 2024 22:38:21 +0100
Message-Id: <20240508213824.55824-3-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508213824.55824-1-leigh@solinno.co.uk>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update parse_nic_config() to support a new `vlan' keyword. This
keyword specifies the VLAN configuration to assign to the VIF when
attaching it to the bridge port, on operating systems that support
the capability (e.g. Linux). The vlan keyword will allow one or
more VLANs to be configured on the VIF when adding it to the bridge
port. This will be done by the vif-bridge script and functions.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/xl/xl_parse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..7546fe7e7a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -565,6 +565,8 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token)
         nic->devid = parse_ulong(oparg);
     } else if (MATCH_OPTION("mtu", token, oparg)) {
         nic->mtu = parse_ulong(oparg);
+    } else if (MATCH_OPTION("vlan", token, oparg)) {
+        replace_string(&nic->vlan, oparg);
     } else if (!strcmp("trusted", token)) {
         libxl_defbool_set(&nic->trusted, true);
     } else if (!strcmp("untrusted", token)) {
-- 
2.39.2


