Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A436211EE00
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 23:51:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iftjX-0003Ao-Fj; Fri, 13 Dec 2019 22:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QQqQ=2D=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iftjV-0003AP-6H
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 22:48:25 +0000
X-Inumbo-ID: a6a9a308-1dfa-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6a9a308-1dfa-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 22:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576277296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=COc48C8hnO3YxD5NXPqosfwfgM1CqBkFABkSOGZli4I=;
 b=Fd3GB1+ww40msNx2Yjju11m4GoFaImlCnH+q4O7oomZ5WRPwYn0hHpOh
 rL5S09BpFQrzg2PXmH/7WsSdzjHDTxgodtIj/Nmm0GMEPATAGqpf48T+2
 WneCrfbtnUbQgJJoR0ipglzkt7JTGDQ6UyuewfsB7s2TfEskJ9kJs2P9S 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XRj+dJjBurxpzvqeSaxi80P7h0YwzABaAWh6qJ/gdm1SWVzw80isNX8p25AOchabm/O9rAJ275
 5ccQUBqazR0RFl9RNc8DA39PBmYdiGImp0H91MYAE9E1ceaJ1vOSssn9UwrlGcnr5y1QETDBI6
 +d15BABrEoZ8+IRbPHYg14ww3E/vtbrU2WufyLbI05EmZ5WRHqRgO6tZGvZT+0VTKko8vN9XGP
 eTm071Am0VkR2PwRciLQVa3DnsolIiKvBJeqz2g+IjBBN2tfRehyBfeFktymakrmrezqMBQtin
 nn0=
X-SBRS: 2.7
X-MesageID: 10241745
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,311,1571716800"; d="scan'208";a="10241745"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 22:48:01 +0000
Message-ID: <1576277282-6590-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/time: drop vtsc_{kern,
 user}count debug counters
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSBlaXRoZXIgbmVlZCB0byBiZSB0cmFuc2Zvcm1lZCB0byBhdG9taWNzIHRvIHdvcmsgY29y
cmVjdGx5CihjdXJyZW50bHkgdGhleSBsZWZ0IHVucHJvdGVjdGVkIGZvciBIVk0gZG9tYWlucykg
b3IgZHJvcHBlZCBlbnRpcmVseQphcyB0YWtpbmcgYSBwZXItZG9tYWluIHNwaW5sb2NrIGlzIHRv
byBleHBlbnNpdmUgZm9yIGhpZ2gtdkNQVSBjb3VudApkb21haW5zIGV2ZW4gZm9yIGRlYnVnIGJ1
aWxkIGdpdmVuIHRoaXMgbG9jayBpcyB0YWtlbiB0b28gb2Z0ZW4uCgpDaG9vc2UgdGhlIGxhdHRl
ciBhcyB0aGV5IGFyZSBub3QgZXh0cmVtZWx5IGltcG9ydGFudCBhbnl3YXkuCgpTaWduZWQtb2Zm
LWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYvaHZtL2h2bS5jICAgICAgIHwgMzIgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIHhlbi9hcmNoL3g4Ni90aW1lLmMgICAgICAgICAgfCAxMiAtLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggfCAgNCAtLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggNDc1NzNmNy4uNjE0ZWQ2
MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCkBAIC0zNDA1LDM3ICszNDA1LDkgQEAgaW50IGh2bV92bWV4aXRfY3B1aWQoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBpbnN0X2xlbikKICAgICByZXR1
cm4gaHZtX21vbml0b3JfY3B1aWQoaW5zdF9sZW4sIGxlYWYsIHN1YmxlYWYpOwogfQogCi1zdGF0
aWMgdWludDY0X3QgX2h2bV9yZHRzY19pbnRlcmNlcHQodm9pZCkKLXsKLSAgICBzdHJ1Y3QgdmNw
dSAqY3VyciA9IGN1cnJlbnQ7Ci0jaWYgIWRlZmluZWQoTkRFQlVHKSB8fCBkZWZpbmVkKENPTkZJ
R19QRVJGX0NPVU5URVJTKQotICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3Vyci0+ZG9tYWlu
OwotCi0gICAgaWYgKCBjdXJyZC0+YXJjaC52dHNjICkKLSAgICAgICAgc3dpdGNoICggaHZtX2d1
ZXN0X3g4Nl9tb2RlKGN1cnIpICkKLSAgICAgICAgewotICAgICAgICBjYXNlIDg6Ci0gICAgICAg
IGNhc2UgNDoKLSAgICAgICAgY2FzZSAyOgotICAgICAgICAgICAgaWYgKCB1bmxpa2VseShodm1f
Z2V0X2NwbChjdXJyKSkgKQotICAgICAgICAgICAgewotICAgICAgICBjYXNlIDE6Ci0gICAgICAg
ICAgICAgICAgY3VycmQtPmFyY2gudnRzY191c2VyY291bnQrKzsKLSAgICAgICAgICAgICAgICBi
cmVhazsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwotICAg
ICAgICBjYXNlIDA6Ci0gICAgICAgICAgICBjdXJyZC0+YXJjaC52dHNjX2tlcm5jb3VudCsrOwot
ICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgIH0KLSNlbmRpZgotCi0gICAgcmV0dXJuIGh2bV9n
ZXRfZ3Vlc3RfdHNjKGN1cnIpOwotfQotCiB2b2lkIGh2bV9yZHRzY19pbnRlcmNlcHQoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7Ci0gICAgbXNyX3NwbGl0KHJlZ3MsIF9odm1fcmR0c2Nf
aW50ZXJjZXB0KCkpOworICAgIG1zcl9zcGxpdChyZWdzLCBodm1fZ2V0X2d1ZXN0X3RzYyhjdXJy
ZW50KSk7CiAKICAgICBIVk1UUkFDRV8yRChSRFRTQywgcmVncy0+ZWF4LCByZWdzLT5lZHgpOwog
fQpAQCAtMzQ2NCw3ICszNDM2LDcgQEAgaW50IGh2bV9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWdu
ZWQgaW50IG1zciwgdWludDY0X3QgKm1zcl9jb250ZW50KQogICAgICAgICBicmVhazsKIAogICAg
IGNhc2UgTVNSX0lBMzJfVFNDOgotICAgICAgICAqbXNyX2NvbnRlbnQgPSBfaHZtX3JkdHNjX2lu
dGVyY2VwdCgpOworICAgICAgICAqbXNyX2NvbnRlbnQgPSBodm1fZ2V0X2d1ZXN0X3RzYyh2KTsK
ICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIE1TUl9JQTMyX1RTQ19BREpVU1Q6CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYwppbmRleCAyN2Ez
YTEwLi4yMTYxNjlhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni90aW1lLmMKQEAgLTIxMzUsMTMgKzIxMzUsNiBAQCB1aW50NjRfdCBwdl9zb2Z0X3Jk
dHNjKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cykKIAogICAgIHNwaW5fbG9jaygmZC0+YXJjaC52dHNjX2xvY2spOwogCi0jaWYgIWRlZmluZWQo
TkRFQlVHKSB8fCBkZWZpbmVkKENPTkZJR19QRVJGX0NPVU5URVJTKQotICAgIGlmICggZ3Vlc3Rf
a2VybmVsX21vZGUodiwgcmVncykgKQotICAgICAgICBkLT5hcmNoLnZ0c2Nfa2VybmNvdW50Kys7
Ci0gICAgZWxzZQotICAgICAgICBkLT5hcmNoLnZ0c2NfdXNlcmNvdW50Kys7Ci0jZW5kaWYKLQog
ICAgIGlmICggKGludDY0X3QpKG5vdyAtIGQtPmFyY2gudnRzY19sYXN0KSA+IDAgKQogICAgICAg
ICBkLT5hcmNoLnZ0c2NfbGFzdCA9IG5vdzsKICAgICBlbHNlCkBAIC0yMzE4LDExICsyMzExLDYg
QEAgc3RhdGljIHZvaWQgZHVtcF9zb2Z0dHNjKHVuc2lnbmVkIGNoYXIga2V5KQogICAgICAgICAg
ICAgcHJpbnRrKCIsa2h6PSUiUFJJdTMyLCBkLT5hcmNoLnRzY19raHopOwogICAgICAgICBpZiAo
IGQtPmFyY2guaW5jYXJuYXRpb24gKQogICAgICAgICAgICAgcHJpbnRrKCIsaW5jPSUiUFJJdTMy
LCBkLT5hcmNoLmluY2FybmF0aW9uKTsKLSNpZiAhZGVmaW5lZChOREVCVUcpIHx8IGRlZmluZWQo
Q09ORklHX1BFUkZfQ09VTlRFUlMpCi0gICAgICAgIGlmICggZC0+YXJjaC52dHNjX2tlcm5jb3Vu
dCB8IGQtPmFyY2gudnRzY191c2VyY291bnQgKQotICAgICAgICAgICAgcHJpbnRrKCIsdnRzYyBj
b3VudDogJSJQUkl1NjQiIGtlcm5lbCwlIlBSSXU2NCIgdXNlciIsCi0gICAgICAgICAgICAgICAg
ICAgZC0+YXJjaC52dHNjX2tlcm5jb3VudCwgZC0+YXJjaC52dHNjX3VzZXJjb3VudCk7Ci0jZW5k
aWYKICAgICAgICAgcHJpbnRrKCJcbiIpOwogICAgICAgICBkb21jbnQrKzsKICAgICB9CmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9kb21haW4uaAppbmRleCAyMTIzMDNmLi4zNzgwMjg3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAg
LTM3NCwxMCArMzc0LDYgQEAgc3RydWN0IGFyY2hfZG9tYWluCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaGFyZHdhcmUgVFNDIHNjYWxpbmcgY2FzZXMgKi8KICAgICB1aW50
MzJfdCBpbmNhcm5hdGlvbjsgICAgLyogaW5jcmVtZW50ZWQgZXZlcnkgcmVzdG9yZSBvciBsaXZl
IG1pZ3JhdGUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBvc3NpYmx5IG90aGVy
IGNhc2VzIGluIHRoZSBmdXR1cmUgKi8KLSNpZiAhZGVmaW5lZChOREVCVUcpIHx8IGRlZmluZWQo
Q09ORklHX1BFUkZfQ09VTlRFUlMpCi0gICAgdWludDY0X3QgdnRzY19rZXJuY291bnQ7Ci0gICAg
dWludDY0X3QgdnRzY191c2VyY291bnQ7Ci0jZW5kaWYKIAogICAgIC8qIFBzZXVkb3BoeXNpY2Fs
IGU4MjAgbWFwIChYRU5NRU1fbWVtb3J5X21hcCkuICAqLwogICAgIHNwaW5sb2NrX3QgZTgyMF9s
b2NrOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
