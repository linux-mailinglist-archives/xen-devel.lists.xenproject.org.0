Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D533AD7C8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:18:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Hda-0008AD-R1; Mon, 09 Sep 2019 11:15:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Hda-0008A8-2e
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:15:14 +0000
X-Inumbo-ID: 1753a994-d2f3-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1753a994-d2f3-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 11:15:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF418ACD9;
 Mon,  9 Sep 2019 11:15:11 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190903140112.18806-1-aisaila@bitdefender.com>
 <569c7674-4c6e-765a-4071-884bca7d0412@suse.com>
 <7fca65bb-8936-b8c9-80df-3be4675c7b42@bitdefender.com>
 <047d5951-c922-8111-aa39-2bb0bebc5721@suse.com>
 <749faa64-7b23-0149-ca0f-00ebd2754943@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9de8e959-139b-29cd-c4b4-24713106f71f@suse.com>
Date: Mon, 9 Sep 2019 13:15:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <749faa64-7b23-0149-ca0f-00ebd2754943@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMzowMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDkuMDkuMjAxOSAxMzo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA5LjIw
MTkgMTI6MDEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gT24gMDYuMDkuMjAx
OSAxODo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDkuMjAxOSAxNjowMSwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+ICAgICAgICB9Cj4+Pj4+ICsgICAgLyog
Q2hlY2sgaWYgZW55IHZtX2V2ZW50IHdhcyBzZW50ICovCj4+Pj4KPj4+PiAiYW55IiBhbmQgcGxl
YXNlIGFkZCBibGFuayBsaW5lIGFoZWFkIG9mIHlvdXIgYWRkaXRpb24uCj4+Pgo+Pj4gSSB3aWxs
IGNvcnJlY3QgdGhpcy4KPj4+Cj4+Pj4KPj4+Pj4gKyAgICBpZiAoIGVyciApCj4+Pj4+ICsgICAg
ICAgIGdvdG8gb3V0Owo+Pj4+Cj4+Pj4gQW5kIHdhaXQgLSB3aHkgZG9lcyB0aGlzIHNpdCBhZnRl
ciB0aGUgbG9vcD8gSXMgdGhhdCBhIHJlLWJhc2luZwo+Pj4+IG1pc3Rha2UgZnJvbSB3aGVuIHlv
dSBoYWQgcHV0IG9uIHRvcCBvZiBteSB1bmNvbW1pdHRlZCBwYXRjaD8KPj4+Cj4+PiBUaGlzIGlz
IGRvbmUgdG8gc2tpcCB0aGUgbWFwcGluZyBwYXJ0IGRvd24gdGhlIGxpbmUuIElmIHRoZXJlIGlz
IGFuCj4+PiBlcnJvciB0aGVuIHdlIGhhdmUgdG8gcmV0dXJuIF9pdF8gYW5kIG5vdCB0aGUgbWFw
cGluZy4KPj4KPj4gQnV0IGFmdGVyIHJlLWJhc2luZyB5b3UgY291bGQgKGFuZCBoZW5jZSBpbW8g
c2hvdWxkKSAiZ290byBvdXQiCj4+IHJpZ2h0IGZyb20gdGhlIGNvZGUgYmxvYiB5b3UgYWRkIHRv
IHRoZSBsb29wLiBXaGljaCB3b3VsZCB0aGVuCj4+IGFsc28gZWxpbWluYXRlIHRoZSBuZWVkIGZv
ciBvdGhlciAiZXJyIiByZWxhdGVkIGFkanVzdG1lbnRzIHlvdQo+PiBtYWtlLgo+Pgo+IAo+IFNv
IHlvdSB3YW50IG1lIHRvIGhhdmUgdGhpcyBwYXRjaCBiYXNlIG9uIHlvdXIgKHg4Ni9IVk06IGNv
cnJlY3QgCj4gaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoKSBmb3IgbXVsdGktcGFnZSBjYXNlKSBw
YXRjaC4KCk5vLCBleHBsaWNpdGx5IG5vdC4gVGhlICJyZS1iYXNpbmciIEkgdXNlZCBhYm92ZSB3
YXMgcmVmZXJyaW5nIHRvCnlvdSBoYXZlIG1vdmVkIGF3YXkgZnJvbSBiYXNpbmcgeW91ciBwYXRj
aCBvbiBtaW5lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
