Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E748D0AC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqOs-0006Ca-1C; Wed, 14 Aug 2019 10:21:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxqOq-0006CV-2w
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:21:00 +0000
X-Inumbo-ID: 35969338-be7d-11e9-97cb-5b2806810665
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 35969338-be7d-11e9-97cb-5b2806810665;
 Wed, 14 Aug 2019 10:20:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DEF28;
 Wed, 14 Aug 2019 03:20:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F3F73F706;
 Wed, 14 Aug 2019 03:20:57 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
Date: Wed, 14 Aug 2019 11:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDE0LzA4LzIwMTkgMTE6MTMsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9t
bXUuaAo+Pj4gQEAgLTI2OCw2ICsyNjgsMTMgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7Cj4+PiAg
ICAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAgc2V0X2JpdChmLCBkb21faW9tbXUo
ZCktPmZlYXR1cmVzKQo+Pj4gICAgI2RlZmluZSBpb21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNs
ZWFyX2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQo+Pj4KPj4+ICsvKiBBcmUgd2UgdXNp
bmcgdGhlIGRvbWFpbiBQMk0gdGFibGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8KPj4+ICsj
ZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgXAo+Pj4gKyAgICAoaGFwX2VuYWJsZWQoZCkgJiYg
aXNfaW9tbXVfZW5hYmxlZChkKSAmJiBpb21tdV9oYXBfcHRfc2hhcmUpCj4+Cj4+IERvZXMgdGhp
cyBidWlsZCBmb3IgQXJtLCBzZWVpbmcgdGhhdCB0aGVyZSdzIG5vIGhhcF9lbmFibGVkKCkKPj4g
ZGVmaW5pdGlvbiB0aGVyZT8gT3IgaGF2ZSBJIG1pc3NlZCBpdHMgYWRkaXRpb24gZWFybGllciBp
biB0aGlzCj4+IHNlcmllcz8KPiAKPiBJdCBtb3ZlZCB0byBjb21tb24gY29kZSBzY2hlZC5oIGlu
IGFuIGVhcmxpZXIgcGF0Y2guCgpJIHdlbnQgdGhyb3VnaCB0aGUgc2VyaWVzIGFuZCBkaWRuJ3Qg
ZmluZCB3aGVyZSBoYXBfZW5hYmxlZCgpIGlzIGRlZmluZWQgZm9yIEFybSAKaW4gdGhpcyBzZXJp
ZXMuIERvIHlvdSBtaW5kIHBvaW50aW5nIHRoZSBleGFjdCBwYXRjaD8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
