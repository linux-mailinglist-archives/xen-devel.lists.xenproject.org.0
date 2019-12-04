Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6F11359D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 20:24:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icaD3-00077j-90; Wed, 04 Dec 2019 19:21:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d3Le=Z2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icaD1-00077e-RR
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 19:21:11 +0000
X-Inumbo-ID: 3a6d3cbd-16cb-11ea-820a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a6d3cbd-16cb-11ea-820a-12813bfff9fa;
 Wed, 04 Dec 2019 19:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575487270;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=v79rckf6oEDm5TGf7AWKOWN4pTJMQpFW1h/FZQoYOVs=;
 b=iEVGANA9/84OnlGoigjiyRtyghWXG/ompUzgT7Pbs5l1Zik9S6rxog5U
 YrhrT52JtSbdlPm72zmzjvzqQAxhvFjn9fgYpvayknF3d9aoE2Jk8D8GI
 o8w2WqP2JD+/w6jqNhaVQDbdvNSDhKT3/DfhZhyEkiH7p9L7p1y1D+soV k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FYyT8kLT9pJwt18RkP95ZbUn+G3gWRY6NPJdBjmDSXnF1kYB9EFPGG3FFWDtZVy+BN30GaH2wl
 Ynjy6XRBtDdzivxXc8STymeEspH6aEY6eMmQS7h00aWMEHCFqkR81P3y/4BcGHv6OhKfrkD1LL
 lf/KAAEvcP+gQ8S0QUof8lVVLA29TYuaK2DMmmKwJeOV1b5rQRQ9rC8yxVqerY/Oa8vNGabOB3
 rvziphrWTijrn7OX05Vk5GWi5jIg5tqtHcSYumH6vgVxwzy3MHzbHKqpcB9ZQ2MI0O8IIM5lf3
 3Ek=
X-SBRS: 2.7
X-MesageID: 9562235
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,278,1571716800"; 
   d="scan'208";a="9562235"
To: Jan Beulich <jbeulich@suse.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-2-andrew.cooper3@citrix.com>
 <b9b52155-6773-241d-36a8-1d519af010f1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4795588b-78a5-ba1e-265b-9bad4a3ff823@citrix.com>
Date: Wed, 4 Dec 2019 19:21:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b9b52155-6773-241d-36a8-1d519af010f1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] x86/svm: Clean up construct_vmcb()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAxMDowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTIuMjAxOSAx
MDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlIHZtY2IgaXMgemVyb2VkIG9uIGFsbG9j
YXRlIC0gZHJvcCBhbGwgZXhwbGljaXQgd3JpdGVzIG9mIDAuICBNb3ZlCj4+IGh2bV91cGRhdGVf
Z3Vlc3RfZWZlcigpIHRvIGNvLWxvY2F0ZSBpdCB3aXRoIHRoZSBvdGhlciBjb250cm9sIHJlZ2lz
dGVyCj4+IHVwZGF0ZXMuCj4+Cj4+IE1vdmUgdGhlIEJVSUxEX0JVR19PTigpIGludG8gYnVpbGRf
YXNzZXJ0aW9ucygpLCBhbmQgYWRkIHNvbWUgb2Zmc2V0IGNoZWNrcwo+PiBmb3IgZmllbGRzIGFm
dGVyIHRoZSBsYXJnZSBibG9ja3Mgb2YgcmVzZXJ2ZWQgZmllbGRzIChhcyB0aGVzZSBhcmUgdGhl
IG1vc3QKPj4gbGlrZWx5IHRvIHRyaWdnZXIgZnJvbSBhIG1pcy1lZGl0KS4gIFRha2UgdGhlIG9w
cG9ydHVuaXR5IHRvIGZvbGQgNiBhZGphY2VudAo+PiByZXMqIGZpZWxkcyBpbnRvIG9uZS4KPj4K
Pj4gRmluYWxseSwgZHJvcCBhbGwgdHJhaWxpbmcgd2hpdGVzcGFjZSBpbiB0aGUgZmlsZS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IGFsYmVp
dCB3aXRoIHR3byAob3B0aW9uYWwpIHN1Z2dlc3Rpb25zOgo+Cj4+IEBAIC0yOTcsMTQgKzI1OCwy
NiBAQCB2b2lkIF9faW5pdCBzZXR1cF92bWNiX2R1bXAodm9pZCkKPj4gIAo+PiAgc3RhdGljIHZv
aWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkKPj4gIHsKPj4g
LSAgICBzdHJ1Y3Qgc2VnbWVudF9yZWdpc3RlciBzcmVnOwo+PiArICAgIHN0cnVjdCB2bWNiX3N0
cnVjdCB2bWNiOwo+PiArCj4+ICsgICAgLyogQnVpbGQtdGltZSBjaGVjayBvZiB0aGUgVk1DQiBs
YXlvdXQuICovCj4+ICsgICAgQlVJTERfQlVHX09OKHNpemVvZih2bWNiKSAhPSBQQUdFX1NJWkUp
Owo+PiArICAgIEJVSUxEX0JVR19PTihvZmZzZXRvZihzdHJ1Y3Qgdm1jYl9zdHJ1Y3QsIF9wYXVz
ZV9maWx0ZXJfdGhyZXNoKSAhPSAweDAzYyk7Cj4+ICsgICAgQlVJTERfQlVHX09OKG9mZnNldG9m
KHN0cnVjdCB2bWNiX3N0cnVjdCwgX3ZpbnRyKSAgICAgICAgICAgICAgICE9IDB4MDYwKTsKPj4g
KyAgICBCVUlMRF9CVUdfT04ob2Zmc2V0b2Yoc3RydWN0IHZtY2Jfc3RydWN0LCBldmVudGluaikg
ICAgICAgICAgICAgIT0gMHgwYTgpOwo+PiArICAgIEJVSUxEX0JVR19PTihvZmZzZXRvZihzdHJ1
Y3Qgdm1jYl9zdHJ1Y3QsIGVzKSAgICAgICAgICAgICAgICAgICAhPSAweDQwMCk7Cj4+ICsgICAg
QlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCB2bWNiX3N0cnVjdCwgX2NwbCkgICAgICAgICAg
ICAgICAgICE9IDB4NGNiKTsKPj4gKyAgICBCVUlMRF9CVUdfT04ob2Zmc2V0b2Yoc3RydWN0IHZt
Y2Jfc3RydWN0LCBfY3I0KSAgICAgICAgICAgICAgICAgIT0gMHg1NDgpOwo+PiArICAgIEJVSUxE
X0JVR19PTihvZmZzZXRvZihzdHJ1Y3Qgdm1jYl9zdHJ1Y3QsIHJzcCkgICAgICAgICAgICAgICAg
ICAhPSAweDVkOCk7Cj4+ICsgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCB2bWNiX3N0
cnVjdCwgcmF4KSAgICAgICAgICAgICAgICAgICE9IDB4NWY4KTsKPj4gKyAgICBCVUlMRF9CVUdf
T04ob2Zmc2V0b2Yoc3RydWN0IHZtY2Jfc3RydWN0LCBfZ19wYXQpICAgICAgICAgICAgICAgIT0g
MHg2NjgpOwo+PiAgCj4+ICAgICAgLyogQ2hlY2sgc3RydWN0IHNlZ21lbnRfcmVnaXN0ZXIgYWdh
aW5zdCB0aGUgVk1DQiBzZWdtZW50IGxheW91dC4gKi8KPj4gLSAgICBCVUlMRF9CVUdfT04oc2l6
ZW9mKHNyZWcpICAgICAgICE9IDE2KTsKPj4gLSAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHNyZWcu
c2VsKSAgICE9IDIpOwo+PiAtICAgIEJVSUxEX0JVR19PTihzaXplb2Yoc3JlZy5hdHRyKSAgIT0g
Mik7Cj4+IC0gICAgQlVJTERfQlVHX09OKHNpemVvZihzcmVnLmxpbWl0KSAhPSA0KTsKPj4gLSAg
ICBCVUlMRF9CVUdfT04oc2l6ZW9mKHNyZWcuYmFzZSkgICE9IDgpOwo+PiArICAgIEJVSUxEX0JV
R19PTihzaXplb2Yodm1jYi5lcykgICAgICAgIT0gMTYpOwo+PiArICAgIEJVSUxEX0JVR19PTihz
aXplb2Yodm1jYi5lcy5zZWwpICAgIT0gMik7Cj4+ICsgICAgQlVJTERfQlVHX09OKHNpemVvZih2
bWNiLmVzLmF0dHIpICAhPSAyKTsKPj4gKyAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHZtY2IuZXMu
bGltaXQpICE9IDQpOwo+PiArICAgIEJVSUxEX0JVR19PTihzaXplb2Yodm1jYi5lcy5iYXNlKSAg
IT0gOCk7Cj4+ICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCBzZWdtZW50X3JlZ2lz
dGVyLCBzZWwpICAgIT0gMCk7Cj4+ICAgICAgQlVJTERfQlVHX09OKG9mZnNldG9mKHN0cnVjdCBz
ZWdtZW50X3JlZ2lzdGVyLCBhdHRyKSAgIT0gMik7Cj4+ICAgICAgQlVJTERfQlVHX09OKG9mZnNl
dG9mKHN0cnVjdCBzZWdtZW50X3JlZ2lzdGVyLCBsaW1pdCkgIT0gNCk7Cj4gRm9yIHRoZSBvbmVz
IG9ubHkgc3VwcGx5aW5nIGNvbnRleHQgaGVyZSwgaG93IGFib3V0IHVzaW5nIHRoZQo+IHNob3J0
ZXIgb2Zmc2V0b2YodHlwZW9mKHZtY2IuZXMpLCAuLi4pLCBhbHNvIHR5aW5nIHRoaW5ncyBiZXR0
ZXIKPiB0byB0aGUgcHJpb3Igc2l6ZW9mKCkgY2hlY2tzPyBUaGUgc2FtZSwgYWxiZWl0IHRvIGEg
bGVzc2VyIGRlZ3JlZSwKPiBtaWdodCB0aGVuIGdvIGZvciB0aGUgZWFybGllciBibG9jaywgd2hp
Y2ggY291bGQgdXNlIHRoZSBzaG9ydGVyCj4gdHlwZW9mKHZtY2IpLgoKRml4ZWQuCgo+Cj4+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKPj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaAo+PiBAQCAtNDA2LDEyICs0MDYsNyBAQCBzdHJ1Y3Qg
dm1jYl9zdHJ1Y3Qgewo+PiAgICAgIHUzMiBfZXhjZXB0aW9uX2ludGVyY2VwdHM7ICAvKiBvZmZz
ZXQgMHgwOCAtIGNsZWFuYml0IDAgKi8KPj4gICAgICB1MzIgX2dlbmVyYWwxX2ludGVyY2VwdHM7
ICAgLyogb2Zmc2V0IDB4MEMgLSBjbGVhbmJpdCAwICovCj4+ICAgICAgdTMyIF9nZW5lcmFsMl9p
bnRlcmNlcHRzOyAgIC8qIG9mZnNldCAweDEwIC0gY2xlYW5iaXQgMCAqLwo+PiAtICAgIHUzMiBy
ZXMwMTsgICAgICAgICAgICAgICAgICAvKiBvZmZzZXQgMHgxNCAqLwo+PiAtICAgIHU2NCByZXMw
MjsgICAgICAgICAgICAgICAgICAvKiBvZmZzZXQgMHgxOCAqLwo+PiAtICAgIHU2NCByZXMwMzsg
ICAgICAgICAgICAgICAgICAvKiBvZmZzZXQgMHgyMCAqLwo+PiAtICAgIHU2NCByZXMwNDsgICAg
ICAgICAgICAgICAgICAvKiBvZmZzZXQgMHgyOCAqLwo+PiAtICAgIHU2NCByZXMwNTsgICAgICAg
ICAgICAgICAgICAvKiBvZmZzZXQgMHgzMCAqLwo+PiAtICAgIHUzMiByZXMwNjsgICAgICAgICAg
ICAgICAgICAvKiBvZmZzZXQgMHgzOCAqLwo+PiArICAgIHUzMiByZXMwMVsxMF07Cj4gV2FzIGl0
IGludGVudGlvbmFsIGZvciB0aGUgY29tbWVudCB0byBiZSBsb3N0IGFsdG9nZXRoZXI/CgpZZXMu
wqAgVGhlIG9mZnNldCBpcyB0cml2aWFsICgweDEwICsgc2l6ZW9mKHUzMikpIGFuZCBvZiBubyBp
bnRlcmVzdC4KCk9taXR0aW5nIGl0IGluY3JlYXNlcyByZWFkYWJpbGl0eSBieSBoZWxwaW5nIHRv
IGhpZ2hsaWdodCB3aGVyZSB0aGUKcmVzZXJ2ZWQgYmxvY2tzIGFyZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
