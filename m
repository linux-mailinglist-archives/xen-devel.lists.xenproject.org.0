Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E6C2219
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvnp-0005US-Rg; Mon, 30 Sep 2019 13:33:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvno-0005TO-CO
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:24 +0000
X-Inumbo-ID: dda73a2d-e386-11e9-96d3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id dda73a2d-e386-11e9-96d3-12813bfff9fa;
 Mon, 30 Sep 2019 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4yOccHXsrLKixDZORdzfIHT5/uP4KQJuS4A78hqM23A=;
 b=bynA17zY44ZcE7OdaVs6SHLORCyZo2Le6KDdFlekvRS6m1EQXwQI1/oM
 PWqxReCVTWmXOEYvCqv/CVLC1IlVlIfvmvfA33jzx7RsPIVLWQ4Jt9g+9
 viOfv+zfHK+93nqq6c/3M5uSt/Xz6rxDJqrvGD5W7vSeCRst8k0IAKLlG I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zF6D/gTLeKXu9/f/6Rzq9IQ2Kxzq9BqmZDzs59NLVMu64+Ri6FGMLWg0mO9TVlAasFI/pHZj5l
 KmiRqVYFQtKAtKLexr9Tz0dQvE/S8IWAk3DKvoUcC+Tqy/Tmj7XACVG3wrvuJSmJCIpLUOlwrZ
 zJQbzeMvWbLdXgQpN8v+C/S7s/skT/l76mSqs7Eb0/4s3SOyBH60okj4A6er6qLExr83dCb/p2
 Crw2Rx1TXd9KsqRiMaHlifEM/Pf2VI8yNbupTokmDO/dw5KqPwMhExLWSqGq15jzfWa84KqDfY
 4eE=
X-SBRS: 2.7
X-MesageID: 6322260
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6322260"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:29 +0200
Message-ID: <20190930133238.49868-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 01/10] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG8gbm90IGZvcndhcmQgYWNjZXNzZXMgdG8gY2Y4IHRvIGV4dGVybmFsIGVtdWxhdG9ycywgZGVj
b2Rpbmcgb2YgUENJCmFjY2Vzc2VzIGlzIGhhbmRsZWQgYnkgWGVuLCBhbmQgZW11bGF0b3JzIGNh
biByZXF1ZXN0IGhhbmRsaW5nIG9mCmNvbmZpZyBzcGFjZSBhY2Nlc3NlcyBvZiBkZXZpY2VzIHVz
aW5nIHRoZSBwcm92aWRlZCBpb3JlcSBpbnRlcmZhY2UuCgpGdWxseSB0ZXJtaW5hdGUgY2Y4IGFj
Y2Vzc2VzIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLCBieSBpbXByb3ZpbmcgdGhlCmV4aXN0aW5n
IGh2bV9hY2Nlc3NfY2Y4IGhlbHBlciB0byBhbHNvIGhhbmRsZSByZWdpc3RlciByZWFkcywgYW5k
CmFsd2F5cyByZXR1cm4gWDg2RU1VTF9PS0FZIGluIG9yZGVyIHRvIHRlcm1pbmF0ZSB0aGUgZW11
bGF0aW9uLgoKTm90ZSB0aGF0IHdpdGhvdXQgdGhpcyBjaGFuZ2UgaW4gdGhlIGFic2VuY2Ugb2Yg
c29tZSBleHRlcm5hbCBlbXVsYXRvcgp0aGF0IGNhdGNoZXMgYWNjZXNzZXMgdG8gY2Y4IHJlYWQg
cmVxdWVzdHMgdG8gdGhlIHJlZ2lzdGVyIHdvdWxkCm1pc2JlaGF2ZSwgYXMgdGhlIGlvcmVxIGlu
dGVybmFsIGhhbmRsZXIgZGlkIG5vdCBoYW5kbGUgdGhvc2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6
CiAtIEFsbG93IGlvcmVxIHNlcnZlcnMgdG8gbWFwIDB4Y2Y4IGFuZCAweGNmYywgZXZlbiBpZiB0
aG9zZSBhcmUKICAgaGFuZGxlZCBieSB0aGUgaHlwZXJ2aXNvci4KCkNoYW5nZXMgc2luY2UgdjE6
CiAtIE5ldyBpbiB0aGlzIHZlcnNpb24uCi0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwg
MTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMKaW5kZXggZDM0NzE0NDA5Ni4uNWU1MDNjZTQ5OCAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpA
QCAtMTUxOCwxMSArMTUxOCwxNSBAQCBzdGF0aWMgaW50IGh2bV9hY2Nlc3NfY2Y4KAogewogICAg
IHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47CiAKLSAgICBpZiAoIGRpciA9PSBJ
T1JFUV9XUklURSAmJiBieXRlcyA9PSA0ICkKKyAgICBpZiAoIGJ5dGVzICE9IDQgKQorICAgICAg
ICByZXR1cm4gWDg2RU1VTF9PS0FZOworCisgICAgaWYgKCBkaXIgPT0gSU9SRVFfV1JJVEUgKQog
ICAgICAgICBkLT5hcmNoLmh2bS5wY2lfY2Y4ID0gKnZhbDsKKyAgICBlbHNlCisgICAgICAgICp2
YWwgPSBkLT5hcmNoLmh2bS5wY2lfY2Y4OwogCi0gICAgLyogV2UgYWx3YXlzIG5lZWQgdG8gZmFs
bCB0aHJvdWdoIHRvIHRoZSBjYXRjaCBhbGwgZW11bGF0b3IgKi8KLSAgICByZXR1cm4gWDg2RU1V
TF9VTkhBTkRMRUFCTEU7CisgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKIH0KIAogdm9pZCBodm1f
aW9yZXFfaW5pdChzdHJ1Y3QgZG9tYWluICpkKQotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
