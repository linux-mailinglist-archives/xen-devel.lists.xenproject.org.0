Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2532E26
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 13:03:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXkhJ-0003Ch-93; Mon, 03 Jun 2019 11:00:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXkhH-0003Cc-2G
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 11:00:11 +0000
X-Inumbo-ID: bf5710ec-85ee-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf5710ec-85ee-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 11:00:08 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 18:57:55 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <d7e6554e6990789d1b619b6d489f52b7@sslemail.net>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
 <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
 <10daba8f-d14a-f1f4-a0cd-d18349263ace@arm.com>
 <ce2a0eea-ac01-4b96-b41a-802bb60f3d8d@mxnavi.com>
 <e76f6eef-82f6-668f-6413-e872cd3936d5@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <8ca96378-5531-9987-3d98-1787dd3310b2@mxnavi.com>
Date: Mon, 3 Jun 2019 19:00:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e76f6eef-82f6-668f-6413-e872cd3936d5@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
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

Ck9uIDYvMy8xOSAxODo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMDMvMDYv
MjAxOSAxMToyMiwgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4+Cj4+IE9uIDYvMy8xOSAxNzozNywgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMDMvMDYvMjAxOSAwMjo1MiwgY2hl
bmJhb2Rvbmcgd3JvdGU6Cj4+Pj4KPj4+PiBPbiA1LzMxLzE5IDE4OjU1LCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBPbiA1LzMxLzE5IDM6NDYgQU0sIEJhb2Rvbmcg
Q2hlbiB3cm90ZToKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2Rv
bmdAbXhuYXZpLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgeGVuL2NvbW1vbi9jcHUuY8KgwqDC
oMKgwqAgfCAxMCAtLS0tLS0tLS0tCj4+Pj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vY3B1LmggfMKg
IDQgKystLQo+Pj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIv
eGVuL2NvbW1vbi9jcHUuYwo+Pj4+Pj4gaW5kZXggZjM4OGQ4OS4uYTUyNmI1NSAxMDA2NDQKPj4+
Pj4+IC0tLSBhL3hlbi9jb21tb24vY3B1LmMKPj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vY3B1LmMK
Pj4+Pj4+IEBAIC01MSwxNiArNTEsNiBAQCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQo+Pj4+Pj4g
wqDCoMKgwqDCoCBzcGluX3VubG9ja19yZWN1cnNpdmUoJmNwdV9hZGRfcmVtb3ZlX2xvY2spOwo+
Pj4+Pj4gwqAgfQo+Pj4+Pj4gwqAgLWJvb2xfdCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKQo+Pj4+
Pj4gLXsKPj4+Pj4+IC3CoMKgwqAgcmV0dXJuIGdldF9jcHVfbWFwcygpOwo+Pj4+Pj4gLX0KPj4+
Pj4+IC0KPj4+Pj4+IC12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkKPj4+Pj4+IC17Cj4+Pj4+
PiAtwqDCoMKgIHB1dF9jcHVfbWFwcygpOwo+Pj4+Pj4gLX0KPj4+Pj4+IC0KPj4+Pj4+IMKgIHN0
YXRpYyBOT1RJRklFUl9IRUFEKGNwdV9jaGFpbik7Cj4+Pj4+PiDCoCDCoCB2b2lkIF9faW5pdCBy
ZWdpc3Rlcl9jcHVfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYikKPj4+Pj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1LmggYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgK
Pj4+Pj4+IGluZGV4IDQ2MzhjNTAuLjcwYTJkZjQgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vY3B1LmgKPj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaAo+Pj4+Pj4g
QEAgLTEwLDggKzEwLDggQEAgYm9vbF90IGdldF9jcHVfbWFwcyh2b2lkKTsKPj4+Pj4+IMKgIHZv
aWQgcHV0X2NwdV9tYXBzKHZvaWQpOwo+Pj4+Pj4gwqAgwqAgLyogU2FmZWx5IHBlcmZvcm0gQ1BV
IGhvdHBsdWcgYW5kIHVwZGF0ZSBjcHVfb25saW5lX21hcCwgZXRjLiAqLwo+Pj4+Pj4gLWJvb2xf
dCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKTsKPj4+Pj4+IC12b2lkIGNwdV9ob3RwbHVnX2RvbmUo
dm9pZCk7Cj4+Pj4+PiArc3RhdGljIGlubGluZSBib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9p
ZCkgeyByZXR1cm4gCj4+Pj4+PiBnZXRfY3B1X21hcHMoKTsgfQo+Pj4+Pj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpIHsgcHV0X2NwdV9tYXBzKCk7IH0KPj4+Pj4K
Pj4+Pj4gVGhlIGNvZGluZyBzdHlsZSBzaG91bGQgYmU6Cj4+Pj4+Cj4+Pj4+IHN0YXRpYyBpbmxp
bmUuLi4uCj4+Pj4+IHsKPj4+Pj4gwqDCoMKgwqDCoCAuLi4KPj4+Pj4gfQo+Pj4+Pgo+Pj4+IFll
cywgY2xhbmctZm9ybWF0IGF1dG9tYXRlZCBmb3JtYXQgY29kZSBmb3IgbWUsIHdpbGwgYmUgZml4
ZWQuCj4+Pgo+Pj4gSG1tbSwgY2xhbmctZm9ybWF0IGRvZXMgbm90IGhhdmUgWGVuIGNvZGluZyBz
dHlsZSBzdXBwb3J0IHlldC4gRG8gCj4+PiB5b3UgaGF2ZSBwYXRjaGVzIG9uIHRvcCB0byBoYW5k
bGUgaXQ/Cj4+Cj4+IE5vLCBCdXQgdGhlIGxpbnV4IGtlcm5lbCBzZWVtcyBhbHJlYWR5IGhhdmUg
aXQncyBjbGFuZy1mb3JtYXQgCj4+IHN1cHBvcnQuIEd1ZXNzIGNhbiB1c2VkIGJ5IHhlbi4KPgo+
IE1vc3Qgb2YgWGVuIGNvZGUgYmFzZSBkb2VzIG5vdCB1c2UgTGludXggY29kaW5nIHN0eWxlLiBU
aGUgb25seSAKPiBleGNlcHRpb24gaXMgZmlsZSBpbXBvcnRlZCBkaXJlY3RseSBmcm9tIExpbnV4
IHRvIGVhc2UgcG9ydGluZyBidWcgZml4ZXMuCgpSb2dlciB0aGF0LgoKCj4KPj4KPj4gSU1PwqAg
aSBkb24ndCBsaWtlIHRoZSBjb2Rpbmcgc3R5bGUgaW4geGVuIHBlcnNvbmFsbHkuCj4KPiBJIGRv
bid0IG5lY2Vzc2FyaWx5IGFncmVlIHdpdGggYWxsIG9mIGl0IGJ1dCBzb21lIG9mIHRoZSBMaW51
eCBzdHlsZSAKPiBhcmUgb2RkIHRvby4KeWVzIHllcyzCoCBMaW51eCBzdHlsZSwgZWc6ICd0YWIn
LCBpIGFsc28gZGlzbGlrZS4KPgo+Pgo+PiBCdXQgaXQncyBjb2RlIGJhc2UgaGFzIGxvbmcgeWVh
cnMgaGlzdG9yeS4gY2FuIGluc2lzdCBvbiB0aGlzIG9yIG1ha2UgCj4+IHNvbWUgY2hhbmdlcy4K
Pgo+IEltcHJvdmVtZW50IHRvIHRoZSBjb2Rpbmcgc3R5bGUgYXJlIGFsd2F5cyB3ZWxjb21lZC4g
QWx0aG91Z2gsIHlvdSAKPiB3aWxsIG5vdGljZSB0aGF0IGFueXRoaW5nIGFyb3VuZCBjb2Rpbmcg
c3R5bGUgKGluIGFueSBwcm9qZWN0KSBpcyBhIAo+IG1hdHRlciBvZiB0YXN0ZSBhbmQgY2FuIGJl
IGRpZmZpY3VsdCB0byBmaW5kIGFuIGFncmVlbWVudC4KCkFncmVlLgoKPgo+Pgo+PiBJIHByZWZl
ciBjbGFuZy1mb3JtYXQgcGVyc29uYWxseSzCoCBiZWNhdXNlIG5vIHN0eWxlIGlzc3VlIGluIHBh
dGNoIAo+PiBhbmQgd2lsbCBtYWtlIHJldmlldyBlYXNpZXIuCj4KPiBjbGFuZy1mb3JtYXQgaXMg
bm90IGEgY29kaW5nIHN0eWxlLiBJdCBpcyBhIHRvb2wgaGVscGluZyB0byBmb3JtYXQgaW4gCj4g
YSBzcGVjaWZpYyBjb2Rpbmcgc3R5bGUuIFRoZXJlIGFyZSBlZmZvcnQgdG8gZXh0ZW5kIGNsYW5n
LWZvcm1hdCBmb3IgCj4gc3VwcG9ydGluZyBYZW4gY29kaW5nIHN0eWxlLgoKQWdyZWUsIEZvciB4
ZW4sIGl0J3Mgd29ydGggdG8gaGF2ZSBpdCdzICcuY2xhbmctZm9ybWF0JyBmaWxlIGFjY29yZGlu
ZyAKdG8gaXQncyBzdHlsZS4KCj4KPiBDaGVlcnMsCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
