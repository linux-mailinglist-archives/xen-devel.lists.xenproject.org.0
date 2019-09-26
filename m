Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615D8BF033
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRLi-00040S-QR; Thu, 26 Sep 2019 10:50:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRLg-00040B-Tw
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:50:12 +0000
X-Inumbo-ID: 6a3ff4f4-e04b-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 6a3ff4f4-e04b-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 10:50:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D3B1000;
 Thu, 26 Sep 2019 03:50:12 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BBDB3F67D;
 Thu, 26 Sep 2019 03:50:09 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <02c6fd3b-4bea-f04e-eaf3-795af7892293@arm.com>
Date: Thu, 26 Sep 2019 11:50:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaXRsZTogUGxlYXNlIHJlbW92ZSB0aGUgZnVsbCBzdG9wLgoKT24gOS8yNi8xOSAxMDo0
NiBBTSwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25n
eWF4QGFtYXpvbi5jb20+CgpQbGVhc2UgZGVzY3JpYmUgd2hhdCB0aGUgcGF0Y2ggZG9lcyBhbmQg
d2h5LiBGb3IgaW5zdGFuY2UsIHdoeSB5b3UgZG8gCnlvdSByZXBsYWNlIG1hZGRyX3RvX21mbiht
YXBfZSkgd2l0aCBJTlZBTElEX01GTj8gV2h5IG5vdCBqdXN0IHJlbW92aW5nIAp0aGUgY29tcGxl
dGUgY2FsbD8KCj4gCj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9u
LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgIHwgNCArKy0tCj4gICB4ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYyB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0
dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gaW5kZXggZTk2NGMwMzJmNi4uM2RjMmZhZDk4
NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCj4gQEAgLTEzNjcsNyArMTM2Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9f
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAKPiAgICAgICAgICAgICAgIGlmICgg
bWFwX2UgPCBlbmQgKQo+ICAgICAgICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgbWFwX3Bh
Z2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylfX3ZhKG1hcF9lKSwgbWFkZHJfdG9fbWZuKG1hcF9l
KSwKPiArICAgICAgICAgICAgICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192
YShtYXBfZSksIElOVkFMSURfTUZOLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUEZOX0RPV04oZW5kIC0gbWFwX2UpLCBQQUdFX0hZUEVSVklTT1IpOwo+ICAgICAgICAgICAg
ICAgICAgIGluaXRfYm9vdF9wYWdlcyhtYXBfZSwgZW5kKTsKPiAgICAgICAgICAgICAgICAgICBt
YXBfZSA9IGVuZDsKPiBAQCAtMTM4Miw3ICsxMzgyLDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4g
X19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAgICAgfQo+ICAgICAgICAg
ICBpZiAoIHMgPCBtYXBfcyApCj4gICAgICAgICAgIHsKPiAtICAgICAgICAgICAgbWFwX3BhZ2Vz
X3RvX3hlbigodW5zaWduZWQgbG9uZylfX3ZhKHMpLCBtYWRkcl90b19tZm4ocyksCj4gKyAgICAg
ICAgICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192YShzKSwgSU5WQUxJRF9N
Rk4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKG1hcF9zIC0gcyks
IFBBR0VfSFlQRVJWSVNPUik7Cj4gICAgICAgICAgICAgICBpbml0X2Jvb3RfcGFnZXMocywgbWFw
X3MpOwo+ICAgICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiBpbmRleCBhMDBkYjRjMGQ5Li5kZWVlYWMwNjVj
IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMKPiBAQCAtMjE1Nyw3ICsyMTU3LDcgQEAgdm9pZCAqYWxsb2NfeGVuaGVh
cF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykKPiAgICAg
ICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgMVVMIDw8IG9yZGVyLCBQQUdFX0hZUEVSVklTT1IpOwo+
ICAgCj4gLSAgICByZXR1cm4gcGFnZV90b192aXJ0KHBnKTsKPiArICAgIHJldHVybiByZXQ7CgpU
aGlzIGNoYW5nZSBsb29rcyBzcHVyaW91cy4gRGlkIHlvdSBpbnRlbmQgdG8gZG8gaXQgaW4gYSBw
cmV2aW91cyBwYXRjaD8KCkNoZWVycywKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
