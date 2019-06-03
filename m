Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95C32DAD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:26:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXk78-0007vj-2F; Mon, 03 Jun 2019 10:22:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXk76-0007ve-Iq
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:22:48 +0000
X-Inumbo-ID: 7ea35182-85e9-11e9-a4d3-fb8589ad0e92
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea35182-85e9-11e9-a4d3-fb8589ad0e92;
 Mon, 03 Jun 2019 10:22:42 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 18:20:18 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <d7e6554e6990789d1b619b6d489f52b7@sslemail.net>
 <33f34cf9-2b67-baa9-8b3c-98fa08e70ddd@arm.com>
 <676cd57f-99b6-22a5-c008-cf707448f5ba@mxnavi.com>
 <10daba8f-d14a-f1f4-a0cd-d18349263ace@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <ce2a0eea-ac01-4b96-b41a-802bb60f3d8d@mxnavi.com>
Date: Mon, 3 Jun 2019 18:22:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <10daba8f-d14a-f1f4-a0cd-d18349263ace@arm.com>
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

Ck9uIDYvMy8xOSAxNzozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMDMvMDYv
MjAxOSAwMjo1MiwgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4+Cj4+IE9uIDUvMzEvMTkgMTg6NTUsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDUvMzEvMTkgMzo0NiBBTSwgQmFv
ZG9uZyBDaGVuIHdyb3RlOgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJh
b2RvbmdAbXhuYXZpLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCB4ZW4vY29tbW9uL2NwdS5jwqDCoMKg
wqDCoCB8IDEwIC0tLS0tLS0tLS0KPj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vY3B1LmggfMKgIDQg
KystLQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2NvbW1v
bi9jcHUuYwo+Pj4+IGluZGV4IGYzODhkODkuLmE1MjZiNTUgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVu
L2NvbW1vbi9jcHUuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vY3B1LmMKPj4+PiBAQCAtNTEsMTYg
KzUxLDYgQEAgdm9pZCBwdXRfY3B1X21hcHModm9pZCkKPj4+PiDCoMKgwqDCoMKgIHNwaW5fdW5s
b2NrX3JlY3Vyc2l2ZSgmY3B1X2FkZF9yZW1vdmVfbG9jayk7Cj4+Pj4gwqAgfQo+Pj4+IMKgIC1i
b29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkKPj4+PiAtewo+Pj4+IC3CoMKgwqAgcmV0dXJu
IGdldF9jcHVfbWFwcygpOwo+Pj4+IC19Cj4+Pj4gLQo+Pj4+IC12b2lkIGNwdV9ob3RwbHVnX2Rv
bmUodm9pZCkKPj4+PiAtewo+Pj4+IC3CoMKgwqAgcHV0X2NwdV9tYXBzKCk7Cj4+Pj4gLX0KPj4+
PiAtCj4+Pj4gwqAgc3RhdGljIE5PVElGSUVSX0hFQUQoY3B1X2NoYWluKTsKPj4+PiDCoCDCoCB2
b2lkIF9faW5pdCByZWdpc3Rlcl9jcHVfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpu
YikKPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2NwdS5oIGIveGVuL2luY2x1ZGUv
eGVuL2NwdS5oCj4+Pj4gaW5kZXggNDYzOGM1MC4uNzBhMmRmNCAxMDA2NDQKPj4+PiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vY3B1LmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgKPj4+
PiBAQCAtMTAsOCArMTAsOCBAQCBib29sX3QgZ2V0X2NwdV9tYXBzKHZvaWQpOwo+Pj4+IMKgIHZv
aWQgcHV0X2NwdV9tYXBzKHZvaWQpOwo+Pj4+IMKgIMKgIC8qIFNhZmVseSBwZXJmb3JtIENQVSBo
b3RwbHVnIGFuZCB1cGRhdGUgY3B1X29ubGluZV9tYXAsIGV0Yy4gKi8KPj4+PiAtYm9vbF90IGNw
dV9ob3RwbHVnX2JlZ2luKHZvaWQpOwo+Pj4+IC12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCk7
Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpIHsgcmV0
dXJuIAo+Pj4+IGdldF9jcHVfbWFwcygpOyB9Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjcHVf
aG90cGx1Z19kb25lKHZvaWQpIHsgcHV0X2NwdV9tYXBzKCk7IH0KPj4+Cj4+PiBUaGUgY29kaW5n
IHN0eWxlIHNob3VsZCBiZToKPj4+Cj4+PiBzdGF0aWMgaW5saW5lLi4uLgo+Pj4gewo+Pj4gwqDC
oMKgwqDCoCAuLi4KPj4+IH0KPj4+Cj4+IFllcywgY2xhbmctZm9ybWF0IGF1dG9tYXRlZCBmb3Jt
YXQgY29kZSBmb3IgbWUsIHdpbGwgYmUgZml4ZWQuCj4KPiBIbW1tLCBjbGFuZy1mb3JtYXQgZG9l
cyBub3QgaGF2ZSBYZW4gY29kaW5nIHN0eWxlIHN1cHBvcnQgeWV0LiBEbyB5b3UgCj4gaGF2ZSBw
YXRjaGVzIG9uIHRvcCB0byBoYW5kbGUgaXQ/CgpObywgQnV0IHRoZSBsaW51eCBrZXJuZWwgc2Vl
bXMgYWxyZWFkeSBoYXZlIGl0J3MgY2xhbmctZm9ybWF0IHN1cHBvcnQuIApHdWVzcyBjYW4gdXNl
ZCBieSB4ZW4uCgpJTU/CoCBpIGRvbid0IGxpa2UgdGhlIGNvZGluZyBzdHlsZSBpbiB4ZW4gcGVy
c29uYWxseS4KCkJ1dCBpdCdzIGNvZGUgYmFzZSBoYXMgbG9uZyB5ZWFycyBoaXN0b3J5LiBjYW4g
aW5zaXN0IG9uIHRoaXMgb3IgbWFrZSAKc29tZSBjaGFuZ2VzLgoKSSBwcmVmZXIgY2xhbmctZm9y
bWF0IHBlcnNvbmFsbHkswqAgYmVjYXVzZSBubyBzdHlsZSBpc3N1ZSBpbiBwYXRjaCBhbmQgCndp
bGwgbWFrZSByZXZpZXcgZWFzaWVyLgoKPgo+IENoZWVycywKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
