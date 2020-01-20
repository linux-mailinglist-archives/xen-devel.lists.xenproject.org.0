Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E7143026
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:44:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ita75-0008Gc-OC; Mon, 20 Jan 2020 16:41:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ita73-0008GS-J0
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:41:17 +0000
X-Inumbo-ID: aaf1c398-3ba3-11ea-b99e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaf1c398-3ba3-11ea-b99e-12813bfff9fa;
 Mon, 20 Jan 2020 16:41:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C18D0AD45;
 Mon, 20 Jan 2020 16:41:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
 <20200120160732.GC11756@Air-de-Roger>
 <a3b70e5b-d017-c934-ea84-46e3d653905f@suse.com>
 <20200120163727.GD11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <53c44379-50a6-4a82-62b3-69029375b6ea@suse.com>
Date: Mon, 20 Jan 2020 17:41:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120163727.GD11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 KevinTian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxNzozNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEph
biAyMCwgMjAyMCBhdCAwNToxNToyMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjAuMDEuMjAyMCAxNzowNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+PiBPbiBNb24sIEph
biAyMCwgMjAyMCBhdCAwNDo0MjoyMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+Pj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4+Pj4gQEAgLTE0OTMsMTggKzE0OTMsMjgg
QEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0cnVjdAo+Pj4+ICAgICAgICAg
IGlmICggZmluZF91cHN0cmVhbV9icmlkZ2Uoc2VnLCAmYnVzLCAmZGV2Zm4sICZzZWNidXMpIDwg
MSApCj4+Pj4gICAgICAgICAgICAgIGJyZWFrOwo+Pj4+ICAKPj4+PiArICAgICAgICAvKgo+Pj4+
ICsgICAgICAgICAqIE1hcHBpbmcgYSBicmlkZ2Ugc2hvdWxkLCBpZiBhbnl0aGluZywgcGFzcyB0
aGUgc3RydWN0IHBjaV9kZXYgb2YKPj4+PiArICAgICAgICAgKiB0aGF0IGJyaWRnZS4gU2luY2Ug
YnJpZGdlcyBkb24ndCBub3JtYWxseSBnZXQgYXNzaWduZWQgdG8gZ3Vlc3RzLAo+Pj4+ICsgICAg
ICAgICAqIHRoZWlyIG93bmVyIHdvdWxkIGJlIHRoZSB3cm9uZyBvbmUuIFBhc3MgTlVMTCBpbnN0
ZWFkLgo+Pj4+ICsgICAgICAgICAqLwo+Pj4+ICAgICAgICAgIHJldCA9IGRvbWFpbl9jb250ZXh0
X21hcHBpbmdfb25lKGRvbWFpbiwgZHJoZC0+aW9tbXUsIGJ1cywgZGV2Zm4sCj4+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF9wZGV2KHNlZywgYnVz
LCBkZXZmbikpOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5VTEwpOwo+Pj4+ICAKPj4+PiAgICAgICAgICAvKgo+Pj4+ICAgICAgICAgICAqIERldmljZXMg
YmVoaW5kIFBDSWUtdG8tUENJL1BDSXggYnJpZGdlIG1heSBnZW5lcmF0ZSBkaWZmZXJlbnQKPj4+
PiAgICAgICAgICAgKiByZXF1ZXN0ZXItaWQuIEl0IG1heSBvcmlnaW5hdGUgZnJvbSBkZXZmbj0w
IG9uIHRoZSBzZWNvbmRhcnkgYnVzCj4+Pj4gICAgICAgICAgICogYmVoaW5kIHRoZSBicmlkZ2Uu
IE1hcCB0aGF0IGlkIGFzIHdlbGwgaWYgd2UgZGlkbid0IGFscmVhZHkuCj4+Pj4gKyAgICAgICAg
ICoKPj4+PiArICAgICAgICAgKiBTb21ld2hhdCBzaW1pbGFyIGFzIGZvciBicmlkZ2VzLCB3ZSBk
b24ndCB3YW50IHRvIHBhc3MgYSBzdHJ1Y3QKPj4+PiArICAgICAgICAgKiBwY2lfZGV2IGhlcmUg
LSB0aGVyZSBtYXkgbm90IGV2ZW4gZXhpc3Qgb25lIGZvciB0aGlzIChzZWNidXMsMCwwKQo+Pj4+
ICsgICAgICAgICAqIHR1cGxlLiBJZiB0aGVyZSBpcyBvbmUsIHdpdGhvdXQgcHJvcGVybHkgd29y
a2luZyBkZXZpY2UgZ3JvdXBzIGl0Cj4+Pj4gKyAgICAgICAgICogbWF5IGFnYWluIG5vdCBoYXZl
IHRoZSBjb3JyZWN0IG93bmVyLgo+Pj4+ICAgICAgICAgICAqLwo+Pj4+ICAgICAgICAgIGlmICgg
IXJldCAmJiBwZGV2X3R5cGUoc2VnLCBidXMsIGRldmZuKSA9PSBERVZfVFlQRV9QQ0llMlBDSV9C
UklER0UgJiYKPj4+PiAgICAgICAgICAgICAgIChzZWNidXMgIT0gcGRldi0+YnVzIHx8IHBkZXYt
PmRldmZuICE9IDApICkKPj4+PiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfbWFw
cGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgc2VjYnVzLCAwLAo+Pj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBzZWNi
dXMsIDApKTsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCk7Cj4+Pgo+Pj4gSXNuJ3QgaXQgZGFuZ2Vyb3VzIHRvIG1hcCB0aGlzIGRldmljZSB0
byB0aGUgZ3Vlc3QsIGFuZCB0aGF0IG11bHRpcGxlCj4+PiBndWVzdHMgbWlnaHQgZW5kIHVwIHdp
dGggdGhlIHNhbWUgZGV2aWNlIG1hcHBlZD8KPj4KPj4gVGhleSB3b24ndCAoYWZhaWN0KSAtIHNl
ZSB0aGUgY2hlY2tpbmcgZG9uZSBieSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZSgpCj4+IHdo
ZW4gaXQgZmluZHMgYW4gYWxyZWFkeSBwcmVzZW50IGNvbnRleHQgZW50cnkuIFRoZSBmaXJzdCBv
bmUgdG8gbWFrZSBzdWNoCj4+IGEgbWFwcGluZyB3aWxsIHdpbi4KPiAKPiBSaWdodCwgdGhhbmtz
LCBJIGZpbmQgYWxsIHRoaXMgY29kZSBxdWl0ZSBjb25mdXNpbmcuIElmIHRoZSBpb21tdQo+IGNv
bnRleHQgaXMgYXNzaWduZWQgdG8gYSBkb21haW4sIHdvbid0IGl0IG1ha2Ugc2Vuc2UgdG8ga2Vl
cCB0aGUKPiBkZXZpY2UgaW4gc3luYyBhbmQgYWxzbyBhc3NpZ24gaXQgdG8gdGhhdCBkb21haW4/
Cj4gCj4gU28gdGhhdCB0aGUgb3duZXIgaW4gdGhlIGlvbW11IGNvbnRleHQgbWF0Y2hlcyB0aGUg
b3duZXIgb24gdGhlCj4gcGNpX2RldiBzdHJ1Y3QuCgpGb3IgYnJpZGdlcyAtIG5vLCBJIGRvbid0
IHRoaW5rIHNvLiBGb3IgdGhlc2UgImZha2UiIChwb3NzaWJseSBwaGFudG9tLApwb3NzaWJseSBy
ZWFsKSBkZXZpY2VzIGF0IChzZWNidXMsMCwwKSBJIGRvbid0IGtub3cgZm9yIHN1cmUsIGJ1dCAt
IGFzCnRoZSBjb21tZW50IEknbSBhZGRpbmcgc2F5cyAtIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUg
dGFrZW4gY2FyZSBvZiB3aGVuCndlIGdhaW4gcHJvcGVybHkgd29ya2luZyBkZXZpY2UgZ3JvdXBz
IChhdCB3aGljaCBwb2ludCBpZiB0aGlzICJmYWtlIgpkZXZpY2UgaXMgYWN0dWFsbHkgYSByZWFs
IG9uZSwgaXQgc2hvdWxkIGJlIHB1dCBpbnRvIHRoZSBzYW1lIGdyb3VwKS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
