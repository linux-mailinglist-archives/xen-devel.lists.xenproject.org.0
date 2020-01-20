Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01324142CF4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:12:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itXj1-0001j4-Eh; Mon, 20 Jan 2020 14:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itXiz-0001iz-MB
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:08:17 +0000
X-Inumbo-ID: 48c99930-3b8e-11ea-8e9a-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c99930-3b8e-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579529288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FidVSJQcN738992TnRuAGgEt9L7HnMLnqKJ5GuPGhvM=;
 b=SvT938nS4MJ4dnf+HhUi09LpcKpW5VSbcgw+8Uegfw1As/xMl/kEvSWt
 MYosmXtzEJbhHpIbH2iNZB/WwDK1WyanFzMsihGfj7lgzbCQRIY8r9n8x
 gtUbsSBgSo6CUkoiP7Ql1olafU6sfBs5Y8BowZ/fYBuwrlcRSuTwSEmS8 A=;
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
IronPort-SDR: 5pw2nbeB+mt2BXMIW2X6fqSLUHRU29GExydKxxyb9Fyf7fauDXlpeinSMA/KPuulbGoHmPXjYm
 Vfdf0ItHgDsfAoxbp711WeVEEMfCn89dDwZZ17CEOzmzY/x+Hwv/eiemt5KkeX0Azb0Ni/Ab5h
 lAZtGo+zlSd6RRgFMt4UbdIbASIkyeCewTNEQ4JDJdTEkdWhcruVpQalk6IHUd3y/TcUWwkaEG
 UXPZyqLxXYh6J8sMR1wNCdjZjkijy4PaRG0/v7Dke26eWTrQ5JW7VZjjBU8g9/F88+gUl3ojCG
 J3U=
X-SBRS: 2.7
X-MesageID: 11174654
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11174654"
Date: Mon, 20 Jan 2020 14:07:50 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200120140750.GZ11756@Air-de-Roger>
References: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDQ6MDA6MDNQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gRHVlIHRvIEFNRCBhbmQgSHlnb24gYmVpbmcgdW5hYmxlIHRvIHNlbGVjdGl2ZWx5
IHRyYXAgQ1I0IGJpdCBtb2RpZmljYXRpb25zCj4gcnVubmluZyAzMi1iaXQgUFYgZ3Vlc3QgaW5z
aWRlIFBWIHNoaW0gY29tZXMgd2l0aCBzaWduaWZpY2FudCBwZXJmb3JtYW5jZQo+IGhpdC4gTW9y
ZW92ZXIsIGZvciBTTUVQIGluIHBhcnRpY3VsYXIgZXZlcnkgdGltZSBDUjQuU01FUCBjaGFuZ2Vz
IG9uIGNvbnRleHQKPiBzd2l0Y2ggdG8vZnJvbSAzMi1iaXQgUFYgZ3Vlc3QsIGl0IGdldHMgdHJh
cHBlZCBieSBMMCBYZW4gd2hpY2ggdGhlbgo+IHRyaWVzIHRvIHBlcmZvcm0gZ2xvYmFsIFRMQiBp
bnZhbGlkYXRpb24gZm9yIFBWIHNoaW0gZG9tYWluLiBUaGlzIHVzdWFsbHkKPiByZXN1bHRzIGlu
IGV2ZW50dWFsIGhhbmcgb2YgYSBQViBzaGltIHdpdGggYXQgbGVhc3Qgc2V2ZXJhbCB2Q1BVcy4K
PiAKPiBTaW5jZSB0aGUgb3ZlcmFsbCBzZWN1cml0eSByaXNrIGlzIGdlbmVyYWxseSBsb3dlciBm
b3Igc2hpbSBYZW4gYXMgaXQgYmVpbmcKPiB0aGVyZSBtb3JlIG9mIGEgZGVmZW5zZS1pbi1kZXB0
aCBtZWNoYW5pc20sIGNob29zZSB0byBkaXNhYmxlIFNNRVAvU01BUCBpbgo+IGl0IGJ5IGRlZmF1
bHQgb24gQU1EIGFuZCBIeWdvbiB1bmxlc3MgYSB1c2VyIGNob3NlIG90aGVyd2lzZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4K
PiAtLS0KPiBJJ20gYSBsaXR0bGUgYml0IG9uIHRoZSBmZW5jZSB3aXRoIHRoaXMgb25lLiBXZSdy
ZSBoYXZpbmcgdGhlIHNhbWUgaXNzdWUgd2l0aAo+IGdlbmVyYWwgbmVzdGVkIHZpcnQgYnV0IEkn
bSBub3QgaW5jbGluZWQgdG8gdHJhZGUgc2VjdXJpdHkgZm9yIGEgdXNlciBpbgo+IGdlbmVyYWwg
Y2FzZS4gRGlzYWJsaW5nIGl0IGJ5IGRlZmF1bHQgZm9yIFBWIHNoaW0gb25seSBzZWVtcyByYXRo
ZXIgaW5vY3VvdXMKPiBkdWUgdG8gdGhlIHVzZSBjYXNlIHJlc3RyaWNpb24uIEknZCBsaWtlIHRv
IGhlYXIgbW9yZSBvcGluaW9ucy4KPiAtLS0KPiAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUu
cGFuZG9jIHwgMTAgKysrKysrKystLQo+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAg
ICAgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+
IGluZGV4IDk4MWE1ZTIuLjA1YjJkZGUgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21t
YW5kLWxpbmUucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
Cj4gQEAgLTE5MzYsMTkgKzE5MzYsMjUgQEAgaXMgMU1CLgo+ICAjIyMgc21hcCAoeDg2KQo+ICA+
IGA9IDxib29sZWFuPiB8IGh2bWAKPiAgCj4gLT4gRGVmYXVsdDogYHRydWVgCj4gKz4gRGVmYXVs
dDogYHRydWVgIHVubGVzcyBydW5uaW5nIGluIHB2LXNoaW0gbW9kZSBvbiBBTUQgb3IgSHlnb24g
aGFyZHdhcmUKPiAgCj4gIEZsYWcgdG8gZW5hYmxlIFN1cGVydmlzb3IgTW9kZSBBY2Nlc3MgUHJl
dmVudGlvbgo+ICBVc2UgYHNtYXA9aHZtYCB0byBhbGxvdyBTTUFQIHVzZSBieSBIVk0gZ3Vlc3Rz
IG9ubHkuCj4gIAo+ICtJbiBQViBzaGltIG1vZGUgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlIGR1
ZSB0byBzaWduaWZpY2FudCBwZXJmb21hbmNlIGltcGFjdAo+ICtpbiBzb21lIGNhc2VzIGFuZCBn
ZW5lcmFsbHkgbG93ZXIgc2VjdXJpdHkgcmlzayB0aGUgb3B0aW9uIGRlZmF1bHRzIHRvIGZhbHNl
Lgo+ICsKPiAgIyMjIHNtZXAgKHg4NikKPiAgPiBgPSA8Ym9vbGVhbj4gfCBodm1gCj4gIAo+IC0+
IERlZmF1bHQ6IGB0cnVlYAo+ICs+IERlZmF1bHQ6IGB0cnVlYCB1bmxlc3MgcnVubmluZyBpbiBw
di1zaGltIG1vZGUgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlCj4gIAo+ICBGbGFnIHRvIGVuYWJs
ZSBTdXBlcnZpc29yIE1vZGUgRXhlY3V0aW9uIFByb3RlY3Rpb24KPiAgVXNlIGBzbWVwPWh2bWAg
dG8gYWxsb3cgU01FUCB1c2UgYnkgSFZNIGd1ZXN0cyBvbmx5Lgo+ICAKPiArSW4gUFYgc2hpbSBt
b2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZSBkdWUgdG8gc2lnbmlmaWNhbnQgcGVyZm9tYW5j
ZSBpbXBhY3QKPiAraW4gc29tZSBjYXNlcyBhbmQgZ2VuZXJhbGx5IGxvd2VyIHNlY3VyaXR5IHJp
c2sgdGhlIG9wdGlvbiBkZWZhdWx0cyB0byBmYWxzZS4KPiArCj4gICMjIyBzbXQgKHg4NikKPiAg
PiBgPSA8Ym9vbGVhbj5gCj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBi
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gaW5kZXggNWJkYzIyOS4uODQzMmI3NyAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4g
QEAgLTEwNSw5ICsxMDUsOSBAQCBzdHJ1Y3QgY3B1aW5mb194ODYgX19yZWFkX21vc3RseSBib290
X2NwdV9kYXRhID0geyAwLCAwLCAwLCAwLCAtMSB9Owo+ICAKPiAgdW5zaWduZWQgbG9uZyBfX3Jl
YWRfbW9zdGx5IG1tdV9jcjRfZmVhdHVyZXMgPSBYRU5fTUlOSU1BTF9DUjQ7Cj4gIAo+IC0vKiBz
bWVwOiBFbmFibGUvZGlzYWJsZSBTdXBlcnZpc29yIE1vZGUgRXhlY3V0aW9uIFByb3RlY3Rpb24g
KGRlZmF1bHQgb24pLiAqLwo+IC0jZGVmaW5lIFNNRVBfSFZNX09OTFkgKC0xKQo+IC1zdGF0aWMg
czggX19pbml0ZGF0YSBvcHRfc21lcCA9IDE7Cj4gKy8qIHNtZXA6IEVuYWJsZS9kaXNhYmxlIFN1
cGVydmlzb3IgTW9kZSBFeGVjdXRpb24gUHJvdGVjdGlvbiAqLwo+ICsjZGVmaW5lIFNNRVBfSFZN
X09OTFkgKC0yKQo+ICtzdGF0aWMgczggX19pbml0ZGF0YSBvcHRfc21lcCA9IC0xOwoKQ291bGQg
eW91IGNoYW5nZSB0aGUgdHlwZSB0byBpbnQ4X3QgaW5zdGVhZCBvZiBzOD8gKGhlcmUgYW5kIGJl
bG93LApjYW4gYmUgZG9uZSBvbiBjb21taXQgd2l0aCB0aGUgY2hhbmdlcyByZXF1ZXN0ZWQgYnkg
SmFuKS4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
