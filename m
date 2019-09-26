Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5780BF145
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:27:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRsq-0000z7-HY; Thu, 26 Sep 2019 11:24:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRsp-0000z1-NC
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:24:27 +0000
X-Inumbo-ID: 32cf55fa-e050-11e9-9650-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 32cf55fa-e050-11e9-9650-12813bfff9fa;
 Thu, 26 Sep 2019 11:24:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E6F142F;
 Thu, 26 Sep 2019 04:24:26 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 970C43F67D;
 Thu, 26 Sep 2019 04:24:23 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190926100308.33936-1-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <64022609-fdd5-f9bd-4975-228213a2572a@arm.com>
Date: Thu, 26 Sep 2019 12:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926100308.33936-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: avoid triggering
 ASSERT_UNREACHABLE() on ARM...
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
 Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDkvMjYvMTkgMTE6MDMgQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPiAuLi53
aGVuIHRoZSBJT01NVSBpcyBub3QgZW5hYmxlZC4KPiAKPiA4MGZmM2QzMzhkYzkgImlvbW11OiB0
aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkKPiBtYWNy
b3MiIGludHJvZHVjZWQgQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFLCB3aGljaCBjYXVzZXMg
dGhlIGdsb2JhbAo+ICdpb21tdV9oYXBfcHRfc2hhcmUnIG9wdGlvbiB0byBiZSByZXBsYWNlZCB3
aXRoIGEgI2RlZmluZS1kIHZhbHVlIG9mIHRydWUuCj4gSW4gdGhpcyBjb25maWd1cmF0aW9uLCBj
YWxsaW5nIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpbGwgcmVzdWx0Cj4gdHJpZ2dlciB0
aGUgYWZvcmVtZW50aW9uZWQgQVNTRVJULgo+IAo+IENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFS
RSBpcyBhbHdheXMgc2VsZWN0ZWQgZm9yIEFSTSBidWlsZHMgYW5kLAo+IGJlY2F1c2UgY2xlYXJf
aW9tbXVfaGFwX3B0X3NoYXJlKCkgaXMgY2FsbGVkIGJ5IHRoZSBjb21tb24gaW9tbXVfc2V0dXAo
KQo+IGZ1bmN0aW9uIGlmIHRoZSBJT01NVSBpcyBub3QgZW5hYmxlZCwgaXQgaXMgbm8gbG9uZ2Vy
IHNhZmUgdG8gZGlzYWJsZSB0aGUKPiBJT01NVSBvbiBBUk0gc3lzdGVtcy4KPiAKPiBIb3dldmVy
LCBydW5uaW5nIHdpdGggdGhlIElPTU1VIGRpc2FibGVkIGlzIGEgdmFsaWQgY29uZmlndXJhdGlv
biBmb3IgQVJNCj4gc3lzdGVtcywgc28gdGhpcyBwYXRjaCByZWN0aWZpZXMgdGhlIHByb2JsZW0g
YnkgcmVtb3ZpbmcgdGhlIGNhbGwgdG8KPiBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUoKSBmcm9t
IGNvbW1vbiBjb2RlLiBBcyBhIHNpZGUgZWZmZWN0IG9mIHRoaXMsCj4gaG93ZXZlciwgaXQgYmVj
b21lcyBwb3NzaWJsZSBvbiB4ODYgc3lzdGVtcyBmb3IgaW9tbXVfZW5hYmxlZCB0byBiZSBmYWxz
ZQo+IGJ1dCBpb21tdV9oYXBfcHRfc2hhcmUgdG8gYmUgdHJ1ZS4gVGh1cyB0aGUgY29kZSBpbiBz
eXNjdGwuYwo+IG5lZWRzIHRvIGJlIGNoYW5nZWQgdG8gbWFrZSBzdXJlIHRoYXQgWEVOX1NZU0NU
TF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZQo+IGlzIG5vdCBlcnJvbmVvdXNseSBhZHZlcnRp
c2VkIHdoZW4gdGhlIElPTU1VIGhhcyBiZWVuIGRpc2FibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmVwb3J0ZWQtYnk6IE9s
ZWtzYW5kciA8b2xla3N0eXNoQGdtYWlsLmNvbT4KCldpdGggb25lIE5JVCBiZWxvdzoKCkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiAtLS0KPiBDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogVGltIERlZWdhbiA8dGltQHhl
bi5vcmc+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gLS0tCj4gICB4ZW4vY29tbW9uL3N5
c2N0bC5jICAgICAgICAgICAgIHwgNiArKysrLS0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2lvbW11LmMgfCAxIC0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5jIGIveGVuL2Nv
bW1vbi9zeXNjdGwuYwo+IGluZGV4IGU4NzYzYzdmZGYuLmY4OGEyODVlN2YgMTAwNjQ0Cj4gLS0t
IGEveGVuL2NvbW1vbi9zeXNjdGwuYwo+ICsrKyBiL3hlbi9jb21tb24vc3lzY3RsLmMKPiBAQCAt
MjY4LDkgKzI2OCwxMSBAQCBsb25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9zeXNjdGxfdCkgdV9zeXNjdGwpCj4gICAgICAgICAgIHBpLT5tYXhfbWZuID0gZ2V0X3VwcGVy
X21mbl9ib3VuZCgpOwo+ICAgICAgICAgICBhcmNoX2RvX3BoeXNpbmZvKHBpKTsKPiAgICAgICAg
ICAgaWYgKCBpb21tdV9lbmFibGVkICkKPiArICAgICAgICB7Cj4gICAgICAgICAgICAgICBwaS0+
Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbzsKPiAtICAgICAgICBp
ZiAoIGlvbW11X2hhcF9wdF9zaGFyZSApCj4gLSAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMg
fD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZTsKPiArICAgICAgICAgICAg
aWYgKCBpb21tdV9oYXBfcHRfc2hhcmUgKQo+ICsgICAgICAgICAgICAgICAgcGktPmNhcGFiaWxp
dGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOwo+ICsgICAgICAg
IH0KPiAgIAo+ICAgICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAxKSAp
Cj4gICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOwo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+
IGluZGV4IGU4ZmRkYzJkYzcuLmMzM2NhNzBlYzkgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMKPiBAQCAtNDU2LDcgKzQ1Niw2IEBAIGludCBfX2luaXQgaW9tbXVfc2V0dXAodm9pZCkKPiAg
ICAgICBpZiAoICFpb21tdV9lbmFibGVkICkKPiAgICAgICB7Cj4gICAgICAgICAgIGlvbW11X2lu
dHJlbWFwID0gMDsKPiAtICAgICAgICBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUoKTsKPiAgICAg
ICB9CgpOSVQ6IFRoZSB7fSBjYW4gbm93IGJlIHJlbW92ZWQuCgpJIGNhbiBmaXggaXQgb24gY29t
bWl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
