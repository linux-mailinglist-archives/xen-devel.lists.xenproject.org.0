Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740E12F978
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:04:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOTE-0007Gb-6v; Fri, 03 Jan 2020 15:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inOTC-0007GW-VE
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:02:34 +0000
X-Inumbo-ID: 1188dc44-2e3a-11ea-a4c0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1188dc44-2e3a-11ea-a4c0-12813bfff9fa;
 Fri, 03 Jan 2020 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578063753;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vdApFXcRyoeWV5YBRKQ6h+ZzkPOh/ZyqU98tEYVfGaA=;
 b=fo/MEqqsvspjSf+pqYeYGiCcNagX+oaNj/XlaicOQmhrUaI7EX5YNOuf
 UrwJPDLkP5iC58yE4XpZbQN8BCKkKbZTjYTnJqjxUejgO76SBYxrDau2g
 zd/M4eBRtWskhmXBM1wi4vhJFUM34+ax8kAiMXMpotWemp0wSTwmTyjLq M=;
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
IronPort-SDR: zBPtATufBHwBJH2YM2V+dP5wutJO72R19OTWPLPdx2HSnZDwPJZ7f+EbCu6lEVxePm4FO1yHcm
 EzcmRo/JimtFb3lP5sQ5Xqi5BjUYntQ4PsUOuO4rNrW0asXsFIwMBaF1Lx63YM4Ev8Dkxe/yL6
 RGXN3WvEjoKu2Sxux9tcU5rrALGSHBK3s7mQcEB6s/bGSAhjl7kk8svsaeqtu5B/2hj9ktF9T1
 NRgZ8R/A1y9dk3fIC8LEq2xrjVsupgtHpC0IlsRPDi2jVbWllvlUCfFGSjuUe1C//gGON5DOPB
 IR8=
X-SBRS: 2.7
X-MesageID: 10784635
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,391,1571716800"; d="scan'208";a="10784635"
To: Jan Beulich <jbeulich@suse.com>
References: <20191217201550.15864-1-andrew.cooper3@citrix.com>
 <20191217201550.15864-5-andrew.cooper3@citrix.com>
 <a954c0a2-7ef0-4cf8-2a67-3972e7368d7e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c26cd7d9-1be5-92a2-efe4-16e4c2d747ae@citrix.com>
Date: Fri, 3 Jan 2020 15:02:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a954c0a2-7ef0-4cf8-2a67-3972e7368d7e@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/4] tools/dombuilder: Don't allocate
 dom->p2m_host[] for translated domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMTIuMjAxOSAy
MToxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94
Y19kb20uaAo+PiArKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hjX2RvbS5oCj4+IEBAIC0xMjMs
MTYgKzEyMywxMiBAQCBzdHJ1Y3QgeGNfZG9tX2ltYWdlIHsKPj4gIAo+PiAgICAgIC8qIG90aGVy
IHN0YXRlIGluZm8gKi8KPj4gICAgICB1aW50MzJfdCBmX2FjdGl2ZVtYRU5GRUFUX05SX1NVQk1B
UFNdOwo+PiArCj4+ICAgICAgLyoKPj4gLSAgICAgKiBwMm1faG9zdCBtYXBzIGd1ZXN0IHBoeXNp
Y2FsIGFkZHJlc3NlcyBhbiBvZmZzZXQgZnJvbQo+PiAtICAgICAqIHJhbWJhc2VfcGZuIChzZWUg
YmVsb3cpIGludG8gZ2Zucy4KPiBUaGUgcmVtb3ZhbCBvZiB0aGlzIHBhcnQgb2YgdGhlIGNvbW1l
bnQgYW5kIC4uLgo+Cj4+IC0gICAgICogRm9yIGEgcHVyZSBQViBndWVzdCB0aGlzIG1lYW5zIHRo
YXQgaXQgbWFwcyBHUEZOcyBpbnRvIE1GTnMgZm9yCj4+IC0gICAgICogYSBoeWJyaWQgZ3Vlc3Qg
dGhpcyBtZWFucyB0aGF0IGl0IG1hcHMgR1BGTnMgdG8gR1BGTlMuCj4+IC0gICAgICoKPj4gLSAg
ICAgKiBOb3RlIHRoYXQgdGhlIGlucHV0IGlzIG9mZnNldCBieSByYW1iYXNlLgo+PiArICAgICAq
IHB2X3AybSBpcyBzcGVjaWZpYyB0byB4ODYgUFYgZ3Vlc3RzLCBhbmQgbWFwcyBHRk5zIHRvIE1G
TnMuICBJdCBpcwo+PiArICAgICAqIGV2ZW50dWFsbHkgY29waWVkIGludG8gZ3Vlc3QgY29udGV4
dC4KPj4gICAgICAgKi8KPj4gLSAgICB4ZW5fcGZuX3QgKnAybV9ob3N0Owo+PiArICAgIHhlbl9w
Zm5fdCAqcHZfcDJtOwo+PiAgCj4+ICAgICAgLyogcGh5c2ljYWwgbWVtb3J5Cj4+ICAgICAgICoK
Pj4gQEAgLTQzMyw5ICs0MjksMTIgQEAgc3RhdGljIGlubGluZSB4ZW5fcGZuX3QgeGNfZG9tX3Ay
bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20sIHhlbl9wZm5fdCBwZm4pCj4+ICB7Cj4+ICAgICAg
aWYgKCB4Y19kb21fdHJhbnNsYXRlZChkb20pICkKPj4gICAgICAgICAgcmV0dXJuIHBmbjsKPj4g
LSAgICBpZiAocGZuIDwgZG9tLT5yYW1iYXNlX3BmbiB8fCBwZm4gPj0gZG9tLT5yYW1iYXNlX3Bm
biArIGRvbS0+dG90YWxfcGFnZXMpCj4+ICsKPj4gKyAgICAvKiB4ODYgUFYgb25seSBub3cuICov
Cj4+ICsgICAgaWYgKCBwZm4gPj0gZG9tLT50b3RhbF9wYWdlcyApCj4+ICAgICAgICAgIHJldHVy
biBJTlZBTElEX01GTjsKPj4gLSAgICByZXR1cm4gZG9tLT5wMm1faG9zdFtwZm4gLSBkb20tPnJh
bWJhc2VfcGZuXTsKPj4gKwo+PiArICAgIHJldHVybiBkb20tPnB2X3AybVtwZm5dOwo+PiAgfQo+
IC4uLiB0aGUgZHJvcHBpbmcgb2YgYWxsIHVzZXMgb2YgcmFtYmFzZV9wZm4gaGVyZSBtYWtlIGl0
IGxvb2sKPiBsaWtlIHlvdSdyZSBkb2luZyBhd2F5IHdpdGggdGhhdCBjb25jZXB0IGFsdG9nZXRo
ZXIuIElzIHRoaXMKPiByZWFsbHkgY29ycmVjdD8KCldlbGwgLSBpdCBpcyBlZmZlY3RpdmVseSBk
ZWFkIGNvZGUgaGVyZSwgYmVjYXVzZSBvZiB0aGUKeGNfZG9tX3RyYW5zbGF0ZWQoKSBpbiBjb250
ZXh0IGFib3ZlLCBhbmQgaXQgYmVpbmcgMCBvdXRzaWRlIG9mIEFSTS4KClRoZSAobm9uemVybykg
dmFsdWUgaXMgdXNlZCBieSBvdGhlciBiaXRzIG9mIEFSTSBjb2RlLgoKPiAgSWYgc28sIEkgZ3Vl
c3MgeW91IHdhbnQgdG8KPiAtIHNheSBhIHdvcmQgaW4gdGhpcyByZWdhcmQgaW4gdGhlIGRlc2Ny
aXB0aW9uLCB0aGUgbW9yZSB0aGF0Cj4gICB5b3UgZG9uJ3QgZnVsbHkgZ2V0IHJpZCBvZiB0aGlz
ICh0aGUgc3RydWN0dXJlIGZpZWxkIGFuZAo+ICAgc29tZSB1c2VzIGVsc2V3aGVyZSByZW1haW4p
LAo+IC0gZHJvcC9hZGp1c3QgdGhlIHJlc3BlY3RpdmUgY29tbWVudCBmcmFnbWVudCBuZXh0IHRv
IHRoZQo+ICAgZmllbGQgYSBsaXR0bGUgZnVydGhlciBkb3duIGluIHRoZSBzdHJ1Y3R1cmUuCgpU
aGUgZG9tYWluIGJ1aWxkZXIgaXMgbWFkZSBhbG1vc3QgZXhjbHVzaXZlbHkgb2YgYml0cm90LCBi
dXQgSSBkb24ndApoYXZlIGFuIEFSTSBzeXN0ZW0gdG8gZG8gYW55IHRlc3Rpbmcgb24uwqAgR2l2
ZW4gaG93IGZyYWdpbGUgdGhlIGNvZGUgaXMsCkknbSBub3QgY29tZm9ydGFibGUgZG9pbmcgc3Bl
Y3VsYXRpdmUgZGVsZXRpb24gb2YgY29kZSBJJ20gbm90IGNlcnRhaW4KaXMgdW51c2VkLgoKPgo+
PiBAQCAtMTI0NSwxMSArMTI0NSwxMSBAQCBzdGF0aWMgaW50IG1lbWluaXRfcHYoc3RydWN0IHhj
X2RvbV9pbWFnZSAqZG9tKQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gICAgICB9Cj4+
ICAKPj4gLSAgICBkb20tPnAybV9ob3N0ID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5f
cGZuX3QpICogZG9tLT5wMm1fc2l6ZSk7Cj4+IC0gICAgaWYgKCBkb20tPnAybV9ob3N0ID09IE5V
TEwgKQo+PiArICAgIGRvbS0+cHZfcDJtID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5f
cGZuX3QpICogZG9tLT5wMm1fc2l6ZSk7Cj4gU2luY2UgeW91J3JlIHRvdWNoaW5nIHRoZSBsaW5l
IGFueXdheSwgcGVyaGFwcyBiZXR0ZXIKPiBzaXplb2YoKmRvbS0+cHZfcDJtKT8KCldpbGwgZml4
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
