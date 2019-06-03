Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB6932621
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 03:30:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXbj8-0007xB-4s; Mon, 03 Jun 2019 01:25:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXbj6-0007x6-S9
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:25:28 +0000
X-Inumbo-ID: 74df0dda-859e-11e9-a84c-0fa7c27adcb5
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74df0dda-859e-11e9-a84c-0fa7c27adcb5;
 Mon, 03 Jun 2019 01:25:24 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 09:23:09 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <2e990039344a9197315c0d61aa4f31a8@sslemail.net>
 <6db51cab-7372-d55d-c0a5-481afc21e5c8@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <7016ac98-2762-152f-ec99-d3ec2d3bc685@mxnavi.com>
Date: Mon, 3 Jun 2019 09:25:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6db51cab-7372-d55d-c0a5-481afc21e5c8@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: notifier: refine 'notifier_head',
 use 'list_head' directly
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

Ck9uIDUvMzEvMTkgMTg6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE1pc3Npbmcg
Y29tbWl0IG1lc3NhZ2UgaGVyZS4KPgpZZXMsIHdpbGwgYmUgYWRkZWQuCj4gT24gNS8zMS8xOSAz
OjM1IEFNLCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hl
biA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9jb21tb24vbm90aWZp
ZXIuY8KgwqDCoMKgwqAgfCAyNSArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIHhlbi9p
bmNsdWRlL3hlbi9ub3RpZmllci5oIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL25vdGlmaWVyLmMgYi94ZW4vY29tbW9uL25vdGlmaWVyLmMK
Pj4gaW5kZXggMzQ0ODhhOC4uZjk1OWE3OSAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9ub3Rp
Zmllci5jCj4+ICsrKyBiL3hlbi9jb21tb24vbm90aWZpZXIuYwo+PiBAQCAtMjEsMTAgKzIxLDEw
IEBACj4+IMKgIHZvaWQgX19pbml0IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKAo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuKQo+
PiDCoCB7Cj4+IC3CoMKgwqAgc3RydWN0IGxpc3RfaGVhZCAqY2hhaW4gPSAmbmgtPmhlYWQuY2hh
aW47Cj4+ICvCoMKgwqAgc3RydWN0IGxpc3RfaGVhZCAqY2hhaW4gPSAmbmgtPmhlYWQ7Cj4+IMKg
wqDCoMKgwqAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYjsKPj4gwqAgLcKgwqDCoCB3aGlsZSAo
IGNoYWluLT5uZXh0ICE9ICZuaC0+aGVhZC5jaGFpbiApCj4+ICvCoMKgwqAgd2hpbGUgKCBjaGFp
bi0+bmV4dCAhPSAmbmgtPmhlYWQgKQo+PiDCoMKgwqDCoMKgIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIG5iID0gbGlzdF9lbnRyeShjaGFpbi0+bmV4dCwgc3RydWN0IG5vdGlmaWVyX2Jsb2NrLCBj
aGFpbik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIG4tPnByaW9yaXR5ID4gbmItPnByaW9y
aXR5ICkKPj4gQEAgLTM1LDE5ICszNSw2IEBAIHZvaWQgX19pbml0IG5vdGlmaWVyX2NoYWluX3Jl
Z2lzdGVyKAo+PiDCoMKgwqDCoMKgIGxpc3RfYWRkKCZuLT5jaGFpbiwgY2hhaW4pOwo+PiDCoCB9
Cj4+IMKgIC0vKioKPj4gLSAqIG5vdGlmaWVyX2NoYWluX3VucmVnaXN0ZXIgLSBSZW1vdmUgbm90
aWZpZXIgZnJvbSBhIHJhdyBub3RpZmllciAKPj4gY2hhaW4KPj4gLSAqIEBuaDogUG9pbnRlciB0
byBoZWFkIG9mIHRoZSByYXcgbm90aWZpZXIgY2hhaW4KPj4gLSAqIEBuOiBFbnRyeSB0byByZW1v
dmUgZnJvbSBub3RpZmllciBjaGFpbgo+PiAtICoKPj4gLSAqIFJlbW92ZXMgYSBub3RpZmllciBm
cm9tIGEgcmF3IG5vdGlmaWVyIGNoYWluLgo+PiAtICogQWxsIGxvY2tpbmcgbXVzdCBiZSBwcm92
aWRlZCBieSB0aGUgY2FsbGVyLgo+PiAtICovCj4+IC12b2lkIF9faW5pdCBub3RpZmllcl9jaGFp
bl91bnJlZ2lzdGVyKAo+PiAtwqDCoMKgIHN0cnVjdCBub3RpZmllcl9oZWFkICpuaCwgc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuKQo+PiAtewo+PiAtwqDCoMKgIGxpc3RfZGVsKCZuLT5jaGFpbik7
Cj4+IC19Cj4KPiBXaHkgZGlkIHlvdSBtb3ZlIHRoZSBmdW5jdGlvbj8KCk15IGZhdWx0LCBzaG91
bGQgTk9UIHRvdWNoIHRoaXMgYXQgYWxsLgoKUGF0Y2ggd2lsbCBiZSByZXNlbnQuCgo+Cj4KPiBD
aGVlcnMsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
