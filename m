Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D31611D9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:17:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fHO-0004tJ-Br; Mon, 17 Feb 2020 12:13:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3fHM-0004tC-Sv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:13:36 +0000
X-Inumbo-ID: ebf2629e-517e-11ea-bfd9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebf2629e-517e-11ea-bfd9-12813bfff9fa;
 Mon, 17 Feb 2020 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581941616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W/67eI1rWnWZ1S0efa3pq221jIhYiRPTDWXZQFw4WMQ=;
 b=E89NzkPPtK9foB6sqym5yd2fnqsGzbxhq6PrdsmM9PWeZa3GoFVPe5kD
 MvPmO5aboTjuF3p1WxL9hIBb8vSutKX4Ji1c481ni4UuKGa8OnXsLQLwm
 hpfTsYc4PPc8kogvmljHKlnKU2afMfLyCpMvVqJOPkkZj/9Ipv8sROK9/ w=;
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
IronPort-SDR: NZbzTkeq7nycWzxWCd8qdTjXdIl366B6SiEFvhr/7D6kvJeJ6pXEH1agcrEJUA/KHBfjM/iaKk
 9FfRSaqshyl3THFJsvGATVdHIcMxlWp0UlEtpLoKQv/o5/uWYn8T6D3Qc5Y0sbLQ6gUawwYLr6
 bD0AzBqW34uJlHMfBt7sbvga7qrIqbo/IrdEvp3NLr6MtKGXfAIMd+MaukqLH12dDr76mc1MYN
 ibG+Hv7Ze+q3Ck4whqbnXGddn/mVwO2rhqOlz/95GhhC+5EslmwuRSfFRDexu9UE1jO3kB6oab
 AnQ=
X-SBRS: 2.7
X-MesageID: 12566508
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12566508"
Date: Mon, 17 Feb 2020 13:13:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200217121328.GI4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <20200217114538.s34hqiaq35kfv2sf@debian>
 <20200217120054.GG4679@Air-de-Roger>
 <20200217120801.btsfkomxgt3aed6t@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217120801.btsfkomxgt3aed6t@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6MDg6MDFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAwMTowMDo1NFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6NDU6MzhBTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6NDA6MzFQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEZlYiAxNywgMjAy
MCBhdCAxMTozNDo0MUFNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBG
ZWIgMTQsIDIwMjAgYXQgMDQ6NTU6NDRQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+
ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gPiA+IEZyb206
IFdlaSBMaXUgPHdlaS5saXUueGVuQGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiA+
ID4gPiA+ID4gPiBTZW50OiAxNCBGZWJydWFyeSAyMDIwIDEzOjM0Cj4gPiA+ID4gPiA+ID4gVG86
IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4g
PiA+ID4gPiA+ID4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+ID4gPiA+ID4gPiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+ID4gPiA+ID4gPiA+IDx3bEB4ZW4u
b3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+ID4g
PiA+ID4gPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIv
M10geDg2L2h5cGVydjogc2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaAo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEltcGxlbWVudCBhIGJhc2ljIGhvb2sgZm9yIEwwIGFzc2lz
dGVkIFRMQiBmbHVzaC4gVGhlIGhvb2sgbmVlZHMgdG8KPiA+ID4gPiA+ID4gPiBjaGVjayBpZiBw
cmVyZXF1aXNpdGVzIGFyZSBtZXQuIElmIHRoZXkgYXJlIG5vdCBtZXQsIGl0IHJldHVybnMgYW4g
ZXJyb3IKPiA+ID4gPiA+ID4gPiBudW1iZXIgdG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVzaGVz
Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0
byBpbmRpY2F0ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcyByZWFkeS4KPiA+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+
ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlICB8ICAxICsKPiA+ID4gPiA+ID4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9oeXBlcnYuYyAgfCAxNyArKysrKysrKysrKysKPiA+ID4gPiA+ID4gPiAgeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKPiA+ID4gPiA+ID4gPiAgeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gPiA+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPiA+
ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
dGxiLmMKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+IGIveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+IGluZGV4IDY4MTcwMTA5YTkuLjE4OTAy
YzMzZTkgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di9NYWtlZmlsZQo+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
TWFrZWZpbGUKPiA+ID4gPiA+ID4gPiBAQCAtMSArMSwyIEBACj4gPiA+ID4gPiA+ID4gIG9iai15
ICs9IGh5cGVydi5vCj4gPiA+ID4gPiA+ID4gK29iai15ICs9IHRsYi5vCj4gPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+
ID4gPiBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiBp
bmRleCA3MGY0Y2Q1YWUwLi5mOWQxZjExYWUzIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ID4gPiA+ID4gPiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+ID4gPiA+ID4gQEAgLTMzLDYgKzMz
LDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsK
PiA+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9h
c3Npc3QpOwo+ID4gPiA+ID4gPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25l
ZCBpbnQsIGh2X3ZwX2luZGV4KTsKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiArc3RhdGlj
IGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5Owo+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4g
PiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ID4gPiAgICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlk
ID0ge307Cj4gPiA+ID4gPiA+ID4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ID4gPiA+ID4gPiAgICAgIEJVR19PTigh
aHlwZXJjYWxsX21zci5lbmFibGUpOwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ICAgICAg
c2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOwo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gU2hvdWxkbid0IHRoaXMgaGF2ZSBhdCBsZWFzdCBhIGNvbXBp
bGVyIGJhcnJpZXIgaGVyZT8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9LLiBJ
IHdpbGwgYWRkIGEgd3JpdGUgYmFycmllciBoZXJlLgo+ID4gPiA+IAo+ID4gPiA+IEhtLCBzaG91
bGRuJ3Qgc3VjaCBiYXJyaWVyIGJlIHBhcnQgb2Ygc2V0X2ZpeG1hcF94IGl0c2VsZj8KPiA+ID4g
PiAKPiA+ID4gPiBOb3RlIHRoYXQgbWFwX3BhZ2VzX3RvX3hlbiBhbHJlYWR5IHBlcmZvcm1zIGF0
b21pYyB3cml0ZXMuCj4gPiA+IAo+ID4gPiBJIGRvbid0IG1pbmQgbWFraW5nIHRoaW5ncyBtb3Jl
IGV4cGxpY2l0IHRob3VnaC4gSG93ZXZlciB1bmxpa2VseSwgSQo+ID4gPiBtYXkgZW5kIHVwIHB1
dHRpbmcgc29tZXRoaW5nIGluIGJldHdlZW4gc2V0X2ZpeG1hcF94IGFuZCBzZXR0aW5nCj4gPiA+
IGhjYWxsX3BhZ2VfcmVhZHksIEkgd2lsbCBuZWVkIHRoZSBiYXJyaWVyIGJ5IHRoZW4sIEkgbWF5
IGFzIHdlbGwgcHV0IGl0Cj4gPiA+IGluIG5vdy4KPiA+IAo+ID4gSU1PIHNldF9maXhtYXBfeCBz
aG91bGQgaGF2ZSB0aGUgbmVjZXNzYXJ5IGJhcnJpZXJzIChvciBvdGhlcgo+ID4gc3luY2hyb25p
emF0aW9uIG1ldGhvZHMpIHNvIHRoYXQgb24gcmV0dXJuIHRoZSBhZGRyZXNzIGlzIGNvcnJlY3Rs
eQo+ID4gbWFwcGVkIGFjcm9zcyBhbGwgcHJvY2Vzc29ycywgYW5kIHRoYXQgaXQgcHJldmVudHMg
dGhlIGNvbXBpbGVyIGZyb20KPiA+IG1vdmluZyBhY2Nlc3NlcyBwYXN0IGl0LiBJIHdvdWxkIGNv
bnNpZGVyIGEgYnVnIG9mIHNldF9maXhtYXBfeAo+ID4gbm90IGhhdmluZyB0aGlzIGJlaGF2aW9y
IGFuZCByZXF1aXJpbmcgY2FsbGVycyB0byBkbyBleHRyYSB3b3JrIGluCj4gPiBvcmRlciB0byBl
bnN1cmUgdGhpcy4KPiA+IAo+ID4gSWU6IHNvbWV0aGluZyBsaWtlIHRoZSBzbmlwcGVkIGJlbG93
IHNob3VsZCBub3QgcmVxdWlyZSBhbiBleHRyYQo+ID4gYmFycmllciBJTU86Cj4gPiAKPiA+IHNl
dF9maXhtYXBfeChGSVhfWF9IWVBFUlZfSENBTEwsIG1mbiA8PCBQQUdFX1NISUZUKTsKPiA+ICoo
KHVuc2lnbmVkIGludCAqKWZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkgPSAwOwo+
IAo+IFRoYXQncyBkaWZmZXJlbnQgdGhvdWdoLiBDb21waWxlciBjYW4ndCBtYWtlIHRoZSBjb25u
ZWN0aW9uIGJldHdlZW4KPiBoY2FsbF9wYWdlX3JlYWR5IGFuZCB0aGUgYWRkcmVzcyByZXR1cm5l
ZCBieSBzZXRfZml4bWFwX3guCgpJJ20gbm90IHN1cmUgdGhlIGNvbXBpbGVyIGNhbiBtYWtlIGEg
Y29ubmVjdGlvbiBiZXR3ZWVuIHNldF9maXhtYXBfeAphbmQgZml4X3hfdG9fdmlydCBlaXRoZXIg
KGFzIGZpeF94X3RvX3ZpcnQgaXMgYSBzaW1wbGUgbWF0aGVtYXRpY2FsCm9wZXJhdGlvbiBhbmQg
RklYX1hfSFlQRVJWX0hDQUxMIGlzIGEgY29uc3RhbnQga25vd24gYXQgYnVpbGQgdGltZSkuCgpS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
