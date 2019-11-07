Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB18F3206
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:08:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjMy-0005EJ-Ia; Thu, 07 Nov 2019 15:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/O7A=Y7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iSjMw-0005E3-Jd
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:06:42 +0000
X-Inumbo-ID: 326b155e-0170-11ea-a1c9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 326b155e-0170-11ea-a1c9-12813bfff9fa;
 Thu, 07 Nov 2019 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573139198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OE+f9aiGrdQpcYE0FBZUsEseU44mWKKq6nuR6YmVfzc=;
 b=YKeYQZyJaQQTtjx7dyGfG6070oRns7TDoiw+SvMqJ0jaIXwQoQZq/PNu
 mEfWX8lOUC8q89fgNS8iHuAZZuVuWF2bGZwr1dXZ5yj2B+adKTKFsSrVU
 h/JLafMj9HokQ7S703HWDaPaYB1Cu5jDLl3P8l0w7pYBhyPxGLxDLtCIf k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1DsmRLY4CVsBQcI/NGNzx+vpAzkBdnSE7ukBj5VxYFyzfNimrm/3euzvBDuh2L4hh/zT1I03DG
 nle3LbFHQE4qNp9/GFlpwwqK/st+MXZZRE6cFdWC6pRtbwBkgz5TpmQaG1dIY85+vBfma6wMdF
 chQFBQc4IOxhBObWD1BV3ZzAVgxhDXyMxmFtRDTkywNQc56fe3Az3ovUp8RttftFzkUnE0kpOo
 F9L+3eQqFiSWYDKJ6pYaTOHyHRLpTdeqfoBQPRuXAfU83c7mybNKUavoBpUdDsxbacOuwZWwAb
 5LU=
X-SBRS: 2.7
X-MesageID: 8511637
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8511637"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 7 Nov 2019 16:06:08 +0100
Message-ID: <20191107150609.93004-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107150609.93004-1-roger.pau@citrix.com>
References: <20191107150609.93004-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 1/2] x86/ioapic: remove usage of TRUE
 and FALSE in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGluc3RlYWQgdXNlIHByb3BlciBib29sZWFucy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50
ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW9f
YXBpYy5jIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwppbmRleCAzN2VhYmMxNmM5Li5iOWM2NmFj
ZGIzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9pb19hcGljLmMKQEAgLTUwMiw3ICs1MDIsNyBAQCBzdGF0aWMgdm9pZCBjbGVhcl9JT19BUElD
X3Bpbih1bnNpZ25lZCBpbnQgYXBpYywgdW5zaWduZWQgaW50IHBpbikKICAgICBzdHJ1Y3QgSU9f
QVBJQ19yb3V0ZV9lbnRyeSBlbnRyeTsKIAogICAgIC8qIENoZWNrIGRlbGl2ZXJ5X21vZGUgdG8g
YmUgc3VyZSB3ZSdyZSBub3QgY2xlYXJpbmcgYW4gU01JIHBpbiAqLwotICAgIGVudHJ5ID0gX19p
b2FwaWNfcmVhZF9lbnRyeShhcGljLCBwaW4sIEZBTFNFKTsKKyAgICBlbnRyeSA9IF9faW9hcGlj
X3JlYWRfZW50cnkoYXBpYywgcGluLCBmYWxzZSk7CiAgICAgaWYgKGVudHJ5LmRlbGl2ZXJ5X21v
ZGUgPT0gZGVzdF9TTUkpCiAgICAgICAgIHJldHVybjsKIApAQCAtNTEyLDE1ICs1MTIsMTUgQEAg
c3RhdGljIHZvaWQgY2xlYXJfSU9fQVBJQ19waW4odW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVk
IGludCBwaW4pCiAgICAgICovCiAgICAgaWYgKCFlbnRyeS5tYXNrKSB7CiAgICAgICAgIGVudHJ5
Lm1hc2sgPSAxOwotICAgICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4sIEZBTFNF
LCBlbnRyeSk7CisgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgZmFsc2Us
IGVudHJ5KTsKICAgICB9Ci0gICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBp
biwgVFJVRSk7CisgICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgdHJ1
ZSk7CiAKICAgICBpZiAoZW50cnkuaXJyKSB7CiAgICAgICAgIC8qIE1ha2Ugc3VyZSB0aGUgdHJp
Z2dlciBtb2RlIGlzIHNldCB0byBsZXZlbC4gKi8KICAgICAgICAgaWYgKCFlbnRyeS50cmlnZ2Vy
KSB7CiAgICAgICAgICAgICBlbnRyeS50cmlnZ2VyID0gMTsKLSAgICAgICAgICAgIF9faW9hcGlj
X3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgVFJVRSwgZW50cnkpOworICAgICAgICAgICAgX19pb2Fw
aWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCB0cnVlLCBlbnRyeSk7CiAgICAgICAgIH0KICAgICAg
ICAgX19pb19hcGljX2VvaShhcGljLCBlbnRyeS52ZWN0b3IsIHBpbik7CiAgICAgfQpAQCAtNTMw
LDkgKzUzMCw5IEBAIHN0YXRpYyB2b2lkIGNsZWFyX0lPX0FQSUNfcGluKHVuc2lnbmVkIGludCBh
cGljLCB1bnNpZ25lZCBpbnQgcGluKQogICAgICAqLwogICAgIG1lbXNldCgmZW50cnksIDAsIHNp
emVvZihlbnRyeSkpOwogICAgIGVudHJ5Lm1hc2sgPSAxOwotICAgIF9faW9hcGljX3dyaXRlX2Vu
dHJ5KGFwaWMsIHBpbiwgVFJVRSwgZW50cnkpOworICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFw
aWMsIHBpbiwgdHJ1ZSwgZW50cnkpOwogCi0gICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5
KGFwaWMsIHBpbiwgVFJVRSk7CisgICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMs
IHBpbiwgdHJ1ZSk7CiAgICAgaWYgKGVudHJ5LmlycikKICAgICAgICAgcHJpbnRrKEtFUk5fRVJS
ICJJTy1BUElDJTAyeC0ldTogVW5hYmxlIHRvIHJlc2V0IElSUlxuIiwKICAgICAgICAgICAgICAg
IElPX0FQSUNfSUQoYXBpYyksIHBpbik7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
