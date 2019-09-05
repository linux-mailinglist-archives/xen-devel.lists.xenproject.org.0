Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2155AAC11
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 21:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5xTY-0004lY-5P; Thu, 05 Sep 2019 19:31:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5xTW-0004lT-2b
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 19:31:22 +0000
X-Inumbo-ID: bbc283ad-d013-11e9-abd9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bbc283ad-d013-11e9-abd9-12813bfff9fa;
 Thu, 05 Sep 2019 19:31:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4FE28;
 Thu,  5 Sep 2019 12:31:18 -0700 (PDT)
Received: from [10.37.12.167] (unknown [10.37.12.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 589903F67D;
 Thu,  5 Sep 2019 12:31:16 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-4-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <617ec8e4-bcb2-4b38-a303-ef07efd47188@arm.com>
Date: Thu, 5 Sep 2019 20:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902145014.36442-4-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 3/6] use is_iommu_enabled() where
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDkvMi8xOSAzOjUwIFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gLi4ucmF0
aGVyIHRoYW4gdGVzdGluZyB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBv
aW50ZXIuCj4gCj4gTm93IHRoYXQgdGhlcmUgaXMgYSBwZXItZG9tYWluIGZsYWcgaW5kaWNhdGlu
ZyB3aGV0aGVyIHRoZSBkb21haW4gaXMKPiBwZXJtaXR0ZWQgdG8gdXNlIHRoZSBJT01NVSAod2hp
Y2ggZGV0ZXJtaW5lcyB3aGV0aGVyIHRoZSBvcHMgcG9pbnRlciB3aWxsCj4gYmUgc2V0KSwgbWFu
eSB0ZXN0cyBvZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBvaW50ZXIg
Y2FuCj4gYmUgdHJhbnNsYXRlZCBpbnRvIHRlc3RzIG9mIHRoZSBwZXItZG9tYWluIGZsYWcuIFNv
bWUgb2YgdGhlIG90aGVyIHRlc3RzIG9mCj4gcHVyZWx5IHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxl
ZCBmbGFnIGNhbiBhbHNvIGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZgo+IHRoZSBwZXItZG9t
YWluIGZsYWcuCj4gCj4gTk9URTogVGhlIGNvbW1lbnQgaW4gaW9tbXVfc2hhcmVfcDJtX3RhYmxl
KCkgaXMgYWxzbyBmaXhlZDsgbmVlZF9pb21tdSgpCj4gICAgICAgIGRpc2FwcGVhcmVkIHNvbWUg
dGltZSBhZ28uIEFsc28sIHdoaWxzdCB0aGUgc3R5bGUgb2YgdGhlICdpZicgaW4KPiAgICAgICAg
Zmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKSBpcyBmaXhlZCwgSSBoYXZlIG5vdCB0cmFu
c2xhdGVkIGFueQo+ICAgICAgICBpbnN0YW5jZXMgb2YgdTMyIGludG8gdWludDMyX3QgdG8ga2Vl
cCBjb25zaXN0ZW5jeS4gSU1PIHN1Y2ggYQo+ICAgICAgICB0cmFuc2xhdGlvbiB3b3VsZCBiZSBi
ZXR0ZXIgZG9uZSBnbG9iYWxseSBmb3IgdGhlIHNvdXJjZSBtb2R1bGUgaW4KPiAgICAgICAgYSBz
ZXBhcmF0ZSBwYXRjaC4KPiAgICAgICAgVGhlIGNoYW5nZSB0byB0aGUgZGVmaW5pdGlvbiBvZiBp
b21tdV9jYWxsKCkgaXMgdG8ga2VlcCB0aGUgUFYgc2hpbQo+ICAgICAgICBidWlsZCBoYXBweS4g
V2l0aG91dCB0aGlzIGNoYW5nZSBpdCB3aWxsIGZhaWwgdG8gY29tcGlsZSB3aXRoIGVycm9ycwo+
ICAgICAgICBvZiB0aGUgZm9ybToKPiAKPiBpb21tdS5jOjM2MTozMjogZXJyb3I6IHVudXNlZCB2
YXJpYWJsZSDigJhoZOKAmSBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdCj4gICAgICAgY29uc3Qg
c3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6ICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFA
dHljaG8ubnNhLmdvdj4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
