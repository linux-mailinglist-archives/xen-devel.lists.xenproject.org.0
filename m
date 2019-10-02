Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC0C8C6B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 17:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFgF0-00044H-Tw; Wed, 02 Oct 2019 15:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFgEz-00044C-8j
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 15:08:33 +0000
X-Inumbo-ID: 7f1dc560-e526-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 7f1dc560-e526-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 15:08:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E7D9AC81;
 Wed,  2 Oct 2019 15:08:31 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e115b2bc-a426-d96c-6f55-7953fd7c9fcf@suse.com>
Date: Wed, 2 Oct 2019 17:08:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-7-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 06/10] ioreq: allow registering internal
 ioreq server handler
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
Cc: xen-devel@lists.xenproject.org, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBA
IC00ODUsNiArNDg1LDM4IEBAIHN0YXRpYyBpbnQgaHZtX2FkZF9pb3JlcV9nZm4oc3RydWN0IGh2
bV9pb3JlcV9zZXJ2ZXIgKnMsIGJvb2wgYnVmKQo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+
ICtpbnQgaHZtX3NldF9pb3JlcV9oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3Qg
aWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoaW9yZXFfdCAq
LCB2b2lkICopLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCj4gK3sK
PiArICAgIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzOwo+ICsgICAgaW50IHJjID0gMDsKPiAr
Cj4gKyAgICBpZiAoICFodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpICkKPiArICAgICAgICByZXR1
cm4gLUVJTlZBTDsKCklzbid0IEJVR19PTigpIG1vcmUgYXBwbGljYWJsZSBoZXJlPwoKPiArICAg
IHNwaW5fbG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZtLmlvcmVxX3NlcnZlci5sb2NrKTsKPiAr
ICAgIHMgPSBnZXRfaW9yZXFfc2VydmVyKGQsIGlkKTsKPiArICAgIGlmICggIXMgKQo+ICsgICAg
ewo+ICsgICAgICAgIHJjID0gLUVOT0VOVDsKPiArICAgICAgICBnb3RvIG91dDsKPiArICAgIH0K
PiArICAgIGlmICggcy0+ZW5hYmxlZCApCj4gKyAgICB7Cj4gKyAgICAgICAgcmMgPSAtRUJVU1k7
Cj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcy0+aGFuZGxlciA9IGhh
bmRsZXI7Cj4gKyAgICBzLT5kYXRhID0gZGF0YTsKCklzIGl0IHJlYWxseSBpbnRlbmRlZCB0byBi
bGluZGx5IHJlcGxhY2UgYSBkaXNhYmxlZCBoYW5kbGVyPwpXb3VsZG4ndCB0aGUgcy0+ZW5hYmxl
ZCBjaGVjayBiZXR0ZXIgYmUgZXZhbHVhdGluZyBzLT5oYW5kbGVyPwoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
