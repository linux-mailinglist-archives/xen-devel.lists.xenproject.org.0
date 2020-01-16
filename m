Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AF13DFE2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:21:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7r8-0001dj-1D; Thu, 16 Jan 2020 16:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7r6-0001db-Hv
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:18:48 +0000
X-Inumbo-ID: d9bb1422-387b-11ea-8775-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9bb1422-387b-11ea-8775-12813bfff9fa;
 Thu, 16 Jan 2020 16:18:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E00BFB2AA2;
 Thu, 16 Jan 2020 16:18:36 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <4e285f09f6c68deccf009b16c86898a78e349997.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0ceeb51-62ca-9d03-1caa-b258182991ec@suse.com>
Date: Thu, 16 Jan 2020 17:18:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4e285f09f6c68deccf009b16c86898a78e349997.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 12/18] x86/mem_sharing: Enable
 mem_sharing on first memop
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEl0IGlzIHdhc3Rl
ZnVsIHRvIHJlcXVpcmUgc2VwYXJhdGUgaHlwZXJjYWxscyB0byBlbmFibGUgc2hhcmluZyBvbiBi
b3RoIHRoZQo+IHBhcmVudCBhbmQgdGhlIGNsaWVudCBkb21haW4gZHVyaW5nIFZNIGZvcmtpbmcu
IFRvIHNwZWVkIHRoaW5ncyB1cCB3ZSBlbmFibGUKPiBzaGFyaW5nIG9uIHRoZSBmaXJzdCBtZW1v
cCBpbiBjYXNlIGl0IHdhc24ndCBhbHJlYWR5IGVuYWJsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPiAtLS0KPiAgeGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBpbmRleCAzZjM2Y2Q2YmJjLi5iOGE5MjI4ZWNm
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gKysrIGIveGVu
L2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBAQCAtMTQxMiw2ICsxNDEyLDI0IEBAIHN0YXRp
YyBpbnQgcmFuZ2Vfc2hhcmUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QsCj4g
ICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgaW50IG1lbV9zaGFyaW5n
X2NvbnRyb2woc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBlbmFibGUpCj4gK3sKPiArICAgIGlmICgg
ZW5hYmxlICkKPiArICAgIHsKPiArICAgICAgICBpZiAoIHVubGlrZWx5KCFpc19odm1fZG9tYWlu
KGQpKSApCj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PU1lTOwoKLUVPUE5PVFNVUFAgb3Igc29t
ZSBzdWNoIHBsZWFzZS4gRU5PU1lTIGhhcyBhIHZlcnkgc3BlY2lmaWMgbWVhbmluZywKd2hpY2gg
KGFjY29yZGluZyB0byBteSB1bmRlcnN0YW5kaW5nKSBkb2Vzbid0IGFwcGx5IGhlcmUuCgo+ICsg
ICAgICAgIGlmICggdW5saWtlbHkoIWhhcF9lbmFibGVkKGQpKSApCj4gKyAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWOwoKRG9lc24ndCB0aGlzIGFsbG93IGRyb3BwaW5nIHRoZSBIQVAgY2hlY2sg
ZnJvbQptZW1fc2hhcmluZ19lbmFibGVkKGQpPwoKPiArICAgICAgICBpZiAoIHVubGlrZWx5KGlz
X2lvbW11X2VuYWJsZWQoZCkpICkKPiArICAgICAgICAgICAgcmV0dXJuIC1FWERFVjsKPiArICAg
IH0KPiArCj4gKyAgICBkLT5hcmNoLmh2bS5tZW1fc2hhcmluZy5lbmFibGVkID0gZW5hYmxlOwo+
ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9tZW1fc2hhcmluZ19vcF90KSBhcmcpCj4gIHsKPiAgICAgIGlu
dCByYzsKPiBAQCAtMTQzMywxMCArMTQ1MSw4IEBAIGludCBtZW1fc2hhcmluZ19tZW1vcChYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1fc2hhcmluZ19vcF90KSBhcmcpCj4gICAgICBpZiAo
IHJjICkKPiAgICAgICAgICBnb3RvIG91dDsKPiAgCj4gLSAgICAvKiBPbmx5IEhBUCBpcyBzdXBw
b3J0ZWQgKi8KPiAtICAgIHJjID0gLUVOT0RFVjsKPiAtICAgIGlmICggIW1lbV9zaGFyaW5nX2Vu
YWJsZWQoZCkgKQo+IC0gICAgICAgIGdvdG8gb3V0Owo+ICsgICAgaWYgKCAhbWVtX3NoYXJpbmdf
ZW5hYmxlZChkKSAmJiAocmMgPSBtZW1fc2hhcmluZ19jb250cm9sKGQsIHRydWUpKSApCj4gKyAg
ICAgICAgcmV0dXJuIHJjOwoKUGVyaGFwcyBhbHJlYWR5IGluIHBhdGNoIDYsIGRvZXNuJ3QgdGhp
cyBlbGltaW5hdGUgdGhlIG5lZWQgZm9yIHRoZQppbmRpdmlkdWFsIG1lbV9zaGFyaW5nX2VuYWJs
ZWQoKSBjaGVja3MgaW4gdGhlIGNhc2UgYmxvY2tzPwoKPiBAQCAtMTcwMywxOCArMTcxOSwxMCBA
QCBpbnQgbWVtX3NoYXJpbmdfZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9t
Y3RsX21lbV9zaGFyaW5nX29wICptZWMpCj4gIHsKPiAgICAgIGludCByYzsKPiAgCj4gLSAgICAv
KiBPbmx5IEhBUCBpcyBzdXBwb3J0ZWQgKi8KPiAtICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkK
PiAtICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiAtCj4gLSAgICBzd2l0Y2ggKCBtZWMtPm9wICkK
PiArICAgIHN3aXRjaCggbWVjLT5vcCApCgpQbGVhc2UgZG9uJ3QgY29ycnVwdCBwcm9wZXIgWGVu
IHN0eWxlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
