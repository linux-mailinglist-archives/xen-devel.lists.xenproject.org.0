Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A913C67E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 15:48:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irjvJ-00035U-Fj; Wed, 15 Jan 2020 14:45:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irjvH-00035P-Dd
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 14:45:31 +0000
X-Inumbo-ID: ab47dbea-37a5-11ea-857b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab47dbea-37a5-11ea-857b-12813bfff9fa;
 Wed, 15 Jan 2020 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579099527;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dVoBrM/E0Fxd2JB960RkvnRdhQYuEB/cTL+KUNqdsxE=;
 b=NUgvvNoCmLH0/1muOtc26ifPhTYLVyI91vwch+a56t2mri7xYgQtKHuj
 vWf8dQM4qyQJPnJNjFIG8oK+81ElvUWxvjFTCG/ATfrazac5dIMOMsJxV
 syRD8qlbHph4P5zXZRkQx/e6R0m2A7uhTHatznE4BR6xkMmCYDHdAMuGK g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rm7MtYxzbla2HhPyl9yg29GnHFarvOD/Aq7xSB9QSrHdvadWYIO5e4Nq6ZyKlmEQHWfh3zBYCS
 2YfKcIitL8PSUd4OCSz8yZsu8qMQmOu09dT9NvkeU7Ar71YnStR2DQ1jzJ8F2/YP52V3DkTx6/
 fui3z6vUBmXjMLs4Sw1Nz+R386D7tmx6k2FguD3kE96S4aHLKJlBCjB+WrvSAb7Ob9BIf/TUWJ
 UKqX157Y9T3EufAqggdv7HV/aK7cf+W53XS7+b7w9HId7eE3KyS11SrtowHn44hkHfThUGksW2
 jcs=
X-SBRS: 2.7
X-MesageID: 11112623
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11112623"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <7d9e9668-3b21-46c6-5428-b6e9394bb8fe@citrix.com>
 <20200115132358.GM11756@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <5f9c7a1a-2f8f-9f0d-112c-caba4bc84bb7@citrix.com>
Date: Wed, 15 Jan 2020 14:45:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200115132358.GM11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMzoyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAxMjozNjowOFBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
T24gMTUvMDEvMjAyMCAwOTo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwg
SmFuIDE0LCAyMDIwIGF0IDA3OjM2OjIxUE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+
Pj4+IElmIElUU0MgaXMgbm90IGF2YWlsYWJsZSBvbiBDUFUgKGUuZyBpZiBydW5uaW5nIG5lc3Rl
ZCBhcyBQViBzaGltKQo+Pj4+IHRoZW4gWDg2X0ZFQVRVUkVfTk9OU1RPUF9UU0MgaXMgbm90IGFk
dmVydGlzZWQgaW4gY2VydGFpbiBjYXNlcywgaS5lLgo+Pj4+IGFsbCBBTUQgYW5kIHNvbWUgb2xk
IEludGVsIHByb2Nlc3NvcnMuIEluIHdoaWNoIGNhc2UgVFNDIHdvdWxkIG5lZWQgdG8KPj4+PiBi
ZSByZXN0b3JlZCBvbiBDUFUgZnJvbSBwbGF0Zm9ybSB0aW1lIGJ5IFhlbiB1cG9uIGV4aXRpbmcg
ZGVlcCBDLXN0YXRlcy4KPj4+Pgo+Pj4+IEFzIHBsYXRmb3JtIHRpbWUgbWlnaHQgYmUgYmVoaW5k
IHRoZSBsYXN0IFRTQyBzdGFtcCByZWNvcmRlZCBmb3IgdGhlCj4+Pj4gY3VycmVudCBDUFUsIGlu
dmFyaWFudCBvZiBUU0Mgc3RhbXAgYmVpbmcgYWx3YXlzIGJlaGluZCBsb2NhbCBUU0MgY291bnRl
cgo+Pj4+IGlzIHZpb2xhdGVkLiBUaGlzIGhhcyBhbiBlZmZlY3Qgb2YgZ2V0X3NfdGltZSgpIGdv
aW5nIG5lZ2F0aXZlIHJlc3VsdGluZwo+Pj4+IGluIGV2ZW50dWFsIHN5c3RlbSBoYW5nIG9yIGNy
YXNoLgo+Pj4+Cj4+Pj4gRml4IHRoaXMgaXNzdWUgYnkgdXBkYXRpbmcgbG9jYWwgVFNDIHN0YW1w
IGFsb25nIHdpdGggVFNDIGNvdW50ZXIgd3JpdGUuCj4+Pgo+Pj4gVGhhbmtzISBJIGhhdmVuJ3Qg
c2VlbiBzdWNoIGlzc3VlIGJlY2F1c2UgSSd2ZSBiZWVuIHJ1bm5pbmcgdGhlIHNoaW0KPj4+IHdp
dGggbm9taWdyYXRlIGluIG9yZGVyIHRvIHByZXZlbnQgdGhlIHZUU0Mgb3ZlcmhlYWQuCj4+Pgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNp
dHJpeC5jb20+Cj4+Pj4gLS0tCj4+Pj4gVGhpcyBjYXVzZWQgcmVsaWFibGUgaGFuZ3Mgb2Ygc2hp
bSBkb21haW5zIHdpdGggbXVsdGlwbGUgdkNQVXMgb24gYWxsIEFNRAo+Pj4+IHN5c3RlbXMuIFRo
ZSBwcm9ibGVtIGdvdCBhbHNvIHJlcHJvZHVjZWQgb24gYmFyZS1tZXRhbCBieSBhcnRpZmljYWxs
eQo+Pj4+IG1hc2tpbmcgSVRTQyBmZWF0dXJlIGJpdC4gVGhlIHByb3Bvc2VkIGZpeCBoYXMgYmVl
biB2ZXJpZmllZCBmb3IgYm90aAo+Pj4+IGNhc2VzLgo+Pj4+IC0tLQo+Pj4+ICB4ZW4vYXJjaC94
ODYvdGltZS5jIHwgOCArKysrKysrLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Rp
bWUuYyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4+PiBpbmRleCBlNzljYjRkLi5mNmIyNmY4IDEw
MDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4+PiArKysgYi94ZW4vYXJjaC94
ODYvdGltZS5jCj4+Pj4gQEAgLTk1NSwxMCArOTU1LDE2IEBAIHU2NCBzdGltZTJ0c2Moc190aW1l
X3Qgc3RpbWUpCj4+Pj4gIAo+Pj4+ICB2b2lkIGNzdGF0ZV9yZXN0b3JlX3RzYyh2b2lkKQo+Pj4+
ICB7Cj4+Pj4gKyAgICBzdHJ1Y3QgY3B1X3RpbWUgKnQgPSAmdGhpc19jcHUoY3B1X3RpbWUpOwo+
Pj4+ICsKPj4+PiAgICAgIGlmICggYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX05PTlNUT1BfVFND
KSApCj4+Pj4gICAgICAgICAgcmV0dXJuOwo+Pj4+ICAKPj4+PiAtICAgIHdyaXRlX3RzYyhzdGlt
ZTJ0c2MocmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKSkpOwo+Pj4+ICsgICAgdC0+c3RhbXAubWFz
dGVyX3N0aW1lID0gcmVhZF9wbGF0Zm9ybV9zdGltZShOVUxMKTsKPj4+PiArICAgIHQtPnN0YW1w
LmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5zdGFtcC5tYXN0ZXJfc3RpbWUpOwo+Pj4+ICsgICAg
dC0+c3RhbXAubG9jYWxfc3RpbWUgPSB0LT5zdGFtcC5tYXN0ZXJfc3RpbWU7Cj4+Pj4gKwo+Pj4+
ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1wLmxvY2FsX3RzYyk7Cj4+Pgo+Pj4gSW4gb3JkZXIgdG8g
YXZvaWQgdGhlIFRTQyB3cml0ZSAoYW5kIHRoZSBsaWtlbHkgYXNzb2NpYXRlZCB2bWV4aXQpLAo+
Pj4gY291bGQgeW91IGluc3RlYWQgZG86Cj4+Pgo+Pj4gdC0+c3RhbXAubG9jYWxfc3RpbWUgPSB0
LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0aW1lKE5VTEwpOwo+Pj4gdC0+
c3RhbXAubG9jYWxfdHNjID0gcmR0c2Nfb3JkZXJlZCgpOwo+Pgo+PiBJIHRoaW5rIGluIHRoYXQg
Y2FzZSBSRFRTQyBtaWdodCByZXR1cm4gc29tZXRoaW5nIGJlaGluZCBwbGF0Zm9ybSB0aW1lCj4+
IHdoaWNoIGlzIG5vdCByaWdodCBJIGd1ZXNzLgo+IAo+IFRoZSBUU0MgYW5kIHRoZSBwbGF0Zm9y
bSB0aW1lIGFyZSBjb21wbGV0ZWx5IGluZGVwZW5kZW50IGZyb20gWGVuJ3MKPiBQb1YsIHlvdSBj
YW4gaGF2ZSBhIHBsYXRmb3JtIHRpbWUgbm90IGJhc2VkIG9uIHRoZSBUU0MgKGllOiBQSVQsIEhQ
RVQKPiBvciBQTSksIGFuZCBoZW5jZSB0aGVyZSdzIG5vIGRpcmVjdCByZWxhdGlvbiBiZXR3ZWVu
IGJvdGguCj4gCj4gVGhlIFRTQyBpcyB1c2VkIGFzIGEgd2F5IHRvIGdldCBhbiBhcHByb3hpbWF0
ZSBwbGF0Zm9ybSB0aW1lIGJhc2VkIG9uCj4gdGhlIGxhc3QgcGxhdGZvcm0gdGltZSB2YWx1ZSBh
bmQgdGhlIFRTQyBkZWx0YSBiZXR3ZWVuIHRoYW4gdmFsdWUgYW5kCj4gdGhlIGN1cnJlbnQgVFND
IHZhbHVlLCBJIGFzc3VtZSB0aGF0J3MgZG9uZSBiZWNhdXNlIHJlYWRpbmcgdGhlIFRTQyBpcwo+
IG11Y2ggY2hlYXBlciB0aGFuIHJlYWRpbmcgdGhlIHBsYXRmb3JtIHRpbWUuCj4gCj4gQXMgbG9u
ZyBhcyB0aGUgcGxhdGZvcm0gdGltZSBhbmQgdGhlIFRTQyBzdGFtcHMgYXJlIGJvdGggdXBkYXRl
ZCBhdCB0aGUKPiBzYW1lIHRpbWUgaXQgc2hvdWxkIGJlIGZpbmUuCgpJIHNlZSB5b3VyIHBvaW50
LiBJJ2xsIHRlc3QgeW91ciBhcHByb2FjaCBhbmQgZ2V0IGJhY2sgaGVyZSB3aXRoIHRoZSByZXN1
bHRzLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
