Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7571FEC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 21:10:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq06r-0008HO-5E; Tue, 23 Jul 2019 19:06:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hq06q-0008HJ-22
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 19:06:00 +0000
X-Inumbo-ID: e70b510f-ad7c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e70b510f-ad7c-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 19:05:57 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZoOerODDG1tW88L87CfGQun8BTKwRDKz0WK7qlGA/jwYyFhOtyeqUF5gVHwcM0yMC3ITrl0KNv
 p2t1RjkDkUQvGhWNW6Ki5TAhslBvlCsYcGTIJkz+HaEzWDYoLv1KPsj63gb1gk6Yy9NDJJqYbY
 raDmlL0MxvwiVvywSyR9uKbCpJWskhlSCy4wQ8TzPMNCk9ezXT81Pja9BC6M5TOG8rRg0C7ojl
 dnDf3GJgdgqlyneH+c/mjYt/tzw1k9v2f1tJd8d3cuWV2xTTEuMQokNOek/Fotx1fslcW0syEL
 HoQ=
X-SBRS: 2.7
X-MesageID: 3454824
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,300,1559534400"; 
   d="scan'208";a="3454824"
To: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
 <61efdf04-1e5f-8cee-7244-13cc74ea6318@suse.com>
 <7e326f1d-a88d-5402-d11a-50b059f8768a@citrix.com>
 <712cf182-861f-3d10-9abe-b0ae689eb24c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8092088a-ebd7-ac32-5f48-a411f88628d8@citrix.com>
Date: Tue, 23 Jul 2019 20:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <712cf182-861f-3d10-9abe-b0ae689eb24c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDcvMjAxOSAxNjozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy4wNy4xOSAx
NTozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjMvMDcvMjAxOSAwNTozNiwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IE9uIDIyLjA3LjE5IDIxOjIwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2Mvd2lzaGxpc3QucnN0IGIvZG9jcy9taXNjL3dp
c2hsaXN0LnJzdAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAw
MC4uNmNkYjQ3ZDZlNwo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9kb2NzL21pc2Mvd2lz
aGxpc3QucnN0Cj4+Pj4gQEAgLTAsMCArMSw1MyBAQAo+Pj4+ICtEZXZlbG9wbWVudCBXaXNobGlz
dAo+Pj4+ICs9PT09PT09PT09PT09PT09PT09PQo+Pj4+ICsKPj4+PiArUmVtb3ZlIHhlbnN0b3Jl
ZCdzIGRlcGVuZGVuY2llcyBvbiB1bnN0YWJsZSBpbnRlcmZhY2VzCj4+Pj4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+ICsKPj4+PiAr
VmFyaW91cyB4ZW5zdG9yZWQgaW1wbGVtZW50YXRpb25zIHVzZSBsaWJ4YyBmb3IgdHdvIHB1cnBv
c2VzLsKgIEl0Cj4+Pj4gd291bGQgYmUgYQo+Pj4+ICtzdWJzdGFudGlhbCBhZHZhbnRhZ2UgdG8g
bW92ZSB4ZW5zdG9yZWQgb250byBlbnRpcmVseSBzdGFibGUKPj4+PiBpbnRlcmZhY2VzLCB3aGlj
aAo+Pj4+ICtkaXNjb25uZWN0cyBpdCBmcm9tIHRoZSBpbnRlcm5hbCBvZiB0aGUgbGlieGMuCj4+
Pj4gKwo+Pj4+ICsxLiBGb3JlaWduIG1hcHBpbmcgb2YgdGhlIHN0b3JlIHJpbmcKPj4+PiArfn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Pj4gKwo+Pj4+ICtUaGlzIGlzIG9i
c29sZXRlIHNpbmNlIDp4ZW4tY3M6YDZhMmRlMzUzYTlgICgyMDEyKSB3aGljaCBhbGxvY2F0ZWQK
Pj4+PiBncmFudAo+Pj4+ICtlbnRyaWVzIGluc3RlYWQsIHRvIGFsbG93IHhlbnN0b3JlZCB0byBm
dW5jdGlvbiBhcyBhIHN0dWItZG9tYWluCj4+Pj4gd2l0aG91dCBkb20wCj4+Pj4gK3Blcm1pc3Np
b25zLsKgIDp4ZW4tY3M6YDM4ZWViMzg2NGRgIGRyb3BwZWQgZm9yZWlnbiBtYXBwaW5nIGZvcgo+
Pj4+IGN4ZW5zdG9yZWQuCj4+Pj4gK0hvd2V2ZXIsIHRoZXJlIGFyZSBubyBPQ2FtbCBiaW5kaW5n
cyBmb3IgbGlieGVuZ250dGFiLgo+Pj4+ICsKPj4+PiArV29yayBJdGVtczoKPj4+PiArCj4+Pj4g
KyogTWluaW1hbCBgYHRvb2xzL29jYW1sL2xpYnMveGcvYGAgYmluZGluZyBmb3IKPj4+PiBgYHRv
b2xzL2xpYnMvZ250dGFiL2BgLgo+Pj4+ICsqIFJlcGxpY2F0ZSA6eGVuLWNzOmAzOGVlYjM4NjRk
YCBmb3Igb3hlbnN0b3JlZCBhcyB3ZWxsLgo+Pj4+ICsKPj4+PiArCj4+Pj4gKzIuIEZpZ3VyaW5n
IG91dCB3aGljaCBkb21haW4ocykgaGF2ZSBnb25lIGF3YXkKPj4+PiArfn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Pj4+ICsKPj4+PiArQ3VycmVudGx5LCB0
aGUgaGFuZGxpbmcgb2YgZG9tYWlucyBpcyBhc3ltbWV0cmljLgo+Pj4+ICsKPj4+PiArKiBXaGVu
IGEgZG9tYWluIGlzIGNyZWF0ZWQsIHRoZSB0b29sc3RhY2sgZXhwbGljaXRseSBzZW5kcyBhbgo+
Pj4+ICvCoCBgYFhTX0lOVFJPRFVDRShkb21pZCwgc3RvcmUgbWZuLCBzdG9yZSBldnRjaG4pYGAg
bWVzc2FnZSB0bwo+Pj4+IHhlbnN0b3JlZCwgdG8KPj4+PiArwqAgY2F1c2UgeGVuc3RvcmVkIHRv
IGNvbm5lY3QgdG8gdGhlIGd1ZXN0IHJpbmcsIGFuZCBmaXJlIHRoZQo+Pj4+ICvCoCBgYEBpbnRy
b2R1Y2VEb21haW5gYCB3YXRjaC4KPj4+PiArKiBXaGVuIGEgZG9tYWluIGlzIGRlc3Ryb3llZCwg
WGVuIGZpcmVzIGBgVklSUV9ET01fRVhDYGAgd2hpY2ggaXMKPj4+PiBib3VuZCBieQo+Pj4+ICvC
oCB4ZW5zdG9yZWQsIHJhdGhlciB0aGFuIHRoZSB0b29sc3RhY2suwqAgeGVuc3RvcmVkIHVwZGF0
ZXMgaXRzIGlkZWEKPj4+PiBvZiB0aGUKPj4+PiArwqAgc3RhdHVzIG9mIGRvbWFpbnMsIGFuZCBm
aXJlcyB0aGUgYGBAcmVsZWFzZURvbWFpbmBgIHdhdGNoLgo+Pj4+ICsKPj4+PiArWGVuc3RvcmVk
IHVzZXMgYGB4Y19kb21haW5fZ2V0aW5mbygpYGAsIHRvIHdvcmsgb3V0IHdoaWNoIGRvbWFpbihz
KQo+Pj4+IGhhdmUgZ29uZQo+Pj4+ICthd2F5LCBhbmQgb25seSBjYXJlcyBhYm91dCB0aGUgc2h1
dGRvd24gc3RhdHVzLgo+Pj4+ICsKPj4+PiArRnVydGhlcm1vcmUsIGBgQHJlbGVhc2VEb21haW5g
YCAobGlrZSBgYFZJUlFfRE9NX0VYQ2BgKSBpcyBhCj4+Pj4gc2luZ2xlLWJpdAo+Pj4+ICttZXNz
YWdlLCB3aGljaCByZXF1aXJlcyBhbGwgbGlzdGVuZXJzIHRvIGV2YWx1YXRlIHdoZXRoZXIgdGhl
Cj4+Pj4gbWVzc2FnZSBhcHBsaWVzCj4+Pj4gK3RvIHRoZW0gb3Igbm90LsKgIFRoaXMgcmVzdWx0
cyBpbiBhIGZsdXJyeSBvZiBgYHhjX2RvbWFpbl9nZXRpbmZvKClgYAo+Pj4+IGNhbGxzCj4+Pj4g
K2Zyb20gbXVsdGlwbGUgZW50aXRpZXMgaW4gdGhlIHN5c3RlbSwgd2hpY2ggYWxsIHNlcmlhbGlz
ZSBvbiB0aGUKPj4+PiBkb21jdGwgbG9jawo+Pj4+ICtpbiBYZW4uCj4+Pj4gKwo+Pj4+ICtXb3Jr
IEl0ZW1zOgo+Pj4+ICsKPj4+PiArKiBGaWd1cmUgb3V0IGhvdyBzaHV0ZG93biBzdGF0dXMgY2Fu
IGJlIGV4cHJlc3NlZCBpbiBhIHN0YWJsZSB3YXkKPj4+PiBmcm9tIFhlbi4KPj4+PiArKiBGaWd1
cmUgb3V0IGlmIGBgVklSUV9ET01fRVhDYGAgYW5kIGBgQHJlbGVhc2VEb21haW5gYCBjYW4gYmUK
Pj4+PiBleHRlbmRlZCB0bwo+Pj4+ICvCoCBjYXJyeSBhdCBsZWFzdCBhIGRvbWlkLCB0byBtYWtl
IGRvbWFpbiBzaHV0ZG93biBzY2FsZSBiZXR0ZXIuCj4+Pgo+Pj4gQHJlbGVhc2VEb21haW4gKGFu
ZCBAaW50cm9kdWNlRG9tYWluKSBjYW4ndCBiZSBleHRlbmRlZCwgd2UnZCBuZWVkIHRvCj4+PiBh
ZGQgYW5vdGhlciB3YXRjaCBwYXRoIGxpa2UgQGRvbWFpblN0YXR1cy88ZG9taWQ+LzxuZXdTdGF0
ZT4uIFhlbnN0b3JlZAo+Pj4gY291bGQgYWR2ZXJ0aXNlIGl0cyBjYXBhYmlsaXR5IHRvIHJhaXNl
IHRoaXMgd2F0Y2ggaW4gL3Rvb2wveGVuc3RvcmVkLgo+Pgo+PiBJIGd1ZXNzIEkgd2FzIGJlaW5n
IGEgYml0IGZhc3QgYW5kIGxvb3NlIHdpdGggdGVybWlub2xvZ3kuwqAgSSBkaWRuJ3QKPj4gaW50
ZW5kIHRvIGltcGx5ICJsaXRlcmFsbHkgbW9kaWZ5IEB7aW50cm9kdWNlLHJlbGVhc2V9RG9tYWlu
IiwgYXMgdGhleQo+PiBhcmUgYWxyZWFkeSBmaXhlZCBBQklzLCBidXQgbW9yZSB0byAiY29tcGF0
aWJseSBidWlsZCBzb21ldGhpbmcgd2hpY2ggaXMKPj4gYmV0dGVyIi4KPgo+IE9rYXkuCj4KPj4K
Pj4gVGhhdCBzY2hlbWUgd291bGQgd29yayBmb3IgaW1wcm92ZWQgQHJlbGVhc2VEb21haW4sIGJ1
dCBpdCB3b3VsZG4ndCB3b3JrCj4+IGZvciBhbiBpbXByb3ZlZCBpbnRyb2R1Y2UuwqAgSW50cm9k
dWNlIG5lZWRzIGEgc2luZ2xlIGtleSB0byB3YXRjaCBvbiwKPj4gd2hpY2ggaGFuZHMgYmFjayB0
aGUgZG9taWQgc28geW91IGRvbid0IG5lZWQgdG8gZ28gc2VhcmNoaW5nIGZvciBpdC4KPgo+IFll
cywgYW5kPyBJdHMgcGVyZmVjdGx5IGZpbmUgdG8gc2V0IGEgd2F0Y2ggZmlyaW5nIGlmIGFueXRo
aW5nIGJlbG93Cj4gQGRvbWFpblN0YXR1cyBpcyBjaGFuZ2luZy4KCkhtbSAtIHRoYXQgbWlnaHQg
d29yayBpZiBubyBvdGhlciBpbmZvcm1hdGlvbiB3YXMgcHV0IGludG8gZG9tYWluU3RhdHVzLApi
dXQgd291bGQgcXVpY2tseSBiZWNvbWUgYSBzY2FsYWJpbGl0eSBwcm9ibGVtIG90aGVyd2lzZS4K
Cj4KPj4KPj4+Cj4+PiBBcyBWSVJRX0RPTV9FWEMgaXMganVzdCBhbiBldmVudCBJIGRvbid0IHNl
ZSBob3cgdGhlIGRvbWlkIGNvdWxkIGJlCj4+PiBwYXNzZWQgYnkgaXQuIEkgZ3Vlc3Mgd2UnZCBu
ZWVkIGUuZy4gYSBzaGFyZWQgbWVtb3J5IGFyZWEgd2hpY2ggdGhlCj4+PiBkb21haW4gcmVnaXN0
ZXJlZCBmb3IgVklSUV9ET01fRVhDIGNvdWxkIG1hcCBhbmQgd2hpY2ggd291bGQgY29udGFpbiBh
Cj4+PiBiaXRtYXAgKG9uZSBiaXQgcGVyIGRvbWFpbikuIFRoZSBoeXBlcnZpc29yIHdvdWxkIHNl
dCB0aGUgYml0IG9uIGEKPj4+IHN0YXR1cyBjaGFuZ2UgYW5kIGZpcmUgVklSUV9ET01fRVhDLCB4
ZW5zdG9yZWQgd291bGQgbG9vayBmb3IgYSBzZXQKPj4+IGJpdCwgY2xlYXIgaXQgYW5kIHJlYWQg
dGhlIHN0YXR1cyBvZiB0aGUgcmVsYXRlZCBkb21haW4uCj4+Cj4+IFRoZSBwb2ludCBoZXJlIGlz
IHRvIGF2b2lkIHVzaW5nIHhjX2RvbWFpbl9nZXRpbmZvKCkgaW4gdGhlIGZpcnN0IHBsYWNlLAo+
PiBzbyB0aGVyZSBuZWVkcyB0byBiZSBubyAiZ2V0dGluZyB0aGUgc3RhdHVzIG9mIHRoZSBkb21h
aW4iLgo+Cj4gSSdkIGd1ZXNzIGEgc2luZ2xlIHhjX2RvbWFpbl9nZXRpbmZvKCkgaW4gdGhlIHRv
b2xzIHdvdWxkbid0IGJlIHNvCj4gcHJvYmxlbWF0aWMuIFRoZSBjYWxsZXIgd291bGQga25vdyB0
aGUgZG9taWQgYWxyZWFkeSwgc28gbm8gbmVlZCB0bwo+IHF1ZXJ5IGFsbCBkb21haW5zLgoKSXRz
IHN0aWxsIGEgcHJvYmxlbSB3aGVuIHlvdSd2ZSBnb3QgMTAwMCBRZW11J3MsIHRoZXkgYWxsIGdl
dApAcmVsZWFzZURvbWFpbiwgYW5kIHRyeSB0byBmaWd1cmUgb3V0IGlmIGl0IGlzIHRoZWlyIG93
biBkb21haW4gd2hpY2gKd2VudCBhd2F5LgoKVGhpcyBzaG91bGRuJ3QgcmVxdWlyZSB0YWtpbmcg
dGhlIGRvbWN0bCBsb2NrIGluIFhlbiAxMDAwIHRpbWVzIHRvCmZpZ3VyZSBvdXQsIHNlZWluZyBh
cyB4ZW5zdG9yZWQga25vd3MgZXhhY3RseSB3aGljaCBkb21haW4gYWN0dWFsbHkgd2VudAphd2F5
LgoKPgo+PiBET01fRVhDIGlzIGZpcmVkIGZvciBkb21haW5fc2h1dGRvd24oKSBvbmx5IChidXQg
Zm9yIHJlYXNvbnMgd2hpY2gKPj4gZXNjYXBlIG1lLCBmaXJlZCB0d2ljZSkuwqAgR2l2ZW4gdGhh
dCBhIGRvbWlkIGlzIGEgMTUgYml0IG51bWJlciwgYQo+PiBiaXRtYXAgb2YgYWxsIGRvbWFpbnMg
ZG9lcyBmaXQgd2l0aGluIGEgc2luZ2xlIDRrIHBhZ2UuCj4KPiBGaXJpbmcgdHdpY2UgaXMgbmVl
ZGVkOiBmaXJzdCB0aW1lIGZvciBkaXNjb25uZWN0aW5nIGFsbCBiYWNrZW5kcwo+IGFuZCB0aGUg
c2Vjb25kIHRpbWUgZm9yIGNsZWFuaW5nIHVwIHdoZW4gdGhlIGRvbWFpbiBpcyBjb21wbGV0ZWx5
Cj4gZ29uZS4KCkRvIHdlIHJlYWxseSBoYXZlIHBpZWNlcyBvZiBjb2RlIHdoaWNoIGNvdW50IHRo
ZSB0aGUgQHJlbGVhc2VEb21haW4ncwpmb3IgYSBzcGVjaWZpYyBkb21haW4/wqAgUGxlYXNlIHNh
eSBuby4uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
