Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EE5B6198
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:43:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXOl-0002cj-7a; Wed, 18 Sep 2019 10:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAXOj-0002bq-Af
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:41:21 +0000
X-Inumbo-ID: d9c1969e-da00-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9c1969e-da00-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3wtqscF5WahSQ6mM8jXiCTqgdjpyQSjBstDHQvT3zg=;
 b=OUrTPCpxfwmnqxNT2gmnyyjv5kxV9vWjA5GJxY4mFaRjWWkMZcOH6FuK
 TYt2N8EFEkgsXBQhaX99J3e+IdQNf3xLbUmHPFNYi1fdc3NoNu8axWJiU
 FSp82Sw3qLMgjtpUP9YfwuBHqB9vuuefrvetrrZjN+pUZp/UHHn9QUWmS Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fx5Uc386N0OOQpCrlCSGl8nV+ss1clIVWYTzaDOqc2xJFuyiCx3u/6OorOSPU8gK42R0o7cn1B
 u9crwVKRQ3lM9973gbXOz+sphOYdYjkMKnvDgKVLdj2p3anvbt1geK8/51PIefRZNH95Pvu/qF
 tcMEHBSZROyXvTwdo8rNNwuA8HqUwFtS80U2yw0u4gec9uMaW9aRn/Ok240c5gQ/l4GyFJ3vCV
 D8PxEhGwKuOefbwqG2rFuRxl0jxgcLJnSJXHzLmngG/s79eaGhpZtARkJE0JDL52rVbrwqaVLV
 Kco=
X-SBRS: 2.7
X-MesageID: 5777373
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5777373"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Sep 2019 11:41:12 +0100
Message-ID: <20190918104113.3294-4-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190918104113.3294-1-paul.durrant@citrix.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v13 3/4] tools/ocaml: abi check: Cope with
 consecutive relevant enums
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
Cc: Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJZiB0aGUgZW5k
IG9mIG9uZSBlbnVtIGlzIHRoZSBgdHlwZScgbGluZSBmb3IgdGhlIG5leHQgZW51bSwgd2Ugd291
bGQKbm90IG5vdGljZSBpdC4KCkZpeCB0aGlzIGJ5IHJlb3JkZXJpbmcgdGhlIGNvZGUsIGFuZCBn
ZXR0aW5nIHJpZCBvZiB0aGUgZWxzZTogbm93IGlmCnRoZSAid2UgYXJlIHdpdGhpbiBhbiBlbnVt
IiBicmFuY2ggZGVjaWRlcyB0aGF0IGl0J3MgdGhlIGVuZCBvZiB0aGUKZW51bSwgaXQgdW5zZXRz
ICRlaSBhbmQgd2UgdGhlbiBpbW1lZGlhdGVseSBwcm9jZXNzIHRoZSBsaW5lIGFzIGEgIm5vdAp3
aXRoaW4gYW4gZW51bSIgbGluZSAtIGllIGFzIHRoZSBzdGFydCBvZiB0aGUgbmV4dCBvbmUuCgpS
ZXBvcnRlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cgp2MTM6CiAtIE5l
dyBpbiB0aGlzIHZlcnNpb24KLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayB8IDE3
ICsrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrIGIv
dG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sKaW5kZXggZDUzMmYzNzI3MS4uM2NiZGVjNTgy
ZiAxMDA3NTUKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sKKysrIGIvdG9vbHMv
b2NhbWwvbGlicy94Yy9hYmktY2hlY2sKQEAgLTcwLDE0ICs3MCw3IEBAIG15ICRjdmFsOwogJGVp
ID0gdW5kZWY7CiBteSAkYml0bnVtID0gMDsKIHdoaWxlICg8T0NBTUxfRklMRT4pIHsKLSAgICBp
ZiAoISRlaSkgewotICAgICAgICBpZiAobXtedHlwZSBccysgKFx3KykgXHMqIFw9IFxzKiAkfXgg
JiYgJGVudW1zeyQxfSkgewotICAgICAgICAgICAgcHJpbnQgIi8vIGZvdW5kIG9jYW1sIHR5cGUg
JDEgYXQgJG86JC5cbiIgb3IgZGllICQhOwotICAgICAgICAgICAgJGVpID0gJGVudW1zeyQxfTsK
LSAgICAgICAgICAgICRjdmFsID0gJyc7Ci0gICAgICAgICAgICAkYml0bnVtID0gMDsKLSAgICAg
ICAgfQotICAgIH0gZWxzZSB7CisgICAgaWYgKCRlaSkgewogICAgICAgICBpZiAobXteXHMrIFx8
IFxzKiAkZWktPntPUHJlZml4fSAoXHcrKSBccyokfXgpIHsKICAgICAgICAgICAgICRjdmFsID0g
JDE7CiAgICAgICAgICAgICBpZiAoJGVpLT57TWFuZ2xlfSBlcSAnbGMnKSB7CkBAIC0xMDQsNiAr
OTcsMTQgQEAgd2hpbGUgKDxPQ0FNTF9GSUxFPikgewogICAgICAgICAgICAgZGllICIkXyA/IjsK
ICAgICAgICAgfQogICAgIH0KKyAgICBpZiAoISRlaSkgeworICAgICAgICBpZiAobXtedHlwZSBc
cysgKFx3KykgXHMqIFw9IFxzKiAkfXggJiYgJGVudW1zeyQxfSkgeworICAgICAgICAgICAgcHJp
bnQgIi8vIGZvdW5kIG9jYW1sIHR5cGUgJDEgYXQgJG86JC5cbiIgb3IgZGllICQhOworICAgICAg
ICAgICAgJGVpID0gJGVudW1zeyQxfTsKKyAgICAgICAgICAgICRjdmFsID0gJyc7CisgICAgICAg
ICAgICAkYml0bnVtID0gMDsKKyAgICAgICAgfQorICAgIH0KIH0KIAogZm9yZWFjaCAkZWkgKHZh
bHVlcyAlZW51bXMpIHsKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
