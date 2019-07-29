Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C378FAD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:44:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7mE-0000sg-Uw; Mon, 29 Jul 2019 15:41:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yGCc=V2=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hs7mD-0000s2-6j
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:41:29 +0000
X-Inumbo-ID: 53d50ba1-b217-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 53d50ba1-b217-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:41:27 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EfVmCSp/3iSv1XZUlDJQdS4SR95+T40KnPCZJ6RZRzFnzo6kauir8xqWQJZGVeFONIY13aDAqx
 ggtolvWdsfbdTB/99VAfGZFR2QOQB8YWwyzImnKJOiLil0WblUPR5AZAWqHuPry7AMyjyiwBxz
 cH0DUSO3YTJtfbkoEcUklYxs/DJUWB2ImQFZrvmK05adZQny+1CMlxopjjXi5ENumd/xcmWfBY
 IpPsGBAjtdS1kKO2FJm6dp+3gkilSXQzXnF3Kt9Rr0unhgqCMpBsE/7YhrPpX+wbNo4GePDqSu
 /MQ=
X-SBRS: 2.7
X-MesageID: 3709473
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3709473"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 16:41:12 +0100
Message-ID: <20190729154112.7644-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
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
Cc: Juergen Gross <jgross@suse.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBzdXNwZW5kaW5nL3Jlc3VtaW5nIG9yIG1pZ3JhdGluZyB1bmRlciBYZW4sIHRoZXJlIGlz
bid0IG11Y2ggbmVlZApmb3Igc3VzcGVuZGluZyBhbmQgcmVzdW1pbmcgYWxsIHRoZSBhdHRhY2hl
ZCBkZXZpY2VzIHNpbmNlIHRoZSBYZW4vUUVNVQpzaG91bGQgY29ycmVjdGx5IG1haW50YWluIHRo
ZSBoYXJkd2FyZSBzdGF0ZS4gRHJvcCB0aGVzZSBjYWxscyBhbmQKcmVwbGFjZSB3aXRoIG1vcmUg
c3BlY2lmaWMgY2FsbHMgdG8gZW5zdXJlIFhlbiBmcm9udGVuZCBkZXZpY2VzIGFyZQpwcm9wZXJs
eSByZWNvbm5lY3RlZC4KClRoaXMgY2hhbmdlIGlzIG5lZWRlZCB0byBtYWtlIE5WSURJQSB2R1BV
IG1pZ3JhdGlvbiB3b3JrIHVuZGVyIFhlbiBzaW5jZQp0aGUgdkdQVSBkZXZpY2UgYmVpbmcgc3Vz
cGVuZGVkIGludGVyZmVyZXMgd2l0aCB0aGF0IHdvcmtpbmcgY29ycmVjdGx5LgpIb3dldmVyLCBp
dCBoYXMgdGhlIGFkZGVkIGJlbmVmaXQgb2YgcmVkdWNpbmcgbWlncmF0aW9uIGRvd250aW1lIC0g
YnkKYXBwcm94aW1hdGVseSA1MDBtcyB3aXRoIGFuIEhWTSBndWVzdCBpbiBteSBlbnZpcm9ubWVu
dC4KClRlc3RlZCBieSBwdXR0aW5nIGFuIEhWTSBndWVzdCB0aHJvdWdoIDEwMDAgbWlncmF0aW9u
IGN5Y2xlcy4gSSBhbHNvCnRlc3RlZCBQViBndWVzdCBtaWdyYXRpb24gKHRob3VnaCBsZXNzIHJp
Z29yb3VzbHkpLgoKU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+Ci0tLQogZHJpdmVycy94ZW4vbWFuYWdlLmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgMjQgKysrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZV9mcm9udGVuZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUveGVu
L3hlbmJ1cy5oICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9tYW5hZ2UuYyBiL2RyaXZlcnMveGVuL21hbmFnZS5jCmluZGV4IGNkMDQ2Njg0ZTBkMS4u
NTM3NjhlMGUyNTYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9tYW5hZ2UuYworKysgYi9kcml2
ZXJzL3hlbi9tYW5hZ2UuYwpAQCAtMTEzLDIxICsxMTMsMTIgQEAgc3RhdGljIHZvaWQgZG9fc3Vz
cGVuZCh2b2lkKQogCQlnb3RvIG91dF90aGF3OwogCX0KIAotCWVyciA9IGRwbV9zdXNwZW5kX3N0
YXJ0KFBNU0dfRlJFRVpFKTsKLQlpZiAoZXJyKSB7Ci0JCXByX2VycigiJXM6IGRwbV9zdXNwZW5k
X3N0YXJ0ICVkXG4iLCBfX2Z1bmNfXywgZXJyKTsKLQkJZ290byBvdXRfdGhhdzsKLQl9CisJeGVu
YnVzX3N1c3BlbmRfZnJvbnRlbmRzKCk7CiAKIAlwcmludGsoS0VSTl9ERUJVRyAic3VzcGVuZGlu
ZyB4ZW5zdG9yZS4uLlxuIik7CiAJeHNfc3VzcGVuZCgpOwogCi0JZXJyID0gZHBtX3N1c3BlbmRf
ZW5kKFBNU0dfRlJFRVpFKTsKLQlpZiAoZXJyKSB7Ci0JCXByX2VycigiZHBtX3N1c3BlbmRfZW5k
IGZhaWxlZDogJWRcbiIsIGVycik7Ci0JCXNpLmNhbmNlbGxlZCA9IDA7Ci0JCWdvdG8gb3V0X3Jl
c3VtZTsKLQl9CisJc3VzcGVuZF9kZXZpY2VfaXJxcygpOwogCiAJeGVuX2FyY2hfc3VzcGVuZCgp
OwogCkBAIC0xNDEsNyArMTMyLDcgQEAgc3RhdGljIHZvaWQgZG9fc3VzcGVuZCh2b2lkKQogCiAJ
cmF3X25vdGlmaWVyX2NhbGxfY2hhaW4oJnhlbl9yZXN1bWVfbm90aWZpZXIsIDAsIE5VTEwpOwog
Ci0JZHBtX3Jlc3VtZV9zdGFydChzaS5jYW5jZWxsZWQgPyBQTVNHX1RIQVcgOiBQTVNHX1JFU1RP
UkUpOworCXJlc3VtZV9kZXZpY2VfaXJxcygpOwogCiAJaWYgKGVycikgewogCQlwcl9lcnIoImZh
aWxlZCB0byBzdGFydCB4ZW5fc3VzcGVuZDogJWRcbiIsIGVycik7CkBAIC0xNTAsMTMgKzE0MSwx
MiBAQCBzdGF0aWMgdm9pZCBkb19zdXNwZW5kKHZvaWQpCiAKIAl4ZW5fYXJjaF9yZXN1bWUoKTsK
IAotb3V0X3Jlc3VtZToKLQlpZiAoIXNpLmNhbmNlbGxlZCkKKwlpZiAoIXNpLmNhbmNlbGxlZCkg
ewogCQl4c19yZXN1bWUoKTsKLQllbHNlCisJCXhlbmJ1c19yZXN1bWVfZnJvbnRlbmRzKCk7CisJ
fSBlbHNlIHsKIAkJeHNfc3VzcGVuZF9jYW5jZWwoKTsKLQotCWRwbV9yZXN1bWVfZW5kKHNpLmNh
bmNlbGxlZCA/IFBNU0dfVEhBVyA6IFBNU0dfUkVTVE9SRSk7CisJfQogCiBvdXRfdGhhdzoKIAl0
aGF3X3Byb2Nlc3NlcygpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19w
cm9iZV9mcm9udGVuZC5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVu
ZC5jCmluZGV4IGE3ZDkwYTcxOWNlYS4uOGNkODM2YzQwMmUxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Zyb250ZW5kLmMKKysrIGIvZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jCkBAIC0xNTMsNiArMTUzLDI4IEBAIHN0YXRpYyBz
dHJ1Y3QgeGVuX2J1c190eXBlIHhlbmJ1c19mcm9udGVuZCA9IHsKIAl9LAogfTsKIAorc3RhdGlj
IGludCB4ZW5idXNfc3VzcGVuZF9vbmUoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQor
eworCXhlbmJ1c19kZXZfc3VzcGVuZChkZXYpOworCXJldHVybiAwOworfQorCit2b2lkIHhlbmJ1
c19zdXNwZW5kX2Zyb250ZW5kcyh2b2lkKQoreworCWJ1c19mb3JfZWFjaF9kZXYoJnhlbmJ1c19m
cm9udGVuZC5idXMsIE5VTEwsIE5VTEwsIHhlbmJ1c19zdXNwZW5kX29uZSk7Cit9CisKK3N0YXRp
YyBpbnQgeGVuYnVzX3Jlc3VtZV9vbmUoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQor
eworCXhlbmJ1c19mcm9udGVuZF9kZXZfcmVzdW1lKGRldik7CisJcmV0dXJuIDA7Cit9CisKK3Zv
aWQgeGVuYnVzX3Jlc3VtZV9mcm9udGVuZHModm9pZCkKK3sKKwlidXNfZm9yX2VhY2hfZGV2KCZ4
ZW5idXNfZnJvbnRlbmQuYnVzLCBOVUxMLCBOVUxMLCB4ZW5idXNfcmVzdW1lX29uZSk7Cit9CisK
IHN0YXRpYyB2b2lkIGZyb250ZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0Y2gs
CiAJCQkgICAgIGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnRva2VuKQogewpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS94ZW4veGVuYnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAppbmRleCA4
NjljODE2ZDVmOGMuLjcxZWViNDQyYzM3NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVz
LmgKKysrIGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKQEAgLTIzMyw0ICsyMzMsNyBAQCBleHRlcm4g
Y29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB4ZW5feGVuYnVzX2ZvcHM7CiBleHRlcm4gc3Ry
dWN0IHhlbnN0b3JlX2RvbWFpbl9pbnRlcmZhY2UgKnhlbl9zdG9yZV9pbnRlcmZhY2U7CiBleHRl
cm4gaW50IHhlbl9zdG9yZV9ldnRjaG47CiAKK3ZvaWQgeGVuYnVzX3N1c3BlbmRfZnJvbnRlbmRz
KHZvaWQpOwordm9pZCB4ZW5idXNfcmVzdW1lX2Zyb250ZW5kcyh2b2lkKTsKKwogI2VuZGlmIC8q
IF9YRU5fWEVOQlVTX0ggKi8KLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
