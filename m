Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0AEA00D1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 13:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2wCj-0001aN-TX; Wed, 28 Aug 2019 11:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2wCi-0001aF-8a
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 11:33:32 +0000
X-Inumbo-ID: a931c960-c987-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a931c960-c987-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566992011;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CxiM5/hJuSRPw0CNMFRYGshugGH2IbUcNS4o4cnOMlY=;
 b=VIcdYC2C9OlfvIz2ek1Zd1eutKJaB7D2yLLehb+DrkDdyE6xhRzZd9+i
 Zl5y/v4fvkWAD1JIVtioghUp7GEqJz3EaYP79WgH9UzUOVk/jCddmPPxO
 yD9w6VAKPieSRqyxpnMpOBwEjnT66vliazle8b4DPUwj2nO96wbr8Yfgy M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iqnMWLY9zw827d4G/2XljMwjMq6EIDOV4potOgAbzygQO75uvwiqNzXibKPs3qDRidhmruX8w3
 UnCGG3WJXKZfWyj6simqkBqW3UfCU90aoLUIOU9852/GrbXxBx7rrS7Ne4bwaYQ6xfissG6XI2
 XYyH7OCa/tL0UNjyibWnuYj8eAq3FjnQKka62R9obkGkAIa2iIoBQ2mcqwj+b2motZDFF+FNDb
 IREAZSrekjDq5rf1XdXZwq5k7W6YZ2tXcx/6vWVnUwHmXNJHRqwwYJEEbRQN7hD3EpmlTy3gxv
 SzQ=
X-SBRS: 2.7
X-MesageID: 4865346
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,440,1559534400"; 
   d="scan'208";a="4865346"
To: Jan Beulich <jbeulich@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
 <596e6cf6-ced2-1993-a7ff-7e865126730f@citrix.com>
 <965b2135-26b3-99d1-d5ea-9e8c69201ba7@suse.com>
 <89dc51a4-4db5-cd91-0d4a-4cf73eb0f80f@citrix.com>
 <d649c22f-a6f5-bacc-bef6-f4bed7da97d0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ef650a76-fdfd-034d-5ef4-ad08386bd3ab@citrix.com>
Date: Wed, 28 Aug 2019 12:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d649c22f-a6f5-bacc-bef6-f4bed7da97d0@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/6] x86emul: support INVPCID
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 PaulDurrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDgvMjAxOSAwODoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDguMjAxOSAx
OToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjcvMDgvMjAxOSAxNjo1MywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNy4wOC4yMDE5IDE3OjMxLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDAxLzA3LzIwMTkgMTI6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4+PiArKysgYi94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4+PiBAQCAtOTEyNCw2ICs5MTI2
LDQ4IEBAIHg4Nl9lbXVsYXRlKAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVCgh
c3RhdGUtPnNpbWRfc2l6ZSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+
Pj4+IMKgwqDCoCArwqDCoMKgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZjM4LCAweDgyKTogLyog
aW52cGNpZCByZWcsbTEyOCAqLwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmNwdV9tdXN0X2hhdmUo
aW52cGNpZCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5lcmF0ZV9leGNlcHRpb25faWYoZWEu
dHlwZSAhPSBPUF9NRU0sIEVYQ19VRCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnZW5lcmF0ZV9l
eGNlcHRpb25faWYoIW1vZGVfcmluZzAoKSwgRVhDX0dQLCAwKTsKPj4+Pj4gKwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCAocmMgPSBvcHMtPnJlYWQoZWEubWVtLnNlZywgZWEubWVtLm9mZiwg
bW12YWxwLCAxNiwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGN0eHQpKSAhPSBYODZFTVVMX09LQVkgKQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRvbmU7Cj4+Pj4KPj4+PiBUaGUgYWN0dWFsIGJlaGF2aW91
ciBpbiBoYXJkd2FyZSBpcyB0byBub3QgZXZlbiByZWFkIHRoZSBtZW1vcnkKPj4+PiBvcGVyYW5k
Cj4+Pj4gaWYgaXQgaXMgdW51c2VkLsKgIFlvdSBjYW4gZGVtb25zdHJhdGUgdGhpcyBieSBkb2lu
ZyBhbiBBTExfSU5DX0dMT0JBTAo+Pj4+IGZsdXNoIHdpdGggYSBub24tY2Fub25pY2FsIG1lbW9y
eSBvcGVyYW5kLgo+Pj4KPj4+IE9oLCB0aGF0J3Mgc29ydCBvZiB1bmV4cGVjdGVkLgo+Pgo+PiBJ
dCBtYWtlcyBzZW5zZSBhcyBhbiBvcHRpbWlzYXRpb24uwqAgVGhlcmUgaXMgbm8gcG9pbnQgZmV0
Y2hpbmcgYSBtZW1vcnkKPj4gb3BlcmFuZCBpZiB5b3UncmUgbm90IGdvaW5nIHRvIHVzZSBpdC4K
Pj4KPj4gRnVydGhlcm1vcmUsIGl0IGFsbW9zdCBjZXJ0YWlubHkgcmVkdWNlcyB0aGUgbWljcm9j
b2RlIGNvbXBsZXhpdHkuCj4KPiBQcm9iYWJseS4gRm9yIGNvbXBhcmlzb24gSSBoYWQgYmVlbiB0
aGlua2luZyBvZiAwLWJpdCBzaGlmdHMgaW5zdGVhZCwKPiB3aGljaCBkbyByZWFkIHRoZWlyIG1l
bW9yeSBvcGVyYW5kcy4gRXZlbiBTSExEL1NIUkQsIHdoaWNoIGF0IGxlYXN0Cj4gd2l0aCBzaGlm
dCBjb3VudCBpbiAlY2wgbG9vayB0byBiZSB1bmlmb3JtbHkgbWljcm9jb2RlZCwgYWNjZXNzIHRo
ZWlyCj4gbWVtb3J5IG9wZXJhbmQgaW4gdGhpcyBjYXNlLgoKQWdhaW4sIHRoYXQgaXNuJ3Qgc3Vy
cHJpc2luZyB0byBtZS4KCllvdSB3aWxsIG5ldmVyIHNlZSBhIHNoaWZ0IGJ5IDAgYW55d2hlcmUg
YnV0IGEgdGVzdCBzdWl0ZSwgYmVjYXVzZSBpdCBpcwp3YXN0ZWQgZWZmb3J0LsKgIFRoZXJlZm9y
ZSwgYW55IGF0dGVtcHQgdG8gc3BlY2lhbCBjYXNlIDAgd2lsbCByZWR1Y2UKcGVyZm9ybWFuY2Ug
aW4gYWxsIHByb2R1Y3Rpb24gc2NlbmFyaW9zLgoKU0hMRC9TSFJEJ3MgbWljcm9jb2RlZC1uZXNz
IGNvbWVzIGZyb20gaGF2aW5nIHRvIGNvbnN0cnVjdCBhIGRvdWJsZQp3aWR0aCByb3RhdGUuwqAg
SW4gdGhlIHdvcnN0IGNhc2UsIHRoaXMgaXMgdHdvIGluZGVwZW5kZW50IHJvdGF0ZSB1b3BzCmlz
c3VlZCBpbnRvIHRoZSBwaXBlbGluZSwgYW5kIGVub3VnaCBBTFUgbG9naWMgdG8gY29tYmluZSB0
aGUgcmVzdWx0cy7CoApJZiB5b3Ugb2JzZXJ2ZSwgc29tZSBDUFVzIGhhdmUgdGhlIDMyYml0IHZl
cnNpb25zIG5vbi1taWNyb2NvZGVkLCB3aGljaAp3aWxsIHByb2JhYmx5IGJlIHRoZSBmcm9udGVu
ZCBjb252ZXJ0aW5nIHVwIHRvIGEgNjRiaXQgdW9wIGludGVybmFsbHkuCgpJTlZ7UENJRCxFUFQs
VlBJRH0gYXJlIGFsbCBjb25jZXB0dWFsbHkgb2YgdGhlIGZvcm06Cgpzd2l0Y2ggKCByZWcgKQp7
CsKgwqDCoCAuLi4gY29uc3RydWN0IHRsYiB1b3AuCn0KZGlzcGF0Y2ggdGxiIHVvcC4KCmFuZCBh
dm9pZGluZyBvbmUgb3IgdHdvIG1lbW9yeSByZWFkcyB3aWxsIG1ha2UgYSBtZWFuaW5nZnVsIHBl
cmZvcm1hbmNlCmltcHJvdmVtZW50LgoKPgo+Pj4+IMKgwqAgSW4gcGFydGljdWxhciwgSSB3YXMK
Pj4+PiBpbnRlbmRpbmcgdG8gdXNlIHRoaXMgYmVoYXZpb3VyIHRvIHNwZWVkIHVwIGhhbmRsaW5n
IG9mIElOVntFUFQsVlBJRH0KPj4+PiB3aGljaCB0cmFwIHVuY29uZGl0aW9uYWxseS4KPj4+Cj4+
PiBXaGljaCB3b3VsZCByZXF1aXJlIHRoZSBvYnNlcnZlZCBiZWhhdmlvciB0byBhbHNvIGJlIHRo
ZSBTRE0KPj4+IG1hbmRhdGVkIG9uZSwgd291bGRuJ3QgaXQ/Cj4+Cj4+IElmIHlvdSByZWNhbGws
IHdlIGRpc2N1c3NlZCB0aGlzIHdpdGggSnVuIGluIEJ1ZGFwZXN0LsKgIEhpcyBvcGluaW9uIHdh
cwo+PiBubyBpbnN0cnVjdGlvbnMgZ28gb3V0IG9mIHRoZWlyIHdheSB0byBjaGVjayBwcm9wZXJ0
aWVzIHdoaWNoIGRvbid0Cj4+IG1hdHRlciAtIGl0IGlzIGp1c3QgdGhhdCBpdCBpcyBmYXIgbW9y
ZSBvYnZpb3VzIHdpdGggaW5zdHJ1Y3Rpb25zIGxpa2UKPj4gdGhlc2Ugd2hlcmUgdGhlIGNvbXBs
ZXhpdHkgaXMgbXVjaCBncmVhdGVyLgo+Pgo+PiBObyBwcm9kdWN0aW9uIHN5c3RlbXMgYXJlIGdv
aW5nIHRvIHJlbHkgb24gZ2V0dGluZyBmYXVsdHMsIGJlY2F1c2UKPj4gdGFraW5nIGEgZmF1bHQg
ZG9lc24ndCBwcm9kdWNlIHVzZWZ1bCB3b3JrLgo+Cj4gTWF5YmUgSSBtaXN1bmRlcnN0b29kIHlv
dXIgZWFybGllciByZXBseSB0aGVuOiBJIHJlYWQgaXQgdG8gbWVhbiB5b3UKPiB3YW50IHRvIGxl
dmVyYWdlIElOVlBDSUQgbm90IGZhdWx0aW5nIG9uICJiYWQiIG1lbW9yeSBvcGVyYW5kcyBmb3IK
PiBmbHVzaCB0eXBlcyBub3QgdXNpbmcgdGhlIG1lbW9yeSBvcGVyYW5kLiBCdXQgcGVyaGFwcyB5
b3UgbWVyZWx5Cj4gbWVhbnQgeW91IHdhbnQgdG8gbGV2ZXJhZ2UgdGhlIGluc24gbm90IF9hY2Nl
c3NpbmdfIGl0cyBtZW1vcnkKPiBvcGVyYW5kIGluIHRoaXMgY2FzZT8KCkNvcnJlY3QuwqAgSXRz
IHRvIGF2b2lkIHVubmVjZXNzYXJ5IHBhZ2Ugd2Fsa3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
