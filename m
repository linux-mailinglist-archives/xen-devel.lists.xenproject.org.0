Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F49A6DDD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BSW-00023l-6e; Tue, 03 Sep 2019 16:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BST-000229-VJ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:15:05 +0000
X-Inumbo-ID: fd20025c-ce65-11e9-ab97-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd20025c-ce65-11e9-ab97-12813bfff9fa;
 Tue, 03 Sep 2019 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhyPhuBUqiy/YkI6TCkLU+8pFIgYCZTFltu1tHlrkCs=;
 b=UZt/BWh/Ai9Vt99C2ofCiZrugJwL8WovE0unQIs8J1cCzTxUGkGfKa7o
 g4U6Un0HlD2UtjaTXrnsNn5QVnDjJlTGkiKbA3puQ2lUJUYn7CCHg79vh
 hP9jgT7Pt7+ty0ctL/DcQ/4LFJRPMKQ7XFIRcq06FYq0yalpbsD4R8Utf E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cKa8aZFHq//bk44Sp4HFgxjfydQ19s4IThIeceuVwl1OSREwhccVTnAl13nfv9pwAvz8pCOv9I
 BysDEkRBIRBud/sO5MoV/VjlYNHnJLT+XHVeqMBGQfKly7Deed7Gq4dFxKDKsTsGWniRkDh4W5
 wrsLzvOr/ksIuRuj255VLOgStKloRcRDIlMbSFXo+xfKkQvhfCDkR07WBTtH+NU9qfR7bzGOyR
 amp8rFhwUkq5L5/585CB0tu3hafShdb4vngODuFXWs27qo0ReQJ+mCY8kpc9n8A9i7erHzZdUp
 kD8=
X-SBRS: 2.7
X-MesageID: 5256697
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5256697"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:18 +0200
Message-ID: <20190903161428.7159-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903161428.7159-1-roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvb3AgaW4gRk9SX0VBQ0hfSU9SRVFfU0VSVkVSIGlzIGJhY2t3YXJkcyBoZW5jZSB0aGUg
Y2xlYW51cCBvbgpmYWlsdXJlIG5lZWRzIHRvIGJlIGRvbmUgZm9yd2FyZHMuCgpGaXhlczogOTdh
NWEzZTMwMTYxICgneDg2L2h2bS9pb3JlcTogbWFpbnRhaW4gYW4gYXJyYXkgb2YgaW9yZXEgc2Vy
dmVycyByYXRoZXIgdGhhbiBhIGxpc3QnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIE5ldyBpbiB0
aGlzIHZlcnNpb24uCi0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCmluZGV4IGE3
OWNhYmI2ODAuLjY5MmI3MTBiMDIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEu
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKQEAgLTExOTUsNyArMTE5NSw3IEBAIGlu
dCBodm1fYWxsX2lvcmVxX3NlcnZlcnNfYWRkX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IHZjcHUgKnYpCiAgICAgcmV0dXJuIDA7CiAKICBmYWlsOgotICAgIHdoaWxlICggaWQtLSAhPSAw
ICkKKyAgICB3aGlsZSAoIGlkKysgIT0gTUFYX05SX0lPUkVRX1NFUlZFUlMgKQogICAgIHsKICAg
ICAgICAgcyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwgaWQpOwogCi0tIAoyLjIyLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
