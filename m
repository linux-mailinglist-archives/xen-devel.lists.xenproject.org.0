Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D186CDC8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho52K-0000sw-Q5; Thu, 18 Jul 2019 11:57:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho52I-0000sr-U9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 11:57:22 +0000
X-Inumbo-ID: 32af65e9-a953-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 32af65e9-a953-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 11:57:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B133C2B;
 Thu, 18 Jul 2019 04:57:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A6B3F71A;
 Thu, 18 Jul 2019 04:57:19 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 18 Jul 2019 12:57:14 +0100
Message-Id: <20190718115714.634-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm64: Correctly compute the virtual
 address in maddr_to_virt()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGhlbHBlciBtYWRkcl90b192aXJ0KCkgaXMgdXNlZCB0byB0cmFuc2xhdGUgYSBtYWNoaW5l
IGFkZHJlc3MgdG8gYQp2aXJ0dWFsIGFkZHJlc3MuIFRvIHNhdmUgc29tZSB2YWx1YWJsZSBhZGRy
ZXNzIHNwYWNlLCBzb21lIHBhcnQgb2YgdGhlCm1hY2hpbmUgYWRkcmVzcyBtYXkgYmUgY29tcHJl
c3NlZC4KCkluIHRoZW9yeSB0aGUgUERYIGNvZGUgaXMgZnJlZSB0byBjb21wcmVzcyBhbnkgYml0
cyBzbyB0aGVyZSBhcmUgbm8KZ3VhcmFudGVlIHRoZSBtYWNoaW5lIGluZGV4IGNvbXB1dGVkIHdp
bGwgYmUgYWx3YXlzIGdyZWF0ZXIgdGhhbgp4ZW5oZWFwX21mbl9zdGFydC4gVGhpcyB3b3VsZCBy
ZXN1bHQgdG8gcmV0dXJuIGEgdmlydHVhbCBhZGRyZXNzIHRoYXQgaXMKbm90IHBhcnQgb2YgdGhl
IGRpcmVjdCBtYXAgYW5kIHRyaWdnZXIgYSBjcmFzaCBhdCBsZWFzdCBvbiBkZWJ1Zy1idWlsZCBs
YXRlcgpvbiBiZWNhdXNlIG9mIHRoZSBjaGVjayBpbiB2aXJ0X3RvX3BhZ2UoKS4KCkEgcmVjZW50
bHkgcmV2ZXJ0ZWQgcGF0Y2ggKHNlZSAxMTkxMTU2MzYxICJ4ZW4vYXJtOiBmaXggbWFzayBjYWxj
dWxhdGlvbgppbiBwZHhfaW5pdF9tYXNrIikgYWxsb3dzIHRoZSBQRFggdG8gY29tcHJlc3MgbW9y
ZSBiaXRzIGFuZCB0cmlnZ2VyZWQgYQpjcmFzaCBvbiBBTUQgU2VhdHRsZSBQbGF0Zm9ybS4KCkF2
b2lkIHRoZSBjcmFzaCBieSBrZWVwaW5nIHRyYWNrIG9mIHRoZSBiYXNlIFBEWCBmb3IgdGhlIHhl
bmhlYXAgYW5kIHVzZQppdCBmb3IgY29tcHV0aW5nIHRoZSB2aXJ0dWFsIGFkZHJlc3MuCgpOb3Rl
IHRoYXQgdmlydF90b19tYWRkcigpIGRvZXMgbm90IG5lZWQgdG8gaGF2ZSBzaW1pbGFyIG1vZGlm
aWNhdGlvbiBhcwppdCBpcyB1c2luZyB0aGUgaGFyZHdhcmUgdG8gdHJhbnNsYXRlIHRoZSB2aXJ0
dWFsIGFkZHJlc3MgdG8gYSBtYWNoaW5lCmFkZHJlc3MuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSB0
byBmaXggdGhlIEFTU0VSVCgpIGFzIHRoZSBkaXJlY3QgbWFwIGJhc2UgYWRkcmVzcwpjb3JyZXNw
b25kIHRvIHRoZSBzdGFydCBvZiB0aGUgUkFNICh0aGlzIGlzIG5vdCBhbHdheXMgMCkuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCgpXaXRo
IHRoYXQsIHRoZSBwYXRjaCAxMTkxMTU2MzYxICJ4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlv
biBpbgpwZHhfaW5pdF9tYXNrIiBjb3VsZCBiZSByZS1pbnN0YXRlZC4KLS0tCiB4ZW4vYXJjaC9h
cm0vbW0uYyAgICAgICAgfCAyICsrCiB4ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggfCA2ICsrKyst
LQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA0NDI1
OGFkODljLi5lMWNkZWFhZjJmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTY1LDYgKzE2NSw3IEBAIG1mbl90IHhlbmhlYXBfbWZuX2Vu
ZCBfX3JlYWRfbW9zdGx5OwogdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfZW5kIF9fcmVhZF9tb3N0bHk7
CiAjaWZkZWYgQ09ORklHX0FSTV82NAogdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQgX19yZWFk
X21vc3RseTsKK3Vuc2lnbmVkIGxvbmcgeGVuaGVhcF9iYXNlX3BkeCBfX3JlYWRfbW9zdGx5Owog
I2VuZGlmCiAKIHVuc2lnbmVkIGxvbmcgZnJhbWV0YWJsZV9iYXNlX3BkeCBfX3JlYWRfbW9zdGx5
OwpAQCAtNzk2LDYgKzc5Nyw3IEBAIHZvaWQgX19pbml0IHNldHVwX3hlbmhlYXBfbWFwcGluZ3Mo
dW5zaWduZWQgbG9uZyBiYXNlX21mbiwKICAgICBpZiAoIG1mbl9lcSh4ZW5oZWFwX21mbl9zdGFy
dCwgSU5WQUxJRF9NRk4pICkKICAgICB7CiAgICAgICAgIHhlbmhlYXBfbWZuX3N0YXJ0ID0gX21m
bihiYXNlX21mbik7CisgICAgICAgIHhlbmhlYXBfYmFzZV9wZHggPSBtZm5fdG9fcGR4KF9tZm4o
YmFzZV9tZm4pKTsKICAgICAgICAgeGVuaGVhcF92aXJ0X3N0YXJ0ID0gRElSRUNUTUFQX1ZJUlRf
U1RBUlQgKwogICAgICAgICAgICAgKGJhc2VfbWZuIC0gbWZuKSAqIFBBR0VfU0laRTsKICAgICB9
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20t
YXJtL21tLmgKaW5kZXggM2RiYzhhNjQ2OS4uZDZiNTU0NDAxNSAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaApAQCAtMTM1
LDYgKzEzNSw3IEBAIGV4dGVybiBtZm5fdCB4ZW5oZWFwX21mbl9zdGFydCwgeGVuaGVhcF9tZm5f
ZW5kOwogZXh0ZXJuIHZhZGRyX3QgeGVuaGVhcF92aXJ0X2VuZDsKICNpZmRlZiBDT05GSUdfQVJN
XzY0CiBleHRlcm4gdmFkZHJfdCB4ZW5oZWFwX3ZpcnRfc3RhcnQ7CitleHRlcm4gdW5zaWduZWQg
bG9uZyB4ZW5oZWFwX2Jhc2VfcGR4OwogI2VuZGlmCiAKICNpZmRlZiBDT05GSUdfQVJNXzMyCkBA
IC0yNTMsOSArMjU0LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAqbWFkZHJfdG9fdmlydChwYWRk
cl90IG1hKQogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgdm9pZCAqbWFkZHJfdG9fdmlydChwYWRkcl90
IG1hKQogewotICAgIEFTU0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIDwgKERJUkVD
VE1BUF9TSVpFID4+IFBBR0VfU0hJRlQpKTsKKyAgICBBU1NFUlQoKG1mbl90b19wZHgobWFkZHJf
dG9fbWZuKG1hKSkgLSB4ZW5oZWFwX2Jhc2VfcGR4KSA8CisgICAgICAgICAgIChESVJFQ1RNQVBf
U0laRSA+PiBQQUdFX1NISUZUKSk7CiAgICAgcmV0dXJuICh2b2lkICopKFhFTkhFQVBfVklSVF9T
VEFSVCAtCi0gICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9zdGFy
dCkgKworICAgICAgICAgICAgICAgICAgICAoeGVuaGVhcF9iYXNlX3BkeCA8PCBQQUdFX1NISUZU
KSArCiAgICAgICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0b21fbWFzaykgfAogICAg
ICAgICAgICAgICAgICAgICAgKChtYSAmIG1hX3RvcF9tYXNrKSA+PiBwZm5fcGR4X2hvbGVfc2hp
ZnQpKSk7CiB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
