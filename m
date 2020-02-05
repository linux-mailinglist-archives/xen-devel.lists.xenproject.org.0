Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0DB1529DF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:26:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izInD-00032E-Bw; Wed, 05 Feb 2020 11:24:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izInB-00031q-EO
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:24:25 +0000
X-Inumbo-ID: 0ffd5d20-480a-11ea-90d5-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ffd5d20-480a-11ea-90d5-12813bfff9fa;
 Wed, 05 Feb 2020 11:24:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so2265193wrr.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 03:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oRN0qAxZZFm3i0HrBasr3RypDg+hxfFdFwJxsqubVLE=;
 b=YiYEZHg3NAL3hWH87YztZUHyrUH9m9eT0kGQ2X186kudMVbagt1cqkpEpuTNlyZol7
 qFU6qb51JYx6+N4w1SHTbeKD4znP1be66PTvTQqGo4VtMfbKtcgJXqQon2cP/B+Gp/Ht
 5seIiVfoi5nSbpn8Rdukl8jOkVzuMr980zfRS7n+8dz5go8TjUP3ssdqS23P3x4MPx18
 2g9LPjaoHMLsbIMc3kJhY3jgNhMqQCCYUBONLKKT3NxYmvfqscVBEomVzKh3z5HuD2T9
 /bVsla06S2ICqeHxnAc+u8WT/hcyUdlvYcmKmOoqdmwOOuWz3SzwjdrL3Pf3/0rfuUX7
 2hdg==
X-Gm-Message-State: APjAAAW/VtEOjkMINlNWboBtDa0Iq5pWKEf1jY5ugDQTUyQ9raKFFMQO
 m9Oox/FvNQIfN3mthckvbEk=
X-Google-Smtp-Source: APXvYqymGwAxYuLxrHlr7p34gwEHhzBv+VLwF+nIrstWlNpsOzTDEHoH8zT40KeVHa1QcxPCHlyjDA==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr26687105wrv.333.1580901863915; 
 Wed, 05 Feb 2020 03:24:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id c4sm7675144wml.7.2020.02.05.03.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 03:24:23 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204133357.32101-1-julien@xen.org>
 <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
 <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
 <93abbe1a-d6f5-1322-f1a2-5f0fa3393de8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <55b1a771-04df-03ac-9ff5-e3d69e29101b@xen.org>
Date: Wed, 5 Feb 2020 11:24:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <93abbe1a-d6f5-1322-f1a2-5f0fa3393de8@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/mm: Avoid assuming PG_state_inuse == 0
 in assign_pages()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDQvMDIvMjAyMCAxNToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQu
MDIuMjAyMCAxNDo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAwNC8wMi8yMDIw
IDEzOjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA0LjAyLjIwMjAgMTQ6MzMsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+PiBBdCB0aGUgbW9tZW50LCBhc3NpZ25fcGFnZXMoKSByZWxpZXMg
b24gUEdfc3RhdGVfaW51c2UgdG8gYmUgMC4gVGhpcwo+Pj4+IG1ha2VzIHRoZSBjb2RlIHNsaWdo
dGx5IG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCj4+Pgo+Pj4gSSBjYW4gY2VydGFpbmx5
IHNlZSB3aGVyZSB5b3UncmUgY29taW5nIGZyb20sIGJ1dCAuLi4KPj4+Cj4+Pj4gLS0tIGEveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+
Pj4+IEBAIC0yMjg2LDEwICsyMjg2LDExIEBAIGludCBhc3NpZ25fcGFnZXMoCj4+Pj4gICAgICAg
IGZvciAoIGkgPSAwOyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQo+Pj4+ICAgICAgICB7Cj4+Pj4g
ICAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsKPj4+PiAt
ICAgICAgICBBU1NFUlQoIXBnW2ldLmNvdW50X2luZm8pOwo+Pj4+ICsgICAgICAgIEFTU0VSVChw
YWdlX3N0YXRlX2lzKCZwZ1tpXSwgaW51c2UpKTsKPj4+PiArICAgICAgICBBU1NFUlQoIShwZ1tp
XS5jb3VudF9pbmZvICYgKH5QR0Nfc3RhdGUpKSk7Cj4+Pgo+Pj4gLi4uIEkgdGhpbmsgdGhpcyBv
bmUgaXMgYmV0dGVyIGluIGl0cyBvcmlnaW5hbCBmb3JtLiBBbiBvcHRpb24KPj4+IG1pZ2h0IGJl
IHRvIHB1dCBhIEJVSUxEX0JVR19PTigpIG5leHQgdG8gaXQuCj4+Cj4+IEkgd2FudCB0byBhdm9p
ZCBhIEJVSUxEX0JVR19PTigpIGlmIHBvc3NpYmxlLiBJIGp1c3QgcmVhbGl6ZWQsIEkgY291bGQK
Pj4gc2ltcGxpZnkgdG8gIihwZ1tpXS5jb3VudF9pbmZvICE9IFBHQ19zdGF0ZV9pbnVzZSkiLgo+
Pgo+PiBXb3VsZCB0aGF0IGJlIG1vcmUgc3VpdGFibGU/Cj4gCj4gWWVzLCBjZXJ0YWlubHkuCj4g
Cj4gSG93ZXZlciwgaXNuJ3QgdGhlIEFTU0VSVCgpIGl0c2VsZiB3cm9uZz8gV2UgZG9uJ3QgaG9s
ZCB0aGUgaGVhcCBsb2NrCj4gaGVyZSwgc28gbWFya19wYWdlX29mZmxpbmUoKSBjb3VsZCB0cmFu
c2l0aW9uIHRoZSBwYWdlIGZyb20gaW51c2UgdG8KPiBvZmZsaW5pbmcgKGFuZCBwb3NzaWJseSBh
bHNvIHNldCBQR0NfYnJva2VuIG9uIGl0KSBhdCBhbnkgcG9pbnQgaW4KPiB0aW1lLiBUaGlzIHdh
c24ndCBvYnZpb3VzIHdpdGhvdXQgdGhlIHR3byBQR0NfaW51c2UgdXNlcyB5b3UgYWRkLCBidXQK
PiBiZWNvbWVzIHByZXR0eSBhcHBhcmVudCB3aXRoIHRoZW0uIE9mIGNvdXJzZSB0aGUgc2ltcGxl
IGFzc2lnbm1lbnQKPiB0aGF0IHlvdSBhZGp1c3QgZnVydGhlciBkb3duIHRoZW4gYWxzbyBjYW4n
dCBiZSBhIHNpbXBsZSBhc3NpZ25tZW50Cj4gYW55bW9yZS4KCllvdSBhcmUgcmlnaHQsIGFzc2ln
bl9wYWdlcygpIGNvdWxkIHJhY2Ugd2l0aCBtYXJrX3BhZ2Vfb2ZmbGluZSgpLiBXZSAKd291bGQg
bmVlZCB0byB1c2UgYSBjbXB4Y2hnKCkgbG9vcCB0byBjaGFuZ2UgdHlwZS4gSWYgb25lIG9mIHRo
ZSBwYWdlIGlzIApnZXR0aW5nIG9mZmxpbmVkLCB0aGVuIHdlIHdvdWxkIG5lZWQgdG8gcmV2ZXJ0
IGFsbCB0aGUgY2hhbmdlcyBhbmQgCnJldHVybiBhbiBlcnJvci4KCj4gCj4gU2luY2UgdGhpcyB3
b3VsZCBtb3ZlIHlvdSBxdWl0ZSBmYXIgYXdheSBmcm9tIHNpbXBseSBhIGNvc21ldGljCj4gcGF0
Y2ggKHRoZSBwcm9ibGVtIGFzIGEgd2hvbGUgbG9va3MgdG8gYmUgd2lkZXIgdGhhbiBqdXN0IHRo
ZSBvbmUKPiBjYXNlIGFib3ZlKSwgSSBjb3VsZCB1bmRlcnN0YW5kIGlmIHlvdSBkaWRuJ3Qgd2Fu
dCB0byBmaXggdGhpcyBhdAo+IHRoaXMgb2NjYXNpb24uIFlldCB0aGVuIEkgdGhpbmsgdGhlIHBh
dGNoIGRlc2NyaXB0aW9uIHNob3VsZG4ndCBnaXZlCj4gdGhlIGltcHJlc3Npb24gdGhhdCBhbGwg
ZWxzZSBpcyB3ZWxsLCBidXQgaW5zdGVhZCBhdCBsZWFzdCBvdXRsaW5lCj4gdGhlIGlzc3VlIChm
b3Igc29tZW9uZSBlbHNlIHRvIHBpY2sgdXAsIHBvc3NpYmx5IG1lKS4KCkkgYW0gaGFwcHkgdG8g
aGF2ZSBhIGxvb2sgYXQgaXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
