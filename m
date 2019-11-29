Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5B10D59B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:19:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafDR-0004YP-Cg; Fri, 29 Nov 2019 12:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iafDP-0004YC-Hf
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:17:39 +0000
X-Inumbo-ID: 3bc1583c-12a2-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bc1583c-12a2-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 12:17:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 24DE8B023;
 Fri, 29 Nov 2019 12:17:38 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
 <8b5d973c-8cc7-6c52-acdc-e8f309fcaa9b@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c5502d6-942d-57dd-1c64-dc6b5103bd08@suse.com>
Date: Fri, 29 Nov 2019 13:17:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8b5d973c-8cc7-6c52-acdc-e8f309fcaa9b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMzowMSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOS4xMS4xOSAx
MToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI4LjExLjIwMTkgMTc6NTIsIFBhdWwgRHVy
cmFudCB3cm90ZToKPj4+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4gKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+PiBAQCAtODQsMTEgKzg0LDQwIEBAIHN0cnVjdCBn
cmFudF90YWJsZSB7Cj4+PiAgICAgICBzdHJ1Y3QgZ3JhbnRfdGFibGVfYXJjaCBhcmNoOwo+Pj4g
ICB9Owo+Pj4gICAKPj4+ICtzdGF0aWMgaW50IHBhcnNlX2dudHRhYl9saW1pdChjb25zdCBjaGFy
ICpwYXJhbSwgY29uc3QgY2hhciAqYXJnLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCAqdmFscCkKPj4+ICt7Cj4+PiArICAgIGNvbnN0IGNoYXIgKmU7Cj4+
PiArICAgIHVuc2lnbmVkIGxvbmcgdmFsOwo+Pj4gKwo+Pj4gKyAgICB2YWwgPSBzaW1wbGVfc3Ry
dG91bChhcmcsICZlLCAwKTsKPj4+ICsgICAgaWYgKCAqZSApCj4+PiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPj4+ICsKPj4+ICsgICAgaWYgKCB2YWwgPiBJTlRfTUFYICkKPj4+ICsgICAgICAg
IHJldHVybiAtRVJBTkdFOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gMDsKPj4+ICt9Cj4+Cj4+ICp2
YWxwIGRvZXNuJ3QgZ2V0IHdyaXR0ZW4gdG8gYW55bW9yZS4gV2l0aCB0aGlzIGZpeGVkIChhbmQg
bm8gbmV3Cj4+IGlzc3VlcyBpbnRyb2R1Y2VkIDstKSApIGh5cGVydmlzb3Igc2lkZQo+PiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFuZDoKPiAKPiBS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpOb3RlZCwg
YnV0IC0gYWhlYWQgb2YgYSB0b29sIHN0YWNrIHNpZGUgYWNrPyBJLmUuIHZhbGlkIGluZGVmaW5p
dGVseQpubyBtYXR0ZXIgd2hlbiB0aGF0IG9uZSB3b3VsZCBhcnJpdmU/CgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
