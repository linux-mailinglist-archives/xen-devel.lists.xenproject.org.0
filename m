Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C86876EF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:08:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw1mN-0007ih-Ih; Fri, 09 Aug 2019 10:05:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw1mL-0007ic-CF
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:05:45 +0000
X-Inumbo-ID: 3fe81a56-ba8d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3fe81a56-ba8d-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 10:05:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364B915A2;
 Fri,  9 Aug 2019 03:05:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82723F575;
 Fri,  9 Aug 2019 03:05:42 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <46867c1c-2acb-a875-bd3a-bae5c80da2c5@arm.com>
Date: Fri, 9 Aug 2019 11:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/6] xen/arm: introduce p2m_is_mmio
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA3LzA4LzIwMTkgMDE6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBZGQgYSBwMm1faXNfbW1pbyBtYWNybyBmb3IgZWFzeSBjaGVja2luZ3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+IC0t
LQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaCB8IDYgKysrKysrCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vcDJtLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oCj4gaW5kZXggMDNmMmVlNzVjMS4u
MzE5MDIzMTdkYSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oCj4gKysr
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaAo+IEBAIC0xMzIsNiArMTMyLDExIEBAIHR5cGVk
ZWYgZW51bSB7Cj4gICAjZGVmaW5lIFAyTV9SQU1fVFlQRVMgKHAybV90b19tYXNrKHAybV9yYW1f
cncpIHwgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3RvX21hc2socDJt
X3JhbV9ybykpCj4gICAKPiArLyogTU1JTyB0eXBlcyAqLwo+ICsjZGVmaW5lIFAyTV9NTUlPX1RZ
UEVTIChwMm1fdG9fbWFzayhwMm1fbW1pb19kaXJlY3RfZGV2KSB8IFwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgcDJtX3RvX21hc2socDJtX21taW9fZGlyZWN0X25jKSAgfCBcCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHAybV90b19tYXNrKHAybV9tbWlvX2RpcmVjdF9jKSkKPiArCj4g
ICAvKiBHcmFudCBtYXBwaW5nIHR5cGVzLCB3aGljaCBtYXAgdG8gYSByZWFsIGZyYW1lIGluIGFu
b3RoZXIgVk0gKi8KPiAgICNkZWZpbmUgUDJNX0dSQU5UX1RZUEVTIChwMm1fdG9fbWFzayhwMm1f
Z3JhbnRfbWFwX3J3KSB8ICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3RvX21h
c2socDJtX2dyYW50X21hcF9ybykpCj4gQEAgLTE0Niw2ICsxNTEsNyBAQCB0eXBlZGVmIGVudW0g
ewo+ICAgI2RlZmluZSBwMm1faXNfYW55X3JhbShfdCkgKHAybV90b19tYXNrKF90KSAmICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoUDJNX1JBTV9U
WVBFUyB8IFAyTV9HUkFOVF9UWVBFUyB8ICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFAyTV9GT1JFSUdOX1RZUEVTKSkKPiArI2RlZmluZSBwMm1faXNfbW1pbyhfdCkgKHAybV90
b19tYXNrKF90KSAmIFAyTV9NTUlPX1RZUEVTKQo+ICAgCj4gICAvKiBBbGwgY29tbW9uIHR5cGUg
ZGVmaW5pdGlvbnMgc2hvdWxkIGxpdmUgYWhlYWQgb2YgdGhpcyBpbmNsdXNpb24uICovCj4gICAj
aWZkZWYgX1hFTl9QMk1fQ09NTU9OX0gKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
