Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57E12665F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:06:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihyH1-0006iT-Sk; Thu, 19 Dec 2019 16:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZxM0=2J=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ihyH0-0006iJ-Kh
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 16:03:34 +0000
X-Inumbo-ID: 164e12d4-2279-11ea-a1e1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 164e12d4-2279-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576771406;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PjMrQre1Cj9Xz8rjwAVg9EjtRp2Z5C8/u7DGgz04HDg=;
 b=RpzSGnRKqdRKIYUIbS29AXyYja/iZwuHrJh2PFZnYhnwGnC+6UFOao41
 cGsjVewBIM42Iq83ta8pCQnPw2ak4TFlmtVRnEoFxOKUgjdSziVDM8H9C
 ud9JUsQU2nLY3bGswcBLoFYTC0JPukoLco0rhKuSLW0vJhsFnAkCiQqJ2 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kLXDOWm1ICA7NBShFw8DKsqelSd2Fzuk9FGlakKHPIcWz8vX+bwC1zz9avTb40KnPtnmUvwjcA
 GQ36Mg9CFUK8zBzJ6ieAmXG4GpyYWjNH9EaO/sGDRvcgCBZ3I+mIVe/QA7O5Sx/Mzn2r6TPan4
 JUOt6dcSQcoS05MZ1bXuBWdeajSm4djcmuicnsDCnduLgNhita9OM3MrXtpkPGd8CfJkNYV5iG
 1+NfwTvtVssXGAI4kPLTiG5ehKUygzN3fZnDLztGrgGhni1m6JCXcudkuPS3Kfp59Wc+J3lwLP
 6/Y=
X-SBRS: 2.7
X-MesageID: 10090357
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; d="scan'208";a="10090357"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 16:03:19 +0000
Message-ID: <1576771399-14654-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/time: update vtsc_last with cmpxchg and
 drop vtsc_lock
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

Tm93IHRoYXQgdnRzY19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQgYnkgdnRzY19s
b2NrIHdlIGNhbgpzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xlIGF0b21pYyBvcGVyYXRp
b24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCmVudGlyZWx5LiBUaGlzIGlzIGV4dHJlbWVseSBpbXBv
cnRhbnQgZm9yIHRoZSBjYXNlIG9mIHJ1bm5pbmcgbmVzdGVkCihlLmcuIHNoaW0gaW5zdGFuY2Ug
d2l0aCBsb3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVlbXB0aW9uCmhhcHBlbnMg
c29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB0aGF0IHdvdWxkIGltbWVkaWF0
ZWx5Cm1lYW4gdGhhdCBvdGhlciB2Q1BVIHN0b3AgcHJvZ3Jlc3NpbmcgKGFuZCBwcm9iYWJseSBi
ZWluZyBwcmVlbXB0ZWQKYXMgd2VsbCkgd2FpdGluZyBmb3IgdGhlIHNwaW5sb2NrIHRvIGJlIGZy
ZWVkLgoKVGhpcyBmaXhlcyBjb25zdGFudCBzaGltIGd1ZXN0IGJvb3QgbG9ja3VwcyB3aXRoIH4z
MiB2Q1BVcyBpZiB0aGVyZSBpcwp2Q1BVIG92ZXJjb21taXQgcHJlc2VudCAod2hpY2ggaW5jcmVh
c2VzIHRoZSBsaWtlbGlob29kIG9mIHByZWVtcHRpb24pLgoKU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQp2Mjogc2ltcGxpZnkgdGhl
IGNvbmRpdGlvbiBhcyBzdWdnZXN0ZWQKLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAg
IHwgIDEgLQogeGVuL2FyY2gveDg2L3RpbWUuYyAgICAgICAgICB8IDE2ICsrKysrKy0tLS0tLS0t
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggfCAgMSAtCiAzIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDdjYjdmZDMuLmQ5YzYz
MzcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKQEAgLTUzOSw3ICs1MzksNiBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVj
dCBkb21haW4gKmQsCiAgICAgSU5JVF9QQUdFX0xJU1RfSEVBRCgmZC0+YXJjaC5yZWxtZW1fbGlz
dCk7CiAKICAgICBzcGluX2xvY2tfaW5pdCgmZC0+YXJjaC5lODIwX2xvY2spOwotICAgIHNwaW5f
bG9ja19pbml0KCZkLT5hcmNoLnZ0c2NfbG9jayk7CiAKICAgICAvKiBNaW5pbWFsIGluaXRpYWxp
c2F0aW9uIGZvciB0aGUgaWRsZSBkb21haW4uICovCiAgICAgaWYgKCB1bmxpa2VseShpc19pZGxl
X2RvbWFpbihkKSkgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNo
L3g4Ni90aW1lLmMKaW5kZXggMjE2MTY5YS4uNjNkZDVhMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L3RpbWUuYworKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCkBAIC0yMTMwLDE5ICsyMTMwLDE1
IEBAIHU2NCBndHNjX3RvX2d0aW1lKHN0cnVjdCBkb21haW4gKmQsIHU2NCB0c2MpCiAKIHVpbnQ2
NF90IHB2X3NvZnRfcmR0c2MoY29uc3Qgc3RydWN0IHZjcHUgKnYsIGNvbnN0IHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQogewotICAgIHNfdGltZV90IG5vdyA9IGdldF9zX3RpbWUoKTsKKyAg
ICBzX3RpbWVfdCBvbGQsIG5ldywgbm93ID0gZ2V0X3NfdGltZSgpOwogICAgIHN0cnVjdCBkb21h
aW4gKmQgPSB2LT5kb21haW47CiAKLSAgICBzcGluX2xvY2soJmQtPmFyY2gudnRzY19sb2NrKTsK
LQotICAgIGlmICggKGludDY0X3QpKG5vdyAtIGQtPmFyY2gudnRzY19sYXN0KSA+IDAgKQotICAg
ICAgICBkLT5hcmNoLnZ0c2NfbGFzdCA9IG5vdzsKLSAgICBlbHNlCi0gICAgICAgIG5vdyA9ICsr
ZC0+YXJjaC52dHNjX2xhc3Q7Ci0KLSAgICBzcGluX3VubG9jaygmZC0+YXJjaC52dHNjX2xvY2sp
OworICAgIGRvIHsKKyAgICAgICAgb2xkID0gZC0+YXJjaC52dHNjX2xhc3Q7CisgICAgICAgIG5l
dyA9IG5vdyA+IGQtPmFyY2gudnRzY19sYXN0ID8gbm93IDogb2xkICsgMTsKKyAgICB9IHdoaWxl
ICggY21weGNoZygmZC0+YXJjaC52dHNjX2xhc3QsIG9sZCwgbmV3KSAhPSBvbGQgKTsKIAotICAg
IHJldHVybiBndGltZV90b19ndHNjKGQsIG5vdyk7CisgICAgcmV0dXJuIGd0aW1lX3RvX2d0c2Mo
ZCwgbmV3KTsKIH0KIAogYm9vbCBjbG9ja3NvdXJjZV9pc190c2Modm9pZCkKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFp
bi5oCmluZGV4IDM3ODAyODcuLmU0ZGEzNzMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaApAQCAtMzY0LDcg
KzM2NCw2IEBAIHN0cnVjdCBhcmNoX2RvbWFpbgogICAgIGludCB0c2NfbW9kZTsgICAgICAgICAg
ICAvKiBzZWUgaW5jbHVkZS9hc20teDg2L3RpbWUuaCAqLwogICAgIGJvb2xfdCB2dHNjOyAgICAg
ICAgICAgICAvKiB0c2MgaXMgZW11bGF0ZWQgKG1heSBjaGFuZ2UgYWZ0ZXIgbWlncmF0ZSkgKi8K
ICAgICBzX3RpbWVfdCB2dHNjX2xhc3Q7ICAgICAgLyogcHJldmlvdXMgVFNDIHZhbHVlIChndWFy
YW50ZWUgbW9ub3RvbmljaXR5KSAqLwotICAgIHNwaW5sb2NrX3QgdnRzY19sb2NrOwogICAgIHVp
bnQ2NF90IHZ0c2Nfb2Zmc2V0OyAgICAvKiBhZGp1c3RtZW50IGZvciBzYXZlL3Jlc3RvcmUvbWln
cmF0ZSAqLwogICAgIHVpbnQzMl90IHRzY19raHo7ICAgICAgICAvKiBjYWNoZWQgZ3Vlc3Qga2h6
IGZvciBjZXJ0YWluIGVtdWxhdGVkIG9yCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGhhcmR3YXJlIFRTQyBzY2FsaW5nIGNhc2VzICovCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
