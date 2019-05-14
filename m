Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64811C63A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 11:38:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQTqc-0007Ou-BU; Tue, 14 May 2019 09:35:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQTqb-0007Ok-B1
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:35:45 +0000
X-Inumbo-ID: a55c2c09-762b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a55c2c09-762b-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 09:35:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A60AE374;
 Tue, 14 May 2019 02:35:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD8243F703;
 Tue, 14 May 2019 02:35:41 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, andrii.anisov@gmail.com
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1c8b7f5f-09d7-6e38-1e78-9528c1f0a756@arm.com>
Date: Tue, 14 May 2019 10:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDkvMDUvMjAxOSAxMDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDguMDUuMTkgYXQgMTc6NDAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDIz
LzA0LzIwMTkgMDk6MTAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+IEBAIC0x
NjMsMTUgKzE2MywyMyBAQCBzdHJ1Y3QgdmNwdQo+Pj4gICAgICAgIHZvaWQgICAgICAgICAgICAq
c2NoZWRfcHJpdjsgICAgLyogc2NoZWR1bGVyLXNwZWNpZmljIGRhdGEgKi8KPj4+ICAgIAo+Pj4g
ICAgICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVuc3RhdGU7Cj4+PiArCj4+PiArICAg
IHNwaW5sb2NrX3QgICAgICBtYXBwZWRfcnVuc3RhdGVfbG9jazsKPj4+ICsKPj4+ICAgICNpZm5k
ZWYgQ09ORklHX0NPTVBBVAo+Pj4gICAgIyBkZWZpbmUgcnVuc3RhdGVfZ3Vlc3QodikgKCh2KS0+
cnVuc3RhdGVfZ3Vlc3QpCj4+PiAgICAgICAgWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X3J1bnN0YXRl
X2luZm9fdCkgcnVuc3RhdGVfZ3Vlc3Q7IC8qIGd1ZXN0IGFkZHJlc3MgKi8KPj4+ICsgICAgdmNw
dV9ydW5zdGF0ZV9pbmZvX3QgKm1hcHBlZF9ydW5zdGF0ZTsKPj4+ICAgICNlbHNlCj4+PiAgICAj
IGRlZmluZSBydW5zdGF0ZV9ndWVzdCh2KSAoKHYpLT5ydW5zdGF0ZV9ndWVzdC5uYXRpdmUpCj4+
PiAgICAgICAgdW5pb24gewo+Pj4gICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVu
c3RhdGVfaW5mb190KSBuYXRpdmU7Cj4+PiAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNw
dV9ydW5zdGF0ZV9pbmZvX2NvbXBhdF90KSBjb21wYXQ7Cj4+PiAgICAgICAgfSBydW5zdGF0ZV9n
dWVzdDsgLyogZ3Vlc3QgYWRkcmVzcyAqLwo+Pj4gKyAgICB1bmlvbiB7Cj4+PiArICAgICAgICB2
Y3B1X3J1bnN0YXRlX2luZm9fdCogbmF0aXZlOwo+Pj4gKyAgICAgICAgdmNwdV9ydW5zdGF0ZV9p
bmZvX2NvbXBhdF90KiBjb21wYXQ7Cj4+PiArICAgIH0gbWFwcGVkX3J1bnN0YXRlOyAvKiBndWVz
dCBhZGRyZXNzICovCj4+Cj4+IFRoZSBjb21iaW5hdGlvbiBvZiBtYXBwZWRfcnVuc3RhdGUgYW5k
IHJ1bnN0YXRlX2d1ZXN0IGlzIGEgYml0IGNvbmZ1c2luZy4gSQo+PiB0aGluayB5b3Ugd2FudCB0
byByZXdvcmsgdGhlIGludGVyZmFjZSB0byBzaG93IHRoYXQgb25seSBvbmUgaXMgcG9zc2libGUg
YXQgdGhlCj4+IHRpbWUgYW5kIG1ha2UgY2xlYXIgd2hpY2ggb25lIGlzIHVzZWQgYnkgd2hvLiBN
YXliZToKPj4KPj4gdW5pb24KPj4gewo+PiAgICAgIC8qIExlZ2FjeSBpbnRlcmZhY2UgdG8gYmUg
dXNlZCB3aGVuIHRoZSBndWVzdCBwcm92aWRlcyBhIHZpcnR1YWwgYWRkcmVzcyAqLwo+PiAgICAg
IHVuaW9uIHsKPj4gICAgICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb190
KSBuYXRpdmU7Cj4+ICAgICAgICAgLi4uCj4+ICAgICAgfSB2aXJ0Owo+Pgo+PiAgICAgIC8qIElu
dGVyZmFjZSB1c2VkIHdoZW4gdGhlIGd1ZXN0IHByb3ZpZGVzIGEgcGh5c2ljYWwgYWRkcmVzcyAq
Lwo+PiAgICAgIHVuaW9uIHsKPj4gICAgICB9IHBoeXM7Cj4+IH0gcnVuc3RhdGVfZ3Vlc3QuCj4+
Cj4+IHJ1bnN0YXRlX2d1ZXN0X3R5cGUgLyogY291bGQgYmUgYSBib29sIG9yIGVudW0gKi8KPj4K
Pj4gSmFuIHdoYXQgZG8geW91IHRoaW5rPwo+IAo+IEkgZnVsbHkgYWdyZWUgLSBubyBtaXhpbmcg
b2YgYXBwcm9hY2hlcyBoZXJlLCBpZiBwb3NzaWJsZS4gSG93ZXZlciwKPiBjYXJlIG5lZWRzIHRv
IGJlIHRha2VuIHRoYXQgYWZ0ZXIgYSBkb21haW4gcmVzZXQgdGhlIG5ldyBrZXJuZWwKPiBjYW4g
Y2hvc2UgdGhlIG9wcG9zaXRlIG1vZGVsLiBRdWVzdGlvbiBpcyB3aGV0aGVyIHRoZXJlIGFyZSBl
dmVuCj4gb3RoZXIgY2FzZXMgd2hlcmUgaW5kZXBlbmRlbnQgY29tcG9uZW50cyAoc2F5IGJvb3Qg
bG9hZGVyIGFuZAo+IE9TKSBtYXkgbmVlZCB0byBiZSBwZXJtaXR0ZWQgdG8gY2hvc2UgbW9kZWxz
IGluZGVwZW5kZW50bHkgb2YKPiBvbmUgYW5vdGhlci4KR29vZCBwb2ludC4gT24gYSBzaW1pbGFy
IHRvcGljLCBob3cgZG9lcyBLZXhlYyB3b3JrcyBvbiBYZW4/IERvIHdlIHJlc2V0IHRoZSAKZG9t
YWluIGFzIHdlbGw/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
