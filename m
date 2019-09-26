Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD9BF483
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUCw-0003iE-AB; Thu, 26 Sep 2019 13:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDUCv-0003i8-E4
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:53:21 +0000
X-Inumbo-ID: ffa7ce18-e064-11e9-9654-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id ffa7ce18-e064-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:53:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01FF21570;
 Thu, 26 Sep 2019 06:53:20 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E303F534;
 Thu, 26 Sep 2019 06:53:17 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20190926100308.33936-1-paul.durrant@citrix.com>
 <cdf976be-a598-2b97-6810-9080a7073957@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a542ef5b-9e72-8aa2-cf7a-60392e2e39f9@arm.com>
Date: Thu, 26 Sep 2019 14:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cdf976be-a598-2b97-6810-9080a7073957@suse.com>
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gOS8yNi8xOSAxOjEyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNi4w
OS4yMDE5IDEyOjAzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC4uLndoZW4gdGhlIElPTU1VIGlz
IG5vdCBlbmFibGVkLgo+Pgo+PiA4MGZmM2QzMzhkYzkgImlvbW11OiB0aWR5IHVwIGlvbW11X3Vz
ZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkKPj4gbWFjcm9zIiBpbnRyb2R1Y2Vk
IENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFSRSwgd2hpY2ggY2F1c2VzIHRoZSBnbG9iYWwKPj4g
J2lvbW11X2hhcF9wdF9zaGFyZScgb3B0aW9uIHRvIGJlIHJlcGxhY2VkIHdpdGggYSAjZGVmaW5l
LWQgdmFsdWUgb2YgdHJ1ZS4KPj4gSW4gdGhpcyBjb25maWd1cmF0aW9uLCBjYWxsaW5nIGNsZWFy
X2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpbGwgcmVzdWx0Cj4+IHRyaWdnZXIgdGhlIGFmb3JlbWVu
dGlvbmVkIEFTU0VSVC4KPj4KPj4gQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFIGlzIGFsd2F5
cyBzZWxlY3RlZCBmb3IgQVJNIGJ1aWxkcyBhbmQsCj4+IGJlY2F1c2UgY2xlYXJfaW9tbXVfaGFw
X3B0X3NoYXJlKCkgaXMgY2FsbGVkIGJ5IHRoZSBjb21tb24gaW9tbXVfc2V0dXAoKQo+PiBmdW5j
dGlvbiBpZiB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQsIGl0IGlzIG5vIGxvbmdlciBzYWZlIHRv
IGRpc2FibGUgdGhlCj4+IElPTU1VIG9uIEFSTSBzeXN0ZW1zLgo+Pgo+PiBIb3dldmVyLCBydW5u
aW5nIHdpdGggdGhlIElPTU1VIGRpc2FibGVkIGlzIGEgdmFsaWQgY29uZmlndXJhdGlvbiBmb3Ig
QVJNCj4+IHN5c3RlbXMsIHNvIHRoaXMgcGF0Y2ggcmVjdGlmaWVzIHRoZSBwcm9ibGVtIGJ5IHJl
bW92aW5nIHRoZSBjYWxsIHRvCj4+IGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIGZyb20gY29t
bW9uIGNvZGUuIEFzIGEgc2lkZSBlZmZlY3Qgb2YgdGhpcywKPj4gaG93ZXZlciwgaXQgYmVjb21l
cyBwb3NzaWJsZSBvbiB4ODYgc3lzdGVtcyBmb3IgaW9tbXVfZW5hYmxlZCB0byBiZSBmYWxzZQo+
PiBidXQgaW9tbXVfaGFwX3B0X3NoYXJlIHRvIGJlIHRydWUuIFRodXMgdGhlIGNvZGUgaW4gc3lz
Y3RsLmMKPj4gbmVlZHMgdG8gYmUgY2hhbmdlZCB0byBtYWtlIHN1cmUgdGhhdCBYRU5fU1lTQ1RM
X1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlCj4+IGlzIG5vdCBlcnJvbmVvdXNseSBhZHZlcnRp
c2VkIHdoZW4gdGhlIElPTU1VIGhhcyBiZWVuIGRpc2FibGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+PiBSZXBvcnRlZC1ieTog
T2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPgo+IAo+IFByZWZlcmFibHkgd2l0aCB0aGUg
YWRqdXN0bWVudHMgbWFudGlvbmVkIGVsc2V3aGVyZQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpJIGhhdmUgZG9uZSBpdCB3aGlsZSBjb21taXR0aW5nIHRo
ZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
