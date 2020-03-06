Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E817B8FF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:08:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA8uY-0001iw-M9; Fri, 06 Mar 2020 09:04:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jA8uX-0001ir-MX
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:04:49 +0000
X-Inumbo-ID: 874f1f8b-5f89-11ea-a774-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 874f1f8b-5f89-11ea-a774-12813bfff9fa;
 Fri, 06 Mar 2020 09:04:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29265AB3D;
 Fri,  6 Mar 2020 09:04:47 +0000 (UTC)
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
 <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
 <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca0ee3e7-bd09-bdeb-da6a-f4acaa96f27a@suse.com>
Date: Fri, 6 Mar 2020 10:04:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
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

T24gMDYuMDMuMjAyMCAwOTo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNi4wMy4yMCAw
OToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2LjAzLjIwMjAgMDc6NDIsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNS4wMy4yMCAwOToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDUuMDMuMjAyMCAwNzowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4gT24gMDQu
MDMuMjAgMTc6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDMuMjAyMCAxNzoz
MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+Pj4+PiBPbiAwNC4wMy4yMCAxNjoxOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA0LjAzLjIwMjAgMTY6MDcsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiAwNC4wMy4yMCAxMjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4+Pj4gT24gMjYuMDIuMjAyMCAxMzo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+
Pj4+Pj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKGNvbnN0IGNoYXIgKnN0
ciwgaW50IHZhbCkKPj4+Pj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4+Pj4gKyAgICBjaGFyICpwb3MgPSBv
cHRfZXB0X3NldHRpbmcgKyBzdHJsZW4ob3B0X2VwdF9zZXR0aW5nKTsKPj4+Pj4+Pj4+Pj4gKwo+
Pj4+Pj4+Pj4+PiArICAgIHNucHJpbnRmKHBvcywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZykgLSAo
cG9zIC0gb3B0X2VwdF9zZXR0aW5nKSwKPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAiLCVzPSVk
Iiwgc3RyLCB2YWwpOwo+Pj4+Pj4+Pj4+PiArfQo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICtz
dGF0aWMgdm9pZCB1cGRhdGVfZXB0X3BhcmFtKHZvaWQpCj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+
Pj4+ICsgICAgc25wcmludGYob3B0X2VwdF9zZXR0aW5nLCBzaXplb2Yob3B0X2VwdF9zZXR0aW5n
KSwgInBtbD0lZCIsIG9wdF9lcHRfcG1sKTsKPj4+Pj4+Pj4+Pj4gKyAgICBpZiAoIG9wdF9lcHRf
YWQgPj0gMCApCj4+Pj4+Pj4+Pj4+ICsgICAgICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKCJh
ZCIsIG9wdF9lcHRfYWQpOwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVGhpcyB3b24ndCBjb3JyZWN0
bHkgcmVmbGVjdCByZWFsaXR5OiBJZiB5b3UgbG9vayBhdAo+Pj4+Pj4+Pj4+IHZteF9pbml0X3Zt
Y3NfY29uZmlnKCksIGV2ZW4gYSBuZWdhdGl2ZSB2YWx1ZSBtZWFucyAidHJ1ZSIgaGVyZSwKPj4+
Pj4+Pj4+PiB1bmxlc3Mgb24gYSBzcGVjaWZpYyBBdG9tIG1vZGVsLiBJIHRoaW5rIGluaXRfZXB0
X3BhcmFtKCkgd2FudHMKPj4+Pj4+Pj4+PiB0byBoYXZlIHRoYXQgZXJyYXR1bSB3b3JrYXJvdW5k
IGxvZ2ljIG1vdmVkIHRoZXJlLCBzdWNoIHRoYXQKPj4+Pj4+Pj4+PiB5b3UgY2FuIHRoZW4gYXNz
bWUgdGhlIHZhbHVlIHRvIGJlIG5vbi1uZWdhdGl2ZSBoZXJlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IEJ1dCBpc24ndCBub3QgbWVudGlvbmluZyBpdCBpbiB0aGUgLTEgY2FzZSBjb3JyZWN0PyAtMSBt
ZWFuczogZG8gdGhlCj4+Pj4+Pj4+PiBjb3JyZWN0IHRoaW5nIG9uIHRoZSBjdXJyZW50IGhhcmR3
YXJlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXZWxsLCBJIHRoaW5rIHRoZSBvdXRwdXQgaGVyZSBzaG91
bGQgcmVwcmVzZW50IGVmZmVjdGl2ZSBzZXR0aW5ncywKPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBtaW5p
bXVtIHJlcXVpcmVtZW50IGlzIHRvIHJlZmxlY3QgdGhlIGVmZmVjdGl2ZSBwYXJhbWV0ZXJzLCBs
aWtlCj4+Pj4+Pj4gY21kbGluZSBpcyBkb2luZyBmb3IgYm9vdC10aW1lIG9ubHkgcGFyYW1ldGVy
cy4gV2l0aCBydW50aW1lIHBhcmFtZXRlcnMKPj4+Pj4+PiB3ZSBoYWQgbm8gd2F5IG9mIHRlbGxp
bmcgd2hhdCB3YXMgc2V0LCBhbmQgdGhpcyBpcyBub3cgcG9zc2libGUuCj4+Pj4+Pj4KPj4+Pj4+
Pj4gYW5kIGEgc3ViLWl0ZW0gc2hvdWxkIGJlIHN1cHByZXNzZWQgb25seSBpZiBhIHNldHRpbmcg
aGFzIG5vIGVmZmVjdAo+Pj4+Pj4+PiBhdCBhbGwgaW4gdGhlIGN1cnJlbnQgc2V0dXAsIGxpa2Ug
Li4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+ICsgICAgaWYgKCBvcHRfZXB0X2V4ZWNfc3AgPj0gMCAp
Cj4+Pj4+Pj4+Pj4+ICsgICAgICAgIHVwZGF0ZV9lcHRfcGFyYW1fYXBwZW5kKCJleGVjLXNwIiwg
b3B0X2VwdF9leGVjX3NwKTsKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEkgYWdyZWUgZm9yIHRoaXMg
b25lIC0gaWYgdGhlIHZhbHVlIGlzIHN0aWxsIC0xLCBpdCBoYXMgbmVpdGhlcgo+Pj4+Pj4+Pj4+
IGJlZW4gc2V0IG5vciBpcyBpdHMgdmFsdWUgb2YgYW55IGludGVyZXN0Lgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiAuLi4gaGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIG5vdCBtaXgg
dXAgc3BlY2lmaWVkIHBhcmFtZXRlcnMgYW5kIGVmZmVjdGl2ZQo+Pj4+Pj4+IHNldHRpbmdzLiBJ
biBjYXNlIGFuIGVmZmVjdGl2ZSBzZXR0aW5nIGlzIG9mIGNvbW1vbiBpbnRlcmVzdCBpdCBzaG91
bGQKPj4+Pj4+PiBiZSByZXBvcnRlZCB2aWEgYSBzcGVjaWZpYyBub2RlIChsaWtlIGUuZy4gc3Bl
Y2lmaWMgbWl0aWdhdGlvbiBzZXR0aW5ncwo+Pj4+Pj4+IHdoZXJlIHRoZSBjbWRsaW5lIGlzIG5v
dCBwcm92aWRpbmcgZW5vdWdoIGRldGFpbHMpLgo+Pj4+Pj4KPj4+Pj4+IEJ1dCB0aGVuIGEgYm9v
bGVhbiBvcHRpb24gdGhhdCB3YXNuJ3Qgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPj4+
Pj4+IHNob3VsZCBwcm9kdWNlIG5vIG91dHB1dCBhdCBhbGwuIEFuZCBoZW5jZSB3ZSdkIG5lZWQg
YSB3YXkgdG8gdGVsbAo+Pj4+Pj4gd2hldGhlciBhbiBvcHRpb24gd2FzIHNldCBmcm9tIGNvbW1h
bmQgbGluZSBmb3IgX2FsbF8gb2YgdGhlbS4gSQo+Pj4+Pj4gZG9uJ3QgdGhpbmsgdGhpcyB3b3Vs
ZCBiZSB2ZXJ5IGhlbHBmdWwuCj4+Pj4+Cj4+Pj4+IEkgZGlzYWdyZWUgaGVyZS4KPj4+Pj4KPj4+
Pj4gVGhpcyBpcyBpbXBvcnRhbnQgb25seSBmb3IgY2FzZXMgd2hlcmUgdGhlIGh5cGVydmlzb3Ig
dHJlYXRzIHRoZQo+Pj4+PiBwYXJhbWV0ZXIgYXMgYSB0cmlzdGF0ZTogdHJ1ZS9mYWxzZS91bnNw
ZWNpZmllZC4gSW4gYWxsIGNhc2VzIHdoZXJlCj4+Pj4+IHRoZSBib29sIHZhbHVlIGlzIHJlYWxs
eSB0cnVlIG9yIGZhbHNlIGl0IGNhbiBiZSByZXBvcnRlZCBhcyBzdWNoLgo+Pj4+Cj4+Pj4gVGhl
IHByb2JsZW0gSSdtIGhhdmluZyB3aXRoIHRoaXMgaXMgdGhlIHJlc3VsdGluZyBpbmNvbnNpc3Rl
bmN5Ogo+Pj4+IFdoZW4gd2Ugd3JpdGUgdGhlIHZhcmlhYmxlIHdpdGggMCBvciAxIGluIGNhc2Ug
d2UgZmluZCBpdCB0byBiZQo+Pj4+IC0xIGFmdGVyIGNvbW1hbmQgbGluZSBwYXJzaW5nLCB0aGUg
ZXh0ZXJuYWxseSB2aXNpYmxlIGVmZmVjdCB3aWxsCj4+Pj4gYmUgZGlmZmVyZW50IGZyb20gdGhl
IGNhc2Ugd2hlcmUgd2UgbGVhdmUgaXQgdG8gYmUgLTEgeWV0IHN0aWxsCj4+Pj4gdHJlYXQgaXQg
YXMgKHBzZXVkby0pYm9vbGVhbi4gVGhpcywgaG93ZXZlciwgaXMgYW4gaW1wbGVtZW50YXRpb24K
Pj4+PiBkZXRhaWwsIHdoaWxlIGltbyB0aGUgaHlwZnMgcHJlc2VudGF0aW9uIHNob3VsZCBub3Qg
ZGVwZW5kIG9uCj4+Pj4gc3VjaCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLgo+Pj4+Cj4+Pj4+IFJl
cG9ydGluZyAwLzEgZm9yIGUuZy4gImFkIiBpZiBvcHRfZXB0X2FkPT0tMSB3b3VsZCBhZGQgYSBs
YXRlbnQgcHJvYmxlbQo+Pj4+PiBpZiBhbnkgb3RoZXIgYWN0aW9uIHdvdWxkIGJlIGRlcml2ZWQg
ZnJvbSB0aGUgcGFyYW1ldGVyIHZhcmlhYmxlIGJlaW5nCj4+Pj4+IC0xLgo+Pj4+Pgo+Pj4+PiBT
byBlaXRoZXIgb3B0X2VwdF9hZCBzaG91bGQgYmUgbW9kaWZpZWQgdG8gY2hhbmdlIGl0IHRvIDAv
MSBpbnN0ZWFkIG9mCj4+Pj4+IG9ubHkgc2V0dGluZyB0aGUgVkNNUyBmbGFnLAo+Pj4+Cj4+Pj4g
VGhhdCdzIHdoYXQgSSBkaWQgc3VnZ2VzdC4KPj4+Pgo+Pj4+PiBvciB0aGUgbG9naWMgc2hvdWxk
IGJlIGtlcHQgYXMgaXMgaW4gdGhpcwo+Pj4+PiBwYXRjaC4gSU1PIGNoYW5naW5nIHRoZSBzZXR0
aW5nIG9mIG9wdF9lcHRfYWQgc2hvdWxkIGJlIGRvbmUgaW4gYW5vdGhlcgo+Pj4+PiBwYXRjaCBp
ZiB0aGlzIGlzIHJlYWxseSB3YW50ZWQuCj4+Pj4KPj4+PiBBbmQgb2YgY291cnNlIEkgZG9uJ3Qg
bWluZCBhdCBhbGwgZG9pbmcgc28gaW4gYSBwcmVyZXEgcGF0Y2guCj4+Pj4gSXQncyBqdXN0IHRo
YXQgdGhlIHBhdGNoIGhlcmUgcHJvdmlkZXMgYSBnb29kIHBsYWNlIF93aGVyZV8gdG8KPj4+PiBh
Y3R1YWxseSBkbyBzdWNoIGFuIGFkanVzdG1lbnQuCj4+Pgo+Pj4gSSB3YXMgdGhpbmtpbmcgb2Yg
c29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bWNzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwo+Pj4gQEAgLTMxMywx
MiArMzEzLDEyIEBAIHN0YXRpYyBpbnQgdm14X2luaXRfdm1jc19jb25maWcodm9pZCkKPj4+ICAg
ICAgICB7Cj4+PiAgICAgICAgICAgIHJkbXNybChNU1JfSUEzMl9WTVhfRVBUX1ZQSURfQ0FQLCBf
dm14X2VwdF92cGlkX2NhcCk7Cj4+Pgo+Pj4gKyAgICAgICAgaWYgKCAvKiBXb3JrIGFyb3VuZCBF
cnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9jZXNzb3JzLiAqLwo+Pj4gKyAgICAgICAgICAgICBi
b290X2NwdV9kYXRhLng4NiA9PSA2ICYmIGJvb3RfY3B1X2RhdGEueDg2X21vZGVsID09IDB4NGQg
JiYKPj4+ICsgICAgICAgICAgICAgb3B0X2VwdF9hZCA8IDAgKQo+Pj4gKyAgICAgICAgICAgIG9w
dF9lcHRfYWQgPSAwOwo+Pj4gICAgICAgICAgICBpZiAoICFvcHRfZXB0X2FkICkKPj4+ICAgICAg
ICAgICAgICAgIF92bXhfZXB0X3ZwaWRfY2FwICY9IH5WTVhfRVBUX0FEX0JJVDsKPj4+IC0gICAg
ICAgIGVsc2UgaWYgKCAvKiBXb3JrIGFyb3VuZCBFcnJhdHVtIEFWUjQxIG9uIEF2b3RvbiBwcm9j
ZXNzb3JzLiAqLwo+Pj4gLSAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2ID09IDYg
JiYgYm9vdF9jcHVfZGF0YS54ODZfbW9kZWwgPT0gMHg0ZCAmJgo+Pj4gLSAgICAgICAgICAgICAg
ICAgIG9wdF9lcHRfYWQgPCAwICkKPj4+IC0gICAgICAgICAgICBfdm14X2VwdF92cGlkX2NhcCAm
PSB+Vk1YX0VQVF9BRF9CSVQ7Cj4+Pgo+Pj4gICAgICAgICAgICAvKgo+Pj4gICAgICAgICAgICAg
KiBBZGRpdGlvbmFsIHNhbml0eSBjaGVja2luZyBiZWZvcmUgdXNpbmcgRVBUOgo+Pgo+PiBBbmQg
SSB3YXMgc3BlY2lmaWNhbGx5IGhvcGluZyB0byBhdm9pZCBkb2luZyB0aGlzIGluIGEgbm9uLV9f
aW5pdAo+PiBmdW5jdGlvbi4KPiAKPiBTaG91bGQgYmUgZmFpcmx5IGVhc3kgKHNlZSBhdHRhY2hl
ZCBwYXRjaCkuCgpXaHkgbm90IHB1dCB0aGUgb3B0X2VwdF9hZCBhZGp1c3RtZW50IHJpZ2h0IGlu
dG8gc3RhcnRfdm14KCksCmp1c3QgbGlrZSBlLmcuIHRoZSBvcHRfZXB0X2V4ZWNfc3AgZ2V0cyBh
bHNvIGRvbmUgdGhlcmU/IFB1bGxpbmcKdGhlIHNldHRpbmcgdXAgb2YgdGhlICd2JyBrZXkgaGFu
ZGxlciByaXNrcyBpbnN0YWxsaW5nIGl0IGFoZWFkCm9mIGEgcG90ZW50aWFsIGZ1dHVyZSBsYXRl
ciBlcnJvciBleGl0IGZyb20gc3RhcnRfdm14KCkuIEJ1dCBJJ20Kbm90IGVudGlyZWx5IG9wcG9z
ZWQgdG8gdGhlIGNob3NlbiBhcHByb2FjaCBlaXRoZXIgLSBpdCdsbCBiZSB1cAp0byBLZXZpbiB0
byBqdWRnZSwgSSBndWVzcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
