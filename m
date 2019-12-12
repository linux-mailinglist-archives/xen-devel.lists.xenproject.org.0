Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED5411CE1B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 14:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifOKG-0003SG-Lp; Thu, 12 Dec 2019 13:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVwC=2C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifOKE-0003SB-N7
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 13:16:14 +0000
X-Inumbo-ID: 8d574b5e-1ce1-11ea-b6f1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d574b5e-1ce1-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 13:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576156566;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vQrkhpc3QLzmUez+kybZem+IC7nk2uxZfD9B+4xASp4=;
 b=WDI3ME9UQx/myA03BWIr1rN7ewYNmTvbQmMeqzWEuI9PkCsIHEXmPuQr
 XxQO2yvZtSsMMW05zEGUQCemwdfvcKLaPzrdWrKt1yYkgVRgx+FplLu7k
 rkgveBZH14HLgjwfJt/NbL2pm0+8VnY+O8tuI932X4uStwEXqA3uTOqnm M=;
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
IronPort-SDR: Xxdgu5l49+n7uCFkUQfteimHThSZnOS848DDTKeV/2Insqrb/qyWq04cLSLnTHn9cCxj+txK3P
 QFk5bQa/tiqsBNto4xnipT0rSY9ZMhDWQPs10aGS/oVoLGjfY9nxic8UJVlRRMNV1brSeyJtK7
 aAIQ9bzW0dlFTCu5jDUAreND1khe+VPRxux8IiANMMBtZuFwJ6BAQJzowg5nfxgrbpePwIIlpW
 1UrpDzG2ZFHQ6/Y31kNhNS0l4KYjB+0fYG7TTW4716aixgL/my3GPQakNTipLptxvG1WDFWDoR
 GT0=
X-SBRS: 2.7
X-MesageID: 9589795
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9589795"
Date: Thu, 12 Dec 2019 14:15:58 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191212131558.GD11756@Air-de-Roger>
References: <e43e17ea-6ad0-d125-216f-4798853e3116@suse.com>
 <20191211155436.GQ980@Air-de-Roger>
 <4316933a-b824-6544-8287-9f492b6543f4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4316933a-b824-6544-8287-9f492b6543f4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] IOMMU: make DMA containment of quarantined
 devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMTA6Mjg6MjZBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTEuMTIuMjAxOSAxNjo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRGVjIDExLCAyMDE5IGF0IDAxOjUzOjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMK
PiA+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4g
Pj4gQEAgLTg1LDE4ICs4NSwzNiBAQCBpbnQgZ2V0X2RtYV9yZXF1ZXN0b3JfaWQodWludDE2X3Qg
c2VnLCB1Cj4gPj4gICAgICByZXR1cm4gcmVxX2lkOwo+ID4+ICB9Cj4gPj4gIAo+ID4+IC1zdGF0
aWMgdm9pZCBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgKPiA+PiArc3RhdGljIGludCBf
X211c3RfY2hlY2sgYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluX2lvbW11
ICpoZCkKPiA+PiArewo+ID4+ICsgICAgaW50IHJjOwo+ID4+ICsKPiA+PiArICAgIHNwaW5fbG9j
aygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsKPiA+PiArICAgIHJjID0gYW1kX2lvbW11X2FsbG9j
X3Jvb3QoaGQpOwo+ID4+ICsgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7
Cj4gPj4gKwo+ID4+ICsgICAgcmV0dXJuIHJjOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICtzdGF0aWMg
aW50IF9fbXVzdF9jaGVjayBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgKPiA+PiAgICAg
IHN0cnVjdCBkb21haW4gKmRvbWFpbiwgc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4gPj4gICAg
ICB1aW50OF90IGRldmZuLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+PiAgewo+ID4+ICAgICAg
c3RydWN0IGFtZF9pb21tdV9kdGUgKnRhYmxlLCAqZHRlOwo+ID4+ICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKPiA+PiAtICAgIGludCByZXFfaWQsIHZhbGlkID0gMTsKPiA+PiArICAgIGludCBy
ZXFfaWQsIHZhbGlkID0gMSwgcmM7Cj4gPj4gICAgICB1OCBidXMgPSBwZGV2LT5idXM7Cj4gPj4g
LSAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkb21haW4pOwo+
ID4+ICsgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZG9tYWluKTsKPiA+
PiArCj4gPj4gKyAgICAvKiBkb21faW8gaXMgdXNlZCBhcyBhIHNlbnRpbmVsIGZvciBxdWFyYW50
aW5lZCBkZXZpY2VzICovCj4gPj4gKyAgICBpZiAoIGRvbWFpbiA9PSBkb21faW8gJiYgIWhkLT5h
cmNoLnJvb3RfdGFibGUgKQo+ID4gCj4gPiBUaGlzIGNvbmRpdGlvbiAoYW5kIGl0J3MgSW50ZWwg
Y291bnRlcnBhcnQpIHdvdWxkIGJlIGJldHRlciBpbiBhIG1hY3JvCj4gPiBJTU8sIHNvIHRoYXQg
dmVuZG9yIGNvZGUgcmVnYXJkbGVzcyBvZiB0aGUgaW1wbGVtZW50YXRpb24gY2FuIHVzZSB0aGUK
PiA+IHNhbWUgbWFjcm8gKGFuZCB0byBhdm9pZCBoYXZpbmcgdG8gYWRkIHRoZSBzYW1lIGNvbW1l
bnQgaW4gYWxsCj4gPiBpbnN0YW5jZXMpLCBpZTogSVNfREVWSUNFX1FVQVJBTlRJTkVEIG9yIHNv
bWUgc3VjaCB3b3VsZCBiZSBmaW5lIElNTy4KPiAKPiBUaGUgImRldmljZSIgaW4gdGhlIG5hbWUg
c3VnZ2VzdGVkIGlzIGluYXBwbGljYWJsZSwgYXMgdGhlcmUncyBubwo+IGRldmljZSBpbnZvbHZl
ZCBoZXJlLiBUaGUgY29uZGl0aW9uYWwgYWxzbyBpc24ndCBhYm91dAo+ICJxdWFyYW50aW5lZCIs
IGJ1dCBhYm91dCB0aGUgZXh0ZW5kZWQgZm9yIHRoZXJlb2YuCgpNYXliZSBJU19RVUFSQU5USU5F
X0ZVTEwgb3IgSVNfRlVMTFlfUVVBUkFOVElORUQgb3Igc29tZXRoaW5nIHNpbWlsYXIKaW4gb3Jk
ZXIgdG8gbWF0Y2ggdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gdGhlbj8KClRoZSBjb21tZW50IGFi
b3ZlIGV4cGxpY2l0bHkgbWVudGlvbnMgdGhhdCBkb21faW8gaXMgdXNlZCBhcyBhCnNlbnRpbmVs
IGZvciBxdWFyYW50aW5lZCBkZXZpY2VzLCBoZW5jZSB0aGUgREVWSUNFIGluIHRoZSBuYW1lIGRp
ZG4ndApzZWVtIHRoYXQgZmFyIG9mZi4KCj4gSSBmdXJ0aGVyIGRvbid0Cj4gdW5kZXJzdGFuZCAi
dmVuZG9yIGNvZGUiIGluIHlvdXIgcmVtYXJrOiBEaWZmZXJlbnQgbWFjcm9zIHdvdWxkIGJlCj4g
bmVlZGVkIGZvciBlaXRoZXIgdmVuZG9yIGFueXdheS4KClllcywgYnV0IGJvdGggbWFjcm9zIHdv
dWxkIGhhdmUgdGhlIHNhbWUgbmFtZSwgaGVuY2UgeW91IHdvdWxkbid0IG5lZWQKdG8gdGhpbmsg
d2hldGhlciB5b3UgYXJlIGluIEFNRCBvciBJbnRlbCBjb2RlIGFzIHRoZSBtYWNybyB3b3VsZAph
bHdheXMgaGF2ZSB0aGUgc2FtZSBuYW1lLgoKPiAoSSBkaWQgYWN0dWFsbHkgY29uc2lkZXIgaGF2
aW5nCj4gc29tZSBraW5kIG9mIHByZWRpY2F0ZSBoZWxwZXIsIGJ1dCBJIGNvdWxkbid0IGNvbWUg
dXAgd2l0aCBhCj4gc3VmZmljaWVudGx5IGdvb2QgbmFtZS4gSSBhbHNvIHRoaW5rIHN1Y2ggYW4g
YWJzdHJhY3Rpb24gc2hvdWxkCj4gdGhlbiBoYXZlIGJlZW4gaW50cm9kdWNlZCB3aGVuIHRoZXNl
IGNvbmRpdGlvbmFscyB3ZXJlIGZpcnN0IGFkZGVkCj4gaW4gdGhlaXIgdGhlbiBzdGlsbCB2ZW5k
b3IgaW5kZXBlbmRlbnQgZm9ybS4pCgpJIHdvdWxkIHByZWZlciBzb21lIGtpbmQgb2YgbWFjcm8s
IGFzIEkgdGhpbmsgdGhlcmUncyBxdWl0ZSBhIGxvdCBvZgpyZXBsaWNhdGlvbiBvZiB0aG9zZSB0
d28gY2hlY2tzLCBhbmQgSU1PIGl0J3MgZWFzeSB0byBieSBtaXN0YWtlIHVzZQp0aGUgd3Jvbmcg
b25lIHdoZW4gbW92aW5nIGJldHdlZW4gSW50ZWwgYW5kIEFNRCBjb2RlICh0aGUgbW9yZSB0aGF0
Cml0IHdvdWxkIGJ1aWxkIGZpbmUgYnV0IGxlYWQgdG8gcnVudGltZSBpc3N1ZXMpLgoKPiAKPiA+
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4+IEBAIC0zMCwxMyArMzAsMTcgQEAgYm9vbF90
IF9faW5pdGRhdGEgaW9tbXVfZW5hYmxlID0gMTsKPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkg
aW9tbXVfZW5hYmxlZDsKPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgZm9yY2VfaW9tbXU7Cj4g
Pj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3ZlcmJvc2U7Cj4gPj4gLWJvb2wgX19yZWFk
X21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsKPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0
bHkgaW9tbXVfaWdmeCA9IDE7Cj4gPj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3Nub29w
ID0gMTsKPiA+PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsKPiA+PiAg
Ym9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cmVtYXAgPSAxOwo+ID4+ICBib29sX3QgX19y
ZWFkX21vc3RseSBpb21tdV9jcmFzaF9kaXNhYmxlOwo+ID4+ICAKPiA+PiArI2RlZmluZSBJT01N
VV9xdWFyYW50aW5lX25vbmUgIGZhbHNlCj4gPj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9i
YXNpYyB0cnVlCj4gPj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9mdWxsICAyCj4gPj4gK3Vp
bnQ4X3QgX19yZWFkX21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gSU9NTVVfcXVhcmFudGluZV9i
YXNpYzsKPiA+IAo+ID4gSSBkb24ndCByZWFsbHkgbGlrZSB0byB1c2UgYm9vbGVhbnMgd2l0aCBu
b24tYm9vbGVhbiB2YXJpYWJsZXMuCj4gPiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8ganVzdCB1
c2UgcGxhaW4gbnVtYmVycywgb3IgZXZlbiBiZXR0ZXIgYW4KPiA+IGVudW0/Cj4gCj4gTm8gb3B0
aW9uIGlzIHJlYWxseSBnb29kIGhlcmUsIEkgdGhpbmsuIEkgZGlkIGNvbnNpZGVyIHVzaW5nIGFu
Cj4gZW51bSwgYnV0IEkgd2FudGVkIHRvIHJlc3RyaWN0IHRoZSB2YXJpYWJsZSB0byA4IGJpdHMu
CgpJTU8gSSB3b3VsZG4ndCBiZSB0aGF0IHdvcnJpZWQgYWJvdXQgdXNpbmcgOCB2cyAzMiBiaXRz
LgoKPiBJZiBJIHdhcwo+IHRvIHVzZSBhbiBlbnVtLCBvZiBjb3Vyc2UgSSdkIGFsc28gd2FudCB0
byBoYXZlIHRoZSB2YXJpYWJsZSB0aGlzCj4gKGNvcnJlY3QpIHR5cGUuIEFuZCBJJ2QgYWxzbyBs
aWtlIHRvIGF2b2lkIHRoZSBwYWNrZWQgYXR0cmlidXRlCj4gaGVyZS4gVGhlIGFib3ZlIHNlZW1l
ZCB0byBsZWFzdCBiYWQgb3B0aW9uOyBJIGNvdWxkIGJlIGNvbnZpbmNlZAo+IHRvIHVzZSAwLzEg
aW5zdGVhZCBvZiBmYWxzZS90cnVlLCB0aG91Z2guCgpZZXMgcGxlYXNlLCAwLzEgd291bGQgYmUg
ZmluZSBmb3IgbWUuCgo+IAo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4gPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiA+PiBAQCAtNTMsOCArNTMsOSBAQCBzdGF0
aWMgaW5saW5lIGJvb2xfdCBkZm5fZXEoZGZuX3QgeCwgZGZuCj4gPj4gIH0KPiA+PiAgCj4gPj4g
IGV4dGVybiBib29sX3QgaW9tbXVfZW5hYmxlLCBpb21tdV9lbmFibGVkOwo+ID4+IC1leHRlcm4g
Ym9vbCBmb3JjZV9pb21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVyYm9zZSwgaW9tbXVf
aWdmeDsKPiA+PiArZXh0ZXJuIGJvb2wgZm9yY2VfaW9tbXUsIGlvbW11X3ZlcmJvc2UsIGlvbW11
X2lnZng7Cj4gPj4gIGV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbCwgaW9t
bXVfaW50cmVtYXAsIGlvbW11X2ludHBvc3Q7Cj4gPj4gK2V4dGVybiB1aW50OF90IGlvbW11X3F1
YXJhbnRpbmU7Cj4gPiAKPiA+IEV4cG9ydGluZyB0aGlzIHZhcmlhYmxlIHdpdGhvdXQgdGhlIHBh
aXJlZCBkZWZpbmVzIHNlZW1zIHBvaW50bGVzcywKPiA+IGhvdyBhcmUgZXh0ZXJuYWwgY2FsbGVy
cyBzdXBwb3NlZCB0byBmaWd1cmUgb3V0IHRoZSBxdWFyYW50aW5lIG1vZGUKPiA+IHdpdGhvdXQg
dGhlIElPTU1VX3F1YXJhbnRpbmVfKiBkZWZpbmVzPwo+IAo+IFdoeSBwb2ludGxlc3M/IE91dHNp
ZGUgb2YgdGhlIGZpbGUga25vd2luZyB0aGUgSU9NTVVfcXVhcmFudGluZV8qCj4gZGVmaW5lcyB0
aGUgdmFyaWFibGUgY29udGludWVzIHRvIGhhdmUgYm9vbGVhbiBtZWFuaW5nLgoKRG8geW91IHRo
aW5rIHlvdSBjb3VsZCBhZGQgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0PwoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
