Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88A1A8581
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:19:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5W4o-0007o4-9K; Wed, 04 Sep 2019 14:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mPyZ=W7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5W4m-0007nY-5K
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:16:00 +0000
X-Inumbo-ID: 843944ca-cf1e-11e9-abb6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 843944ca-cf1e-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567606558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6vO7qbW891WPrCVKGLmlAxDB3utXMdNufbZ0UeE4opY=;
 b=RRdqZB4F40J80sPdulcLZ1HXK1F1wNl7e+iT/lJta8Qu/kEhco1jP2Sc
 Jb5doskEQQOft3Y/1pZKpYwV24fyUjOYfsKjUOzG1XpEkKU8nTgsTwt40
 J7f0iduOznfCDSysiDuE9NK6IBFtVR/S0h/ao1Gl54kcTDWvE1kLZBmcg Q=;
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
IronPort-SDR: qKnXs0xvcPmtlzvMULsJ8w+kb1k/U3qRlM/P8gl4WtOZugLzVVyBMS5HtC6CN0mKCkoUHuwEN7
 eemG7YP7wrPjoMXvGIXWJp4LALqVG7MMUPQgVh4T8zTNk3qnjlo30L4QLevNynvri2zwRB+lSc
 ZxPO3fFw0dQ1Fnbud/8OSpaomftVDLqwvaBoj9El0h+3JheR0aaiQGbpAX5QiBKNip/2QhZ4we
 ayvDDGg5QkVTOTFnVpXe5yFTWNemTOw5eQHdbUpeFsSBkfW9vUikJ0jzzG6UaSdJV11UhYUJkp
 QWk=
X-SBRS: 2.7
X-MesageID: 5342250
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5342250"
Date: Wed, 4 Sep 2019 16:15:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20190904141550.zphmb5m2uqotg5in@Air-de-Roger>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
 <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
 <20190829102620.6gut2dmpouynbj44@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D562422@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D562422@SHSMSX104.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDY6NTA6MjVBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5j
b21dCj4gPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDI5LCAyMDE5IDY6MjYgUE0KPiA+IAo+ID4g
T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDU6MjM6MzNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPiA+IE9uIDIzLjA4LjIwMTkgMDc6NTgsICBUaWFuLCBLZXZpbiAgd3JvdGU6Cj4gPiA+
ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0K
PiA+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMCwgMjAxOSAxMTozOCBQTQo+ID4gPiA+
ID4KPiA+ID4gPiA+IFRoZSBsZXZlbCBwYXNzZWQgdG8gZXB0X2ludmFsaWRhdGVfZW10IGNvcnJl
c3BvbmRzIHRvIHRoZSBFUFQgZW50cnkKPiA+ID4gPiA+IHBhc3NlZCBhcyB0aGUgbWZuIHBhcmFt
ZXRlciwgd2hpY2ggaXMgYSBwb2ludGVyIHRvIGFuIEVQVCBwYWdlIHRhYmxlLAo+ID4gPiA+ID4g
aGVuY2UgdGhlIGVudHJpZXMgaW4gdGhhdCBwYWdlIHRhYmxlIHdpbGwgaGF2ZSBvbmUgbGV2ZWwg
bGVzcyB0aGFuIHRoZQo+ID4gPiA+ID4gcGFyZW50Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZpeCB0
aGUgY2FsbCB0byBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHRvIHBhc3MgdGhlIGNvcnJlY3QgbGV2
ZWwsIGllOgo+ID4gPiA+ID4gb25lIGxldmVsIGxlc3MgdGhhbiB0aGUgcGFyZW50Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+IEZpeGVzOiA1MGZlNmU3MzcwNSAoJ3B2aCBkb20wOiBhZGQgYW5kIHJlbW92
ZSBmb3JlaWduIHBhZ2VzJykKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiBDYzogSnVu
IE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgo+ID4gPiA+ID4gQ2M6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+ID4gPiA+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+ID4gPiA+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gPiA+ID4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiA+ID4gPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gPiA+
ID4gQ2M6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiA+ID4gPiA+
IENjOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCAyICstCj4gPiA+ID4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jIGIveGVuL2Fy
Y2gveDg2L21tL3AybS1lcHQuYwo+ID4gPiA+ID4gaW5kZXggNmI4NDY4Yzc5My4uMjNhZTZlOWRh
MyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiA+ID4g
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiA+ID4gPiA+IEBAIC0zNjcsNyAr
MzY3LDcgQEAgc3RhdGljIGJvb2xfdCBlcHRfaW52YWxpZGF0ZV9lbXQoc3RydWN0Cj4gPiBwMm1f
ZG9tYWluCj4gPiA+ID4gPiAqcDJtLCBtZm5fdCBtZm4sCj4gPiA+ID4gPiAgICAgICAgICAgZS5l
bXQgPSBNVFJSX05VTV9UWVBFUzsKPiA+ID4gPiA+ICAgICAgICAgICBpZiAoIHJlY2FsYyApCj4g
PiA+ID4gPiAgICAgICAgICAgICAgIGUucmVjYWxjID0gMTsKPiA+ID4gPiA+IC0gICAgICAgIHJj
ID0gYXRvbWljX3dyaXRlX2VwdF9lbnRyeShwMm0sICZlcHRlW2ldLCBlLCBsZXZlbCk7Cj4gPiA+
ID4gPiArICAgICAgICByYyA9IGF0b21pY193cml0ZV9lcHRfZW50cnkocDJtLCAmZXB0ZVtpXSwg
ZSwgbGV2ZWwgLSAxKTsKPiA+ID4gPiA+ICAgICAgICAgICBBU1NFUlQocmMgPT0gMCk7Cj4gPiA+
ID4gPiAgICAgICAgICAgY2hhbmdlZCA9IDE7Cj4gPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4KPiA+
ID4gPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Lgo+ID4g
PiA+Cj4gPiA+ID4gT25lIHNtYWxsIGNvbW1lbnQgYWJvdXQgcmVhZGFiaWxpdHkuIFdoYXQgYWJv
dXQgcmVuYW1pbmcgJ2xldmVsJwo+ID4gPiA+IHRvICdwYXJlbnRfbGV2ZWwnIGluIHRoaXMgZnVu
Y3Rpb24/Cj4gPiA+Cj4gPiA+IEFuZCBhbHNvIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIG1h
a2luZyBpdCB1bnNpZ25lZCBpbnQ/Cj4gPiAKPiA+IEkndmUgYmVlbiB0aGlua2luZyBhYm91dCB0
aGlzLCBhbmQgSSdtIG5vdCBzdXJlIHJlbmFtaW5nIGxldmVsIHRvCj4gPiBwYXJlbnRfbGV2ZWwg
aXMgY29ycmVjdCwgbGV2ZWwgYWN0dWFsbHkgbWF0Y2hlcyB0aGUgbGV2ZWwgb2YgdGhlIG1mbgo+
ID4gYWxzbyBwYXNzZWQgYXMgYSBwYXJhbWV0ZXIsIGFuZCBoZW5jZSBpdCdzIGNvcnJlY3QuIEl0
J3MgdGhlIGZ1bmN0aW9uCj4gPiBpdHNlbGYgdGhhdCBhY3R1YWxseSBpdGVyYXRlcyBvdmVyIHRo
ZSBwYWdlIHRhYmxlIGVudHJpZXMsIGFuZCBoZW5jZQo+ID4gZGVzY2VuZHMgb25lIGxldmVsIGlu
dG8gdGhlIHBhZ2UgdGFibGVzLgo+ID4gCj4gPiBpZTogSSBjb3VsZCBhZGQgc29tZXRoaW5nIGxp
a2UgQVNTRVJUKGxldmVsKSB0byBtYWtlIHN1cmUgbm8gbGV2ZWwgMAo+ID4gZW50cmllcyBhcmUg
cGFzc2VkIHRvIHRoZSBmdW5jdGlvbiwgYnV0IHJlbmFtaW5nIGRvZXNuJ3Qgc2VlbSBjb3JyZWN0
Cj4gPiB0byBtZS4KPiA+IAo+IAo+IFRoZSBwcm9ibGVtIHRvIG1lIGlzIHRoYXQgaXQgaXMgdmVy
eSBvYnNjdXJlIGFib3V0IHdoYXQgYSAnbGV2ZWwnIGFjdHVhbGx5Cj4gbWVhbnMuIEFsdGhvdWdo
IEkgZmlndXJlZCBpdCBvdXQgbGFzdCB0aW1lIHdoZW4gcmV2aWV3aW5nIHRoaXMgcGF0Y2gsCj4g
bm93IEknbSBnZXR0aW5nIGNvbmZ1c2VkIGFnYWluIHdoZW4gbG9va2luZyBhdCByZWxhdGVkIGNv
ZGUuIGUuZy4sIHlvdQo+IG1pbnVzIGxldmVsIGJ5IG9uZSBpbiB0aGlzIHBhdGNoIHdoZW4gaW52
b2tpbmcgYXRvbWljX3dyaXRlX2VwdF9lbnRyeSwKClRoYXQgbWludXMgb25lIGlzIGJlY2F1c2Ug
dGhlIGxldmVsIG9mIEVQVCBlbnRyeSBpbiB0aGUKYXRvbWljX3dyaXRlX2VwdF9lbnRyeSBjYWxs
IGlzIG9uZSBsZXZlbCBsZXNzIHRoYW4gdGhlIHBhcmVudCwgd2hpY2gKaXMgdGhlIHBhcmFtZXRl
ciBvZiB0aGUgZnVuY3Rpb24uCgo+IHdoaWxlIHRoZSBsYXR0ZXIgaW5jcmVtZW50cyB0aGUgbGV2
ZWwgYnkgb25lIHdoZW4gaW52b2tpbmcgcDJtX2VudHJ5Xwo+IG1vZGlmeS4gVGhleSBhcmUgYWxs
IGFib3V0IGVudHJ5IHVwZGF0ZSBhY2NvcmRpbmcgdG8gdGhlIGZ1bmN0aW9uIG5hbWUsCj4gYnV0
IGNsZWFybHkgdGhlIGxldmVsIG1lYW5zIGRpZmZlcmVudCB0aGluZy4gOi8KClRoYXQncyB1bmZv
cnR1bmF0ZSwgYnV0IE5QVC9zaGFkb3cgY29uc2lkZXJzIHRoYXQgbGV2ZWwgc3RhcnRzIGF0IDEK
KGllOiA0SyBwYWdlLXRhYmxlIGVudHJpZXMgYXJlIGxldmVsIDEpLCB3aGlsZSBFUFQgY29uc2lk
ZXIgdGhhdCBsZXZlbApzdGFydHMgYXQgMCAoaWU6IDRLIHBhZ2UtdGFibGUgZW50cmllcyBhcmUg
bGV2ZWwgMCkuIFRoYXQncyBJTU8gYSB2ZXJ5CmJhZCBjaG9pY2UsIEkgZ3Vlc3Mgbm8gb25lIHJl
YWxpemVkIGJlZm9yZSBvZiB0aGlzIGRpZmZlcmVuY2UKYmVjYXVzZSBsZXZlbCB3YXMgYWx3YXlz
IGludGVybmFsIHRvIE5QVCBvciBFUFQgY29kZSwgYnV0IG5vIGdlbmVyaWMKZnVuY3Rpb25zIHVz
aW5nIHN1Y2ggbGV2ZWwgcGFyYW1ldGVyIHdoZXJlIGJlaW5nIGNhbGxlZCBmcm9tIGJvdGgKaW1w
bGVtZW50YXRpb25zLgoKPiBzcGVjaWZpY2FsbHkgZm9yIHRoaXMgcGF0Y2gsIG1heWJlIGNhbGwg
ZXB0X2ludmFsaWRhdGVfZW10X3N1YnRyZWUgY2FuCj4gYWxzbyBpbXByb3ZlIHJlYWRhYmlsaXR5
IGEgYml0LCBhbG9uZyB3aXRoIEFTU0VSVChsZXZlbCkgdGhpbmc/CgpJIGFncmVlLCBsZXQgbWUg
dHJ5IHRvIHByZXBhcmUgYSBwYXRjaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
