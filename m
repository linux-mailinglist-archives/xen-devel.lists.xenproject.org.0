Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8BAECAA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gon-0004QC-Go; Tue, 10 Sep 2019 14:08:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zTA9=XF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7gom-0004Q4-3S
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:08:28 +0000
X-Inumbo-ID: 75477eea-d3d4-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75477eea-d3d4-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568124507;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hs1Rq+5sr8vVrACBtVdBVwNvHI7qLQ8kZBiKeaYJd7c=;
 b=grBMdsOT0BsyEF8bHGzyvk5vtI442IxIpf29XX1VnnlEiYIWIk8jDXuy
 FGCq1c+gv12opQLbqnmNZseajQ25Y+QLz05LXCmDwYk6Q1/aJuXGInfNE
 O0XHAmkf8+DzEw8eZRUUei8NFw8pmZO9lKH70123GVChYvmLb9Bz80pzz k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XIJkLehXZ+dgZr/jPmLmgdZ38fuMf4cPOY3BKR4LetZTkvErqRYtPKDYOKbWnR+M/jef06quvh
 5Rj4wEqqM7CG2u9bTLz0PNlcuFMSWK+tbnylvHIFOzY5RYZl/Dtg+gSOUr3gT1m64g82VV5syQ
 kiGI2yNTHQW7YxZb1HFtrSi1dWj8sv+reO5AE2YOkh//HVgOe8aDyxOTxV4LVwHQg5Fl0C24dA
 NGqjbCUiqkLtE0PeqZzhHklU310hJlpiAr+QiGWOJ7p0hFAOwbOp+l7LrS7/WrcfrpIOuXJvwj
 7SU=
X-SBRS: 2.7
X-MesageID: 5565556
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5565556"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 15:08:18 +0100
Message-ID: <20190910140818.9184-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/ocaml: Fix build error with CentOS 7
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
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Z2NjIChHQ0MpIDQuOC41IDIwMTUwNjIzIChSZWQgSGF0IDQuOC41LTI4KSBjb21wbGFpbnM6Cgog
IHhlbmN0cmxfc3R1YnMuYzogSW4gZnVuY3Rpb24gJ3N0dWJfeGNfZG9tYWluX2NyZWF0ZSc6CiAg
eGVuY3RybF9zdHVicy5jOjIxNjoyODogZXJyb3I6ICd2YWwnIG1heSBiZSB1c2VkIHVuaW5pdGlh
bGl6ZWQKICAgICAgICAgICAgICAgICAgICAgICAgICBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9y
PW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAgICAgY2ZnLmFyY2guZW11bGF0aW9uX2ZsYWdzID0gb2Nh
bWxfbGlzdF90b19jX2JpdG1hcAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCiAgeGVu
Y3RybF9zdHVicy5jOjE5ODoxMjogZXJyb3I6ICd2YWwnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6
ZWQKICAgICAgICAgICAgICAgICAgICAgICAgICBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1h
eWJlLXVuaW5pdGlhbGl6ZWRdCiAgICBjZmcuZmxhZ3MgPSBvY2FtbF9saXN0X3RvX2NfYml0bWFw
CiAgICAgICAgICAgICAgXgogIGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJy
b3JzCgpHQ0MgZG9lc24ndCBwb2ludCBhdCB0aGUgY29ycmVjdCBwaWVjZSBvZiBjb2RlLCBidXQg
dGhlIGRpYWdub3N0aWMgdGV4dCBpcwpjb3JyZWN0LCBhbmQgY2FuIG9jY3VyIHdoZW4gdGhlIGxp
c3QgaXMgZW1wdHkuIEluaXRpYWxpc2UgdmFsIHRvIDAuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IENocmlz
dGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KLS0tCiB0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKaW5k
ZXggZjg2ZWNjN2I3ZS4uZDdiYzJjZjQwZCAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJz
LmMKQEAgLTE2MCw3ICsxNjAsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG9jYW1sX2xpc3RfdG9f
Y19iaXRtYXAodmFsdWUgbCkKIAkgICAgICAqIGZvciB4ZW5jdHJsX2FiaV9jaGVjay4gIFRoZSBw
YXJzaW5nIHRoZXJlIGlzIGFkLWhvYy4KIAkgICAgICAqLwogewotCXVuc2lnbmVkIGludCB2YWw7
CisJdW5zaWduZWQgaW50IHZhbCA9IDA7CiAKIAlmb3IgKCA7IGwgIT0gVmFsX25vbmU7IGwgPSBG
aWVsZChsLCAxKSApCiAJCXZhbCB8PSAxdSA8PCBJbnRfdmFsKEZpZWxkKGwsIDApKTsKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
