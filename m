Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C012FB01
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:59:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inQGH-0002aH-7O; Fri, 03 Jan 2020 16:57:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inQGF-0002aB-VQ
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:57:19 +0000
X-Inumbo-ID: 197a379e-2e4a-11ea-a4ec-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 197a379e-2e4a-11ea-a4ec-12813bfff9fa;
 Fri, 03 Jan 2020 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578070638;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/Dhi0wIwFJFFK+SvpHObnogLpLw2CEt2I8CNhSHIofM=;
 b=QZAZ+KzVaSSo9KrGw9oXDCsC5hWTJ6Ls3ly012nA0tHSmwuGEAs/ID28
 3oF+UedLaCwx7IqPEmS26xXrjCvnImZMFpAgJzPoeHXMAZ4POjoXgPNiF
 zyStE4sVZd0Lfm0A97Oq/moxhJqf+v44E8eBzYLG3vqwwjwhfXgHwOsEh A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f/kpWiejflqeShgGd/Ec6GgYMumguWxIhOSjYyEU4a+u4ehEWz6aLLNduRoxCjGGTxW2qs12n2
 ZvQc3nJEXiVxqpDUtv9tpAEKWp1qkDW7KocJcMd9n7gtNSLRj0mwBxHbHU8v4TyS2Lp8joZWA/
 JG/ke0UF0Hha682je/57TOIrLdo1WYfWe/1Ac96nXXl6TZ1pIDVz8fMxG39pP60KZ8hmZJUH2B
 psipUpyxULtCXPJknP+sR6OJRP4aQBIslworLHSN3QzRyHjpbpDQmvMfaHQ9LVyJOF4erhIi6s
 gBE=
X-SBRS: 2.7
X-MesageID: 10581704
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,391,1571716800"; d="scan'208";a="10581704"
To: Wei Liu <wl@xen.org>
References: <20200103160825.19377-1-liuwe@microsoft.com>
 <20200103160825.19377-7-liuwe@microsoft.com>
 <ec797a21-8b06-6eb1-84a8-7e059c430e7a@citrix.com>
 <20200103165513.wlgihc4kfqducwtm@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d3c99f17-06f0-bd17-4b9a-c6f7eaa2f024@citrix.com>
Date: Fri, 3 Jan 2020 16:57:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200103165513.wlgihc4kfqducwtm@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 6/8] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxNjo1NSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEphbiAwMywgMjAy
MCBhdCAwNDozMDo0OVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMy8wMS8y
MDIwIDE2OjA4LCBXZWkgTGl1IHdyb3RlOgo+Pj4gQEAgLTgzLDE0ICs4NCwzOSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPj4+ICAgICAgd3Jtc3JsKEhW
X1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4+PiAgfQo+Pj4g
IAo+Pj4gK3N0YXRpYyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+Pj4gK3sK
Pj4+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7Cj4+PiArICAgIHZvaWQgKm1hcHBpbmc7Cj4+
PiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+PiArCj4+PiAr
ICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwo+Pj4gKyAgICBpZiAoICFwZyAp
Cj4+PiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIHNldHVwIGh5cGVyY2FsbCBpbnB1dCBwYWdl
IGZvciAldVxuIiwgY3B1KTsKPj4+ICsKPj4+ICsgICAgbWFwcGluZyA9IF9fbWFwX2RvbWFpbl9w
YWdlX2dsb2JhbChwZyk7Cj4+PiArICAgIGlmICggIW1hcHBpbmcgKQo+Pj4gKyAgICAgICAgcGFu
aWMoIkZhaWxlZCB0byBtYXAgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOwo+
PiBTb3JyeSBJIGRpZG4ndCBzcG90IHRoaXMgYmVmb3JlLCBidXQgYW4gYWx3YXlzLW1hcHBlZCBk
b21oZWFwIHBhZ2UgaXMKPj4ganVzdCBhbGxvY194ZW5oZWFwX3BhZ2UoKSAoZ2l2ZSBvciB0YWtl
IE5VTUEgcG9zaXRpb25pbmcgYWJvdmUgdGhlIDVUCj4+IGJvdW5kYXJ5LCB3aGljaCBpc24ndCB1
c2VkIGhlcmUpLgo+IEkgaGFkIHRoZSAod3JvbmcpIGltcHJlc3Npb24gdGhhdCB1c2luZyBkb21o
ZWFwIHdhcyBwcmVmZXJyZWQuCj4KPiBJJ20gZmluZSB3aXRoIHN3aXRjaGluZyB0byB4ZW5oZWFw
LCBvZiBjb3Vyc2UuCgpUaGlzIGlzIGEgZnJhbWUgd2hpY2ggWGVuIG5lZWRzIHRvIGhhdmUgYSBt
YXBwaW5nIHRvIGluIHBlcnBldHVpdHksIHRvCm1ha2UgaHlwZXJjYWxscy4KCk1vc3QgZXhhbXBs
ZXMgaW4gY29kZSBhcmUgYSByZWd1bGFyIGRvbWhlYXAgZnJhbWUgd2hpY2gsIGFmdGVyIHNvbWUK
Z3Vlc3QgYWN0aW9uLCByZXF1aXJlcyBtYXBwaW5nIGluIFhlbiBmb3IgYSBwZXJpb2Qgb2YgdGlt
ZSwgb3IgZnJhbWVzCndoaWNoIHdlIHdhbnQgdG8gaGF2ZSBzcGVjaWZpYyBOVU1BIHByb3BlcnRp
ZXMsIGFuZCBtYXkgYmUgYmV5b25kIHRoZQplbmQgb2YgdGhlIGRpcmVjdG1hcC4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
