Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF910AE9C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:21:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvLH-0001ys-DC; Wed, 27 Nov 2019 11:18:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZvLF-0001yh-So
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:18:41 +0000
X-Inumbo-ID: a40db1fc-1107-11ea-a3af-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a40db1fc-1107-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574853511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ro7hRBO4D2os/WaXHLspgz3x7G+jhz6NZFyupwxCOMQ=;
 b=AE/BhRLXX1xfPhsDlvvKX5y+tTbq7vCbN6rsKkwhBmyWdT/3ZbUtFTs8
 34U8qbFoiMHmigviAni1+AKtAQ51Dq4tyUOVZ2z2uedOu7RcTnK8d9Ywh
 D+d50E2nfdx2ThqGHb0am2FgzK+IR+to/IJWxRE7ZSoJL3vzEmPaBWm9w Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5qFFFFL9wkifnHDYFnPhLDxoOcVV/IuT4Cnn731qZqJbUuOrprwkONp41nTXHczo0ejqrLDI24
 /5MeixswK5FvCci4H/cFAeWXI2vIkFL4tXM4/uRFCIBejMndpn0uvuHXxa0hpxzZRAjWb26smn
 ErxKqscn60zxu9GoWnH5hTkxvKTLI2uMCqTRXhLg0k8bHZMzPliZnVQlXzQMBpxxPfbXVEcAZD
 XyYnPEeb7T/limoKJ+Rzi47btRiXO/Uf4Iuzhpt8WZnS7iTu0+C2dSFmne8zhqomb6WYE7Ny06
 6PU=
X-SBRS: 2.7
X-MesageID: 8904079
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="8904079"
Date: Wed, 27 Nov 2019 12:18:23 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20191127111823.GO980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-2-roger.pau@citrix.com>
 <cccc439b-9595-1d5e-6969-8094e3a7c562@suse.com>
 <20191126164757.GH980@Air-de-Roger>
 <d44f276b-efce-d3e6-9b92-30c0874c726a@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D6120EF@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D6120EF@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to
 prevent syncing PIR to IRR...
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
Cc: Juergen
 Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDM6MDk6NTFBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBTZW50OiBX
ZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAyMDE5IDEyOjU5IEFNCj4gPiAKPiA+IE9uIDI2LjExLjIw
MTkgMTc6NDcsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE5vdiAyNiwg
MjAxOSBhdCAwNTozMjowNFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+IE9uIDI2
LjExLjIwMTkgMTQ6MjYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4+PiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYwo+ID4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3ZteC5jCj4gPiA+Pj4gQEAgLTIwNTQsNiArMjA1NCwxOSBAQCBzdGF0aWMgdm9pZCB2bXhfc3lu
Y19waXJfdG9faXJyKHN0cnVjdCB2Y3B1Cj4gPiAqdikKPiA+ID4+PiAgICAgIHVuc2lnbmVkIGlu
dCBncm91cCwgaTsKPiA+ID4+PiAgICAgIERFQ0xBUkVfQklUTUFQKHBlbmRpbmdfaW50ciwgTlJf
VkVDVE9SUyk7Cj4gPiA+Pj4KPiA+ID4+PiArICAgIGlmICggdiAhPSBjdXJyZW50ICYmICFhdG9t
aWNfcmVhZCgmdi0+cGF1c2VfY291bnQpICkKPiA+ID4+PiArICAgIHsKPiA+ID4+PiArICAgICAg
ICAvKgo+ID4gPj4+ICsgICAgICAgICAqIFN5bmNpbmcgUElSIHRvIElSUiBtdXN0IG5vdCBiZSBk
b25lIGJlaGluZCB0aGUgYmFjayBvZiB0aGUgQ1BVLAo+ID4gPj4+ICsgICAgICAgICAqIHNpbmNl
IHRoZSBJUlIgaXMgY29udHJvbGxlZCBieSB0aGUgaGFyZHdhcmUgd2hlbiB0aGUgdkNQVSBpcwo+
ID4gPj4+ICsgICAgICAgICAqIGV4ZWN1dGluZy4gT25seSBhbGxvdyBYZW4gdG8gZG8gc3VjaCBz
eW5jIGlmIHRoZSB2Q1BVIGlzIHRoZQo+ID4gY3VycmVudAo+ID4gPj4+ICsgICAgICAgICAqIG9u
ZSBvciBpZiBpdCdzIHBhdXNlZDogdGhhdCdzIHJlcXVpcmVkIGluIG9yZGVyIHRvIHN5bmMgdGhl
IGxhcGljCj4gPiA+Pj4gKyAgICAgICAgICogc3RhdGUgYmVmb3JlIHNhdmluZyBpdC4KPiA+ID4+
PiArICAgICAgICAgKi8KPiA+ID4+Cj4gPiA+PiBJcyB0aGlzIHN0YXRlZCB0aGlzIHdheSBieSB0
aGUgU0RNIGFueXdoZXJlPwo+ID4gPgo+ID4gPiBObywgSSB0aGluayB0aGUgU0RNIGlzIG5vdCB2
ZXJ5IGNsZWFyIG9uIHRoaXMsIHRoZXJlJ3MgYSBwYXJhZ3JhcGgKPiA+ID4gYWJvdXQgUElSOgo+
ID4gPgo+ID4gPiAiVGhlIGxvZ2ljYWwgcHJvY2Vzc29yIHBlcmZvcm1zIGEgbG9naWNhbC1PUiBv
ZiBQSVIgaW50byBWSVJSIGFuZAo+ID4gPiBjbGVhcnMgUElSLiBObyBvdGhlciBhZ2VudCBjYW4g
cmVhZCBvciB3cml0ZSBhIFBJUiBiaXQgKG9yIGdyb3VwIG9mCj4gPiA+IGJpdHMpIGJldHdlZW4g
dGhlIHRpbWUgaXQgaXMgcmVhZCAodG8gZGV0ZXJtaW5lIHdoYXQgdG8gT1IgaW50byBWSVJSKQo+
ID4gPiBhbmQgd2hlbiBpdCBpcyBjbGVhcmVkLiIKPiA+IAo+ID4gV2VsbCwgdGhpcyBpcyBhYm91
dCBQSVIsIGJ1dCBteSBxdWVzdGlvbiB3YXMgcmF0aGVyIHRvd2FyZHMgdGhlCj4gPiBlZmZlY3Rz
IG9uIHZJUlIuCj4gPiAKPiA+ID4+IEkgYXNrIGJlY2F1c2UgdGhlCj4gPiA+PiBjb21tZW50IHRo
ZW4gcmVhbGx5IGRvZXNuJ3QgYXBwbHkgdG8ganVzdCB0aGlzIGZ1bmN0aW9uLCBidXQgdG8KPiA+
ID4+IHZsYXBpY197LHRlc3RfYW5kX317c2V0LGNsZWFyfV92ZWN0b3IoKSBtb3JlIGdlbmVyYWxs
eS4gSXQncwo+ID4gPj4gbm90IGNsZWFyIHRvIG1lIGF0IGFsbCB3aGV0aGVyIHRoZSBDUFUgY2Fj
aGVzIChpbiBhbiBpbmNvaGVyZW50Cj4gPiA+PiBmYXNoaW9uKSBJUlIgKGFuZCBtYXliZSBvdGhl
ciBBUElDIHBhZ2UgZWxlbWVudHMpLCByYXRoZXIgdGhhbgo+ID4gPj4gaG9ub3JpbmcgdGhlIGF0
b21pYyB1cGRhdGVzIHRoZXNlIG1hY3JvcyBkby4KPiA+ID4KPiA+ID4gSU1PIHN5bmNpbmcgUElS
IHRvIElSUiB3aGVuIHRoZSB2Q1BVIGlzIHJ1bm5pbmcgb24gYSBkaWZmZXJlbnQgcENQVSBpcwo+
ID4gPiBsaWtlbHkgdG8gYXQgbGVhc3QgZGVmZWF0IHRoZSBwdXJwb3NlIG9mIHBvc3RlZCBpbnRl
cnJ1cHRzOgo+ID4gCj4gPiBJIGFncmVlIGhlcmUuCj4gPiAKPiA+ID4gd2hlbiB0aGUKPiA+ID4g
Q1BVIHJlY2VpdmVzIHRoZSBwb3N0ZWQgaW50ZXJydXB0IHZlY3RvciBpdCB3b24ndCBzZWUgdGhl
Cj4gPiA+IG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBiaXQgaW4gdGhlIHBvc3RlZC1pbnRlcnJ1
cHQgZGVzY3JpcHRvcgo+ID4gPiBiZWNhdXNlIHRoZSBzeW5jIGRvbmUgZnJvbSBhIGRpZmZlcmVu
dCBwQ1BVIHdvdWxkIGhhdmUgY2xlYXJlZCBpdCwgYXQKPiA+ID4gd2hpY2ggcG9pbnQgaXQncyBu
b3QgY2xlYXIgdG8gbWUgdGhhdCB0aGUgcHJvY2Vzc29yIHdpbGwgY2hlY2sgdklSUgo+ID4gPiBm
b3IgcGVuZGluZyBpbnRlcnJ1cHRzLiBUaGUgZGVzY3JpcHRpb24gaW4gc2VjdGlvbiAyOS42Cj4g
PiA+IFBPU1RFRC1JTlRFUlJVUFQgUFJPQ0VTU0lORyBkb2Vzbid0IGV4cGxpY2l0bHkgbWVudGlv
biB3aGV0aGVyIHRoZQo+ID4gPiB2YWx1ZSBvZiB0aGUgb3V0c3RhbmRpbmctbm90aWZpY2F0aW9u
IGJpdCBhZmZlY3RzIHRoZSBsb2dpYyBvZiBwb3N0ZWQKPiA+ID4gaW50ZXJydXB0IHByb2Nlc3Np
bmcuCj4gCj4gSSB0aGluayB0aGUgb3V0c3RhbmRpbmctbm90aWZpY2F0aW9uIGlzIG9uZS1vZmYg
Y2hlY2tlZCBmb3IgdHJpZ2dlcmluZyAKPiBpbnRlcnJ1cHQgcG9zdGluZyBwcm9jZXNzLiBPbmNl
IHRoZSBwcm9jZXNzIHN0YXJ0cywgdGhlcmUgaXMgbm8gbmVlZCB0byAKPiBsb29rIGF0IGl0IGFn
YWluLiBUaGUgc3RlcCAzIG9mIHBvc3RpbmcgcHJvY2VzcyBpbiAyOS42IGNsZWFybHkgc2F5czoK
PiAKPiAiVGhlIHByb2Nlc3NvciBjbGVhcnMgdGhlIG91dHN0YW5kaW5nLW5vdGlmaWNhdGlvbiBi
aXQgaW4gdGhlIHBvc3RlZC0KPiBpbnRlcnJ1cHQgZGVzY3JpcHRvci4gVGhpcyBpcyBkb25lIGF0
b21pY2FsbHkgc28gYXMgdG8gbGVhdmUgdGhlIHJlbWFpbmRlciAKPiBvZiB0aGUgZGVzY3JpcHRv
ciB1bm1vZGlmaWVkIChlLmcuLCB3aXRoIGEgbG9ja2VkIEFORCBvcGVyYXRpb24pLiIKClllcywg
bXkgcXVlc3Rpb24gd291bGQgYmUgd2hhdCBoYXBwZW5zIGlmIHRoZSBvdXRzdGFuZGluZy1ub3Rp
ZmljYXRpb24KYml0IGlzIDAsIGRvZXMgdGhlIHByb2Nlc3NvciBqdW1wIHRvIHN0ZXAgNiB0aGVu
PwoKRG9lcyBpdCBqdXN0IGlnbm9yZSB0aGUgdmFsdWUgb2YgdGhlIG91dHN0YW5kaW5nLW5vdGlm
aWNhdGlvbiBiaXQgYW5kCmNvbnRpbnVlIHRvIHN0ZXAgND8KCj4gQnV0IHJlZ2FyZGxlc3Mgb2Yg
dGhlIGhhcmR3YXJlIGJlaGF2aW9yLCBJIHRoaW5rIGl0J3Mgc2FmZSB0byByZXN0cmljdAo+IHN5
bmNfcGlyX3RvX2lyciBhcyB0aGlzIHBhdGNoIGRvZXMuCj4gCj4gPiAKPiA+IEJ1dCBvdmVyYWxs
IHRoaXMgYWdhaW4gaXMgYWxsIHBvc3RlZCBpbnRlcnJ1cHQgY2VudHJpYyB3aGVuIG15Cj4gPiBx
dWVzdGlvbiB3YXMgYWJvdXQgdklSUiwgaW4gcGFydGljdWxhciB3aGV0aGVyIHRoZSBhc3NlcnRp
bmcgeW91Cj4gPiBhZGQgbWF5IG5lZWQgdG8gYmUgZXZlbiBtb3JlIHJpZ2lkLgo+ID4gCj4gPiBB
bnl3YXksIGxldCdzIHNlZSB3aGF0IHRoZSBWTVggbWFpbnRhaW5lcnMgaGF2ZSB0byBzYXkuCj4g
PiAKPiAKPiBUaGVyZSBpcyBvbmUgcGFyYWdyYXBoIGluIDI5LjY6Cj4gCj4gIlVzZSBvZiB0aGUg
cG9zdGVkLWludGVycnVwdCBkZXNjcmlwdG9yIGRpZmZlcnMgZnJvbSB0aGF0IG9mIG90aGVyIGRh
dGEgCj4gc3RydWN0dXJlcyB0aGF0IGFyZSByZWZlcmVuY2VkIGJ5IHBvaW50ZXJzIGluIGEgVk1D
Uy4gVGhlcmUgaXMgYSBnZW5lcmFsIAo+IHJlcXVpcmVtZW50IHRoYXQgc29mdHdhcmUgZW5zdXJl
IHRoYXQgZWFjaCBzdWNoIGRhdGEgc3RydWN0dXJlIGlzIAo+IG1vZGlmaWVkIG9ubHkgd2hlbiBu
byBsb2dpY2FsIHByb2Nlc3NvciB3aXRoIGEgY3VycmVudCBWTUNTIHRoYXQgCj4gcmVmZXJlbmNl
cyBpdCBpcyBpbiBWTVggbm9uLXJvb3Qgb3BlcmF0aW9uLiBUaGF0IHJlcXVpcmVtZW50IGRvZXMK
PiBub3QgYXBwbHkgdG8gdGhlIHBvc3RlZC1pbnRlcnJ1cHQgZGVzY3JpcHRvci4gVGhlcmUgaXMg
YSByZXF1aXJlbWVudCwgCj4gaG93ZXZlciwgdGhhdCBzdWNoIG1vZGlmaWNhdGlvbnMgYmUgZG9u
ZSB1c2luZyBsb2NrZWQgcmVhZC1tb2RpZnktd3JpdGUgCj4gaW5zdHJ1Y3Rpb25zLiIKPiAKPiB2
aXJ0dWFsLUFQSUMgcGFnZSBpcyBwb2ludGVyLXJlZmVyZW5jZWQgYnkgVk1DUywgdGh1cyBpdCBm
YWxscyBpbnRvIGFib3ZlCj4gZ2VuZXJhbCByZXF1aXJlbWVudC4gQnV0IEkgc3VwcG9zZSB0aGVy
ZSBzaG91bGQgYmUgc29tZSBleGNlcHRpb24gd2l0aAo+IHRoaXMgcGFnZSB0b28sIG90aGVyd2lz
ZSB0aGUgcG9pbnQgb2YgcG9zdGVkIGludGVycnVwdCBpcyBraWxsZWQgKGlmIHdlIGhhdmUKPiB0
byBraWNrIHRoZSBkZXN0IHZjcHUgaW50byByb290IHRvIHVwZGF0ZSB0aGUgdklSUikuIExldCBt
ZSBjb25maXJtCj4gaW50ZXJuYWxseS4KCkFjaywgdGhhbmtzLiBJIHRoaW5rIHdlIGNhbiBjYW4g
aG9sZCBvZmYgdGhpcyBpbXByb3ZlbWVudC9yZXN0cmljdGlvbgp1bnRpbCB3ZSBnZXQgY29uZmly
bWF0aW9uIG9mIHRoZSBpbnRlbmRlZCBzb2Z0d2FyZSBiZWhhdmlvciBoZXJlLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
