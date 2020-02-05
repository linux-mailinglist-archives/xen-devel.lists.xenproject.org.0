Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012441532DA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLdX-0003fa-CP; Wed, 05 Feb 2020 14:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izLdV-0003fV-Ma
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:26:37 +0000
X-Inumbo-ID: 83fd8c0e-4823-11ea-910b-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83fd8c0e-4823-11ea-910b-12813bfff9fa;
 Wed, 05 Feb 2020 14:26:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y17so2977233wrh.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 06:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bd8LqZENuxgDGWlE670dF4X3ZdjP3QN8mTRV/0oNI/Y=;
 b=jWpLSuTfNsEn1iEFqTxHrYW1DfF2rAKVjVJqE/ytkmRRudlpz6ZZ4SsKPmzAtZP6jk
 +oX3jQ4+3TdsMWhwSw9tQ9a23sWJVBDO8rlZ864zaEsypGGwMTV0nU8T21uX54w6TqM5
 UJc3Wv70tKTnwvkQSNRcE7Hj5kJIF42pdk91ZPLeyhE7fTcvDmbYd/th8+qyGt1J0ynK
 Ly3LNzM3FpaHEYEmD4ZtoKaoGGro4cLm4TBj9kNQdqzfQf/miwxJRLJxbBjqxeXYlAGY
 yIcTX5nOIUJz1w09FZ8KSKmkUSRdaxg62ZNA4waA+8ecoxANXAB7TaQOrtb/nVcfDJmC
 t+zg==
X-Gm-Message-State: APjAAAUUdPPkO1xHvgVCsMLUwKXfdNAC9JRrAyjIPM25rvyTBqCjjUHJ
 M4K5iIVrnWLPbSM7PQuT1L4=
X-Google-Smtp-Source: APXvYqxk/sKRjrf+xtotbHV3jCqJpriMAbYYl+zaKqhMPTESMgFKRF9+P+rwFczVZA/lhG0OKR974w==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr28996500wrq.331.1580912795992; 
 Wed, 05 Feb 2020 06:26:35 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id t1sm8664814wma.43.2020.02.05.06.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 06:26:35 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204133357.32101-1-julien@xen.org>
 <c24750e9-427b-1208-d220-f5c06e543966@suse.com>
 <3199dd4d-1b3e-4ba8-9f76-6a6ed0c7c067@xen.org>
 <93abbe1a-d6f5-1322-f1a2-5f0fa3393de8@suse.com>
 <55b1a771-04df-03ac-9ff5-e3d69e29101b@xen.org>
 <ef6b6b47-e7a8-f465-825c-960c0639e5c8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b904491-2115-7bff-c770-a184c1dfd780@xen.org>
Date: Wed, 5 Feb 2020 14:26:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ef6b6b47-e7a8-f465-825c-960c0639e5c8@suse.com>
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

SGkgSmFuLAoKT24gMDUvMDIvMjAyMCAxMzozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUu
MDIuMjAyMCAxMjoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKYW4sCj4+Cj4+IE9uIDA0
LzAyLzIwMjAgMTU6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDQuMDIuMjAyMCAxNDo1
MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAwNC8wMi8yMDIwIDEzOjQw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDQuMDIuMjAyMCAxNDozMywgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+Pj4+Pj4gQXQgdGhlIG1vbWVudCwgYXNzaWduX3BhZ2VzKCkgcmVsaWVzIG9u
IFBHX3N0YXRlX2ludXNlIHRvIGJlIDAuIFRoaXMKPj4+Pj4+IG1ha2VzIHRoZSBjb2RlIHNsaWdo
dGx5IG1vcmUgZGlmZmljdWx0IHRvIHVuZGVyc3RhbmQuCj4+Pj4+Cj4+Pj4+IEkgY2FuIGNlcnRh
aW5seSBzZWUgd2hlcmUgeW91J3JlIGNvbWluZyBmcm9tLCBidXQgLi4uCj4+Pj4+Cj4+Pj4+PiAt
LS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4+Pj4gKysrIGIveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMKPj4+Pj4+IEBAIC0yMjg2LDEwICsyMjg2LDExIEBAIGludCBhc3NpZ25fcGFnZXMo
Cj4+Pj4+PiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDEgPDwgb3JkZXIpOyBpKysgKQo+Pj4+
Pj4gICAgICAgICB7Cj4+Pj4+PiAgICAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBn
W2ldKSA9PSBOVUxMKTsKPj4+Pj4+IC0gICAgICAgIEFTU0VSVCghcGdbaV0uY291bnRfaW5mbyk7
Cj4+Pj4+PiArICAgICAgICBBU1NFUlQocGFnZV9zdGF0ZV9pcygmcGdbaV0sIGludXNlKSk7Cj4+
Pj4+PiArICAgICAgICBBU1NFUlQoIShwZ1tpXS5jb3VudF9pbmZvICYgKH5QR0Nfc3RhdGUpKSk7
Cj4+Pj4+Cj4+Pj4+IC4uLiBJIHRoaW5rIHRoaXMgb25lIGlzIGJldHRlciBpbiBpdHMgb3JpZ2lu
YWwgZm9ybS4gQW4gb3B0aW9uCj4+Pj4+IG1pZ2h0IGJlIHRvIHB1dCBhIEJVSUxEX0JVR19PTigp
IG5leHQgdG8gaXQuCj4+Pj4KPj4+PiBJIHdhbnQgdG8gYXZvaWQgYSBCVUlMRF9CVUdfT04oKSBp
ZiBwb3NzaWJsZS4gSSBqdXN0IHJlYWxpemVkLCBJIGNvdWxkCj4+Pj4gc2ltcGxpZnkgdG8gIihw
Z1tpXS5jb3VudF9pbmZvICE9IFBHQ19zdGF0ZV9pbnVzZSkiLgo+Pj4+Cj4+Pj4gV291bGQgdGhh
dCBiZSBtb3JlIHN1aXRhYmxlPwo+Pj4KPj4+IFllcywgY2VydGFpbmx5Lgo+Pj4KPj4+IEhvd2V2
ZXIsIGlzbid0IHRoZSBBU1NFUlQoKSBpdHNlbGYgd3Jvbmc/IFdlIGRvbid0IGhvbGQgdGhlIGhl
YXAgbG9jawo+Pj4gaGVyZSwgc28gbWFya19wYWdlX29mZmxpbmUoKSBjb3VsZCB0cmFuc2l0aW9u
IHRoZSBwYWdlIGZyb20gaW51c2UgdG8KPj4+IG9mZmxpbmluZyAoYW5kIHBvc3NpYmx5IGFsc28g
c2V0IFBHQ19icm9rZW4gb24gaXQpIGF0IGFueSBwb2ludCBpbgo+Pj4gdGltZS4gVGhpcyB3YXNu
J3Qgb2J2aW91cyB3aXRob3V0IHRoZSB0d28gUEdDX2ludXNlIHVzZXMgeW91IGFkZCwgYnV0Cj4+
PiBiZWNvbWVzIHByZXR0eSBhcHBhcmVudCB3aXRoIHRoZW0uIE9mIGNvdXJzZSB0aGUgc2ltcGxl
IGFzc2lnbm1lbnQKPj4+IHRoYXQgeW91IGFkanVzdCBmdXJ0aGVyIGRvd24gdGhlbiBhbHNvIGNh
bid0IGJlIGEgc2ltcGxlIGFzc2lnbm1lbnQKPj4+IGFueW1vcmUuCj4+Cj4+IFlvdSBhcmUgcmln
aHQsIGFzc2lnbl9wYWdlcygpIGNvdWxkIHJhY2Ugd2l0aCBtYXJrX3BhZ2Vfb2ZmbGluZSgpLiBX
ZQo+PiB3b3VsZCBuZWVkIHRvIHVzZSBhIGNtcHhjaGcoKSBsb29wIHRvIGNoYW5nZSB0eXBlLiBJ
ZiBvbmUgb2YgdGhlIHBhZ2UgaXMKPj4gZ2V0dGluZyBvZmZsaW5lZCwgdGhlbiB3ZSB3b3VsZCBu
ZWVkIHRvIHJldmVydCBhbGwgdGhlIGNoYW5nZXMgYW5kCj4+IHJldHVybiBhbiBlcnJvci4KPiAK
PiBJJ20gbm90IHN1cmUgd2UgbmVlZCB0byBnbyB0aGlzIGZhci4gVGhlIGNoYW5nZSBvZiBwYWdl
IHN0YXRlCj4gaGFwcGVuaW5nIGJlaGluZCBhc3NpZ25fcGFnZXMoKScgYmFjayBpcyBubyBkaWZm
ZXJlbnQgZnJvbSBpdAo+IGhhcHBlbmluZyBhZnRlciBhc3NpZ25fcGFnZXMoKSBpcyBkb25lLgoK
VGhlcmUgd2lsbCBiZSBhIHNsaWdodCBkaWZmZXJlbmNlIGZvciB0aGUgb2ZmbGluZSBjb2RlLiBB
ZnRlciAKYXNzaWduX3BhZ2VzKCkgd2Ugd291bGQgcmV0dXJuIFBHX09GRkxJTkVfT1dORUQuLi4g
d2hpbGUgaW4gdGhlIG1pZGRsZSAKb2YgYXNzaWduX3BhZ2VzKCkgd2Ugd291bGQgcmV0dXJuIFBH
X09GRkxJTkVfQU5ZTU9VUy4KCkkgd2FzIGNvbmNlcm4gb2YgdGhlIGludGVyYWN0aW9uLiBCdXQg
aXQgbG9va3MgbGlrZSB0aGlzIHdhcyB0YWtlbiBjYXJlIApwZXIgdGhlIGNvbW1lbnQgaW4gb2Zm
bGluZV9wYWdlcyAodGhvdWdoIHRoZSBjb21tZW50IGlzIHNsaWdodGx5IGNvbmZ1c2luZykuCgpB
bnl3YXksIHRyeSB0byByZXZlcnQgdGhlIGNoYW5nZSB3b3VsZCBiZSByZWFsIHBhaW4uIFNvIHdl
IGNhbiBhdm9pZCBpdCAKdGhlbiBpdCBpcyBtdWNoIGJldHRlciA6KS4KCj4gQWxsIHdlIG5lZWQg
dG8gbWFrZSBzdXJlIGlzCj4gdGhhdCB3ZSBkb24ndCBjbG9iYmVyIHRoZSBzdGF0ZSBjaGFuZ2Uu
Cj4gCj4gSSdtIGFsc28gbm90IHN1cmUgYSBjbXB4Y2hnIGxvb3AgaXMgbmVlZGVkIGhlcmUuIEFj
cXVpcmluZyBhbmQKPiByZWxlYXNpbmcgdGhlIGhlYXAgbG9jayBtYXkgZG8sIHRvby4gWW91J2xs
IGZpbmQgYW4gZXhhbXBsZSBvZiB0aGlzCj4gZWxzZXdoZXJlIGluIHRoZSBzYW1lIGZpbGUsIGlp
cmMuCgpJIHdvdWxkIGhhdmUgdGhvdWdodCB0aGUgY21weGNoZygpIHdvdWxkIGJlIHlvdXIgcHJl
ZmVyZW5jZS4gQW55d2F5LCBpZiAKeW91IGFyZSBoYXBweSB3aXRoIHRoZSBsb2NrLCB0aGVuIHRo
aXMgaXMgYmV0dGVyIGFuZCBsZXNzIGNvZGUuCgpUaGUgbG9ja2luZyBvcmRlcmluZyB3b3VsZCBh
bHNvIGJlIGZpbmUgYXMgZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSAKYWxyZWFkeSByZXF1ZXN0
IHRoZSBkLT5wYWdlX2FsbG9jX2xvY2sgdG8gYmUgdGFrZW4gZmlyc3QuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
