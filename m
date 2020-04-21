Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BD1B2BF8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVe-0005Q5-NV; Tue, 21 Apr 2020 16:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVd-0005Pr-GB
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:29 +0000
X-Inumbo-ID: e3959744-83ea-11ea-9160-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3959744-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SweUxOrsIVVWZNbjHYtMG1kL0UrANIJUt364vs9N/M=;
 b=hksGa1KX7E0+HMHmosPokprDpxw+gSiTHk7oWcBrB8mqct0/duZAQMQF
 t4hQyEXDprGF0hrSaUvlP9D+stErSvqKItCShHRYb9m07HQ7HCI3n+cmC
 N7WL7t/WqIFdY5QOpNbC4LJ2ilWoBO7IVpt7HyzIxZe6ACXsrbR2WX4Wz Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bWyQ/LK6H5KZ+jo5oBnN3C/uKUGO3b8/lj6XwHPT9XyO+cRH5z0v1ErmJ7n9e8ZirgCNMPxOnC
 /mngHYO4494Rl95wWOzIX6YcHCfPgbrzi3MM/GsadORJ6Ef5m90RKyEwi8Rn/Dh4duuXLCMiOU
 2U9Rq13wzw+AGrZhem67uzb2fvaU4tfew+078ULYmxLV5NT5xd3MjKuCGO6bU+eYIQRxAM6uU6
 pXA+ANICkm6Y8OXmpTceU0RKhP1bnYJi/J4pkjnich+vfJA2ByR+6yt+4SrjADqnxkG4x7ipsz
 t0Y=
X-SBRS: 2.7
X-MesageID: 16028576
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16028576"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 01/16] build,xsm: Fix multiple call
Date: Tue, 21 Apr 2020 17:11:53 +0100
Message-ID: <20200421161208.2429539-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
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
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both script mkflask.sh and mkaccess_vector.sh generates multiple
files. Exploits the 'multi-target pattern rule' trick to call each
scripts only once.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v5:
    - Use simpler $(subst ) instead of $(patsubst )
    - moved the patch ahead in the series
    
    v4:
    - new patch

 xen/xsm/flask/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index b1fd45421993..f001bb18d4ed 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -21,10 +21,10 @@ ALL_H_FILES = $(FLASK_H_FILES) $(AV_H_FILES)
 
 $(obj-y) ss/built_in.o: $(ALL_H_FILES)
 
-$(FLASK_H_FILES): $(FLASK_H_DEPEND)
+$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND)
 	$(CONFIG_SHELL) policy/mkflask.sh $(AWK) include $(FLASK_H_DEPEND)
 
-$(AV_H_FILES): $(AV_H_DEPEND)
+$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND)
 	$(CONFIG_SHELL) policy/mkaccess_vector.sh $(AWK) $(AV_H_DEPEND)
 
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
-- 
Anthony PERARD


