Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923F87844
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 13:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2n2-0005Jr-GB; Fri, 09 Aug 2019 11:10:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw2n1-0005Jm-BI
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 11:10:31 +0000
X-Inumbo-ID: 4b770e0c-ba96-11e9-b4e7-d78e8d38bc95
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b770e0c-ba96-11e9-b4e7-d78e8d38bc95;
 Fri, 09 Aug 2019 11:10:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4AE35ACA0;
 Fri,  9 Aug 2019 11:10:28 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16851887-a6e5-ac4f-32f5-52f46a1b160f@suse.com>
Date: Fri, 9 Aug 2019 13:10:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 Stefano Stabellini <stefanos@xilinx.com>, andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAwMjoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEFkZCBhIHAy
bXQgcGFyYW1ldGVyIHRvIG1hcF9tbWlvX3JlZ2lvbnMsIHBhc3MgcDJtX21taW9fZGlyZWN0X2Rl
diBvbgo+IEFSTSBhbmQgcDJtX21taW9fZGlyZWN0IG9uIHg4NiAtLSBubyBjaGFuZ2VzIGluIGJl
aGF2aW9yLgo+IAo+IE9uIHg4NiwgaW50cm9kdWNlIGEgbWFjcm8gdG8gc3RyaXAgYXdheSB0aGUg
bGFzdCBwYXJhbWV0ZXIgYW5kIHJlbmFtZQo+IHRoZSBleGlzdGluZyBpbXBsZW1lbnRhdGlvbiBv
ZiBtYXBfbW1pb19yZWdpb25zIHRvIG1hcF9tbWlvX3JlZ2lvbi4KPiBVc2UgbWFwX21taW9fcmVn
aW9uIGluIHZwY2kgYXMgaXQgaXMgeDg2LW9ubHkgdG9kYXkuCj4gCj4gT24gQVJNLCBnaXZlbiB0
aGUgc2ltaWxhcml0eSBiZXR3ZWVuIG1hcF9tbWlvX3JlZ2lvbnMgYWZ0ZXIgdGhlIGNoYW5nZQo+
IGFuZCBtYXBfcmVnaW9uc19wMm10LCByZW1vdmUgdW4vbWFwX3JlZ2lvbnNfcDJtdC4gQWxzbyBh
ZGQgYW4gQVNTRVJUIHRvCj4gY2hlY2sgdGhhdCBvbmx5IHAybV9tbWlvXyogdHlwZXMgYXJlIHBh
c3NlZCB0byBpdC4KPiAKPiBBbHNvIGZpeCB0aGUgc3R5bGUgb2YgdGhlIGNvbW1lbnQgb24gdG9w
IG9mIG1hcF9tbWlvX3JlZ2lvbnMgc2luY2Ugd2UKPiBhcmUgYXQgaXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKSSBndWVzcyBh
cGFydCBmcm9tIHRoZSBuYW1pbmcgcXVlc3Rpb24gKHNlZSBvdGhlciBzdWItdGhyZWFkKSBJJ20K
ZmluZSB3aXRoIHRoaXMuIEhvd2V2ZXIsIC4uLgoKPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9hY3Bp
L2RvbWFpbl9idWlsZC5jIHwgIDQgKystLQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
ICAgICAgfCAgMiArLQo+ICAgeGVuL2FyY2gvYXJtL2dpYy12Mi5jICAgICAgICAgICAgfCAgMyAr
Ky0KPiAgIHhlbi9hcmNoL2FybS9wMm0uYyAgICAgICAgICAgICAgIHwgMTkgKystLS0tLS0tLS0t
LS0tLS0tLQo+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9leHlub3M1LmMgfCAgNiArKysrLS0K
PiAgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYyAgIHwgMTIgKysrKysrKystLS0tCj4g
ICB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgICAgICB8ICAyICstCj4gICB4ZW4vYXJjaC9h
cm0vdmdpYy12Mi5jICAgICAgICAgICB8ICAyICstCj4gICB4ZW4vYXJjaC9hcm0vdmdpYy92Z2lj
LXYyLmMgICAgICB8ICAyICstCj4gICB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyAgICB8
ICAyICstCj4gICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICB8ICA4ICsrKystLS0t
Cj4gICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KPiAgIHhl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICAgIHwgIDIgKy0KCi4uLiB0aGVzZSB0d28gYW5k
IC4uLgoKPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggICAgICAgIHwgMTUgLS0tLS0tLS0t
LS0tLS0tCj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oICAgICAgICB8ICA4ICsrKysrKysr
Cj4gICB4ZW4vaW5jbHVkZS94ZW4vcDJtLWNvbW1vbi5oICAgICB8IDExICsrKysrKystLS0tCgou
Li4gdGhpcyBvbmUgcmVxdWlyZSB5b3UgdG8gd2lkZW4gdGhlIENjIGxpc3QuIFRoaXMgd291bGQg
dGhlIGFsc28KYWxsb3cgR2VvcmdlIHRvIGJlY29tZSBtb3JlIGF3YXJlIG9mIHRoZSBhc20teDg2
L3AybS5oIGNoYW5nZSwKd2hpY2ggc3RyaWN0bHkgYnkgLi9NQUlOVEFJTkVSUyBoZSBtYXkgbm90
IG5lZWQgdG8gYWNrLCBidXQgd2hpY2gKaXMgcGFydCBvZiAiWDg2IE1FTU9SWSBNQU5BR0VNRU5U
IiByZWFsbHkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
