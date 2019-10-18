Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F962DC9FD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUZ3-0002MP-Kx; Fri, 18 Oct 2019 15:53:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RSmm=YL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iLUZ2-0002MJ-JG
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:53:16 +0000
X-Inumbo-ID: 65ad776a-f1bf-11e9-8aca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65ad776a-f1bf-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 15:53:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90778C8F;
 Fri, 18 Oct 2019 08:53:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A80AA3F718;
 Fri, 18 Oct 2019 08:53:14 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
 <20191018150653.24862-11-ian.jackson@eu.citrix.com>
 <38a9ad6c-6624-3e2a-aca7-20cb8ee14ce9@arm.com>
 <23977.57197.104861.3770@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <707b518c-045c-0db7-0c6b-939d6d5566d8@arm.com>
Date: Fri, 18 Oct 2019 16:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23977.57197.104861.3770@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v5 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMTgvMTAvMjAxOSAxNjo1MSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSnVsaWVu
IEdyYWxsIHdyaXRlcyAoIlJlOiBbWEVOIFBBVENIIGZvci00LjEzIHY1IDEwLzEwXSBsaWJ4bC94
bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2ggc2V0dGluZyBsb2dpYyIpOgo+PiBPbiAxOC8xMC8yMDE5
IDE2OjA2LCBJYW4gSmFja3NvbiB3cm90ZToKPiAuLi4KPj4+ICsgICAgaWYgKGNfaW5mby0+cGFz
c3Rocm91Z2ggPT0gTElCWExfUEFTU1RIUk9VR0hfU1lOQ19QVCkgewo+Pj4gKyAgICAgICAgTE9H
RChFUlJPUiwgZG9taWQsCj4+PiArICAgICAgICAgICAgICJwYXNzdGhyb3VnaD1cInN5bmNfcHRc
IiBub3Qgc3VwcG9ydGVkIG9uIEFSTVxuIik7Cj4+PiArICAgICAgICByYyA9IEVSUk9SX0lOVkFM
Owo+Pj4gKyAgICAgICAgZ290byBvdXQ7Cj4+PiArICAgIH0KPj4KPj4gV291bGQgaXQgbWFrZSBz
ZW5zZSB0byB1c2UgYSBzd2l0Y2ggY2FzZSBvciB3aGl0ZWxpc3QgaGVyZT8gU28gd2UgZG9uJ3Qg
ZW5kIHVwCj4+IHRvIHNsaXAgdGhyb3VnaCBpZiBhIG5ldyB0eXBlIGlzIGFkZGVkIGFuZCB1bnN1
cHBvcnRlZCBvbiBBcm0uCj4gCj4gSSB3b3VsZG4ndCBtaW5kIGNoYW5naW5nIHRoaXMgdG8KPiAg
ICAgY19pbmZvLT5wYXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVAoKSSB0
aGluayBpdCB3b3VsZCBuZWVkIHRvIGJlCgpjX2luZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BB
U1NUSFJPVUdIX1NIQVJFX1BUICYmIGNfaW5mby0+cGFzc3Rocm91Z2ggIT0gCkxJQlhMX1BBU1NU
SFJPVUdIX0RJU0FCTEVELgoKPiAKPiBBbHRob3VnaCBpdCdzIGEgc2hhbWUgeW91J3JlIHJhaXNp
bmcgdGhpcyBub3cuICBUaGlzIGNvZGUgaGFzIGJlZW4KPiBsaWtlIHRoaXMgc2luY2UgdjMuICBX
b3VsZCB5b3UgbWluZCBpZiB3ZSBkaWQgdGhpcyBhcyBhIGZvbGxvd3VwCj4gcGF0Y2ggPwoKU29y
cnkgSSBoYXZlbid0IGJlZW4gcmVhbGx5IGdvb2QgYXQgcmV2aWV3aW5nIHRoaXMgd2VlayA6KC4K
CkkgYW0gaGFwcHkgaWYgdGhpcyBpcyBkb25lIGluIGEgZm9sbG93LXVwLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
