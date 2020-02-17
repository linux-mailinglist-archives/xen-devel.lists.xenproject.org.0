Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB641611B4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:11:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fCJ-0003s4-Qd; Mon, 17 Feb 2020 12:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3fCI-0003ru-Ki
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:08:22 +0000
X-Inumbo-ID: 30b2b8a8-517e-11ea-bfd8-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30b2b8a8-517e-11ea-bfd8-12813bfff9fa;
 Mon, 17 Feb 2020 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581941301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CY+NLT+VgSLapBw5hioKrgtoRzL1SUi7SWJfmDyPxKA=;
 b=CAA9OJ4TlxsqDTzpstzeW143vJ7p+5IOziD7HF+L5Gg3BUArktBidBfi
 szVHBmVpkYp9I/ztLZpXAPwq0NZeWubq81NIh8jrCNqr2t5N7b5aXdEzp
 KW1pnlHjYBBjTyfgwoZt5yoNa+iFInpjMo/9aM+gpVMIjV2BpXeREfVQT U=;
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
IronPort-SDR: M33H1ynRasYti/4yDSbRmvWU5ZbI1pL1HZ+qfKAtV8QwkUoDxTRR7Iu6dv8qocg0RSNjkv/P66
 wvuy/MH/+g2Nijds5qwre2/iGCfIubIKDyaoXLFOEY5Onu7nzFhB9DQlKmEntKKXDA0+JnlW2q
 7SMiPUfeaL+AfVSffEoqnRy0mTFzDluStLtS7CO+34GM6Ujx0oIRJipbYjPgsj0FOD3tnQNQhu
 guGqXBGMi29ouNmactSjaQiRS5qHm37ERewSPJlYgw1xzu0azdbsGrCF2W4OnalgDVc5tIp+3/
 K90=
X-SBRS: 2.7
X-MesageID: 12924715
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12924715"
Date: Mon, 17 Feb 2020 13:08:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200217120813.GH4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTI6MDE6MjNQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjAg
MTE6NDEKPiA+IFRvOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQ2M6IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jby51az47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tCj4gPiBk
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNy
b3NvZnQuY29tPjsgV2VpCj4gPiBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi8zXSB4ODYvaHlwZXJ2OiBz
a2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoCj4gPiAKPiA+IE9uIE1vbiwgRmViIDE3
LCAyMDIwIGF0IDExOjM0OjQxQU0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9uIEZyaSwg
RmViIDE0LCAyMDIwIGF0IDA0OjU1OjQ0UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4g
PiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+ID4gRnJvbTogV2VpIExp
dSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQo+ID4gPiA+ID4g
U2VudDogMTQgRmVicnVhcnkgMjAyMCAxMzozNAo+ID4gPiA+ID4gVG86IFhlbiBEZXZlbG9wbWVu
dCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gPiA+ID4gPiBDYzogTWlj
aGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBEdXJyYW50LCBQYXVsCj4gPiA+
ID4gPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT47IFdlaSBMaXUKPiA+ID4gPiA+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+ID4gPiA+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gPiA+
IFN1YmplY3Q6IFtQQVRDSCB2MiAyLzNdIHg4Ni9oeXBlcnY6IHNrZWxldG9uIGZvciBMMCBhc3Np
c3RlZCBUTEIKPiA+IGZsdXNoCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW1wbGVtZW50IGEgYmFzaWMg
aG9vayBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoLiBUaGUgaG9vayBuZWVkcyB0bwo+ID4gPiA+
ID4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFyZSBub3QgbWV0LCBp
dCByZXR1cm5zIGFuCj4gPiBlcnJvcgo+ID4gPiA+ID4gbnVtYmVyIHRvIGZhbGwgYmFjayB0byBu
YXRpdmUgZmx1c2hlcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbnRyb2R1Y2UgYSBuZXcgdmFyaWFi
bGUgdG8gaW5kaWNhdGUgaWYgaHlwZXJjYWxsIHBhZ2UgaXMgcmVhZHkuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgIHwg
IDEgKwo+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcg
KysrKysrKysrKysrCj4gPiA+ID4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmggfCAgNCArKysKPiA+ID4gPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAg
ICB8IDQxCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gIDQgZmls
ZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+IGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gPiA+ID4gaW5kZXggNjgxNzAx
MDlhOS4uMTg5MDJjMzNlOSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvTWFrZWZpbGUKPiA+ID4gPiA+IEBAIC0xICsxLDIgQEAKPiA+ID4gPiA+ICBvYmoteSArPSBo
eXBlcnYubwo+ID4gPiA+ID4gK29iai15ICs9IHRsYi5vCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+ID4gPiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQx
ZjExYWUzIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwo+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
Ywo+ID4gPiA+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFko
dm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiA+ID4gPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01P
U1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7Cj4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVB
RF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
K3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgaHZfaGNhbGxfcGFnZV9yZWFkeTsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiA+
ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307Cj4g
PiA+ID4gPiBAQCAtMTE5LDYgKzEyMSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBl
cmNhbGxfcGFnZSh2b2lkKQo+ID4gPiA+ID4gICAgICBCVUdfT04oIWh5cGVyY2FsbF9tc3IuZW5h
YmxlKTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgIHNldF9maXhtYXBfeChGSVhfWF9IWVBFUlZf
SENBTEwsIG1mbiA8PCBQQUdFX1NISUZUKTsKPiA+ID4gPgo+ID4gPiA+IFNob3VsZG4ndCB0aGlz
IGhhdmUgYXQgbGVhc3QgYSBjb21waWxlciBiYXJyaWVyIGhlcmU/Cj4gPiA+ID4KPiA+ID4KPiA+
ID4gT0suIEkgd2lsbCBhZGQgYSB3cml0ZSBiYXJyaWVyIGhlcmUuCj4gPiAKPiA+IEhtLCBzaG91
bGRuJ3Qgc3VjaCBiYXJyaWVyIGJlIHBhcnQgb2Ygc2V0X2ZpeG1hcF94IGl0c2VsZj8KPiA+IAo+
IAo+IE5vdCByZWFsbHksIGZvciB0aGUgcHVycG9zZSBJIGhhZCBpbiBtaW5kLiBUaGUgaHZfaGNh
bGxfcGFnZV9yZWFkeSBnbG9iYWwgaXMgc3BlY2lmaWMgdG8gdGhpcyBjb2RlIGFuZCB3ZSBuZWVk
IHRvIG1ha2Ugc3VyZSB0aGUgcGFnZSBpcyBhY3R1YWxseSByZWFkeSBiZWZvcmUgdGhlIGNvZGUg
c2F5cyBpdCBpcy4KCkJ1dCBhbnl0aGluZyB0aGF0IG1vZGlmaWVzIHRoZSBwYWdlIHRhYmxlcyBz
aG91bGQgYWxyZWFkeSBoYXZlIGEKYmFycmllciBpZiByZXF1aXJlZCBpbiBvcmRlciB0byBwcmV2
ZW50IGFjY2Vzc2VzIGZyb20gYmVpbmcgbW92ZWQKYWhlYWQgb2YgaXQsIG9yIGVsc2UgdGhpbmdz
IHdvdWxkIGNlcnRhaW5seSBnbyB3cm9uZyBpbiBtYW55IG90aGVyCnBsYWNlcz8KClJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
