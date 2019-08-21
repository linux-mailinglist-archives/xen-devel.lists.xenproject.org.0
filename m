Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C9986AA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 23:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0YFn-0000YC-5g; Wed, 21 Aug 2019 21:34:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7y8g=WR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0YFl-0000Y2-FR
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 21:34:49 +0000
X-Inumbo-ID: 8004db6c-c45b-11e9-8980-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8004db6c-c45b-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 21:34:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8190337;
 Wed, 21 Aug 2019 14:34:47 -0700 (PDT)
Received: from [10.37.12.68] (unknown [10.37.12.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99B723F718;
 Wed, 21 Aug 2019 14:34:44 -0700 (PDT)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
Date: Wed, 21 Aug 2019 22:34:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-10-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiA4LzIxLzE5IDk6MTkgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3Rl
Ogo+IExpdmVwYXRjaCBvbmx5IHRyYWNrcyBhbiBlbnRpcmUgcGF5bG9hZCBhcHBsaWVkL3JldmVy
dGVkIHN0YXRlLiBCdXQsCj4gd2l0aCBhbiBvcHRpb24gdG8gc3VwcGx5IHRoZSBhcHBseV9wYXls
b2FkKCkgYW5kL29yIHJldmVydF9wYXlsb2FkKCkKPiBmdW5jdGlvbnMgYXMgb3B0aW9uYWwgaG9v
a3MsIGl0IGJlY29tZXMgcG9zc2libGUgdG8gaW50ZXJtaXggdGhlCj4gZXhlY3V0aW9uIG9mIHRo
ZSBvcmlnaW5hbCBhcHBseV9wYXlsb2FkKCkvcmV2ZXJ0X3BheWxvYWQoKSBmdW5jdGlvbnMKPiB3
aXRoIHRoZWlyIGR5bmFtaWNhbGx5IHN1cHBsaWVkIGNvdW50ZXJwYXJ0cy4KPiBJdCBpcyBpbXBv
cnRhbnQgdGhlbiB0byB0cmFjayB0aGUgY3VycmVudCBzdGF0ZSBvZiBldmVyeSBmdW5jdGlvbgo+
IGJlaW5nIHBhdGNoZWQgYW5kIHByZXZlbnQgc2l0dWF0aW9ucyBvZiB1bmludGVudGlvbmFsIGRv
dWJsZS1hcHBseQo+IG9yIHVuYXBwbGllZCByZXZlcnQuCj4gCj4gVG8gc3VwcG9ydCB0aGF0LCBp
dCBpcyBuZWNlc3NhcnkgdG8gZXh0ZW5kIHB1YmxpYyBpbnRlcmZhY2Ugb2YgdGhlCj4gbGl2ZXBh
dGNoLiBUaGUgc3RydWN0IGxpdmVwYXRjaF9mdW5jIGdldHMgYWRkaXRpb25hbCBmaWVsZCBob2xk
aW5nCj4gdGhlIGFwcGxpZWQvcmV2ZXJ0ZWQgc3RhdGUgbWFya2VyLgo+IAo+IFRvIHJlZmxlY3Qg
dGhlIGxpdmVwYXRjaCBwYXlsb2FkIEFCSSBjaGFuZ2UsIGJ1bXAgdGhlIHZlcnNpb24gZmxhZwo+
IExJVkVQQVRDSF9QQVlMT0FEX1ZFUlNJT04gdXAgdG8gMi4KPiAKPiBUaGUgYWJvdmUgc29sdXRp
b24gb25seSBhcHBsaWVzIHRvIHg4NiBhcmNoaXRlY3R1cmUgZm9yIG5vdy4KCklzIHRoaXMgZ29p
bmcgdG8gYnJlYWsgbGl2ZXBhdGNoIG9uIEFybT8gSWYgc28sIGRvIHlvdSBoYXZlIGFueSBwbGFu
IHRvIApmaXggaXQ/CgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVw
YXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4gaW5kZXggMmFlYzUzMmVlMi4u
YTkzMTI2ZjYzMSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKPiBAQCAtMTE3LDcgKzExNyw3IEBAIGlu
dCBhcmNoX2xpdmVwYXRjaF9xdWllc2NlKHZvaWQpOwo+ICAgdm9pZCBhcmNoX2xpdmVwYXRjaF9y
ZXZpdmUodm9pZCk7Cj4gICAKPiAgIHZvaWQgYXJjaF9saXZlcGF0Y2hfYXBwbHkoc3RydWN0IGxp
dmVwYXRjaF9mdW5jICpmdW5jKTsKPiAtdm9pZCBhcmNoX2xpdmVwYXRjaF9yZXZlcnQoY29uc3Qg
c3RydWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKTsKPiArdm9pZCBhcmNoX2xpdmVwYXRjaF9yZXZl
cnQoc3RydWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKTsKCkkgZG91YnQgbGl2ZXBhdGNoIG9uIEFy
bSB3aWxsIGNvbXBpbGUgYWZ0ZXIgdGhpcyBjaGFuZ2UuCgo+ICAgdm9pZCBhcmNoX2xpdmVwYXRj
aF9wb3N0X2FjdGlvbih2b2lkKTsKPiAgIAo+ICAgdm9pZCBhcmNoX2xpdmVwYXRjaF9tYXNrKHZv
aWQpOwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
