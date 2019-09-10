Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8366AE723
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 11:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7cYg-00038m-GF; Tue, 10 Sep 2019 09:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zTA9=XF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7cYe-00038h-U5
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:35:33 +0000
X-Inumbo-ID: 54e59838-d3ae-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54e59838-d3ae-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568108133;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KvEzUz27ZN8uU8WwwIVt0mjm0MrGWUhj5OLSu7NNjXU=;
 b=fIOBohWYVltEhjZm9MtzDZ2166pkzDTUs7Hp1zYr02AvTpjjy74Thlgf
 HbwSdpBtrTVddfNqZYohu9dcXFzVmIy2GM1qWN5gbApYfChX6Bobp7F71
 P/C91GgWxJB7DRLOzkTRCiUMgW/EPij6kg1iPcE8QpYB6hNCSRoJTmyoK w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mL1YdN6g1ozKtw2VkEiLMzAfsxSddmh0s5uYpHLsXhpiqBL2s5wJ3oN6sRUYwV4dt/eLhfLxpk
 FfEhtNCxnmCVXFsmpQqZCgMHpyyQywGESFmwCjMbDrCbq9OVrdOT1derCuK/+pgcuK9SXPcLvq
 KeuX7ga+m5Jh7I//tfZBspdTyhQerCg5TmEnKAVmvh0hQz9P6D145oNXO+M+4+EdB2H+cpw/xN
 bQYiqpjas8/2IVBDkpIYGbQnhnWvk175zXm5BsltODlZoRkCaTcR462DqcVhBRSkxoLE3Ftfeg
 TiA=
X-SBRS: 2.7
X-MesageID: 5360035
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5360035"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
 <20190910092912.s2seglrzng22zhjm@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3d8def41-e192-6d3a-066d-33d0585a66f7@citrix.com>
Date: Tue, 10 Sep 2019 10:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910092912.s2seglrzng22zhjm@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAxMDoyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIFNl
cCAwOSwgMjAxOSBhdCAwNDo1MToyNFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiA3
YTAgaXMgYW4gaW50ZWdlciBmaWVsZCwgbm90IGEgbWFzayAtIHRha2luZyB0aGUgbG9naWNhbCBh
bmQgb2YgdGhlIGhhcmR3YXJlCj4+IGFuZCBwb2xpY3kgdmFsdWVzIHJlc3VsdHMgaW4gbm9uc2Vu
c2UuICBJbnN0ZWFkLCB0YWtlIHRoZSBwb2xpY3kgdmFsdWUKPj4gZGlyZWN0bHkuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+
IC0tLQo+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+PiBDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KPj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+Pgo+PiBFdmVuIFJvbWUgaGFyZHdhcmUgaGFzIDdbMF0uZWF4IHN0aWxsIGFzIDAsIGFu
ZCB0aGVyZSBpcyBubyBzZW5zaWJsZSByZWFzb24gdG8KPj4gc2V0IG1heF9zdWJsZWFmIGhpZ2hl
ciBhdCB0aGlzIHBvaW50LCBzbyB0aGlzIGlzIG9ubHkgYSBsYXRlbnQgYnVnIGZvciBub3cuCj4+
IC0tLQo+PiAgeGVuL2FyY2gveDg2L2RvbWN0bC5jIHwgMTMgKysrKysrKysrLS0tLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+PiBp
bmRleCAxZTk4ZmM4MDA5Li4zNWFkOGNiNTFjIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
ZG9tY3RsLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4+IEBAIC0yMTgsMTEgKzIx
OCwxNiBAQCBzdGF0aWMgaW50IHVwZGF0ZV9kb21haW5fY3B1aWRfaW5mbyhzdHJ1Y3QgZG9tYWlu
ICpkLAo+PiAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAoKGxldmVsbGluZ19jYXBz
ICYgTENBUF83YWIwKSA9PSBMQ0FQXzdhYjApICkKPj4gICAgICAgICAgewo+PiAgICAgICAgICAg
ICAgdWludDY0X3QgbWFzayA9IGNwdWlkbWFza19kZWZhdWx0cy5fN2FiMDsKPj4gLSAgICAgICAg
ICAgIHVpbnQzMl90IGVheCA9IGN0bC0+ZWF4Owo+PiAtICAgICAgICAgICAgdWludDMyX3QgZWJ4
ID0gcC0+ZmVhdC5fN2IwOwo+PiAgCj4+IC0gICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPj4gLSAg
ICAgICAgICAgICAgICBtYXNrICY9ICgodWludDY0X3QpZWF4IDw8IDMyKSB8IGVieDsKPj4gKyAg
ICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAgKiBMZWFmIDdbMF0uZWF4IGlzIG1heF9zdWJs
ZWFmLCBub3QgYSBmZWF0dXJlIG1hc2suICBUYWtlIGl0Cj4+ICsgICAgICAgICAgICAgKiB3aG9s
ZXNhbGUgZnJvbSB0aGUgcG9saWN5LCBidXQgY2xhbXAgdGhlIGZlYXR1cmVzIGluIDdbMF0uZWJ4
Cj4+ICsgICAgICAgICAgICAgKiBwZXIgdXN1YWwuCj4+ICsgICAgICAgICAgICAgKi8KPj4gKyAg
ICAgICAgICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYKPj4gKyAgICAgICAgICAg
ICAgICAgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRPUl9IWUdPTikgKQo+PiArICAgICAgICAg
ICAgICAgIG1hc2sgPSAoKCh1aW50NjRfdClwLT5mZWF0Lm1heF9zdWJsZWFmIDw8IDMyKSB8Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAoKHVpbnQzMl90KW1hc2sgfCBwLT5mZWF0Ll83YjAp
KTsKPiBXaHkgZG8geW91IHNldCB0aGUgaGlnaCBiaXRzIG9mIHRoZSBtYXNrICg2MzozMCkgd2l0
aCB0aGUgbWF4IHN1YmxlYWY/Cgo2MzozMgoKPiBBY2NvcmRpbmcgdG8gdGhlIGRvY3VtZW50IEkg
aGF2ZSBiaXRzIDYzOjMwIGFyZSByZXNlcnZlZCwgYW5kIHRoYXQKPiBzZWVtcyB0byBtYXRjaCB0
aGUgZXhwZWN0ZWQgQ1BVSUQgcmV0dXJuIHZhbHVlLCB0aGF0IGxpc3RzIENQVUlECj4gRm4wMDAw
XzAwMDdfRUFYX3gwIGNvbnRlbnQgYXMgcmVzZXJ2ZWQuCgpZZXMsIGJ1dCByZXNlcnZlZCBkb2Vz
bid0IG1lYW4gIndpbGwgI0dQIi7CoCBBcyBJIHNhaWQgb24gSVJDLCB0aGlzIE1TUgoqaXMqIHRo
ZSB2YWx1ZSB3aGljaCBnZXRzIGZvcndhcmRlZCBpbnRvIGEgQ1BVSUQgaW52b2NhdGlvbiwgYW5k
IHNldHRpbmcKbWF4X3N1YmxlYWYgdG8gMHhkZWFkIGRvZXMgd29yayBmaW5lLgoKVGhlIHBvaW50
IGhlcmUgaXMgdGhhdCBpbiB0aGUgZnV0dXJlLCBvbiBoYXJkd2FyZSBjYXBhYmxlIG9mCm1heF9z
dWJsZWFmPTIgYW5kIGJlaW5nIGxldmVsbGVkIHRvIG1heF9zdWJsZWFmPTEsIHRoZSB2YWx1ZSBv
YnNlcnZlZCBpbgpDUFVJRCBzaG91bGQgYmUgMSwgbm90IDAuCgpUaGUgbGF0dGVyIGlzIHdoYXQg
dGhlIGN1cnJlbnQgbG9naWMgZG9lcywgYW5kIGlzIGJyb2tlbi7CoCBUaGUgQ1BVSUQKZGVyaXZh
dGlvbiBsb2dpYyB3aWxsIGVuc3VyZSB0aGF0IHBvbGljeSBtYXhfc3VibGVhZiA8PSBoYXJkd2Fy
ZQptYXhfc3VibGVhZi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
