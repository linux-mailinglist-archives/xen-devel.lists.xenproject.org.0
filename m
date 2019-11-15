Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B07FE63B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:13:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhvr-0006xA-IS; Fri, 15 Nov 2019 20:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhvq-0006wp-0L
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:11:02 +0000
X-Inumbo-ID: 0417c844-07e4-11ea-b678-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0417c844-07e4-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 20:10:49 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:10:34 -0500
Message-ID: <20191115201037.44982-4-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [RFC XEN PATCH v3 08/11] xen: arm: vgic: don't fail if
 IRQ is already connected
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIHNvbWUgSVJRcyB0aGF0IGhhcHBlbiB0byBoYXZlIG11bHRpcGxlICJpbnRlcnJ1
cHRzID0gPCAuLi4gPjsiCnByb3BlcnRpZXMgd2l0aCB0aGUgc2FtZSBJUlEgaW4gdGhlIGRldmlj
ZSB0cmVlLiBGb3IgZXhhbXBsZToKCmludGVycnVwdHMgPSA8MCAxMjMgND4sCiAgICAgICAgICAg
ICA8MCAxMjMgND4sCiAgICAgICAgICAgICA8MCAxMjMgND4sCiAgICAgICAgICAgICA8MCAxMjMg
ND4sCiAgICAgICAgICAgICA8MCAxMjMgND47CgpJbiB0aGlzIGNhc2UgaXQgc2VlbXMgdGhhdCB3
ZSBhcmUgaW52b2tpbmcgdmdpY19jb25uZWN0X2h3X2lycSBtdWx0aXBsZQp0aW1lcyBmb3IgdGhl
IHNhbWUgSVJRLgoKUmV3b3JrIHRoZSBjaGVja3MgdG8gYWxsb3cgYm9vdGluZyBpbiB0aGlzIHNj
ZW5hcmlvLgoKSSBoYXZlIG5vdCBzZWVuIGFueSBjYXNlcyB3aGVyZSB0aGUgcHJlLWV4aXN0aW5n
IHAtPmRlc2MgaXMgYW55IGRpZmZlcmVudCBmcm9tCnRoZSBuZXcgZGVzYywgc28gQlVHKCkgb3V0
IGlmIHRoZXkncmUgZGlmZmVyZW50IGZvciBub3cuCgpTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhp
bGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+CgotLS0KdjM6IG5l
dyBwYXRjaAoKSSB0ZXN0ZWQgb24gWGlsaW54IFp5bnEgVWx0cmFTY2FsZSsgd2l0aCB0aGUgb2xk
IHZHSUMuIEkgaGF2ZSBub3QgZnVsbHkKdGVzdGVkIHdpdGggQ09ORklHX05FV19WR0lDLiBUaGlz
IGhhY2sgb25seSBiZWNhbWUgbmVjZXNzYXJ5IGFmdGVyCmludHJvZHVjaW5nIHRoZSBQUEkgc2Vy
aWVzLCBhbmQgSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgdGhlIHJlYXNvbgppcyBmb3IgdGhh
dC4KCkknbSBhbHNvIHVuc3VyZSBpZiBCVUcoKWluZyBvdXQgaXMgdGhlIHJpZ2h0IHRoaW5nIHRv
IGRvIGluIGNhc2Ugb2YKZGVzYyAhPSBwLT5kZXNjLCBvciB3aGF0IGNvbmRpdGlvbnMgd291bGQg
ZXZlbiB0cmlnZ2VyIHRoaXM/IElzIHRoaXMKZnVuY3Rpb24gZXhwb3NlZCB0byBndWVzdHM/Ci0t
LQogeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgIHwgOSArKysrKysrLS0KIHhlbi9hcmNoL2FybS92
Z2ljL3ZnaWMuYyB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jIGIveGVu
L2FyY2gvYXJtL2dpYy12Z2ljLmMKaW5kZXggMmM2NmE4ZmE5Mi4uNWMxNmU2NmIzMiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Z2lj
LmMKQEAgLTQ2MCw5ICs0NjAsMTQgQEAgaW50IHZnaWNfY29ubmVjdF9od19pcnEoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCB2aXJxLAogICAgIGlmICggY29u
bmVjdCApCiAgICAgewogICAgICAgICAvKiBUaGUgVklSUSBzaG91bGQgbm90IGJlIGFscmVhZHkg
ZW5hYmxlZCBieSB0aGUgZ3Vlc3QgKi8KLSAgICAgICAgaWYgKCAhcC0+ZGVzYyAmJgotICAgICAg
ICAgICAgICF0ZXN0X2JpdChHSUNfSVJRX0dVRVNUX0VOQUJMRUQsICZwLT5zdGF0dXMpICkKKyAg
ICAgICAgaWYgKCAhdGVzdF9iaXQoR0lDX0lSUV9HVUVTVF9FTkFCTEVELCAmcC0+c3RhdHVzKSAp
CisgICAgICAgIHsKKyAgICAgICAgICAgIGlmIChwLT5kZXNjICYmIHAtPmRlc2MgIT0gZGVzYykK
KyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBCVUcoKTsKKyAgICAgICAgICAgIH0KICAg
ICAgICAgICAgIHAtPmRlc2MgPSBkZXNjOworICAgICAgICB9CiAgICAgICAgIGVsc2UKICAgICAg
ICAgICAgIHJldCA9IC1FQlVTWTsKICAgICB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdp
Yy92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKaW5kZXggZjBmMmVhNTAyMS4uYWE3
NzVmNzY2OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCisrKyBiL3hlbi9h
cmNoL2FybS92Z2ljL3ZnaWMuYwpAQCAtODgyLDYgKzg4MiwxMCBAQCBpbnQgdmdpY19jb25uZWN0
X2h3X2lycShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdmNwdSwKICAgICAgICAgICAg
IGlycS0+aHcgPSB0cnVlOwogICAgICAgICAgICAgaXJxLT5od2ludGlkID0gZGVzYy0+aXJxOwog
ICAgICAgICB9CisgICAgICAgIGVsc2UgaWYgKCBpcnEtPmh3ICYmICFpcnEtPmVuYWJsZWQgJiYg
aXJxLT5od2ludGlkID09IGRlc2MtPmlycSApCisgICAgICAgIHsKKyAgICAgICAgICAgIC8qIFRo
ZSBJUlEgd2FzIGFscmVhZHkgY29ubmVjdGVkLiBObyBhY3Rpb24gaXMgbmVjZXNzYXJ5LiAqLwor
ICAgICAgICB9CiAgICAgICAgIGVsc2UKICAgICAgICAgICAgIHJldCA9IC1FQlVTWTsKICAgICB9
Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
