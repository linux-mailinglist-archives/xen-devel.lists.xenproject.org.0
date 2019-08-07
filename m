Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04484967
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:24:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJ5T-0004Fi-6m; Wed, 07 Aug 2019 10:22:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvJ5R-0004FE-Jp
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:22:29 +0000
X-Inumbo-ID: 41d22879-b8fd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 41d22879-b8fd-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 10:22:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D500928;
 Wed,  7 Aug 2019 03:22:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43DF83F575;
 Wed,  7 Aug 2019 03:22:26 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-3-paul.durrant@citrix.com>
 <d96b7a8b-4668-576f-84d2-e0a382d86c87@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <217d7fd7-f5bf-3e0c-a553-aa9539c35607@arm.com>
Date: Wed, 7 Aug 2019 11:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d96b7a8b-4668-576f-84d2-e0a382d86c87@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] use is_iommu_enabled() where
 appropriate...
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDcvMDgvMjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAu
MDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
cDJtLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCj4+IEBAIC0xNTMxLDggKzE1MzEsNyBA
QCBpbnQgcDJtX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gwqDCoMKgwqDCoMKgICogc2hhcmVk
IHdpdGggdGhlIENQVSwgWGVuIGhhcyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgUFQgY2hhbmdlcyBo
YXZlCj4+IMKgwqDCoMKgwqDCoCAqIHJlYWNoZWQgdGhlIG1lbW9yeQo+PiDCoMKgwqDCoMKgwqAg
Ki8KPj4gLcKgwqDCoCBwMm0tPmNsZWFuX3B0ZSA9IGlvbW11X2VuYWJsZWQgJiYKPj4gLcKgwqDC
oMKgwqDCoMKgICFpb21tdV9oYXNfZmVhdHVyZShkLCBJT01NVV9GRUFUX0NPSEVSRU5UX1dBTEsp
Owo+PiArwqDCoMKgIHAybS0+Y2xlYW5fcHRlID0gIWlvbW11X2hhc19mZWF0dXJlKGQsIElPTU1V
X0ZFQVRfQ09IRVJFTlRfV0FMSyk7Cj4gCj4gSSBjYW4ndCB0ZWxsIGlmIHRoZSBvcmlnaW5hbCBj
b2RlIHdhcyBtZWFudCB0byBiZSB0aGlzIHdheSwgYnV0IEknbQo+IGFmcmFpZCB5b3VyIHRyYW5z
Zm9ybWF0aW9uIGlzIG5vdCBjb3JyZWN0OiBUaGUgcHJpb3IgY29uc3RydWN0LAo+IGV4cGFuZGlu
ZyBpb21tdV9oYXNfZmVhdHVyZSgpLCB3YXMKClRoZSBvcmlnaW5hbCBjb2RlIGlzIG1lYW50IHRv
IGJlIHRoaXMgd2F5LiBUaGVyZSBhcmUgbm8gbmVlZCB0byBjbGVhbiB0aGUgUFRFIG9uIAp1cGRh
dGUgdW5sZXNzIHlvdSBoYXZlIG9uZSBJT01NVSB0aGF0IGlzIG5vdCBhYmxlIHRvIHNub29wIHRo
ZSBjYWNoZS4KCmlvbW11X2hhc19mZWF0dXJlKC4uLikgd2lsbCByZXR1cm4gZmFsc2Ugd2hlbiB0
aGUgSU9NTVUgaXMgbm90IGluIHVzZS4gVGhlIAppb21tdV9lbmFibGVkIHByZXZlbnQgdG8gY2xl
YW4gUFRFIG9uIHRob3NlIHNldHVwcy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
