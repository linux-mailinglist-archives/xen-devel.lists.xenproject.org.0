Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5E123392
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 18:31:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihGdo-00074F-Od; Tue, 17 Dec 2019 17:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6+kf=2H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ihGdn-000745-3d
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 17:28:11 +0000
X-Inumbo-ID: 9771efb2-20f2-11ea-8f2d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9771efb2-20f2-11ea-8f2d-12813bfff9fa;
 Tue, 17 Dec 2019 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576603688;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eOlUoiOywPs2/wsTw9Q+HIXibIn72EuBMoImACpjnUc=;
 b=UlQU54E71XHlrAPAQYs9m1BkRznECqIzXqDXfOknXrOHZUMTgCjtaCZY
 MbtJoT2Pe8c+iHWVW8pTdo2bG1+rLRhO3+YXLGaN+5kDRXNwjel2VDwxP
 W79WnTZwXkegse0SN14QXql6ifDXaHkCnnDBKCEM+gGotS5t3bGwbwAqh U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LgB2LBXTogiYjpcXO839ZVLujL/9KgcFQgjWzvHsPucrI+7Xk197FTBN+FwHRRlWi4SqqOWZx5
 y6/9CkcGZv2YKd3jNzihp3X5UHag5weFaG66XyqqIvEjvvyIQ94k6/Yho6G9KJICTJoUrHkGIh
 JI2xNHymdFm0ZjkPEKu2+CMbXX30EOPrU12ZRdL2OUgYOufEe/cKVhQJai1tz6Fqf/fFo9RAhy
 U+UQOml9f0l61Cnwqi3Lk8eCcN03gxINiA27c9OuU/r44ZLIPWrOvJZevhd1UnY3qXMEJtiYww
 j7g=
X-SBRS: 2.7
X-MesageID: 10243626
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,326,1571716800"; d="scan'208";a="10243626"
To: Nick Rosbrook <rosbrookn@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
 <8330ea427861ef6c5d3b20d381bf40e87937d448.1575990937.git.rosbrookn@ainfosec.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <5b92c6b7-e515-0eae-8722-de91cfade9b7@citrix.com>
Date: Tue, 17 Dec 2019 17:28:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8330ea427861ef6c5d3b20d381bf40e87937d448.1575990937.git.rosbrookn@ainfosec.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 21/22] golang/xenlight: revise use of
 Context type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTAvMTkgMzo0NyBQTSwgTmljayBSb3Nicm9vayB3cm90ZToKPiBGcm9tOiBOaWNrIFJv
c2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgo+IAo+IFJlbW92ZSB0aGUgZXhwb3J0ZWQg
Z2xvYmFsIGNvbnRleHQgdmFyaWFibGUsICdDdHguJyBHZW5lcmFsbHksIGl0IGlzCj4gYmV0dGVy
IHRvIG5vdCBleHBvcnQgZ2xvYmFsIHZhcmlhYmxlcyBmb3IgdXNlIHRocm91Z2ggYSBHbyBwYWNr
YWdlLgo+IEhvd2V2ZXIsIHRoZXJlIGFyZSBzb21lIGV4Y2VwdGlvbnMgdGhhdCBjYW4gYmUgZm91
bmQgaW4gdGhlIHN0YW5kYXJkCj4gbGlicmFyeS4KPiAKPiBBZGQgYSBOZXdDb250ZXh0IGZ1bmN0
aW9uIGluc3RlYWQsIGFuZCByZW1vdmUgdGhlIE9wZW4sIElzT3BlbiwgYW5kCj4gQ2hlY2tPcGVu
IGZ1bmN0aW9ucyBhcyBhIHJlc3VsdC4KPiAKPiBBbHNvLCBjb21tZW50LW91dCBhbiBpbmVmZmVj
dHVhbCBhc3NpZ25tZW50IHRvICdlcnInIGluc2lkZSB0aGUgZnVuY3Rpb24KPiBDb250ZXh0LkNw
dXBvb2xJbmZvIHNvIHRoYXQgY29tcGlsYXRpb24gZG9lcyBub3QgZmFpbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgoKUmV2aWV3ZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCldpdGggb25lIHJl
cXVlc3RlZCBjaGFuZ2UuLi4KCj4gLS0tCj4gIHRvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbyB8IDIxOSArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDM0IGluc2VydGlvbnMoKyksIDE4NSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvCj4gaW5kZXggZjMyZWIxMTM4NC4uMWM0MzFmYTRlNSAxMDA2NDQKPiAtLS0g
YS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KPiArKysgYi90b29scy9nb2xhbmcv
eGVubGlnaHQveGVubGlnaHQuZ28KPiBAQCAtNzQsNiArNzQsMzkgQEAgZnVuYyAoZSBFcnJvcikg
RXJyb3IoKSBzdHJpbmcgewo+ICAJcmV0dXJuIGZtdC5TcHJpbnRmKCJsaWJ4bCBlcnJvcjogJWQi
LCAtZSkKPiAgfQo+ICAKPiArLy8gQ29udGV4dCByZXByZXNlbnRzIGEgbGlieGxfY3R4Lgo+ICt0
eXBlIENvbnRleHQgc3RydWN0IHsKPiArCWN0eCAgICAqQy5saWJ4bF9jdHgKPiArCWxvZ2dlciAq
Qy54ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVhbQo+ICt9Cj4gKwo+ICsvLyBOZXdDb250ZXh0
IHJldHVybnMgYSBuZXcgQ29udGV4dC4KPiArZnVuYyBOZXdDb250ZXh0KCkgKCpDb250ZXh0LCBl
cnJvcikgewo+ICsJdmFyIGN0eCBDb250ZXh0Cj4gKwo+ICsJY3R4LmxvZ2dlciA9IEMueHRsX2Ny
ZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShDLnN0ZGVyciwgQy5YVExfRVJST1IsIDApCj4gKwo+ICsJ
cmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZjdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04sIDAsICgq
Qy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikpKQoKVGhpcyBs
aW5lIGxvb2tzIHRvIGJlIDExNCBjaGFyYWN0ZXJzIGxvbmcsIHdoaWNoIHNlZW1zIGEgYml0IG11
Y2guIDotKQpNaW5kIGJyZWFraW5nIGl0IGp1c3QgYmVmb3JlIHRoZSBsYXN0IGFyZ3VtZW50PwoK
VGhhbmtzLAogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
