Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137CE86047
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:43:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfqd-0003OM-6w; Thu, 08 Aug 2019 10:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvfqb-0003Nv-R2
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:40:41 +0000
X-Inumbo-ID: f5be3f26-b9c8-11e9-b1d7-bf08cf82cd2e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5be3f26-b9c8-11e9-b1d7-bf08cf82cd2e;
 Thu, 08 Aug 2019 10:40:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: elcTG9IXHm2qaXodC/GfoqeL9gx/v/fzf0Z/43p+n4pSmrE/CRF8e2DNw+wbMJ1YGqKzJH4WlJ
 lX2kcE0qfsTjwvjeFXMMFu9tVStRJN3tVYMuuK9xwnzhv8buX5Xe6lT3JF5fbP75wx3RhXZ5M/
 RRwT91tfIzsm26mDpWvz70bm7oiH0miMvg9D5TQgGxr+3mBIeea8Zpt3G0Igb5xXH8Z+IKmJ20
 kiO7YgtbC+k6kEnDuTR7EphHp1u5rfgsvzG/wdcNukM0duPXUsIzdfTL1WRzDx4BtGJbV1ibKc
 Yi4=
X-SBRS: 2.7
X-MesageID: 4183112
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4183112"
Date: Thu, 8 Aug 2019 12:40:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190808104031.yhqdjgawwkddwxac@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-13-anthony.perard@citrix.com>
 <20190807143558.uxha44jflgmstdkj@Air-de-Roger>
 <20190808102641.GQ1242@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808102641.GQ1242@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 12/35]
 OvmfPkg/XenPlatformPei: Grab RSDP from PVH guest start of day struct
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMTE6MjY6NDFBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDQ6MzU6NThQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDA0OjM5OjIxUE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiBDaGVjayBpZiB0aGVyZSdzIGEgc3Rh
cnQgb2YgdGhlIGRheSBzdHJ1Y3QgcHJvdmlkZWQgdG8gUFZIIGd1ZXN0LCBzYXZlCj4gPiA+IHRo
ZSBBQ1BJIFJTRFAgYWRkcmVzcyBmb3IgbGF0ZXIuCj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoIGlt
cG9ydCBpbXBvcnQgYXJjaC14ODYvaHZtL3N0YXJ0X2luZm8uaCBmcm9tIHhlbi5naXQuCj4gPiAK
PiA+IFlvdSBzZWVtIHRvIGNoYW5nZSB0aGUgdHlwZXMgd2hlbiBpbXBvcnRpbmcgc3RhcnRfaW5m
by5oLCBpcyB0aGF0Cj4gPiBhYnNvbHV0ZWx5IG5lY2Vzc2FyeT8KPiAKPiBJIGd1ZXNzIG9uZSBj
b3VsZCB0cnkgdG8gbWFwIHhlbidzIHR5cGVzIHRvIEVES0lJJ3MgdHlwZSB3aXRoIHR5cGVkZWZz
LAo+IGJ1dCBJJ20gbm90IHN1ciBob3cgd2VsbCB0aGF0IHdvdWxkIHdvcmsuIEltcG9ydGluZyB0
aGUgeGVuIGhlYWRlcnMgaXMKPiBkb2N1bWVudGVkIHNvIGNoYW5naW5nIHRoZSB0eXBlcyBpcyBm
YWlybHkgZWFzeSwgc2VlCj4gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2Jsb2Iv
bWFzdGVyL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9SRUFETUUKPiAKPiBB
bHNvLCBjaGFuZ2luZyB0aGUgaGVhZGVyIGZ1cnRoZXIgbWlnaHQgaGF2ZSBiZWVuIHNvbWV0aGlu
ZyB1c2VmdWwgdG8KPiBkbywgd2UgY291bGQgaGF2ZSBtYXRjaCBFREtJSSdzIG5hbWluZyBjb252
ZW50aW9uIGFuZCBzb3VyY2UgZmlsZXMgd291bGQKPiBoYXZlIGxvb2tlZCBhIGJpdCBsZXNzIHdl
aXJkLgoKQWNrLCBkaWRuJ3Qga25vdyB0aGVyZSB3YXMgYSBSRUFETUUgZm9yIHRoaXMgcHJvY2Vk
dXJlLgoKPiA+IEZyb20gbXkgZXhwZXJpZW5jZSB3b3JraW5nIHdpdGggZGlmZmVyZW50IHByb2pl
Y3RzIHdoZW4gaW1wb3J0aW5nIHN1Y2gKPiA+IGhlYWRlcnMgaXQncyBiZXR0ZXIgdG8ga2VlcCB0
aGVtIHZlcmJhdGltLCB0aGlzIG1ha2VzIGltcG9ydGluZyBmdXR1cmUKPiA+IHZlcnNpb25zIGZy
b20gdXBzdHJlYW0gZWFzaWVyLgo+ID4KPiA+IEkgaGF2ZSBhIGNvbW1lbnQgYmVsb3csIGJ1dCBp
dCdzIG1vcmUgbGlrZSBhIHF1ZXN0aW9uLgo+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwo+ID4g
PiBpbmRleCA1YzdkN2RkYzFjLi5iMzY2MTM5YTBhIDEwMDY0NAo+ID4gPiAtLS0gYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jCj4gPiA+ICsrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkv
WGVuLmMKPiA+ID4gQEAgLTI1LDYgKzI1LDcgQEAKPiA+ID4gICNpbmNsdWRlIDxJbmR1c3RyeVN0
YW5kYXJkL0U4MjAuaD4KPiA+ID4gICNpbmNsdWRlIDxMaWJyYXJ5L1Jlc291cmNlUHVibGljYXRp
b25MaWIuaD4KPiA+ID4gICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIuaD4KPiA+ID4gKyNpbmNs
dWRlIDxJbmR1c3RyeVN0YW5kYXJkL1hlbi9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oPgo+ID4g
PiAgCj4gPiA+ICAjaW5jbHVkZSAiUGxhdGZvcm0uaCIKPiA+ID4gICNpbmNsdWRlICJYZW4uaCIK
PiA+ID4gQEAgLTg2LDYgKzg3LDcgQEAgWGVuQ29ubmVjdCAoCj4gPiA+ICAgIFVJTlQzMiBYZW5W
ZXJzaW9uOwo+ID4gPiAgICBFRklfWEVOX09WTUZfSU5GTyAqSW5mbzsKPiA+ID4gICAgQ0hBUjgg
U2lnW3NpemVvZiAoSW5mby0+U2lnbmF0dXJlKSArIDFdOwo+ID4gPiArICBVSU5UMzIgKlBWSFJl
c2V0VmVjdG9yRGF0YTsKPiA+ID4gIAo+ID4gPiAgICBBc21DcHVpZCAoWGVuTGVhZiArIDIsICZU
cmFuc2ZlclBhZ2VzLCAmVHJhbnNmZXJSZWcsIE5VTEwsIE5VTEwpOwo+ID4gPiAgICBtWGVuSW5m
by5IeXBlclBhZ2VzID0gQWxsb2NhdGVQYWdlcyAoVHJhbnNmZXJQYWdlcyk7Cj4gPiA+IEBAIC0x
MjEsNiArMTIzLDI5IEBAIFhlbkNvbm5lY3QgKAo+ID4gPiAgICAgIG1YZW5Idm1sb2FkZXJJbmZv
ID0gTlVMTDsKPiA+ID4gICAgfQo+ID4gPiAgCj4gPiA+ICsgIG1YZW5JbmZvLlJzZHBQdmggPSBO
VUxMOwo+ID4gPiArCj4gPiA+ICsgIC8vCj4gPiA+ICsgIC8vIExvY2F0ZSBhbmQgdXNlIGluZm9y
bWF0aW9uIGZyb20gdGhlIHN0YXJ0IG9mIGRheSBzdHJ1Y3R1cmUgaWYgd2UgaGF2ZQo+ID4gPiAr
ICAvLyBib290ZWQgdmlhIHRoZSBQVkggZW50cnkgcG9pbnQuCj4gPiA+ICsgIC8vCj4gPiA+ICsK
PiA+ID4gKyAgUFZIUmVzZXRWZWN0b3JEYXRhID0gKFZPSUQgKikoVUlOVE4pIFBjZEdldDMyIChQ
Y2RYZW5QdmhTdGFydE9mRGF5U3RydWN0UHRyKTsKPiA+ID4gKyAgLy8KPiA+ID4gKyAgLy8gVGhh
dCBtYWdpYyB2YWx1ZSBpcyB3cml0dGVuIGluIFhlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFp
bi5hc20KPiA+ID4gKyAgLy8KPiA+ID4gKyAgaWYgKFBWSFJlc2V0VmVjdG9yRGF0YVsxXSA9PSBT
SUdOQVRVUkVfMzIgKCdYJywgJ1AnLCAnVicsICdIJykpIHsKPiA+ID4gKyAgICBzdHJ1Y3QgaHZt
X3N0YXJ0X2luZm8gKkhWTVN0YXJ0SW5mbzsKPiA+ID4gKwo+ID4gPiArICAgIEhWTVN0YXJ0SW5m
byA9IChWT0lEICopKFVJTlROKSBQVkhSZXNldFZlY3RvckRhdGFbMF07Cj4gPiA+ICsgICAgaWYg
KEhWTVN0YXJ0SW5mby0+bWFnaWMgPT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSkgewo+ID4g
PiArICAgICAgQVNTRVJUIChIVk1TdGFydEluZm8tPnJzZHBfcGFkZHIgIT0gMCk7Cj4gPiA+ICsg
ICAgICBpZiAoSFZNU3RhcnRJbmZvLT5yc2RwX3BhZGRyICE9IDApIHsKPiA+ID4gKyAgICAgICAg
bVhlbkluZm8uUnNkcFB2aCA9IChWT0lEICopKFVJTlROKUhWTVN0YXJ0SW5mby0+cnNkcF9wYWRk
cjsKPiA+IAo+ID4gSSBndWVzcyB5b3UgY2FuIGRvIHRoaXMgYmVjYXVzZSBPVk1GIGhhcyBhbiBp
ZGVudGl0eSBtYXAgb2YgdmlydHVhbAo+ID4gYWRkcmVzc2VzIHRvIHBoeXNpY2FsIGFkZHJlc3Nl
cz8KPiAKPiBJIHRoaW5rIHNvLCB5ZXMuIEkga25vdyB0aGF0IGVhcmx5IGNvZGUgZG9lcyBjcmVh
dGVkIHBhZ2UgdGFibGUgbGlrZQo+IHRoYXQsIGJ1dCBJIGRvbid0IGtub3cgaWYgbGF0ZXIgY29k
ZSByZXdvcmsgdGhvc2UgcGFnZSB0YWJsZSBvciBub3QuCj4gCj4gPiBJIHdvbmRlciB0aGUgc2l6
ZSBvZiBzdWNoIGlkZW50aXR5IG1hcCwgYW5kIHdoZXRoZXIgeW91IG5lZWQgdG8gY2hlY2sKPiA+
IHRoYXQgdGhlIHJzZHAgYWRkcmVzcyBpcyBpbmRlZWQgaW5zaWRlIG9mIHRoYXQgcmVnaW9uIGJl
Zm9yZQo+ID4gY29udmVydGluZyBpdCB0byBhIHBvaW50ZXIuIFRoZSBzYW1lIHdvdWxkIGFwcGx5
IHRvCj4gPiBQY2RYZW5QdmhTdGFydE9mRGF5U3RydWN0UHRyLCBidXQgdGhhdCdzIGxpa2VseSBz
YWZlIGJlY2F1c2UgaXQncwo+ID4gYWx3YXlzIDwgNEdCLCB3aGljaCBJIGFzc3VtZSBPVk1GIGFs
d2F5cyBoYXMgaWRlbnRpdHkgbWFwcGVkPwo+IAo+IFBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQ
dHIgaXMgc2FmZSBiZWNhdXNlIE9WTUYgb3ducyBpdC4gQXMgZm9yIHRoZQo+IHJzcGRfcGFkZHIq
IGFuZCB0aGUgSFZNU3RhcnRJbmZvKiwgSSBuZWVkIHRvIGNoZWNrLiBBcyB5b3Ugc2F5LCBpdCdz
Cj4gcHJvYmFibHkgZmluZSBhcyBsb25nIGFzIGl0J3MgPDRHQi4KPiAKPiBJJ3ZlIGxvb2tlZCBh
dCB0aGUgY29tbWVudCBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9i
bG9iL21hc3Rlci9Pdm1mUGtnL1Jlc2V0VmVjdG9yL0lhMzIvUGFnZVRhYmxlczY0LmFzbSNMOTQK
PiBUaGlzIG1lYW4gdGhhdCB0aGUgY29kZSBleGVjdXRlZCBpbiB0aGUgcGF0Y2ggKGFjY2Vzc2lu
ZyB0aGUgaHZtIHN0YXJ0Cj4gaW5mbyBzdHJ1Y3QpIGlzIGV4ZWN1dGVkIHdoaWxlIHRoZSBpZCBt
YXAgaXMgc2V0dXAgdXAgdG8gNEdCLiBTbyBhcyBsb25nCj4gYXMgdGhlIHN0cnVjdCBpcyBiZWxv
dyA0RywgaXQncyBmaW5lLgoKWWVzLCB0aGUgc3RhcnRfaW5mbyBzdHJ1Y3QgaXMgZ3VhcmFudGVl
ZCB0byBiZSBiZWxvdyA0R0IgYmVjYXVzZSB0aGUKcGh5c2ljYWwgbWVtb3J5IGFkZHJlc3Mgb2Yg
aXQgaXMgcGFzc2VkIG9uIGEgcmVnaXN0ZXIgd2hlbiBzdGFydGluZwp0aGUga2VybmVsIGluIDMy
Yml0IHByb3RlY3RlZCBtb2RlLCBzbyB0aGUgYWRkcmVzcyBjYW5ub3QgYmUgZ3JlYXRlcgp0aGFu
IDRHQiBvciBpdCB3b3VsZCBiZSB0cnVuY2F0ZWQuCgo+IEFzIGZvciB0aGUgUlNEUCwgSSB0aGlu
ayB0aGF0IHBvaW50ZXIgaXMgYWNjZXNzZWQgbXVjaCBsYXRlciwgd2hlbiBhCj4gZGlmZmVyZW50
IHBhZ2UgdGFibGUgaXMgc2V0dXAsIEkgdGhpbmsgdGhhdCB3b3VsZCBiZSB0aGF0IGNvZGU6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL2Jsb2IvbWFzdGVyL01kZU1vZHVsZVBr
Zy9Db3JlL0R4ZUlwbFBlaW0vWDY0L1ZpcnR1YWxNZW1vcnkuYwo+IEJ1dCBJJ20gbm90IHN1cmUg
aG93IG11Y2ggaXMgc2V0dXAuIEJ1dCBJJ20gZ3Vlc3NpbmcgdGhhdCB3aGF0ZXZlciBpcwo+IHBv
aW50ZWQgYnkgUlNEUCwgaXQgd2lsbCBiZSBpbiB0aGUgMToxLCBiZWNhdXNlIHdlIHRlbGwgdGhl
IFVFRkkgYWJvdXQKPiBpdCB3aGlsZSBwYXJzaW5nIHRoZSBlODIwLgoKT0ssIGFzIGxvbmcgYXMg
d2Uga25vdyBpdCdzIHNhZmUgdG8gYWNjZXNzLiBOb3RlIGl0J3MgcXVpdGUgbGlrZWx5IHRoZQpy
c2RwIGlzIGFsc28gYmVsb3cgNEdCIGFueXdheSwgYnV0IGJldHRlciBiZSBzYWZlIHRoYW4gc29y
cnkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
