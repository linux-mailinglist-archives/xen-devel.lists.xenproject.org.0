Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC971113E05
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:34:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnUl-0000Xp-V5; Thu, 05 Dec 2019 09:32:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnUk-0000Xk-6Z
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:32:22 +0000
X-Inumbo-ID: 227cc510-1742-11ea-8219-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 227cc510-1742-11ea-8219-12813bfff9fa;
 Thu, 05 Dec 2019 09:32:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D903B170;
 Thu,  5 Dec 2019 09:32:19 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4f32391-894b-a781-ad54-39d53d3bf728@suse.com>
Date: Thu, 5 Dec 2019 10:32:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204162025.37510-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/apic: force phys mode if
 interrupt remapping is disabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENsdXN0ZXIgbW9k
ZSBjYW4gb25seSBiZSB1c2VkIHdpdGggaW50ZXJydXB0IHJlbWFwcGluZyBzdXBwb3J0LCBzaW5j
ZQo+IHRoZSB0b3AgMTZiaXRzIG9mIHRoZSBBUElDIElEIGFyZSBmaWxsZWQgd2l0aCB0aGUgY2x1
c3RlciBJRCwgYW5kCj4gaGVuY2Ugb24gc3lzdGVtcyB3aGVyZSB0aGUgcGh5c2ljYWwgSUQgaXMg
c3RpbGwgc21hbGxlciB0aGFuIDI1NSB0aGUKPiBjbHVzdGVyIElEIGlzIG5vdC4gRm9yY2UgeDJB
UElDIHRvIHVzZSBwaHlzaWNhbCBtb2RlIGlmIHRoZXJlJ3Mgbm8KPiBpbnRlcnJ1cHQgcmVtYXBw
aW5nIHN1cHBvcnQuCj4gCj4gTm90ZSB0aGF0IHRoaXMgcmVxdWlyZXMgYSBmdXJ0aGVyIHBhdGNo
IGluIG9yZGVyIHRvIGVuYWJsZSB4MkFQSUMKPiB3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmcg
c3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CmFsYmVpdCAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvZ2VuYXBpYy94MmFwaWMuYwo+IEBAIC0yMjYsNyArMjI2LDIzIEBAIGJv
b2xlYW5fcGFyYW0oIngyYXBpY19waHlzIiwgeDJhcGljX3BoeXMpOwo+ICBjb25zdCBzdHJ1Y3Qg
Z2VuYXBpYyAqX19pbml0IGFwaWNfeDJhcGljX3Byb2JlKHZvaWQpCj4gIHsKPiAgICAgIGlmICgg
eDJhcGljX3BoeXMgPCAwICkKPiAtICAgICAgICB4MmFwaWNfcGh5cyA9ICEhKGFjcGlfZ2JsX0ZB
RFQuZmxhZ3MgJiBBQ1BJX0ZBRFRfQVBJQ19QSFlTSUNBTCk7Cj4gKyAgICB7Cj4gKyAgICAgICAg
aWYgKCAhaW9tbXVfaW50cmVtYXAgKQo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAg
KiBGb3JjZSBwaHlzaWNhbCBtb2RlIGlmIHRoZXJlJ3Mgbm8gaW50ZXJydXB0IHJlbWFwcGluZyBz
dXBwb3J0Ogo+ICsgICAgICAgICAgICAgKiB0aGUgSUQgaW4gY2x1c3RlcmVkIG1vZGUgcmVxdWly
ZXMgYSAzMiBiaXQgZGVzdGluYXRpb24gZmllbGQgZHVlCj4gKyAgICAgICAgICAgICAqIHRvIHRo
ZSB1c2FnZSBvZiB0aGUgaGlnaCAxNiBiaXRzIHRvIHN0b3JlIHRoZSBjbHVzdGVyIElELgo+ICsg
ICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgeDJhcGljX3BoeXMgPSB0cnVlOwo+ICsgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgeDJhcGljX3BoeXMgPSAhIShhY3BpX2dibF9GQURULmZs
YWdzICYgQUNQSV9GQURUX0FQSUNfUEhZU0lDQUwpOwoKLi4uIEkgd29uZGVyIHdoeSB5b3UgZGlk
bid0IG1ha2UgdGhpcwoKICAgICAgICB4MmFwaWNfcGh5cyA9ICFpb21tdV9pbnRyZW1hcCB8fCAo
YWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FMKTsKCihub3QgdGhl
IGxlYXN0IGJlY2F1c2Ugb2YgYWxsb3dpbmcgdG8gZHJvcCB0aGUgc29tZXdoYXQgdWdseSAhISku
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
