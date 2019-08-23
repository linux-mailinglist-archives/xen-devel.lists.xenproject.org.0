Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA49AF6F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 14:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i18bv-000164-77; Fri, 23 Aug 2019 12:24:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Rn6=WT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i18bt-00015z-07
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 12:24:05 +0000
X-Inumbo-ID: e4c2f8d6-c5a0-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4c2f8d6-c5a0-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566563044;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9jA9INtNQROnH/QPsymDUGRQxXkqKi8z3iEry/Vdh7Q=;
 b=Vl44BpjiVo1SJbGMiHxh1Z6mWQiHZgfGiI/A39KTHzNN0hNtUnwMBHjQ
 lVuKj1B2QOaise5SVlXo+rcmWgxUDFM+0vn/ZksIfWnhX9x6CY2qka9Fg
 b1jHJ1o3xz2G247Clxd4y97VwiSZHhnRU0jzRUVhEBD8teZcAuh/1waWC M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qfG1zBeeNzaC7lqpfwc9DGI4Hagfue3GdShjWGsMk96f4vmEsdz9h6W3ml1q/ni/iLqj5ObO8n
 Xf8P1XOECw5Q/9ZKSYpik6aoiDarQmkvfokgtCbB4CBYBayhz+YYZ7ld2EgdJQhnSt0vr8TGXx
 quFeld6/amdK1IOm5EbBtfFSduxcgamQwLzD5kLZNyb4zUNlPgO7Hp14z2fEq9gBZZbLWF73jW
 6taJzL3oE7GlJYjYS8bwn8Kl31ef4m8tVoAAYkKi8fFDadzUC3ueFTuZY9eZyGDxqDeopJ8pE4
 U5Y=
X-SBRS: 2.7
X-MesageID: 4677172
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4677172"
To: Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-3-paul.durrant@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a109294b-6970-cf25-a2bb-fbb032ec24c9@citrix.com>
Date: Fri, 23 Aug 2019 13:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-3-paul.durrant@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 02/10] x86/hvm/domain: remove the
 'hap_enabled' flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDgvMjAxOSAxODoxOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBoYXBfZW5hYmxl
ZCgpIG1hY3JvIGNhbiBkZXRlcm1pbmUgd2hldGhlciB0aGUgZmVhdHVyZSBpcyBhdmFpbGFibGUK
PiB1c2luZyB0aGUgZG9tYWluICdvcHRpb25zJzsgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBzZXBh
cmF0ZSBmbGFnLgo+Cj4gTk9URTogRnVydGhlcm1vcmUsIGJ5IGV4dGVuZGluZyBzYW5pdGl6aWlu
ZyBvZiB0aGUgZG9tYWluICdvcHRpb25zJywgdGhlCgpzL2lpL2kvCgo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBpbmRleCA5YTZl
Yjg5ZGRjLi5iYzBkYjAzMzg3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC00NjAsNiArNDYwLDEyIEBAIGludCBh
cmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
ICpjb25maWcpCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICB9Cj4gIAo+ICsgICAg
aWYgKCAoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2hhcCkgJiYgIWh2bV9oYXBfc3Vw
cG9ydGVkKCkgKQo+ICsgICAgewo+ICsgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJIQVAg
ZW5hYmxlZCBidXQgbm90IHN1cHBvcnRlZFxuIik7CgpzL2VuYWJsZWQvcmVxdWVzdGVkLwoKPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBp
bmRleCA3NDRiNTcyMTk1Li42MTA5NjIzNzMwIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vZG9t
YWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTMxMyw2ICszMTMsMTMgQEAg
c3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0
ZWRvbWFpbiAqY29uZmlnKQo+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgfQo+ICAK
PiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0KSAm
Jgo+ICsgICAgICAgICAoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2hhcCkgKQo+ICsg
ICAgewo+ICsgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJIQVAgZW5hYmxlZCBmb3Igbm9u
LUhWTSBndWVzdFxuIik7CgpBZ2FpbiwgSSB0aGluayAncmVxdWVzdGVkJyB3b3VsZCBiZSBiZXR0
ZXIgaGVyZS4KCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKPiBpbmRleCAyZTZlMGQzNDg4Li4wN2E2NDk0N2VkIDEwMDY0NAo+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPiBAQCAtOTU0LDYgKzk1NCwxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfaHZtX3Zj
cHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4gICAgICByZXR1cm4gaXNfaHZtX2RvbWFpbih2LT5k
b21haW4pOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaGFwX2VuYWJsZWQoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCkKPiArewo+ICsgICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hW
TSkgJiYgLyogbmVjZXNzYXJ5IGZvciBwdiBzaGltIGJ1aWxkICovCj4gKyAgICAgICAgZXZhbHVh
dGVfbm9zcGVjKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9oYXApOwoKSSdtIG5vdCBzdXJl
IGhvdyBoZWxwZnVsIHRoaXMgY29tbWVudCBpcy7CoCBXaGF0IHNob3VsZCBiZSBoZXJlIGhvd2V2
ZXIKaXMgYSBub3RlIHNheWluZyB0aGF0IHRoaXMgbG9naWMgZGVwZW5kcyBvbiBkb21haW5fY3Jl
YXRlKCkgcmVqZWN0aW5nCiFIVk3CoCBhbmQgSEFQLgoKQWxsIGNhbiBiZSBhZGp1c3RlZCBvbiBj
b21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbmNlcm5zLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
