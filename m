Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37188BDB6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:51:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxZ1F-0001lp-Cp; Tue, 13 Aug 2019 15:47:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxZ1E-0001li-Sm
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:47:28 +0000
X-Inumbo-ID: a6692dce-bde1-11e9-9377-7f42f5a43f62
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6692dce-bde1-11e9-9377-7f42f5a43f62;
 Tue, 13 Aug 2019 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565711247;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K4RZgutZAdTm+oJMYRZOC0in1RJYGSwpmGVerpAt+eQ=;
 b=P4MmGTnJIuooCjmEfOWIq21BhFwff/0p/av8XBNdeORS7v9JluTSceX6
 L76PCkCnAAcYL3wQP/Ev5QeHwNr4wPzexi1fDBbF8aP1hJTKk//af3cs5
 Go2YoR2wi8Sr9PFrja8synew9cLKuPrzFtMlhmfGMpyoLdQiAMk86Q9IQ M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fyvkVVkEVY1w/pLVqjiWa1ebTC78yp6bhgn1VGexh3xamm0FRbi6TMNjpxxXn6aOC05lOEbOCE
 S2SlQMmQb2Fx35DBEriwa9oNrp5KU+KlKriFcakg+AWlaDfXZxm9GCSvdmg94gYXLhKg12Zsje
 M8i8RKlPNrqJcU7lGlQkfyzA0T4TkCeGljsbievh2C177ocIK2ImAYj2uqzt0TlBKA92+4Ls8+
 1ULFVLwnVAzogAtlBfeahljM/VxogIc0KPiCjaj2F453UXqie/eGYNWVx4DgLWh9fvf6s7kX7D
 Q8o=
X-SBRS: 2.7
X-MesageID: 4417685
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,382,1559534400"; 
   d="scan'208";a="4417685"
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
Date: Tue, 13 Aug 2019 16:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813153020.GC1289@perard.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDgvMjAxOSAxNjozMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVHVlLCBBdWcg
MTMsIDIwMTkgYXQgMDQ6MDY6MzNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MTMvMDgvMjAxOSAxNTo0OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+PiBIYW5kbGUgKz0gb2Yg
Ym90aCBzdHJpbmdzIGFuZCBsaXN0cy4KPj4+Cj4+PiBJZiArPSBpcyB1c2VkIGZvciBjb25maWcg
b3B0aW9ucyBleHBlY3RlZCB0byBiZSBudW1iZXJzLCB0aGVuIGEKPj4+IHdhcm5pbmcgaXMgcHJp
bnRlZCBhbmQgdGhlIGNvbmZpZyBvcHRpb24gaWdub3JlZCAoYmVjYXVzZSB4bCBpZ25vcmVzCj4+
PiBjb25maWcgb3B0aW9ucyB3aXRoIGVycm9ycykuCj4+Pgo+Pj4gVGhpcyBpcyB0byBiZSB1c2Vk
IGZvciBkZXZlbG9wbWVudCBwdXJwb3Nlcywgd2hlcmUgbW9kaWZ5aW5nIGNvbmZpZwo+Pj4gb3B0
aW9uIGNhbiBiZSBkb25lIG9uIHRoZSBgeGwgY3JlYXRlJyBjb21tYW5kIGxpbmUuCj4+Pgo+Pj4g
T25lIGNvdWxkIGhhdmUgYSBjbWRsaW5lPSBpbiB0aGUgY2ZnIGZpbGUsIGFuZCBzcGVjaWZ5IGNt
ZGxpbmUrPSBvbgo+Pj4gdGhlIGB4bCBjcmVhdGVgIGNvbW1hbmQgbGluZSB3aXRob3V0IHRoZSBu
ZWVkIHRvIHdyaXRlIHRoZSB3aG9sZQo+Pj4gY21kbGluZSBpbiBgeGwnIGNvbW1hbmQgbGluZSBi
dXQgc2ltcGx5IGFwcGVuZCB0byB0aGUgb25lIGluIHRoZSBjZmcgZmlsZS4KPj4+IE9yIGFkZCBh
biBleHRyYSB2aWYgb3IgZGlzayBieSBzaW1wbHkgaGF2aW5nICJ2aWYgKz0gWyAnJywgXTsiIGlu
IHRoZQo+Pj4gYHhsJyBjbWRsaW5lLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gTm90ZXM6Cj4+
PiAgICAgQ29tbWl0ZXIsIHRoZSBsaWJ4bHVfY2ZnXz8uW2hjXSBmaWxlcyBuZWVkcyB0byBiZSBy
ZWdlbmVyYXRlZC4gKHdpdGggbWFrZSkKPj4+ICAgICAKPj4+ICAgICBUaGlzIGlzIGEgZGlmZmVy
ZW50IHByb3Bvc2FsIHRvIEFuZHJldydzIHBhdGNoOgo+Pj4gICAgIDwyMDE5MDgwNTE0NDkxMC4y
MDIyMy0xLWFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiAgICAgW1BBVENIXSB0b29scy94
bDogTWFrZSBleHRyYT0gdXNhYmxlIGluIGNvbWJpbmF0aW9uIHdpdGggY21kbGluZT0KPj4gSSBn
YXZlIHRoaXMgYSBzcGluLCBidXQgZ290Ogo+Pgo+PiBbcm9vdEBmdXNlYm90IH5dIyAuL3hscGx1
cyBjcmVhdGUgc2hpbS5jZmcKPj4gcmFtZGlzaz1cIi9yb290L3Rlc3RzL3NlbGZ0ZXN0L3Rlc3Qt
aHZtNjQtc2VsZnRlc3RcIgo+PiBjbWRsaW5lKz1cImRvbTA9cHZoXCBkb20wLWlvbW11PW5vbmVc
Igo+PiBQYXJzaW5nIGNvbmZpZyBmcm9tIHNoaW0uY2ZnCj4+IHNoaW0uY2ZnOjE5OiBjb25maWcg
cGFyc2luZyBlcnJvciBuZWFyIGArPSJkb20wPXB2aCc6IGxleGljYWwgZXJyb3IKPj4gd2Fybmlu
ZzogQ29uZmlnIGZpbGUgbG9va3MgbGlrZSBpdCBjb250YWlucyBQeXRob24gY29kZS4KPj4gd2Fy
bmluZzrCoCBBcmJpdHJhcnkgUHl0aG9uIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuCj4+IHdhcm5p
bmc6wqAgU2VlIGh0dHA6Ly93aWtpLnhlbi5vcmcvd2lraS9QeXRob25JblhsQ29uZmlnCj4+IEZh
aWxlZCB0byBwYXJzZSBjb25maWc6IEludmFsaWQgYXJndW1lbnQKPiBFaXRoZXIgb2xkZXIgdmVy
c2lvbiBvZiBgZmxleCcgYmVoYXZlIGRpZmZlcmVudGx5LCBvciB5b3UgZG9uJ3QgaGF2ZSBpdAo+
IGluc3RhbGxlZCBvbiB5b3VyIHN5c3RlbS4gYG1ha2UnIHNlZW1zIHRvIG9ubHkgcHJpbnQgYSB3
YXJuaW5nIGlmCj4gYGZsZXgnIGlzIG1pc3NpbmcuCj4KPiBBbHNvLCBJJ3ZlIG9ubHkgZG9uZSBj
b25jYXRlbmF0aW9uIG9mIHN0cmluZywgKz0gZG9lc24ndCBhZGQgYSAnICcgaW4KPiBiZXR3ZWVu
LiBTbyBmb3IgY21kbGluZSwgaXQgd291bGQgbmVlZHMgdG8gYmUgY21kbGluZSs9XCJcIGRvbTA9
cHZoXCIuCgpFcnJvciBiZXR3ZWVuIHVzZXIgYW5kIHRlcm1pbmFsLiA6KQoKSSdkIHN5bmMnZCB4
bCBhbmQgbGlieGwuc28sIGJ1dCBub3QgbGlieGx1LnNvCgpPaywgc28gdGhhdCBpcyB3b3JraW5n
IG5vdy7CoCBJIHRoaW5rICdjbWRsaW5lKz0iIGRvbTA9cHZoCmRvbTAtaW9tbXU9bm9uZSInIGlz
IHNsaWdodGx5IGxlc3MgdG9ydHVyZWQgc3ludGF4LCBidXQgSSBndWVzcyB0aGVyZSBpcwpubyB3
YXkgdGhhdCB0aGlzIGlzbid0IGdvaW5nIHRvIGJlIGhvcnJpYmxlLgoKQXMgZm9yIHRoZSBnZW5l
cmFsIG1lY2hhbmlzbSwgaG93IHVzYWJsZSBpcyArPSBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbgpj
bWRsaW5lP8KgIE1vc3Qgc3RyaW5ncyBpbiBjb25maWcgZmlsZXMgY2FuJ3QgdXNlZnVsbHkgYmUg
ZXh0ZW5kZWQgaW4KdGhpcyBtYXR0ZXIgLSBpZiB0aGV5IG5lZWQgY2hhbmdpbmcsIHRoZXkgbmVl
ZCBjaGFuZ2luZyB3aG9sZXNhbGUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
