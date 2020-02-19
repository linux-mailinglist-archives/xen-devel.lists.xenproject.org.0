Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A11643DA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:05:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4O4D-0006IX-Ce; Wed, 19 Feb 2020 12:03:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4O4C-0006IR-IA
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 12:03:00 +0000
X-Inumbo-ID: c5c900d6-530f-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5c900d6-530f-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 12:03:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6E62BB18;
 Wed, 19 Feb 2020 12:02:58 +0000 (UTC)
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8808612b-11c2-f7b8-f027-7ff92e992c50@suse.com>
Date: Wed, 19 Feb 2020 13:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Enable interrupts when calling
 _cond_resched()
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTI6MDEsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiB4ZW5fbWF5YmVfcHJl
ZW1wdF9oY2FsbCgpIGlzIGNhbGxlZCBmcm9tIHRoZSBleGNlcHRpb24gZW50cnkgcG9pbnQKPiB4
ZW5fZG9faHlwZXJ2aXNvcl9jYWxsYmFjayB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4gCj4g
X2NvbmRfcmVzY2hlZCgpIGV2YWRlcyB0aGUgbWlnaHRfc2xlZXAoKSBjaGVjayBpbiBjb25kX3Jl
c2NoZWQoKSB3aGljaAo+IHdvdWxkIGhhdmUgY2F1Z2h0IHRoYXQgYW5kIHNjaGVkdWxlX2RlYnVn
KCkgdW5mb3J0dW5hdGVseSBsYWNrcyBhIGNoZWNrCj4gZm9yIGlycXNfZGlzYWJsZWQoKS4KPiAK
PiBFbmFibGUgaW50ZXJydXB0cyBhcm91bmQgdGhlIGNhbGwgYW5kIHVzZSBjb25kX3Jlc2NoZWQo
KSB0byBjYXRjaCBmdXR1cmUKPiBpc3N1ZXMuCj4gCj4gRml4ZXM6IGZkZmQ4MTFkZGRlMyAoIng4
Ni94ZW46IGFsbG93IHByaXZjbWQgaHlwZXJjYWxscyB0byBiZSBwcmVlbXB0ZWQiKQo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IC0tLQo+ICAg
ZHJpdmVycy94ZW4vcHJlZW1wdC5jIHwgICAgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gLS0tIGEvZHJpdmVycy94ZW4vcHJlZW1w
dC5jCj4gKysrIGIvZHJpdmVycy94ZW4vcHJlZW1wdC5jCj4gQEAgLTMzLDggKzMzLDEwIEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIHZvaWQgeGVuX21heWJlX3ByZWUKPiAgIAkJICogY3B1Lgo+ICAg
CQkgKi8KPiAgIAkJX190aGlzX2NwdV93cml0ZSh4ZW5faW5fcHJlZW1wdGlibGVfaGNhbGwsIGZh
bHNlKTsKPiAtCQlfY29uZF9yZXNjaGVkKCk7Cj4gKwkJbG9jYWxfaXJxX2VuYWJsZSgpOwo+ICsJ
CWNvbmRfcmVzY2hlZCgpOwo+ICAgCQlfX3RoaXNfY3B1X3dyaXRlKHhlbl9pbl9wcmVlbXB0aWJs
ZV9oY2FsbCwgdHJ1ZSk7Cj4gKwkJbG9jYWxfaXJxX2Rpc2FibGUoKTsKCkNvdWxkIHlvdSBwbGVh
c2UgcHV0IHRoZSBjYWxsIG9mIGxvY2FsX2lycV9kaXNhYmxlKCkgZGlyZWN0bHkgYWZ0ZXIgdGhl
CmNvbmRfcmVzY2hlZCgpIGNhbGwgdG8gbWFrZSB0aGUgcmVzdWx0IHN5bW1ldHJpYyByZWdhcmRp
bmcgd3JpdGluZyBvZgp4ZW5faW5fcHJlZW1wdGlibGVfaGNhbGwgYW5kIGlycSBlbmFibGUvZGlz
YWJsZT8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
