Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA83490A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY9b1-00087A-3z; Tue, 04 Jun 2019 13:35:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hY9az-000874-OM
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:35:21 +0000
X-Inumbo-ID: 9856d399-86cd-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9856d399-86cd-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 13:35:19 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: OEDVtbxtHJNFySmwAPp7bN+2XxTKXQlbtrBMW7Vi6xfUbVcA6z0FB7CKD3x4SUENQFAgG1y1gS
 Rx98V4loX1nM4PmOZeoJ1T/zCPsBLJmRRSctgTiE+GOeCIeljUyGBh0eQ5iDaUilwU4ZxHTn/G
 HiuVEA3Bl/jdz/L9Bz61E5fusxZin+iJL4MuH4vzDeOnqd8dYy5+AlMwnHreFQuiCmz1lIA8dr
 Os2rc6Zcc8uMwao2sRduVjnrSFPrkAHY/bIqIpHNyowEvJufmKWxM19cbOpgfC/Jleoo1dMfmZ
 yuk=
X-SBRS: 2.7
X-MesageID: 1298009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1298009"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667780200007800235142@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6c630487-43d2-b922-502a-f90373e7289f@citrix.com>
Date: Tue, 4 Jun 2019 14:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF667780200007800235142@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/4] adjust special domain creation (and
 call it earlier on x86)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDYvMjAxOSAxMzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU3BsaXQgb3V0IHRoaXMg
bW9zdGx5IGFyY2gtaW5kZXBlbmRlbnQgY29kZSBpbnRvIGEgY29tbW9uLWNvZGUgaGVscGVyCj4g
ZnVuY3Rpb24uIChUaGlzIGRvZXMgYXdheSB3aXRoIEFybSdzIGFyY2hfaW5pdF9tZW1vcnkoKSBh
bHRvZ2V0aGVyLikKPgo+IE9uIHg4NiB0aGlzIG5lZWRzIHRvIGhhcHBlbiBiZWZvcmUgYWNwaV9i
b290X2luaXQoKTogQ29tbWl0IDlmYTk0ZTEwNTgKPiAoIng4Ni9BQ1BJOiBhbHNvIHBhcnNlIEFN
RCBJT01NVSB0YWJsZXMgZWFybHkiKSBvbmx5IGFwcGVhcmVkIHRvIHdvcmsKPiBmaW5lIC0gaXQn
cyByZWFsbHkgYnJva2VuLCBhbmQgZG9lc24ndCBjcmFzaCAob24gbm9uLUVGSSBBTUQgc3lzdGVt
cykKPiBvbmx5IGJlY2F1c2Ugb2YgdGhlcmUgYmVpbmcgYSBtYXBwaW5nIG9mIGxpbmVhciBhZGRy
ZXNzIDAgZHVyaW5nIGVhcmx5Cj4gYm9vdC4gT24gRUZJIHRoZXJlIGlzOgo+Cj4gIEVhcmx5IGZh
dGFsIHBhZ2UgZmF1bHQgYXQgZTAwODpmZmZmODJkMDgwMjRkNThlIChjcjI9MDAwMDAwMDAwMDAw
MDIyMCwgZWM9MDAwMCkKPiAgLS0tLVsgWGVuLTQuMTMtdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9
eSAgIE5vdCB0YWludGVkIF0tLS0tCj4gIENQVTogICAgMAo+ICBSSVA6ICAgIGUwMDg6WzxmZmZm
ODJkMDgwMjRkNThlPl0gcGNpLmMjX3BjaV9oaWRlX2RldmljZSsweDE3LzB4M2EKPiAgUkZMQUdT
OiAwMDAwMDAwMDAwMDEwMDQ2ICAgQ09OVEVYVDogaHlwZXJ2aXNvcgo+ICByYXg6IDAwMDAwMDAw
MDAwMDAwMDAgICByYng6IDAwMDAwMDAwMDAwMDYwMDAgICByY3g6IDAwMDAwMDAwMDAwMDAwMDAK
PiAgcmR4OiBmZmZmODMxMDRmMmVlOWIwICAgcnNpOiBmZmZmODJlMDIwOWU1ZDQ4ICAgcmRpOiBm
ZmZmODMxMDRmMmVlOWEwCj4gIHJicDogZmZmZjgyZDA4MDgxZmNlMCAgIHJzcDogZmZmZjgyZDA4
MDgxZmNiOCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMAo+ICByOTogIDgwMDAwMDAwMDAwMDAwMDAg
ICByMTA6IDAxODAwMDAwMDAwMDAwMDAgICByMTE6IDdmZmZmZmZmZmZmZmZmZmYKPiAgcjEyOiBm
ZmZmODMxMDRmMmVlOWEwICAgcjEzOiAwMDAwMDAwMDAwMDAwMDAyICAgcjE0OiBmZmZmODMxMDRm
MmVlNGIwCj4gIHIxNTogMDAwMDAwMDAwMDAwMDA2NCAgIGNyMDogMDAwMDAwMDA4MDA1MDAzMyAg
IGNyNDogMDAwMDAwMDAwMDAwMDBhMAo+ICBjcjM6IDAwMDAwMDAwOWY2MTQwMDAgICBjcjI6IDAw
MDAwMDAwMDAwMDAyMjAKPiAgZnNiOiAwMDAwMDAwMDAwMDAwMDAwICAgZ3NiOiAwMDAwMDAwMDAw
MDAwMDAwICAgZ3NzOiAwMDAwMDAwMDAwMDAwMDAwCj4gIGRzOiAwMDAwICAgZXM6IDAwMDAgICBm
czogMDAwMCAgIGdzOiAwMDAwICAgc3M6IDAwMDAgICBjczogZTAwOAo+ICBYZW4gY29kZSBhcm91
bmQgPGZmZmY4MmQwODAyNGQ1OGU+IChwY2kuYyNfcGNpX2hpZGVfZGV2aWNlKzB4MTcvMHgzYSk6
Cj4gICA0OCA4OSA0NyAzOCA0OCA4ZCA1NyAxMCA8NDg+IDhiIDg4IDIwIDAyIDAwIDAwIDQ4IDg5
IDUxIDA4IDQ4IDg5IDRmIDEwIDQ4Cj4gIFhlbiBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmODJk
MDgwODFmY2I4Ogo+IFsuLi5dCj4gIFhlbiBjYWxsIHRyYWNlOgo+ICAgICBbPGZmZmY4MmQwODAy
NGQ1OGU+XSBwY2kuYyNfcGNpX2hpZGVfZGV2aWNlKzB4MTcvMHgzYQo+IFsgICBbPCAgICAgICAg
ICAgICAgICA+XSBwY2lfcm9fZGV2aWNlKy4uLl0KCldoYXQgaXMgdGhpcyBpbiB0aGUgc3RhY2sg
dHJhY2U/Cgo+ICAgICBbPGZmZmY4MmQwODA2MTdmZTE+XSBhbWRfaW9tbXVfZGV0ZWN0X29uZV9h
Y3BpKzB4MTYxLzB4MjQ5Cj4gICAgIFs8ZmZmZjgyZDA4MDYxODZhYz5dIGlvbW11X2FjcGkuYyNk
ZXRlY3RfaW9tbXVfYWNwaSsweGI1LzB4ZTcKPiAgICAgWzxmZmZmODJkMDgwNjFjZGUwPl0gYWNw
aV90YWJsZV9wYXJzZSsweDYxLzB4OTAKPiAgICAgWzxmZmZmODJkMDgwNjE5ZTdkPl0gYW1kX2lv
bW11X2RldGVjdF9hY3BpKzB4MTcvMHgxOQo+ICAgICBbPGZmZmY4MmQwODA2MTc5MGI+XSBhY3Bp
X2l2cnNfaW5pdCsweDIwLzB4NWIKPiAgICAgWzxmZmZmODJkMDgwNjJlODM4Pl0gYWNwaV9ib290
X2luaXQrMHgzMDEvMHgzMGYKPiAgICAgWzxmZmZmODJkMDgwNjI4YjEwPl0gX19zdGFydF94ZW4r
MHgxZGFmLzB4MjhhMgo+ICAKPiAgUGFnZXRhYmxlIHdhbGsgZnJvbSAwMDAwMDAwMDAwMDAwMjIw
Ogo+ICAgTDRbMHgwMDBdID0gMDAwMDAwMDA5ZjQ0ZjA2MyBmZmZmZmZmZmZmZmZmZmZmCj4gICBM
M1sweDAwMF0gPSAwMDAwMDAwMDlmNDRiMDYzIGZmZmZmZmZmZmZmZmZmZmYKPiAgIEwyWzB4MDAw
XSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZmZmZmZmZmZmZmZmZmZgo+ICAKPiAgKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICBQYW5pYyBvbiBDUFUgMDoKPiAgRkFUQUwg
VFJBUDogdmVjdG9yID0gMTQgKHBhZ2UgZmF1bHQpCj4gIFtlcnJvcl9jb2RlPTAwMDBdICwgSU4g
SU5URVJSVVBUIENPTlRFWFQKPiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgo+Cj4gT2YgY291cnNlIHRoZSBidWcgd291bGQgbmV2ZXJ0aGVsZXNzIGhhdmUgbGVhZCB0
byBwb3N0LWJvb3QgY3Jhc2hlcyBhcwo+IHNvb24gYXMgdGhlIGxpc3Qgd291bGQgYWN0dWFsbHkg
Z2V0IHRyYXZlcnNlZC4KPgo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZAo+IC0gY29udmVydCBC
VUdfT04oKXMgYmVpbmcgbW92ZWQgdG8gcGFuaWMoKSwKPiAtIGFkZCBfX3JlYWRfbW9zdGx5IGFu
bm90YXRpb25zIHRvIHRoZSBkb21fKiBkZWZpbml0aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClNvcnJ5IGZvciBub3Qgbm90aWNpbmcgdGhp
cyBiZWZvcmUsIGJ1dCBzL3NwZWNpYWwvc3lzdGVtLyB0byBtYXRjaCB1cAp3aXRoIHRoZSBleGlz
dGluZyB0ZXJtaW5vbG9neSBpbiBpc19zeXN0ZW1fZG9tYWluKCkKCj4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL21tLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+IEBAIC02NDIsNiArNjQy
LDkgQEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+ICAgICAgfQo+
ICB9Cj4gIAo+ICsvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlE
X0lPLCBldGMuICovCj4gK2V4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9tX2lvLCAq
ZG9tX2NvdzsKPiArCgpBbnkgY2hhbmNlIHlvdSBjYW4gbW92ZSB0aGVzZSBoaWdoZXIgdXAsIHRv
IGJlZm9yZSB0aGUgaW5jbHVkZSBvZgo8YXNtL21tLmg+LCBvciB5b3UncmUgZ29pbmcgdG8gYnJl
YWsgSnVsaWVuJ3MgTTJQIHNlcmllcy4KCldpdGggYXQgbGVhc3QgdGhlIG5hbWUgYWRqdXN0ZWQs
IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
