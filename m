Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D7832DDA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXkOb-0001FU-PX; Mon, 03 Jun 2019 10:40:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXkOa-0001FP-5Y
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:40:52 +0000
X-Inumbo-ID: 0df8ddbe-85ec-11e9-a80e-af8848d25fd2
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0df8ddbe-85ec-11e9-a80e-af8848d25fd2;
 Mon, 03 Jun 2019 10:40:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 148D0A78;
 Mon,  3 Jun 2019 03:40:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68FE23F5AF;
 Mon,  3 Jun 2019 03:40:48 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <d7e6554e6990789d1b619b6d489f52b7@sslemail.net>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
 <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
 <10daba8f-d14a-f1f4-a0cd-d18349263ace@arm.com>
 <ce2a0eea-ac01-4b96-b41a-802bb60f3d8d@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e76f6eef-82f6-668f-6413-e872cd3936d5@arm.com>
Date: Mon, 3 Jun 2019 11:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ce2a0eea-ac01-4b96-b41a-802bb60f3d8d@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]'
 to inline function
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wNi8yMDE5IDExOjIyLCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA2LzMv
MTkgMTc6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDAzLzA2LzIwMTkg
MDI6NTIsIGNoZW5iYW9kb25nIHdyb3RlOgo+Pj4KPj4+IE9uIDUvMzEvMTkgMTg6NTUsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDUvMzEvMTkgMzo0NiBBTSwgQmFv
ZG9uZyBDaGVuIHdyb3RlOgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5i
YW9kb25nQG14bmF2aS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoCB4ZW4vY29tbW9uL2NwdS5jwqDC
oMKgwqDCoCB8IDEwIC0tLS0tLS0tLS0KPj4+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL2NwdS5oIHzC
oCA0ICsrLS0KPj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jcHUuYyBiL3hl
bi9jb21tb24vY3B1LmMKPj4+Pj4gaW5kZXggZjM4OGQ4OS4uYTUyNmI1NSAxMDA2NDQKPj4+Pj4g
LS0tIGEveGVuL2NvbW1vbi9jcHUuYwo+Pj4+PiArKysgYi94ZW4vY29tbW9uL2NwdS5jCj4+Pj4+
IEBAIC01MSwxNiArNTEsNiBAQCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQo+Pj4+PiDCoMKgwqDC
oMKgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmY3B1X2FkZF9yZW1vdmVfbG9jayk7Cj4+Pj4+IMKg
IH0KPj4+Pj4gwqAgLWJvb2xfdCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKQo+Pj4+PiAtewo+Pj4+
PiAtwqDCoMKgIHJldHVybiBnZXRfY3B1X21hcHMoKTsKPj4+Pj4gLX0KPj4+Pj4gLQo+Pj4+PiAt
dm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpCj4+Pj4+IC17Cj4+Pj4+IC3CoMKgwqAgcHV0X2Nw
dV9tYXBzKCk7Cj4+Pj4+IC19Cj4+Pj4+IC0KPj4+Pj4gwqAgc3RhdGljIE5PVElGSUVSX0hFQUQo
Y3B1X2NoYWluKTsKPj4+Pj4gwqAgwqAgdm9pZCBfX2luaXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVy
KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpCj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vY3B1LmggYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgKPj4+Pj4gaW5kZXggNDYzOGM1MC4u
NzBhMmRmNCAxMDA2NDQKPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NwdS5oCj4+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+Pj4+PiBAQCAtMTAsOCArMTAsOCBAQCBib29sX3Qg
Z2V0X2NwdV9tYXBzKHZvaWQpOwo+Pj4+PiDCoCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKTsKPj4+
Pj4gwqAgwqAgLyogU2FmZWx5IHBlcmZvcm0gQ1BVIGhvdHBsdWcgYW5kIHVwZGF0ZSBjcHVfb25s
aW5lX21hcCwgZXRjLiAqLwo+Pj4+PiAtYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpOwo+
Pj4+PiAtdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpOwo+Pj4+PiArc3RhdGljIGlubGluZSBi
b29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkgeyByZXR1cm4gZ2V0X2NwdV9tYXBzKCk7IH0K
Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpIHsgcHV0X2Nw
dV9tYXBzKCk7IH0KPj4+Pgo+Pj4+IFRoZSBjb2Rpbmcgc3R5bGUgc2hvdWxkIGJlOgo+Pj4+Cj4+
Pj4gc3RhdGljIGlubGluZS4uLi4KPj4+PiB7Cj4+Pj4gwqDCoMKgwqDCoCAuLi4KPj4+PiB9Cj4+
Pj4KPj4+IFllcywgY2xhbmctZm9ybWF0IGF1dG9tYXRlZCBmb3JtYXQgY29kZSBmb3IgbWUsIHdp
bGwgYmUgZml4ZWQuCj4+Cj4+IEhtbW0sIGNsYW5nLWZvcm1hdCBkb2VzIG5vdCBoYXZlIFhlbiBj
b2Rpbmcgc3R5bGUgc3VwcG9ydCB5ZXQuIERvIHlvdSBoYXZlIAo+PiBwYXRjaGVzIG9uIHRvcCB0
byBoYW5kbGUgaXQ/Cj4gCj4gTm8sIEJ1dCB0aGUgbGludXgga2VybmVsIHNlZW1zIGFscmVhZHkg
aGF2ZSBpdCdzIGNsYW5nLWZvcm1hdCBzdXBwb3J0LiBHdWVzcyBjYW4gCj4gdXNlZCBieSB4ZW4u
CgpNb3N0IG9mIFhlbiBjb2RlIGJhc2UgZG9lcyBub3QgdXNlIExpbnV4IGNvZGluZyBzdHlsZS4g
VGhlIG9ubHkgZXhjZXB0aW9uIGlzIApmaWxlIGltcG9ydGVkIGRpcmVjdGx5IGZyb20gTGludXgg
dG8gZWFzZSBwb3J0aW5nIGJ1ZyBmaXhlcy4KCj4gCj4gSU1PwqAgaSBkb24ndCBsaWtlIHRoZSBj
b2Rpbmcgc3R5bGUgaW4geGVuIHBlcnNvbmFsbHkuCgpJIGRvbid0IG5lY2Vzc2FyaWx5IGFncmVl
IHdpdGggYWxsIG9mIGl0IGJ1dCBzb21lIG9mIHRoZSBMaW51eCBzdHlsZSBhcmUgb2RkIHRvby4K
Cj4gCj4gQnV0IGl0J3MgY29kZSBiYXNlIGhhcyBsb25nIHllYXJzIGhpc3RvcnkuIGNhbiBpbnNp
c3Qgb24gdGhpcyBvciBtYWtlIHNvbWUgY2hhbmdlcy4KCkltcHJvdmVtZW50IHRvIHRoZSBjb2Rp
bmcgc3R5bGUgYXJlIGFsd2F5cyB3ZWxjb21lZC4gQWx0aG91Z2gsIHlvdSB3aWxsIG5vdGljZSAK
dGhhdCBhbnl0aGluZyBhcm91bmQgY29kaW5nIHN0eWxlIChpbiBhbnkgcHJvamVjdCkgaXMgYSBt
YXR0ZXIgb2YgdGFzdGUgYW5kIGNhbiAKYmUgZGlmZmljdWx0IHRvIGZpbmQgYW4gYWdyZWVtZW50
LgoKPiAKPiBJIHByZWZlciBjbGFuZy1mb3JtYXQgcGVyc29uYWxseSzCoCBiZWNhdXNlIG5vIHN0
eWxlIGlzc3VlIGluIHBhdGNoIGFuZCB3aWxsIG1ha2UgCj4gcmV2aWV3IGVhc2llci4KCmNsYW5n
LWZvcm1hdCBpcyBub3QgYSBjb2Rpbmcgc3R5bGUuIEl0IGlzIGEgdG9vbCBoZWxwaW5nIHRvIGZv
cm1hdCBpbiBhIHNwZWNpZmljIApjb2Rpbmcgc3R5bGUuIFRoZXJlIGFyZSBlZmZvcnQgdG8gZXh0
ZW5kIGNsYW5nLWZvcm1hdCBmb3Igc3VwcG9ydGluZyBYZW4gY29kaW5nIApzdHlsZS4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
