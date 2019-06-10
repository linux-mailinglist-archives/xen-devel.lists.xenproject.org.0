Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA123B65D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 15:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haKb8-0004AT-JU; Mon, 10 Jun 2019 13:44:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CttF=UJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1haKb7-0004AK-9A
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 13:44:29 +0000
X-Inumbo-ID: dd7a2f35-8b85-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd7a2f35-8b85-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 13:44:27 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MOvR0zrkYEzTOWlzwSeEsqhuryXrpsuumbI0SfGTLt2edr5PUjq/kEdQXCdTscIB6Dh7+27Bjy
 w2KuFSpso4hqzYb7TIHOvl3+r09ROUoHpfqfP7jUiuCuLVpY2Z4jPN/tQU0G64yPC5Suf0vLD9
 sIIpRps/6JKakPrFtZBz7XRzmKpYdo4aozJEttlZz97GPyerw6JAn3iG4YsNUO5A7tGakfscBH
 2IIkIf92vUPcaXzYyP48XHo0mMCEy+xRyerdXk1qGXhP6HQp2QuWNqJbOaapI9/cuPWOfI0ULt
 IVw=
X-SBRS: 2.7
X-MesageID: 1529708
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,575,1557201600"; 
   d="scan'208";a="1529708"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190610133623.89565-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7f6f8f3a-d2da-af5a-8dcf-5b955a291d89@citrix.com>
Date: Mon, 10 Jun 2019 14:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610133623.89565-1-roger.pau@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] automation: add clang and lld 8 tests to
 gitlab
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDYvMjAxOSAxNDozNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzaW5nIGNsYW5n
IGFuZCBsbGQgOCByZXF1aXJlcyBpbnN0YWxsaW5nIHRoZSBwYWNrYWdlcyBmcm9tIHRoZQo+IG9m
ZmljaWFsIGxsdm0gYXB0IHJlcG9zaXRvcmllcywgc28gbW9kaWZ5IHRoZSBEZWJpYW4gRG9ja2Vy
IGZpbGVzIGZvcgo+IHN0cmV0Y2ggYW5kIHVuc3RhYmxlIHRvIGFkZCB0aGUgbGx2bSByZXBvIGFu
ZCBpbnN0YWxsIGNsYW5nIGFuZCBsbGQKPiBmcm9tIGl0Lgo+Cj4gQWxzbyBhZGQgc29tZSBqb2Jz
IHRvIHRlc3QgYnVpbGRpbmcgWGVuIHdpdGggY2xhbmcgOCBhbmQgbGxkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gSSd2
ZSB0ZXN0ZWQgdGhpcyBtYW51YWxseSBieSBkb2luZzoKPgo+ICMgbWFrZSAtQyBhdXRvbWF0aW9u
L2J1aWxkIGRlYmlhbi9zdHJldGNoCj4gIyBDT05UQUlORVJfTk9fUFVMTD0xIC4vYXV0b21hdGlv
bi9zY3JpcHRzL2NvbnRhaW5lcml6ZSA8PCBFTkQKPiAuL2NvbmZpZ3VyZSAtLXdpdGgtc3lzdGVt
LXNlYWJpb3M9L3Vzci9zaGFyZS9zZWFiaW9zL2Jpb3MuYmluIFwKPiAgICAgICAgICAgICAtLXdp
dGgtc3lzdGVtLWlweGU9L3Vzci9saWIvaXB4ZS9pcHhlLnB4ZSAtLWRpc2FibGUtc3R1YmRvbQo+
IG1ha2UgLWo4IGRpc3QgQ0M9Y2xhbmctOCBDWFg9Y2xhbmctOCBMRD1sZC5sbGQtOCBjbGFuZz15
CgpEWU0gQ1hYPWNsYW5nKystOCA/Cgo+IEVORAo+IC0tLQo+IENjOiBEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gLS0tCj4gQ2hh
bmdlcyBzaW5jZSB2MjoKPiAgLSBDaGFuZ2UgdGhlIG9yZGVyIG9mIGFjdGlvbnMgaW4gdGhlIGRv
Y2tlcmZpbGUKPiAgLSBDbGVhbnVwIGFmdGVyIGluc3RhbGxpbmcgbGx2bSB0b29scy4KPgo+IENo
YW5nZXMgc2luY2UgdjE6Cj4gIC0gVXNlIGxkLmxsZC04IGluc3RlYWQgb2YgbGxkLTgsIGFzIHRo
YXQncyB0aGUgcmVjb21tZW5kZWQgd2F5Cj4gICAgcmVwb3J0ZWQgYnkgbGxkLTguCj4gLS0tCj4g
IGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL3N0cmV0Y2gtbGx2bS5saXN0ICAgfCAgMyArKwo+ICBh
dXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUgIHwgMTMgKysrKysrKysK
PiAgYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vdW5zdGFibGUtbGx2bS5saXN0ICB8ICAzICsrCj4g
IGF1dG9tYXRpb24vYnVpbGQvZGViaWFuL3Vuc3RhYmxlLmRvY2tlcmZpbGUgfCAxMyArKysrKysr
Kwo+ICBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sICAgICAgICAgICAgIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrOQo+ICBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhdXRvbWF0aW9uL2J1aWxkL2RlYmlh
bi9zdHJldGNoLWxsdm0ubGlzdAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXV0b21hdGlvbi9idWls
ZC9kZWJpYW4vdW5zdGFibGUtbGx2bS5saXN0Cj4KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9i
dWlsZC9kZWJpYW4vc3RyZXRjaC1sbHZtLmxpc3QgYi9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9z
dHJldGNoLWxsdm0ubGlzdAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MC4uMDlmZTg0M2ZiMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi9zdHJldGNoLWxsdm0ubGlzdAoKVGhpbmtpbmcgZm9yd2FyZHMgdG8gd2hlbiB3ZSB3YW50
IExMVk0gOSwgdGhlc2UgdHdvIGZpbGVzIHNob3VsZCBoYXZlIGEKLTggc3VmZml4IGZvciBub3cu
wqAgQ2FuIGJlIGZpeGVkIG9uIGNvbW1pdC4KCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgU3RyZWNo
IExMVk0gOCByZXBvcwo+ICtkZWIgaHR0cDovL2FwdC5sbHZtLm9yZy9zdHJldGNoLyBsbHZtLXRv
b2xjaGFpbi1zdHJldGNoLTggbWFpbgo+ICtkZWItc3JjIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3Ry
ZXRjaC8gbGx2bS10b29sY2hhaW4tc3RyZXRjaC04IG1haW4KPiBkaWZmIC0tZ2l0IGEvYXV0b21h
dGlvbi9idWlsZC9kZWJpYW4vc3RyZXRjaC5kb2NrZXJmaWxlIGIvYXV0b21hdGlvbi9idWlsZC9k
ZWJpYW4vc3RyZXRjaC5kb2NrZXJmaWxlCj4gaW5kZXggZGFmOGM5ZDM4NC4uNTVjNmYwNjVhZCAx
MDA2NDQKPiAtLS0gYS9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUK
PiArKysgYi9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUKPiBAQCAt
NDIsNiArNDIsMTkgQEAgUlVOIGFwdC1nZXQgdXBkYXRlICYmIFwKPiAgICAgICAgICB3Z2V0IFwK
PiAgICAgICAgICBnaXQgXAo+ICAgICAgICAgIG5hc20gXAo+ICsgICAgICAgIGdudXBnIFwKPiAr
ICAgICAgICAmJiBcCj4gKyAgICAgICAgYXB0LWdldCBhdXRvcmVtb3ZlIC15ICYmIFwKPiArICAg
ICAgICBhcHQtZ2V0IGNsZWFuICYmIFwKPiArICAgICAgICBybSAtcmYgL3Zhci9saWIvYXB0L2xp
c3RzKiAvdG1wLyogL3Zhci90bXAvKgo+ICsKPiArUlVOIHdnZXQgLU8gLSBodHRwczovL2FwdC5s
bHZtLm9yZy9sbHZtLXNuYXBzaG90LmdwZy5rZXl8YXB0LWtleSBhZGQgLQoKVGhpcyB3b3VsZCBi
ZSBzbGlnaHRseSBlYXNlciB0byByZWFkIHdpdGggc3BhY2VzIGFyb3VuZCB0aGUgcGlwZS7CoApB
Z2FpbiwgY2FuIGJlIGZpeGVkIG9uIGNvbW1pdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
