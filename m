Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CC65AFC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 17:54:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlbKU-0003t7-Th; Thu, 11 Jul 2019 15:49:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3Vt=VI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hlbKT-0003t2-My
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 15:49:53 +0000
X-Inumbo-ID: 849d4b12-a3f3-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 849d4b12-a3f3-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 15:49:51 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qRofl1I6Qr4oNNray+oNlL0zs7TGMWkcug7SQqsqG192mBS6UsNNIOHt2JoyHT5NE8yGtzub3X
 pYT+6xzMT4wwaX1Ah9pheVvrs8rCv7vXo7L2yvb9F5ufZuqWKdVRbop8ULdMNkZ+2ADJ8rUH6W
 7U/rVV840AS9pD/D7ffcqNTgGQKbppyiXyBt14/lEDWcdbhviehw9dVMe8ObY7nkBP0SPE5q2n
 02ZvTrYIyurAztvqwbkxR9kedohzFSy2eTmyRt3CmwTrPkIa2TanGDqAj8ytb6Sxise7+iAxY1
 F8g=
X-SBRS: 2.7
X-MesageID: 2866608
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,479,1557201600"; 
   d="scan'208";a="2866608"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 11 Jul 2019 16:49:45 +0100
Message-ID: <20190711154945.7322-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/smpboot: Remove redundant order calculations
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEdEVCBhbmQgSURUIGFsbG9jYXRpb25zIGFyZSBhbGwgb3JkZXIgMCwgYW5kIG5vdCBnb2lu
ZyB0byBjaGFuZ2UuCgpVc2UgYW4gZXhwbGljaXQgMCwgaW5zdGVhZCBvZiBjYWxsaW5nIGdldF9v
cmRlcl9mcm9tX3BhZ2VzKCkuICBUaGlzCmFsbG93cyBmb3IgdGhlIHJlbW92YWwgb2YgdGhlICdv
cmRlcicgbG9jYWwgcGFyYW1ldGVyIGluIGJvdGgKY3B1X3NtcGJvb3Rfe2FsbG9jLGZyZWV9KCku
CgpXaGlsZSBtYWtpbmcgdGhpcyBhZGp1c3RtZW50LCByZWFycmFuZ2UgY3B1X3NtcGJvb3RfZnJl
ZSgpIHRvIGZvbGQgdGhlCnR3byAiaWYgKCByZW1vdmUgKSIgY2xhdXNlcy4gIFRoZXJlIGlzIG5v
IGV4cGxpY2l0IHJlcXVpcmVtZW50cyBmb3IgdGhlCm9yZGVyIG9mIGZyZWUoKXMuCgpObyBwcmFj
dGljYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDIyICsrKysrKysrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21w
Ym9vdC5jCmluZGV4IDAwNDI4NWQxNGMuLjY1ZTljZWVlY2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAtOTAyLDcgKzkw
Miw3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGludCBjcHUp
CiAgKi8KIHN0YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQgaW50IGNwdSwgYm9v
bCByZW1vdmUpCiB7Ci0gICAgdW5zaWduZWQgaW50IG9yZGVyLCBzb2NrZXQgPSBjcHVfdG9fc29j
a2V0KGNwdSk7CisgICAgdW5zaWduZWQgaW50IHNvY2tldCA9IGNwdV90b19zb2NrZXQoY3B1KTsK
ICAgICBzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSBjcHVfZGF0YTsKIAogICAgIGlmICggY3B1bWFz
a19lbXB0eShzb2NrZXRfY3B1bWFza1tzb2NrZXRdKSApCkBAIC05NDQsMTYgKzk0NCwxMiBAQCBz
dGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsIGJvb2wgcmVtb3Zl
KQogICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7CiAgICAg
fQogCi0gICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9wYWdlcyhOUl9SRVNFUlZFRF9HRFRfUEFH
RVMpOwotICAgIGlmICggcmVtb3ZlICkKLSAgICAgICAgRlJFRV9YRU5IRUFQX1BBR0VTKHBlcl9j
cHUoZ2R0X3RhYmxlLCBjcHUpLCBvcmRlcik7Ci0KLSAgICBmcmVlX3hlbmhlYXBfcGFnZXMocGVy
X2NwdShjb21wYXRfZ2R0X3RhYmxlLCBjcHUpLCBvcmRlcik7CisgICAgRlJFRV9YRU5IRUFQX1BB
R0UocGVyX2NwdShjb21wYXRfZ2R0X3RhYmxlLCBjcHUpKTsKIAogICAgIGlmICggcmVtb3ZlICkK
ICAgICB7Ci0gICAgICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoSURUX0VOVFJJRVMg
KiBzaXplb2YoaWR0X2VudHJ5X3QpKTsKLSAgICAgICAgRlJFRV9YRU5IRUFQX1BBR0VTKGlkdF90
YWJsZXNbY3B1XSwgb3JkZXIpOworICAgICAgICBGUkVFX1hFTkhFQVBfUEFHRShwZXJfY3B1KGdk
dF90YWJsZSwgY3B1KSk7CisgICAgICAgIEZSRUVfWEVOSEVBUF9QQUdFKGlkdF90YWJsZXNbY3B1
XSk7CiAKICAgICAgICAgaWYgKCBzdGFja19iYXNlW2NwdV0gKQogICAgICAgICB7CkBAIC05NjUs
NyArOTYxLDcgQEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1
LCBib29sIHJlbW92ZSkKIAogc3RhdGljIGludCBjcHVfc21wYm9vdF9hbGxvYyh1bnNpZ25lZCBp
bnQgY3B1KQogewotICAgIHVuc2lnbmVkIGludCBpLCBvcmRlciwgbWVtZmxhZ3MgPSAwOworICAg
IHVuc2lnbmVkIGludCBpLCBtZW1mbGFncyA9IDA7CiAgICAgbm9kZWlkX3Qgbm9kZSA9IGNwdV90
b19ub2RlKGNwdSk7CiAgICAgc2VnX2Rlc2NfdCAqZ2R0OwogICAgIHVuc2lnbmVkIGxvbmcgc3R1
Yl9wYWdlOwpAQCAtOTgwLDggKzk3Niw3IEBAIHN0YXRpYyBpbnQgY3B1X3NtcGJvb3RfYWxsb2Mo
dW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgZ290byBvdXQ7CiAgICAgbWVtZ3VhcmRfZ3VhcmRf
c3RhY2soc3RhY2tfYmFzZVtjcHVdKTsKIAotICAgIG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fcGFn
ZXMoTlJfUkVTRVJWRURfR0RUX1BBR0VTKTsKLSAgICBnZHQgPSBwZXJfY3B1KGdkdF90YWJsZSwg
Y3B1KSA/OiBhbGxvY194ZW5oZWFwX3BhZ2VzKG9yZGVyLCBtZW1mbGFncyk7CisgICAgZ2R0ID0g
cGVyX2NwdShnZHRfdGFibGUsIGNwdSkgPzogYWxsb2NfeGVuaGVhcF9wYWdlcygwLCBtZW1mbGFn
cyk7CiAgICAgaWYgKCBnZHQgPT0gTlVMTCApCiAgICAgICAgIGdvdG8gb3V0OwogICAgIHBlcl9j
cHUoZ2R0X3RhYmxlLCBjcHUpID0gZ2R0OwpAQCAtOTkxLDcgKzk4Niw3IEBAIHN0YXRpYyBpbnQg
Y3B1X3NtcGJvb3RfYWxsb2ModW5zaWduZWQgaW50IGNwdSkKICAgICBCVUlMRF9CVUdfT04oTlJf
Q1BVUyA+IDB4MTAwMDApOwogICAgIGdkdFtQRVJfQ1BVX0dEVF9FTlRSWSAtIEZJUlNUX1JFU0VS
VkVEX0dEVF9FTlRSWV0uYSA9IGNwdTsKIAotICAgIHBlcl9jcHUoY29tcGF0X2dkdF90YWJsZSwg
Y3B1KSA9IGdkdCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIG1lbWZsYWdzKTsKKyAgICBw
ZXJfY3B1KGNvbXBhdF9nZHRfdGFibGUsIGNwdSkgPSBnZHQgPSBhbGxvY194ZW5oZWFwX3BhZ2Vz
KDAsIG1lbWZsYWdzKTsKICAgICBpZiAoIGdkdCA9PSBOVUxMICkKICAgICAgICAgZ290byBvdXQ7
CiAgICAgcGVyX2NwdShjb21wYXRfZ2R0X3RhYmxlX2wxZSwgY3B1KSA9CkBAIC05OTksOSArOTk0
LDggQEAgc3RhdGljIGludCBjcHVfc21wYm9vdF9hbGxvYyh1bnNpZ25lZCBpbnQgY3B1KQogICAg
IG1lbWNweShnZHQsIGJvb3RfY3B1X2NvbXBhdF9nZHRfdGFibGUsIE5SX1JFU0VSVkVEX0dEVF9Q
QUdFUyAqIFBBR0VfU0laRSk7CiAgICAgZ2R0W1BFUl9DUFVfR0RUX0VOVFJZIC0gRklSU1RfUkVT
RVJWRURfR0RUX0VOVFJZXS5hID0gY3B1OwogCi0gICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9i
eXRlcyhJRFRfRU5UUklFUyAqIHNpemVvZihpZHRfZW50cnlfdCkpOwogICAgIGlmICggaWR0X3Rh
Ymxlc1tjcHVdID09IE5VTEwgKQotICAgICAgICBpZHRfdGFibGVzW2NwdV0gPSBhbGxvY194ZW5o
ZWFwX3BhZ2VzKG9yZGVyLCBtZW1mbGFncyk7CisgICAgICAgIGlkdF90YWJsZXNbY3B1XSA9IGFs
bG9jX3hlbmhlYXBfcGFnZXMoMCwgbWVtZmxhZ3MpOwogICAgIGlmICggaWR0X3RhYmxlc1tjcHVd
ID09IE5VTEwgKQogICAgICAgICBnb3RvIG91dDsKICAgICBtZW1jcHkoaWR0X3RhYmxlc1tjcHVd
LCBpZHRfdGFibGUsIElEVF9FTlRSSUVTICogc2l6ZW9mKGlkdF9lbnRyeV90KSk7Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
