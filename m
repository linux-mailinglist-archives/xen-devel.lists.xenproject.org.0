Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9017B843
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:22:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA8Di-0006Ek-Bm; Fri, 06 Mar 2020 08:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA8Dg-0006Ed-Gc
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:20:32 +0000
X-Inumbo-ID: 58557eb4-5f83-11ea-a761-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58557eb4-5f83-11ea-a761-12813bfff9fa;
 Fri, 06 Mar 2020 08:20:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BE9BB2AE;
 Fri,  6 Mar 2020 08:20:30 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
 <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
 <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
Date: Fri, 6 Mar 2020 09:20:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAwNzo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNS4wMy4yMCAw
OToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjAzLjIwMjAgMDc6MDEsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4wMy4yMCAxNzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDQuMDMuMjAyMCAxNzozMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDQu
MDMuMjAgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDMuMjAyMCAxNjow
NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBPbiAwNC4wMy4yMCAxMjozMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDI2LjAyLjIwMjAgMTM6NDcsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6Cj4+Pj4+Pj4+PiArc3RhdGljIHZvaWQgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoY29u
c3QgY2hhciAqc3RyLCBpbnQgdmFsKQo+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+ICsgICAgY2hhciAq
cG9zID0gb3B0X2VwdF9zZXR0aW5nICsgc3RybGVuKG9wdF9lcHRfc2V0dGluZyk7Cj4+Pj4+Pj4+
PiArCj4+Pj4+Pj4+PiArICAgIHNucHJpbnRmKHBvcywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZykg
LSAocG9zIC0gb3B0X2VwdF9zZXR0aW5nKSwKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgIiwlcz0l
ZCIsIHN0ciwgdmFsKTsKPj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArc3RhdGlj
IHZvaWQgdXBkYXRlX2VwdF9wYXJhbSh2b2lkKQo+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+ICsgICAg
c25wcmludGYob3B0X2VwdF9zZXR0aW5nLCBzaXplb2Yob3B0X2VwdF9zZXR0aW5nKSwgInBtbD0l
ZCIsIG9wdF9lcHRfcG1sKTsKPj4+Pj4+Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2FkID49IDAgKQo+
Pj4+Pj4+Pj4gKyAgICAgICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImFkIiwgb3B0X2VwdF9h
ZCk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgd29uJ3QgY29ycmVjdGx5IHJlZmxlY3QgcmVhbGl0
eTogSWYgeW91IGxvb2sgYXQKPj4+Pj4+Pj4gdm14X2luaXRfdm1jc19jb25maWcoKSwgZXZlbiBh
IG5lZ2F0aXZlIHZhbHVlIG1lYW5zICJ0cnVlIiBoZXJlLAo+Pj4+Pj4+PiB1bmxlc3Mgb24gYSBz
cGVjaWZpYyBBdG9tIG1vZGVsLiBJIHRoaW5rIGluaXRfZXB0X3BhcmFtKCkgd2FudHMKPj4+Pj4+
Pj4gdG8gaGF2ZSB0aGF0IGVycmF0dW0gd29ya2Fyb3VuZCBsb2dpYyBtb3ZlZCB0aGVyZSwgc3Vj
aCB0aGF0Cj4+Pj4+Pj4+IHlvdSBjYW4gdGhlbiBhc3NtZSB0aGUgdmFsdWUgdG8gYmUgbm9uLW5l
Z2F0aXZlIGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBCdXQgaXNuJ3Qgbm90IG1lbnRpb25pbmcgaXQg
aW4gdGhlIC0xIGNhc2UgY29ycmVjdD8gLTEgbWVhbnM6IGRvIHRoZQo+Pj4+Pj4+IGNvcnJlY3Qg
dGhpbmcgb24gdGhlIGN1cnJlbnQgaGFyZHdhcmUuCj4+Pj4+Pgo+Pj4+Pj4gV2VsbCwgSSB0aGlu
ayB0aGUgb3V0cHV0IGhlcmUgc2hvdWxkIHJlcHJlc2VudCBlZmZlY3RpdmUgc2V0dGluZ3MsCj4+
Pj4+Cj4+Pj4+IFRoZSBtaW5pbXVtIHJlcXVpcmVtZW50IGlzIHRvIHJlZmxlY3QgdGhlIGVmZmVj
dGl2ZSBwYXJhbWV0ZXJzLCBsaWtlCj4+Pj4+IGNtZGxpbmUgaXMgZG9pbmcgZm9yIGJvb3QtdGlt
ZSBvbmx5IHBhcmFtZXRlcnMuIFdpdGggcnVudGltZSBwYXJhbWV0ZXJzCj4+Pj4+IHdlIGhhZCBu
byB3YXkgb2YgdGVsbGluZyB3aGF0IHdhcyBzZXQsIGFuZCB0aGlzIGlzIG5vdyBwb3NzaWJsZS4K
Pj4+Pj4KPj4+Pj4+IGFuZCBhIHN1Yi1pdGVtIHNob3VsZCBiZSBzdXBwcmVzc2VkIG9ubHkgaWYg
YSBzZXR0aW5nIGhhcyBubyBlZmZlY3QKPj4+Pj4+IGF0IGFsbCBpbiB0aGUgY3VycmVudCBzZXR1
cCwgbGlrZSAuLi4KPj4+Pj4+Cj4+Pj4+Pj4+PiArICAgIGlmICggb3B0X2VwdF9leGVjX3NwID49
IDAgKQo+Pj4+Pj4+Pj4gKyAgICAgICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImV4ZWMtc3Ai
LCBvcHRfZXB0X2V4ZWNfc3ApOwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGFncmVlIGZvciB0aGlzIG9u
ZSAtIGlmIHRoZSB2YWx1ZSBpcyBzdGlsbCAtMSwgaXQgaGFzIG5laXRoZXIKPj4+Pj4+Pj4gYmVl
biBzZXQgbm9yIGlzIGl0cyB2YWx1ZSBvZiBhbnkgaW50ZXJlc3QuCj4+Pj4+Pgo+Pj4+Pj4gLi4u
IGhlcmUuCj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBtaXggdXAgc3BlY2lmaWVk
IHBhcmFtZXRlcnMgYW5kIGVmZmVjdGl2ZQo+Pj4+PiBzZXR0aW5ncy4gSW4gY2FzZSBhbiBlZmZl
Y3RpdmUgc2V0dGluZyBpcyBvZiBjb21tb24gaW50ZXJlc3QgaXQgc2hvdWxkCj4+Pj4+IGJlIHJl
cG9ydGVkIHZpYSBhIHNwZWNpZmljIG5vZGUgKGxpa2UgZS5nLiBzcGVjaWZpYyBtaXRpZ2F0aW9u
IHNldHRpbmdzCj4+Pj4+IHdoZXJlIHRoZSBjbWRsaW5lIGlzIG5vdCBwcm92aWRpbmcgZW5vdWdo
IGRldGFpbHMpLgo+Pj4+Cj4+Pj4gQnV0IHRoZW4gYSBib29sZWFuIG9wdGlvbiB0aGF0IHdhc24n
dCBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQgbGluZQo+Pj4+IHNob3VsZCBwcm9kdWNlIG5vIG91
dHB1dCBhdCBhbGwuIEFuZCBoZW5jZSB3ZSdkIG5lZWQgYSB3YXkgdG8gdGVsbAo+Pj4+IHdoZXRo
ZXIgYW4gb3B0aW9uIHdhcyBzZXQgZnJvbSBjb21tYW5kIGxpbmUgZm9yIF9hbGxfIG9mIHRoZW0u
IEkKPj4+PiBkb24ndCB0aGluayB0aGlzIHdvdWxkIGJlIHZlcnkgaGVscGZ1bC4KPj4+Cj4+PiBJ
IGRpc2FncmVlIGhlcmUuCj4+Pgo+Pj4gVGhpcyBpcyBpbXBvcnRhbnQgb25seSBmb3IgY2FzZXMg
d2hlcmUgdGhlIGh5cGVydmlzb3IgdHJlYXRzIHRoZQo+Pj4gcGFyYW1ldGVyIGFzIGEgdHJpc3Rh
dGU6IHRydWUvZmFsc2UvdW5zcGVjaWZpZWQuIEluIGFsbCBjYXNlcyB3aGVyZQo+Pj4gdGhlIGJv
b2wgdmFsdWUgaXMgcmVhbGx5IHRydWUgb3IgZmFsc2UgaXQgY2FuIGJlIHJlcG9ydGVkIGFzIHN1
Y2guCj4+Cj4+IFRoZSBwcm9ibGVtIEknbSBoYXZpbmcgd2l0aCB0aGlzIGlzIHRoZSByZXN1bHRp
bmcgaW5jb25zaXN0ZW5jeToKPj4gV2hlbiB3ZSB3cml0ZSB0aGUgdmFyaWFibGUgd2l0aCAwIG9y
IDEgaW4gY2FzZSB3ZSBmaW5kIGl0IHRvIGJlCj4+IC0xIGFmdGVyIGNvbW1hbmQgbGluZSBwYXJz
aW5nLCB0aGUgZXh0ZXJuYWxseSB2aXNpYmxlIGVmZmVjdCB3aWxsCj4+IGJlIGRpZmZlcmVudCBm
cm9tIHRoZSBjYXNlIHdoZXJlIHdlIGxlYXZlIGl0IHRvIGJlIC0xIHlldCBzdGlsbAo+PiB0cmVh
dCBpdCBhcyAocHNldWRvLSlib29sZWFuLiBUaGlzLCBob3dldmVyLCBpcyBhbiBpbXBsZW1lbnRh
dGlvbgo+PiBkZXRhaWwsIHdoaWxlIGltbyB0aGUgaHlwZnMgcHJlc2VudGF0aW9uIHNob3VsZCBu
b3QgZGVwZW5kIG9uCj4+IHN1Y2ggaW1wbGVtZW50YXRpb24gZGV0YWlscy4KPj4KPj4+IFJlcG9y
dGluZyAwLzEgZm9yIGUuZy4gImFkIiBpZiBvcHRfZXB0X2FkPT0tMSB3b3VsZCBhZGQgYSBsYXRl
bnQgcHJvYmxlbQo+Pj4gaWYgYW55IG90aGVyIGFjdGlvbiB3b3VsZCBiZSBkZXJpdmVkIGZyb20g
dGhlIHBhcmFtZXRlciB2YXJpYWJsZSBiZWluZwo+Pj4gLTEuCj4+Pgo+Pj4gU28gZWl0aGVyIG9w
dF9lcHRfYWQgc2hvdWxkIGJlIG1vZGlmaWVkIHRvIGNoYW5nZSBpdCB0byAwLzEgaW5zdGVhZCBv
Zgo+Pj4gb25seSBzZXR0aW5nIHRoZSBWQ01TIGZsYWcsCj4+Cj4+IFRoYXQncyB3aGF0IEkgZGlk
IHN1Z2dlc3QuCj4+Cj4+PiBvciB0aGUgbG9naWMgc2hvdWxkIGJlIGtlcHQgYXMgaXMgaW4gdGhp
cwo+Pj4gcGF0Y2guIElNTyBjaGFuZ2luZyB0aGUgc2V0dGluZyBvZiBvcHRfZXB0X2FkIHNob3Vs
ZCBiZSBkb25lIGluIGFub3RoZXIKPj4+IHBhdGNoIGlmIHRoaXMgaXMgcmVhbGx5IHdhbnRlZC4K
Pj4KPj4gQW5kIG9mIGNvdXJzZSBJIGRvbid0IG1pbmQgYXQgYWxsIGRvaW5nIHNvIGluIGEgcHJl
cmVxIHBhdGNoLgo+PiBJdCdzIGp1c3QgdGhhdCB0aGUgcGF0Y2ggaGVyZSBwcm92aWRlcyBhIGdv
b2QgcGxhY2UgX3doZXJlXyB0bwo+PiBhY3R1YWxseSBkbyBzdWNoIGFuIGFkanVzdG1lbnQuCj4g
Cj4gSSB3YXMgdGhpbmtpbmcgb2Ygc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bWNzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNz
LmMKPiBAQCAtMzEzLDEyICszMTMsMTIgQEAgc3RhdGljIGludCB2bXhfaW5pdF92bWNzX2NvbmZp
Zyh2b2lkKQo+ICAgICAgIHsKPiAgICAgICAgICAgcmRtc3JsKE1TUl9JQTMyX1ZNWF9FUFRfVlBJ
RF9DQVAsIF92bXhfZXB0X3ZwaWRfY2FwKTsKPiAKPiArICAgICAgICBpZiAoIC8qIFdvcmsgYXJv
dW5kIEVycmF0dW0gQVZSNDEgb24gQXZvdG9uIHByb2Nlc3NvcnMuICovCj4gKyAgICAgICAgICAg
ICBib290X2NwdV9kYXRhLng4NiA9PSA2ICYmIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsID09IDB4
NGQgJiYKPiArICAgICAgICAgICAgIG9wdF9lcHRfYWQgPCAwICkKPiArICAgICAgICAgICAgb3B0
X2VwdF9hZCA9IDA7Cj4gICAgICAgICAgIGlmICggIW9wdF9lcHRfYWQgKQo+ICAgICAgICAgICAg
ICAgX3ZteF9lcHRfdnBpZF9jYXAgJj0gflZNWF9FUFRfQURfQklUOwo+IC0gICAgICAgIGVsc2Ug
aWYgKCAvKiBXb3JrIGFyb3VuZCBFcnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9jZXNzb3JzLiAq
Lwo+IC0gICAgICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4NiA9PSA2ICYmIGJvb3RfY3B1
X2RhdGEueDg2X21vZGVsID09IDB4NGQgJiYKPiAtICAgICAgICAgICAgICAgICAgb3B0X2VwdF9h
ZCA8IDAgKQo+IC0gICAgICAgICAgICBfdm14X2VwdF92cGlkX2NhcCAmPSB+Vk1YX0VQVF9BRF9C
SVQ7Cj4gCj4gICAgICAgICAgIC8qCj4gICAgICAgICAgICAqIEFkZGl0aW9uYWwgc2FuaXR5IGNo
ZWNraW5nIGJlZm9yZSB1c2luZyBFUFQ6CgpBbmQgSSB3YXMgc3BlY2lmaWNhbGx5IGhvcGluZyB0
byBhdm9pZCBkb2luZyB0aGlzIGluIGEgbm9uLV9faW5pdApmdW5jdGlvbi4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
