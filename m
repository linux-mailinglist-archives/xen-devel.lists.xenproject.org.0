Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA5BDC29
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4Sq-0001Xq-8S; Wed, 25 Sep 2019 10:24:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4Sp-0001Xl-Ac
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:24:03 +0000
X-Inumbo-ID: 977cfdea-df7e-11e9-962f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 977cfdea-df7e-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569407041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IAF8XwROvu7QN0ma3IT0SrwOnWLO0DKojIBbW5eExPU=;
 b=Zc7avxjH0pEczCk0kNZ8DNquSTkY8RVTGoijYQQ+a1vqag8iTF2bXnJ1
 Wk7vE7xb3MAe6uYXB4LVBSfws5xDlJovWQleNIyPyi0o04FNV+GAIV83M
 KVtWJDfrhARgGcND+n6pvEz0HZU/aGNccL8wHWzUb9/t2zsPz0IJ+kHiM Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: REF6+C/5XRIVA/n76s5SkaI9eGOqlOk2v9OYQCilRyreG+Ee0EZ+7TOywWo2aJk7SmVKfCpTJQ
 fri+3bPTWHktXZcXYPVQZIF2Dhp9esv2DFOLWVy5v58PlGc+vA9HHUqfRC9/AXXa12aoK4jMkr
 zWAt2HV3SKBvnOE2fXDnjlfZOOSFZP/JkmivEPYICq1XPJ8Rxy9c+QBmKncB78J2z+A0HYJFyr
 khYDT4ytGGK7s9NR9ao3ChLAi2yAI6MZjpWS40WUzbcqSmYV1Pn6dV49WUgY7uKxmFZwrgA2Wr
 Q40=
X-SBRS: 2.7
X-MesageID: 6311487
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6311487"
Date: Wed, 25 Sep 2019 12:23:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-5-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSB3aWxsIGFkZCBIeXBlci1WIHNwZWNpZmljIGltcGxlbWVudGF0aW9ucyBpbiB0aGUgZnV0
dXJlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
eGVuLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMKPiBpbmRleCA3OGZjNjAzOTk2Li5mOTNjOGZiZDFjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC94ZW4veGVuLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5j
Cj4gQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGZpbmRfeGVuX2xlYXZlcyh2
b2lkKQo+ICAgICAgfQo+ICB9Cj4gIAo+IC12b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZv
aWQpCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBwcm9iZV94ZW4odm9pZCkKCldoaWxlIGhlcmUgSSB3
b3VsZCByZW5hbWUgdG8geGVuX3Byb2JlLCB0byBtYXRjaCB3aXRoIHRoZSBvdGhlcgpmdW5jdGlv
bnMgKGllOiB4ZW5fc2V0dXAgYmVsb3cgZm9yIGV4YW1wbGUpLgoKPiAgewo+ICAgICAgaWYgKCB4
ZW5fZ3Vlc3QgKQo+ICAgICAgICAgIHJldHVybjsKPiBAQCAtODcsNiArODcsMTEgQEAgdm9pZCBf
X2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQo+ICAgICAgeGVuX2d1ZXN0ID0gdHJ1ZTsKPiAg
fQo+ICAKPiArdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQoKU2hvdWxkbid0IHRo
aXMgbGl2ZSBpbiBhIHNlcGFyYXRlIGZpbGUsIGxpa2UgZ3Vlc3QvZ3Vlc3QuYyBvciBzb21lCnN1
Y2g/CgpBbHNvIGl0IG1pZ2h0IGJlIG5pY2UgdG8gaW50cm9kdWNlIHNvbWV0aGluZyBsaWtlOgoK
ZW51bSBndWVzdF90eXBlIHsKICAgIFhFTl9HVUVTVCwKfSBndWVzdF90eXBlOwoKU28gdGhhdCB5
b3UgY2FuIGFkZCBhIHN3aXRjaCBoZXJlLCBldmVuIGlmIHRoZSBvbmx5IGNhc2UgaXMgWGVuIEFU
TS4gSQpndWVzcyB0aGlzIHdpbGwgYmUgZG9uZSBpbiBhIGxhdGVyIHBhdGNoLCBvciBpbnRyb2R1
Y2UgYW4KaHlwZXJ2aXNvcl9vcHMgc3RydWN0IHRoYXQgY29udGFpbiBwb2ludGVycyB0byBmdW5j
dGlvbnMgdG8gYWxsb3cgZm9yCmRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMuCgo+ICt7Cj4gKyAg
ICBwcm9iZV94ZW4oKTsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgbWFwX3NoYXJlZF9pbmZvKHZv
aWQpCj4gIHsKPiAgICAgIG1mbl90IG1mbjsKPiBAQCAtMjQ5LDEwICsyNTQsOCBAQCBzdGF0aWMg
dm9pZCBpbml0X2V2dGNobih2b2lkKQo+ICAgICAgfQo+ICB9Cj4gIAo+IC12b2lkIF9faW5pdCBo
eXBlcnZpc29yX3NldHVwKHZvaWQpCj4gK3N0YXRpYyB2b2lkIF9faW5pdCB4ZW5fc2V0dXAodm9p
ZCkKPiAgewo+IC0gICAgaW5pdF9tZW1tYXAoKTsKPiAtCj4gICAgICBtYXBfc2hhcmVkX2luZm8o
KTsKPiAgCj4gICAgICBzZXRfdmNwdV9pZCgpOwo+IEBAIC0yNzcsMTMgKzI4MCwyNSBAQCB2b2lk
IF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCj4gICAgICBpbml0X2V2dGNobigpOwo+ICB9
Cj4gIAo+IC12b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKPiArdm9pZCBfX2luaXQgaHlw
ZXJ2aXNvcl9zZXR1cCh2b2lkKQo+ICt7Cj4gKyAgICBpbml0X21lbW1hcCgpOwoKSSB3b25kZXIs
IGRvIHlvdSBhbHNvIHJlcXVpcmUgdG8gbWFwIGh5cGVydmlzb3IgZGF0YSBpbnRvIHRoZSBndWVz
dApwaHlzbWFwIHdoZW4gcnVubmluZyBvbiBIeXBlclY/CgpJcyB0aGVyZSBhIHdheSB3aGVuIHJ1
bm5pbmcgb24gSHlwZXJWIHRvIHJlcXVlc3QgdW51c2VkIHBoeXNpY2FsCmFkZHJlc3Mgc3BhY2Ug
cmFuZ2VzPyBXaGF0IFhlbiBjdXJyZW50bHkgZG9lcyBpbiBpbml0X21lbW1hcCBpcyBxdWl0ZQpj
cmFwcHkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
