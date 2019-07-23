Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB071BA1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:31:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpwiz-0005mj-SE; Tue, 23 Jul 2019 15:29:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpwiy-0005me-ER
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:29:08 +0000
X-Inumbo-ID: 9b89bc02-ad5e-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b89bc02-ad5e-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:29:06 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: stgMZVF5DQp2DAo04NnjEfAmmvEaVfK/d2uFOCKxqiTn66+OHnAv0TOa9QBYrOaH48a3GF1JWz
 3/gD7lJY5+eVjIcW+r7uGlx4tLOpn3qV9NKr9w8LnZ/PGYtt0w2wd8lOxT01SARbEMHSr9UpOi
 8gBietscoCOSR6o2kebH+SffQd4WP4isgEChQ4LDPhcGTLME96CQ8NPyWpNT6OCpAJHchF/w6Y
 DCthGkbAGY8LvfEfYc3FaJlK8Le7KT+izqio6vgGstYn28zXmtvIX4Sy1JDOHjdu9WWzpwHY51
 hzg=
X-SBRS: 2.7
X-MesageID: 3359109
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3359109"
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
 <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
 <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9f8fd17b-0f13-a207-9718-be37832c667b@citrix.com>
Date: Tue, 23 Jul 2019 16:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDcvMjAxOSAxNjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy4wNy4xOSAx
NzowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIzLjA3LjIwMTkgMTY6MjksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAyMy4wNy4xOSAxNjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMjMuMDcuMjAxOSAxNjowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIzLjA3
LjIwMTkgMTU6NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBPbiAyMy4wNy4xOSAxNDo0
MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gdi0+cHJvY2Vzc29yIGdldHMgbGF0Y2hlZCBp
bnRvIHN0LT5wcm9jZXNzb3IgYmVmb3JlIHJhaXNpbmcgdGhlCj4+Pj4+Pj4gc29mdGlycSwKPj4+
Pj4+PiBidXQgY2FuJ3QgdGhlIHZDUFUgYmUgbW92ZWQgZWxzZXdoZXJlIGJ5IHRoZSB0aW1lIHRo
ZSBzb2Z0aXJxCj4+Pj4+Pj4gaGFuZGxlcgo+Pj4+Pj4+IGFjdHVhbGx5IGdhaW5zIGNvbnRyb2w/
IElmIHRoYXQncyBub3QgcG9zc2libGUgKGFuZCBpZiBpdCdzIG5vdAo+Pj4+Pj4+IG9idmlvdXMK
Pj4+Pj4+PiB3aHksIGFuZCBhcyB5b3UgY2FuIHNlZSBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lKSwg
dGhlbiBJIHRoaW5rIGEKPj4+Pj4+PiBjb2RlCj4+Pj4+Pj4gY29tbWVudCB3YW50cyB0byBiZSBh
ZGRlZCB0aGVyZS4KPj4+Pj4+Cj4+Pj4+PiBZb3UgYXJlIHJpZ2h0LCBpdCBtaWdodCBiZSBwb3Nz
aWJsZSBmb3IgdGhlIHZjcHUgdG8gbW92ZSBhcm91bmQuCj4+Pj4+Pgo+Pj4+Pj4gT1RPSCBpcyBp
dCByZWFsbHkgaW1wb3J0YW50IHRvIHJ1biB0aGUgdGFyZ2V0IHZjcHUgZXhhY3RseSBvbiB0aGUK
Pj4+Pj4+IGNwdQo+Pj4+Pj4gaXQgaXMgZXhlY3V0aW5nIChvciBoYXMgbGFzdCBleGVjdXRlZCkg
YXQgdGhlIHRpbWUgdGhlIE5NSS9NQ0UgaXMKPj4+Pj4+IGJlaW5nCj4+Pj4+PiBxdWV1ZWQ/IFRo
aXMgaXMgaW4gbm8gd2F5IHJlbGF0ZWQgdG8gdGhlIGNwdSB0aGUgTUNFIG9yIE5NSSBoYXMgYmVl
bgo+Pj4+Pj4gaGFwcGVuaW5nIG9uLiBJdCBpcyBqdXN0IGEgcmFuZG9tIGNwdSwgYW5kIHNvIGl0
IHdvdWxkIGJlIGlmIHdlJ2QKPj4+Pj4+IGRvIHRoZQo+Pj4+Pj4gY3B1IHNlbGVjdGlvbiB3aGVu
IHRoZSBzb2Z0aXJxIGhhbmRsZXIgaXMgcnVubmluZy4KPj4+Pj4+Cj4+Pj4+PiBPbmUgcXVlc3Rp
b24gdG8gdW5kZXJzdGFuZCB0aGUgaWRlYSBuZWhpbmQgYWxsIHRoYXQ6IF93aHlfIGlzIHRoZQo+
Pj4+Pj4gdmNwdQo+Pj4+Pj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4gaXJldD8gSSBjb3VsZCB1
bmRlcnN0YW5kIGlmIGl0IHdvdWxkIGJlCj4+Pj4+PiBwaW5uZWQKPj4+Pj4+IHRvIHRoZSBjcHUg
d2hlcmUgdGhlIE5NSS9NQ0Ugd2FzIGhhcHBlbmluZywgYnV0IHRoaXMgaXMgbm90IHRoZQo+Pj4+
Pj4gY2FzZS4KPj4+Pj4KPj4+Pj4gVGhlbiBpdCB3YXMgbmV2ZXIgZmluaXNoZWQgb3IgZ290IGJy
b2tlbiwgSSB3b3VsZCBndWVzcy4KPj4+Pgo+Pj4+IE9oLCBuby4gVGhlICNNQyBzaWRlIHVzZSBo
YXMgZ29uZSBhd2F5IGluIDNhOTE3NjlkNmUsIHdpdGhvdXQgY2xlYW5pbmcKPj4+PiB1cCBvdGhl
ciBjb2RlLiBTbyB0aGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IHN1Y2ggcmVxdWlyZW1lbnQK
Pj4+PiBhbnltb3JlLgo+Pj4KPj4+IFNvIGp1c3QgdG8gYmUgc3VyZTogeW91IGFyZSBmaW5lIGZv
ciBtZSByZW1vdmluZyB0aGUgcGlubmluZyBmb3IgTk1Jcz8KPj4KPj4gTm8sIG5vdCB0aGUgcGlu
bmluZyBhcyBhIHdob2xlLiBUaGUgZm9yY2VkIENQVTAgYWZmaW5pdHkgc2hvdWxkIHN0aWxsCj4+
IHJlbWFpbi4gSXQncyBqdXN0IHRoYXQgdGhlcmUncyBubyBjb3JyZWxhdGlvbiBhbnltb3JlIGJl
dHdlZW4gdGhlIENQVQo+PiBhIHZDUFUgd2FzIHJ1bm5pbmcgb24gYW5kIHRoZSBDUFUgaXQgaXMg
dG8gYmUgcGlubmVkIHRvICh0ZW1wb3JhcmlseSkuCj4KPiBJIGRvbid0IGdldCBpdC4gVG9kYXkg
dmNwdTAgb2YgdGhlIGhhcmR3YXJlIGRvbWFpbiBpcyBwaW5uZWQgdG8gdGhlIGNwdQo+IGl0IHdh
cyBsYXN0IHJ1bm5pbmcgb24gd2hlbiB0aGUgTk1JIGhhcHBlbmVkLiBXaHkgaXMgdGhhdCBpbXBv
cnRhbnQ/Cj4gT3IgZG8geW91IHdhbnQgdG8gY2hhbmdlIHRoZSBsb2dpYyBhbmQgcGluIHZjcHUw
IGZvciBOTUkgaGFuZGxpbmcgYWx3YXlzCj4gdG8gQ1BVMD8KCkl0cyAoYWxsZWdlZGx5KSBmb3Ig
d2hlbiBkb20wIGtub3dzIHNvbWUgc3lzdGVtLXNwZWNpZmljIHdheSBvZiBnZXR0aW5nCmV4dHJh
IGluZm9ybWF0aW9uIG91dCBvZiB0aGUgcGxhdGZvcm0sIHRoYXQgaGFwcGVucyB0byBiZSBjb3Jl
LXNwZWNpZmljLgoKVGhlcmUgYXJlIHJhcmUgY2FzZXMgd2hlcmUgU01JJ3MgbmVlZCB0byBiZSBl
eGVjdXRlZCBvbiBDUFUwLCBhbmQgSQp3b3VsZG4ndCBwdXQgaXQgcGFzdCBoYXJkd2FyZSBkZXNp
Z25lcnMgdG8gaGF2ZSBzaW1pbGFyIGFzcGVjdHMgZm9yIE5NSXMuCgpUaGF0IHNhaWQsIGFzIHNv
b24gYXMgdGhlIGdhcGluZyBzZWN1cml0eSBob2xlIHdoaWNoIGlzIHRoZQpkZWZhdWx0LXJlYWRp
YmlsaXR5IG9mIGFsbCBNU1JzLCBJIGJldCB0aGUgdXRpbGl0eSBvZiB0aGlzIHBpbm5pbmcKbWVj
aGFuaXNtIHdpbGwgYmUgMC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
