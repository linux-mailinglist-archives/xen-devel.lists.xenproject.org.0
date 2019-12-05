Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF96114958
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 23:33:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iczdc-0002ll-Sq; Thu, 05 Dec 2019 22:30:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iczdb-0002lc-G3
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 22:30:19 +0000
X-Inumbo-ID: cdda68a6-17ae-11ea-b4e9-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdda68a6-17ae-11ea-b4e9-bc764e2007e4;
 Thu, 05 Dec 2019 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575585013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpIOhYimmVKJ2BQvcE8WFnG5aSU4yCKnAe+zqmqTB10=;
 b=B8+jNZwawspah8E/tFZ9fjYQ1G3GjSdAERy4q6MgA9JoOeqCvMeLwZur
 8aO0lx0Q0nEdEgFrWksp46GtEv0aBmjoSFWjTLilLAGLiyKBWgHinIw9K
 FIY2evFRondgq/Q40a+3btay8DqhLgcAZ+rSTdCwYOJW5+RpqQpHWczfn 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FrxmuZyQPc6PdAqELH3XtLZm57rIrO+k0nuJORln7n9hF92sjvwcv6JIwHI2Jb2Ucaj8yBDB++
 vHbNiMLkFvrwjXJwQSSIraPE4cGFAunAfdbZyJsZSbV18pjAz0aL6tYLdhNArytRkvMo8R+22g
 gCl66KN9zkhA4EigbaLxM45nBikX4rHMwoXWMPdlu2miZskuXyICRHQW8sd2yAsgMLNxcsKIK4
 VZ0bFkgPHNdIjKe3TwZ+CM09mV+yWZ0f+ayvxiYXYj9g3FYieRx+OlR1lWxz0FHKOcxV7RVQ/i
 IRs=
X-SBRS: 2.7
X-MesageID: 9693364
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9693364"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 22:30:03 +0000
Message-ID: <20191205223008.8623-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191205223008.8623-1-andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/6] xen/tasklet: Fix return value truncation on
 arm64
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVzZSBvZiByZXR1cm5fcmVnKCkgYXNzdW1lcyBBUk0ncyAzMmJpdCBBQkkuICBUaGVyZWZv
cmUsIGEgZmFpbHVyZSBzdWNoIGFzCi1FSU5WQUwgd2lsbCBhcHBlYXIgYXMgYSBsYXJnZSBwb3Np
dGl2ZSBudW1iZXIgbmVhciA0IGJpbGxpb24gdG8gYSA2NGJpdCBBUk0KZ3Vlc3Qgd2hpY2ggaGFw
cGVucyB0byB1c2UgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLgoKSW50cm9kdWNlIGEgbmV3
IGFyY2hfaHlwZXJjYWxsX3Rhc2tsZXRfcmVzdWx0KCkgaG9vayB3aGljaCBpcyBpbXBsZW1lbnRl
ZCBieQpib3RoIGFyY2hpdGVjdHVyZXMsIGFuZCBkcm9wIHRoZSByZXR1cm5fcmVnKCkgbWFjcm9z
LiAgVGhpcyBsb2dpYyB3aWxsIGJlCmV4dGVuZGVkIGluIGEgbGF0ZXIgY2hhbmdlIHRvIG1ha2Ug
Y29udGludWF0aW9ucyBvdXQgb2YgdGhlIHRhc2tsZXQgd29yay4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6IFZvbG9keW15
ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KClRoaXMgd2FzIHBvc3RlZCBv
biBpdHMgb3duIHByZXZpb3VzbHksIGJ1dCBpcyByZXNldCBiYWNrIHRvIHYxIG5vdyBpdCBpcyBp
bgppdHMgc2VyaWVzLiAgVGhpcyBjYW4ndCBiZSBtYWRlIHN0YXRpYyBpbmxpbmUgZHVlIHRvIGhl
YWRlciBjb25zdHJhaW50cywgYnV0CnRoZXJlIGlzIG5vIGluaGVyZW50IGlzc3VlIHdpdGggZG9p
bmcgc28gaWYgdGhlIGhlYWRlcnMgYmVjb21lIGxlc3MgdGFuZ2xlZC4KCkZhaWxpbmcgdGhlIGNh
bGwgd2l0aCAtRUlOVkFMIGZvciBtaXNzaW5nIHRoZSBjb3JyZWN0IENQVSBpcyB2ZXJ5IHJ1ZGUs
IGFuZAphZGRyZXNzZWQgaW4gYSBsYXRlciBwYXRjaC4KLS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMu
YyAgICAgICB8IDcgKysrKysrKwogeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jICAgfCA3ICsrKysr
KysKIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgIHwgOSArKysrKysrLS0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vcmVncy5oIHwgMiAtLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9yZWdzLmggfCAyIC0t
CiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggICB8IDYgKysrKysrCiA2IGZpbGVzIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwppbmRleCBkMDI4ZWM5MjI0Li5hMjA0
NzRmODdjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYworKysgYi94ZW4vYXJjaC9h
cm0vdHJhcHMuYwpAQCAtMTQ4NSw2ICsxNDg1LDEzIEBAIHN0YXRpYyB2b2lkIGRvX3RyYXBfaHlw
ZXJjYWxsKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCByZWdpc3Rlcl90ICpuciwKICAgICAg
ICAgcmVncy0+cGMgLT0gNDsgIC8qIHJlLWV4ZWN1dGUgJ2h2YyAjWEVOX0hZUEVSQ0FMTF9UQUcn
ICovCiB9CiAKK3ZvaWQgYXJjaF9oeXBlcmNhbGxfdGFza2xldF9yZXN1bHQoc3RydWN0IHZjcHUg
KnYsIGxvbmcgcmVzKQoreworICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzID0gJnYtPmFy
Y2guY3B1X2luZm8tPmd1ZXN0X2NwdV91c2VyX3JlZ3M7CisKKyAgICBIWVBFUkNBTExfUkVTVUxU
X1JFRyhyZWdzKSA9IHJlczsKK30KKwogc3RhdGljIGJvb2wgY2hlY2tfbXVsdGljYWxsXzMyYml0
X2NsZWFuKHN0cnVjdCBtdWx0aWNhbGxfZW50cnkgKm11bHRpKQogewogICAgIGludCBpOwpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h5cGVyY2Fs
bC5jCmluZGV4IDFkNDI3MDJjNmEuLjdmMjk5ZDQ1YzYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9oeXBlcmNhbGwuYworKysgYi94ZW4vYXJjaC94ODYvaHlwZXJjYWxsLmMKQEAgLTE2Niw2ICsx
NjYsMTMgQEAgdW5zaWduZWQgbG9uZyBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbigKIAog
I3VuZGVmIE5FWFRfQVJHCiAKK3ZvaWQgYXJjaF9oeXBlcmNhbGxfdGFza2xldF9yZXN1bHQoc3Ry
dWN0IHZjcHUgKnYsIGxvbmcgcmVzKQoreworICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
ID0gJnYtPmFyY2gudXNlcl9yZWdzOworCisgICAgcmVncy0+cmF4ID0gcmVzOworfQorCiBpbnQg
aHlwZXJjYWxsX3hsYXRfY29udGludWF0aW9uKHVuc2lnbmVkIGludCAqaWQsIHVuc2lnbmVkIGlu
dCBuciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1hc2ss
IC4uLikKIHsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jCmluZGV4IDYxMTExNmM3ZmMuLmNjZjY4OWZjYmUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21t
b24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMTY2NSwxMyArMTY2NSwx
OCBAQCBzdGF0aWMgdm9pZCBjb250aW51ZV9oeXBlcmNhbGxfdGFza2xldF9oYW5kbGVyKHVuc2ln
bmVkIGxvbmcgX2luZm8pCiB7CiAgICAgc3RydWN0IG1pZ3JhdGVfaW5mbyAqaW5mbyA9IChzdHJ1
Y3QgbWlncmF0ZV9pbmZvICopX2luZm87CiAgICAgc3RydWN0IHZjcHUgKnYgPSBpbmZvLT52Y3B1
OworICAgIGxvbmcgcmVzID0gLUVJTlZBTDsKIAogICAgIC8qIFdhaXQgZm9yIHZjcHUgdG8gc2xl
ZXAgc28gdGhhdCB3ZSBjYW4gYWNjZXNzIGl0cyByZWdpc3RlciBzdGF0ZS4gKi8KICAgICB2Y3B1
X3NsZWVwX3N5bmModik7CiAKICAgICB0aGlzX2NwdShjb250aW51ZV9pbmZvKSA9IGluZm87Ci0g
ICAgcmV0dXJuX3JlZyh2KSA9IChpbmZvLT5jcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQotICAg
ICAgICA/IGluZm8tPmZ1bmMoaW5mby0+ZGF0YSkgOiAtRUlOVkFMOworCisgICAgaWYgKCBsaWtl
bHkoaW5mby0+Y3B1ID09IHNtcF9wcm9jZXNzb3JfaWQoKSkgKQorICAgICAgICByZXMgPSBpbmZv
LT5mdW5jKGluZm8tPmRhdGEpOworCisgICAgYXJjaF9oeXBlcmNhbGxfdGFza2xldF9yZXN1bHQo
diwgcmVzKTsKKwogICAgIHRoaXNfY3B1KGNvbnRpbnVlX2luZm8pID0gTlVMTDsKIAogICAgIGlm
ICggaW5mby0+bmVzdC0tID09IDAgKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9y
ZWdzLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3JlZ3MuaAppbmRleCAwZTNlNTZiNDUyLi5lYzA5
MWEyOGEyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3JlZ3MuaAorKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL3JlZ3MuaApAQCAtNTcsOCArNTcsNiBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgZ3Vlc3RfbW9kZShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcikKICAgICByZXR1cm4g
KGRpZmYgPT0gMCk7CiB9CiAKLSNkZWZpbmUgcmV0dXJuX3JlZyh2KSAoKHYpLT5hcmNoLmNwdV9p
bmZvLT5ndWVzdF9jcHVfdXNlcl9yZWdzLnIwKQotCiByZWdpc3Rlcl90IGdldF91c2VyX3JlZyhz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50IHJlZyk7CiB2b2lkIHNldF91c2VyX3JlZyhz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50IHJlZywgcmVnaXN0ZXJfdCB2YWwpOwogCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3JlZ3MuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvcmVncy5oCmluZGV4IDcyNWE2NjRlMGEuLmRjMDBiODU0ZTMgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvcmVncy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcmVncy5oCkBA
IC0xNSw2ICsxNSw0IEBACiAgICAgKGRpZmYgPT0gMCk7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiB9KQogCi0jZGVmaW5lIHJl
dHVybl9yZWcodikgKCh2KS0+YXJjaC51c2VyX3JlZ3MucmF4KQotCiAjZW5kaWYgLyogX19YODZf
UkVHU19IX18gKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaCBiL3hlbi9p
bmNsdWRlL3hlbi9kb21haW4uaAppbmRleCA3NjkzMDIwNTdiLi4xY2IyMDVkOTc3IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFp
bi5oCkBAIC0xMDMsNiArMTAzLDEyIEBAIHZvaWQgZG9tY3RsX2xvY2tfcmVsZWFzZSh2b2lkKTsK
IGludCBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KAogICAgIHVuc2lnbmVkIGludCBjcHUsIGxv
bmcgKCpmdW5jKSh2b2lkICpkYXRhKSwgdm9pZCAqZGF0YSk7CiAKKy8qCisgKiBDb21wYW5pb24g
dG8gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLCB0byBmZWVkIGZ1bmMoKSdzIHJlc3VsdCBi
YWNrIGludG8KKyAqIHZjcHUgcmVnc2l0ZXIgc3RhdGUuCisgKi8KK3ZvaWQgYXJjaF9oeXBlcmNh
bGxfdGFza2xldF9yZXN1bHQoc3RydWN0IHZjcHUgKnYsIGxvbmcgcmVzKTsKKwogZXh0ZXJuIHVu
c2lnbmVkIGludCB4ZW5fcHJvY2Vzc29yX3BtYml0czsKIAogZXh0ZXJuIGJvb2xfdCBvcHRfZG9t
MF92Y3B1c19waW47Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
