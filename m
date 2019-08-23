Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874259AF6E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 14:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i18dp-0001SB-KH; Fri, 23 Aug 2019 12:26:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Rn6=WT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i18do-0001S5-AT
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 12:26:04 +0000
X-Inumbo-ID: 2c1b336a-c5a1-11e9-b95f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c1b336a-c5a1-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566563163;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Y91wlSWi32F0y+qSKakFczCBj4NA6Av+PzmrmmPH0bs=;
 b=PuTQT9Dy2ixC1LYOiqEbkG/NscK+JN2e6Pt6iiNHHm1gzCC086JB/Xev
 Zzqz3Q99Ibt56tyS1MR2UFDLjU3Y7AI6CMRhs2yAN8U6qhTep59ucaVrP
 1drqBsKYItMTkSkmwn75sHlQJqE/5AE/1S3/KL5kcPBjgYoXP7CEKp51D 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GLrmH6RXp7CpzYLIb2jTeE1k9WdOWz5VX3i1VSYX7PjRgK0QEAnJNy6iwXGIw9M1pE7S+tkQIC
 Eo51/ohMwF9D9TympL8dsT2jIJmnSblkhXFljb6DoieXzasBdvWEFWGj77+trPyqeIySAwxVym
 NeZJe6KZrpVzHp+U+MtlRl7d19oE2DW253/sECIndTeZrILfKXnO2rf/7Ksf30RplPFFgZbgUj
 7qguKtsbgOFErxSLufLfUPaWQhpwQP7QK/JxlxydcZikKo3qtsZQ9xv4oM0TYbvJ9m84JLaftZ
 K/c=
X-SBRS: 2.7
X-MesageID: 4817916
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4817916"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-3-paul.durrant@citrix.com>
 <a109294b-6970-cf25-a2bb-fbb032ec24c9@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f3e88434-6800-2271-f5a0-9ea6776f9d40@citrix.com>
Date: Fri, 23 Aug 2019 13:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a109294b-6970-cf25-a2bb-fbb032ec24c9@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDgvMjAxOSAxMzoyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNi8wOC8yMDE5
IDE4OjE5LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IFRoZSBoYXBfZW5hYmxlZCgpIG1hY3JvIGNh
biBkZXRlcm1pbmUgd2hldGhlciB0aGUgZmVhdHVyZSBpcyBhdmFpbGFibGUKPj4gdXNpbmcgdGhl
IGRvbWFpbiAnb3B0aW9ucyc7IHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEgc2VwYXJhdGUgZmxhZy4K
Pj4KPj4gTk9URTogRnVydGhlcm1vcmUsIGJ5IGV4dGVuZGluZyBzYW5pdGl6aWluZyBvZiB0aGUg
ZG9tYWluICdvcHRpb25zJywgdGhlCj4gcy9paS9pLwo+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4gaW5kZXggOWE2ZWI4OWRk
Yy4uYmMwZGIwMzM4NyAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiBAQCAtNDYwLDYgKzQ2MCwxMiBAQCBpbnQgYXJj
aF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAq
Y29uZmlnKQo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gICAgICB9Cj4+ICAKPj4gKyAg
ICBpZiAoIChjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaGFwKSAmJiAhaHZtX2hhcF9z
dXBwb3J0ZWQoKSApCj4+ICsgICAgewo+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAi
SEFQIGVuYWJsZWQgYnV0IG5vdCBzdXBwb3J0ZWRcbiIpOwo+IHMvZW5hYmxlZC9yZXF1ZXN0ZWQv
Cj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFp
bi5jCj4+IGluZGV4IDc0NGI1NzIxOTUuLjYxMDk2MjM3MzAgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9j
b21tb24vZG9tYWluLmMKPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+PiBAQCAtMzEzLDYg
KzMxMywxMyBAQCBzdGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpCj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
PiAgICAgIH0KPj4gIAo+PiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9D
REZfaHZtX2d1ZXN0KSAmJgo+PiArICAgICAgICAgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RM
X0NERl9oYXApICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJI
QVAgZW5hYmxlZCBmb3Igbm9uLUhWTSBndWVzdFxuIik7Cj4gQWdhaW4sIEkgdGhpbmsgJ3JlcXVl
c3RlZCcgd291bGQgYmUgYmV0dGVyIGhlcmUuCj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gaW5kZXggMmU2ZTBkMzQ4
OC4uMDdhNjQ5NDdlZCAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4gQEAgLTk1NCw2ICs5NTQsMTIgQEAgc3Rh
dGljIGlubGluZSBib29sIGlzX2h2bV92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAg
IHJldHVybiBpc19odm1fZG9tYWluKHYtPmRvbWFpbik7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBoYXBfZW5hYmxlZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+PiArewo+PiAr
ICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19IVk0pICYmIC8qIG5lY2Vzc2FyeSBmb3IgcHYg
c2hpbSBidWlsZCAqLwo+PiArICAgICAgICBldmFsdWF0ZV9ub3NwZWMoZC0+b3B0aW9ucyAmIFhF
Tl9ET01DVExfQ0RGX2hhcCk7Cj4gSSdtIG5vdCBzdXJlIGhvdyBoZWxwZnVsIHRoaXMgY29tbWVu
dCBpcy7CoCBXaGF0IHNob3VsZCBiZSBoZXJlIGhvd2V2ZXIKPiBpcyBhIG5vdGUgc2F5aW5nIHRo
YXQgdGhpcyBsb2dpYyBkZXBlbmRzIG9uIGRvbWFpbl9jcmVhdGUoKSByZWplY3RpbmcKPiAhSFZN
wqAgYW5kIEhBUC4KPgo+IEFsbCBjYW4gYmUgYWRqdXN0ZWQgb24gY29tbWl0IGlmIHRoZXJlIGFy
ZSBubyBvdGhlciBjb25jZXJucy4KCk9uZSBvdGhlciB0aGluZy7CoCBXaHkgaXMgdGhpcyBldmFs
X25vc3BlYygpPwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
