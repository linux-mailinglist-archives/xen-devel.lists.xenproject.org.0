Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D856594
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:19:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg434-0000wO-W8; Wed, 26 Jun 2019 09:17:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg433-0000wI-2q
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:17:01 +0000
X-Inumbo-ID: 26f389a1-97f3-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 26f389a1-97f3-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 09:16:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3E22B;
 Wed, 26 Jun 2019 02:16:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B66CE3F718;
 Wed, 26 Jun 2019 02:16:58 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-9-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251745260.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ed2c28a5-cdf6-8961-9e11-088607e61428@arm.com>
Date: Wed, 26 Jun 2019 10:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251745260.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/17] xen/arm64: head: Rework and document
 zero_bss()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIHNlY29u
ZGFyeSBDUFVzLCB6ZXJvX2JzcygpIHdpbGwgYmUgYSBOT1AgYmVjYXVzZSBCU1Mgb25seSBuZWVk
IHRvIGJlCj4+IHplcm9lZCBvbmNlIGF0IGJvb3QuIFNvIHRoZSBjYWxsIGluIHRoZSBzZWNvbmRh
cnkgQ1BVcyBwYXRoIGNhbiBiZQo+PiByZW1vdmVkLiBJdCBhbHNvIG1lYW5zIHRoYXQgeDI2IGRv
ZXMgbm90IG5lZWQgdG8gc2V0IGFuZCBpcyBub3cgb25seQo+PiB1c2VkIGJ5IHRoZSBib290IENQ
VS4KPj4KPj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lz
dGVycyB1c2FnZSB3aXRoaW4gdGhlCj4+IGZ1bmN0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiAtLS0KPj4gICB4ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIHwgMTMgKysrKysrKysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiBpbmRleCA4
N2ZjZDNiZTZjLi42YWEzMTQ4MTkyIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gQEAgLTcxLDcgKzcx
LDcgQEAKPj4gICAgKiAgeDIzIC0gVUFSVCBhZGRyZXNzCj4+ICAgICogIHgyNCAtCj4+ICAgICog
IHgyNSAtIGlkZW50aXR5IG1hcCBpbiBwbGFjZQo+PiAtICogIHgyNiAtIHNraXBfemVyb19ic3MK
Pj4gKyAqICB4MjYgLSBza2lwX3plcm9fYnNzIChib290IGNwdSBvbmx5KQo+IAo+IHlvdSBjb3Vs
ZCByZW1vdmUgdGhpcywgc2VlIGJlbG93Li4uCj4gCj4gCj4+ICAgICogIHgyNyAtCj4+ICAgICog
IHgyOCAtCj4+ICAgICogIHgyOSAtCj4+IEBAIC0zMTMsOCArMzEzLDYgQEAgR0xPQkFMKGluaXRf
c2Vjb25kYXJ5KQo+PiAgICAgICAgICAgc3ViICAgeDIwLCB4MTksIHgwICAgICAgICAgICAvKiB4
MjAgOj0gcGh5cy1vZmZzZXQgKi8KPj4gICAKPj4gICAgICAgICAgIG1vdiAgIHgyMiwgIzEgICAg
ICAgICAgICAgICAgLyogeDIyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KPj4gLSAgICAgICAgLyog
Qm9vdCBDUFUgYWxyZWFkeSB6ZXJvIEJTUyBzbyBza2lwIGl0IG9uIHNlY29uZGFyeSBDUFVzLiAq
Lwo+PiAtICAgICAgICBtb3YgICB4MjYsICMxICAgICAgICAgICAgICAgIC8qIFgyNiA6PSBza2lw
X3plcm9fYnNzICovCj4+ICAgCj4+ICAgICAgICAgICBtcnMgICB4MCwgbXBpZHJfZWwxCj4+ICAg
ICAgICAgICBsZHIgICB4MTMsID0ofk1QSURSX0hXSURfTUFTSykKPj4gQEAgLTMzNyw3ICszMzUs
NiBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4+ICAgICAgICAgICBQUklOVCgiIGJvb3Rpbmcg
LVxyXG4iKQo+PiAgICNlbmRpZgo+PiAgICAgICAgICAgYmwgICAgY2hlY2tfY3B1X21vZGUKPj4g
LSAgICAgICAgYmwgICAgemVyb19ic3MKPj4gICAgICAgICAgIGJsICAgIGNwdV9pbml0Cj4+ICAg
ICAgICAgICBibCAgICBjcmVhdGVfcGFnZV90YWJsZXMKPj4gICAgICAgICAgIGJsICAgIGVuYWJs
ZV9tbXUKPj4gQEAgLTM3NSw2ICszNzIsMTQgQEAgY2hlY2tfY3B1X21vZGU6Cj4+ICAgICAgICAg
ICBiIGZhaWwKPj4gICBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQo+PiAgIAo+PiArLyoKPj4gKyAq
IFplcm8gQlNTCj4+ICsgKgo+PiArICogSW5wdXRzOgo+PiArICogICB4MjY6IERvIHdlIG5lZWQg
dG8gemVybyBCU1M/Cj4+ICsgKgo+PiArICogQ2xvYmJlcnMgeDAgLSB4Mwo+PiArICovCj4+ICAg
emVyb19ic3M6Cj4+ICAgICAgICAgICAvKiBaZXJvIEJTUyBvbmx5IHdoZW4gcmVxdWVzdGVkICov
Cj4+ICAgICAgICAgICBjYm56ICB4MjYsIHNraXBfYnNzCj4gCj4gSW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHlvdSB3cm90ZTogIkl0IGFsc28gbWVhbnMgdGhhdCB4MjYgZG9lcyBub3QgbmVlZAo+IHRv
IHNldCBhbmQgaXMgbm93IG9ubHkgdXNlZCBieSB0aGUgYm9vdCBDUFUuIiBJIHRoaW5rIHRoaXMg
c3RhdGVtZW50IGlzCj4gY29ycmVjdCwgc28geW91IGNvdWxkIGFsc28gcmVtb3ZlIHRoaXMgImNi
bnogIHgyNiwgc2tpcF9ic3MiIGFuZCBhbHNvCj4gdGhlIHNraXBfYnNzIGxhYmVsIGJlbG93LgoK
SSBtZWFudCB4MjYgZG9lcyBub3QgbmVlZCB0byBiZSBzZXQgb24gdGhlIHNlY29uZGFyeSBDUFVz
LiBIb3dldmVyLCB3ZSBzdGlsbCAKbmVlZCB0byBrZWVwIGl0IGZvciBib290IENQVSBhcyB3ZSBk
b24ndCB3YW50IHRvIHplcm8gQlNTIHdoZW4gYm9vdGluZyB2aWEgRUZJLgoKVGhpcyBpcyBiZWNh
dXNlIHRoZSBFRkkgc3R1YiB3aWxsIHN0b3JlIGluZm9ybWF0aW9uIGluIEJTUy4gTm90ZSB0aGF0
IEJTUyB3YXMgCnplcm9lZCBieSBFRkkgbG9hZGVyIGJlZm9yZSBoYW5kLgoKSSB3aWxsIHJld29y
ZCB0aGUgY29tbWl0IG1lc3NhZ2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
