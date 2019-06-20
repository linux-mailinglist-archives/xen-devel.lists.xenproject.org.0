Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDAE4CE8F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 15:23:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdwzJ-0004RS-P4; Thu, 20 Jun 2019 13:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdwzI-0004RN-H8
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 13:20:24 +0000
X-Inumbo-ID: 26e5448c-935e-11e9-a3ff-5be242021946
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 26e5448c-935e-11e9-a3ff-5be242021946;
 Thu, 20 Jun 2019 13:20:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1DF1344;
 Thu, 20 Jun 2019 06:20:19 -0700 (PDT)
Received: from [10.37.9.222] (unknown [10.37.9.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91FEA3F718;
 Thu, 20 Jun 2019 06:20:17 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, JBeulich@suse.com
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
 <20190617185017.32661-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e3ff3109-73e5-eb87-b8ad-51c697e0d9a3@arm.com>
Date: Thu, 20 Jun 2019 14:20:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617185017.32661-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/arm: fix mask calculation in
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
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com,
 tim@xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE3LzE5IDc6NTAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBUaGUg
bWFzayBjYWxjdWxhdGlvbiBpbiBwZHhfaW5pdF9tYXNrIGlzIHdyb25nIHdoZW4gdGhlIGZpcnN0
IGJhbmsKPiBzdGFydHMgYXQgYWRkcmVzcyAweDAuIFRoZSByZWFzb24gaXMgdGhhdCBwZHhfaW5p
dF9tYXNrIHdpbGwgZG8gJzAgLSAxJwo+IGNhdXNpbmcgYW4gdW5kZXJmbG93LiBBcyBhIHJlc3Vs
dCwgdGhlIG1hc2sgYmVjb21lcyAweGZmZmZmZmZmZmZmZmZmZmYKPiB3aGljaCBpcyB0aGUgYmln
Z2VzdCBwb3NzaWJsZSBtYXNrIGFuZCBlbmRzIHVwIGNhdXNpbmcgYSBzaWduaWZpY2FudAo+IG1l
bW9yeSB3YXN0ZSBpbiB0aGUgZnJhbWV0YWJsZSBzaXplIGNvbXB1dGF0aW9uLgo+IAo+IEZvciBp
bnN0YW5jZSwgb24gcGxhdGZvcm1zIHRoYXQgaGF2ZSBhIGxvdyBtZW1vcnkgYmFuayBzdGFydGlu
ZyBhdCAweDAKPiBhbmQgYSBoaWdoIG1lbW9yeSBiYW5rLCB0aGUgZnJhbWV0YWJsZSB3aWxsIGVu
ZCB1cCBjb3ZlcmluZyBhbGwgdGhlCj4gaG9sZXMgaW4gYmV0d2Vlbi4KPiAKPiBUaGUgcHVycG9z
ZSBvZiB0aGUgbWFzayBpcyB0byBiZSBwYXNzZWQgYXMgYSBwYXJhbWV0ZXIgdG8KPiBwZm5fcGR4
X2hvbGVfc2V0dXAsIHdoaWNoIGJhc2VkIG9uIHRoZSBtYXNrIHBhcmFtZXRlciBjYWxjdWxhdGVz
Cj4gcGZuX3BkeF9ob2xlX3NoaWZ0LCBwZm5fcGR4X2JvdHRvbV9tYXNrLCBldGMuIHdoaWNoIGFy
ZSBhY3R1YWxseSB0aGUKPiBpbXBvcnRhbnQgbWFza3MgZm9yIGZyYW1ldGFibGUgaW5pdGlhbGl6
YXRpb24gbGF0ZXIgb24uCj4gCj4gcGZuX3BkeF9ob2xlX3NldHVwIG5ldmVyIGNvbXByZXNzZXMg
YWRkcmVzc2VzIGJlbG93IE1BWF9PUkRFUiBiaXRzICgxR0IKPiBvbiBBUk0pLiBUaHVzLCBpdCBp
cyBzYWZlIHRvIGluaXRpYWxpemUgbWFzayBwYXNzaW5nIDFVTEwgPDwgKE1BWF9PUkRFUgo+ICsg
UEFHRV9TSElGVCkgYXMgc3RhcnQgYWRkcmVzcyB0byBwZHhfaW5pdF9tYXNrLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KClJldmll
d2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKSWRlYWxseSwgSSB3
b3VsZCBsaWtlIGFuIGFjayBmcm9tIEFuZHJldyBvciBKYW4uCgo+IENDOiBKQmV1bGljaEBzdXNl
LmNvbQo+IENDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCj4gQ0M6IEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbQo+IENDOiBpYW4uamFja3NvbkBldS5jaXRyaXguY29tCj4gQ0M6IGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20KPiBDQzogdGltQHhlbi5vcmcKPiBDQzogd2VpLmxpdTJAY2l0cml4
LmNvbQo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSB1c2UgdWludDY0X3QKPiAtIHNpbmds
ZSBsaW5lIGNvbW1lbnQgY29kZSBzdHlsZQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBpbXByb3Zl
IGluLWNvZGUgY29tbWVudHMKPiAKPiBVbmNoYW5nZWQgaW4gdjM6Cj4gLSAodTY0KTEKPiAKPiBD
aGFuZ2VzIGluIHYyOgo+IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4gLSBhZGQgaW4tY29kZSBj
b21tZW50cyByZWdhcmRpbmcgdXBkYXRlIHNpdGVzCj4gLSBpbXByb3ZlIGluLWNvZGUgY29tbWVu
dHMKPiAtIG1vdmUgdGhlIG1hc2sgaW5pdGlhbGl6YXRpb24gY2hhbmdlcyB0byBwZHhfaW5pdF9t
YXNrCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDkgKysrKysrKystCj4gICB4ZW4v
Y29tbW9uL3BkeC5jICAgICB8IDcgKysrKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
c2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4gaW5kZXggYjAzZTdhYzMzMC4uYjBhZjkw
ZTViZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jCj4gQEAgLTQ4Myw3ICs0ODMsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IGlu
aXRfcGR4KHZvaWQpCj4gICB7Cj4gICAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUs
IGJhbmtfZW5kOwo+ICAgCj4gLSAgICB1aW50NjRfdCBtYXNrID0gcGR4X2luaXRfbWFzayhib290
aW5mby5tZW0uYmFua1swXS5zdGFydCk7Cj4gKyAgICAvKgo+ICsgICAgICogQXJtIGRvZXMgbm90
IGhhdmUgYW55IHJlc3RyaWN0aW9ucyBvbiB0aGUgYml0cyB0byBjb21wcmVzcy4gUGFzcyAwIHRv
Cj4gKyAgICAgKiBsZXQgdGhlIGNvbW1vbiBjb2RlIGZ1cnRoZXIgcmVzdHJpY3QgdGhlIG1hc2su
Cj4gKyAgICAgKgo+ICsgICAgICogSWYgdGhlIGxvZ2ljIGNoYW5nZXMgaW4gcGZuX3BkeF9ob2xl
X3NldHVwIHdlIG1pZ2h0IGhhdmUgdG8KPiArICAgICAqIHVwZGF0ZSB0aGlzIGZ1bmN0aW9uIHRv
by4KPiArICAgICAqLwo+ICsgICAgdWludDY0X3QgbWFzayA9IHBkeF9pbml0X21hc2soMHgwKTsK
PiAgICAgICBpbnQgYmFuazsKPiAgIAo+ICAgICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IGJv
b3RpbmZvLm1lbS5ucl9iYW5rczsgYmFuaysrICkKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9w
ZHguYyBiL3hlbi9jb21tb24vcGR4LmMKPiBpbmRleCA4MzU2ZjAzY2U4Li45OTkwYjk0ZjczIDEw
MDY0NAo+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPiArKysgYi94ZW4vY29tbW9uL3BkeC5jCj4g
QEAgLTUwLDkgKzUwLDExIEBAIHN0YXRpYyB1NjQgX19pbml0IGZpbGxfbWFzayh1NjQgbWFzaykK
PiAgICAgICByZXR1cm4gbWFzazsKPiAgIH0KPiAgIAo+ICsvKiBXZSBkb24ndCBjb21wcmVzcyB0
aGUgZmlyc3QgTUFYX09SREVSIGJpdCBvZiB0aGUgYWRkcmVzc2VzLiAqLwo+ICAgdWludDY0X3Qg
X19pbml0IHBkeF9pbml0X21hc2sodWludDY0X3QgYmFzZV9hZGRyKQo+ICAgewo+IC0gICAgcmV0
dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKPiArICAgIHJldHVybiBmaWxsX21hc2sobWF4
KGJhc2VfYWRkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50NjRfdCkxIDw8IChN
QVhfT1JERVIgKyBQQUdFX1NISUZUKSkgLSAxKTsKPiAgIH0KPiAgIAo+ICAgdTY0IF9faW5pdCBw
ZHhfcmVnaW9uX21hc2sodTY0IGJhc2UsIHU2NCBsZW4pCj4gQEAgLTgwLDYgKzgyLDkgQEAgdm9p
ZCBfX2luaXQgcGZuX3BkeF9ob2xlX3NldHVwKHVuc2lnbmVkIGxvbmcgbWFzaykKPiAgICAgICAg
KiBUaGlzIGd1YXJhbnRlZXMgdGhhdCBwYWdlLXBvaW50ZXIgYXJpdGhtZXRpYyByZW1haW5zIHZh
bGlkIHdpdGhpbgo+ICAgICAgICAqIGNvbnRpZ3VvdXMgYWxpZ25lZCByYW5nZXMgb2YgMl5NQVhf
T1JERVIgcGFnZXMuIEFtb25nIG90aGVycywgb3VyCj4gICAgICAgICogYnVkZHkgYWxsb2NhdG9y
IHJlbGllcyBvbiB0aGlzIGFzc3VtcHRpb24uCj4gKyAgICAgKgo+ICsgICAgICogSWYgdGhlIGxv
Z2ljIGNoYW5nZXMgaGVyZSwgd2UgbWlnaHQgaGF2ZSB0byB1cGRhdGUgdGhlIEFSTSBzcGVjaWZp
Ywo+ICsgICAgICogaW5pdF9wZHggdG9vLgo+ICAgICAgICAqLwo+ICAgICAgIGZvciAoIGogPSBN
QVhfT1JERVItMTsgOyApCj4gICAgICAgewo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
