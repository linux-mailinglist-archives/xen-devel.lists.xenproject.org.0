Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D77F4356
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 10:32:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT0Yu-0006rZ-HO; Fri, 08 Nov 2019 09:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mw+O=ZA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iT0Ys-0006rU-Ll
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 09:28:10 +0000
X-Inumbo-ID: 13a7ab7e-020a-11ea-a1d3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13a7ab7e-020a-11ea-a1d3-12813bfff9fa;
 Fri, 08 Nov 2019 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573205289;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RpixVhI1R4abVDQedBszh/2fTinqcgtKpJctSToVPeA=;
 b=A200r1416xFRzbag6a0lw2fi4sbybSdS8lPBvnJi1cjyI767F1KghO6Q
 bleuZ24m+Dy0v6WkeIVVKFPoXxsaaPe/shRRKTVR3tk3DFlJgmdzWnlag
 WYsdlqcEHXQpQyF+ONThENVxju9TqKbhgG6r8fxuPZsm1TXA15Ou86/Ys M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I2YbrX+WejFhx1rPnUADmVSqZAv1GGR55LdUKRwvcR8+54Ye4Kok3+FbtKOGtlpZxKitdTUKVh
 L1Pmn2WGVvxJRIXuKxzxBh+2HkfmNk+q+FB75YROo2qxTRwASecbb+0b0/bzGNFBr73HIP/8nj
 VihZUS9HX0fkSgoV8/WcAlf5I/yvyq2wha42Ocxt66RX6fH69TUJlmhnUr0u9WVbruNEfUpNHs
 ZJNMff5Dnvnb7DgO56U6zL7epdaxbq1uOmGQ+PlfG2lLrmIWi8czwmRaXe1fMH85IQBZg+KrzF
 o68=
X-SBRS: 2.7
X-MesageID: 8401552
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,280,1569297600"; 
   d="scan'208";a="8401552"
Date: Fri, 8 Nov 2019 10:27:59 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191108092759.GC17494@Air-de-Roger>
References: <20191107150609.93004-1-roger.pau@citrix.com>
 <20191107150609.93004-3-roger.pau@citrix.com>
 <df702a74-0941-3491-fb18-165f7fb592b0@suse.com>
 <20191107154632.GA17494@Air-de-Roger>
 <edbb85f3-cddf-0791-06b9-7c868f50db3b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edbb85f3-cddf-0791-06b9-7c868f50db3b@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] x86/ioapic: don't use raw
 entry reads/writes in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDQ6NTY6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMTEuMjAxOSAxNjo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNDoyODo1NlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwNy4xMS4yMDE5IDE2OjA2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IEBAIC01MzAsOSArNTMwLDkgQEAgc3RhdGljIHZvaWQgY2xlYXJfSU9fQVBJQ19waW4odW5zaWdu
ZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4pCj4gPj4+ICAgICAgICovCj4gPj4+ICAgICAg
bWVtc2V0KCZlbnRyeSwgMCwgc2l6ZW9mKGVudHJ5KSk7Cj4gPj4+ICAgICAgZW50cnkubWFzayA9
IDE7Cj4gPj4+IC0gICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCB0cnVlLCBlbnRy
eSk7Cj4gPj4+ICsgICAgX19pb2FwaWNfd3JpdGVfZW50cnkoYXBpYywgcGluLCBmYWxzZSwgZW50
cnkpOwo+ID4+Cj4gPj4gSSBtYXkgYmUgYWJsZSB0byB1bmRlcnN0YW5kIHdoeSB0aGlzIG9uZSBj
YW4ndCB1c2UgcmF3IG1vZGUsIGJ1dCBhcwo+ID4+IHBlciBhYm92ZSBhIGJldHRlciBvdmVyYWxs
IGRlc2NyaXB0aW9uIGlzIG5lZWRlZC4KPiA+IAo+ID4gWWVzLCB0aGlzIGlzIHRoZSBvbmUgdGhh
dCdzIGFjdHVhbGx5IGluY29ycmVjdCwgYnV0IHNlZSBteSByZWFzb25pbmcKPiA+IGJlbG93Lgo+
ID4gCj4gPj4KPiA+Pj4gLSAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGlu
LCB0cnVlKTsKPiA+Pj4gKyAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBpYywgcGlu
LCBmYWxzZSk7Cj4gPj4+ICAgICAgaWYgKGVudHJ5LmlycikKPiA+Pj4gICAgICAgICAgcHJpbnRr
KEtFUk5fRVJSICJJTy1BUElDJTAyeC0ldTogVW5hYmxlIHRvIHJlc2V0IElSUlxuIiwKPiA+Pj4g
ICAgICAgICAgICAgICAgIElPX0FQSUNfSUQoYXBpYyksIHBpbik7Cj4gPj4KPiA+PiBUaGlzIHJl
YWQgYWdhaW4gc2hvdWxkbid0IG5lZWQgY29udmVyc2lvbiwgYXMgdGhlIElSUiBiaXQgZG9lc24n
dAo+ID4+IGdldCB0b3VjaGVkIChJIHRoaW5rKSBieSB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyBj
b2RlIGR1cmluZyB0aGUKPiA+PiB0cmFuc2xhdGlvbiBpdCBkb2VzLgo+ID4gCj4gPiBUQkgsIEkg
dGhpbmsgcmF3IG1vZGUgc2hvdWxkIG9ubHkgYmUgdXNlZCBieSB0aGUgaW9tbXUgY29kZSBpbiBv
cmRlcgo+ID4gdG8gc2V0dXAgdGhlIGVudHJpZXMgdG8gcG9pbnQgdG8gdGhlIGludGVycnVwdCBy
ZW1hcHBpbmcgdGFibGUsCj4gPiBldmVyeXRoaW5nIGVsc2Ugc2hvdWxkbid0IGJlIHVzaW5nIHJh
dyBtb2RlLiBXaGlsZSBpdCdzIHRydWUgdGhhdCBzb21lCj4gPiBvZiB0aGUgY2FzZXMgaGVyZSBh
cmUgc2FmZSB0byB1c2UgcmF3IG1vZGUgSSB3b3VsZCBkaXNjb3VyYWdlIGl0J3MKPiA+IHVzYWdl
IGFzIGl0IGNhbiBsZWFkIHRvIGlzc3VlcywgYW5kIHRoaXMgaXMgbm90IGEgcGVyZm9ybWFuY2Ug
Y3JpdGljYWwKPiA+IHBhdGggYW55d2F5Lgo+IAo+IFlvdSBhbHNvIHNob3VsZCB0YWtlIHRoZSBv
dGhlciBwb3NzaWJsZSBwZXJzcGVjdGl2ZSAtIG5vdCB1c2luZwo+IHJhdyBtb2RlIG1lYW5zIGdv
aW5nIHRocm91Z2ggaW50ZXJydXB0IHJlbWFwcGluZyBsb2dpYywgd2hpY2gKPiBjYW4gKG5lZWRs
ZXNzbHkpIHRyaWdnZXIgZXJyb3JzLiBJIHRoaW5rIHlvdSB3YW50IHRvIGJyZWFrIHRoZQo+IHBh
dGNoIGludG8gYSBuZWNlc3NhcnkgYW5kIGFuIG9wdGlvbmFsIHBhcnQuIFRoZSBvcHRpb25hbCBw
YXJ0Cj4gc2hvdWxkIGJlIGRpc2N1c3NlZCBzZXBhcmF0ZWx5IGFuZCBkZWZlcnJlZCB1bnRpbCBh
ZnRlciA0LjEzLgoKSU1PIGdlbmVyaWMgSU8tQVBJQyBjb2RlIGhhcyBub3QgYnVzaW5lc3MgcGxh
eWluZyB3aXRoIHJhdyBlbnRyaWVzCndoZW4gaW50ZXJydXB0IHJlbWFwcGluZyBpcyBlbmFibGVk
LCB0aGUgbGF5b3V0IG9mIElPLUFQSUMgZW50cmllcyBpbgp0aGF0IGNhc2UgaXMgdmVuZG9yLXNw
ZWNpZmljLCBhbmQgaGVuY2UgdGhlIGdlbmVyaWMgSU8tQVBJQyBjb2RlIGlzCm5vdCBhYmxlIHRv
IHBhcnNlIGl0LgoKRm9yIGV4YW1wbGUgdGhlIGNvZGUgaW4gY2xlYXJfSU9fQVBJQ19waW4gbW9k
aWZpZXMgdGhlIG1hc2sgb3IgdGhlCnRyaWdnZXIgZmllbGRzIG9mIFJBVyBlbnRyaWVzLCBpcyB0
aGVyZSBhbnkgZ3VhcmFudGVlIHRoYXQgdGhvc2UKZmllbGRzIGRvbid0IGhhdmUgZGlmZmVyZW50
IG1lYW5pbmdzL2xheW91dCB3aGVuIGludGVycnVwdCByZW1hcHBpbmcKaXMgZW5hYmxlZD8KCkkg
Y2FuIHNwbGl0IHRoZSBzcGVjaWZpYyBidWdmaXggaW50byBhIHNlcGFyYXRlIHBhdGNoLCBidXQg
SU1PIHRoZQpjb2RlIGluIGNsZWFyX0lPX0FQSUNfcGluIGlzIG5vdCBzYWZlLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
