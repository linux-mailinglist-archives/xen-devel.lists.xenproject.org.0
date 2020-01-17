Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39796140D05
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:49:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSuq-0003hu-G6; Fri, 17 Jan 2020 14:48:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuo-0003gw-M0
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:48:02 +0000
X-Inumbo-ID: 4cbe5b50-3938-11ea-b833-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cbe5b50-3938-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=371XZ51ma0K69LcPy9LknsW78y/Wlf6gz3LUjq06UNI=;
 b=Y6h8IZbsr4cl0Irsx0hu21jKf7y6YsuEDumdoMS5O1Ntcc3+er++V1V2
 QfiDiDNNZStO24szR3K/wtw+OJi3r1YJekzzEGzNlFouMP/yAKjhmAjDp
 1mrRy5PTJWl9ql6zQC3gn6qT4FaELbudhBSOp+xPD778yLQmut5ZW/pIA k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jl1JD6jcd/vZaO6apjD43FKMcb7+Htl9DiS6TA8kJ7Ebzv0T0MIKVArXURSUlSEonrJg0Fqr6+
 DLM3+qZxvVLYJtY8sZsXifE4Mv5UaZfsvdND8Jjck3yI6Ds1qksGP3GTwes6EQnlPv3y0/v6Gi
 k0nu61DW8HbcAZS12gNK2+2pwdcoPf36I0hR5+taDDFNqdb1/uRmco0LSHWLkVjEH9gZ4GSy/3
 zXUyOdrm/PSgCJOrZVpkXWP5k4NWVmy5gwmk9C+1S2sQmAylEAXAUIgdl4XSlz446GNjdUIvoL
 umM=
X-SBRS: 2.7
X-MesageID: 11441874
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11441874"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:26 +0000
Message-ID: <20200117144726.582-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 10/10] libxl: event: Move poller pipe
 emptying to the end of afterpoll
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZWVtcyBuZWF0ZXIuICBJdCBkb2Vzbid0IGhhdmUgYW55IHNpZ25pZmljYW50IGVmZmVj
dCBiZWNhdXNlOgoKVGhlIHBvbGxlciBmZCB3b3VsZG4ndCBiZSBlbXB0aWVkIGJ5IHRpbWVfb2Nj
dXJzLiAgSXQgd291bGQgb25seSBiZQp3b2tlbiBieSB0aW1lX29jY3VycyBhcyBhIHJlc3VsdCBv
ZiBhbiBhbyBjb21wbGV0aW5nLCBvciBieQpsaWJ4bF9fZWdjX2FvX2NsZWFudXBfMV9iYXRvbi4g
IEJ1dCAuLi4xX2JhdG9uIHdvbid0IGJlIGNhbGxlZCBpbgpiZXR3ZWVuIChmb3Igb25lIHRoaW5n
LCB0aGlzIHdvdWxkIHZpb2xhdGUgdGhlIHJ1bGUgb2Ygbm90IHN0aWxsCmhhdmluZyB0aGUgYWN0
aXZlIGNhbGxlciB3aGVuIC4uLjFfYmF0b24gaXMgY2FsbGVkKS4KCldoaWxlIGRpc2N1c3Npbmcg
dGhpcyBwYXRjaCwgSSBub3RpY2VkIHRoYXQgdGhlcmUgaXMgYSBwb3NzaWJpbGl0eSAoaW4KbGli
eGwgaW4gZ2VuZXJhbCkgdGhhdCBwb2xsZXJfcHV0IG1pZ2h0IGJlIGNhbGxlZCBvbiBhIHdva2Vu
IHBvbGxlci4KSXQgd291bGQgcHJvYmFibHkgYmUgc2Vuc2libGUgYXQgc29tZSBwb2ludCB0byBt
YWtlIHBvbGxlcl9nZXQgZW1wdHkKdGhlIHBpcGUsIGF0IGxlYXN0IGlmIHRoZSBwaXBlX25vbmVt
cHR5IGZsYWcgaXMgc2V0LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+ClRlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgotLS0KdjM6IENvbXBsZXRlbHkgcmV2aXNlZCBjb21taXQgbWVzc2FnZTsgbm93IHdl
IHRoaW5rIHRoaXMgaXMganVzdAogICAgY2xlYW51cC4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9l
dmVudC5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMg
Yi90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jCmluZGV4IDVmNmE2MDdkODAuLjdjNTM4N2U5NGYg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZXZlbnQuYwpAQCAtMTQ1MywxMiArMTQ1Myw2IEBAIHN0YXRpYyB2b2lkIGFmdGVycG9s
bF9pbnRlcm5hbChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19wb2xsZXIgKnBvbGxlciwKICAgICAg
ICAgZmRfb2NjdXJzKGVnYywgZWZkLCByZXZlbnRzKTsKICAgICB9CiAKLSAgICBpZiAoYWZ0ZXJw
b2xsX2NoZWNrX2ZkKHBvbGxlcixmZHMsbmZkcywgcG9sbGVyLT53YWtldXBfcGlwZVswXSxQT0xM
SU4pKSB7Ci0gICAgICAgIHBvbGxlci0+cGlwZV9ub25lbXB0eSA9IDA7Ci0gICAgICAgIGludCBl
ID0gbGlieGxfX3NlbGZfcGlwZV9lYXRhbGwocG9sbGVyLT53YWtldXBfcGlwZVswXSk7Ci0gICAg
ICAgIGlmIChlKSBMSUJYTF9fRVZFTlRfRElTQVNURVIoZ2MsICJyZWFkIHdha2V1cCIsIGUsIDAp
OwotICAgIH0KLQogICAgIGZvciAoOzspIHsKICAgICAgICAgbGlieGxfX2V2X3RpbWUgKmV0aW1l
ID0gTElCWExfVEFJTFFfRklSU1QoJkNUWC0+ZXRpbWVzKTsKICAgICAgICAgaWYgKCFldGltZSkK
QEAgLTE0NzMsNiArMTQ2NywxMiBAQCBzdGF0aWMgdm9pZCBhZnRlcnBvbGxfaW50ZXJuYWwobGli
eGxfX2VnYyAqZWdjLCBsaWJ4bF9fcG9sbGVyICpwb2xsZXIsCiAKICAgICAgICAgdGltZV9vY2N1
cnMoZWdjLCBldGltZSwgRVJST1JfVElNRURPVVQpOwogICAgIH0KKworICAgIGlmIChhZnRlcnBv
bGxfY2hlY2tfZmQocG9sbGVyLGZkcyxuZmRzLCBwb2xsZXItPndha2V1cF9waXBlWzBdLFBPTExJ
TikpIHsKKyAgICAgICAgcG9sbGVyLT5waXBlX25vbmVtcHR5ID0gMDsKKyAgICAgICAgaW50IGUg
PSBsaWJ4bF9fc2VsZl9waXBlX2VhdGFsbChwb2xsZXItPndha2V1cF9waXBlWzBdKTsKKyAgICAg
ICAgaWYgKGUpIExJQlhMX19FVkVOVF9ESVNBU1RFUihnYywgInJlYWQgd2FrZXVwIiwgZSwgMCk7
CisgICAgfQogfQogCiB2b2lkIGxpYnhsX29zZXZlbnRfYWZ0ZXJwb2xsKGxpYnhsX2N0eCAqY3R4
LCBpbnQgbmZkcywgY29uc3Qgc3RydWN0IHBvbGxmZCAqZmRzLAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
