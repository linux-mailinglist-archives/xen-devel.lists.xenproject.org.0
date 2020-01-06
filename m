Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ABC13101C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 11:15:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioPNT-00052R-F0; Mon, 06 Jan 2020 10:12:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioPNR-00052M-7i
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 10:12:49 +0000
X-Inumbo-ID: 117f7566-306d-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 117f7566-306d-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 10:12:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A398AD33;
 Mon,  6 Jan 2020 10:12:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200103200742.23917-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6781391-e3f0-7ff1-ccdf-bdb6f41e9408@suse.com>
Date: Mon, 6 Jan 2020 11:13:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200103200742.23917-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: Short circuit control/hardware
 checks in PV_SHIM_EXCLUSIVE builds
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAyMTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gQEAgLTk2
MywxMCArOTYzLDIyIEBAIHZvaWQgd2F0Y2hkb2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFp
biAqZCk7Cj4gICAqICAgICh0aGF0IGlzLCB0aGlzIHdvdWxkIG5vdCBiZSBzdWl0YWJsZSBmb3Ig
YSBkcml2ZXIgZG9tYWluKQo+ICAgKiAgLSBUaGVyZSBpcyBuZXZlciBhIHJlYXNvbiB0byBkZW55
IHRoZSBoYXJkd2FyZSBkb21haW4gYWNjZXNzIHRvIHRoaXMKPiAgICovCj4gLSNkZWZpbmUgaXNf
aGFyZHdhcmVfZG9tYWluKF9kKSBldmFsdWF0ZV9ub3NwZWMoKF9kKSA9PSBoYXJkd2FyZV9kb21h
aW4pCj4gK3N0YXRpYyBhbHdheXNfaW5saW5lIGJvb2wgaXNfaGFyZHdhcmVfZG9tYWluKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpCj4gK3sKPiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFZf
U0hJTV9FWENMVVNJVkUpICkKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgcmV0
dXJuIGV2YWx1YXRlX25vc3BlYyhkID09IGhhcmR3YXJlX2RvbWFpbik7Cj4gK30KPiAgCj4gIC8q
IFRoaXMgY2hlY2sgaXMgZm9yIGZ1bmN0aW9uYWxpdHkgc3BlY2lmaWMgdG8gYSBjb250cm9sIGRv
bWFpbiAqLwo+IC0jZGVmaW5lIGlzX2NvbnRyb2xfZG9tYWluKF9kKSBldmFsdWF0ZV9ub3NwZWMo
KF9kKS0+aXNfcHJpdmlsZWdlZCkKPiArc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19jb250
cm9sX2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICBpZiAoIElTX0VO
QUJMRUQoQ09ORklHX1BWX1NISU1fRVhDTFVTSVZFKSApCj4gKyAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ICsKPiArICAgIHJldHVybiBldmFsdWF0ZV9ub3NwZWMoZC0+aXNfcHJpdmlsZWdlZCk7Cj4g
K30KCkJlc2lkZXMgaXRzIGludGVuZGVkIHB1cnBvc2UgdGhpcyBhbHNvIGZpeGVzIChidXQgb25s
eSBmb3IgdGhlCnNoaW0tZXhjbHVzaXZlIGNhc2UpIGFuIGludGVyYWN0aW9uIGlzc3VlIHdpdGgg
TEFURV9IV0RPTTogSWYgaW4Kc2hpbSBtb2RlIHRoZSAiaGFyZHdhcmVfZG9tPTEiIGNvbW1hbmQg
bGluZSBvcHRpb24gd2FzIHVzZWQsCm1pc2JlaGF2aW9yIHdvdWxkIHJlc3VsdCBhZmFpY3QuIFRo
ZXJlZm9yZSBJIHRoaW5rIHRoaXMgd2FudHMKYW1lbmRpbmcgd2l0aCBhZGp1c3RtZW50cyB0byBh
bHNvIG1ha2UgdGhlICFQVl9TSElNX0VYQ0xVU0lWRQpjYXNlIHdvcmsgY29ycmVjdGx5IChyZWFk
OiBpZ25vcmUgdGhhdCBjb21tYW5kIGxpbmUgb3B0aW9uKS4gSQpndWVzcyBhZGRpdGlvbmFsbHkg
TEFURV9IV0RPTSBzaG91bGQgYWxzbyBkZXBlbmQgb24KIVBWX1NISU1fRVhDTFVTSVZFIChhbmQv
b3IgdmljZSB2ZXJzYSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
