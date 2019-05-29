Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DE52DEC9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:46:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVyrw-0005GW-H1; Wed, 29 May 2019 13:43:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hVyrv-0005GR-03
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:43:51 +0000
X-Inumbo-ID: c994e38c-8217-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c994e38c-8217-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 13:43:49 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Gp1qzoRY0USpWFeX8k0qYVtiwjlpYcYkUhommap8Bja3JdoRfuvLsHytxIsrYOq7gE3Fm/PLu1
 7sgueGjxKhojJv4EsyP/i8xcja60JORnYVT7ni+BbEead4F57/fUSMKrrOkr0ltfH/zWWAw8eV
 cCQNITwG6/YFWJN4vxmm9wr4AQVWECLcchhEpd21Ch/jJq5M6M8PCNO3QYv9FYcJNAV7E5wzf+
 QDOSIsceBr7DU3/5d7R0vmx0JpkXs+E47gmArTEnHYLplemKKg4Co38SuXBeo9onyda6haajUB
 jdE=
X-SBRS: 2.7
X-MesageID: 1041736
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1041736"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH] x86/hvm/hpet: avoid 'small' time diff test on resume
Thread-Index: AQHVFh/NLn9cTGTOSEiqgEoW+PnZTqaB+WCAgAAiClA=
Date: Wed, 29 May 2019 13:43:46 +0000
Message-ID: <238cd126b58c4f3396c2a45f3dfb9c3e@AMSPEX02CL03.citrite.net>
References: <20190529130948.5314-1-paul.durrant@citrix.com>
 <5CEE8AF5020000780023373F@prv1-mh.provo.novell.com>
In-Reply-To: <5CEE8AF5020000780023373F@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/hvm/hpet: avoid 'small' time diff test
 on resume
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
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjkgTWF5IDIwMTkgMTQ6MzcKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdl
aUxpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYvaHZtL2hwZXQ6IGF2
b2lkICdzbWFsbCcgdGltZSBkaWZmIHRlc3Qgb24gcmVzdW1lCj4gCj4gPj4+IE9uIDI5LjA1LjE5
IGF0IDE1OjA5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gSSBub3RpY2Ug
dGhhdCB3ZSBzZWVtaW5nbHkgZG9uJ3QgaGFuZGxlIG1haW4gY291bnRlciB3cmFwIGluIHRoZSBI
UEVUIGNvZGUuCj4gPiBUaGUgc3BlYy4gc2F5cyB0aGF0IHRpbWVycyBzaG91bGQgZmlyZSBhdCB0
aGUgcG9pbnQgdGhlIGNvdW50ZXIgd3JhcHMgYXQgdGhlCj4gPiB0aW1lcidzIHdpZHRoLiBJIHRo
aW5rIHRoZSBuZWVkIGZvciB0aGUgJ3NtYWxsJyB0aW1lIHRlc3Qgd291bGQgZ28gYXdheSBpZgo+
ID4gdGhpcyB3YXMgaW1wbGVtZW50ZWQsIGJ1dCB0aGF0J3MgZm9yIGFub3RoZXIgZGF5Lgo+IAo+
IE9oLCBpbmRlZWQuIEkgd2Fzbid0IGV2ZW4gKGFjdGl2ZWx5KSBhd2FyZSBvZiB0aGlzLiAoSSBo
YXZlbid0IGJlZW4gYWJsZSB0bwo+IHNwb3QgYSBzdGF0ZW1lbnQgdG8gdGhpcyBlZmZlY3QgdGhv
dWdoIGZvciB3cmFwcGluZyBvZiBhIDY0LWJpdCB0aW1lciwganVzdAo+IDMyLWJpdCBvbmVzLikK
CkkgY291bGQgaGF2ZSBzd29ybiBJIHJlYWQgdGhhdCBmb3IgNjQtYml0IHRvbywgYnV0IHVwb24g
cmUtcmVhZGluZyBpdCBkb2VzIGFwcGVhciB0byBvbmx5IGFwcGx5IHRvIDMyLWJpdCB0aW1lcnMu
Cgo+IAo+ID4gQEAgLTI3MywxMCArMjczLDEzIEBAIHN0YXRpYyB2b2lkIGhwZXRfc2V0X3RpbWVy
KEhQRVRTdGF0ZSAqaCwgdW5zaWduZWQgaW50IHRuLAo+ID4gICAgICAgKiBEZXRlY3QgdGltZSB2
YWx1ZXMgc2V0IGluIHRoZSBwYXN0LiBUaGlzIGlzIGhhcmQgdG8gZG8gZm9yIDMyLWJpdAo+ID4g
ICAgICAgKiBjb21wYXJhdG9ycyBhcyB0aGUgdGltZXIgZG9lcyBub3QgaGF2ZSB0byBiZSBzZXQg
dGhhdCBmYXIgaW4gdGhlIGZ1dHVyZQo+ID4gICAgICAgKiBmb3IgdGhlIGNvdW50ZXIgZGlmZmVy
ZW5jZSB0byB3cmFwIGEgMzItYml0IHNpZ25lZCBpbnRlZ2VyLiBXZSBmdWRnZQo+ID4gLSAgICAg
KiBieSBsb29raW5nIGZvciBhICdzbWFsbCcgdGltZSB2YWx1ZSBpbiB0aGUgcGFzdC4KPiA+ICsg
ICAgICogYnkgbG9va2luZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4gdGhlIHBhc3QuIEhv
d2V2ZXIsIGlmIHdlCj4gPiArICAgICAqIGFyZSByZXN1bWluZyBmcm9tIHN1c3BlbmQsIHRyZWF0
IGFueSB3cmFwIGFzIHBhc3Qgc2luY2UgdGhlIHZhbHVlCj4gPiArICAgICAqIGlzIHVubGlrZWx5
IHRvIGJlICdzbWFsbCcuCj4gPiAgICAgICAqLwo+IAo+ICJyZXN1bWluZyIgYW5kICJzdXNwZW5k
IiBhcmUgYXQgYmVzdCBhbWJpZ3VvdXMgLSB0byBtZSB0aGUgdGVybXMKPiByZWxhdGUgbW9yZSB0
byBBQ1BJIFMtc3RhdGVzIHRoYW4gdG8gbWlncmF0ZS9zYXZlL3Jlc3RvcmUuIENvdWxkCj4gSSBn
ZXQgeW91IHRvIGFncmVlIHRvIHVzaW5nICJyZXN0b3JpbmcgYWZ0ZXIgbWlncmF0aW9uIiBvciBz
b21lIHN1Y2g/CgpTdXJlLCBJIGFncmVlIHN1c3BlbmQgYW5kIHJlc3VtZSBhcmUgc29tZXdoYXQg
b3ZlcmxvYWRlZC4KCj4gCj4gV2l0aCB0aGlzIGluIG1pbmQgLSBpcyBhIG5ldyBib29sIHBhcmFt
ZXRlciBuZWVkZWQgYXQgYWxsPyBDYW4ndCB5b3UKPiBpbnN0ZWFkIGtleSB0aGlzIG9mZiBvZiB2
aHBldF9kb21haW4oaCktPmNyZWF0aW9uX2ZpbmlzaGVkPwoKT2gsIEknZCBub3QgY29uc2lkZXJl
ZCB0aGF0Li4uIEknbGwgZ2l2ZSB0aGF0IGEgdHJ5LgoKPiAKPiA+ICAgICAgaWYgKCAoaW50NjRf
dClkaWZmIDwgMCApCj4gPiAtICAgICAgICBkaWZmID0gKHRpbWVyX2lzXzMyYml0KGgsIHRuKSAm
JiAoLWRpZmYgPiBIUEVUX1RJTllfVElNRV9TUEFOKSkKPiA+ICsgICAgICAgIGRpZmYgPSAodGlt
ZXJfaXNfMzJiaXQoaCwgdG4pICYmICgtZGlmZiA+IEhQRVRfVElOWV9USU1FX1NQQU4pICYmCj4g
PiArICAgICAgICAgICAgICAgICFyZXN1bWUpCj4gCj4gTG9naWNhbGx5IEkgd291bGQgc2VlIHRo
ZSBuZXcgcGFydCBvZiB0aGUgY29uZGl0aW9uIGdvIGZpcnN0LCBidXQgdGhhdCdzCj4gcmVhbGx5
IG1pbm9yIGFzIGFsbCB0aHJlZSBjaGVja3MgYXJlIHN1ZmZpY2llbnRseSBjaGVhcC4KCk5vIHBy
b2JsZW0uIEknbGwgcmUtYXJyYW5nZS4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
