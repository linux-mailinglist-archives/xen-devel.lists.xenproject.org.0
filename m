Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54085A1300
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 09:53:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3FCB-0006tD-Up; Thu, 29 Aug 2019 07:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3FC9-0006t8-VF
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 07:50:14 +0000
X-Inumbo-ID: a137e118-ca31-11e9-ae5f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a137e118-ca31-11e9-ae5f-12813bfff9fa;
 Thu, 29 Aug 2019 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567065012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H95G1nkXqxuq0cadhcxVQwiz9Yd52ORqGOMpT3bAWlU=;
 b=PoSD8dXvaNZ+WLoLg9qXAqvAo3YKWDdXydDbRFjs9naFI5wu7IHECXXC
 J7gVWR0lFww7p5wck0F4gHN52kYgSXVTjHRD9PLQCsgGFpwbQLlUpKeOs
 Isd8aatU+fHN5hUhMjVXXAVlGlQ54P9ndaiDUJV2qyXllkJZz7v9slnsh s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7mfuysoSk55SN23E3C2zWtRh6mzwI1lA4exTdm622Q2TfWiAqVWqQIyvfhR56KlQmN3BHEWT3W
 tobiRVZbXRIX9l19syfaWC5RBvLWh5IF1K/IgYI9odYabVbI5fLQnCWd1huRkYc4x5dgJVY+G/
 OWqusm8N+ZHiUIA0mmkErgIAz8QDBfSAOyhzJ0FMyG5ugBz0HViFpid3/SCEVTTY244z2Zf8TP
 OkCbORyqdNe+U3HbSfaejdZxO89qCI1PRGoU7ZIHB/XAD7WyKvALjxse8uPvJGoxq+SC2VcwiF
 VEY=
X-SBRS: 2.7
X-MesageID: 5052136
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5052136"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/domain: don't destroy IOREQ servers on soft reset
Thread-Index: AQHVXeDDwsIb4OEX00mhrWV0CK5EYacRvxJw
Date: Thu, 29 Aug 2019 07:50:08 +0000
Message-ID: <40e77d101b5147d38daf991826e2f5d6@AMSPEX02CL03.citrite.net>
References: <1567024796-13463-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1567024796-13463-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/domain: don't destroy IOREQ servers on
 soft reset
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI4IEF1Z3VzdCAyMDE5IDIxOjQwCj4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBqYmV1bGljaEBzdXNlLmNvbTsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHdsQHhlbi5vcmc7IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBJZ29yIERydXpoaW5pbgo+IDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0geDg2L2RvbWFpbjogZG9uJ3QgZGVzdHJveSBJ
T1JFUSBzZXJ2ZXJzIG9uIHNvZnQgcmVzZXQKPiAKPiBQZXJmb3JtaW5nIHNvZnQgcmVzZXQgc2hv
dWxkIG5vdCBvcHBvcnR1bmlzdGljYWxseSBraWxsIElPUkVRIHNlcnZlcnMKPiBmb3IgZGV2aWNl
IGVtdWxhdG9ycyB0aGF0IG1pZ2h0IGJlIGN1cnJlbnRseSBydW5uaW5nIGZvciBhIGRvbWFpbi4K
PiBFdmVyeSBlbXVsYXRvciBpcyBzdXBwb3NlZCB0byBjbGVhbiB1cCBJT1JFUSBzZXJ2ZXJzIGZv
ciBpdHNlbGYgb24gZXhpdC4KPiBUaGlzIGFsbG93cyBhIHRvb2xzdGFjayB0byBlbGVjdCB3aGV0
aGVyIG9yIG5vdCBhIHBhcnRpY3VsYXIgZGV2aWNlCj4gbW9kZWwgc2hvdWxkIGJlIHJlc3RhcnRl
ZC4KPiAKPiBTaW5jZSBjb21taXQgYmE3ZmRkNjRiICgieGVuOiBjbGVhbnVwIElPUkVRIHNlcnZl
ciBvbiBleGl0IikgUUVNVSBub3cKPiBkZXN0cm95cyBJT1JFUSBzZXJ2ZXIgZm9yIGl0c2VsZiBh
cyBldmVyeSBvdGhlciBkZXZpY2UgZW11bGF0b3IKPiBpcyBzdXBwb3NlZCB0byBkby4gSXQncyBu
b3cgc2FmZSB0byByZW1vdmUgdGhpcyBjb2RlIGZyb20gc29mdCByZXNldAo+IHBhdGggLSBleGlz
dGluZyBzeXN0ZW1zIHdpdGggb2xkIFFFTVUgc2hvdWxkIGJlIGFibGUgdG8gd29yayBhcwo+IGV2
ZW4gaWYgdGhlcmUgYXJlIElPUkVRIHNlcnZlcnMgbGVmdCBiZWhpbmQsIGEgbmV3IFFFTVUgaW5z
dGFuY2Ugd2lsbAo+IG92ZXJyaWRlIGl0cyByYW5nZXMgYW55d2F5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgoKQ29kZSBMR1RN
LCBidXQgSSB0aGluayBpdCBhbHNvIGJlIHVzZWZ1bCB0byBtZW50aW9uIHRoZSBjb21taXQgdGhh
dCBpbnRyb2R1Y2VkIGh2bV9kb21haW5fc29mdF9yZXNldCgpOgoKMzIzNWNiZmUgImFyY2gtc3Bl
Y2lmaWMgaG9va3MgZm9yIGRvbWFpbl9zb2Z0X3Jlc2V0KCkiCgouLi5zaW5jZSBpdCBzcGVjaWZp
Y2FsbHkgY2FsbHMgb3V0IGRlc3Ryb3lpbmcgaW9yZXEgc2VydmVycyBpbiBpdHMgY29tbWl0IG1l
c3NhZ2UuIEkgc3VzcGVjdCB0aGF0IHdhcyBuZWNlc3NhcnkgYXQgdGhlIHRpbWUgYmVjYXVzZSB0
aGUgJ2RlZmF1bHQnIGlvcmVxIHNlcnZlciBoYWQgbm8gbWVhbnMgb2YgY2xlYW5pbmcgdXAgKGJl
Y2F1c2UgaXQgd2FzIHVuYXdhcmUgb2YgdGhlIEFQSSkgYnV0IG5vdyB0aGF0IHN1cHBvcnQgZm9y
IGEgZGVmYXVsdCBzZXJ2ZXIgaGFzIGdvbmUgYXdheSwgdGhpcyBwYXRjaCBzaG91bGQgYmUgZmlu
ZS4KCiAgUGF1bAoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgfCAyIC0t
Cj4gIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgIHwgNSAtLS0tLQo+ICB4ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9odm0uaCB8IDEgLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4
Ni9kb21haW4uYwo+IGluZGV4IDJkZjMxMjMuLjk1N2YwNTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gQEAgLTcxMyw4
ICs3MTMsNiBAQCBpbnQgYXJjaF9kb21haW5fc29mdF9yZXNldChzdHJ1Y3QgZG9tYWluICpkKQo+
ICAgICAgaWYgKCAhaXNfaHZtX2RvbWFpbihkKSApCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gCj4gLSAgICBodm1fZG9tYWluX3NvZnRfcmVzZXQoZCk7Cj4gLQo+ICAgICAgc3Bpbl9sb2Nr
KCZkLT5ldmVudF9sb2NrKTsKPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgZC0+bnJfcGlycXMgOyBp
KysgKQo+ICAgICAgewo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVu
L2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4IDAyOWVlYTMuLjJiODE4OTkgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
PiBAQCAtNTA0NSwxMSArNTA0NSw2IEBAIHZvaWQgaHZtX3RvZ2dsZV9zaW5nbGVzdGVwKHN0cnVj
dCB2Y3B1ICp2KQo+ICAgICAgdi0+YXJjaC5odm0uc2luZ2xlX3N0ZXAgPSAhdi0+YXJjaC5odm0u
c2luZ2xlX3N0ZXA7Cj4gIH0KPiAKPiAtdm9pZCBodm1fZG9tYWluX3NvZnRfcmVzZXQoc3RydWN0
IGRvbWFpbiAqZCkKPiAtewo+IC0gICAgaHZtX2Rlc3Ryb3lfYWxsX2lvcmVxX3NlcnZlcnMoZCk7
Cj4gLX0KPiAtCj4gIC8qCj4gICAqIFNlZ21lbnQgY2FjaGVzIGluIFZNQ0IvVk1DUyBhcmUgaW5j
b25zaXN0ZW50IGFib3V0IHdoaWNoIGJpdHMgYXJlIGNoZWNrZWQsCj4gICAqIGltcG9ydGFudCwg
YW5kIHByZXNlcnZlZCBhY3Jvc3Mgdm1lbnRyeS9leGl0LiAgQ29vayB0aGUgdmFsdWVzIHRvIG1h
a2UgdGhlbQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gaW5kZXggYjMyN2JkMi4uNGU3MmQwNyAxMDA2
NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gQEAgLTI0MCw3ICsyNDAsNiBAQCBleHRlcm4gY29uc3Qg
c3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqc3RhcnRfdm14KHZvaWQpOwo+ICBpbnQgaHZtX2Rv
bWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpOwo+ICB2b2lkIGh2bV9kb21haW5fcmVs
aW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCk7Cj4gIHZvaWQgaHZtX2RvbWFpbl9k
ZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwo+IC12b2lkIGh2bV9kb21haW5fc29mdF9yZXNldChz
dHJ1Y3QgZG9tYWluICpkKTsKPiAKPiAgaW50IGh2bV92Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZj
cHUgKnYpOwo+ICB2b2lkIGh2bV92Y3B1X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpOwo+IC0tCj4g
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
