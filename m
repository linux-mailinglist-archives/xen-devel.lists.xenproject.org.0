Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FFA58F2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:15:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4n3T-0002i6-PP; Mon, 02 Sep 2019 14:11:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4n3S-0002hu-AJ
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:11:38 +0000
X-Inumbo-ID: 92f6aa5a-cd8b-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92f6aa5a-cd8b-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 14:11:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D54DAAD05;
 Mon,  2 Sep 2019 14:11:35 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
 <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
 <6178c787fecf4d8e80967e2681937b0d@AMSPEX02CL03.citrite.net>
 <0b37db94-2051-4ea0-e518-6222346a82c1@suse.com>
 <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0aa7c7e-82a9-4b94-4c00-d9faa763d505@suse.com>
Date: Mon, 2 Sep 2019 16:11:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4dc00c06cae742fdaf13a2d62ed73877@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: WeiLiu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim\(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNTo1OSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDE0OjQ2Cj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPgo+PiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNA
Y2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdQo+PiBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpTGl1Cj4+IDx3
bEB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDEvNl0geDg2L2RvbWFpbjogcmVt
b3ZlIHRoZSAnb29zX29mZicgZmxhZwo+Pgo+PiBPbiAwMi4wOS4yMDE5IDE1OjA2LCBQYXVsIER1
cnJhbnQgd3JvdGU6Cj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
Pj4+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDEzOjM0Cj4+Pj4KPj4+PiBPbiAzMC4wOC4yMDE5
IDEwOjI5LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWlu
LmMKPj4+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+Pj4+PiBAQCAtMzEzLDExICszMTMs
MTkgQEAgc3RhdGljIGludCBzYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3Rs
X2NyZWF0ZWRvbWFpbiAqY29uZmlnKQo+Pj4+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+
Pj4gICAgICB9Cj4+Pj4+Cj4+Pj4+IC0gICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9N
Q1RMX0NERl9odm1fZ3Vlc3QpICYmCj4+Pj4+IC0gICAgICAgICAoY29uZmlnLT5mbGFncyAmIFhF
Tl9ET01DVExfQ0RGX2hhcCkgKQo+Pj4+PiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVO
X0RPTUNUTF9DREZfaHZtX2d1ZXN0KSApCj4+Pj4+ICAgICAgewo+Pj4+PiAtICAgICAgICBkcHJp
bnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVlc3RlZCBmb3Igbm9uLUhWTSBndWVzdFxuIik7Cj4+
Pj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiArICAgICAgICBpZiAoIGNvbmZpZy0+
ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXAgKQo+Pj4+PiArICAgICAgICB7Cj4+Pj4+ICsgICAg
ICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVlc3RlZCBmb3Igbm9uLUhWTSBn
dWVzdFxuIik7Cj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gKyAgICAg
ICAgfQo+Pj4+PiArCj4+Pj4+ICsgICAgICAgIC8qCj4+Pj4+ICsgICAgICAgICAqIEl0IGlzIG9u
bHkgbWVhbmluZ2Z1bCBmb3IgWEVOX0RPTUNUTF9DREZfb29zX29mZiB0byBiZSBjbGVhcgo+Pj4+
PiArICAgICAgICAgKiBmb3IgSFZNIGd1ZXN0cy4KPj4+Pj4gKyAgICAgICAgICovCj4+Pj4+ICsg
ICAgICAgIGNvbmZpZy0+ZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfb29zX29mZjsKPj4+Pgo+Pj4+
IC4uLiBJIHdvbmRlciB3aGV0aGVyIHRoaXMgbGFzdCBwYXJ0IHdvdWxkbid0IGJldHRlciBiZWxv
bmcgaW50bwo+Pj4+IHg4NidzIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpLiBBcm0sIHRv
IHRoZSBjb250cmFyeSwgc2hvdWxkCj4+Pj4gZm9yY2UvcmVxdWlyZSB0aGUgYml0IHRvIGJlIHVu
aWZvcm1seSBvZmYuCj4+Pj4KPj4+Cj4+PiBJJ20gc3VyZSBJIGhhZCBhIHJlYXNvbiBmb3IgZG9p
bmcgaXQgbGlrZSB0aGlzIGJ1dCBpdCdzIHN1ZmZpY2llbnRseSBsb25nCj4+PiBhZ28gbm93IHRo
YXQgSSd2ZSBmb3Jnb3R0ZW4gd2hhdCBpdCB3YXMqLiBXb3VsZCBpdCBiZSBvayB0byB0YWtlIHRo
ZSBjb2RlCj4+PiBhcy1pcyBhbmQgSSdsbCBpbnZlc3RpZ2F0ZSB3aGV0aGVyIHRoaXMgY2FuIGJl
IHRpZGllZCB1cD8KPj4KPj4gV2VsbCwgd2l0aCB0aGlzIHBlbmRpbmcgcXVlc3Rpb24gSSdtIGxl
c3MgaW5jbGluZWQgdG8gc3RvcCB3YWl0aW5nIGZvcgo+PiB0aGUgb3V0c3RhbmRpbmcgYWNrcy4K
Pj4KPj4+IFsgKiBJIHN1c3BlY3QgaXQgd2FzIGNvbmNlcm4gb3ZlciBicmVha2luZyBleGlzdGlu
ZyB0b29sLXN0YWNrcyBieQo+Pj4gcmVxdWlyaW5nIHRoZW0gdG8gc2V0IGEgZmxhZyB0aGF0IHBy
ZXZpb3VzbHkgdGhleSBkaWQgbm90IG5lZWQgdG8sIGJ1dAo+Pj4gSSdtIG5vdCBzdXJlIHRoYXQg
d2FzIHRoZSBvbmx5IHJlYXNvbiBdCj4+Cj4+IFNlZW1zIHJhdGhlciB1bmxpa2VseSB0byBtZSwg
YXMgdGhlcmUgd291bGRuJ3QgYmUgYW55IGRpZmZlcmVuY2UgKGZyb20KPj4gdG9vbCBzdGFjayBw
ZXJzcGVjdGl2ZSkgaWYgdGhlIGFkanVzdG1lbnQgd2FzIGRvbmUgYnkgcGVyLWFyY2ggY29kZS4K
PiAKPiBPaywgaWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgSSdsbCBtb3ZlIHRoZSBodW5r
LgoKV2VsbCwgd2FpdCAtIG5vdCB0aGUgaHVuay4gVGhlIEhBUCBwYXJ0IHNob3VsZCByZW1haW4g
aW4gY29tbW9uIGNvZGUKaW1vLiBUaGUgT09TIHBhcnQgd2FudHMgZG9pbmcgZGlmZmVyZW50bHkg
aW4geDg2IGFuZCBBcm0gY29kZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
