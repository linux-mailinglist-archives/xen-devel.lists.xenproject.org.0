Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA73146F72
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 18:20:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iug6e-0003jM-84; Thu, 23 Jan 2020 17:17:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AKOf=3M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iug6d-0003jH-Ah
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 17:17:23 +0000
X-Inumbo-ID: 326827a6-3e04-11ea-b833-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 326827a6-3e04-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579799834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OVKCc/ipWHl+Jrp6fPK3ZVQZZROsipKLut69K4bDF54=;
 b=YyRIcLZHOd+2v8riXjHiHAevsqjvdl1vmziBl/oVSd8myjSAzahymCJn
 pDRudNwEULGtGmCC0YONC4PIHLJlPc7iL3x8eA9FWKC0kWP22X+scYUDz
 +qOqFT74qcyupwO0dgHW+TqzoGXjCj+4sjq8G9EWhz+LZKeXtd8DiRTAe w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uQGZBbZCVucwWeKKzgpuCABxM7vcZwaRqcJOPfUNu8GwUHVQmQTF0x7avqUpzGpnts1Ah24iz/
 7/32ML9OXXZ4ou8OnyXlC/r+lAB9Pb0C6bQHlXv85jpkrqcI0cZV2EeD48sPOkgBfkT27XqF3F
 UNcvLTTLPQ6w0p+txZ1H7a7weJxfLjJBkeJQNciM3pGOM0N/a/7G85RTAGnSs0cbEu9Xzz/PZn
 zpiKgv3vQ0jbkFJRVb+XBkDBuIyscEBauIYVsfB6uYDJBK44tEWPJntI8XRUI5b2PIpodvXkKT
 ZVA=
X-SBRS: 2.7
X-MesageID: 11517166
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11517166"
Date: Thu, 23 Jan 2020 18:17:06 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200123171706.GE57924@desktop-tdan49n.eng.citrite.net>
References: <E1it15N-0001Ge-Go@osstest.test-lab.xenproject.org>
 <20200121102109.GG11756@Air-de-Roger>
 <20200123153425.GJ1288@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123153425.GJ1288@perard.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDM6MzQ6MjVQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTA6MjE6MDlBTSArMDAwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IFRoZSBpc3N1ZSBpcyB0aGF0IHRoaXMgY2hhbmdlIGlzIHBh
c3NpbmcgdGhlIGd1ZXN0IGRvbWFpbl9jcmVhdGVfc3RhdGUKPiA+IHRvIGxpYnhsX19kb21haW5f
YnVpbGQgaW4gbGlieGxfX3NwYXduX3N0dWJfZG0sIGFuZCBoZW5jZSB0aGUKPiA+IHN0dWJkb21h
aW4gZG9lc24ndCBnZXQgY3JlYXRlZC4gSSBoYXZlIHRoZSBmb2xsb3dpbmcgcGF0Y2ggdGhhdCBm
aXhlcwo+ID4gaXQsIGJ1dCBpdCdzIGtpbmQgb2YgZGlydHkuCj4gPiAKPiA+IC0tLTg8LS0tCj4g
PiBGcm9tIDY4OGZkZTk1OTkyZDA3YmIxMTIzZDMyNGE2ODAwNmRkMDhiYzY1MTIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+ID4gRGF0ZTogVHVlLCAyMSBKYW4gMjAyMCAxMDoxNDowOSArMDAwMAo+ID4gU3Vi
amVjdDogW1BBVENIXSBsaWJ4bDogZml4IHN0dWJkb21haW4gY3JlYXRpb24gYWZ0ZXIgYWFjYzE0
MzAwNjQyOWRlCj4gPiBNSU1FLVZlcnNpb246IDEuMAo+ID4gQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PVVURi04Cj4gCj4gOi0oLCB0aGlzIGlzIGEgbGllLiBUaGUgZW1haWwgSSd2
ZSByZWNlaXZlZCBoYXMgYSBkaWZmZXJlbnQgY2hhcnNldC4KClJlYWxseT8gVGhlIGVtYWlsIGhl
YWRlcnMgYWxzbyBjb250YWluIHRoZSBzYW1lIHRhZywgYW5kIGhlbmNlIGFsbCBteQplbWFpbHMg
d291bGQgaGF2ZSBhIHdyb25nIGVuY29kaW5nIHRoZW4uCgo+IGdpdAo+IGNvbXBsYWluZWQgYWJv
dXQgaXQuIE1heWJlIG5leHQgdGltZSB0aGUgcGF0Y2ggY291bGQgYmUgYXR0YWNoZWQsIG9yIGl0
Cj4gY291bGQgYmUgYSBwcm9wZXIgcGF0Y2ggd2l0aCBzb21lIG5vdGUgKGFmdGVyIC0tLSkgKGdp
dCBzZW5kLWVtYWlsIGNhbgo+IGRvIC0taW4tcmVwbHktdG8pLCBvciBpdCBjb3VsZCBiZSB0d28g
c2VwYXJhdGVkIGVtYWlscyB3aXRoIHRoZSBmaXJzdAo+IG9uZSByZXBseWluZyB0byB0aGUgcmVw
b3J0IGFuZCB0aGUgc2Vjb25kIHRoZSBwYXRjaCAoYWxsIGluIHRoZSBzYW1lCj4gdGhyZWFkKS4K
CkkgY2FuIGNlcnRhaW5seSBzZW5kIHRoZSBwYXRjaCBzZXBhcmF0ZWx5IGFzIGEgcmVwbHkgYXMg
eW91IHNheSBhYm92ZSwKYnV0IEkgd291bGQgc3RpbGwgbmVlZCB0byBmaXggbXkgZW1haWwgY2xp
ZW50IHRvIHNldCB0aGUgcHJvcGVyCmVuY29kaW5nIHRoZW4uCgo+IAo+ID4gQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAo+ID4gCj4gPiBhYWNjMTQzMDA2NDI5ZGUgYnJva2Ugc3R1YmRv
bWFpbiBjcmVhdGlvbiBieSBwYXNzaW5nIHRoZSBndWVzdAo+ID4gZG9tYWluX2NyZWF0ZV9zdGF0
ZSB0byBsaWJ4bF9fZG9tYWluX2J1aWxkIGluIGxpYnhsX19zcGF3bl9zdHViX2RtLAo+ID4gd2hl
biBpdCBzaG91bGQgaW5zdGVhZCBiZSBjcmFmdGluZyBhIG5ldyBkb21haW5fY3JlYXRlX3N0YXRl
IGZvciB0aGUKPiA+IHN0dWJkb21haW4uCj4gPiAKPiA+IEZpeGVzOiBhYWNjMTQzMDA2NDI5ZGUg
KCd0b29scy9saWJ4bDogUGx1bWIgZG9tYWluX2NyZWF0ZV9zdGF0ZSBkb3duIGludG8gbGlieGxf
X2J1aWxkX3ByZSgpJykKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAg
ICB8IDIyICsrKysrKysrKysrKystLS0tLS0tLS0KPiA+ICB0b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oIHwgIDMgKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Rt
LmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gPiBpbmRleCAzZjA4Y2NhZDFiLi5iMWRkZGU3
N2U4IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+ID4gKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfZG0uYwo+ID4gQEAgLTIxMTAsMTcgKzIxMTAsMjEgQEAgdm9pZCBsaWJ4
bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19kb21haW5fY3JlYXRlX3N0
YXRlICpkY3MpCj4gPiAgICAgIHhzX3RyYW5zYWN0aW9uX3QgdDsKPiA+ICAKPiA+ICAgICAgLyog
Y29udmVuaWVuY2UgYWxpYXNlcyAqLwo+ID4gLSAgICBsaWJ4bF9kb21haW5fY29uZmlnICpjb25z
dCBkbV9jb25maWcgPSAmc2Rzcy0+ZG1fY29uZmlnOwo+ID4gICAgICBsaWJ4bF9kb21haW5fY29u
ZmlnICpjb25zdCBndWVzdF9jb25maWcgPSBzZHNzLT5kbS5ndWVzdF9jb25maWc7Cj4gPiAgICAg
IGNvbnN0IGludCBndWVzdF9kb21pZCA9IHNkc3MtPmRtLmd1ZXN0X2RvbWlkOwo+ID4gICAgICBs
aWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRlICpjb25zdCBkX3N0YXRlID0gc2Rzcy0+ZG0uYnVpbGRf
c3RhdGU7Cj4gPiAtICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUgKmNvbnN0IHN0dWJkb21f
c3RhdGUgPSAmc2Rzcy0+ZG1fc3RhdGU7Cj4gPiArICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3Rh
dGUgKnN0dWJkb21fc3RhdGU7Cj4gPiArICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRtX2NvbmZp
ZzsKPiA+ICAKPiA+ICAgICAgLyogSW5pdGlhbGlzZSBwcml2YXRlIHBhcnQgb2Ygc2RzcyAqLwo+
ID4gLSAgICBsaWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRlX2luaXQoc3R1YmRvbV9zdGF0ZSk7Cj4g
PiAgICAgIGRtc3NfaW5pdCgmc2Rzcy0+ZG0pOwo+ID4gICAgICBkbXNzX2luaXQoJnNkc3MtPnB2
cWVtdSk7Cj4gPiAgICAgIGxpYnhsX194c3dhaXRfaW5pdCgmc2Rzcy0+eHN3YWl0KTsKPiA+ICsg
ICAgR0NORVcoc2Rzcy0+ZGNzKTsKPiA+ICsgICAgc3R1YmRvbV9zdGF0ZSA9ICZzZHNzLT5kY3Mt
PmJ1aWxkX3N0YXRlOwo+ID4gKyAgICBsaWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRlX2luaXQoc3R1
YmRvbV9zdGF0ZSk7Cj4gPiArICAgIEdDTkVXKHNkc3MtPmRjcy0+Z3Vlc3RfY29uZmlnKTsKPiA+
ICsgICAgZG1fY29uZmlnID0gc2Rzcy0+ZGNzLT5ndWVzdF9jb25maWc7Cj4gCj4gSSBkb24ndCB0
aGluayB0aGF0J3MgZW5vdWdoLCB3ZSBuZWVkIHRvIGluaXRpYWxpemUgdGhlIGRjcyBwcm9wZXJs
eS4KPiBPdGhlcndpc2UsIGxpYnhsX19kb21haW5fYnVpbGQoKSBtaWdodCBzdGFydCB1c2luZyB0
aGluZyB0aGF0IGFyZW4ndCBzZXQKPiBwcm9wZXJseS4gTWF5YmUgd2Ugd291bGQgbmVlZCBhIG5l
dyBzdHJ1Y3Qgd2hpY2ggY291bGQgYmUgcGFzcyB0bwo+IGxpYnhsX19kb21haW5fYnVpbGQqLCBv
ciB0aGF0IG1pZ2h0IGJlIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBuZWVkZWQuCgpFciBsaWtlbHkg
eWVzLCBidXQgY3JlYXRpbmcgYSBjb21wbGV0ZSBkb21haW5fY3JlYXRlX3N0YXRlIGZvciB0aGUK
c3R1YmRvbSB3aWxsIGJlIHZlcnkgY3VtYmVyc29tZSBJIHRoaW5rLiBNYXliZSB3ZSBjYW4gY29w
eSB0aGUgb25lCmZyb20gdGhlIGd1ZXN0IG92ZXIgdGhlIHN0dWJkb20gb25lIGluIG9yZGVyIHRv
IGluaXRpYWxpemUgaXQ/CgpOb3Qgc3VyZSB0aGF0J3MgYW55IGJldHRlciB0aGFuIGp1c3QgdXNp
bmcgYW4gZW1wdHkgb25lLgoKPiA+ICAKPiA+ICAgICAgaWYgKGd1ZXN0X2NvbmZpZy0+Yl9pbmZv
LmRldmljZV9tb2RlbF92ZXJzaW9uICE9Cj4gPiAgICAgICAgICBMSUJYTF9ERVZJQ0VfTU9ERUxf
VkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05BTCkgewo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCj4gPiBp
bmRleCBkOTE5ZjkxODgyLi5hYmY4OGRmZDc2IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAo+
ID4gQEAgLTQxMDIsOCArNDEwMiw3IEBAIHR5cGVkZWYgc3RydWN0IHsKPiA+ICAgICAgLyogZmls
bGVkIGluIGJ5IHVzZXIsIG11c3QgcmVtYWluIHZhbGlkOiAqLwo+ID4gICAgICBsaWJ4bF9fZG1f
c3Bhd25fY2IgKmNhbGxiYWNrOyAvKiBjYWxsZWQgYXMgY2FsbGJhY2soLCZzZHNzLT5kbSwpICov
Cj4gPiAgICAgIC8qIHByaXZhdGUgdG8gbGlieGxfX3NwYXduX3N0dWJfZG06ICovCj4gPiAtICAg
IGxpYnhsX2RvbWFpbl9jb25maWcgZG1fY29uZmlnOwo+ID4gLSAgICBsaWJ4bF9fZG9tYWluX2J1
aWxkX3N0YXRlIGRtX3N0YXRlOwo+ID4gKyAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAq
ZGNzOwo+IAo+IFRoaXMgc2hvdWxkIGJlIG5hbWVkIGRtX2RjcywgSSB0aGluaywgdG8gZm9sbG93
IHRoZSBzYW1lIHBhdHRlcm4gYXMKPiBiZWZvcmUuCgpTdXJlLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
