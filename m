Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950DDBC653
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:12:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCihJ-0003cC-E1; Tue, 24 Sep 2019 11:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCihI-0003bh-8G
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:09:32 +0000
X-Inumbo-ID: c2a42c44-deae-11e9-ae5c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id c2a42c44-deae-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 09:36:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DF3D142F;
 Tue, 24 Sep 2019 02:36:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54EE63F67D;
 Tue, 24 Sep 2019 02:36:17 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568224770-25402-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f328bc9a-8466-c87e-a00c-223172823ac3@arm.com>
Date: Tue, 24 Sep 2019 10:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568224770-25402-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH V3] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMS8wOS8yMDE5IDE4OjU5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiAt
LS0KPiAgIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAgICAgICAgICAgICAgfCA0MSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAg
ICAgICAgICAgICAgICAgICB8ICA5ICsrKysrLS0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9pcG1tdS12bXNhLmMgfCAxOCArKy0tLS0tLS0tLS0tLQo+ICAgeGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL3NtbXUuYyAgICAgICB8IDExICsrKy0tLS0tLQo+ICAgeGVuL2luY2x1ZGUv
YXNtLWFybS9wMm0uaCAgICAgICAgICAgICAgICB8ICA5ICsrKysrKysKPiAgIDUgZmlsZXMgY2hh
bmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IGluZGV4IDIzNzRlOTIu
LmQ1ZTI1MzkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3AybS5jCj4gQEAgLTM0LDcgKzM0LDExIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19y
ZWFkX21vc3RseSBtYXhfdm1pZCA9IE1BWF9WTUlEXzhfQklUOwo+ICAgCj4gICAjZGVmaW5lIFAy
TV9ST09UX1BBR0VTICAgICgxPDxQMk1fUk9PVF9PUkRFUikKPiAgIAo+IC11bnNpZ25lZCBpbnQg
X19yZWFkX21vc3RseSBwMm1faXBhX2JpdHM7Cj4gKy8qCj4gKyAqIFNldCBsYXJnZXIgdGhhbiBh
bnkgcG9zc2libGUgdmFsdWUsIHNvIHRoZSBudW1iZXIgb2YgSVBBIGJpdHMgY2FuIGJlCj4gKyAq
IHJlc3RyaWN0ZWQgYnkgZXh0ZXJuYWwgZW50aXR5IChlLmcuIElPTU1VKS4KPiArICovCj4gK3Vu
c2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHAybV9pcGFfYml0cyA9IDY0Owo+ICAgCj4gICAvKiBI
ZWxwZXJzIHRvIGxvb2t1cCB0aGUgcHJvcGVydGllcyBvZiBlYWNoIGxldmVsICovCj4gICBzdGF0
aWMgY29uc3QgcGFkZHJfdCBsZXZlbF9tYXNrc1tdID0KPiBAQCAtMTkxMiw2ICsxOTE2LDE2IEBA
IHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRk
cl90IHZhLAo+ICAgICAgIHJldHVybiBwYWdlOwo+ICAgfQo+ICAgCj4gK3ZvaWQgX19pbml0IHAy
bV9yZXN0cmljdF9pcGFfYml0cyh1bnNpZ25lZCBpbnQgaXBhX2JpdHMpCj4gK3sKPiArICAgIC8q
Cj4gKyAgICAgKiBDYWxjdWxhdGUgdGhlIG1pbmltdW0gb2YgdGhlIG1heGltdW0gSVBBIGJpdHMg
dGhhdCBhbnkgZXh0ZXJuYWwgZW50aXR5Cj4gKyAgICAgKiBjYW4gc3VwcG9ydC4KPiArICAgICAq
Lwo+ICsgICAgaWYgKCBpcGFfYml0cyA8IHAybV9pcGFfYml0cyApCj4gKyAgICAgICAgcDJtX2lw
YV9iaXRzID0gaXBhX2JpdHM7Cj4gK30KPiArCj4gICAvKiBWVENSIHZhbHVlIHRvIGJlIGNvbmZp
Z3VyZWQgYnkgYWxsIENQVXMuIFNldCBvbmx5IG9uY2UgYnkgdGhlIGJvb3QgQ1BVICovCj4gICBz
dGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSB2dGNyOwo+ICAgCj4gQEAgLTE5NjYsMTUgKzE5
ODAsMjQgQEAgdm9pZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkKPiAgICAgICAgICAg
WzddID0geyAwIH0gIC8qIEludmFsaWQgKi8KPiAgICAgICB9Owo+ICAgCj4gLSAgICB1bnNpZ25l
ZCBpbnQgY3B1Owo+ICsgICAgdW5zaWduZWQgaW50IGksIGNwdTsKPiAgICAgICB1bnNpZ25lZCBp
bnQgcGFfcmFuZ2UgPSAweDEwOyAvKiBMYXJnZXIgdGhhbiBhbnkgcG9zc2libGUgdmFsdWUgKi8K
PiAgICAgICBib29sIHZtaWRfOF9iaXQgPSBmYWxzZTsKPiAgIAo+ICsgICAgaWYgKCBwMm1faXBh
X2JpdHMgPCA0MCApCj4gKyAgICAgICAgcGFuaWMoIlAyTSBJUEEgc2l6ZSBtdXN0IGJlIGF0IGxl
YXN0IDQwLWJpdCAocDJtX2lwYV9iaXRzPSV1KVxuIiwKPiArICAgICAgICAgICAgICBwMm1faXBh
X2JpdHMpOwoKSXNuJ3QgdGhpcyBjaGVjayBtZWFudCB0byBiZSBmb3IgQXJtMzI/IElmIHNvLCB0
aGlzIHBhdGggaXMgbm90IGNhbGxlZCBieSBhcm0zMi4gClNlZSB0aGUgI2lmZGVmIENPTkZJR19B
Uk1fMzIgYWJvdmUuCgpBbHNvLCBJIHdvdWxkIHN1Z2dlc3QgdG8gcmV3b3JkIHRoZSBtZXNzYWdl
IHRvOgoKIlAyTTogTm90IGFibGUgdG8gc3VwcG9ydCAl4oG7Yml0IElQQSBhdCB0aGUgbW9tZW50
LlxuIgoKVGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
