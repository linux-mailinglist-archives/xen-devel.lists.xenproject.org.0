Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0D2DDCB
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVyL6-0001qc-9r; Wed, 29 May 2019 13:09:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hVyL4-0001qX-KM
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:09:54 +0000
X-Inumbo-ID: 0bb0e6b6-8213-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bb0e6b6-8213-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 13:09:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: FFRV6PyCtDzDrOWqzUY/djVtu5VpZeoTbHahbfS7TGUuXs9Hf2vmOXlGEmokhq76t94PtjmZL8
 Dbm5RpHr/7kyu7YXafgmzwqqe2P8z2PuM/4NE5C5IWEE7tsbDteU0IKRTXcsFZZAoEpFxj/2ZA
 UPwmybdqVDEh+QNnzHpOSgv2jo0TeI7P4wrqR9hecbSjDn0wA1OGg6PWabHgM6dgYkizJXorc9
 N3eXRY2bJuRII5x71ymkqy3BNrb33CO6cayoG0dzfQXmVoqFEGXMNjUroZaTodbdY5eBNA02Fa
 Pxo=
X-SBRS: 2.7
X-MesageID: 1040998
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1040998"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 May 2019 14:09:48 +0100
Message-ID: <20190529130948.5314-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/hvm/hpet: avoid 'small' time diff test on
 resume
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgYXBwZWFycyB0aGF0IGV2ZW4gNjQtYml0IHZlcnNpb25zIG9mIFdpbmRvd3MgMTAsIHdoZW4g
bm90IHVzaW5nIHN5dGgtCmV0aWMgdGltZXJzLCB3aWxsIHVzZSAzMi1iaXQgSFBFVCBub24tcGVy
aW9kaWMgdGltZXJzLiBUaGVyZSBpcyBhIHRlc3QKaW4gaHBldF9zZXRfdGltZXIoKSwgc3BlY2lm
aWMgdG8gMzItYml0IHRpbWVycywgdGhhdCB0cmllcyB0byBkaXNhbWJpZ3VhdGUKYmV0d2VlbiBh
IGNvbXBhcmF0b3IgdmFsdWUgdGhhdCBpcyBpbiB0aGUgcGFzdCBhbmQgb25lIHRoYXQgaXMgc3Vm
ZmljaWVudGx5CmZhciBpbiB0aGUgZnV0dXJlIHRoYXQgaXQgd3JhcHMuIFRoaXMgaXMgZG9uZSBi
eSBhc3N1bWluZyB0aGF0IHRoZSBkZWx0YQpiZXR3ZWVuIHRoZSBtYWluIGNvdW50ZXIgYW5kIGNv
bXBhcmF0b3Igd2lsbCBiZSAnc21hbGwnIFsxXSwgaWYgdGhlCmNvbXBhcmF0b3IgdmFsdWUgaXMg
aW4gdGhlIHBhc3QuIFVuZm9ydHVuYXRlbHksIG1vcmUgb2Z0ZW4gdGhhbiBub3QsIHRoaXMKaXMg
bm90IHRoZSBjYXNlIGlmIHRoZSB0aW1lciBpcyBiZWluZyByZS1zdGFydGVkIGFmdGVyIGEgbWln
cmF0ZSBhbmQgc28KdGhlIHRpbWVyIGlzIHNldCB0byBmaXJlIGZhciBpbiB0aGUgZnV0dXJlIChp
biBleGNlc3Mgb2YgYSBtaW51dGUgaW4Kc2V2ZXJhbCBvYnNlcnZlZCBjYXNlcykgcmF0aGVyIHRo
ZW4gc2V0IHRvIGZpcmUgaW1tZWRpYXRlbHkuIFRoaXMgaGFzIGEKcmF0aGVyIG9kZCBzeW1wdG9t
IHdoZXJlIHRoZSBndWVzdCBjb25zb2xlIGlzIGFsaXZlIGVub3VnaCB0byBiZSBhYmxlIHRvCmRl
YWwgd2l0aCBtb3VzZSBwb2ludGVyIHJlLXJlbmRlcmluZywgYnV0IGFueSBrZXlib2FyZCBhY3Rp
dml0eSBvciBtb3VzZQpjbGlja3MgeWllbGQgbm8gcmVzcG9uc2UuCgpUaGlzIHBhdGNoIHNpbXBs
eSBhZGRzIGEgYm9vbGVhbiBhcmd1bWVudCB0byBocGV0X3NldF90aW1lcigpIHNvIHRoYXQgdGhl
CidzbWFsbCcgdGltZSB0ZXN0IGlzIG9taXR0ZWQgd2hlbiB0aGUgZnVuY3Rpb24gaXMgY2FsbGVk
IHRvIHJlc3RhcnQgdGltZXJzCm9uIHJlc3VtZSwgYW5kIHRodXMgYW55IG5lZ2F0aXZlIGRlbHRh
IGNhdXNlcyBhIHRpbWVyIHRvIGZpcmUgaW1tZWRpYXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KCkkgbm90aWNlIHRoYXQgd2Ugc2VlbWluZ2x5IGRvbid0IGhh
bmRsZSBtYWluIGNvdW50ZXIgd3JhcCBpbiB0aGUgSFBFVCBjb2RlLgpUaGUgc3BlYy4gc2F5cyB0
aGF0IHRpbWVycyBzaG91bGQgZmlyZSBhdCB0aGUgcG9pbnQgdGhlIGNvdW50ZXIgd3JhcHMgYXQg
dGhlCnRpbWVyJ3Mgd2lkdGguIEkgdGhpbmsgdGhlIG5lZWQgZm9yIHRoZSAnc21hbGwnIHRpbWUg
dGVzdCB3b3VsZCBnbyBhd2F5IGlmCnRoaXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhhdCdzIGZv
ciBhbm90aGVyIGRheS4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2hwZXQuYyB8IDEzICsrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9ocGV0LmMgYi94ZW4vYXJjaC94ODYvaHZtL2hw
ZXQuYwppbmRleCBhOTE2NzU4MTA2Li40OTI1Nzk4NmI1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2hwZXQuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwpAQCAtMjMzLDcgKzIz
Myw3IEBAIHN0YXRpYyB2b2lkIGhwZXRfdGltZXJfZmlyZWQoc3RydWN0IHZjcHUgKnYsIHZvaWQg
KmRhdGEpCiAjZGVmaW5lICBIUEVUX1RJTllfVElNRV9TUEFOICAoKGgtPnN0aW1lX2ZyZXEgPj4g
MTApIC8gU1RJTUVfUEVSX0hQRVRfVElDSykKIAogc3RhdGljIHZvaWQgaHBldF9zZXRfdGltZXIo
SFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50NjRfdCBndWVzdF90aW1lKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0
X3QgZ3Vlc3RfdGltZSwgYm9vbCByZXN1bWUpCiB7CiAgICAgdWludDY0X3QgdG5fY21wLCBjdXJf
dGljaywgZGlmZjsKICAgICB1bnNpZ25lZCBpbnQgaXJxOwpAQCAtMjczLDEwICsyNzMsMTMgQEAg
c3RhdGljIHZvaWQgaHBldF9zZXRfdGltZXIoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4s
CiAgICAgICogRGV0ZWN0IHRpbWUgdmFsdWVzIHNldCBpbiB0aGUgcGFzdC4gVGhpcyBpcyBoYXJk
IHRvIGRvIGZvciAzMi1iaXQKICAgICAgKiBjb21wYXJhdG9ycyBhcyB0aGUgdGltZXIgZG9lcyBu
b3QgaGF2ZSB0byBiZSBzZXQgdGhhdCBmYXIgaW4gdGhlIGZ1dHVyZQogICAgICAqIGZvciB0aGUg
Y291bnRlciBkaWZmZXJlbmNlIHRvIHdyYXAgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIuIFdlIGZ1
ZGdlCi0gICAgICogYnkgbG9va2luZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4gdGhlIHBh
c3QuCisgICAgICogYnkgbG9va2luZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4gdGhlIHBh
c3QuIEhvd2V2ZXIsIGlmIHdlCisgICAgICogYXJlIHJlc3VtaW5nIGZyb20gc3VzcGVuZCwgdHJl
YXQgYW55IHdyYXAgYXMgcGFzdCBzaW5jZSB0aGUgdmFsdWUKKyAgICAgKiBpcyB1bmxpa2VseSB0
byBiZSAnc21hbGwnLgogICAgICAqLwogICAgIGlmICggKGludDY0X3QpZGlmZiA8IDAgKQotICAg
ICAgICBkaWZmID0gKHRpbWVyX2lzXzMyYml0KGgsIHRuKSAmJiAoLWRpZmYgPiBIUEVUX1RJTllf
VElNRV9TUEFOKSkKKyAgICAgICAgZGlmZiA9ICh0aW1lcl9pc18zMmJpdChoLCB0bikgJiYgKC1k
aWZmID4gSFBFVF9USU5ZX1RJTUVfU1BBTikgJiYKKyAgICAgICAgICAgICAgICAhcmVzdW1lKQog
ICAgICAgICAgICAgPyAodWludDMyX3QpZGlmZiA6IDA7CiAKICAgICBkZXN0cm95X3BlcmlvZGlj
X3RpbWUoJmgtPnB0W3RuXSk7CkBAIC01NDcsNyArNTUwLDcgQEAgc3RhdGljIGludCBocGV0X3dy
aXRlKAogICAgIHsKICAgICAgICAgaSA9IGZpbmRfZmlyc3Rfc2V0X2JpdChzdGFydF90aW1lcnMp
OwogICAgICAgICBfX2NsZWFyX2JpdChpLCAmc3RhcnRfdGltZXJzKTsKLSAgICAgICAgaHBldF9z
ZXRfdGltZXIoaCwgaSwgZ3Vlc3RfdGltZSk7CisgICAgICAgIGhwZXRfc2V0X3RpbWVyKGgsIGks
IGd1ZXN0X3RpbWUsIGZhbHNlKTsKICAgICB9CiAKICN1bmRlZiBzZXRfc3RvcF90aW1lcgpAQCAt
NjkyLDcgKzY5NSw3IEBAIHN0YXRpYyBpbnQgaHBldF9sb2FkKHN0cnVjdCBkb21haW4gKmQsIGh2
bV9kb21haW5fY29udGV4dF90ICpoKQogICAgIGlmICggaHBldF9lbmFibGVkKGhwKSApCiAgICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgSFBFVF9USU1FUl9OVU07IGkrKyApCiAgICAgICAgICAgICBp
ZiAoIHRpbWVyX2VuYWJsZWQoaHAsIGkpICkKLSAgICAgICAgICAgICAgICBocGV0X3NldF90aW1l
cihocCwgaSwgZ3Vlc3RfdGltZSk7CisgICAgICAgICAgICAgICAgaHBldF9zZXRfdGltZXIoaHAs
IGksIGd1ZXN0X3RpbWUsIHRydWUpOwogCiAgICAgd3JpdGVfdW5sb2NrKCZocC0+bG9jayk7CiAK
LS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
