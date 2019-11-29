Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97810D59F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:22:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafF5-0004pd-Eb; Fri, 29 Nov 2019 12:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iafF3-0004pR-QW
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:19:21 +0000
X-Inumbo-ID: 77b687cd-12a2-11ea-a3e5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77b687cd-12a2-11ea-a3e5-12813bfff9fa;
 Fri, 29 Nov 2019 12:19:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8466BACC0;
 Fri, 29 Nov 2019 12:19:20 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
 <8b5d973c-8cc7-6c52-acdc-e8f309fcaa9b@suse.com>
 <3c5502d6-942d-57dd-1c64-dc6b5103bd08@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dd61a9a3-a8b3-1144-cc8d-569ab1f93610@suse.com>
Date: Fri, 29 Nov 2019 13:19:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3c5502d6-942d-57dd-1c64-dc6b5103bd08@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTM6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjExLjIwMTkgMTM6
MDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI5LjExLjE5IDExOjIyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI4LjExLjIwMTkgMTc6NTIsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+
PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPj4+PiArKysgYi94ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMKPj4+PiBAQCAtODQsMTEgKzg0LDQwIEBAIHN0cnVjdCBncmFudF90YWJsZSB7
Cj4+Pj4gICAgICAgIHN0cnVjdCBncmFudF90YWJsZV9hcmNoIGFyY2g7Cj4+Pj4gICAgfTsKPj4+
PiAgICAKPj4+PiArc3RhdGljIGludCBwYXJzZV9nbnR0YWJfbGltaXQoY29uc3QgY2hhciAqcGFy
YW0sIGNvbnN0IGNoYXIgKmFyZywKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50ICp2YWxwKQo+Pj4+ICt7Cj4+Pj4gKyAgICBjb25zdCBjaGFyICplOwo+Pj4+
ICsgICAgdW5zaWduZWQgbG9uZyB2YWw7Cj4+Pj4gKwo+Pj4+ICsgICAgdmFsID0gc2ltcGxlX3N0
cnRvdWwoYXJnLCAmZSwgMCk7Cj4+Pj4gKyAgICBpZiAoICplICkKPj4+PiArICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4gKyAgICBpZiAoIHZhbCA+IElOVF9NQVggKQo+Pj4+ICsg
ICAgICAgIHJldHVybiAtRVJBTkdFOwo+Pj4+ICsKPj4+PiArICAgIHJldHVybiAwOwo+Pj4+ICt9
Cj4+Pgo+Pj4gKnZhbHAgZG9lc24ndCBnZXQgd3JpdHRlbiB0byBhbnltb3JlLiBXaXRoIHRoaXMg
Zml4ZWQgKGFuZCBubyBuZXcKPj4+IGlzc3VlcyBpbnRyb2R1Y2VkIDstKSApIGh5cGVydmlzb3Ig
c2lkZQo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4K
Pj4gQW5kOgo+Pgo+PiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gCj4gTm90ZWQsIGJ1dCAtIGFoZWFkIG9mIGEgdG9vbCBzdGFjayBzaWRlIGFjaz8g
SS5lLiB2YWxpZCBpbmRlZmluaXRlbHkKPiBubyBtYXR0ZXIgd2hlbiB0aGF0IG9uZSB3b3VsZCBh
cnJpdmU/CgpXZSBhZ3JlZWQgdGhpcyBvbmUgdG8gYmUgYSBibG9ja2VyLCByaWdodD8KCk5ldmVy
dGhlbGVzczogdG9vbHMgbWFpbnRhaW5lcnMsIHBsZWFzZT8KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
