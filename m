Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12369152956
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:39:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izI2e-0006Hg-06; Wed, 05 Feb 2020 10:36:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izI2c-0006Hb-5J
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:36:18 +0000
X-Inumbo-ID: 56f8ad3a-4803-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56f8ad3a-4803-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 10:36:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8BE31ACD7;
 Wed,  5 Feb 2020 10:36:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
 <20200203144340.4614-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76961409-b553-0ccc-6cd1-33ccf5cc75a0@suse.com>
Date: Wed, 5 Feb 2020 11:36:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203144340.4614-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] AMD/IOMMU: Treat head/tail pointers as
 byte offsets
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

T24gMDMuMDIuMjAyMCAxNTo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfY21kLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hbWQvaW9tbXVfY21kLmMKPiBAQCAtMjQsMTYgKzI0LDE0IEBAIHN0YXRpYyBpbnQg
cXVldWVfaW9tbXVfY29tbWFuZChzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgdTMyIGNtZFtdKQo+
ICB7Cj4gICAgICB1aW50MzJfdCB0YWlsLCBoZWFkOwo+ICAKPiAtICAgIHRhaWwgPSBpb21tdS0+
Y21kX2J1ZmZlci50YWlsOwo+IC0gICAgaWYgKCArK3RhaWwgPT0gaW9tbXUtPmNtZF9idWZmZXIu
ZW50cmllcyApCj4gKyAgICB0YWlsID0gaW9tbXUtPmNtZF9idWZmZXIudGFpbCArIElPTU1VX0NN
RF9CVUZGRVJfRU5UUllfU0laRTsKPiArICAgIGlmICggdGFpbCA9PSBpb21tdS0+Y21kX2J1ZmZl
ci5zaXplICkKPiAgICAgICAgICB0YWlsID0gMDsKPiAgCj4gLSAgICBoZWFkID0gaW9tbXVfZ2V0
X3JiX3BvaW50ZXIocmVhZGwoaW9tbXUtPm1taW9fYmFzZSArCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVfQ01EX0JVRkZFUl9IRUFEX09GRlNFVCkpOwo+ICsg
ICAgaGVhZCA9IHJlYWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DTURfQlVGRkVSX0hFQURf
T0ZGU0VUKTsKPiAgICAgIGlmICggaGVhZCAhPSB0YWlsICkKClN1cmVseSB5b3Ugd2FudCB0byBt
YXNrIG9mZiByZXNlcnZlZCAob3IgbW9yZSBnZW5lcmFsbHkKdW5yZWxhdGVkKSBiaXRzLCBiZWZv
cmUgY29uc3VtaW5nIHRoZSB2YWx1ZSBmb3IgdGhlIHB1cnBvc2UKaGVyZSAoYW5kIGVsc2V3aGVy
ZSBiZWxvdyk/Cgo+IEBAIC00NSwxMyArNDMsMTEgQEAgc3RhdGljIGludCBxdWV1ZV9pb21tdV9j
b21tYW5kKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCB1MzIgY21kW10pCj4gIAo+ICBzdGF0aWMg
dm9pZCBjb21taXRfaW9tbXVfY29tbWFuZF9idWZmZXIoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUp
Cj4gIHsKPiAtICAgIHUzMiB0YWlsID0gMDsKPiAtCj4gLSAgICBpb21tdV9zZXRfcmJfcG9pbnRl
cigmdGFpbCwgaW9tbXUtPmNtZF9idWZmZXIudGFpbCk7Cj4gLSAgICB3cml0ZWwodGFpbCwgaW9t
bXUtPm1taW9fYmFzZStJT01NVV9DTURfQlVGRkVSX1RBSUxfT0ZGU0VUKTsKPiArICAgIHdyaXRl
bChpb21tdS0+Y21kX2J1ZmZlci50YWlsLAo+ICsgICAgICAgICAgIGlvbW11LT5tbWlvX2Jhc2Ug
KyBJT01NVV9DTURfQlVGRkVSX1RBSUxfT0ZGU0VUKTsKCkkgZ3Vlc3Mgbm90IHByZXNlcnZpbmcg
dGhlIHJlc2VydmVkIGJpdHMgaXNuJ3QgYSBwcm9ibGVtCnJpZ2h0IG5vdywgYnV0IGlzIGRvaW5n
IHNvIGEgZ29vZCBpZGVhIGluIGdlbmVyYWw/IChJIG5vdGljZQp0aGUgaGVhZCBwb2ludCB1cGRh
dGluZyB3aGVuIHByb2Nlc3NpbmcgdGhlIGxvZ3MgZGlkIHNvCmJlZm9yZSwgc28gcGVyaGFwcyBp
dCdzIGluZGVlZCBhY2NlcHRhYmxlLikKCj4gQEAgLTMxNiwyMiArMzE2LDIwIEBAIHN0YXRpYyBp
bnQgaW9tbXVfcmVhZF9sb2coc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4gICAgICAgICAgSU9N
TVVfUFBSX0xPR19IRUFEX09GRlNFVDsKPiAgCj4gICAgICB0YWlsID0gcmVhZGwoaW9tbXUtPm1t
aW9fYmFzZSArIHRhaWxfb2ZmZXN0KTsKPiAtICAgIHRhaWwgPSBpb21tdV9nZXRfcmJfcG9pbnRl
cih0YWlsKTsKPiAgCj4gICAgICB3aGlsZSAoIHRhaWwgIT0gbG9nLT5oZWFkICkKPiAgICAgIHsK
PiAgICAgICAgICAvKiByZWFkIGV2ZW50IGxvZyBlbnRyeSAqLwo+IC0gICAgICAgIGVudHJ5ID0g
KHUzMiAqKShsb2ctPmJ1ZmZlciArIGxvZy0+aGVhZCAqIGVudHJ5X3NpemUpOwo+ICsgICAgICAg
IGVudHJ5ID0gKHUzMiAqKShsb2ctPmJ1ZmZlciArIGxvZy0+aGVhZCk7CgpXb3VsZCB5b3UgbWlu
ZCBkcm9wcGluZyB0aGUgcG9pbnRsZXNzIGNhc3QgaGVyZSBhdCB0aGUgc2FtZSB0aW1lPwoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
