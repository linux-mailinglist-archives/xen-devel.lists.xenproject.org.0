Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69226A7D47
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:07:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5QGp-0003E1-V8; Wed, 04 Sep 2019 08:04:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5QGo-0003Dm-4g
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:04:02 +0000
X-Inumbo-ID: 8d94ba24-ceea-11e9-abad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d94ba24-ceea-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 08:04:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04EA3AF56;
 Wed,  4 Sep 2019 08:04:00 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
 <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3df1ec6a-9e15-9d2b-c48c-7e561f2e906e@suse.com>
Date: Wed, 4 Sep 2019 10:04:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAwOTo0OSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBT
ZXAgMDMsIDIwMTkgYXQgMDY6MTM6NTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
T24gMDMvMDkvMjAxOSAxNzoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+
Pj4gaW5kZXggNjkyYjcxMGIwMi4uNjk2NTJlMTA4MCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaW9yZXEuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4+PiBA
QCAtMTAxNSw2ICsxMDE1LDEyIEBAIGludCBodm1fbWFwX2lvX3JhbmdlX3RvX2lvcmVxX3NlcnZl
cihzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLAo+Pj4gICAgICBzd2l0Y2ggKCB0eXBl
ICkKPj4+ICAgICAgewo+Pj4gICAgICBjYXNlIFhFTl9ETU9QX0lPX1JBTkdFX1BPUlQ6Cj4+PiAr
ICAgICAgICByYyA9IC1FSU5WQUw7Cj4+PiArICAgICAgICAvKiBQQ0kgY29uZmlnIHNwYWNlIGFj
Y2Vzc2VzIGFyZSBoYW5kbGVkIGludGVybmFsbHkuICovCj4+PiArICAgICAgICBpZiAoIHN0YXJ0
IDw9IDB4Y2Y4ICsgOCAmJiAweGNmOCA8PSBlbmQgKQo+Pj4gKyAgICAgICAgICAgIGdvdG8gb3V0
Owo+Pj4gKyAgICAgICAgZWxzZQo+Pj4gKyAgICAgICAgICAgIC8qIGZhbGx0aHJvdWdoLiAqLwo+
Pgo+PiBGaW5hbGx5LCB0aGlzIHByb2hpYml0cyByZWdpc3RlcmluZyBjZjkgd2hpY2ggbWF5IGxl
Z2l0aW1hdGVseSBub3QgYmUKPj4gdGVybWluYXRlZCBpbiBYZW4uCj4gCj4gWWVzLCB0aGF0IHNo
b3VsZCBiZSBjZjggLSA3IG5vdCA4LCB0aGFua3MgZm9yIGNhdGNoaW5nIGl0ISBXaWxsIHVwZGF0
ZQo+IG9uIHRoZSBuZXh0IHZlcnNpb24uCgpXZWxsLCBhc3N1bWluZyB5b3UgbWVhbiArIGluc3Rl
YWQgb2YgLSAsIHRoZW4geWVzLCB0aGlzIG5lZWRzIGZpeGluZy4KQnV0IGRvaW5nIHNvIHdvbid0
IHRha2UgY2FyZSBvZiBBbmRyZXcncyBjb21tZW50LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
