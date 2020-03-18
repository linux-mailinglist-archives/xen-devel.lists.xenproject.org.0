Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A56189D00
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 14:30:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEYix-0001OK-KF; Wed, 18 Mar 2020 13:27:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEYiw-0001OE-9E
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 13:27:06 +0000
X-Inumbo-ID: 282fdcfa-691c-11ea-bae8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 282fdcfa-691c-11ea-bae8-12813bfff9fa;
 Wed, 18 Mar 2020 13:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82043AC7B;
 Wed, 18 Mar 2020 13:27:03 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
 <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
 <d3e79d9b-63e8-9d4f-ff2b-38b99b7c3c42@suse.com>
 <80a0959cb68373b03c2d57fa9d0af6eb8b117d42.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fa1dfe5-28e8-77fd-4898-62d68ffa058c@suse.com>
Date: Wed, 18 Mar 2020 14:27:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <80a0959cb68373b03c2d57fa9d0af6eb8b117d42.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMzoxMSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIFdlZCwgMjAy
MC0wMy0xOCBhdCAxMTowMyArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3LjAzLjIw
MjAgMjM6MTUsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IE9uIFRodSwgMjAyMC0wMi0yMCBh
dCAxMjo1OSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDcuMDIuMjAyMCAxOTow
NCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+Pj4KPj4+ICAgICAgICAgICBBU1NFUlQoKHBnW2ld
LmNvdW50X2luZm8gJiB+UEdDX2V4dHJhKSA9PSBQR0Nfc3RhdGVfaW51c2UgfHwKPj4+ICAgICAg
ICAgICAgICAgICAgKHBnW2ldLmNvdW50X2luZm8gJiB+UEdDX2V4dHJhKSA9PSBQR0Nfc3RhdGVf
dW5pbml0aWFsaXNlZCk7Cj4+Pj4+ICAgICAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ldLCBk
KTsKPj4+Pj4gICAgICAgICAgICBzbXBfd21iKCk7IC8qIERvbWFpbiBwb2ludGVyIG11c3QgYmUg
dmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcgcmVmY250LiAqLwo+Pj4+PiAtICAgICAgICBwZ1tpXS5j
b3VudF9pbmZvID0gUEdDX2FsbG9jYXRlZCB8IDE7Cj4+Pj4+ICsgICAgICAgIHBnW2ldLmNvdW50
X2luZm8gfD0gUEdDX2FsbG9jYXRlZCB8IDE7Cj4+Pj4KPj4+PiBUaGlzIGlzIHRvbyByZWxheGVk
IGZvciBteSB0YXN0ZTogSSB1bmRlcnN0YW5kIHlvdSB3YW50IHRvCj4+Pj4gcmV0YWluIHBhZ2Ug
c3RhdGUsIGJ1dCBJIHN1cHBvc2Ugb3RoZXIgYml0cyB3b3VsZCB3YW50IGNsZWFyaW5nCj4+Pj4g
bmV2ZXJ0aGVsZXNzLgo+Pj4KPj4+IFlvdSBzZWVtIHRvIGhhdmUgZHJvcHBlZCB0aGUgQVNTRVJU
IGltbWVkaWF0ZWx5IGJlZm9yZSB0aGUgY29kZSBzbmlwcGV0Cj4+PiB5b3UgY2l0ZWQsIGluIHdo
aWNoIGFyYml0cmFyeSBvdGhlciBjb250ZW50cyBvZiBjb3VudF9pbmZvIGFyZSBub3QKPj4+IHBl
cm1pdHRlZC4gSSBwdXQgaXQgYmFjaywgaW4gaXRzIGN1cnJlbnQgZm9ybSBhZnRlciBJIHJlYmFz
ZSBvbiB0b3Agb2YKPj4+IFBhdWwncyBjb21taXQgYzc5M2QxMzk0NGI0NWQgYXNzaW5nIFBHQ19l
eHRyYS4KPj4KPj4gQnV0IHRoYXQnIG9ubHkgYW4gQVNTRVJUKCksIGkuZS4gbm8gcHJvdGVjdGlv
biBhdCBhbGwgaW4gcmVsZWFzZSBidWlsZHMuCj4gCj4gQW4gQVNTRVJUIGRvZXMgcHJvdGVjdCBy
ZWxlYXNlIGJ1aWxkcy4gSWYgdGhlIHJ1bGUgaXMgdGhhdCB5b3UgbXVzdAo+IG5ldmVyIGNhbGwg
YXNzaWduX3BhZ2VzKCkgd2l0aCBwYWdlcyB0aGF0IGhhdmUgdGhlIG90aGVyIGJpdHMgaW4KPiBj
b3VudF9pbmZvIHNldCwgdGhlbiB0aGUgQVNTRVJUIGhlbHBzIHRvIGNhdGNoIHRoZSBjYXNlcyB3
aGVyZSBwZW9wbGUKPiBpbnRyb2R1Y2UgYSBidWcgYW5kIHN0YXJ0IGRvaW5nIHByZWNpc2VseSB0
aGF0LCBhbmQgdGhlIGJ1ZyBuZXZlcgo+ICptYWtlcyogaXQgdG8gcmVsZWFzZSBidWlsZHMuCj4g
Cj4gV2hhdCB3ZSdyZSBkZWJhdGluZyBoZXJlIGlzIHRoZSBiZWhhdmlvdXIgb2YgYXNzaWduX3Bh
Z2VzKCkgd2hlbgo+IHNvbWVvbmUgaW50cm9kdWNlcyBzdWNoIGEgYnVnIGFuZCBjYWxscyBpdCB3
aXRoIGluYXBwcm9wcmlhdGUgcGFnZXMuCj4gCj4gQ3VycmVudGx5LCB0aGUgYmVoYXZpb3VyIGlz
IHRoYXQgdGhlIG90aGVyIGZsYWdzIGFyZSBzaWxlbnRseSBjbGVhcmVkLgo+IEkndmUgc2VlbiBu
byBhbmFseXNpcyB0aGF0IHN1Y2ggY2xlYXJpbmcgaXMgY29ycmVjdCBvciBkZXNpcmFibGUuIElu
Cj4gZmFjdCwgZm9yIHRoZSBQR0Nfc3RhdGUgYml0cyBJIGRldGVybWluZWQgdGhhdCBpdCBub3cg
aXMgTk9UIGNvcnJlY3QsCj4gd2hpY2ggaXMgd2h5IEkgY2hhbmdlZCBpdC4KPiAKPiBXaGlsZSBJ
IHdhcyBhdCBpdCwgSSBsZXQgaXQgcHJlc2VydmUgdGhlIG90aGVyIGJpdHMg4oCUIHdoaWNoLCBh
Z2FpbiwKPiBzaG91bGQgbmV2ZXIgYmUgc2V0LCBhbmQgd2hpY2ggd291bGQgdHJpZ2dlciB0aGUg
QVNTRVJUIGluIGRlYnVnIGJ1aWxkcwo+IGlmIGl0IHdlcmUgdG8gaGFwcGVuLgo+IAo+IEJ1dCBJ
J20gbm90IHRpZWQgdG8gdGhhdCBiZWhhdmlvdXIuIEl0J3Mgc3RpbGwgYSAiY2FuIG5ldmVyIGhh
cHBlbiIKPiBjYXNlIGFzIGZhciBhcyBJJ20gY29uY2VybmVkLiBTbyBsZXQncyBtYWtlIGl0IGxv
b2sgbGlrZSB0aGlzOgo+IAo+IAo+ICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsg
aSsrICkKPiAgICAgewo+ICAgICAgICAgQVNTRVJUKHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0g
TlVMTCk7Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogTm90ZTogTm90IHVzaW5nIHBhZ2Vfc3Rh
dGVfaXMoKSBoZXJlLiBUaGUgQVNTRVJUIHJlcXVpcmVzIHRoYXQKPiAgICAgICAgICAqIGFsbCBv
dGhlciBiaXRzIGluIGNvdW50X2luZm8gYXJlIHplcm8sIGluIGFkZGl0aW9uIHRvIFBHQ19zdGF0
ZQo+ICAgICAgICAgICogYmVpbmcgYXBwcm9wcmlhdGUuCj4gICAgICAgICAgKi8KPiAgICAgICAg
IEFTU0VSVCgocGdbaV0uY291bnRfaW5mbyAmIH5QR0NfZXh0cmEpID09IFBHQ19zdGF0ZV9pbnVz
ZSB8fAo+ICAgICAgICAgICAgICAgIChwZ1tpXS5jb3VudF9pbmZvICYgflBHQ19leHRyYSkgPT0g
UEdDX3N0YXRlX3VuaW5pdGlhbGlzZWQpOwo+ICAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ld
LCBkKTsKPiAgICAgICAgIHNtcF93bWIoKTsgLyogRG9tYWluIHBvaW50ZXIgbXVzdCBiZSB2aXNp
YmxlIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICovCj4gICAgICAgICBwZ1tpXS5jb3VudF9pbmZv
ID0gKHBnW2ldLmNvdW50X2luZm8gJiBQR0Nfc3RhdGUpIHwgUEdDX2FsbG9jYXRlZCB8IDE7Cj4g
ICAgICAgICBwYWdlX2xpc3RfYWRkX3RhaWwoJnBnW2ldLCAmZC0+cGFnZV9saXN0KTsKPiAgICAg
fQo+IAo+IE9LPwoKWWVzLCB0aGFua3MuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
