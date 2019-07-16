Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF36A740
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:22:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLTJ-0003fA-Sy; Tue, 16 Jul 2019 11:18:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGA=VN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnLTI-0003f5-BV
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:18:12 +0000
X-Inumbo-ID: 63dce3ec-a7bb-11e9-9b81-830409f1c43d
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63dce3ec-a7bb-11e9-9b81-830409f1c43d;
 Tue, 16 Jul 2019 11:18:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f0SUAndFX3EnC94SbWxYBaC4JWJq2Cs0GaM76Lq46px8vcxm4TIwxXoI6jYp8HtIXuM08ouXTo
 5BH9FnCQ8wRpcIZe2W1w14nrIADwd2LR1/+pkmzb+MGGnEn0M04pWWrwg6ufEeVbUHQ+pULJCv
 GY0l0viZqb/l0COupBsJ9SjaHSEpX21snF5mSgUA65vDKfVpjJqFUJviSD8pRzGtZi6PVpSzNH
 OCrfASH8AkjEZcBlUOqWELZeWH4ZYyyWvmXDEzIZthjwxtRxNX9Nnqvyd3Ol5tE2xouXz/d7pg
 QyE=
X-SBRS: 2.7
X-MesageID: 3030256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3030256"
Date: Tue, 16 Jul 2019 13:17:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190716111758.bysu6vfs7f7mmher@Air-de-Roger.citrite.net>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
 <20190716091237.fjjhhppndquy3cvx@Air-de-Roger.citrite.net>
 <a6ff2c4a-de0b-f83c-cb6d-5bbbb92d46e9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6ff2c4a-de0b-f83c-cb6d-5bbbb92d46e9@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTA6MjA6MTBBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMDcuMjAxOSAxMToxMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIEp1bCAxNiwgMjAxOSBhdCAwNzo0MDo1N0FNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBJbiBsaW5lIHdpdGggIng4Ni9JUlE6IGRlc2MtPmFmZmluaXR5IHNob3VsZCBzdHJp
Y3RseSByZXByZXNlbnQgdGhlCj4gPj4gcmVxdWVzdGVkIHZhbHVlIiB0aGUgaW50ZXJuYWxseSB1
c2VkIElSUShzKSBhbHNvIHNob3VsZG4ndCBiZSByZXN0cmljdGVkCj4gPj4gdG8gb25saW5lIG9u
ZXMuIE1ha2Ugc2V0X2Rlc2NfYWZmaW5pdHkoKSAoc2V0X21zaV9hZmZpbml0eSgpIHRoZW4gZG9l
cwo+ID4+IGJ5IGltcGxpY2F0aW9uKSBjb3BlIHdpdGggYSBOVUxMIG1hc2sgYmVpbmcgcGFzc2Vk
IChqdXN0IGxpa2UKPiA+PiBhc3NpZ25faXJxX3ZlY3RvcigpIGRvZXMpLCBhbmQgaGF2ZSBJT01N
VSBjb2RlIHBhc3MgTlVMTCBpbnN0ZWFkIG9mCj4gPj4gJmNwdV9vbmxpbmVfbWFwICh3aGVuLCBm
b3IgVlQtZCwgdGhlcmUncyBubyBOVU1BIG5vZGUgaW5mb3JtYXRpb24KPiA+PiBhdmFpbGFibGUp
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+ID4gCj4gPiBMR1RNLCBqdXN0IG9uZSBwYXRjaCBzdHlsZSBjb21tZW50IGFuZCBvbmUgY29k
ZSBjb21tZW50Ogo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9p
cnEuYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+ID4+IEBAIC03OTYsMTggKzc5Niwy
NiBAQCB1bnNpZ25lZCBpbnQgc2V0X2Rlc2NfYWZmaW5pdHkoc3RydWN0IGlyCj4gPj4gICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gPj4gICAgICAgIGNwdW1hc2tfdCBkZXN0X21hc2s7Cj4g
Pj4gICAgCj4gPj4gLSAgICBpZiAoIWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCAmY3B1X29ubGlu
ZV9tYXApKQo+ID4+ICsgICAgaWYgKCBtYXNrICYmICFjcHVtYXNrX2ludGVyc2VjdHMobWFzaywg
JmNwdV9vbmxpbmVfbWFwKSApCj4gPj4gICAgICAgICAgICByZXR1cm4gQkFEX0FQSUNJRDsKPiA+
PiAgICAKPiA+PiAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnZlY3Rvcl9sb2NrLCBmbGFncyk7
Cj4gPj4gLSAgICByZXQgPSBfYXNzaWduX2lycV92ZWN0b3IoZGVzYywgbWFzayk7Cj4gPj4gKyAg
ICByZXQgPSBfYXNzaWduX2lycV92ZWN0b3IoZGVzYywgbWFzayA/OiBUQVJHRVRfQ1BVUyk7Cj4g
Pj4gICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZlY3Rvcl9sb2NrLCBmbGFncyk7Cj4g
PiAKPiA+IEkgdGhpbmsgdGhlIHBhdGNoIGlzIHNvbWVob3cgbWFuZ2xlZCBhdCBsZWFzdCBvbiBt
eSBlbmQsIHRoZXJlJ3Mgb25lCj4gPiBwcmVwZW5kZWQgZXh0cmEgc3BhY2UgaW4gdGhlIG5vbi1t
b2RpZmllZCBsaW5lcyBBRkFJQ1QuCj4gCj4gV2VsbCwgeWVzLCBoZW5jZSB0aGUgbGFzdCBzZW50
ZW5jZSBpbiB0aGUgY292ZXIgbGV0dGVyIGFuZCB0aGUgYXR0YWNoZWQKPiBwYXRjaGVzIHRoZXJl
LiBJdCBpcyB0aGUgbWFpbCBzeXN0ZW0gKG1vcmUgbGlrZWx5IHNlcnZlciB0aGFuIGNsaWVudCkK
PiBvdmVyIGhlcmUgd2hpY2ggY2F1c2VzIHRoaXMgaXNzdWUgKGV2ZXJ5d2hlcmUgZm9yIG1lKS4K
Ck9oLCBzb3JyeSB0byBoZWFyIHRoYXQuIEhvcGUgeW91IGdldCB0aGF0IHNvcnRlZCBvdXQsIEkg
Z3Vlc3MgaXQncwpjYXVzaW5nIHF1aXRlIGEgbG90IG9mIHBhaW4gZm9yIG1vcmUgcGVvcGxlIGF0
IFNVU0UgYWxzby4KCj4gPj4gICAgCj4gPj4gLSAgICBpZiAocmV0IDwgMCkKPiA+PiArICAgIGlm
ICggcmV0IDwgMCApCj4gPj4gICAgICAgICAgICByZXR1cm4gQkFEX0FQSUNJRDsKPiA+PiAgICAK
PiA+PiAtICAgIGNwdW1hc2tfY29weShkZXNjLT5hZmZpbml0eSwgbWFzayk7Cj4gPiAKPiA+IEFG
QUlDVCB5b3UgY291bGQgYWxzbyBhdm9pZCB0aGUgaWYgYW5kIGp1c3QgZG8gdGhlIHNhbWUgYXMg
aW4gdGhlCj4gPiBhc3NpZ25faXJxX3ZlY3RvciBjYWxsIGFib3ZlIGFuZCBwYXNzIFRBUkdFVF9D
UFVTIGlmIG1hc2sgaXMgTlVMTD8KPiAKPiBBcmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIGlmKCkg
aW4gY29udGV4dCBhYm92ZSwgb3IgdGhlIG9uZSB5b3UndmUKPiBzdHJpcHBlZCAoaW1tZWRpYXRl
bHkgZm9sbG93aW5nIHRoZSBsYXN0IHF1b3RlZCBsaW5lIG9mIHRoZSBwYXRjaCk/Cj4gRm9yIHRo
ZSBvbmUgaW4gY29udGV4dCBJIGRvbid0IHNlZSBob3cgdGhlIHJlc3Qgb2YgeW91ciByZW1hcmsg
aXMKPiByZWxhdGVkLiBGb3IgdGhlIG90aGVyIG9uZSAtIG5vLCBzdHJpY3RseSBub3QsIGFzIHRo
YXQgd291bGQgYmUKPiBhZ2FpbnN0IHRoZSBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlOiBXZSBzcGVj
aWZpY2FsbHkgd2FudCB0byBfbm90Xwo+IHJlc3RyaWN0IGRlc2MtPmFmZmluaXR5IHRvIG9ubGlu
ZSBDUFVzIG9ubHkgKHlldCB0aGF0J3Mgd2hhdAo+IFRBUkdFVF9DUFVTIHJlc29sdmVzIHRvKS4K
ClllcywgdGhhdCB3YXMgbXkgcmVtYXJrIC0gd2hpY2ggaXMgd3JvbmcgYXMgeW91IHBvaW50ZWQg
b3V0LiBJIGd1ZXNzCnlvdSBjb3VsZCB1c2UgY3B1X3Bvc3NpYmxlX21hcCwgYnV0IGFueXdheSB0
aGUgY3VycmVudCBhcHByb2FjaCBpcyBPSwpJTU8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
