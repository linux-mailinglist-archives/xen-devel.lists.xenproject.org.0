Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5495750D8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqeZ5-0004gh-Lk; Thu, 25 Jul 2019 14:17:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqeZ3-0004gb-NF
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:17:49 +0000
X-Inumbo-ID: fa39bc48-aee6-11e9-bdea-97d7f173dd41
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa39bc48-aee6-11e9-bdea-97d7f173dd41;
 Thu, 25 Jul 2019 14:17:48 +0000 (UTC)
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
IronPort-SDR: frbvxm7Q+UL2wZC7i0Y3Z1tsNp7CKM73Od2r676l9uMGNS+L3Pe1TWS0kvJ+VqlnrbX1mXGm7A
 6HdQfhaPMUL5kfGrinijN+My5yw57do4s8w65w42u2I0SctMzOHI+tK1n5aI69ZlXM+zAR8GM1
 mEv2hjMac2BcXxMUIYIXDQGDL1Rwq9L64RvfInrwqAa+0NxmCdVAbJ9ONCDpf/Wz+vJ/IrW2EJ
 VMpRL1yZc3py8+gVFsMK0hprjYYx4p/qEZAuFLY2FMalx0OvO6+Z61MZFbAITChaah9yJ+NBg2
 v74=
X-SBRS: 2.7
X-MesageID: 3519801
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,307,1559534400"; 
   d="scan'208";a="3519801"
Date: Thu, 25 Jul 2019 16:17:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725141734.tkgdcg5zrbefuwzz@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
 <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
 <0f520921-51a5-22c3-bd5d-7774f26bac30@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f520921-51a5-22c3-bd5d-7774f26bac30@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDE6NTk6MjJQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMDcuMjAxOSAxNTo0NywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwOToyOTowMUFNIC0wNDAwLCBGcmVkeSBQLiB3cm90ZToK
PiA+PiBPbiBUaHUsIDIwMTktMDctMjUgYXQgMTU6MTMgKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4gPj4+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjU0OjQ2UE0gKzAwMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMjUuMDcuMjAxOSAxNDo0NCwgIEZyZWR5IFAuICB3
cm90ZToKPiA+Pj4+PiBPbiBXZWQsIDIwMTktMDctMjQgYXQgMTc6NDEgKzAyMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4gPj4+Pj4+Pj4gV2hhdCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0
aGVybWFsZCAob3IgdGhlIGRyaXZlciBpbgo+ID4+Pj4+Pj4+IExpbnV4IGlmCj4gPj4+Pj4+Pj4g
dGhlcmUncyBvbmUpIHVzZSB0byBnZXQgdGhlIHRlbXBlcmF0dXJlIGRhdGE/Cj4gPj4+Pj4KPiA+
Pj4+PiBJbiBvdXIgaW5pdGlhbCBQT0MgdXNpbmcgWGVuIDQuOC54IHdlIHdoZXJlIHVzaW5nIExp
bnV4IGNvcmV0ZW1wCj4gPj4+Pj4gZHJpdmVyCj4gPj4+Pj4gcmVhZGluZyBieSBleGFtcGxlIC9j
bGFzcy9zeXMvaHdtb24vaHdtb24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QKPiA+Pj4+PiBkZXBy
ZWNhdGVkIGF0IGNvbW1pdCA3MmUwMzg0NTBkM2Q1ZGUxYTM5ZjBjZmEyZDJiMGY5YjNkNDNjNmM2
Cj4gPj4+Pgo+ID4+Pj4gSG1tLCBJIHdvdWxkbid0IGNhbGwgdGhpcyBkZXByZWNhdGlvbiwgYnV0
IGEgcmVncmVzc2lvbi4gSSB3b3VsZAo+ID4+Pj4gc2F5IHdlIHdhbnQgdG8gcmUtZXhwb3NlIHRo
aXMgbGVhZiB0byBEb20wLCB0aGUgbW9yZSB0aGF0IHRoZQo+ID4+Pj4gY29tbWl0IGFsc28gb25s
eSBtZW50aW9ucyB1bnByaXZpbGVnZWQgZG9tYWlucy4gQW5kcmV3Pwo+ID4+Pgo+ID4+PiBBRkFJ
Q1QgZnJvbSB0aGUgZG9jdW1lbnRzIHByb3ZpZGVkIGJ5IEZyZWR5IHRoZSB0ZW1wZXJhdHVyZSBp
cyByZWFkCj4gPj4+IGZyb20gYSBNU1IgdGhhdCByZXBvcnRzIHRoZSBjdXJyZW50IHRlbXBlcmF0
dXJlIG9mIHRoZSBjb3JlIG9uIHdoaWNoCj4gPj4+IHRoZSBNU1IgaXMgcmVhZCBmcm9tLiBXaGVu
IHJ1bm5pbmcgb24gWGVuIHRoaXMgd2lsbCBvbmx5IHdvcmsKPiA+Pj4gY29ycmVjdGx5IGlmIGRv
bTAgaXMgZ2l2ZW4gdGhlIHNhbWUgdkNQVXMgYXMgcENQVXMgYW5kIHRob3NlIGFyZQo+ID4+PiBp
ZGVudGl0eSBwaW5uZWQuCj4gPj4KPiA+PiBJIGp1c3Qgd2FudCB0byBiZSBzdXJlIEkgZ290IGl0
IGNvcnJlY3RseSwgYnkgc2F5aW5nICJXaGVuIHJ1bm5pbmcgb24KPiA+PiBYZW4gdGhpcyB3aWxs
IG9ubHkgd29yayBjb3JyZWN0bHkgaWYgLi4uIiBtZWFucyBpbiBhIGZ1dHVyZQo+ID4+IGltcGxl
bWVudGF0aW9uIG9yIHRoYXQgcmlnaHQgbm93IGNvdWxkIHdvcmsgaWYgSSBwaW4gdGhpcyB2L3BD
UFVTPwo+ID4gCj4gPiBObywgcmlnaHQgbm93IHRoZXJlJ3Mgbm8gd2F5IHRvIGdldCB0aGlzIGRh
dGEgZnJvbSBkb20wLCByZWdhcmRsZXNzIG9mCj4gPiB0aGUgcGlubmluZy4KPiAKPiBPZiBjb3Vy
c2UgeW91IGNhbiwgdXNpbmcgdGhlIE1TUiAiZGV2aWNlIiBMaW51eCBvcHRpb25hbGx5Cj4gcHJv
dmlkZXMgKHBsdXMgcGVyaGFwcyB0aGUgcmRtc3IgdXRpbGl0eSBmcm9tIHRoZSBtc3ItdG9vbHMK
PiBwYWNrYWdlKS4KCkJ1dCB5b3Ugd29uJ3QgZ2V0IGNvaGVyZW50IHJlc3VsdHMsIHNpbmNlIHRo
ZSB2Q1BVIG1pZ2h0IGJlIGp1bXBpbmcKZnJvbSBwQ1BVIHRvIHBDUFUsIHRodXMgcmV0dXJuaW5n
IHZhbHVlcyBmcm9tIG11bHRpcGxlIGRpZmZlcmVudCBwQ1BVcwpyZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgYWxsIHJkbXNyIGhhdmUgYmVlbiBleGVjdXRlZCBmcm9tIHRoZSBzYW1lIHZDUFUKZnJvbSBk
b20wIFBvVi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
