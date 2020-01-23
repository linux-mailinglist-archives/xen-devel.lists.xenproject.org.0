Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D2147078
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 19:08:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iugsX-0008Ik-MJ; Thu, 23 Jan 2020 18:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iugsW-0008Hv-5g
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 18:06:52 +0000
X-Inumbo-ID: 1c77bba8-3e0b-11ea-9fd7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c77bba8-3e0b-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 18:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579802803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SXGA3aDmcS42579i+1MDy79V4hdE3QhfUicYF1TSlic=;
 b=AHCWN+yPX7tcdd/kHs+ekQ9Xef6EC4Ih7CvnWYyFBKq28aHKTERyfGkI
 oTZMdaPLkKE9kaCiTBT5TDk7t2uSMTTQNdxePi3A4IoGl70cAiwwfm+kw
 q19twrsIO5gzePkXdVtlyCp+YzbaOEHZ63GU6BFbn6TJrJ+x4GT0Qumoj c=;
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
IronPort-SDR: 0WuZWW6ihzgfXRpz9SP5E8wT2rE1O1V40spXKq3QViAcDGNVISg2lkm/S7DD8uh4feyLdezqN2
 EWMXcNhicDp+qGWaUR/JFyeMpJS/mzFHoo5kg2oUOlfqfPCR9OuqRISsn1GpBopLhxqW1kyKHH
 ZY4febRaqRiAN+u3xxk7m7FRnY2JpBXm+PdNuPwyyE1oQo+QvrtwCIPMXbxcNbFZrswwdrtaPO
 m1uS9twMRbDXPlSIDOi8EhqfH1WgyY9Pfp1dRREDmrMTwYBr8mizReP1gSvIlKO6Qh3mVE+e83
 7Fw=
X-SBRS: 2.7
X-MesageID: 11950472
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11950472"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 19:06:15 +0100
Message-ID: <20200123180615.69370-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123180615.69370-1-roger.pau@citrix.com>
References: <20200123180615.69370-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] x86/apic: simplify disconnect_bsp_APIC
 setup of LVT{0/1}
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBuZWVkIHRvIHJlYWQgdGhlIGN1cnJlbnQgdmFsdWVzIG9mIExWVHswLzF9IGZv
ciB0aGUKcHVycG9zZXMgb2YgdGhlIGZ1bmN0aW9uLCB3aGljaCBzZWVtIHRvIGJlIHRvIHNhdmUg
dGhlIGN1cnJlbnRseQpzZWxlY3RlZCB2ZWN0b3I6IGluIHRoZSBkZXN0aW5hdGlvbiBtb2RlcyB1
c2VkIChFeHRJTlQgYW5kIE5NSSkgdGhlCnZlY3RvciBmaWVsZCBpcyBpZ25vcmVkIGFuZCBoZW5j
ZSBjYW4gYmUgc2V0IHRvIDAuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5jIHwgMTUgKystLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwpp
bmRleCA1MDhiMTU4NmYyLi5jMTgzMTRjMWEzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBp
Yy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKQEAgLTI3MywyMyArMjczLDEyIEBAIHZvaWQg
ZGlzY29ubmVjdF9ic3BfQVBJQyhpbnQgdmlydF93aXJlX3NldHVwKQogCiAgICAgICAgIGlmICgh
dmlydF93aXJlX3NldHVwKSB7CiAgICAgICAgICAgICAvKiBGb3IgTFZUMCBtYWtlIGl0IGVkZ2Ug
dHJpZ2dlcmVkLCBhY3RpdmUgaGlnaCwgZXh0ZXJuYWwgYW5kIGVuYWJsZWQgKi8KLSAgICAgICAg
ICAgIHZhbHVlID0gYXBpY19yZWFkKEFQSUNfTFZUMCk7Ci0gICAgICAgICAgICB2YWx1ZSAmPSB+
KEFQSUNfTU9ERV9NQVNLIHwgQVBJQ19TRU5EX1BFTkRJTkcgfAotICAgICAgICAgICAgICAgICAg
ICAgICBBUElDX0lOUFVUX1BPTEFSSVRZIHwgQVBJQ19MVlRfUkVNT1RFX0lSUiB8Ci0gICAgICAg
ICAgICAgICAgICAgICAgIEFQSUNfTFZUX0xFVkVMX1RSSUdHRVIgfCBBUElDX0xWVF9NQVNLRUQg
KTsKLSAgICAgICAgICAgIHZhbHVlIHw9IEFQSUNfTFZUX1JFTU9URV9JUlIgfCBBUElDX1NFTkRf
UEVORElORzsKLSAgICAgICAgICAgIHZhbHVlID0gU0VUX0FQSUNfREVMSVZFUllfTU9ERSh2YWx1
ZSwgQVBJQ19NT0RFX0VYVElOVCk7CisgICAgICAgICAgICB2YWx1ZSA9IEFQSUNfTFZUX1JFTU9U
RV9JUlIgfCBBUElDX1NFTkRfUEVORElORyB8IEFQSUNfRE1fRVhUSU5UOwogICAgICAgICAgICAg
YXBpY193cml0ZShBUElDX0xWVDAsIHZhbHVlKTsKICAgICAgICAgfQogCiAgICAgICAgIC8qIEZv
ciBMVlQxIG1ha2UgaXQgZWRnZSB0cmlnZ2VyZWQsIGFjdGl2ZSBoaWdoLCBubWkgYW5kIGVuYWJs
ZWQgKi8KLSAgICAgICAgdmFsdWUgPSBhcGljX3JlYWQoQVBJQ19MVlQxKTsKLSAgICAgICAgdmFs
dWUgJj0gfigKLSAgICAgICAgICAgIEFQSUNfTU9ERV9NQVNLIHwgQVBJQ19TRU5EX1BFTkRJTkcg
fAotICAgICAgICAgICAgQVBJQ19JTlBVVF9QT0xBUklUWSB8IEFQSUNfTFZUX1JFTU9URV9JUlIg
fAotICAgICAgICAgICAgQVBJQ19MVlRfTEVWRUxfVFJJR0dFUiB8IEFQSUNfTFZUX01BU0tFRCk7
Ci0gICAgICAgIHZhbHVlIHw9IEFQSUNfTFZUX1JFTU9URV9JUlIgfCBBUElDX1NFTkRfUEVORElO
RzsKLSAgICAgICAgdmFsdWUgPSBTRVRfQVBJQ19ERUxJVkVSWV9NT0RFKHZhbHVlLCBBUElDX01P
REVfTk1JKTsKKyAgICAgICAgdmFsdWUgPSBBUElDX0xWVF9SRU1PVEVfSVJSIHwgQVBJQ19TRU5E
X1BFTkRJTkcgfCBBUElDX0RNX05NSTsKICAgICAgICAgYXBpY193cml0ZShBUElDX0xWVDEsIHZh
bHVlKTsKICAgICB9CiB9Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
