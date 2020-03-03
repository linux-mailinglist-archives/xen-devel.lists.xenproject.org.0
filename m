Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4FF1775D4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 13:25:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j96Yk-0003zB-MO; Tue, 03 Mar 2020 12:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wYci=4U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j96Yj-0003ye-58
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 12:22:01 +0000
X-Inumbo-ID: 94e28566-5d49-11ea-ac41-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94e28566-5d49-11ea-ac41-bc764e2007e4;
 Tue, 03 Mar 2020 12:22:00 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h62so4030013edd.12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 04:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GC4lxYhMxmm6T0QK5XRotC8q1vA/UyKy7QK452PMZfg=;
 b=AMxcIocuSzk/DJKbgjFeTBPLFJFgB9hJykpqusoWypk910CvjhZVTD5WC/VFvi6tar
 l5rYRCiDf1kyuNj5DY2E4ld5iRJvHdBMUqpUm1RYMCxZEKeNnVcrA+8Ps/Pf6gUdM4Fd
 Uo4M/dlD3UiY2RWAWFhrZvNSANb1+ZlMLfDe8IH6rtAM3q4NUKfqOeTx0KvWfJ07IdwR
 W3fI8JyNAcHKRPufDwYovNl6iRHBNx+GtAgWiOZdFPbysL5uxKsscWX8zCzOFUSZf3hk
 LiTDssf76GO0Ed3CKV5iHHs7Yt78zawfnKxsMlpjKPsb5EkfsrgkrGsNglP4nmEeCHqv
 zjiw==
X-Gm-Message-State: ANhLgQ1WpDaXS3dJWTgW3WzCdP+o/sAtLJOPtTraGqFjUR+gL3qV1eMS
 lD6Xk4V0+v9ia1kEWyxupWE=
X-Google-Smtp-Source: ADFU+vsXMgFAM9b/m/6sOK8m2O+gwqhpDXWVCHpXP8U0blNLMpq21g0WNxrla7dqLDkPjlG88rJ/Gw==
X-Received: by 2002:a05:6402:b85:: with SMTP id
 cf5mr3507595edb.27.1583238119644; 
 Tue, 03 Mar 2020 04:21:59 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id v2sm999033ejj.44.2020.03.03.04.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 04:21:58 -0800 (PST)
To: xen-devel@lists.xenproject.org
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
 <3c1f1f91-6350-57de-2134-ab98bd4186d4@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <447cdd4f-cb30-d4ec-3cb9-852ff41c86f6@xen.org>
Date: Tue, 3 Mar 2020 12:21:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3c1f1f91-6350-57de-2134-ab98bd4186d4@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZyBhZ2Fpbi4KCk9uIDEzLzAyLzIwMjAgMTI6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBI
aSwKPiAKPiBHZW50bGUgcGluZy4KPiAKPiBDaGVlcnMsCj4gCj4gT24gMDQvMDIvMjAyMCAxNDow
NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPgo+Pgo+PiBVbmxpa2Ugc2hhZG93X2VuYWJsZSgpLCBoYXBfZW5hYmxlKCkgY2FuIG9u
bHkgYmUgY2FsbGVkIG9uY2UgZHVyaW5nCj4+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUg
bW9kZSBlcXVhbCB0byBtb2RlIGVxdWFsIHRvCj4+IFBHX2V4dGVybmFsIHwgUEdfdHJhbnNsYXRl
IHwgUEdfcmVmY291bnRzLgo+Pgo+PiBJZiBpdCB3ZXJlIGNhbGxlZCB0d2ljZSwgdGhlbiB3ZSBt
aWdodCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGluZwo+PiBwcm9ibGVtIGFzIHRoZSBwMm0gdGFi
bGVzIHdvdWxkIGJlIHJlLWFsbG9jYXRlZCAoYW5kIHRoZXJlZm9yZSBhbGwgdGhlCj4+IG1hcHBp
bmdzIHdvdWxkIGJlIGxvc3QpLgo+Pgo+PiBBZGQgY29kZSB0byBzYW5pdHkgY2hlY2sgdGhlIG1v
ZGUgYW5kIHRoYXQgdGhlIGZ1bmN0aW9uIGlzIG9ubHkgY2FsbGVkCj4+IG9uY2UuIFRha2UgdGhl
IG9wcG9ydHVuaXR5IHRvIGFuIGlmIGNoZWNraW5nIHRoYXQgUEdfdHJhbnNsYXRlIGlzIHNldC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4K
Pj4gLS0tCj4+Cj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aGVuIFBHX3RyYW5zbGF0ZSB3
YXMgZW5mb3JjZWQuCj4+Cj4+IEkga2VlcCB0aGUgY2hlY2sgIT0gMCBiZWNhdXNlIHRoaXMgaXMg
Y29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZQo+PiBmaWxlLiBJZiB3ZSB3YW50IHRvIG9t
aXQgY29tcGFyaXNvbiBhZ2FpbnN0IDAsIHRoZW4gdGhpcyBzaG91bGQgYmUgaW4gYQo+PiBzZXBh
cmF0ZSBwYXRjaGVzIGNvbnZlcnRpbmcgdGhlIGZpbGUuCj4+Cj4+IMKgwqDCoMKgIENoYW5nZXMg
aW4gdjI6Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBGaXggdHlwb2VzIGluIHRoZSBjb21taXQgbWVz
c2FnZQo+PiDCoMKgwqDCoMKgwqDCoMKgIC0gVXNlIC1FRVhJU1QgaW5zdGVhZCBvZiAtRUlOVkFM
Cj4+IC0tLQo+PiDCoCB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgMTggKysrKysrKysrKyst
LS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyBiL3hlbi9h
cmNoL3g4Ni9tbS9oYXAvaGFwLmMKPj4gaW5kZXggMzEzNjJhMzFiNi4uNDk3NGJkMTNkNCAxMDA2
NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvbW0vaGFwL2hhcC5jCj4+IEBAIC00NDUsNiArNDQ1LDEzIEBAIGludCBoYXBfZW5hYmxlKHN0
cnVjdCBkb21haW4gKmQsIHUzMiBtb2RlKQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBpOwo+
PiDCoMKgwqDCoMKgIGludCBydiA9IDA7Cj4+ICvCoMKgwqAgaWYgKCBtb2RlICE9IChQR19leHRl
cm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cykgKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gK8KgwqDCoCAvKiBUaGUgZnVuY3Rpb24gY2FuIG9ubHkg
YmUgY2FsbGVkIG9uY2UgKi8KPj4gK8KgwqDCoCBpZiAoIGQtPmFyY2gucGFnaW5nLm1vZGUgIT0g
MCApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVFWElTVDsKPj4gKwo+PiDCoMKgwqDCoMKg
IGRvbWFpbl9wYXVzZShkKTsKPj4gwqDCoMKgwqDCoCBvbGRfcGFnZXMgPSBkLT5hcmNoLnBhZ2lu
Zy5oYXAudG90YWxfcGFnZXM7Cj4+IEBAIC00NjUsMTMgKzQ3MiwxMCBAQCBpbnQgaGFwX2VuYWJs
ZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKPj4gwqDCoMKgwqDCoCBkLT5hcmNoLnBhZ2lu
Zy5hbGxvY19wYWdlID0gaGFwX2FsbG9jX3AybV9wYWdlOwo+PiDCoMKgwqDCoMKgIGQtPmFyY2gu
cGFnaW5nLmZyZWVfcGFnZSA9IGhhcF9mcmVlX3AybV9wYWdlOwo+PiAtwqDCoMKgIC8qIGFsbG9j
YXRlIFAybSB0YWJsZSAqLwo+PiAtwqDCoMKgIGlmICggbW9kZSAmIFBHX3RyYW5zbGF0ZSApCj4+
IC3CoMKgwqAgewo+PiAtwqDCoMKgwqDCoMKgwqAgcnYgPSBwMm1fYWxsb2NfdGFibGUocDJtX2dl
dF9ob3N0cDJtKGQpKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmICggcnYgIT0gMCApCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCAvKiBh
bGxvY2F0ZSBQMk0gdGFibGUgKi8KPj4gK8KgwqDCoCBydiA9IHAybV9hbGxvY190YWJsZShwMm1f
Z2V0X2hvc3RwMm0oZCkpOwo+PiArwqDCoMKgIGlmICggcnYgIT0gMCApCj4+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPj4gwqDCoMKgwqDCoCBmb3IgKCBpID0gMDsgaSA8IE1BWF9ORVNURURQ
Mk07IGkrKyApCj4+IMKgwqDCoMKgwqAgewo+Pgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
