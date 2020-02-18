Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D51628CE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 15:46:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j445h-0002qO-7P; Tue, 18 Feb 2020 14:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j445f-0002qD-Il
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 14:43:11 +0000
X-Inumbo-ID: fba5a781-525c-11ea-8197-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fba5a781-525c-11ea-8197-12813bfff9fa;
 Tue, 18 Feb 2020 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582036991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=arXRHc3IvDUOTjWsgl5aVd0iThq5TBEQjlUt1FApNSw=;
 b=Xg9vmPCTmi6KT4rq1sBKf8jSMHJvdV2ey+sVTJnGscPf2lM1jJMibAu4
 jBBPB9cEbQ+Rido+RgLjKLfhP7Ph33QCCR0Q+5cPxwZAg4QliQL56P/Eb
 OlkOX430RJqHgpLo/atfk4pY8kApLDnkx8yzqFK8715tsW35XUSmC9hA3 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jbw9lTlNEJ36pxlvY8/BebDCqgnlcguPrHH37JoSbReCBlXZ/zLohIC7Udug2OJvgAV4ZbvRoW
 W/neBG7TAIq54TkhAl931/OHX6S9OaE+Q8JBp/LsXXQ/8DwqkMDLZdtx0kq+3uY2oPHBR2W+hL
 sywLVzrpbxBId86hPA/Kpx/LugysBgEuK7Zjje14BzHhdrbU5Q+c7RnoniuYFy/cMtWGGFF39a
 R+4krLyQwAYQdRraHLH+zapFLCQltVvlwaZi10SjonY3DcIZoGO/WS7IW/7TFEzRIvrSmZzLL2
 GOg=
X-SBRS: 2.7
X-MesageID: 12610724
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12610724"
Date: Tue, 18 Feb 2020 15:43:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200218144300.GW4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
 <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
 <20200218112238.GT4679@Air-de-Roger>
 <301e4658-3dc2-de74-ae9d-3f13bc2f1502@citrix.com>
 <20200218114602.GU4679@Air-de-Roger>
 <4509c89d-78ea-18e1-843d-905c617b7bd6@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4509c89d-78ea-18e1-843d-905c617b7bd6@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMDE6Mjk6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOC8wMi8yMDIwIDExOjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTE6MzU6MzdBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+Pgo+ID4+IE9uIDE4LzAyLzIwMjAgMTE6MjIsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPj4+IE9uIFR1ZSwgRmViIDE4LCAyMDIwIGF0IDExOjIxOjEyQU0gKzAwMDAsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4gPj4+PiBPbiAxOC8wMi8yMDIwIDExOjEwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4+Pj4+IE9uIFR1ZSwgRmViIDE4LCAyMDIwIGF0IDEwOjUzOjQ1QU0gKzAw
MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4+Pj4+IE9uIDE3LzAyLzIwMjAgMTg6NDMsIFJv
Z2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4+Pj4+IEBAIC02Nyw3ICs2OCwyMCBAQCBzdGF0aWMg
dm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3Is
Cj4gPj4+Pj4+PiAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgaW50
IHZlY3RvcikKPiA+Pj4+Pj4+ICB7Cj4gPj4+Pj4+PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBm
YWxzZTsKPiA+Pj4+Pj4+IC0gICAgY3B1bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUoc2NyYXRj
aF9jcHVtYXNrKTsKPiA+Pj4+Pj4+ICsgICAgY3B1bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUo
c2VuZF9pcGlfY3B1bWFzayk7Cj4gPj4+Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
Pj4+Pj4+PiArCj4gPj4+Pj4+PiArICAgIGlmICggaW5fbWMoKSB8fCBpbl9ubWkoKSApCj4gPj4+
Pj4+PiArICAgIHsKPiA+Pj4+Pj4+ICsgICAgICAgIC8qCj4gPj4+Pj4+PiArICAgICAgICAgKiBX
aGVuIGluICNNQyBvciAjTU5JIGNvbnRleHQgWGVuIGNhbm5vdCB1c2UgdGhlIHBlci1DUFUgc2Ny
YXRjaCBtYXNrCj4gPj4+Pj4+PiArICAgICAgICAgKiBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5IHRv
IGF2b2lkIHJlZW50cnksIHNvIGRvIG5vdCB1c2UgdGhlIEFQSUMKPiA+Pj4+Pj4+ICsgICAgICAg
ICAqIHNob3J0aGFuZC4KPiA+Pj4+Pj4+ICsgICAgICAgICAqLwo+ID4+Pj4+Pj4gKyAgICAgICAg
YWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5zZW5kX0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3IpOwo+
ID4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuOwo+ID4+Pj4+PiBUaGUgc2V0IG9mIHRoaW5ncyB5b3Ug
Y2FuIHNhZmVseSBkbyBpbiBhbiBOTUkvTUNFIGhhbmRsZXIgaXMgc21hbGwsIGFuZAo+ID4+Pj4+
PiBkb2VzIG5vdCBpbmNsdWRlIHNlbmRpbmcgSVBJcy7CoCAoSW4gcmVhbGl0eSwgaWYgeW91J3Jl
IHVzaW5nIHgyYXBpYywgaXQKPiA+Pj4+Pj4gaXMgc2FmZSB0byBzZW5kIGFuIElQSSBiZWNhdXNl
IHRoZXJlIGlzIG5vIHJpc2sgb2YgY2xvYmJlcmluZyBJQ1IyCj4gPj4+Pj4+IGJlaGluZCB5b3Vy
IG91dGVyIGNvbnRleHQncyBiYWNrKS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSG93ZXZlciwgaWYgd2Ug
ZXNjYWxhdGUgZnJvbSBOTUkvTUNFIGNvbnRleHQgaW50byBjcmFzaCBjb250ZXh0LCB0aGVuCj4g
Pj4+Pj4+IGFueXRoaW5nIGdvZXMuwqAgSW4gcmVhbGl0eSwgd2Ugb25seSBldmVyIHNlbmQgTk1J
cyBmcm9tIHRoZSBjcmFzaCBwYXRoLAo+ID4+Pj4+PiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVk
IHRvIHVzZSBhIHNob3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgo+ID4+Pj4+IFRoaXMg
d2FzIHJlcXVlc3RlZCBieSBKYW4sIGFzIHNhZmV0eSBtZWFzdXJlCj4gPj4+PiBUaGF0IG1heSBi
ZSwgYnV0IGl0IGRvZXNuJ3QgbWVhbiBpdCBpcyBjb3JyZWN0LsKgIElmIGV4ZWN1dGlvbiBldmVy
Cj4gPj4+PiBlbnRlcnMgdGhpcyBmdW5jdGlvbiBpbiBOTUkvTUNFIGNvbnRleHQsIHRoZXJlIGlz
IGEgcmVhbCwKPiA+Pj4+IHN0YXRlLWNvcnJ1cHRpbmcgYnVnLCBoaWdoZXIgdXAgdGhlIGNhbGwg
c3RhY2suCj4gPj4+IEFjaywgdGhlbiBJIGd1ZXNzIHdlIHNob3VsZCBqdXN0IEJVRygpIGhlcmUg
aWYgZXZlciBjYWxsZWQgZnJvbSAjTk1JCj4gPj4+IG9yICNNQyBjb250ZXh0Pwo+ID4+IFdlbGwu
wqAgVGhlcmUgaXMgYSByZWFzb24gSSBzdWdnZXN0ZWQgcmVtb3ZpbmcgaXQsIGFuZCBub3QgdXNp
bmcgQlVHKCkuCj4gPj4KPiA+PiBJZiBOTUkvTUNFIGNvbnRleHQgZXNjYWxhdGVzIHRvIGNyYXNo
IGNvbnRleHQsIHdlIGRvIG5lZWQgdG8gc2VuZCBOTUlzLsKgCj4gPj4gSXQgd29uJ3QgYmUgdGhp
cyBmdW5jdGlvbiBzcGVjaWZpY2FsbHksIGJ1dCBpdCB3aWxsIGJlIHBhcnQgb2YgdGhlCj4gPj4g
Z2VuZXJhbCBJUEkgaW5mcmFzdHJ1Y3R1cmUuCj4gPj4KPiA+PiBXZSBkZWZpbml0ZWx5IGRvbid0
IHdhbnQgdG8gZ2V0IGludG8gdGhlIGdhbWUgb2YgdHJ5aW5nIHRvIGNsb2JiZXIgZWFjaAo+ID4+
IG9mIHRoZSBzdGF0ZSB2YXJpYWJsZXMsIHNvIHRoZSBvbmx5IHRoaW5nIHRocm93aW5nIEJVRygp
J3MgYXJvdW5kIGluCj4gPj4gdGhpcyBhcmVhIHdpbGwgZG8gaXMgbWFrZSB0aGUgY3Jhc2ggcGF0
aCBtb3JlIGZyYWdpbGUuCj4gPiBJIHNlZSwgcGFuaWNraW5nIGluIHN1Y2ggY29udGV4dCB3aWxs
IGp1c3QgY2xvYmJlciB0aGUgcHJldmlvdXMgY3Jhc2gKPiA+IGhhcHBlbmVkIGluIE5NSS9NQyBj
b250ZXh0Lgo+ID4KPiA+IFNvIHlvdSB3b3VsZCByYXRoZXIga2VlcCB0aGUgY3VycmVudCB2ZXJz
aW9uIG9mIGZhbGxpbmcgYmFjayB0byB0aGUKPiA+IHVzYWdlIG9mIHRoZSBub24tc2hvcnRoYW5k
IElQSSBzZW5kaW5nIHJvdXRpbmUgaW5zdGVhZCBvZiBwYW5pY2tpbmc/Cj4gPgo+ID4gV2hhdCBh
Ym91dDoKPiA+Cj4gPiBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQo+ID4gewo+ID4gICAgIC8q
Cj4gPiAgICAgICogV2hlbiBpbiAjTUMgb3IgI01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNlIHRo
ZSBwZXItQ1BVIHNjcmF0Y2ggbWFzawo+ID4gICAgICAqIGJlY2F1c2Ugd2UgaGF2ZSBubyB3YXkg
dG8gYXZvaWQgcmVlbnRyeSwgc28gZG8gbm90IHVzZSB0aGUgQVBJQwo+ID4gICAgICAqIHNob3J0
aGFuZC4gVGhlIG9ubHkgSVBJIHRoYXQgc2hvdWxkIGJlIHNlbnQgZnJvbSBzdWNoIGNvbnRleHQK
PiA+ICAgICAgKiBpcyBhICNOTUkgdG8gc2h1dGRvd24gdGhlIHN5c3RlbSBpbiBjYXNlIG9mIGEg
Y3Jhc2guCj4gPiAgICAgICovCj4gPiAgICAgaWYgKCB2ZWN0b3IgPT0gQVBJQ19ETV9OTUkgKQo+
ID4gICAgIAlhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZl
Y3Rvcik7Cj4gPiAgICAgZWxzZQo+ID4gICAgICAgICBCVUcoKTsKPiA+Cj4gPiAgICAgcmV0dXJu
Owo+ID4gfQo+IAo+IEhvdyBkbyB5b3UgaW50ZW50IHRvIHRlc3QgaXQ/Cj4gCj4gSXQgbWlnaHQg
YmUgY29ycmVjdCBub3dbKl0gYnV0IGl0IGRvZXNuJ3QgcHJvdGVjdCBhZ2FpbnN0IHNvbWVvbmUK
PiBtb2RpZnlpbmcgY29kZSwgdmlvbGF0aW5nIHRoZSBjb25zdHJhaW50LCBhbmQgdGhpcyBnb2lu
ZyB1bm5vdGljZWQKPiBiZWNhdXNlIHRoZSBhYm92ZSBjb2RlcGF0aCB3aWxsIG9ubHkgYmUgZW50
ZXJlZCBpbiBleGNlcHRpb25hbAo+IGNpcmN1bXN0YW5jZXMuwqAgU29kcyBsYXcgc2F5cyB0aGF0
IGNvZGUgaW5zaWRlIHRoYXQgYmxvY2sgaXMgZmlyc3QgZ29pbmcKPiB0byBiZSB0ZXN0ZWQgaW4g
YSBjdXN0b21lciBlbnZpcm9ubWVudC4KPiAKPiBBU1NFUlQoKXMgd291bGQgYmUgbGVzcyBiYWQs
IGJ1dCBhbnkgdGVjaG5pY2FsIGNvdW50ZXJtZWFzdXJlcywgaG93ZXZlcgo+IHdlbGwgaW50ZW50
aW9uZWQsIGdldCBpbiB0aGUgd2F5IG9mIHRoZSBjcmFzaCBwYXRoIGZ1bmN0aW9uaW5nIHdoZW4g
aXQKPiBtYXR0ZXJzIG1vc3QuCgpPSywgc28gd2hhdCBhYm91dDoKCmlmICggaW5fbWMoKSB8fCBp
bl9ubWkoKSApCnsKICAgIGJvb2wgeDJhcGljID0gY3VycmVudF9sb2NhbF9hcGljX21vZGUoKSA9
PSBBUElDX01PREVfWDJBUElDOwogICAgdW5zaWduZWQgaW50IGljcjI7CgogICAgLyoKICAgICAq
IFdoZW4gaW4gI01DIG9yICNNTkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUgcGVyLUNQVSBz
Y3JhdGNoIG1hc2sKICAgICAqIGJlY2F1c2Ugd2UgaGF2ZSBubyB3YXkgdG8gYXZvaWQgcmVlbnRy
eSwgc28gZG8gbm90IHVzZSB0aGUgQVBJQwogICAgICogc2hvcnRoYW5kLiBUaGUgb25seSBJUEkg
dGhhdCBzaG91bGQgYmUgc2VudCBmcm9tIHN1Y2ggY29udGV4dAogICAgICogaXMgYSAjTk1JIHRv
IHNodXRkb3duIHRoZSBzeXN0ZW0gaW4gY2FzZSBvZiBhIGNyYXNoLgogICAgICovCiAgICBBU1NF
UlQodmVjdG9yID09IEFQSUNfRE1fTk1JKTsKICAgIGlmICggIXgyYXBpYyApCiAgICAgICAgaWNy
MiA9IGFwaWNfcmVhZChBUElDX0lDUjIpOwogICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5z
ZW5kX0lQSV9tYXNrLCBtYXNrLCB2ZWN0b3IpOwogICAgaWYgKCAheDJhcGljICkKICAgICAgICBh
cGljX3dyaXRlKEFQSUNfSUNSMiwgaWNyMik7CgogICAgcmV0dXJuOwp9CgpJJ20gdW5zdXJlIGFz
IHRvIHdoZXRoZXIgdGhlIGFzc2VydCBpcyBhY3R1YWxseSBoZWxwZnVsLCBidXQgd291bGQKbGlr
ZSB0byBzZXR0bGUgdGhpcyBiZWZvcmUgc2VuZGluZyBhIG5ldyB2ZXJzaW9uLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
