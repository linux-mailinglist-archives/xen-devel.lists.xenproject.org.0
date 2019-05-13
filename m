Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719F1B34B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 11:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ7bZ-0000uA-Td; Mon, 13 May 2019 09:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ7bX-0000u5-N4
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:50:43 +0000
X-Inumbo-ID: 91f392be-7564-11e9-ab53-b316b66639df
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 91f392be-7564-11e9-ab53-b316b66639df;
 Mon, 13 May 2019 09:50:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75618341;
 Mon, 13 May 2019 02:50:41 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 888B33F703;
 Mon, 13 May 2019 02:50:38 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-3-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d91e016e-2c29-325d-5ba2-3c7981470e49@arm.com>
Date: Mon, 13 May 2019 10:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508224727.11549-3-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvOC8xOSAxMTo0NyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFRoZSBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgaXMgd3Jvbmcgd2hlbiB0
aGUgZmlyc3QgYmFuawo+IHN0YXJ0cyBhdCBhZGRyZXNzIDB4MC4gVGhlIHJlYXNvbiBpcyB0aGF0
IHBkeF9pbml0X21hc2sgd2lsbCBkbyAnMCAtIDEnCj4gY2F1c2luZyBhbiB1bmRlcmZsb3cuIEFz
IGEgcmVzdWx0LCB0aGUgbWFzayBiZWNvbWVzIDB4ZmZmZmZmZmZmZmZmZmZmZgo+IHdoaWNoIGlz
IHRoZSBiaWdnZXN0IHBvc3NpYmxlIG1hc2sgYW5kIGVuZHMgdXAgY2F1c2luZyBhIHNpZ25pZmlj
YW50Cj4gbWVtb3J5IHdhc3RlIGluIHRoZSBmcmFtZXRhYmxlIHNpemUgY29tcHV0YXRpb24uCj4g
Cj4gRm9yIGluc3RhbmNlLCBvbiBwbGF0Zm9ybXMgdGhhdCBoYXZlIGEgbG93IG1lbW9yeSBiYW5r
IHN0YXJ0aW5nIGF0IDB4MAo+IGFuZCBhIGhpZ2ggbWVtb3J5IGJhbmssIHRoZSBmcmFtZXRhYmxl
IHdpbGwgZW5kIHVwIGNvdmVyaW5nIGFsbCB0aGUKPiBob2xlcyBpbiBiZXR3ZWVuLgo+IAo+IFRo
ZSBwdXJwb3NlIG9mIHRoZSBtYXNrIGlzIHRvIGJlIHBhc3NlZCBhcyBhIHBhcmFtZXRlciB0bwo+
IHBmbl9wZHhfaG9sZV9zZXR1cCwgd2hpY2ggYmFzZWQgb24gdGhlIG1hc2sgcGFyYW1ldGVyIGNh
bGN1bGF0ZXMKPiBwZm5fcGR4X2hvbGVfc2hpZnQsIHBmbl9wZHhfYm90dG9tX21hc2ssIGV0Yy4g
d2hpY2ggYXJlIGFjdHVhbGx5IHRoZQo+IGltcG9ydGFudCBtYXNrcyBmb3IgZnJhbWV0YWJsZSBp
bml0aWFsaXphdGlvbiBsYXRlciBvbi4KPiAKPiBwZm5fcGR4X2hvbGVfc2V0dXAgbmV2ZXIgY29t
cHJlc3NlcyBhZGRyZXNzZXMgYmVsb3cgTUFYX09SREVSIGJpdHMgKDFHQgo+IG9uIEFSTSkuIFRo
dXMsIGl0IGlzIHNhZmUgdG8gaW5pdGlhbGl6ZSBtYXNrIHBhc3NpbmcgMVVMTCA8PCAoTUFYX09S
REVSCj4gKyBQQUdFX1NISUZUKSBhcyBzdGFydCBhZGRyZXNzIHRvIHBkeF9pbml0X21hc2suCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
Pgo+IENDOiBKQmV1bGljaEBzdXNlLmNvbQo+IENDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Cj4gQ0M6IEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbQo+IENDOiBpYW4uamFja3NvbkBldS5j
aXRyaXguY29tCj4gQ0M6IGtvbnJhZC53aWxrQG9yYWNsZS5jb20KPiBDQzogdGltQHhlbi5vcmcK
PiBDQzogd2VpLmxpdTJAY2l0cml4LmNvbQo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSB1
cGRhdGUgY29tbWl0IG1lc3NhZ2UKPiAtIGFkZCBpbi1jb2RlIGNvbW1lbnRzIHJlZ2FyZGluZyB1
cGRhdGUgc2l0ZXMKPiAtIGltcHJvdmUgaW4tY29kZSBjb21tZW50cwo+IC0gbW92ZSB0aGUgbWFz
ayBpbml0aWFsaXphdGlvbiBjaGFuZ2VzIHRvIHBkeF9pbml0X21hc2sKPiAtLS0KPiAgIHhlbi9h
cmNoL2FybS9zZXR1cC5jIHwgOSArKysrKysrKy0KPiAgIHhlbi9jb21tb24vcGR4LmMgICAgIHwg
OCArKysrKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCj4gaW5kZXggY2NiMGYxODFlYS4uYWZhYWZlN2I4NCAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gQEAg
LTQ4Miw3ICs0ODIsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfcGR4KHZvaWQpCj4gICB7
Cj4gICAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUsIGJhbmtfZW5kOwo+ICAgCj4g
LSAgICB1NjQgbWFzayA9IHBkeF9pbml0X21hc2soYm9vdGluZm8ubWVtLmJhbmtbMF0uc3RhcnQp
Owo+ICsgICAgLyoKPiArICAgICAqIFBhc3MgMHgwIHRvIHBkeF9pbml0X21hc2sgdG8gZ2V0IGEg
bWFzayBpbml0aWFsaXplZCB3aXRoIHRoZQo+ICsgICAgICogZmlyc3QgdG8gMTw8TUFYX09SREVS
IHBhZ2VzIG9mIFJBTSBsZWZ0IHVuY29tcHJlc3NlZC4KCldoYXQgbWF0dGVyIGlzIEFybSBkb2Vz
bid0IGhhdmUgYW55IHNwZWNpZmljIHJlc3RyaWN0aW9uIG9uIHRoZSAKY29tcHJlc3Npb24sIGJ1
dCB0aGUgY29tbW9uIGNvZGUgbWF5IGhhdmUuIFNvIGhvdyBhYm91dCBzb21ldGhpbmc6CgoiQXJt
IGRvZXMgbm90IGhhdmUgYW55IHJlc3RyaWN0aW9uIG9uIHRoZSBiaXRzIHRvIGNvbXByZXNzLiBQ
YXNzIDAgdG8gCmxldCB0aGUgY29tbW9uIGNvZGUgdG8gZnVydGhlciByZXN0cmljdCIuCgo+ICsg
ICAgICoKPiArICAgICAqIElmIHRoZSBsb2dpYyBjaGFuZ2VzIGluIHBmbl9wZHhfaG9sZV9zZXR1
cCB3ZSBtaWdodCBoYXZlIHRvCj4gKyAgICAgKiB1cGRhdGUgdGhpcyBmdW5jdGlvbiB0b28uCj4g
KyAgICAgKi8gPiArICAgIHU2NCBtYXNrID0gcGR4X2luaXRfbWFzaygweDApOwo+ICAgICAgIGlu
dCBiYW5rOwo+ICAgCj4gICAgICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8ubWVt
Lm5yX2JhbmtzOyBiYW5rKysgKQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BkeC5jIGIveGVu
L2NvbW1vbi9wZHguYwo+IGluZGV4IGJiN2U0MzcwNDkuLjI2OGQ2ZjdlYzMgMTAwNjQ0Cj4gLS0t
IGEveGVuL2NvbW1vbi9wZHguYwo+ICsrKyBiL3hlbi9jb21tb24vcGR4LmMKPiBAQCAtNTAsOSAr
NTAsMTMgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9tYXNrKHU2NCBtYXNrKQo+ICAgICAgIHJl
dHVybiBtYXNrOwo+ICAgfQo+ICAgCj4gKy8qCj4gKyAqIFdlIGFsd2F5cyBtYXAgdGhlIGZpcnN0
IDE8PE1BWF9PUkRFUiBwYWdlcyBvZiBSQU0sIGhlbmNlLCB0aGV5CgpJIHRob3VnaHQgSSBhbHJl
YWR5IHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLiBBdCBsZWFzdCBvbiAKQXJt
LCB3ZSBuZXZlciBtYXAgdGhlIGZpcnN0IDEgPDwgTUFYX09SREVSIG9mIFJBTS4gSW5zdGVhZCB3
aGF0IHlvdSB3YW50IAp0byBzYXkgaXMgdGhhdCB3ZSBkb24ndCBjb21wcmVzcyB0aGUgZmlyc3Qg
TiBiaXRzIG9mIHRoZSBhZGRyZXNzLgoKPiArICogYXJlIGxlZnQgdW5jb21wcmVzc2VkLgo+ICsg
Ki8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
