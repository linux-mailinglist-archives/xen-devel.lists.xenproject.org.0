Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CEBCB5B4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:07:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGIZG-0004ra-Fk; Fri, 04 Oct 2019 08:04:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihSl=X5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iGIZE-0004rQ-H9
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 08:04:00 +0000
X-Inumbo-ID: 818768b2-e67d-11e9-9745-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 818768b2-e67d-11e9-9745-12813bfff9fa;
 Fri, 04 Oct 2019 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570176233;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZHEg1W+lzQLY9TIrsErtXgNWugXy7tmhI7xu59ay0OU=;
 b=f/7q/uetxePWgP1FDUX3xNJC1sinvuqMEg4oY7nZsO4OyPaBwsu5GheI
 hd6QIvbabKNIBowQlVsHtcx3irF6y9ZHxAOBvwePzkc9YkGdil6E8oDcD
 2w1uXYBX0rVrcNqiZqCH8ZpYg0E7uoq//XviE2r9cl51Z5+GDlFT/vECG 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 41t2kXXGPzXqwZgI6epXT3CQbIapgswl1LxedoNE+3uebOs966iGFv8LbQq6eJ9r7aFZ26RNEI
 ovfHslUN++97b+OEJK3AxHi7GGKf8zHwOrO5dInxV2pEwfNuiuL5rJIu+oO35o6pPVKKkoxEjG
 Nz2Cu3uYF+/vlZIXdTKLnoQdfJOiUCLPhvZsZIpTM8rr0T1KRQTkqyBFi8ia0Ip2CAZQg87moe
 +ZZ/Z2ry/Rm95JtahDkurvKtFtG0e4HVT+/nnRcxHQOjmfgKv1sn1sFLjXsTP2m1549ssxbgd9
 Wp4=
X-SBRS: 2.7
X-MesageID: 6760202
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,255,1566878400"; 
   d="scan'208";a="6760202"
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
References: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <58ab6e11-e87c-58e1-2474-db07eee750aa@citrix.com>
Date: Fri, 4 Oct 2019 09:03:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTAvMjAxOSAxNzoxMiwgTGFycyBLdXJ0aCB3cm90ZToKPiBTcGVjaWZpY2FsbHkKPiAq
IHhlbi5vcmcgdG8geGVucHJvamVjdC5vcmcKPiAqIGh0dHAgdG8gaHR0cHMKPiAqIFJlcGxhY2Vk
IHBhZ2VzIHdoZXJlIHBhZ2UgaGFzIG1vdmVkCj4gICAoaW5jbHVkaW5nIG9uIHhlbiBwYWdlcyBh
cyB3ZWxsIGFzIGV4dGVybmFsIHBhZ2VzKQo+ICogUmVtb3ZlZCBzb21lIFVSTHMgKGUuZy4gZG93
bmxvYWRzIGZvciBMaW51eCBQViBkcml2ZXJzKQo+Cj4gVGVzdGVkLWJ5OiBMYXJzIEt1cnRoIDxs
YXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPgo+IC0tLQo+ICBkb2NzL21hbi94ZW4tcGNpLWRldmljZS1yZXNlcnZh
dGlvbnMuNy5wb2QgfCAgMiArLQo+ICBkb2NzL21hbi94ZW4tcHYtY2hhbm5lbC43LnBvZCAgICAg
ICAgICAgICAgfCAgMiArLQo+ICBkb2NzL21hbi94ZW4tdnRwbS43LnBvZCAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBkb2NzL21hbi94ZW5zdG9yZS1jaG1vZC4xLnBvZCAgICAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRvY3MvbWFuL3hlbnN0b3JlLWxzLjEucG9kICAgICAgICAgICAgICAg
ICB8ICA0ICsrLS0KPiAgZG9jcy9tYW4veGVuc3RvcmUtcmVhZC4xLnBvZCAgICAgICAgICAgICAg
IHwgIDQgKystLQo+ICBkb2NzL21hbi94ZW5zdG9yZS13cml0ZS4xLnBvZCAgICAgICAgICAgICAg
fCAgNCArKy0tCj4gIGRvY3MvbWFuL3hlbnN0b3JlLjEucG9kICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0KPiAgZG9jcy9tYW4veGVudG9wLjEucG9kICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KPiAgZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kICAgICAgIHwgIDQg
KystLQo+ICBkb2NzL21hbi94bC1uZXR3b3JrLWNvbmZpZ3VyYXRpb24uNS5wb2QgICAgfCAgOCAr
KysrLS0tLQo+ICBkb2NzL21hbi94bC1udW1hLXBsYWNlbWVudC43LnBvZCAgICAgICAgICAgfCAg
NCArKy0tCj4gIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgICAgICAgICAgICAgICAgICB8IDIy
ICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAg
ICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KPiAgZG9jcy9tYW4veGwuY29u
Zi41LnBvZCAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkb2NzL21hbi94bGNwdXBv
b2wuY2ZnLjUucG9kICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIDE2IGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3Mv
bWFuL3hlbi1wY2ktZGV2aWNlLXJlc2VydmF0aW9ucy43LnBvZCBiL2RvY3MvbWFuL3hlbi1wY2kt
ZGV2aWNlLXJlc2VydmF0aW9ucy43LnBvZAo+IGluZGV4IDBkZjQxYmNkMjkuLmJjNzM5ODQwOWMg
MTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9k
Cj4gKysrIGIvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9kCj4gQEAg
LTI5LDcgKzI5LDcgQEAgbXVsdGlwbGUgWGVuIHZlbmRvcnMgdXNpbmcgY29uZmxpY3RpbmcgSURz
Lgo+ICAKPiAgPWl0ZW0gMy4gVGhlIHZlbmRvciBpcyByZXNwb25zaWJsZSBmb3IgYWxsb2NhdGlv
bnMgd2l0aGluIHRoZSByYW5nZSBhbmQgc2hvdWxkCj4gICAgICAgICAgIHRyeSB0byByZWNvcmQg
c3BlY2lmaWMgZGV2aWNlIElEcyBpbiBQQ0kgSUQgZGF0YWJhc2VzIHN1Y2ggYXMKPiAtICAgICAg
ICAgaHR0cDovL3BjaWlkcy5zb3VyY2Vmb3JnZS5uZXQgYW5kIGh0dHAvL3d3dy5wY2lkYXRhYmFz
ZS5jb20KPiArICAgICAgICAgaHR0cDovL3BjaS1pZHMudWN3LmN6IGFuZCBodHRwczovL2Rldmlj
ZWh1bnQuY29tCgpodHRwcyA/CgpPdGhlcndpc2UsIExHVE0uwqAgQWNrZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
