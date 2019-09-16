Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82EB3EE3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 18:26:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9tmZ-0007TK-JV; Mon, 16 Sep 2019 16:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hs3e=XL=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i9tmY-0007T8-2d
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 16:23:18 +0000
X-Inumbo-ID: 49deb696-d89e-11e9-95f1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49deb696-d89e-11e9-95f1-12813bfff9fa;
 Mon, 16 Sep 2019 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568650997;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UFgm9ZQ60LnADCOREP/O0u9XsiIIKzfltxD690Ii6Bw=;
 b=Zig8fejSVsMjkYjQQC0T17txCkisKjYpckw3MsITdh18tPrUN8dYeKLC
 VMLxr/vNGya5wSMtCLzre2/rdCN3jrq/LkZQqh49jipivc5U6xLmhn0Ik
 do/5jLmr4dNXoGGQkU4fsll+sCrvWweIeRQqRqJsnm9nB4lwubjsKDLtH M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ETFRMxoG+PwKyfJHOwWiOZmBX1x9fC8TVmTrECpotdo2EIZ+x7AGBVgGc3V2VBAty1TognAkjF
 Z+3KZBKSfuFqmVu+y2jJeR7lzO/Ix5eDViIshvGTsn+Ax47yQMedu9+A9/LS4kHLM2j4g4j/oX
 mCZ7izaVneK7WMGqKxXPMsA+Vh1n6KwTizbb3ZkHyWpMHt86d4Obo+wLiiNCB/tutB7ri0dx+i
 741vaqDzlVJlOFGnispO9VrSvPSV1X9RRZMniozerCO2jAh1Dgzka/e7TK17PsGSwVV3spSBk3
 5w4=
X-SBRS: 2.7
X-MesageID: 5625439
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,513,1559534400"; 
   d="scan'208";a="5625439"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-2-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <77408bf9-0f5c-c9f1-4c23-a8ad596c6232@citrix.com>
Date: Mon, 16 Sep 2019 17:23:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-2-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 01/12] livepatch: Always check hypervisor
 build ID upon hotpatch upload
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

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBj
aGFuZ2UgaXMgcGFydCBvZiBhIGluZGVwZW5kYW50IHN0YWNrZWQgaG90cGF0Y2ggbW9kdWxlcwo+
IGZlYXR1cmUuIFRoaXMgZmVhdHVyZSBhbGxvd3MgdG8gYnlwYXNzIGRlcGVuZGVuY2llcyBiZXR3
ZWVuIG1vZHVsZXMKPiB1cG9uIGxvYWRpbmcsIGJ1dCBzdGlsbCB2ZXJpZmllcyBYZW4gYnVpbGQg
SUQgbWF0Y2hpbmcuCj4gCj4gSW4gb3JkZXIgdG8gcHJldmVudCAodXApbG9hZGluZyBhbnkgaG90
cGF0Y2hlcyBidWlsdCBmb3IgZGlmZmVyZW50Cj4gaHlwZXJ2aXNvciB2ZXJzaW9uIGFzIGluZGlj
YXRlZCBieSB0aGUgWGVuIEJ1aWxkIElELCBhZGQgY2hlY2tpbmcgZm9yCj4gdGhlIHBheWxvYWQn
cyB2cyBYZW4ncyBidWlsZCBpZCBtYXRjaC4KPiAKPiBUbyBhY2hpZXZlIHRoYXQgZW1iZWQgaW50
byBldmVyeSBob3RwYXRjaCBhbm90aGVyIHNlY3Rpb24gd2l0aCBhCj4gZGVkaWNhdGVkIGh5cGVy
dmlzb3IgYnVpbGQgaWQgaW4gaXQuIEFmdGVyIHRoZSBwYXlsb2FkIGlzIGxvYWRlZCBhbmQKPiB0
aGUgLmxpdmVwYXRjaC54ZW5fZGVwZW5kcyBzZWN0aW9uIGJlY29tZXMgYXZhaWxhYmxlLCBwZXJm
b3JtIHRoZQo+IGNoZWNrIGFuZCByZWplY3QgdGhlIHBheWxvYWQgaWYgdGhlcmUgaXMgbm8gbWF0
Y2guCj4gCnNuaXAKPiArICAgIHNlYyA9IGxpdmVwYXRjaF9lbGZfc2VjX2J5X25hbWUoZWxmLCBF
TEZfTElWRVBBVENIX1hFTl9ERVBFTkRTKTsKPiArICAgIGlmICggc2VjICkKPiArICAgIHsKPiAr
ICAgICAgICBuID0gc2VjLT5sb2FkX2FkZHI7Cj4gKwo+ICsgICAgICAgIGlmICggc2VjLT5zZWMt
PnNoX3NpemUgPD0gc2l6ZW9mKCpuKSApCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICsKPiArICAgICAgICBpZiAoIHhlbl9idWlsZF9pZF9jaGVjayhuLCBzZWMtPnNlYy0+c2hfc2l6
ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGF5bG9hZC0+eGVuX2RlcC5w
LCAmcGF5bG9hZC0+eGVuX2RlcC5sZW4pICkKPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICsgICAgICAgIGlmICggIXBheWxvYWQtPnhlbl9kZXAubGVuIHx8ICFwYXlsb2FkLT54
ZW5fZGVwLnAgKQo+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgIH0KPiArCj4g
ICAgICAgLyogU2V0dXAgdGhlIHZpcnR1YWwgcmVnaW9uIHdpdGggcHJvcGVyIGRhdGEuICovCj4g
ICAgICAgcmVnaW9uID0gJnBheWxvYWQtPnJlZ2lvbjsKPiAgIAo+IEBAIC04ODIsNiArOTIyLDEw
IEBAIHN0YXRpYyBpbnQgbG9hZF9wYXlsb2FkX2RhdGEoc3RydWN0IHBheWxvYWQgKnBheWxvYWQs
IHZvaWQgKnJhdywgc2l6ZV90IGxlbikKPiAgICAgICBpZiAoIHJjICkKPiAgICAgICAgICAgZ290
byBvdXQ7Cj4gICAKPiArICAgIHJjID0gY2hlY2tfeGVuX2J1aWxkX2lkKHBheWxvYWQpOwo+ICsg
ICAgaWYgKCByYyApCj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICAgICAgIHJjID0gYnVpbGRf
c3ltYm9sX3RhYmxlKHBheWxvYWQsICZlbGYpOwo+ICAgICAgIGlmICggcmMgKQo+ICAgICAgICAg
ICBnb3RvIG91dDsKCkl0IGlzIGEgYml0IGNvbmZ1c2luZyBoYXZpbmcgYSBuZXcgZnVuY3Rpb24g
Y2FsbGVkIGNoZWNrX3hlbl9idWlsZF9pZCgpIAp3aGVuIHRoZXJlIGlzIGFscmVhZHkgYSB4ZW5f
YnVpbGRfaWRfY2hlY2soKS4gUGVyaGFwcyB0aGUgbmV3IG9uZSBzaG91bGQgCmJlIGNhbGxlZCB4
ZW5fYnVpbGRfaWRfZGVwKCkgYXMgaXQgaXMgYW5hbG9nb3VzIHRvIHRoZSBleGlzdGluZyAKYnVp
bGRfaWRfZGVwKCk/CgpFaXRoZXIgd2F5LAoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
