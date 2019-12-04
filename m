Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD508112912
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:13:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRcJ-0007Bi-An; Wed, 04 Dec 2019 10:10:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icRcI-0007Bd-3g
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:10:42 +0000
X-Inumbo-ID: 537db707-167e-11ea-81ff-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 537db707-167e-11ea-81ff-12813bfff9fa;
 Wed, 04 Dec 2019 10:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBA3AB21B;
 Wed,  4 Dec 2019 10:10:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f91bbae-8a99-9e17-5c95-e054b59787cd@suse.com>
Date: Wed, 4 Dec 2019 11:10:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204094335.24603-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/svm: Don't shadow variables in
 svm_vmexit_handler()
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

T24gMDQuMTIuMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbG9jYWwgdmFy
aWFibGUgZXZlbnRpbmogaXMgc2V0IHRvIHRoZSB2YWx1ZSBvZiB2bWNiLT5leGl0aW50aW5mbyB3
aGljaCBpcwo+IGNvbmZ1c2luZyBjb25zaWRlcmluZyB0aGF0IGl0IGlzbid0IHZtY2ItPmV2ZW50
aW5qLiAgVGhlIHZhcmlhYmxlIGlzbid0Cj4gbmVjZXNzYXJ5IHRvIGJlZ2luIHdpdGgsIHNvIGRy
b3AgaXQgdG8gYXZvaWQgY29uZnVzaW9uLgo+IAo+IEEgbG9jYWwgcmMgdmFyaWFibGUgaXMgc2hh
ZG93ZWQgaW4gdGhlIENQVUlELCAjREIgYW5kICNCUCBoYW5kbGVycy4KPiAKPiBUaGVyZSBpcyBh
IG1peCBvZiBzcGVsbGluZyBvZiBpbnN0X2xlbiBhbmQgaW5zbl9sZW4sIGFsbCBvZiB3aGljaCBh
cmUKPiBsb2dpY2FsbHkgdGhlIHNhbWUgdmFsdWUuICBDb25zb2xpZGF0ZSBvbiBpbnNuX2xlbiB3
aGljaCBhbHNvIG1hdGNoZXMgdGhlIG5hbWUKPiBvZiB0aGUgZW11bGF0aW9uIGZ1bmN0aW9ucyBm
b3Igb2J0YWluaW5nIGluc3RydWN0aW9uIGxlbmd0aHMsIGFuZCBhdm9pZAo+IHNoYWRvd2luZyBp
dCBpbiB0aGUgQ1BVSUQgYW5kIFRBU0tfU1dJVENIIGhhbmRsZXJzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3N2bS9zdm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gQEAgLTI0
ODAsOCArMjQ4MCw3IEBAIHZvaWQgc3ZtX3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQo+ICAgICAgdWludDY0X3QgZXhpdF9yZWFzb247Cj4gICAgICBzdHJ1Y3QgdmNw
dSAqdiA9IGN1cnJlbnQ7Cj4gICAgICBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZtY2IgPSB2LT5hcmNo
Lmh2bS5zdm0udm1jYjsKPiAtICAgIGV2ZW50aW5qX3QgZXZlbnRpbmo7Cj4gLSAgICBpbnQgaW5z
dF9sZW4sIHJjOwo+ICsgICAgaW50IGluc25fbGVuLCByYzsKCkknbSBub3QgcmVhbGx5IGhhcHB5
IHRvIHNlZSBpbnNuX2xlbiBiZSBwbGFpbiBpbnQsIGJ1dCB0aGUgdGFzayBzd2l0Y2gKY2FzZSBy
ZXF1aXJlcyBpdCB0byBiZSBzbyAoYXQgbGVhc3QgZm9yIHRoZSB0aW1lIGJlaW5nKS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
