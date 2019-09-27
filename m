Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CF4C0164
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlpU-0002mC-RT; Fri, 27 Sep 2019 08:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDlpT-0002m4-D9
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:42:19 +0000
X-Inumbo-ID: b65871ba-e102-11e9-9670-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id b65871ba-e102-11e9-9670-12813bfff9fa;
 Fri, 27 Sep 2019 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569573738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+vSG2DTfVnL6MDKpBVL8iyhZhEGEpCjEAulCgdREkGM=;
 b=Nv4SEiI/jJpBb3mE8TxgzqGSlmGaFN4wxvnMrxTHQuIa9cmFShgBpH3L
 3TxZGlnwQEFV9rNg1KFI7rSxOGp0C89IdR7A7MtjJn3bqnnMtfTy0rQW8
 gxWfYP0TC3qzrkZPl9oOykqpo/b5zl9grke+EzZ51n4UpRSPKkG6wckG2 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LrD8fmg4tYclywSp3Q2IY63hL+BXmmroaOVYXVMcWIgSGuSc5uQ5DaaGMfBiBE1p8RfssmYjkR
 eJn1zvfTb1eJ0Ss7SvUOcSMz25Us0vwhurZuZdwFYs/x0gcwgAIupTtb25JKewY/XnirhUsty/
 7pFQFKQ9YZmL3r+BLZYXFxS8u9xtl5rUGBdZkI23SqExO63tLb9AufFt6Hxg+td5jtQ6R4vcsR
 8XpyFPqFVQQR5Bn3mNlLUtUzOSuNucY++ZP291S3GjdFT10+5O/VSvAA4Dtb6OaIo/72qc3jcM
 7z8=
X-SBRS: 2.7
X-MesageID: 6392010
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6392010"
Date: Fri, 27 Sep 2019 10:42:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20190927084202.pjjgpufvbqdye6ux@Air-de-Roger>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <20190913103335.ijzx6tuy4iwb5dt5@Air-de-Roger>
 <89c9c9b5-a99f-bfdb-c42c-df64e308a98e@oracle.com>
 <20190924154242.nwhetdvkgmkhjgph@Air-de-Roger>
 <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a81e76c-b342-05b5-b592-c7e6912e6a9f@oracle.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDE6MzM6NDJQTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBPbiA5LzI0LzE5IDg6NDIgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBGcmks
IFNlcCAxMywgMjAxOSBhdCAwOTo1MDozNEFNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4+IE9u
IDkvMTMvMTkgMzozMyBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4gT24gVGh1LCBT
ZXAgMTIsIDIwMTkgYXQgMTE6MDM6MTRBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToKPiA+Pj4+IFdp
dGggYmVsb3cgdGVzdGNhc2UsIGd1ZXN0IGtlcm5lbCByZXBvcnRlZCAiTm8gaXJxIGhhbmRsZXIg
Zm9yIHZlY3RvciI6Cj4gPj4+PiAgIDEpLiBQYXNzdGhyb3VnaCBtbHggaWIgVkYgdG8gMiBwdmh2
bSBndWVzdHMuCj4gPj4+PiAgIDIpLiBTdGFydCByZHMtc3RyZXNzIGJldHdlZW4gMiBndWVzdHMu
Cj4gPj4+PiAgIDMpLiBTY2FsZSBkb3duIDIgZ3Vlc3RzIHZjcHUgZnJvbSAzMiB0byA2IGF0IHRo
ZSBzYW1lIHRpbWUuCj4gPj4+Pgo+ID4+Pj4gUmVwZWF0IGFib3ZlIHRlc3Qgc2V2ZXJhbCBpdGVy
YXRpb24sIGd1ZXN0IGtlcm5lbCByZXBvcnRlZCAiTm8gaXJxIGhhbmRsZXIKPiA+Pj4+IGZvciB2
ZWN0b3IiLCBhbmQgSUIgdHJhZmZpYyBkb3duZWQgdG8gemVybyB3aGljaCBjYXVzZWQgYnkgaW50
ZXJydXB0IGxvc3QuCj4gPj4+Pgo+ID4+Pj4gV2hlbiB2Y3B1IG9mZmxpbmUsIGtlcm5lbCBkaXNh
YmxlZCBsb2NhbCBJUlEsIG1pZ3JhdGUgSVJRIHRvIG90aGVyIGNwdSwKPiA+Pj4+IHVwZGF0ZSBN
U0ktWCB0YWJsZSwgZW5hYmxlIElSUS4gSWYgYW55IG5ldyBpbnRlcnJ1cHQgYXJyaXZlZCBhZnRl
cgo+ID4+Pj4gbG9jYWwgSVJRIGRpc2FibGVkIGFsc28gYmVmb3JlIE1TSS1YIHRhYmxlIGJlZW4g
dXBkYXRlZCwgaW50ZXJydXB0IHN0aWxsIAo+ID4+Pj4gdXNlZCBvbGQgdmVjdG9yIGFuZCBkZXN0
IGNwdSBpbmZvLCBhbmQgd2hlbiBsb2NhbCBJUlEgZW5hYmxlZCBhZ2FpbiwgCj4gPj4+PiBpbnRl
cnJ1cHQgYmVlbiBzZW50IHRvIHdyb25nIGNwdSBhbmQgdmVjdG9yLgo+ID4+Pgo+ID4+PiBZZXMs
IGJ1dCB0aGF0J3Mgc29tZXRoaW5nIExpbnV4IHNob3Vsa2QgYmUgYWJsZSB0byBoYW5kbGUsIGFj
Y29yZGluZwo+ID4+PiB0byB5b3VyIGRlc2NyaXB0aW9uIHRoZXJlJ3MgYSB3aW5kb3cgd2hlcmUg
aW50ZXJydXB0cyBjYW4gYmUgZGVsaXZlcmVkCj4gPj4+IHRvIHRoZSBvbGQgQ1BVLCBidXQgdGhh
dCdzIHNvbWV0aGluZyBleHBlY3RlZC4KPiA+Pgo+ID4+IEFjdHVhbGx5LCBrZXJuZWwgd2lsbCBj
aGVjayBBUElDIElSUiB3aGVuIGRvIG1pZ3JhdGlvbiwgaWYgYW55IHBlbmRpbmcKPiA+PiBJUlEs
IHdpbGwgcmV0cmlnZ2VyIElSUSB0byBuZXcgZGVzdGluYXRpb24sIGJ1dCBYZW4gZG9lcyBub3Qg
c2V0IHRoZQo+ID4+IGJpdC4KPiA+IAo+ID4gUmlnaHQsIGJlY2F1c2UgdGhlIGludGVycnVwdCBp
cyBwZW5kaW5nIGluIHRoZSBQSVJSIHBvc3RlZCBkZXNjcmlwdG9yCj4gPiBmaWVsZCwgaXQgaGFz
IG5vdCB5ZXQgcmVhY2hlZCB0aGUgdmxhcGljIElSUi4KPiA+IAo+ID4+Pgo+ID4+Pj4KPiA+Pj4+
IExvb2tzIHN5bmMgUElSIHRvIElSUiBhZnRlciBNU0ktWCBiZWVuIHVwZGF0ZWQgaXMgaGVscCBm
b3IgdGhpcyBpc3N1ZS4KPiA+Pj4KPiA+Pj4gQUZBSUNUIHRoZSBzeW5jIHRoYXQgeW91IGRvIGlz
IHN0aWxsIHVzaW5nIHRoZSBvbGQgdmNwdSBpZCwgYXMKPiA+Pj4gcGlycV9kcGNpLT5nbXNpLmRl
c3RfdmNwdV9pZCBnZXRzIHVwZGF0ZWQgYSBsaXR0bGUgYml0IGJlbG93LiBJJ20KPiA+Pj4gdW5z
dXJlIGFib3V0IHdoeSBkb2VzIHRoaXMgaGVscCwgSSB3b3VsZCBleHBlY3QgdGhlIHN5bmMgYmV0
d2VlbiBwaXIKPiA+Pj4gYW5kIGlyciB0byBoYXBwZW4gYW55d2F5LCBhbmQgaGVuY2UgSSdtIG5v
dCBzdXJlIHdoeSBpcyB0aGlzIGhlbHBpbmcuCj4gPj4KPiA+PiBBcyBteSBhYm92ZSB1cGRhdGUs
IElSUSByZXRyaWdnZXJlZCBieSBvbGQgY3B1LCBzbyBYZW4gbmVlZCB0byBzZXQgSVJSCj4gPj4g
Zm9yIG9sZCBjcHUgYnV0IG5vdCBvZiBuZXcuCj4gPiAKPiA+IEFGQUlDVCB5b3UgYXJlIGRyYWlu
aW5nIGFueSBwZW5kaW5nIGRhdGEgZnJvbSB0aGUgcG9zdGVkIGludGVycnVwdAo+ID4gUElSUiBm
aWVsZCBpbnRvIHRoZSBJUlIgdmxhcGljIGZpZWxkLCBzbyB0aGF0IG5vIHN0YWxlIGludGVycnVw
dHMgYXJlCj4gPiBsZWZ0IGJlaGluZCBhZnRlciB0aGUgTVNJIGZpZWxkcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSB0aGUgZ3Vlc3QuIEkKPiA+IHRoaW5rIHRoaXMgaXMgY29ycmVjdCwgSSB3b25kZXIg
aG93ZXZlciB3aGV0aGVyIHlvdSBhbHNvIG5lZWQgdG8KPiA+IHRyaWdnZXIgYSB2Y3B1IHJlLXNj
aGVkdWxpbmcgKHBhdXNlL3VucGF1c2UgdGhlIHZwY3UpLCBzbyB0aGF0IHBlbmRpbmcKPiA+IGlu
dGVycnVwdHMgaW4gSVJSIGFyZSBpbmplY3RlZCBieSB2bXhfaW50cl9hc3Npc3QuCj4gPiAKPiA+
IEFsc28sIEkgdGhpbmsgeW91IHNob3VsZCBkbyB0aGlzIHN5bmNpbmcgYWZ0ZXIgdGhlIHBpX3Vw
ZGF0ZV9pcnRlCj4gPiBjYWxsLCBvciBlbHNlIHRoZXJlJ3Mgc3RpbGwgYSB3aW5kb3cgKGFsYmVp
dCBzbWFsbCkgd2hlcmUgeW91IGNhbgo+ID4gc3RpbGwgZ2V0IHBvc3RlZCBpbnRlcnJ1cHRzIGRl
bGl2ZXJlZCB0byB0aGUgb2xkIHZjcHUuCj4gCj4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHdlIG5l
ZWQgdG8gdGFrZSBjYXJlIG9mIHRoaXMgaXNzdWUgYXMgd2VsbC4KPiAKPiBJIGNyZWF0ZWQgYW4g
YWRkaXRpb25hbCBwYXRjaCBidXQgbm90IHRlc3RlZCB5ZXQgZm9yIHRoZSB0ZXN0IGVudiB3YXMK
PiBicm9rZW4sIHBvc3QgaGVyZSBmb3IgeW91ciBjb21tZW50IGZpcnN0bHksIEknbGwgdXBkYXRl
IGxhdGVyIG9mIHRlc3QKPiByZXN1bHQgd2hlbiBteSB0ZXN0IGVudiBiYWNrOgo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW8uYwo+IGluZGV4IDNmNDNiOWQ1YTkuLjQ1OTYxMTBhMTcgMTAwNjQ0Cj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAjaW5jbHVkZSA8eGVuL2lycS5oPgo+ICAj
aW5jbHVkZSA8YXNtL2h2bS9pcnEuaD4KPiAgI2luY2x1ZGUgPGFzbS9odm0vc3VwcG9ydC5oPgo+
ICsjaW5jbHVkZSA8YXNtL2h2bS92bXgvdm14Lmg+CgpXaHkgZG8geW91IG5lZWQgdGhpcyBpbmNs
dWRlPwoKPiAgI2luY2x1ZGUgPGFzbS9pb19hcGljLmg+Cj4gIAo+ICBzdGF0aWMgREVGSU5FX1BF
Ul9DUFUoc3RydWN0IGxpc3RfaGVhZCwgZHBjaV9saXN0KTsKPiBAQCAtNDQzLDkgKzQ0NCwyMSBA
QCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+ICAgICAgICAgICAgICBodm1fbWlncmF0ZV9waXJx
KHBpcnFfZHBjaSwgdmNwdSk7Cj4gIAo+ICAgICAgICAgIC8qIFVzZSBpbnRlcnJ1cHQgcG9zdGlu
ZyBpZiBpdCBpcyBzdXBwb3J0ZWQuICovCj4gLSAgICAgICAgaWYgKCBpb21tdV9pbnRwb3N0ICkK
PiAtICAgICAgICAgICAgcGlfdXBkYXRlX2lydGUodmNwdSA/ICZ2Y3B1LT5hcmNoLmh2bS52bXgu
cGlfZGVzYyA6IE5VTEwsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8sIHBpcnFf
ZHBjaS0+Z21zaS5ndmVjKTsKPiArICAgICAgICBpZiAoIGlvbW11X2ludHBvc3QgKSB7Cj4gKyAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBuZHN0ID0gQVBJQ19JTlZBTElEX0RFU1Q7Cj4gKyAgICAg
ICAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYzsKPiArCj4gKyAgICAgICAgICAgIGRlc2MgPSBw
aXJxX3NwaW5fbG9ja19pcnFfZGVzYyhpbmZvLCBOVUxMKTsKPiArICAgICAgICAgICAgaWYgKCBp
cnFfZGVzYyApIHsKPiArICAgICAgICAgICAgICAgIG5kc3QgPSBpcnFfZGVzYy0+bXNpX2Rlc2Mt
PnBpX2Rlc2MtPm5kc3Q7CgpJIHRoaW5rIHRoaXMgaXMgbm90IGNvcnJlY3QuIE5EU1QgaXMgdGhl
IEFQSUMgSUQgb2YgdGhlIHBoeXNpY2FsIENQVQp1c2VkIGFzIHRoZSBkZXN0aW5hdGlvbiBmb3Ig
bm90aWZpY2F0aW9ucywgaXQncyBub3QgdGhlIElEIG9mIHRoZQp2Y3B1IHdoZXJlIHRoZSBldmVu
dHMgYXJlIHRvIGJlIGRlbGl2ZXJlZC4KCkFsc28sIEkgdGhpbmsgSSdtIHN0aWxsIGNvbmZ1c2Vk
IGJ5IHRoaXMsIEkndmUganVzdCByZWFsaXplZCB0aGF0IHRoZQpQSSBkZXNjcmlwdG9yIHNlZW1z
IHRvIGJlIG1vdmVkIGZyb20gb25lIHZDUFUgdG8gYW5vdGhlciB3aXRob3V0CmNsZWFyaW5nIFBJ
UlIsIGFuZCBoZW5jZSBJJ20gbm90IHN1cmUgd2h5IHlvdSBhcmUgbG9zaW5nIGludGVycnVwdHMg
aW4KdGhhdCBjYXNlLiBJIG5lZWQgdG8gbG9vayBkZWVwZXIgaW4gb3JkZXIgdG8gZmlndXJlIG91
dCB3aGF0J3MgZ29pbmcKb24gdGhlcmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
