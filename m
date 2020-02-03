Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F113150B6B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:27:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeWw-0000o6-Cn; Mon, 03 Feb 2020 16:24:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=maG7=3X=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iyeWu-0000nu-26
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:24:56 +0000
X-Inumbo-ID: b619d9c9-46a1-11ea-8e75-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b619d9c9-46a1-11ea-8e75-12813bfff9fa;
 Mon, 03 Feb 2020 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580747095;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GVkZJFgAV+qYxHrmUVCHEn62UPKwZb+BCotEqcR4TOs=;
 b=V49fo5fAjgByi3sy1rjBRm7eb7xzOx0GPFIgONnQEV9FlqjE9+ia/Mg6
 RjBDOvwB1uaezImLAJ3+J/PW22vybwVItgvy+pblamUP78rRcynIs3h0t
 ULdSSSGZaPWZYfFX1Ihiiynqqj6wph1gVyto2Bjt+nInQbAMY9Au6aiL9 0=;
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
IronPort-SDR: LMPaZwnuDbj1XKe44eVSH4b1fhyC8PN2Ben5u6h+S3AKBaAfWk+XSM2RK4nXKqTugtom+DH9GW
 O1n2jpnpBU9f4gSk4nSeCxk5wA8cLAL2hAhPA9dyavkd6a7MnynuKXH9uiLQlGS6N/Tj4qmxaX
 q4dzzbm0scKMRisLoDIPKGGRzdVSMh+yLM0zcdqWUoJZmscI/YIPi7Z0SU98kD8XcmvxMzO8es
 Bq7cqsvaoskoW6aqtaAfgEHxmNcghVoj3FqQmlIZ9wSN6c5BQnD7+W8ZxPC7l2dx/RXt+1ps18
 SRw=
X-SBRS: 2.7
X-MesageID: 12293065
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12293065"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-2-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <7110ea2f-a067-7399-7994-bd55aec31a78@citrix.com>
Date: Mon, 3 Feb 2020 16:24:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200203144340.4614-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] AMD/IOMMU: Move headers to be local
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8zLzIwIDI6NDMgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gV2UgY3VycmVudGx5IGhh
dmUgYW1kLWlvbW11LWRlZnMuaCwgYW1kLWlvbW11LXByb3RvLmggYW5kIGFtZC1pb21tdS5oLCBh
bmQgbm8KPiByZWZlcmVuY2VzIG91dHNpZGUgb2YgdGhlIEFNRCBJT01NVSBkcml2ZXIuCj4gCj4g
S2VlcCBpb21tdS1kZWZzLmggYXMgaXMsIGJ1dCBtZXJnZSBhbWQtaW9tbXUuaCBhbmQgYW1kLWlv
bW11LXByb3RvLmggdG8ganVzdAo+IGlvbW11LmgsIGFuZCBtb3ZlIHRoZW0gYm90aCBpbnRvIGRy
aXZlcnMvcGFzc3Rocm91Z2gvYW1kLy4gIChXaGlsZSBtZXJnaW5nLAo+IGRyb3AgdGhlIGJvZ3Vz
ICNwcmFnbWEgcGFjayBhcm91bmQgdGhlICpfZW50cnkgc3RydWN0dXJlcy4pCj4gCj4gVGFrZSB0
aGUgb3Bwb3J0dW5pdHkgdG8gdHJpbSB0aGUgaW5jbHVkZSBsaXN0cywgaW5jbHVkaW5nIHg4Ni9t
bS9wMm0uYwo+IHdoaWNoIChBRkFJQ1QpIGhhc24ndCBuZWVkZWQgdGhpcyBpbmNsdWRlIHNpbmNl
IGMvcyBhZWYzZjIyNzUgIng4Ni9tbS9wMm06Cj4gYnJlYWsgaW50byBjb21tb24sIHB0LWltcGxl
bWVudGF0aW9uIGFuZCBwb2QgcGFydHMiIGluIDIwMTEuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IEND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXgu
Y29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSAtCj4gIC4uLi9wYXNzdGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5ofSAgICAg
ICAgICAgICAgICAgIHwgICA2ICstCj4gIC4uLi9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaH0gICAg
ICAgICAgICAgICAgICAgICAgIHwgMTc5ICsrKysrKysrKysrKysrKysrKy0KPiAgeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYyAgICAgICAgICAgfCAgIDcgKy0KPiAgeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2NtZC5jICAgICAgICAgICAgfCAgIDQgKy0K
PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2RldGVjdC5jICAgICAgICAgfCAg
IDcgKy0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMgICAgICAg
ICAgfCAgIDQgKy0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyAg
ICAgICAgICAgfCAgMTMgKy0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2lu
dHIuYyAgICAgICAgICAgfCAgIDkgKy0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X21hcC5jICAgICAgICAgICAgfCAgIDggKy0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL3BjaV9hbWRfaW9tbXUuYyAgICAgICAgfCAgIDkgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4
Ni9hbWQtaW9tbXUuaCAgICAgICAgICAgICAgICAgICAgfCAxOTAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIDEyIGZpbGVzIGNoYW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCAyNDMgZGVsZXRpb25z
KC0pCj4gIHJlbmFtZSB4ZW4ve2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1kZWZz
LmggPT4gZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUtZGVmcy5ofSAoOTklKQo+ICByZW5h
bWUgeGVuL3tpbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaCA9PiBkcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdS5ofSAoNzAlKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9hbWQtaW9tbXUuaAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBpbmRleCBkZWYxM2Y2NTdi
Li5mZDlmMDk1MzZkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC0zOCw3ICszOCw2IEBACj4gICNpbmNsdWRlIDxh
c20vbWVtX3NoYXJpbmcuaD4KPiAgI2luY2x1ZGUgPGFzbS9odm0vbmVzdGVkaHZtLmg+Cj4gICNp
bmNsdWRlIDxhc20vYWx0cDJtLmg+Cj4gLSNpbmNsdWRlIDxhc20vaHZtL3N2bS9hbWQtaW9tbXUt
cHJvdG8uaD4KPiAgI2luY2x1ZGUgPGFzbS92bV9ldmVudC5oPgo+ICAjaW5jbHVkZSA8eHNtL3hz
bS5oPgo+ICAKCnAybSBiaXRzOgoKQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
