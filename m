Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E3B7C04
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 16:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAxF5-0003mV-EE; Thu, 19 Sep 2019 14:17:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iqgf=XO=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAxF4-0003mA-Gw
 for xen-devel@lists.xen.org; Thu, 19 Sep 2019 14:17:06 +0000
X-Inumbo-ID: 27ffe8dc-dae8-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ffe8dc-dae8-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 14:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568902626;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=X/Cs+dG+umQvRo8fA+m7Qbxwjr3d32cXX3RdCQlT13s=;
 b=NBdITr67wtMiJ78dJqCBueJeFtdbNU3Zjcv4K/JxVJCNipFHamjdsJJW
 byoWHi8CF50JVnHT5/2pRzd1lTyFv5+dt7LNCrc49A9rlpvps4PhY1HTp
 4fX74RgJtjM3kKxTcFYhqz64kdfto20KIz6wo4MEROr2ShwtcVg9/+XbM g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WCFuxKvuBbSlzE5jJ98+/JeqHgycusOHNbEbOdQKJEq1DAjznN/blpgzgYv3XiDspufmOGfidA
 uk0+MuCoigLch8O1dahvl3v3b8x8FpHKY6bYBOwPt9UZcrzDFo0yDvQrWt8sHhpqgmAfDUVBwd
 7/lwYdUWNU/Tx145gbDEQMC2AtQjvTynkfzUQHWiyspeXVUWBJIIEHVDpGfcrL4/91+Y95Y715
 k51+0vpys+EUke+iW2t7nNR2adBR/Elwh9RwdGBB6kpX16VYaI98bqFz0ehWIIMPht9pXQRrAq
 rWM=
X-SBRS: 2.7
X-MesageID: 5851561
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5851561"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-6-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <d941f589-3d76-8f8c-342e-3d52adcf3d3f@citrix.com>
Date: Thu, 19 Sep 2019 15:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-6-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 05/12] livepatch: Add support for
 apply|revert action replacement hooks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gQnkgZGVm
YXVsdCwgaW4gdGhlIHF1aWVzY2luZyB6b25lLCBhIGhvdHBhdGNoIHBheWxvYWQgaXMgYXBwbGll
ZCB3aXRoCgpzL2hvdHBhdGNoL2xpdmVwYXRjaC8gKGZvciBhbGwgdGhlIHBhdGNoZXMpCgo+IGFw
cGx5X3BheWxvYWQoKSBhbmQgcmV2ZXJ0ZWQgd2l0aCByZXZlcnRfcGF5bG9hZCgpIGZ1bmN0aW9u
cy4gQm90aCBvZgo+IHRoZSBmdW5jdGlvbnMgcmVjZWl2ZSB0aGUgcGF5bG9hZCBzdHJ1Y3QgcG9p
bnRlciBhcyBhIHBhcmFtZXRlci4gVGhlCj4gZnVuY3Rpb25zIGFyZSBhbHNvIGEgcGxhY2Ugd2hl
cmUgc3RhbmRhcmQgJ2xvYWQnIGFuZCAndW5sb2FkJyBtb2R1bGUKPiBob29rcyBhcmUgZXhlY3V0
ZWQuCj4gCj4gVG8gaW5jcmVhc2UgaG90cGF0Y2hpbmcgc3lzdGVtJ3MgYWdpbGl0eSBhbmQgcHJv
dmlkZSBtb3JlIGZsZXhpYWJsZQoKZmxleGlibGUKCj4gbG9uZy10ZXJtIGhvdHBhdGNoIHNvbHV0
aW9uLCBhbGxvdyB0byBvdmVyd3JpdGUgdGhlIGRlZmF1bHQgYXBwbHkKPiBhbmQgcmV2ZXJ0IGFj
dGlvbiBmdW5jdGlvbnMgd2l0aCBob29rLWxpa2Ugc3VwcGxpZWQgYWx0ZXJuYXRpdmVzLgo+IFRo
ZSBhbHRlcm5hdGl2ZSBmdW5jdGlvbnMgYXJlIG9wdGlvbmFsIGFuZCB0aGUgZGVmYXVsdCBmdW5j
dGlvbnMgYXJlCj4gdXNlZCBieSBkZWZhdWx0Lgo+IApzbmlwCj4gQEAgLTEyMDIsOSArMTIzMSwx
OCBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfZG9fYWN0aW9uKHZvaWQpCj4gICAgICAgICAgICAq
Lwo+ICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmVfcmV2ZXJzZSAoIG90aGVyLCB0
bXAsICZhcHBsaWVkX2xpc3QsIGFwcGxpZWRfbGlzdCApCj4gICAgICAgICAgIHsKPiAtICAgICAg
ICAgICAgb3RoZXItPnJjID0gcmV2ZXJ0X3BheWxvYWQob3RoZXIpOwo+ICsgICAgICAgICAgICBp
ZiAoIGlzX2hvb2tfZW5hYmxlZChvdGhlci0+aG9va3MucmV2ZXJ0LmFjdGlvbikgKQo+ICsgICAg
ICAgICAgICB7Cj4gKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gTElWRVBBVENI
ICIlczogQ2FsbGluZyByZXZlcnQgYWN0aW9uIGhvb2sgZnVuY3Rpb25cbiIsIG90aGVyLT5uYW1l
KTsKPiArCj4gKyAgICAgICAgICAgICAgICBvdGhlci0+cmMgPSAoKm90aGVyLT5ob29rcy5yZXZl
cnQuYWN0aW9uKShvdGhlcik7Cj4gKyAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgZWxzZQo+
ICsgICAgICAgICAgICAgICAgb3RoZXItPnJjID0gcmV2ZXJ0X3BheWxvYWQob3RoZXIpOwo+ICsK
PiArCgpFeHRyYSBuZXdsaW5lCgo+ICAgICAgICAgICAgICAgaWYgKCBvdGhlci0+cmMgPT0gMCAp
Cj4gLSAgICAgICAgICAgICAgICBvdGhlci0+c3RhdGUgPSBMSVZFUEFUQ0hfU1RBVEVfQ0hFQ0tF
RDsKPiArICAgICAgICAgICAgICAgIHJldmVydF9wYXlsb2FkX3RhaWwob3RoZXIpOwo+ICAgICAg
ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgIHJjID0g
LUVJTlZBTDsKPiBAQCAtMTIxNCw5ICsxMjUyLDE3IEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9k
b19hY3Rpb24odm9pZCkKPiAgIAo+ICAgICAgICAgICBpZiAoIHJjID09IDAgKQo+ICAgICAgICAg
ICB7Cj4gLSAgICAgICAgICAgIHJjID0gYXBwbHlfcGF5bG9hZChkYXRhKTsKPiArICAgICAgICAg
ICAgaWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9va3MuYXBwbHkuYWN0aW9uKSApCj4gKyAg
ICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyBMSVZFUEFU
Q0ggIiVzOiBDYWxsaW5nIGFwcGx5IGFjdGlvbiBob29rIGZ1bmN0aW9uXG4iLCBkYXRhLT5uYW1l
KTsKPiArCj4gKyAgICAgICAgICAgICAgICByYyA9ICgqZGF0YS0+aG9va3MuYXBwbHkuYWN0aW9u
KShkYXRhKTsKPiArICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAg
ICAgICAgICByYyA9IGFwcGx5X3BheWxvYWQoZGF0YSk7Cj4gKwo+ICAgICAgICAgICAgICAgaWYg
KCByYyA9PSAwICkKPiAtICAgICAgICAgICAgICAgIGRhdGEtPnN0YXRlID0gTElWRVBBVENIX1NU
QVRFX0FQUExJRUQ7Cj4gKyAgICAgICAgICAgICAgICBhcHBseV9wYXlsb2FkX3RhaWwoZGF0YSk7
Cj4gICAgICAgICAgIH0KPiAgICAgICAgICAgYnJlYWs7Cj4gICAKV2l0aCB0aGUgYWJvdmUgbWlu
b3IgaXNzdWVzIGFkZHJlc3NlZCwKClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5s
YWdlcndhbGxAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
