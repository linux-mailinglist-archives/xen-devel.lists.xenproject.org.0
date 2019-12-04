Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849F11269E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:09:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQaS-0008N6-S2; Wed, 04 Dec 2019 09:04:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icQaR-0008N1-5u
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:04:43 +0000
X-Inumbo-ID: 1b2e4306-1675-11ea-81fb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b2e4306-1675-11ea-81fb-12813bfff9fa;
 Wed, 04 Dec 2019 09:04:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68CF0AD7F;
 Wed,  4 Dec 2019 09:04:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0341ef2-a71e-b2f7-1f07-0fbe26ec257d@suse.com>
Date: Wed, 4 Dec 2019 10:04:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203171030.11680-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxODoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvaHZtL2RtX29wLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2Rt
X29wLmgKPiBAQCAtMzI0LDcgKzMyNCw3IEBAIHN0cnVjdCB4ZW5fZG1fb3BfaW5qZWN0X2V2ZW50
IHsKPiAgICAgIC8qIElOIC0gZXJyb3IgY29kZSAob3IgfjAgdG8gc2tpcCkgKi8KPiAgICAgIHVp
bnQzMl90IGVycm9yX2NvZGU7Cj4gICAgICB1aW50MzJfdCBwYWQxOwo+IC0gICAgLyogSU4gLSBD
UjIgZm9yIHBhZ2UgZmF1bHRzICovCj4gKyAgICAvKiBJTiAtIHR5cGUtc3BlY2lmaWMgZXh0cmEg
ZGF0YSAoJWNyMiBmb3IgI1BGLCBwZW5kaW5nX2RiZyBmb3IgI0RCKSAqLwo+ICAgICAgdWludDY0
X2FsaWduZWRfdCBjcjI7Cj4gIH07CgpIb3cgYWJvdXQKCiAgICAgdWludDMyX3QgZXJyb3JfY29k
ZTsKICAgICB1aW50MzJfdCBwYWQxOwogICAgLyogSU4gLSB0eXBlLXNwZWNpZmljIGV4dHJhIGRh
dGEgKCVjcjIgZm9yICNQRiwgcGVuZGluZ19kYmcgZm9yICNEQikgKi8KI2lmIGRlZmluZWQoX19Y
RU5fXykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19fKQogICAgdWludDY0X2FsaWduZWRfdCBleHRy
YTsKI2Vsc2UKICAgIHVpbnQ2NF9hbGlnbmVkX3QgY3IyOwojZW5kaWYKfTsKCm9yIHNvbWV0aGlu
ZyBhbG9uZyB0aGVzZSBsaW5lcyAoZS5nLiBjb3VsZCBhbHNvIGJlIGFuIHVubmFtZWQKdW5pb24g
Z3VhcmRlZCBieSBhIF9fR05VQ19fIGNoZWNrLCBvciBhIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9O
X18KY29uZGl0aW9uYWwpLCB0byBoYXZlIGEgbGVzcyBjb25mdXNpbmcgbmFtZSBpbiBYZW4gYW5k
IHRoZSB0b29scz8KRWl0aGVyIHdheSBoeXBlcnZpc29yIGJpdHMKCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
