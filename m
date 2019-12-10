Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A26118523
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:32:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieclV-00005L-2G; Tue, 10 Dec 2019 10:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieclT-00005D-5G
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:29:11 +0000
X-Inumbo-ID: e7006e7a-1b37-11ea-8917-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7006e7a-1b37-11ea-8917-12813bfff9fa;
 Tue, 10 Dec 2019 10:29:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C616CB229;
 Tue, 10 Dec 2019 10:29:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18fc1fa8-08f6-be73-c1d2-671a9ea8f728@suse.com>
Date: Tue, 10 Dec 2019 11:29:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] x86/smt: Don't use -EBUSY for
 smt_up_down_helper() continuations
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvc3lzY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiBAQCAtODUsNiAr
ODUsOSBAQCBsb25nIGNwdV91cF9oZWxwZXIodm9pZCAqZGF0YSkKPiAgICAgICAgICAvKiBPbiBF
QlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4gICAgICAgICAg
cmN1X2JhcnJpZXIoKTsKPiAgICAgICAgICByZXQgPSBjcHVfdXAoY3B1KTsKPiArCj4gKyAgICAg
ICAgaWYgKCByZXQgPT0gLUVCVVNZICkKPiArICAgICAgICAgICAgcmV0ID0gLUVSRVNUQVJUOwo+
ICAgICAgfQo+ICAKPiAgICAgIGlmICggIXJldCAmJiAhb3B0X3NtdCAmJgo+IEBAIC0xMTAsNiAr
MTEzLDkgQEAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSkKPiAgICAgICAgICAvKiBP
biBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4gICAgICAg
ICAgcmN1X2JhcnJpZXIoKTsKPiAgICAgICAgICByZXQgPSBjcHVfZG93bihjcHUpOwo+ICsKPiAr
ICAgICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+ICsgICAgICAgICAgICByZXQgPSAtRVJFU1RB
UlQ7Cj4gICAgICB9Cj4gICAgICByZXR1cm4gcmV0Owo+ICB9CgpGb3IgYm90aCBvZiB0aGVzZSAt
IGlmIHR3byBzdWNjZXNzaXZlIGF0dGVtcHRzIGRpZG4ndCB3b3JrLCBpcwp0aGVyZSByZWFsbHkg
bXVjaCBwb2ludCBub3QgcmVwb3J0aW5nIHRoZSBmYWN0IGJhY2sgdG8gdGhlCmNhbGxlcj8gWW91
J3JlIGxpYWJsZSB0byByZXF1ZXN0IGNvbnRpbnVhdGlvbnMgaW5kZWZpbml0ZWx5IHRoZW4uCgo+
IEBAIC0xNDMsOCArMTQ5LDcgQEAgc3RhdGljIGxvbmcgc210X3VwX2Rvd25faGVscGVyKHZvaWQg
KmRhdGEpCj4gICAgICAgICAgICovCj4gICAgICAgICAgaWYgKCByZXQgIT0gLUVFWElTVCAmJiBn
ZW5lcmFsX3ByZWVtcHRfY2hlY2soKSApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICAvKiBJ
biB0YXNrbGV0IGNvbnRleHQgLSBjYW4ndCBjcmVhdGUgYSBjb250aW5hdGlvbi4gKi8KPiAtICAg
ICAgICAgICAgcmV0ID0gLUVCVVNZOwo+ICsgICAgICAgICAgICByZXQgPSAtRVJFU1RBUlQ7Cj4g
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgIH0KPiAgCgpJIGFncmVlIHdpdGggdGhpcyBj
aGFuZ2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
