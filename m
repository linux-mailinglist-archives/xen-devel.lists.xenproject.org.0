Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06D74B36
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:09:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqad8-0007R1-2k; Thu, 25 Jul 2019 10:05:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F7JP=VW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hqad7-0007Qv-C6
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:05:45 +0000
X-Inumbo-ID: c38d8d97-aec3-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c38d8d97-aec3-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:05:43 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TUFrNMP4Ie9FA5fiDVcgkSiNU4E/JbrNAVBDTopObC3h0orXvYrKoXM5zZt//3cBZlH6dA7yMT
 msYZxGMHkLoutHklzeb9I3Cg7Jt04TYv+dlRByXX7+wGxWCRe3mY2hN6UXFvtXyEUVPXwkRiVe
 pdOhWf1PexbtPpKnvpOLKnywb6hYRtY6z11P7mVmpFQiFNBKapN5IvQk0mr1siEDxfGcCbh/cM
 O5ulaY0xnO2posEbSYVwbaoQUhjQliGDtYbds0q8xH7iw6JiK6unJN3il8AiH7//l2Qab7ibY9
 rPA=
X-SBRS: 2.7
X-MesageID: 3412039
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3412039"
Date: Thu, 25 Jul 2019 11:05:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190725100534.GC1242@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
 <20190723094207.ccnzyzuma4ydpugi@Air-de-Roger>
 <20190724161759.GB1242@perard.uk.xensource.com>
 <20190725090829.yiq2wpszksp5n2ab@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725090829.yiq2wpszksp5n2ab@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTE6MDg6MjlBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwNToxNzo1OVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDExOjQyOjA3QU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVsIDIyLCAyMDE5
IGF0IDAzOjUzOjE5UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+IE9uIE1v
biwgSnVsIDE1LCAyMDE5IGF0IDA0OjE1OjIxUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEp1bCAwNCwgMjAxOSBhdCAwMzo0MjoyMlBNICswMTAwLCBB
bnRob255IFBFUkFSRCB3cm90ZToKPiA+ID4gPiA+ID4gKyAgICAgIC8vIGVycm9yIG1lc3NhZ2U6
IENwdUR4ZTogSW50ZXJzZWN0TWVtb3J5RGVzY3JpcHRvcjoKPiA+ID4gPiA+ID4gKyAgICAgIC8v
ICAgICAgICBkZXNjIFtGQzAwMDAwMCwgMTAwMDAwMDAwKSB0eXBlIDEgY2FwIDg3MDAwMDAwMDAw
MjYwMDEKPiA+ID4gPiA+ID4gKyAgICAgIC8vICAgICAgICBjb25mbGljdHMgd2l0aCBhcGVydHVy
ZSBbRkVFMDAwMDAsIEZFRTAxMDAwKSBjYXAgMQo+ID4gPiA+ID4gPiAgICAgICAgLy8KPiA+ID4g
PiA+ID4gLSAgICAgIGlmIChFbnRyeS0+VHlwZSAhPSBFZmlBY3BpQWRkcmVzc1JhbmdlTWVtb3J5
KSB7Cj4gPiA+ID4gPiA+IC0gICAgICAgIGNvbnRpbnVlOwo+ID4gPiA+ID4gPiArICAgICAgaWYg
KCFYZW5Idm1sb2FkZXJEZXRlY3RlZCAoKSkgewo+ID4gPiA+ID4gPiArICAgICAgICBBZGRSZXNl
cnZlZE1lbW9yeUJhc2VTaXplSG9iIChCYXNlLCBFbmQgLSBCYXNlLCBGQUxTRSk7Cj4gPiA+ID4g
PiAKPiA+ID4gPiA+IFRoaXMgc3BlY2lhbCBjYXNpbmcgZm9yIFBWSCBsb29rcyB3ZWlyZCwgaWRl
YWxseSB3ZSB3b3VsZCBsaWtlIHRvIHVzZQo+ID4gPiA+ID4gdGhlIHNhbWUgY29kZSBwYXRoLCBv
ciBlbHNlIGl0IHNob3VsZCBiZSBleHBsaWNpdGx5IG1lbnRpb25lZCB3aHkgUFZICj4gPiA+ID4g
PiBoYXMgZGl2ZXJnaW5nIGJlaGF2aW91ci4KPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIGh2bWxv
YWRlciBpcyB0aGUgaXNzdWUgcmF0aGVyIHRoYW4gUFZILiBIZXJlIGlzIHBhcnQgb2YgdGhlCj4g
PiA+ID4gIm1lbW9yeSBtYXAiIGFzIGZvdW5kIGluIGh2bWxvYWRlci9jb25maWcuaDoKPiA+ID4g
PiAKPiA+ID4gPiAgIC8qIFNwZWNpYWwgQklPUyBtYXBwaW5ncywgZXRjLiBhcmUgYWxsb2NhdGVk
IGZyb20gaGVyZSB1cHdhcmRzLi4uICovCj4gPiA+ID4gICAjZGVmaW5lIFJFU0VSVkVEX01FTUJB
U0UgICAgICAgICAgICAgIDB4RkMwMDAwMDAKPiA+ID4gPiAgIC8qIE5CLiBBQ1BJX0lORk9fUEhZ
U0lDQUxfQUREUkVTUyAqTVVTVCogbWF0Y2ggZGVmaW5pdGlvbiBpbiBhY3BpL2RzZHQuYXNsISAq
Lwo+ID4gPiA+ICAgI2RlZmluZSBBQ1BJX0lORk9fUEhZU0lDQUxfQUREUkVTUyAgICAweEZDMDAw
MDAwCj4gPiA+ID4gICAjZGVmaW5lIFJFU0VSVkVEX01FTU9SWV9EWU5BTUlDX1NUQVJUIDB4RkMw
MDEwMDAKPiA+ID4gPiAgICNkZWZpbmUgUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfRU5EICAgMHhG
RTAwMDAwMAo+ID4gPiA+IAo+ID4gPiA+IGFuZCBodm1sb2FkZXIgc2ltcGx5IGNyZWF0ZXMgYSBz
aW5nbGUgZTgyMCByZXNlcnZlZCBlbnRyeSwgZnJvbQo+ID4gPiA+IFJFU0VSVkVEX01FTUJBU0Ug
dG8gdGhlIHRvcCBvZiA0R0IuIEl0J3MgcHJvYmFibHkgdG9vIG11Y2guCj4gPiA+IAo+ID4gPiBC
dXQgaXNuJ3QgdGhpcyBraW5kIG9mIGRhbmdlcm91cz8gSG93IGNhbiB5b3UgYXNzdXJlIGZ1dHVy
ZSB2ZXJzaW9ucwo+ID4gPiBvZiBodm1sb2FkZXIgd29uJ3QgdXNlIHRoaXMgc3BhY2U/Cj4gPiA+
IAo+ID4gPiA+IElmIGh2bWxvYWRlciBvbmx5IHJlc2VydmVkCj4gPiA+ID4gQUNQSV9JTkZPX1BI
WVNJQ0FMX0FERFJFU1MtUkVTRVJWRURfTUVNT1JZX0RZTkFNSUNfRU5ELCBJIG1pZ2h0IG5vdCBo
YXZlCj4gPiA+ID4gdG8gc3BlY2lhbCBjYXNlIGh2bWxvYWRlci4KPiA+ID4gCj4gPiA+IENvdWxk
IHdlIGxvb2sgaW50byBnZXR0aW5nIHRoaXMgZml4ZWQgaW4gaHZtbG9hZGVyIHRoZW4/Cj4gPiA+
IAo+ID4gPiBJIHRoaW5rIGl0J3MgZGFuZ2Vyb3VzIGZvciBPVk1GIHRvIHBsYXkgc3VjaCB0cmlj
a3Mgd2l0aCB0aGUgbWVtb3J5Cj4gPiA+IG1hcC4KPiA+ID4gCj4gPiA+ID4gQXMgZmFyIGFzIEkg
a25vdyAweGZlZTAwMDAwIGlzbid0IGEgc3BlY2lhbAo+ID4gPiA+IGJpb3MgbWFwcGluZywgYnV0
IHNvbWV0aGluZyB0aGUgaGFyZHdhcmUgcHJvdmlkZXMuCj4gPiA+IAo+ID4gPiBZZXMsIHRoYXQn
cyB1c2VkIGJ5IHRoZSBsYXBpYywgc28gaXQncyBub3Qgc3BlY2lmaWMgdG8gaHZtbG9hZGVyLgo+
ID4gCj4gPiBSaWdodCwgSSd2ZSBnb3QgYSBjbG9zZXIgbG9vayBhdCB0aGF0IENwdUR4ZSBtb2R1
bGUsIGl0IHdhbnRzIHRoZSBsb2NhbAo+ID4gQVBJQyBtZW1vcnkgbWFwcGVkIHNwYWNlIHRvIGJl
ICJtYXBwZWQgSU8iLCBhbmQgdGhhdCBkaWZmZXJlbnQgdGhhbgo+ID4gInJlc2VydmVkIi4KPiA+
IAo+ID4gU28gd2hpbGUgcGFyc2luZyB0aGUgZTgyMCBmcm9tIGh2bWxvYWRlciwgaW5zdGVhZCBv
ZiBpZ25vcmluZyBhbGwKPiA+IHJlc2VydmVkIHJlZ2lvbiwgSSdtIGdvaW5nIHRvIGF2b2lkIGFk
ZGluZyB0aGUgbG9jYWwgYXBpYyBtZW1vcnkgbWFwcGVkCj4gPiBzcGFjZS4KPiA+IAo+ID4gc29t
ZXRoaW5nIGxpa2U6Cj4gPiAgIGlmIChodm1sb2FkZXJEZXRlY3RlZCgpKQo+IAo+IEkgZG9uJ3Qg
dGhpbmsgeW91IG5lZWQgdG8gZ2F0ZSB0aGlzIG9uIGh2bWxvYWRlciBiZWluZyB1c2VkLCB3aGls
ZQo+IGl0J3MgdHJ1ZSB0aGF0IFBWSCBtZW1vcnkgbWFwIGRvZXNuJ3QgY29udGFpbiBzdWNoIHJl
c2VydmVkIG1lbW9yeQo+IHJlZ2lvbiBBVE0gSSBkb24ndCBzZWUgYW55IGhhcm0gaW4gZG9pbmcg
dGhpcyBmb3IgUFZIIGFsc28uCgpPay4KCj4gPiAgICAgQmFzZSA9ICQoc3RhcnQgb2YgdGhlIGU4
MjAgZW50cnkpOwo+ID4gICAgIEVuZCA9ICQoc3RhcnQgb2YgdGhlIGU4MjAgZW50cnkgKyBzaXpl
KTsKPiA+ICAgICBMb2NhbEFwaWMgPSAweGZlZTAwMDAwOwo+ID4gICAgIGlmIChCYXNlIDwgTG9j
YWxBcGljICYmIExvY2FsQXBpYyA8IEVuZCkgewo+ID4gICAgICAgQWRkUmVzZXJ2ZWRNZW1vcnlS
YW5nZUhvYiAoQmFzZSwgTG9jYWxBcGljLCBGQUxTRSk7Cj4gPiAgICAgICBpZiAoRW5kID4gKExv
Y2FsQXBpYyArIFNJWkVfNEtCKSkgewo+IAo+IFRoZSByYW5nZSBpcyBhY3R1YWxseSBmcm9tIDB4
ZmVlMDAwMDAgdG8gMHhmZWVmZmZmZiAoMk1CKSwgc28geW91Cj4gbGlrZWx5IHdhbnQgdG8gbWFr
ZSBzdXJlIG5vbiBvZiB0aGlzIGlzIGFkZGVkIGFzIHJlc2VydmVkPwoKWW91IG1lYW4gMU1CLCBy
aWdodCA/IDotKS4gSSd2ZSB0cnkgdG8gZmluZCBvdXQgaW4gdGhlIEludGVsIG1hbnVhbCB3aHkK
aXQgd291bGQgYmUgMU1CIGFuZCBjb3VsZG4ndCBmaW5kIHRoYXQsIGJ1dCBvbiB0aGUgb3RoZXIg
aGFuZCB0aGUKaW5pdGlhbGlzYXRpb24gY29kZSBmb3IgT1ZNRiBydW5uaW5nIG9uIFFFTVUgZG9l
cyBhbHNvIHJlc2VydmUgMU1CIGZvcgp0aGUgbG9jYWwgYXBpYy4gU28gSSdsbCBjaGFuZ2UgdG8g
MU1CLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
