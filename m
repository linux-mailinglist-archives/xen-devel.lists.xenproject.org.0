Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66871C53
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:57:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpx8k-0008N7-9h; Tue, 23 Jul 2019 15:55:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpx8i-0008Mk-Qm
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:55:44 +0000
X-Inumbo-ID: 5314732f-ad62-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5314732f-ad62-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:55:42 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kRETBI6O1s9b8ctnIR+IrFWCi8E52g3BZ5JZFrcrT7PWEMBhq27Wby/6NDDTZcXfD1MW3bH8C4
 cLxH0O9Nno7XIHKUQ1aevJAEtzBkZZnmWLx964p63VmP1oMtKM30dLSWivLu0kLldQNyaypq8d
 uy9rHE2zDAX7y+r8r+HZE48OTXkBELT0qSEj91GPaAz1yVVYzeNb5LghLpO2bXwKze2xtuWfPt
 TQN74EEcLrVgPrwnPJUZntvvpehHwAZFW3hV6v+drSWszuLOmDF4DPCy+5+pr3sYI/GjZ7sh6N
 nuQ=
X-SBRS: 2.7
X-MesageID: 3339574
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3339574"
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
 <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
 <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
 <9f8fd17b-0f13-a207-9718-be37832c667b@citrix.com>
 <818e264f-be0a-eaf6-db52-0ee3d7961608@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a278c359-3b00-ea92-43ff-f9078f6bfc0b@citrix.com>
Date: Tue, 23 Jul 2019 16:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <818e264f-be0a-eaf6-db52-0ee3d7961608@suse.com>
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

T24gMjMvMDcvMjAxOSAxNjo1MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyMy4wNy4xOSAx
NzoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjMvMDcvMjAxOSAxNjoyMiwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IE9uIDIzLjA3LjE5IDE3OjA0LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAyMy4wNy4yMDE5IDE2OjI5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBPbiAy
My4wNy4xOSAxNjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMy4wNy4yMDE5IDE2
OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMy4wNy4yMDE5IDE1OjQ0LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMy4wNy4xOSAxNDo0MiwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+Pj4+PiB2LT5wcm9jZXNzb3IgZ2V0cyBsYXRjaGVkIGludG8gc3QtPnByb2Nl
c3NvciBiZWZvcmUgcmFpc2luZyB0aGUKPj4+Pj4+Pj4+IHNvZnRpcnEsCj4+Pj4+Pj4+PiBidXQg
Y2FuJ3QgdGhlIHZDUFUgYmUgbW92ZWQgZWxzZXdoZXJlIGJ5IHRoZSB0aW1lIHRoZSBzb2Z0aXJx
Cj4+Pj4+Pj4+PiBoYW5kbGVyCj4+Pj4+Pj4+PiBhY3R1YWxseSBnYWlucyBjb250cm9sPyBJZiB0
aGF0J3Mgbm90IHBvc3NpYmxlIChhbmQgaWYgaXQncyBub3QKPj4+Pj4+Pj4+IG9idmlvdXMKPj4+
Pj4+Pj4+IHdoeSwgYW5kIGFzIHlvdSBjYW4gc2VlIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUpLCB0
aGVuIEkgdGhpbmsgYQo+Pj4+Pj4+Pj4gY29kZQo+Pj4+Pj4+Pj4gY29tbWVudCB3YW50cyB0byBi
ZSBhZGRlZCB0aGVyZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWW91IGFyZSByaWdodCwgaXQgbWlnaHQg
YmUgcG9zc2libGUgZm9yIHRoZSB2Y3B1IHRvIG1vdmUgYXJvdW5kLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBPVE9IIGlzIGl0IHJlYWxseSBpbXBvcnRhbnQgdG8gcnVuIHRoZSB0YXJnZXQgdmNwdSBleGFj
dGx5IG9uIHRoZQo+Pj4+Pj4+PiBjcHUKPj4+Pj4+Pj4gaXQgaXMgZXhlY3V0aW5nIChvciBoYXMg
bGFzdCBleGVjdXRlZCkgYXQgdGhlIHRpbWUgdGhlIE5NSS9NQ0UgaXMKPj4+Pj4+Pj4gYmVpbmcK
Pj4+Pj4+Pj4gcXVldWVkPyBUaGlzIGlzIGluIG5vIHdheSByZWxhdGVkIHRvIHRoZSBjcHUgdGhl
IE1DRSBvciBOTUkgaGFzCj4+Pj4+Pj4+IGJlZW4KPj4+Pj4+Pj4gaGFwcGVuaW5nIG9uLiBJdCBp
cyBqdXN0IGEgcmFuZG9tIGNwdSwgYW5kIHNvIGl0IHdvdWxkIGJlIGlmIHdlJ2QKPj4+Pj4+Pj4g
ZG8gdGhlCj4+Pj4+Pj4+IGNwdSBzZWxlY3Rpb24gd2hlbiB0aGUgc29mdGlycSBoYW5kbGVyIGlz
IHJ1bm5pbmcuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uZSBxdWVzdGlvbiB0byB1bmRlcnN0YW5kIHRo
ZSBpZGVhIG5laGluZCBhbGwgdGhhdDogX3doeV8gaXMgdGhlCj4+Pj4+Pj4+IHZjcHUKPj4+Pj4+
Pj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4gaXJldD8gSSBjb3VsZCB1bmRlcnN0YW5kIGlmIGl0
IHdvdWxkIGJlCj4+Pj4+Pj4+IHBpbm5lZAo+Pj4+Pj4+PiB0byB0aGUgY3B1IHdoZXJlIHRoZSBO
TUkvTUNFIHdhcyBoYXBwZW5pbmcsIGJ1dCB0aGlzIGlzIG5vdCB0aGUKPj4+Pj4+Pj4gY2FzZS4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFRoZW4gaXQgd2FzIG5ldmVyIGZpbmlzaGVkIG9yIGdvdCBicm9rZW4s
IEkgd291bGQgZ3Vlc3MuCj4+Pj4+Pgo+Pj4+Pj4gT2gsIG5vLiBUaGUgI01DIHNpZGUgdXNlIGhh
cyBnb25lIGF3YXkgaW4gM2E5MTc2OWQ2ZSwgd2l0aG91dAo+Pj4+Pj4gY2xlYW5pbmcKPj4+Pj4+
IHVwIG90aGVyIGNvZGUuIFNvIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkgc3VjaCByZXF1
aXJlbWVudAo+Pj4+Pj4gYW55bW9yZS4KPj4+Pj4KPj4+Pj4gU28ganVzdCB0byBiZSBzdXJlOiB5
b3UgYXJlIGZpbmUgZm9yIG1lIHJlbW92aW5nIHRoZSBwaW5uaW5nIGZvcgo+Pj4+PiBOTUlzPwo+
Pj4+Cj4+Pj4gTm8sIG5vdCB0aGUgcGlubmluZyBhcyBhIHdob2xlLiBUaGUgZm9yY2VkIENQVTAg
YWZmaW5pdHkgc2hvdWxkIHN0aWxsCj4+Pj4gcmVtYWluLiBJdCdzIGp1c3QgdGhhdCB0aGVyZSdz
IG5vIGNvcnJlbGF0aW9uIGFueW1vcmUgYmV0d2VlbiB0aGUgQ1BVCj4+Pj4gYSB2Q1BVIHdhcyBy
dW5uaW5nIG9uIGFuZCB0aGUgQ1BVIGl0IGlzIHRvIGJlIHBpbm5lZCB0byAodGVtcG9yYXJpbHkp
Lgo+Pj4KPj4+IEkgZG9uJ3QgZ2V0IGl0LiBUb2RheSB2Y3B1MCBvZiB0aGUgaGFyZHdhcmUgZG9t
YWluIGlzIHBpbm5lZCB0byB0aGUgY3B1Cj4+PiBpdCB3YXMgbGFzdCBydW5uaW5nIG9uIHdoZW4g
dGhlIE5NSSBoYXBwZW5lZC4gV2h5IGlzIHRoYXQgaW1wb3J0YW50Pwo+Pj4gT3IgZG8geW91IHdh
bnQgdG8gY2hhbmdlIHRoZSBsb2dpYyBhbmQgcGluIHZjcHUwIGZvciBOTUkgaGFuZGxpbmcKPj4+
IGFsd2F5cwo+Pj4gdG8gQ1BVMD8KPj4KPj4gSXRzIChhbGxlZ2VkbHkpIGZvciB3aGVuIGRvbTAg
a25vd3Mgc29tZSBzeXN0ZW0tc3BlY2lmaWMgd2F5IG9mIGdldHRpbmcKPj4gZXh0cmEgaW5mb3Jt
YXRpb24gb3V0IG9mIHRoZSBwbGF0Zm9ybSwgdGhhdCBoYXBwZW5zIHRvIGJlIGNvcmUtc3BlY2lm
aWMuCj4+Cj4+IFRoZXJlIGFyZSByYXJlIGNhc2VzIHdoZXJlIFNNSSdzIG5lZWQgdG8gYmUgZXhl
Y3V0ZWQgb24gQ1BVMCwgYW5kIEkKPj4gd291bGRuJ3QgcHV0IGl0IHBhc3QgaGFyZHdhcmUgZGVz
aWduZXJzIHRvIGhhdmUgc2ltaWxhciBhc3BlY3RzIGZvcgo+PiBOTUlzLgo+Cj4gVW5kZXJzdG9v
ZC4gQnV0IHRvZGF5IHZjcHUwIGlzIF9ub3RfIGJvdW5kIHRvIENQVTAsIGJ1dCB0byBhbnkgY3B1
IGl0Cj4gaGFwcGVuZWQgdG8gcnVuIG9uLgo+Cj4+Cj4+IFRoYXQgc2FpZCwgYXMgc29vbiBhcyB0
aGUgZ2FwaW5nIHNlY3VyaXR5IGhvbGUgd2hpY2ggaXMgdGhlCj4+IGRlZmF1bHQtcmVhZGliaWxp
dHkgb2YgYWxsIE1TUnMsIEkgYmV0IHRoZSB1dGlsaXR5IG9mIHRoaXMgcGlubmluZwo+PiBtZWNo
YW5pc20gd2lsbCBiZSAwLgo+Cj4gQW5kIG15IHJlYXNvbmluZyBpcyB0aGF0IHRoaXMgaXMgdGhl
IGNhc2UgdG9kYXkgYWxyZWFkeSwgYXMgdGhlcmUgaXMKPiBubyBwaW5uaW5nIHRvIENQVTAgZG9u
ZSwgYXQgbGVhc3Qgbm90IG9uIHB1cnBvc2UuCgpCYXNlZCBvbiB0aGlzIGFuYWx5c2lzLCBJJ2Qg
YmUgdGVtcHRlZCB0byBkcm9wIHRoZSBwaW5uaW5nIGNvbXBsZXRlbHkuwqAKSXQgY2xlYXJseSBp
c24ndCB3b3JraW5nIGluIGEgcmF0aW9uYWwgd2F5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
