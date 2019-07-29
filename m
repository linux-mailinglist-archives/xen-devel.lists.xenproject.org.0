Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E97948D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 21:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsBKy-0005RC-QU; Mon, 29 Jul 2019 19:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8hpq=V2=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hsBKx-0005R6-DW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 19:29:35 +0000
X-Inumbo-ID: 2e7424e6-b237-11e9-ac6d-af77c831acd4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e7424e6-b237-11e9-ac6d-af77c831acd4;
 Mon, 29 Jul 2019 19:29:29 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xIYHDh8MB8rA1+hPyKK/RDS/nhLVT3ciaqFWpLzUvKzl6Oo6M4xdlyZvymW9Fz50CM2iIO+60C
 bzSjH2cFqrgR3JVUMUv5lbA1BZo9B1cnw5C+MuA69cIN66B6DO9DyVRHJv2r3oBpEevAuytmxL
 0tZ/LGmUT6U13dU4fTxoXeADQ+7ZcxYysGTVA30sc1dAQQrzQTSUQBHNPY2Yu8wwoFptNakPrq
 vWxO4O3pE931o9bSlTUfCaGtmHnInO84fv5GvhFz4PGezkRAY01jb7xq/9eMlQETwb1izSwR4f
 36k=
X-SBRS: 2.7
X-MesageID: 3591051
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,324,1559534400"; 
   d="scan'208";a="3591051"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
Date: Mon, 29 Jul 2019 20:29:23 +0100
Message-ID: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: cleanup IOREQ server on exit
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
Cc: anthony.perard@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 sstabellini@kernel.org, paul.durrant@citrix.com, mst@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGV2aWNlIG1vZGVsIGlzIHN1cHBvc2VkIHRvIGRlc3Ryb3kgSU9SRVEgc2VydmVyIGZvciBpdHNl
bGYuCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4KLS0tCiBody9pMzg2L3hlbi94ZW4taHZtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5jIGIvaHcv
aTM4Ni94ZW4veGVuLWh2bS5jCmluZGV4IGU4ZTc5ZTAuLjMwYTU5NDggMTAwNjQ0Ci0tLSBhL2h3
L2kzODYveGVuL3hlbi1odm0uYworKysgYi9ody9pMzg2L3hlbi94ZW4taHZtLmMKQEAgLTEyNDIs
NiArMTI0Miw4IEBAIHN0YXRpYyB2b2lkIHhlbl9leGl0X25vdGlmaWVyKE5vdGlmaWVyICpuLCB2
b2lkICpkYXRhKQogewogICAgIFhlbklPU3RhdGUgKnN0YXRlID0gY29udGFpbmVyX29mKG4sIFhl
bklPU3RhdGUsIGV4aXQpOwogCisgICAgeGVuX2Rlc3Ryb3lfaW9yZXFfc2VydmVyKHhlbl9kb21p
ZCwgc3RhdGUtPmlvc2VydmlkKTsKKwogICAgIHhlbmV2dGNobl9jbG9zZShzdGF0ZS0+eGNlX2hh
bmRsZSk7CiAgICAgeHNfZGFlbW9uX2Nsb3NlKHN0YXRlLT54ZW5zdG9yZSk7CiB9Ci0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
