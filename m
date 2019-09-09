Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C7AD4BD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Etk-00028D-1R; Mon, 09 Sep 2019 08:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Eti-000287-6U
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:19:42 +0000
X-Inumbo-ID: 92389a0c-d2da-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92389a0c-d2da-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 08:19:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6AACDAC37;
 Mon,  9 Sep 2019 08:19:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a0b2a0c-28af-cd70-e193-309228dc58da@suse.com>
Date: Mon, 9 Sep 2019 10:19:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909073557.16168-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/5] xen: add debugtrace entry when entry
 count is wrapping
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwOTozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTczLDEwICsx
NzcsMjMgQEAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKPiAg
ICAgIG5yID0gdnNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksIGZtdCwgYXJncyk7Cj4gICAgICB2
YV9lbmQoYXJncyk7Cj4gIAo+ICsgICAgaWYgKCBjb3VudCA9PSBERUJVR1RSQUNFX0NPVU5UX1dS
QVAgKQo+ICsgICAgewo+ICsgICAgICAgIGNvdW50ID0gMDsKPiArICAgICAgICB3cmFwX2NudCsr
Owo+ICsgICAgfQo+ICsKPiAgICAgIGlmICggZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGUgKQo+
ICAgICAgewo+IC0gICAgICAgIHVuc2lnbmVkIGludCBuID0gc2NucHJpbnRmKGNudGJ1Ziwgc2l6
ZW9mKGNudGJ1ZiksICIldSAiLCArK2NvdW50KTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgbjsK
PiArCj4gKyAgICAgICAgaWYgKCBjb3VudCA9PSAwICkKPiArICAgICAgICB7Cj4gKyAgICAgICAg
ICAgIG4gPSBzY25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIndyYXA6ICVsdVxuIiwg
d3JhcF9jbnQpOwo+ICsgICAgICAgICAgICBjb25zb2xlX3NlcmlhbF9wdXRzKGNudGJ1Ziwgbik7
Cj4gKyAgICAgICAgfQo+ICAKPiArICAgICAgICBuID0gc2NucHJpbnRmKGNudGJ1Ziwgc2l6ZW9m
KGNudGJ1ZiksICIldSAiLCArK2NvdW50KTsKPiAgICAgICAgICBjb25zb2xlX3NlcmlhbF9wdXRz
KGNudGJ1Ziwgbik7Cj4gICAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0cyhidWYsIG5yKTsKPiAg
ICAgIH0KCkp1c3Qgb25lIG1pbm9yIHJlbWFyazogSW4gdGhpcyBjYXNlIHlvdSBpc3N1ZSBhICJ3
cmFwIiBtZXNzYWdlIGF0CnN0YXJ0IG9mIGRheSwgLi4uCgo+IEBAIC0xODQsOCArMjAxLDE2IEBA
IHZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4gICAgICB7Cj4g
ICAgICAgICAgdW5zaWduZWQgaW50IGNwdSA9IGRlYnVndHJhY2VfcGVyX2NwdSA/IHNtcF9wcm9j
ZXNzb3JfaWQoKSA6IDA7Cj4gIAo+IC0gICAgICAgIGlmICggZGVidWd0cmFjZV9idWZfZW1wdHkg
fHwgc3RyY21wKGJ1ZiwgbGFzdF9idWYpICkKPiArICAgICAgICBpZiAoIGRlYnVndHJhY2VfYnVm
X2VtcHR5IHx8IHdyYXBfY250ICE9IGRhdGEtPndyYXBfY250IHx8Cj4gKyAgICAgICAgICAgICBz
dHJjbXAoYnVmLCBsYXN0X2J1ZikgKQo+ICAgICAgICAgIHsKPiArICAgICAgICAgICAgaWYgKCB3
cmFwX2NudCAhPSBkYXRhLT53cmFwX2NudCApCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAg
ICAgICAgIHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICJ3cmFwOiAlbHUtPiVsdVxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPndyYXBfY250LCB3cmFwX2NudCk7
Cj4gKyAgICAgICAgICAgICAgICBkZWJ1Z3RyYWNlX2FkZF90b19idWYoY250YnVmKTsKPiArICAg
ICAgICAgICAgICAgIGRhdGEtPndyYXBfY250ID0gd3JhcF9jbnQ7Cj4gKyAgICAgICAgICAgIH0K
PiAgICAgICAgICAgICAgZGVidWd0cmFjZV9idWZfZW1wdHkgPSBmYWxzZTsKPiAgICAgICAgICAg
ICAgbGFzdF9wcmQgPSBkYXRhLT5wcmQ7Cj4gICAgICAgICAgICAgIGxhc3RfY291bnQgPSArK2Nv
dW50OwoKLi4uIHdoZXJlYXMgaGVyZSBvbmUgZ2V0cyBpc3N1ZWQgKGFzIEknZCBleHBlY3QgaXQp
IG9ubHkgYWZ0ZXIgdGhlCmZpcnN0IHdyYXBwaW5nIG9mICJjb3VudCIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
