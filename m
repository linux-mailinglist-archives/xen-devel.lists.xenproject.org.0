Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D48A859B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WDb-0000rZ-4X; Wed, 04 Sep 2019 14:25:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5WDZ-0000rH-FZ
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:25:05 +0000
X-Inumbo-ID: c940d3ac-cf1f-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c940d3ac-cf1f-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:25:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C86AB65A;
 Wed,  4 Sep 2019 14:25:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190904134608.18425-1-jgross@suse.com>
 <20190904134608.18425-2-jgross@suse.com>
 <4c0f9d4d-d458-078a-7b21-681695e0efbf@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fe939231-4930-1047-a7e4-51013a087939@suse.com>
Date: Wed, 4 Sep 2019 16:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4c0f9d4d-d458-078a-7b21-681695e0efbf@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v4 1/4] xen: fix debugtrace clearing
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTU6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA5LjIwMTkgMTU6
NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0xMjgxLDE0ICsxMjgwLDE0IEBAIHZvaWQg
ZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+ICAgICAgIHsKPj4gICAg
ICAgICAgIGlmICggc3RyY21wKGJ1ZiwgbGFzdF9idWYpICkKPj4gICAgICAgICAgIHsKPj4gLSAg
ICAgICAgICAgIGxhc3RfcHJkID0gZGVidWd0cmFjZV9wcmQ7Cj4+ICsgICAgICAgICAgICBkZWJ1
Z3RyYWNlX3ByZF9sYXN0ID0gZGVidWd0cmFjZV9wcmQ7Cj4+ICAgICAgICAgICAgICAgbGFzdF9j
b3VudCA9ICsrY291bnQ7Cj4+ICAgICAgICAgICAgICAgc2FmZV9zdHJjcHkobGFzdF9idWYsIGJ1
Zik7Cj4+ICAgICAgICAgICAgICAgc25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1
ICIsIGNvdW50KTsKPj4gICAgICAgICAgIH0KPj4gICAgICAgICAgIGVsc2UKPj4gICAgICAgICAg
IHsKPj4gLSAgICAgICAgICAgIGRlYnVndHJhY2VfcHJkID0gbGFzdF9wcmQ7Cj4+ICsgICAgICAg
ICAgICBkZWJ1Z3RyYWNlX3ByZCA9IGRlYnVndHJhY2VfcHJkX2xhc3Q7Cj4+ICAgICAgICAgICAg
ICAgc25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1LSV1ICIsIGxhc3RfY291bnQs
ICsrY291bnQpOwo+PiAgICAgICAgICAgfQo+PiAgICAgICAgICAgZGVidWd0cmFjZV9hZGRfdG9f
YnVmKGNudGJ1Zik7Cj4gCj4gSSdtIGFmcmFpZCBpdCBpcyByYXRoZXIgbGFzdF9idWZbXSB3aGlj
aCBuZWVkcyBpbnZhbGlkYXRpbmcsIGF0Cj4gd2hpY2ggcG9pbnQgbGFzdF9wcmQgY291bGQgaW1v
IHJlbWFpbiBsb2NhbCB0byB0aGlzIGZ1bmN0aW9uLgoKSG1tLCByaWdodC4gV2lsbCBjaGFuZ2Uu
CgpJJ2xsIHNlbmQgYSBuZXcgc2VyaWVzIGFzIHNvb24gYXMgeW91IGluZGljYXRlIHlvdSB3b24n
dCBoYXZlIGZ1cnRoZXIKY29tbWVudHMgdG8gYW55IHBhdGNoIG9mIHRoZSBzZXJpZXMuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
