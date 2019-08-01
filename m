Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40A7DDD8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htByr-0004zJ-DK; Thu, 01 Aug 2019 14:22:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qeGT=V5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htByp-0004zE-Ov
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:22:55 +0000
X-Inumbo-ID: d9e3731a-b467-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d9e3731a-b467-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:22:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1EE2337;
 Thu,  1 Aug 2019 07:22:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49DE53F694;
 Thu,  1 Aug 2019 07:22:53 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com> <87y30dget5.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e022de0d-2515-007f-0a66-2f7a94c68777@arm.com>
Date: Thu, 1 Aug 2019 15:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y30dget5.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMDEvMDgvMjAxOSAxNTowNywgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gCj4gSGkgSnVsaWVuLAo+IAo+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4gCj4+IEhpLAo+
Pgo+PiBPbiAwMS8wOC8yMDE5IDE0OjQ5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Cj4+
PiBWaWt0b3IgTWl0aW4gd3JpdGVzOgo+Pj4KPj4+PiBGdW5jdGlvbnMgbWFrZV90aW1lcl9ub2Rl
IGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZSBhcmUgcXVpdGUgc2ltaWxhci4KPj4+PiBTbyBpdCBp
cyBiZXR0ZXIgdG8gY29uc29saWRhdGUgdGhlbSB0byBhdm9pZCBkaXNjcmVwYW5jeS4KPj4+PiBU
aGUgbWFpbiBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGZ1bmN0aW9ucyBpcyB0aGUgdGltZXIgaW50
ZXJydXB0cyB1c2VkLgo+Pj4+Cj4+Pj4gS2VlcCB0aGUgZG9tVSB2ZXJzaW9uIGZvciB0aGUgY29t
cGF0aWJsZSBhcyBpdCBpcyBzaW1wbGVyLgo+Pj4+IE1lYW4gZG8gbm90IGNvcHkgcGxhdGZvcm0n
cyAnY29tcGF0aWJsZScgcHJvcGVydHkgaW50byBod2RvbQo+Pj4+IGRldmljZSB0cmVlLCBpbnN0
ZWFkIHNldCBlaXRoZXIgYXJtLGFybXY3LXRpbWVyIG9yIGFybSxhcm12OC10aW1lciwKPj4+PiBk
ZXBlbmRpbmcgb24gdGhlIHBsYXRmb3JtIHR5cGUuCj4+PiBJdCBpcyBoYXJkIHRvIHBhcnNlIHRo
ZSBsYXN0IHNlbnRlbmNlLiBXaGF0IGFib3V0ICJLZWVwIHRoZSBkb21VIHZlcnNpb24KPj4+IGZv
ciB0aGUgY29tcGF0aWJsZSBhcyBpdCBpcyBzaW1wbGVyOiBkbyBub3QgY29weSBwbGF0Zm9ybSdz
Cj4+PiAnY29tcGF0aWJsZScgcHJvcGVydHkgaW50byBod2RvbSBkZXZpY2UgdHJlZSwgaW5zdGVh
ZCBzZXQgZWl0aGVyCj4+PiBhcm0sYXJtdjctdGltZXIgb3IgYXJtLGFybXY4LXRpbWVyLCBkZXBl
bmRpbmcgb24gdGhlIHBsYXRmb3JtIHR5cGUuIiA/Cj4+Pgo+Pj4KPj4+PiBLZWVwIHRoZSBodyB2
ZXJzaW9uIGZvciB0aGUgY2xvY2sgYXMgaXQgaXMgcmVsZXZhbnQgZm9yIHRoZSBib3RoIGNhc2Vz
Lgo+Pj4+Cj4+Pj4gVGhlIG5ldyBmdW5jdGlvbiBoYXMgY2hhbmdlZCBwcm90b3R5cGUgZHVlIHRv
IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzCj4+Pj4gICAgIG1ha2VfdGltZXJfbm9kZShjb25zdCBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+Pj4+Cj4+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBN
aXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+Pj4+IC0tLQo+Pj4+IHY0IHVwZGF0ZXM6Cj4+
Pj4gICAgICB1cGRhdGVkICJLZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxl
IGFzIGl0IGlzIHNpbXBsZXIiCj4+Pj4KPj4+PiB2NSB1cGRhdGVzOgo+Pj4+ICAgICAgIC0gY2hh
bmdlZCAna2VwdCcgdG8gJ2tlZXAnLCBldGMuCj4+Pj4gICAgICAgLSByZW1vdmVkIGVtcHR5IGxp
bmUKPj4+PiAgICAgICAtIHVwZGF0ZWQgaW5kZW50YXRpb24gb2YgcGFyYW1ldGVycyBpbiBmdW5j
dGlvbnMgY2FsbHMKPj4+PiAgICAgICAtIGZpeGVkIE5JVHMKPj4+PiAgICAgICAtIHVwZGF0ZWQg
Y29tbWl0IG1lc3NhZ2UKPj4+PiAtLS0KPj4+PiAgICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgfCAxMDYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+Pj4+IGluZGV4IGJjN2QxN2RkMmMuLjU4NTQyMTMwY2EgMTAwNjQ0Cj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4gQEAgLTk3MywxMCArOTczLDggQEAgc3RhdGljIGludCBf
X2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4+
Pj4gICAgICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4+Pj4gICAgICAgIH07Cj4+Pj4gICAg
ICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2Owo+Pj4+IC0gICAgdTMyIGxlbjsKPj4+PiAt
ICAgIGNvbnN0IHZvaWQgKmNvbXBhdGlibGU7Cj4+Pj4gICAgICAgIGludCByZXM7Cj4+Pj4gLSAg
ICB1bnNpZ25lZCBpbnQgaXJxOwo+Pj4+ICsgICAgdW5zaWduZWQgaW50IGlycVtNQVhfVElNRVJf
UFBJXTsKPj4+IEFzIEkgc2FpZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgeW91IGFyZSB3YXN0
aW5nIHN0YWNrIHNwYWNlCj4+PiB0aGVyZS4gQWxzbywgdGhpcyBpcyBtaXNsZWFkaW5nLiBXaGVu
IEkgc2VlIGFycmF5IG9mIDQgaXRlbXMsIEkgZXhwZWN0Cj4+PiB0aGF0IGFsbCA0IGl0ZW1zIHdp
bGwgYmUgdXNlZC4gQnV0IHlvdSBhcmUgdXNpbmcgb25seSAzLCBzbyBpdCBsZWFkcyB0bwo+Pj4g
dHdvIGNvbmNsdXNpb25zOiBlaXRoZXIgeW91IG1hZGUgYSBtaXN0YWtlLCBvciBJIGRvbid0IHVu
ZGVyc3RhbmQgd2hhdAo+Pj4gaXQgaGFwcGVuaW5nLiBFaXRoZXIgb3B0aW9uIGlzIGJhZC4KPj4K
Pj4gNCBieXRlIG9uIGEgc3RhY2sgb2YgMTZLQi4uLiB0aGF0J3Mgbm90IHJlYWxseSBhIHdhc3Rl
IHdvcnRoIGFuCj4+IGFyZ3VtZW50LiBUaGUgbW9yZSB0aGUgc3RhY2sgaXMgcHJldHR5IGVtcHR5
IGFzIHRoaXMgaXMgYm9vdC4gU28geWVzLAo+PiB5b3Ugd2lsbCBub3QgdXNlIHRoZSBsYXN0IGlu
ZGV4IGJlY2F1c2UgeW91IGRvbid0IGV4cG9zZSBoeXBlcnZpc29yCj4+IHRpbWVyIHRvIGd1ZXN0
IHlldCEgKEltYWdpbmUgbmVzdGVkIHZpcnQpLiBCdXQgYXQgbGVhc3QgaXQgYXZvaWRzCj4+IGhh
cmRjb2RpbmcgYSBudW1iZXIgb2YgaW5kZXggYW5kIG1hdGNoIHRoZSBlbnVtLgo+IFllcywgYnV0
IHRoZW4gaXQgc2hvdWxkIGJlIGRvY3VtZW50ZWQgYXQgbGVhc3QuIENvbW1lbnQgYWJvdmUgd2ls
bCBiZQo+IGZpbmUuCgpJIGRvbid0IHJlYWxseSBzZWUgdGhlIHByb2JsZW0gd2l0aCB0aGUgY3Vy
cmVudCBjb2RlLi4uIFRoaXMgaXMgc2ltaWxhciB0byB3aGVuIAp3ZSB1c2UgYSBzdHJ1Y3R1cmUg
YnV0IG5vdCBhbGwgdGhlIGZpZWxkIGluIGNlcnRhaW4gY2lyY3Vtc3RhbmNlIChzZWUgCmR0X2Rl
dmljZV9tYXRjaCBmb3IgaW5zdGFuY2UpLiBTbyBJIHdvdWxkIG5vdCBmb3JjZSB0aGUgY29udHJp
YnV0b3IgdG8gZG8gaXQuCgo+IEluIHRoaXMgY2FzZSB3ZSBhbHNvIGNhbiBkZWNsYXJlIGFuZCB1
c2UgaW50cnNbXSBpbiB0aGUgc2FtZSB3YXkuCgpUaGVyZSBpcyBubyBndWFyYW50ZWUgdGhlIGlu
ZGV4IGluIGlycSB3aWxsIG1hdGNoIGludHJzWy4uLl0uIFNvIHlvdSBuZWVkIHRvIAprZWVwIHRo
ZW0gaGFyZGNvZGVkIGluIHRoZSBsYXR0ZXIgY2FzZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
