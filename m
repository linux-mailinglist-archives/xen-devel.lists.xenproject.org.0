Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80394F44EE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:48:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1kG-00062e-Bc; Fri, 08 Nov 2019 10:44:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5eKS=ZA=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iT1kE-00062Z-RU
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:43:58 +0000
X-Inumbo-ID: aa4c9cf6-0214-11ea-b678-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa4c9cf6-0214-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573209837;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xxPkBmeFsf5RJJSXrIRD8YCipZeWf5cRvb0iTijoqOo=;
 b=SdGfDwPnrva37URWLRJDmDD5clzWwObMSuex/DAvcpcBFOaBXvhHW4B+
 /HlaNNobWYsJhqwJ0b22aJPT2o03+Iyywl3nTlfm4vDBV6wWTY9Mkj1ge
 nDvD8J+yj6aKqhDVCZJgnt+wZRSto6lwveReOKQi2cA6uscI+GRwBXoZU c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y/YrDoYM/II74AAWSUDwxzvHnNyjX1N3m7ANWn8HUSWW7R1DNfodYZ597gHFkhuzXvqDx9InmD
 zRg5QF7AmRSFa2/rYMg6esxtaKrtuU05N7x4WYGUcwE7zrTom2RgOlq3mbWkTWKvjPC66jiD9L
 RXaTMZ/bHxJxfrD0NhTiC6q73S8Xia/GQ0tt7jmfYWy42av0cxQdPrl/k9QDfHG8LYftiS23K3
 AfY0AaEeDlZOXH6tqRdh4TYyWXf8NqLojLR1EltkRT8xb1VAS27l+NkP99zOy4tiu7sMstk6Or
 Fso=
X-SBRS: 2.7
X-MesageID: 8457841
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8457841"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-5-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <5aa240a5-d23a-3757-c694-93a1364900e6@citrix.com>
Date: Fri, 8 Nov 2019 10:43:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-5-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 04/12] livepatch: Implement pre-|post-
 apply|revert hooks
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yOC8xOSA0OjEyIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGlzIGlz
IGFuIGltcGxlbWVudGF0aW9uIG9mIDQgbmV3IGxpdmVwYXRjaCBtb2R1bGUgdmV0b2luZyBob29r
cywKPiB0aGF0IGNhbiBiZSBvcHRpb25hbGx5IHN1cHBsaWVkIGFsb25nIHdpdGggbW9kdWxlcy4K
PiBIb29rcyB0aGF0IGN1cnJlbnRseSBleGlzdHMgaW4gdGhlIGxpdmVwYXRjaCBtZWNoYW5pc20g
YXJlbid0IGFnaWxlCj4gZW5vdWdoIGFuZCBoYXZlIHZhcmlvdXMgbGltaXRhdGlvbnM6Cj4gKiBy
dW4gb25seSBmcm9tIHdpdGhpbiBhIHF1aWVzY2luZyB6b25lCj4gKiBjYW5ub3QgY29uZGl0aW9u
YWxseSBwcmV2ZW50IGFwcGx5aW5nIG9yIHJldmVydGluZwo+ICogZG8gbm90IGhhdmUgYWNjZXNz
IHRvIHRoZSBtb2R1bGUgY29udGV4dAo+IFRvIGFkZHJlc3MgdGhlc2UgbGltaXRhdGlvbnMgdGhl
IGZvbGxvd2luZyBoYXMgYmVlbiBpbXBsZW1lbnRlZDoKPiAxKSBwcmUtYXBwbHkgaG9vawo+ICAg
cnVucyBiZWZvcmUgdGhlIGFwcGx5IGFjdGlvbiBpcyBzY2hlZHVsZWQgZm9yIGV4ZWN1dGlvbi4g
SXRzIG1haW4KPiAgIHB1cnBvc2UgaXMgdG8gcHJldmVudCBmcm9tIGFwcGx5aW5nIGEgbGl2ZXBh
dGNoIHdoZW4gY2VydGFpbgo+ICAgZXhwZWN0ZWQgY29uZGl0aW9ucyBhcmVuJ3QgbWV0IG9yIHdo
ZW4gbXV0YXRpbmcgYWN0aW9ucyBpbXBsZW1lbnRlZAo+ICAgaW4gdGhlIGhvb2sgZmFpbCBvciBj
YW5ub3QgYmUgZXhlY3V0ZWQuCj4gCj4gMikgcG9zdC1hcHBseSBob29rCj4gICBydW5zIGFmdGVy
IHRoZSBhcHBseSBhY3Rpb24gaGFzIGJlZW4gZXhlY3V0ZWQgYW5kIHF1aWVzY2luZyB6b25lCj4g
ICBleGl0ZWQuIEl0cyBtYWluIHB1cnBvc2UgaXMgdG8gcHJvdmlkZSBhbiBhYmlsaXR5IHRvIGZv
bGxvdy11cCBvbgo+ICAgYWN0aW9ucyBwZXJmb3JtZWQgYnkgdGhlIHByZS0gaG9vaywgd2hlbiBt
b2R1bGUgYXBwbGljYXRpb24gd2FzCj4gICBzdWNjZXNzZnVsIG9yIHVuZG8gY2VydGFpbiBwcmVw
YXJhdGlvbiBzdGVwcyBvZiB0aGUgcHJlLSBob29rIGluCj4gICBjYXNlIG9mIGEgZmFpbHVyZS4g
VGhlIHN1Y2Nlc3MvZmFpbHVyZSBlcnJvciBjb2RlIGlzIHByb3ZpZGVkIHRvCj4gICB0aGUgcG9z
dC0gaG9va3MgdmlhIHRoZSByYyBmaWVsZCBvZiB0aGUgcGF5bG9hZCBzdHJ1Y3R1cmUuCj4gCj4g
MykgcHJlLXJldmVydCBob29rCj4gICBydW5zIGJlZm9yZSB0aGUgcmV2ZXJ0IGFjdGlvbiBpcyBz
Y2hlZHVsZWQgZm9yIGV4ZWN1dGlvbi4gSXRzIG1haW4KPiAgIHB1cnBvc2UgaXMgdG8gcHJldmVu
dCBmcm9tIHJldmVydGluZyBhIGxpdmVwYXRjaCB3aGVuIGNlcnRhaW4KPiAgIGV4cGVjdGVkIGNv
bmRpdGlvbnMgYXJlbid0IG1ldCBvciB3aGVuIG11dGF0aW5nIGFjdGlvbnMgaW1wbGVtZW50ZWQK
PiAgIGluIHRoZSBob29rIGZhaWwgb3IgY2Fubm90IGJlIGV4ZWN1dGVkLgo+IAo+IDQpIHBvc3Qt
cmV2ZXJ0IGhvb2sKPiAgIHJ1bnMgYWZ0ZXIgdGhlIHJldmVydCBhY3Rpb24gaGFzIGJlZW4gZXhl
Y3V0ZWQgYW5kIHF1aWVzY2luZyB6b25lCj4gICBleGl0ZWQuIEl0cyBtYWluIHB1cnBvc2UgaXMg
dG8gcGVyZm9ybSBjbGVhbnVwIG9mIGFsbCBwcmV2aW91c2x5Cj4gICBleGVjdXRlZCBtdXRhdGlu
ZyBhY3Rpb25zIGluIG9yZGVyIHRvIHJlc3RvcmUgdGhlIG9yaWdpbmFsIHN5c3RlbQo+ICAgc3Rh
dGUgZnJvbSBiZWZvcmUgdGhlIGN1cnJlbnQgbW9kdWxlIGFwcGxpY2F0aW9uLgo+ICAgVGhlIHN1
Y2Nlc3MvZmFpbHVyZSBlcnJvciBjb2RlIGlzIHByb3ZpZGVkIHRvIHRoZSBwb3N0LSBob29rcyB2
aWEKPiAgIHRoZSByYyBmaWVsZCBvZiB0aGUgcGF5bG9hZCBzdHJ1Y3R1cmUuCj4gCj4gVGhlIHJl
cGxhY2UgYWN0aW9uIHBlcmZvcm1zIGF0b21pY2FsbHkgdGhlIGZvbGxvd2luZyBhY3Rpb25zOgo+
IC0gcmV2ZXJ0IGFsbCBhcHBsaWVkIG1vZHVsZXMKPiAtIGFwcGx5IGEgc2luZ2xlIHJlcGxhY2Vt
ZW50IG1vZHVsZS4KPiBXaXRoIHRoZSB2ZXRvaW5nIGhvb2tzIGluIHBsYWNlIHZhcmlvdXMgaW50
ZXItaG9vayBkZXBlbmRlbmNpZXMgbWF5Cj4gYXJpc2UuIEFsc28sIGR1cmluZyB0aGUgcmV2ZXJ0
IHBhcnQgb2YgdGhlIG9wZXJhdGlvbiBjZXJ0YWluIHZldG9pbmcKPiBob29rcyBtYXkgZGV0ZWN0
IGZhaWxpbmcgY29uZGl0aW9ucyB0aGF0IHByZXZpb3VzbHkgd2VyZSBzYXRpc2ZpZWQuCj4gVGhh
dCBjb3VsZCBpbiB0dXJuIGxlYWQgdG8gc2l0dWF0aW9uIHdoZW4gdGhlIHJldmVydCBwYXJ0IG11
c3QgYmUKPiByb2xsZWQgYmFjayB3aXRoIGFsbCB0aGUgcHJlLSBhbmQgcG9zdC0gaG9va3MgcmUt
YXBwbGllZCwgd2hpY2ggYWdhaW4KPiBjYW4ndCBiZSBndWFyYW50ZWVkIHRvIGFsd2F5cyBzdWNj
ZWVkLgo+IFRoZSBzaW1wbGVzdCByZXNwb25zZSB0byB0aGlzIGNvbXBsaWNhdGlvbiBpcyB0byBk
aXNhbGxvdyB0aGUgcmVwbGFjZQo+IGFjdGlvbiBjb21wbGV0ZWx5IG9uIG1vZHVsZXMgd2l0aCB2
ZXRvaW5nIGhvb2tzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3
aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxh
bmRyYXByc0BhbWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBQZXRyZSBFZnRpbWUgPGVwZXRyZUBh
bWF6b24uY29tPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9u
LmRlPgo+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
PiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
