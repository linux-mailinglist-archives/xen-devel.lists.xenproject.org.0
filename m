Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22D15BEA0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:46:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Dqx-0004vH-JX; Thu, 13 Feb 2020 12:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2Dqv-0004vC-Vb
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:44:21 +0000
X-Inumbo-ID: 8dee007c-4e5e-11ea-b897-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dee007c-4e5e-11ea-b897-12813bfff9fa;
 Thu, 13 Feb 2020 12:44:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so6482209wrd.9
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 04:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdcWjQZSKPXuRjvwVuBfEIWIDyEhqHRIJDKKK9o9oDo=;
 b=lZeqMuf3Ke6RtIqxiMilMAGzZhKmLLjYX1ob/1UoLQAf70JdyfwWa6BUsCJ/iJaIvV
 M/wXkD5C8wf0lWekNEJ8Lopi/S0CJRtv5TVVa8/5WhO4Y9/KzylWVsbJUc5rgYigHYLt
 yiB2rD8JY66HUmpuuW15km28ZCuUpzsQ4IjWh+ODF/bPngtjqxVA6S8SAG/+IJB4NHJY
 D6Vu2Z1vP00GJ4EvYdmgDZlfaeoyKowuHU1cN+eOF2Fz6nT40RAUyZjrUVREWsi8S5ug
 +be5PYG+OpzKe5HeZd9dCpe66Atwub3qPWz8i0+9Y6Q/8jp3mdgO1J2WGxgu/wWQGUXv
 4CKw==
X-Gm-Message-State: APjAAAXNTjBdGiK4/IwzHCAJ1fk4ohrntBYvm57AIHa6jqrjwtqCCE9b
 8ktgFKFCFppsTJueA4rdDds=
X-Google-Smtp-Source: APXvYqwVub8a/ng6vuW6mjX/FcuIgvVt/82GKtzQ05xHyNvefD1HQDcgt2PxNb0yKwjDF7qQMwwyWw==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr21870737wro.421.1581597859984; 
 Thu, 13 Feb 2020 04:44:19 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id f1sm2747806wro.85.2020.02.13.04.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 04:44:19 -0800 (PST)
To: xen-devel@lists.xenproject.org
References: <20200204130614.15166-1-julien@xen.org>
 <20200204130614.15166-3-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3c1f1f91-6350-57de-2134-ab98bd4186d4@xen.org>
Date: Thu, 13 Feb 2020 13:44:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204130614.15166-3-julien@xen.org>
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

SGksCgpHZW50bGUgcGluZy4KCkNoZWVycywKCk9uIDA0LzAyLzIwMjAgMTQ6MDYsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+IAo+
IFVubGlrZSBzaGFkb3dfZW5hYmxlKCksIGhhcF9lbmFibGUoKSBjYW4gb25seSBiZSBjYWxsZWQg
b25jZSBkdXJpbmcKPiBkb21haW4gY3JlYXRpb24gYW5kIHdpdGggdGhlIG1vZGUgZXF1YWwgdG8g
bW9kZSBlcXVhbCB0bwo+IFBHX2V4dGVybmFsIHwgUEdfdHJhbnNsYXRlIHwgUEdfcmVmY291bnRz
Lgo+IAo+IElmIGl0IHdlcmUgY2FsbGVkIHR3aWNlLCB0aGVuIHdlIG1pZ2h0IGhhdmUgc29tZXRo
aW5nIGludGVyZXN0aW5nCj4gcHJvYmxlbSBhcyB0aGUgcDJtIHRhYmxlcyB3b3VsZCBiZSByZS1h
bGxvY2F0ZWQgKGFuZCB0aGVyZWZvcmUgYWxsIHRoZQo+IG1hcHBpbmdzIHdvdWxkIGJlIGxvc3Qp
Lgo+IAo+IEFkZCBjb2RlIHRvIHNhbml0eSBjaGVjayB0aGUgbW9kZSBhbmQgdGhhdCB0aGUgZnVu
Y3Rpb24gaXMgb25seSBjYWxsZWQKPiBvbmNlLiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBhbiBp
ZiBjaGVja2luZyB0aGF0IFBHX3RyYW5zbGF0ZSBpcyBzZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPiAKPiAtLS0KPiAKPiBJdCBpcyBub3Qg
ZW50aXJlbHkgY2xlYXIgd2hlbiBQR190cmFuc2xhdGUgd2FzIGVuZm9yY2VkLgo+IAo+IEkga2Vl
cCB0aGUgY2hlY2sgIT0gMCBiZWNhdXNlIHRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0
IG9mIHRoZQo+IGZpbGUuIElmIHdlIHdhbnQgdG8gb21pdCBjb21wYXJpc29uIGFnYWluc3QgMCwg
dGhlbiB0aGlzIHNob3VsZCBiZSBpbiBhCj4gc2VwYXJhdGUgcGF0Y2hlcyBjb252ZXJ0aW5nIHRo
ZSBmaWxlLgo+IAo+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgICAtIEZpeCB0eXBvZXMg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlCj4gICAgICAgICAgLSBVc2UgLUVFWElTVCBpbnN0ZWFkIG9m
IC1FSU5WQUwKPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgfCAxOCArKysrKysr
KysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIGIveGVu
L2FyY2gveDg2L21tL2hhcC9oYXAuYwo+IGluZGV4IDMxMzYyYTMxYjYuLjQ5NzRiZDEzZDQgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMKPiBAQCAtNDQ1LDYgKzQ0NSwxMyBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1
Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKPiAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiAgICAgICBp
bnQgcnYgPSAwOwo+ICAgCj4gKyAgICBpZiAoIG1vZGUgIT0gKFBHX2V4dGVybmFsIHwgUEdfdHJh
bnNsYXRlIHwgUEdfcmVmY291bnRzKSApCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+
ICsgICAgLyogVGhlIGZ1bmN0aW9uIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNlICovCj4gKyAgICBp
ZiAoIGQtPmFyY2gucGFnaW5nLm1vZGUgIT0gMCApCj4gKyAgICAgICAgcmV0dXJuIC1FRVhJU1Q7
Cj4gKwo+ICAgICAgIGRvbWFpbl9wYXVzZShkKTsKPiAgIAo+ICAgICAgIG9sZF9wYWdlcyA9IGQt
PmFyY2gucGFnaW5nLmhhcC50b3RhbF9wYWdlczsKPiBAQCAtNDY1LDEzICs0NzIsMTAgQEAgaW50
IGhhcF9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgdTMyIG1vZGUpCj4gICAgICAgZC0+YXJjaC5w
YWdpbmcuYWxsb2NfcGFnZSA9IGhhcF9hbGxvY19wMm1fcGFnZTsKPiAgICAgICBkLT5hcmNoLnBh
Z2luZy5mcmVlX3BhZ2UgPSBoYXBfZnJlZV9wMm1fcGFnZTsKPiAgIAo+IC0gICAgLyogYWxsb2Nh
dGUgUDJtIHRhYmxlICovCj4gLSAgICBpZiAoIG1vZGUgJiBQR190cmFuc2xhdGUgKQo+IC0gICAg
ewo+IC0gICAgICAgIHJ2ID0gcDJtX2FsbG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7Cj4g
LSAgICAgICAgaWYgKCBydiAhPSAwICkKPiAtICAgICAgICAgICAgZ290byBvdXQ7Cj4gLSAgICB9
Cj4gKyAgICAvKiBhbGxvY2F0ZSBQMk0gdGFibGUgKi8KPiArICAgIHJ2ID0gcDJtX2FsbG9jX3Rh
YmxlKHAybV9nZXRfaG9zdHAybShkKSk7Cj4gKyAgICBpZiAoIHJ2ICE9IDAgKQo+ICsgICAgICAg
IGdvdG8gb3V0Owo+ICAgCj4gICAgICAgZm9yICggaSA9IDA7IGkgPCBNQVhfTkVTVEVEUDJNOyBp
KysgKQo+ICAgICAgIHsKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
