Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B735A1993E2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQd-0002xm-Ib; Tue, 31 Mar 2020 10:47:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQc-0002xN-7S
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:30 +0000
X-Inumbo-ID: 0454d062-733d-11ea-ba0c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0454d062-733d-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JeUsPgvppjoTgoSQDJQrJ8xz/P7fKJCsWup60MnRC1U=;
 b=GtT/9khLtDcBk8y/h5QXzDOjEQ0lNpzFZsS2fMCp1GjTeNmo/IJF4DnU
 T3+GGpAW7wOwTgqvuTNYLSn4P5E2CN7WbzJVq3IQTFUrGrUI7MDS6yocv
 glbQSz25lrkshODfmGhtRcTfPX9+d9FMuV7/Yk1TNG+nFvr6Sle3tXSCF s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KdzNX0PSUNBli/sj0NvYAwoVyQVUg1hP+RRdG1xUB/X0PuJWpmXnTDjgFCgTu+HupwK+L0fl/h
 1DgloYAoGWi7gA1yc3+WJocpwEf9f5JeLW22v02ECeAzzcIflghDVEbZvR5y+118u0SUFXSz/a
 xp7g4KZvCF8ixnFdnylqbySHJxGis1Nm9HybGm79Q5RDUrnw5mrykNzNockz0mSkugi+nHxz+D
 HQ5fBzPfzoljcyv5vN8A1auu6RqdZhlarQ45GT06F3a39VK69twjlTik7sdxqfHPBrBMBN0HaX
 Gqs=
X-SBRS: 2.7
X-MesageID: 14904509
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14904509"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 16/18] build,xsm: Fix multiple call
Date: Tue, 31 Mar 2020 11:31:00 +0100
Message-ID: <20200331103102.1105674-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both script mkflask.sh and mkaccess_vector.sh generates multiple
files. Exploits the 'multi-target pattern rule' trick to call each
scripts only once.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 xen/xsm/flask/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 7d0831e2b865..48577cbe3f04 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -26,14 +26,14 @@ mkflask := policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
 cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
 
-$(FLASK_H_FILES): $(FLASK_H_DEPEND) $(mkflask) FORCE
+$(patsubst include/%,\%/%,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
 mkaccess := policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
 cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
 
-$(AV_H_FILES): $(AV_H_DEPEND) $(mkaccess) FORCE
+$(patsubst include/%,\%/%,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 	$(call if_changed,mkaccess)
 
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
-- 
Anthony PERARD


