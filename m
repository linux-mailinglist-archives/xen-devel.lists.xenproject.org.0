Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71010ACCB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:46:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtrk-0001CH-GM; Wed, 27 Nov 2019 09:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtrj-0001CC-Gx
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:44:07 +0000
X-Inumbo-ID: 73f7c21c-10fa-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73f7c21c-10fa-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 09:44:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B405DAFB1;
 Wed, 27 Nov 2019 09:44:05 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, Julien Grall <jgrall@amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
Date: Wed, 27 Nov 2019 10:44:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126171715.10881-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxODoxNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gQSBndWVzdCB3aWxsIHNldHVwIGEgc2hhcmVk
IHBhZ2Ugd2l0aCB0aGUgaHlwZXJ2aXNvciBmb3IgZWFjaCB2Q1BVIHZpYQo+IFhFTlBNVV9pbml0
LiBUaGUgcGFnZSB3aWxsIHRoZW4gZ2V0IG1hcHBlZCBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgb25s
eQo+IHJlbGVhc2VkIHdoZW4gWEVNUE1VX2ZpbmlzaCBpcyBjYWxsZWQuCj4gCj4gVGhpcyBtZWFu
cyB0aGF0IGlmIHRoZSBndWVzdCBpcyBub3Qgc2h1dGRvd24gZ3JhY2VmdWxseSAoc3VjaCBhcyB2
aWEgeGwKPiBkZXN0cm95KSwgdGhlIHBhZ2Ugd2lsbCBzdGF5IG1hcHBlZCBpbiB0aGUgaHlwZXJ2
aXNvci4KCklzbid0IHRoaXMgc3RpbGwgdG9vIHdlYWsgYSBkZXNjcmlwdGlvbj8gSXQncyBub3Qg
dGhlIHRvb2wgc3RhY2sKaW52b2tpbmcgWEVOUE1VX2ZpbmlzaCwgYnV0IHRoZSBndWVzdCBpdHNl
bGYgYWZhaWNzLiBJLmUuIGEKbWlzYmVoYXZpbmcgZ3Vlc3QgY291bGQgcHJldmVudCBwcm9wZXIg
Y2xlYW51cCBldmVuIHdpdGggZ3JhY2VmdWwKc2h1dGRvd24uCgo+IEBAIC0yMjI0LDYgKzIyMjEs
OSBAQCBpbnQgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCj4g
ICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+ICAgICAgICAgIGh2bV9kb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMoZCk7Cj4gIAo+ICsgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQo+ICsg
ICAgICAgIHZwbXVfZGVzdHJveSh2KTsKPiArCj4gICAgICByZXR1cm4gMDsKPiAgfQoKSSB0aGlu
ayBzaW1wbGUgdGhpbmdzIHdoaWNoIG1heSBhbGxvdyBzaHJpbmtpbmcgdGhlIHBhZ2UgbGlzdHMK
c2hvdWxkIGJlIGRvbmUgZWFybHkgaW4gdGhlIGZ1bmN0aW9uLiBBcyB2cG11X2Rlc3Ryb3koKSBs
b29rcwp0byBiZSBpZGVtcG90ZW50LCBob3cgYWJvdXQgbGV2ZXJhZ2luZyB0aGUgdmVyeSBmaXJz
dApmb3JfZWFjaF92Y3B1KCkgbG9vcCBpbiB0aGUgZnVuY3Rpb24gKHRoZXJlIGFyZSB0b28gbWFu
eSBvZiB0aGVtCnRoZXJlIGFueXdheSwgYXQgbGVhc3QgZm9yIG15IHRhc3RlKT8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
