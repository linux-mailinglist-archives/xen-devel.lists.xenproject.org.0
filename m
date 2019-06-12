Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9141DEC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 09:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haxoX-0001yr-OH; Wed, 12 Jun 2019 07:36:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haxoW-0001yi-8b
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:36:56 +0000
X-Inumbo-ID: d560087e-8ce4-11e9-ab61-abde2bd56afc
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d560087e-8ce4-11e9-ab61-abde2bd56afc;
 Wed, 12 Jun 2019 07:36:49 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 15:33:37 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <5942544893366d8ff51fdf603fd13f18@sslemail.net>
 <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
 <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
 <5D009CE602000078002374B3@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <4deea016-0fa9-0bf1-f570-9c0dd6679761@mxnavi.com>
Date: Wed, 12 Jun 2019 15:36:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D009CE602000078002374B3@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTIvMTkgMTQ6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjA2LjE5IGF0
IDAyOjIzLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IE9uIDYvMTEvMTkgMjI6
MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTEuMDYuMTkgYXQgMDg6MDIsIDxjaGVu
YmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxk
cy5TCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+Pj4+IEBAIC0yNDAsMTIgKzI0
MCwxNCBAQCBTRUNUSU9OUwo+Pj4+ICAgICAgICAgICAgKiguYWx0aW5zdHJ1Y3Rpb25zKQo+Pj4+
ICAgICAgICAgICAgX19hbHRfaW5zdHJ1Y3Rpb25zX2VuZCA9IC47Cj4+Pj4gICAgCj4+Pj4gKyNp
ZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKPj4+PiAgICAgICAgICAgLiA9IEFMSUdOKDgpOwo+
Pj4+ICAgICAgICAgICBfX2N0b3JzX3N0YXJ0ID0gLjsKPj4+PiAgICAgICAgICAgKiguY3RvcnMp
Cj4+Pj4gICAgICAgICAgICooLmluaXRfYXJyYXkpCj4+Pj4gICAgICAgICAgICooU09SVCguaW5p
dF9hcnJheS4qKSkKPj4+PiAgICAgICAgICAgX19jdG9yc19lbmQgPSAuOwo+Pj4+ICsjZW5kaWYK
Pj4+IEhvdyBpcyB0aGlzIChvbmx5KSBjb3ZlcmFnZSByZWxhdGVkPyBBbmQgaG93IGlzIG1ha2lu
ZyB0aGlzIGNvbmRpdGlvbmFsCj4+PiBnb2luZyB0byBoZWxwIGluIGFueSB3YXk/Cj4+IEhlbGxv
IEphbiwKPj4KPj4gV2hlbiBpIHJlYWQgdGhlIGNvZGUgJ2luaXRfY29uc3RydWN0b3JzKCknLCBp
IHdhbnQgdG8gdW5kZXJzdGFuZCB3aGVuCj4+IGl0J3MgdXNlZC4KPj4KPj4gSSBjYW4gbm90IGZp
bmQgYW55IGhlbHBlciBtYWNyb3MgbGlrZSAnX19pbml0JyBpbiBpbml0LmgsIHB1dCB0aGluZ3Mg
aW4KPj4gdGhpcyBzZWN0aW9uLgo+Pgo+PiBBbHNvIHJ1biB1bmRlciBhcm0gZm91bmRhdGlvbiBw
bGF0Zm9ybSwgdGhlIHNlY3Rpb24gaXMgZW1wdHkuCj4+Cj4+IFNvIGkgY2hlY2sgY29tbWl0IGhp
c3RvcnkgYW5kIGZvdW5kIGl0J3MgY29tbWl0IGxvZ3M6IGl0IGlzIGNvdmVyYWdlCj4+IHJlbGF0
ZWQuCj4+Cj4+IEFuZCBjb21waWxlZCB3aXRoIENPTkZJR19DT1ZFUkFHRSBlbmFibGVkLCB0aGlz
IHNlY3Rpb24gaXMgbm90IGVtcHR5Cj4+IGFueW1vcmUuCj4+Cj4+IFNvIHRoZSBwYXRjaCBtYWlu
bHkgd2FudCB0byBjbGFyaWZ5IHRoZSBjb2RlIGlzIGNvdmVyYWdlIHJlbGF0ZWQsCj4+Cj4+IHdo
aWNoIHdhbnQgdG8gaGVscCBuZXdjb21lciBlYXNpbHkgdW5kZXJzdGFuZCB0aGlzIGNvZGUuCj4+
Cj4+IEFtIGkgbWlzdW5kZXJzdGFuZGluZyBoZXJlPwo+IFRoZSBjb2RlIG1heSBoYXZlIGJlZW4g
X2ludHJvZHVjZWRfIGZvciBjb3ZlcmFnZSwgYnV0IGFyZSB5b3UKPiB3aWxsaW5nIHRvIGd1YXJh
bnRlZSBpdCdzIGNvdmVyYWdlLW9ubHk/IFBsdXMgLSB3aGF0IGRvZXMgcmVtb3ZpbmcKPiBhbiBl
bXB0eSBzZWN0aW9uIGJ1eSB5b3U/CgpDdXJyZW50bHkgc2VlbXMgdHJ1ZSwgYnV0IG5vdCBzdXJl
IGFib3V0IHRoZSBmdXR1cmUsIGNhbiBub3QgZ3VhcmFudGVlLgoKUGVyc29uYWxseSBndWVzcyB0
aGlzIHNob3VsZCBub3QgYmUgdXNlZCBieSB4ZW4sIGJ1dCB1c2UgX19pbml0X2NhbGwoZm4pIAps
aWtlIGluIGluaXQuaC4KCk15IHB1cnBvc2UgaXMgdG8gY2xhcmlmeSB0aGUgY29kZSBpcyBjb3Zl
cmFnZSByZWxhdGVkKGF0IGxlYXN0IGN1cnJlbnRseSAKaXMpLgoKSWYgeW91IGFyZSB1bmhhcHB5
IHdpdGggaXQgdGhpcyB3YXksIGhvdyBhYm91dCBqdXN0IGFkZCBhIGNvbW1lbnQsIApzb21ldGhp
bmcgbGlrZToKCisvKiBjdXJyZW50bHkgb25seSB1c2VkIGJ5IGNvZGUgY292ZXJhZ2UgKi8KICAg
dm9pZCBfX2luaXQgaW5pdF9jb25zdHJ1Y3RvcnModm9pZCkKCj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9saWIuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vbGliLmMKPj4+PiBAQCAtNDkxLDE1ICs0OTEs
MjAgQEAgdW5zaWduZWQgbG9uZyBsb25nIHBhcnNlX3NpemVfYW5kX3VuaXQoY29uc3QgY2hhciAq
cywgY29uc3QgY2hhciAqKnBzKQo+Pj4+ICAgICAgICByZXR1cm4gcmV0Owo+Pj4+ICAgIH0KPj4+
PiAgICAKPj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0NPVkVSQUdFKQo+Pj4+ICAgIHR5cGVkZWYg
dm9pZCAoKmN0b3JfZnVuY190KSh2b2lkKTsKPj4+PiAgICBleHRlcm4gY29uc3QgY3Rvcl9mdW5j
X3QgX19jdG9yc19zdGFydFtdLCBfX2N0b3JzX2VuZFtdOwo+Pj4+ICsjZW5kaWYKPj4+IEFnYWlu
IC0gaG93IGRvZXMgdGhpcyBoZWxwPwo+PiBXYW50IHRvIGNsYXJpZnkgdGhpcyBpcyBjb3ZlcmFn
ZSByZWxhdGVkIGNvZGUuCj4gSWYgb25seSBpdCByZWFsbHkgd2FzIChwcm92YWJseSkuCj4KPj4+
PiArLyogc2VlICdkb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QnICovCj4+
Pj4gICAgdm9pZCBfX2luaXQgaW5pdF9jb25zdHJ1Y3RvcnModm9pZCkKPj4+IFRoZXJlJ3Mgbm8g
bWVudGlvbiBvZiB0aGlzIGZ1bmN0aW9uIGluIHRoZSByZWZlcmVuY2VkIGRvY3MgZmlsZS4KPj4g
U2FtZSBhcyBhYm92ZS4KPiBOby4gVGhlIHJlZmVyZW5jZSBtYWtlcyBubyBzZW5zZSBoZXJlIHdp
dGhvdXQgdGhhdCBkb2Mgc29tZWhvdwo+IG1lbnRpb25pbmcgdGhlIGZ1bmN0aW9uIHlvdSBhdHRh
Y2ggdGhlIGNvbW1lbnQgdG8uCj4KPj4+PiAgICB7Cj4+Pj4gKyNpZiBkZWZpbmVkKENPTkZJR19D
T1ZFUkFHRSkKPj4+PiAgICAgICAgY29uc3QgY3Rvcl9mdW5jX3QgKmY7Cj4+Pj4gICAgICAgIGZv
ciAoIGYgPSBfX2N0b3JzX3N0YXJ0OyBmIDwgX19jdG9yc19lbmQ7ICsrZiApCj4+Pj4gICAgICAg
ICAgICAoKmYpKCk7Cj4+Pj4gICAgCj4+Pj4gKyNlbmRpZgo+Pj4+ICAgICAgICAvKiBQdXR0aW5n
IHRoaXMgaGVyZSBzZWVtcyBhcyBnb29kIChvciBiYWQpIGFzIGFueSBvdGhlciBwbGFjZS4gKi8K
Pj4+IEFnYWluLCBiZXNpZGVzIGxhY2tpbmcgc3VpdGFibGUgcmVhc29uaW5nIHlvdSBhbHNvIHNo
b3VsZCBsb29rCj4+PiBtb3JlIGNsb3NlbHksIGluIHRoaXMgY2FzZSB3aGVyZSBleGFjdGx5IGl0
IG1ha2VzIHNlbnNlIHRvIHBsYWNlCj4+PiB0aGUgI2VuZGlmLgo+PiBUaGUgYmxhbmsgbGluZSBo
ZXJlPyBJZiB5ZXMsIGNhbiBiZSByZW1vdmVkLiBpIG1pc3NlZCB0aGlzLgo+IFJlbW92ZWQ/IE5v
LiBJZiBhbnl0aGluZyB0aGVyZSdzIG9uZSBtaXNzaW5nLiBZb3UndmUgaW5zZXJ0ZWQKPiB0aGUg
I2lmZGVmIGFmdGVyIHRoZSBibGFuayBsaW5lIHJhdGhlciB0aGFuIGJlZm9yZSBpdC4KU29ycnkg
Zm9yIG15IGV4cHJlc3Npb24sIHdoYXQgeW91IHNhaWQgaGVyZSBpcyBleGFjdGx5IHdoYXQgaSB3
YW50Lgo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
