Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D545FA564E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4lWZ-0000iu-7B; Mon, 02 Sep 2019 12:33:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4lWX-0000ip-NP
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 12:33:33 +0000
X-Inumbo-ID: dfec3680-cd7d-11e9-aea1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfec3680-cd7d-11e9-aea1-12813bfff9fa;
 Mon, 02 Sep 2019 12:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DEEF0B01F;
 Mon,  2 Sep 2019 12:33:31 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-2-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38900772-c8ce-bbfd-6d92-fbfe7abc7558@suse.com>
Date: Mon, 2 Sep 2019 14:33:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830082953.2192-2-paul.durrant@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBmbGFnIGlzIG5v
dCBuZWVkZWQgc2luY2UgdGhlIGRvbWFpbiAnb3B0aW9ucycgY2FuIG5vdyBiZSB0ZXN0ZWQKPiBk
aXJlY3RseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4gLS0tCj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ2M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gdjM6Cj4gIC0gRm9y
Y2UgJ29vc19vZmYnIHRvIGJlIHNldCBmb3IgUFYgZ3Vlc3RzICh0byBhdm9pZCBjYWxsIHRvCj4g
ICAgaXNfaHZtX2RvbWFpbigpIGV4Y2VwdCBpbiBBU1NFUlQpCj4gIC0gRHJvcHBlZCBUaW0ncyBB
LWIgYmVjYXVzZSBvZiB0aGUgY2hhbmdlCgpJJ3ZlIGJlZW4gZGViYXRpbmcgd2l0aCBteXNlbGYg
d2hldGhlciB0byBub3Qgd2FpdCBhbnkgbG9uZ2VyIGZvcgpUaW0gdG8gcmUtaW5zdGF0ZSBoaXMg
YWNrLCBidXQgbm93IHRoYXQgSSd2ZSBsb29rZWQgYWdhaW4gLi4uCgo+IC0tLSBhL3hlbi9jb21t
b24vZG9tYWluLmMKPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTMxMywxMSArMzEz
LDE5IEBAIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0
bF9jcmVhdGVkb21haW4gKmNvbmZpZykKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAg
IH0KPiAgCj4gLSAgICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9n
dWVzdCkgJiYKPiAtICAgICAgICAgKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9oYXAp
ICkKPiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0
KSApCj4gICAgICB7Cj4gLSAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIkhBUCByZXF1ZXN0
ZWQgZm9yIG5vbi1IVk0gZ3Vlc3RcbiIpOwo+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgICAgIGlmICggY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2hhcCApCj4gKyAgICAg
ICAgewo+ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSEFQIHJlcXVlc3RlZCBm
b3Igbm9uLUhWTSBndWVzdFxuIik7Cj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgICAgIH0KPiArCj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBJdCBpcyBvbmx5IG1lYW5p
bmdmdWwgZm9yIFhFTl9ET01DVExfQ0RGX29vc19vZmYgdG8gYmUgY2xlYXIKPiArICAgICAgICAg
KiBmb3IgSFZNIGd1ZXN0cy4KPiArICAgICAgICAgKi8KPiArICAgICAgICBjb25maWctPmZsYWdz
IHw9IFhFTl9ET01DVExfQ0RGX29vc19vZmY7CgouLi4gSSB3b25kZXIgd2hldGhlciB0aGlzIGxh
c3QgcGFydCB3b3VsZG4ndCBiZXR0ZXIgYmVsb25nIGludG8KeDg2J3MgYXJjaF9zYW5pdGlzZV9k
b21haW5fY29uZmlnKCkuIEFybSwgdG8gdGhlIGNvbnRyYXJ5LCBzaG91bGQKZm9yY2UvcmVxdWly
ZSB0aGUgYml0IHRvIGJlIHVuaWZvcm1seSBvZmYuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
