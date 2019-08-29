Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CAA1BD9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 15:52:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Kon-000767-8G; Thu, 29 Aug 2019 13:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Kol-000762-Fg
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 13:50:27 +0000
X-Inumbo-ID: f426acc4-ca63-11e9-ae69-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f426acc4-ca63-11e9-ae69-12813bfff9fa;
 Thu, 29 Aug 2019 13:50:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E170AE00;
 Thu, 29 Aug 2019 13:50:25 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-10-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf5cf619-c0b4-2c72-8772-2f573e589460@suse.com>
Date: Thu, 29 Aug 2019 15:50:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-10-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/10] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDguMjAxOSAxOToyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gQEAgLTEwMiw4ICsxMDIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfaW9t
bXVfcGFyYW0oY29uc3QgY2hhciAqcykKPiAgICAgICAgICAgICAgaW9tbXVfaHdkb21fcGFzc3Ro
cm91Z2ggPSB2YWw7Cj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJk
b20wLXN0cmljdCIsIHMsIHNzKSkgPj0gMCApCj4gICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3N0
cmljdCA9IHZhbDsKPiArI2lmbmRlZiBDT05GSUdfQVJNCj4gICAgICAgICAgZWxzZSBpZiAoICh2
YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywgc3MpKSA+PSAwICkKPiAgICAgICAgICAg
ICAgaW9tbXVfaGFwX3B0X3NoYXJlID0gdmFsOwo+ICsjZW5kaWYKPiAgICAgICAgICBlbHNlCj4g
ICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKCkkgdGhpbmsgeW91L3dlIHNob3VsZCBnbyBmdXJ0
aGVyIGhlcmU6IEFybSBzaG91bGQgI2RlZmluZSB0aGlzIHRvCnRydWUsIGFuZCBoZXJlIHdlIHNo
b3VsZCBoYXZlICIjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZSIuCgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiBAQCAtMjY4
LDYgKzI2OCwxNyBAQCBzdHJ1Y3QgZG9tYWluX2lvbW11IHsKPiAgI2RlZmluZSBpb21tdV9zZXRf
ZmVhdHVyZShkLCBmKSAgIHNldF9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykKPiAgI2Rl
ZmluZSBpb21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21faW9tbXUoZCkt
PmZlYXR1cmVzKQo+ICAKPiArLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJNIHRhYmxlIGFz
IGl0cyBJT01NVSBwYWdldGFibGU/ICovCj4gKyNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSBc
Cj4gKyAgICAoaGFwX2VuYWJsZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChkKSAmJiBpb21tdV9o
YXBfcHRfc2hhcmUpCj4gKwo+ICsvKiBEb2VzIHRoZSBJT01NVSBwYWdldGFibGUgbmVlZCB0byBi
ZSBrZXB0IHN5bmNocm9uaXplZCB3aXRoIHRoZSBQMk0gKi8KPiArI2lmZGVmIENPTkZJR19IQVNf
UEFTU1RIUk9VR0gKPiArI2RlZmluZSBuZWVkX2lvbW11X3B0X3N5bmMoZCkgICAgIChkb21faW9t
bXUoZCktPm5lZWRfc3luYykKPiArI2Vsc2UKPiArI2RlZmluZSBuZWVkX2lvbW11X3B0X3N5bmMo
ZCkgICAgIGZhbHNlCgpJIHRoaW5rIHlvdSdkIGJldHRlciBldmFsdWF0ZSBkIGhlcmU7IG9uZSAo
c29tZXdoYXQgaW4gcmlzayBvZgpvcHBvc2l0aW9uKSB2YXJpYW50IHdvdWxkIGJlCgojZGVmaW5l
IG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAgKCEoZCkpCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
