Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FC4DE8DE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 12:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMUQg-0001hX-Fb; Mon, 21 Oct 2019 09:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMUQe-0001f5-Ng
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 09:56:44 +0000
X-Inumbo-ID: 1613241c-f3e9-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1613241c-f3e9-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 09:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571651803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kwYwC1Ok5w1rLnE1mI+U/6qeTM4P+4GrTCucFrkFs9o=;
 b=VW1MIku3G+Q8zjTV2QLAWS+g/AOz3N7TWkBaBq5F50ng/F7Mub4ubCVS
 I8rc3m9h4LVYfIbQGvrTed+ogtHqTUmJ8gA6HzHwrvK4K/eJAdirV5tqI
 JT7ELJfb2S+ZwuyhVF0Tg9K70GdFiYd0iIUIIgxbPrhF3olE2NTALpRrL M=;
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
IronPort-SDR: QSkCnanQ6usCDNfmmRZytgfawaRxMoQXPdrsA7UMTejyNIRCCCTBa/o51MZzFjMFdIi2PsBE5I
 +e26j+clEbQCtwrjooe5A3474q4ejAZ76BL21q5BUQwyObcB+/OytbMLosNR8xKCxedTeABt2S
 tHvhMrDogjG2E+JcyOk6gFVzLyo3Cw0fL1nCjx4/XFQYNxLi/46EJfNLbIF9ZZtFjqzvaf+fDq
 +5GCMSDPScPfHB8eWLOOqAQyQlWXpzdAg9OyTXWcWioj2ey3sl10eP/rvAlvP4btAyRRAPl9Fg
 hQ0=
X-SBRS: 2.7
X-MesageID: 7484234
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7484234"
Date: Mon, 21 Oct 2019 11:56:36 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191021095636.GF17494@Air-de-Roger>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-8-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930150044.5734-8-liuwe@microsoft.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-next v2 7/9] x86: switch xen
 implementation to use hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDQ6MDA6NDFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUYWtlIHRoZSBjaGFuY2UgdG8gY2hhbmdlIHByb2JlX2h5cGVydmlzb3IgdG8gaHlwZXJ2aXNv
cl9wcm9iZS4KClRoZSBpbXBsZW1lbnRhdGlvbiBMR1RNLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2aXNvci5jICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIHhl
bi9hcmNoL3g4Ni9ndWVzdC94ZW4vcHZoLWJvb3QuYyB8ICAyICstCj4gIHhlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4veGVuLmMgICAgICB8IDI2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIHhl
bi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICB8ICAyICstCj4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QveGVuLmggICB8ICA2ICsrKystLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDQ5IGlu
c2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+
IGluZGV4IDg5YjlhZTRkZTAuLjMwNDUzYjZhN2EgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydmlzb3IuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29y
LmMKPiBAQCAtMjIsNyArMjIsNyBAQAo+ICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+Cj4gIAo+ICAj
aW5jbHVkZSA8YXNtL2NhY2hlLmg+Cj4gLSNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5o
Pgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gIAo+ICBzdGF0aWMgc3RydWN0IGh5cGVydmlz
b3Jfb3BzICpob3BzIF9fcmVhZF9tb3N0bHk7Cj4gIAo+IEBAIC0zMSw3ICszMSwzNCBAQCBib29s
IGh5cGVydmlzb3JfcHJvYmUodm9pZCkKPiAgICAgIGlmICggaG9wcyApCj4gICAgICAgICAgcmV0
dXJuIHRydWU7Cj4gIAo+IC0gICAgcmV0dXJuIGZhbHNlOwo+ICsgICAgLyogVG9vIGVhcmx5IHRv
IHVzZSBjcHVfaGFzX2h5cGVydmlzb3IgKi8KPiArICAgIGlmICggIShjcHVpZF9lY3goMSkgJiBj
cHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUikpICkKPiArICAgICAgICByZXR1cm4g
ZmFsc2U7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX1hFTl9HVUVTVAo+ICsgICAgaWYgKCB4ZW5fcHJv
YmUoKSApCj4gKyAgICAgICAgaG9wcyA9ICZ4ZW5faHlwZXJ2aXNvcl9vcHM7Cj4gKyNlbmRpZgoK
SSB0aGluayB5b3UgbGlrZWx5IHdhbnQgc29tZXRoaW5nIGxpa2U6CgogICAgaWYgKCB4ZW5fcHJv
YmUoKSApCiAgICB7CiAgICAgICAgaG9wcyA9ICZ4ZW5faHlwZXJ2aXNvcl9vcHM7CglyZXR1cm4g
dHJ1ZTsKICAgIH0KICAgIGlmICggaHlwZXJ2X3Byb2JlKCkgKQogICAgewogICAgICAgIC4uLi4K
CXJldHVybiB0cnVlOwogICAgfQoKICAgIHJldHVybiBmYWxzZTsKCkluIG9yZGVyIHRvIHJldHVy
biBhZnRlciBhIHN1Y2Nlc3NmdWwgcHJvYmUsIG9yIGVsc2UgeW91IGxvc2UgY3ljbGVzCnByb2Jp
bmcgZm9yIGh5cGVydmlzb3JzIHdoZW4gYSBtYXRjaCBoYXMgYmVlbiBmb3VuZCwgYW5kIGFsc28g
aW4gdGhlClhlbiBjYXNlIHlvdSByaXNrIGRldGVjdGluZyB0aGUgSHlwZXJWIHN1cHBvcnQgaW4g
WGVuIGFuZCB0aHVzIHVzaW5nCnRoYXQgaW5zdGVhZCBvZiB0aGUgWGVuIG9uZS4KCkxvbmcgdGVy
bSBpZiB3ZSBnYWluIG1vcmUgZ3Vlc3RzIHN1cHBvcnQgSSB3b3VsZCBsaWtlbHkgd2FudCB0byBz
ZWUKaHlwZXJ2aXNvcl9vcHMgdHVybmluZyBpbnRvIGFuIGFycmF5IGFuZCBnYWluaW5nIGEgcHJv
YmUgZnVuY3Rpb24gc28KdGhhdCB0aGlzIGNhbiBiZSBkb25lIGluIGEgbG9vcCBpbnN0ZWFkIG9m
IGhhdmluZyB0aGlzIGZ1bmN0aW9uLgoKPiArCj4gKyAgICByZXR1cm4gISFob3BzOwo+ICt9Cj4g
Kwo+ICt2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKPiArewo+ICsgICAgaWYgKCBob3BzICYm
IGhvcHMtPnNldHVwICkKPiArICAgICAgICBob3BzLT5zZXR1cCgpOwo+ICt9Cj4gKwo+ICt2b2lk
IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKPiArewo+ICsgICAgaWYgKCBob3BzICYmIGhvcHMt
PmFwX3NldHVwICkKPiArICAgICAgICBob3BzLT5hcF9zZXR1cCgpOwo+ICt9Cj4gKwo+ICt2b2lk
IGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpCj4gK3sKPiArICAgIGlmICggaG9wcyAmJiBob3BzLT5y
ZXN1bWUgKQo+ICsgICAgICAgIGhvcHMtPnJlc3VtZSgpOwo+ICB9Cj4gIAo+ICAvKgo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QveGVuL3B2aC1ib290LmMKPiBpbmRleCBjYThlMTU2ZjdkLi40OTg2MjVlYWUwIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vcHZoLWJvb3QuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4vcHZoLWJvb3QuYwo+IEBAIC0xMDMsNyArMTAzLDcgQEAgdm9pZCBf
X2luaXQgcHZoX2luaXQobXVsdGlib290X2luZm9fdCAqKm1iaSwgbW9kdWxlX3QgKiptb2QpCj4g
IHsKPiAgICAgIGNvbnZlcnRfcHZoX2luZm8obWJpLCBtb2QpOwo+ICAKPiAtICAgIHByb2JlX2h5
cGVydmlzb3IoKTsKPiArICAgIGh5cGVydmlzb3JfcHJvYmUoKTsKPiAgICAgIEFTU0VSVCh4ZW5f
Z3Vlc3QpOwo+ICAKPiAgICAgIGdldF9tZW1vcnlfbWFwKCk7Cj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCj4g
aW5kZXggOTg5NTAyNWQwMi4uYTlkMzIxZTVlYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QveGVuL3hlbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+IEBA
IC02NywyNCArNjcsMTkgQEAgc3RhdGljIHZvaWQgX19pbml0IGZpbmRfeGVuX2xlYXZlcyh2b2lk
KQo+ICAgICAgfQo+ICB9Cj4gIAo+IC12b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZvaWQp
Cj4gK2Jvb2wgX19pbml0IHhlbl9wcm9iZSh2b2lkKQo+ICB7Cj4gLSAgICBpZiAoIHhlbl9ndWVz
dCApCj4gLSAgICAgICAgcmV0dXJuOwo+IC0KPiAtICAgIC8qIFRvbyBlYXJseSB0byB1c2UgY3B1
X2hhc19oeXBlcnZpc29yICovCj4gLSAgICBpZiAoICEoY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9t
YXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSApCj4gLSAgICAgICAgcmV0dXJuOwo+IC0KPiAg
ICAgIGZpbmRfeGVuX2xlYXZlcygpOwo+ICAKPiAgICAgIGlmICggIXhlbl9jcHVpZF9iYXNlICkK
PiAtICAgICAgICByZXR1cm47Cj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAKPiAgICAgIC8q
IEZpbGwgdGhlIGh5cGVyY2FsbCBwYWdlLiAqLwo+ICAgICAgd3Jtc3JsKGNwdWlkX2VieCh4ZW5f
Y3B1aWRfYmFzZSArIDIpLCBfX3BhKGh5cGVyY2FsbF9wYWdlKSk7Cj4gIAo+ICAgICAgeGVuX2d1
ZXN0ID0gdHJ1ZTsKPiArCj4gKyAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+ICAKPiAgc3RhdGljIHZv
aWQgbWFwX3NoYXJlZF9pbmZvKHZvaWQpCj4gQEAgLTI0OSw3ICsyNDQsNyBAQCBzdGF0aWMgdm9p
ZCBpbml0X2V2dGNobih2b2lkKQo+ICAgICAgfQo+ICB9Cj4gIAo+IC12b2lkIF9faW5pdCBoeXBl
cnZpc29yX3NldHVwKHZvaWQpCj4gK3ZvaWQgX19pbml0IHhlbl9zZXR1cCh2b2lkKQo+ICB7Cj4g
ICAgICBpbml0X21lbW1hcCgpOwo+ICAKPiBAQCAtMjc3LDcgKzI3Miw3IEBAIHZvaWQgX19pbml0
IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKPiAgICAgIGluaXRfZXZ0Y2huKCk7Cj4gIH0KPiAgCj4g
LXZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKQo+ICt2b2lkIHhlbl9hcF9zZXR1cCh2b2lk
KQo+ICB7Cj4gICAgICBzZXRfdmNwdV9pZCgpOwo+ICAgICAgbWFwX3ZjcHVpbmZvKCk7Cj4gQEAg
LTMwNyw3ICszMDIsNyBAQCBzdGF0aWMgdm9pZCBhcF9yZXN1bWUodm9pZCAqdW51c2VkKQo+ICAg
ICAgaW5pdF9ldnRjaG4oKTsKPiAgfQo+ICAKPiAtdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lk
KQo+ICt2b2lkIHhlbl9yZXN1bWUodm9pZCkKCkkgdGhpbmsgeGVuX3tzZXR1cC9hcF9zZXR1cC9y
ZXN1bWV9IGNhbiBiZSBtYWRlIHN0YXRpYyBub3c/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
