Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCF10CD0D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:49:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMxE-0003EA-Iv; Thu, 28 Nov 2019 16:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaMxD-0003E5-5C
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:47:43 +0000
X-Inumbo-ID: cae84c18-11fe-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cae84c18-11fe-11ea-9db0-bc764e2007e4;
 Thu, 28 Nov 2019 16:47:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CBA3B19D;
 Thu, 28 Nov 2019 16:47:39 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0a9e08a2-e72a-3848-489b-ede7d40dbd6a@suse.com>
Date: Thu, 28 Nov 2019 17:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTc6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjExLjIwMTkgMTQ6
NTgsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+PiBAQCAtODQsMTEgKzg0LDQzIEBA
IHN0cnVjdCBncmFudF90YWJsZSB7Cj4+ICAgICAgIHN0cnVjdCBncmFudF90YWJsZV9hcmNoIGFy
Y2g7Cj4+ICAgfTsKPj4gICAKPj4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX2dudHRhYl9saW1p
dChjb25zdCBjaGFyICpwYXJhbSwgY29uc3QgY2hhciAqYXJnLAo+IAo+IE5vIF9faW5pdCBwbGVh
c2UgaGVyZSBhbmQgYmVsb3csIGZvciB0aGlzIGJlaW5nIHJ1bnRpbWUgb3B0aW9uCj4gcGFyc2lu
ZyBmdW5jdGlvbnMuCj4gCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50ICp2YWxwKQo+PiArewo+PiArICAgIGNvbnN0IGNoYXIgKmU7Cj4+ICsgICAg
dW5zaWduZWQgbG9uZyB2YWw7Cj4+ICsKPj4gKyAgICB2YWwgPSBzaW1wbGVfc3RydG91bChhcmcs
ICZlLCAwKTsKPj4gKyAgICBpZiAoICplICkKPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+
ICsKPj4gKyAgICBpZiAoIHZhbCA8PSBJTlRfTUFYICkKPj4gKyAgICAgICAgKnZhbHAgPSB2YWw7
Cj4+ICsgICAgZWxzZQo+PiArICAgICAgICBwcmludGsoInBhcmFtZXRlciBcIiVzXCIgdmFsdWUg
XCIlc1wiIGlzIG91dCBvZiByYW5nZTsgdXNpbmcgdmFsdWUgXCIldVwiXG4iLAo+PiArICAgICAg
ICAgICAgICAgcGFyYW0sIGFyZywgKnZhbHApOwo+IAo+IEJldHRlciBzdG9yZSBJTlRfTUFYIGlu
IHRoaXMgY2FzZSByYXRoZXIgdGhhbiBsZWF2aW5nIHRoZSB2YWx1ZQoKTm8sIElOVF9NQVggaXMg
bm8gZ29vZCBpZGVhLiBJbiBjYXNlIG9mIHRoaXMgaGFwcGVuaW5nIGF0IGJvb3QgdGltZSB3ZSdk
CmFsbG9jYXRlIGFuIGFycmF5IG9mIDIgYmlsbGlvbiBwb2ludGVycyBmb3IgZG9tMC4uLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
