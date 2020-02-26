Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D616FED1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:22:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vfh-0008B3-Nm; Wed, 26 Feb 2020 12:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vfg-0008Am-Ns
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:20:12 +0000
X-Inumbo-ID: 523d8c30-5892-11ea-9405-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 523d8c30-5892-11ea-9405-12813bfff9fa;
 Wed, 26 Feb 2020 12:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582719605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKEtPSnXfA44eXD2NPBehJJ5n/yi/a97G9Ak/ipF+d8=;
 b=fH0b4UI41m35Y828aByabHr9htiYwK9bxhzYS7XEpWgN02VunPk8InDS
 EgIVhthH0S8A+RGxx9oS9Etnc+eKvQJ7ZPm3Dza9WG/FNjdaAjDZfLt6K
 jSTja2GJvpW77Fo3uBZgh20ByFzEnpgQy1AqEypKO3ydvwYUEoRAUVsxO s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BL0oi4FL44WwaP1uFUmA1+5gOTXdI+MwOnvHcCIz1icbZUU1wH/TI8rOg6PSYFXmxfWcBixynF
 BXBRk5XYBsxGkqPJRoGuTlbKOVNnFhQ9TG0gVKugHkvGflVeLjwID6HAs+wD2m3IbWWLzc/OZt
 4d9qxqQ+Xs1LHOxSG9Q6Cr6noEKBFcUADm7QPjykQuZINN/PvUNNlR1fIITXFi2hegtsLmbT0m
 WSMNizE3cBdfGZKr5Pi5Aq5vAgDjXkSKeG1MMJcgJUhHRj/z1zqEpLz36ALTaOZD/wXItpHMkP
 yw0=
X-SBRS: 2.7
X-MesageID: 13386971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13386971"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:19:20 +0100
Message-ID: <20200226121921.28627-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226121921.28627-1-roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/4] x86: track when in #MC context
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBleGVjdXRpbmcgaW4gI01DIGhhbmRsZXIgY29udGV4
dC4gVGhpcyBpcwptb2RlbGVkIGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KCk5vdGUgdGhhdCB0
aGVyZSBhcmUgbm8gdXNlcnMgb2YgaW5fbWNlX2hhbmRsZXIoKSBpbnRyb2R1Y2VkIGJ5IHRoZQpj
aGFuZ2UsIGZ1cnRoZXIgdXNlcnMgd2lsbCBiZSBhZGRlZCBieSBmb2xsb3d1cCBjaGFuZ2VzLgoK
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDaGFuZ2VzIHNpbmNlIHYzOgogLSBSZW5hbWUgdG8gaW5fbWNlX2hhbmRsZXIuCiAtIERyb3Ag
cGFyZW50aGVzZXMgYXJvdW5kIGNwdSBpbiBtYWNyby4KCkNoYW5nZXMgc2luY2UgdjI6CiAtIE1v
dmUgZGVmaW5pdGlvbiBvZiBtY19jb3VudCB0byB4ODYgaGFyZGlycS5oLgotLS0KIHhlbi9hcmNo
L3g4Ni9jcHUvbWNoZWNrL21jZS5jIHwgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJx
LmggfCA2ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNo
ZWNrL21jZS5jCmluZGV4IGQ2MWU1ODJhZjMuLmU1YmQ0ZjU0MmMgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21j
ZS5jCkBAIC05Myw3ICs5Myw5IEBAIHZvaWQgeDg2X21jZV92ZWN0b3JfcmVnaXN0ZXIoeDg2X21j
ZV92ZWN0b3JfdCBoZGxyKQogCiB2b2lkIGRvX21hY2hpbmVfY2hlY2soY29uc3Qgc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpCiB7CisgICAgbWNlX2VudGVyKCk7CiAgICAgX21hY2hpbmVfY2hl
Y2tfdmVjdG9yKHJlZ3MpOworICAgIG1jZV9leGl0KCk7CiB9CiAKIC8qCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGly
cS5oCmluZGV4IDA2OWU0OGZjZTkuLjI3NmUzNDE5ZDcgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvaGFyZGlycS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oCkBA
IC04LDYgKzgsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAJdW5zaWduZWQgaW50IF9fc29mdGlycV9w
ZW5kaW5nOwogCXVuc2lnbmVkIGludCBfX2xvY2FsX2lycV9jb3VudDsKIAl1bnNpZ25lZCBpbnQg
bm1pX2NvdW50OworCXVuc2lnbmVkIGludCBtY2VfY291bnQ7CiAJYm9vbF90IF9fbXdhaXRfd2Fr
ZXVwOwogfSBfX2NhY2hlbGluZV9hbGlnbmVkIGlycV9jcHVzdGF0X3Q7CiAKQEAgLTIzLDYgKzI0
LDExIEBAIHR5cGVkZWYgc3RydWN0IHsKICNkZWZpbmUgbm1pX2VudGVyKCkJCShubWlfY291bnQo
c21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQogI2RlZmluZSBubWlfZXhpdCgpCQkobm1pX2NvdW50KHNt
cF9wcm9jZXNzb3JfaWQoKSktLSkKIAorI2RlZmluZSBtY2VfY291bnQoY3B1KQkJX19JUlFfU1RB
VChjcHUsIG1jZV9jb3VudCkKKyNkZWZpbmUgaW5fbWNlX2hhbmRsZXIoKQkobWNlX2NvdW50KHNt
cF9wcm9jZXNzb3JfaWQoKSkgIT0gMCkKKyNkZWZpbmUgbWNlX2VudGVyKCkJCShtY2VfY291bnQo
c21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQorI2RlZmluZSBtY2VfZXhpdCgpCQkobWNlX2NvdW50KHNt
cF9wcm9jZXNzb3JfaWQoKSktLSkKKwogdm9pZCBhY2tfYmFkX2lycSh1bnNpZ25lZCBpbnQgaXJx
KTsKIAogZXh0ZXJuIHZvaWQgYXBpY19pbnRyX2luaXQodm9pZCk7Ci0tIAoyLjI1LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
