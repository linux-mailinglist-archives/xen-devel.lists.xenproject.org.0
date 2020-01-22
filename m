Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD71457C2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:25:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuGuy-0006rV-14; Wed, 22 Jan 2020 14:23:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuGux-0006rQ-0v
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:23:39 +0000
X-Inumbo-ID: c77a5518-3d22-11ea-bc52-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c77a5518-3d22-11ea-bc52-12813bfff9fa;
 Wed, 22 Jan 2020 14:23:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so7501931wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z4Z7woUzG5+ll3YHAxNwN5uPyuI2BBWsjjW2Q+KjXpg=;
 b=aHEUNc6ZVD8oxVqKerbBOCMoJDCT5JzVT/OQiVJNCOMIzspOe+Cn+l4LaWT7c0Hw0N
 F/44kpt6JHJtIFLFIdLWbaOad233izJ0B7EOKUfkJbncOe07pQ/FQx6iULn0vTuWv6JO
 7UBBn182yhHGqHTa82D+DkbwEw0yFWCpxMjvB+Au/v6C5fq91fYwEuPKtnTTxJuSgf7e
 SQIGpNodpni/uA/3Y+imiaVSclgtCwCgXWytPeQr9qzkzCAm1jltG6RXgpnesff4IUGj
 hSNyv88T7uuv8fI6iUerdJiQAAdwIzBVvsW9PBbIXqJquBhLXSaqqv7ha1+pF4rj55Z/
 dwyA==
X-Gm-Message-State: APjAAAXuANmoqAGV2KNK+XPN4kyZhxAQVySRVCgMFtehAE/Ck+D7DE+k
 RwkZEAH4bQ+8Aw2mBMT0wAU=
X-Google-Smtp-Source: APXvYqx6DrMrFi+e1Qw8EON2t1J4xvjgiFHHb4mb0hjciymra5sSmQmwSfgo6+/K+kNIg0hDYs6khw==
X-Received: by 2002:adf:8297:: with SMTP id 23mr11040897wrc.379.1579703016849; 
 Wed, 22 Jan 2020 06:23:36 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id c4sm4203436wml.7.2020.01.22.06.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 06:23:36 -0800 (PST)
To: "Woodhouse, David" <dwmw@amazon.co.uk>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200120143142.19820-1-julien@xen.org>
 <a45e0622-3974-7b4b-c093-81362ad1b18f@citrix.com>
 <b9174b70-64d9-949c-1b94-de13e963a65a@xen.org>
 <13528a87-2c98-3717-b28d-a82654785940@citrix.com>
 <f6b960ae9ce717ebb80501a6f2dd5304fbc9e178.camel@amazon.co.uk>
From: Julien Grall <julien@xen.org>
Message-ID: <ed4e3739-529d-3dec-f04d-b1d818f1fb84@xen.org>
Date: Wed, 22 Jan 2020 14:23:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f6b960ae9ce717ebb80501a6f2dd5304fbc9e178.camel@amazon.co.uk>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages
 associated to struct domain
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
Cc: "Grall, Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAyMi8wMS8yMDIwIDEzOjUwLCBXb29kaG91c2UsIERhdmlkIHdyb3RlOgo+
IE9uIFdlZCwgMjAyMC0wMS0yMiBhdCAxMzoxNSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBJJ2QgbXVjaCByYXRoZXIgc2VlIHRoZSBvcmlnaW5hbCBwYXRjaCByZXZlcnRlZC4gIFRo
ZSBjdXJyZW50IHNpemUgb2YKPj4+PiBzdHJ1Y3QgZG9tYWluIHdpdGggbG9ja3Byb2ZpbGUgZW5h
YmxlZCBpcyAzMjAwIGJ5dGVzLgo+Pj4KPj4+IExldCBtZSBoYXZlIGEgbG9vayBmaXJzdCB0byBz
ZWUgd2hlbi93aHkgc3RydWN0IGRvbWFpbiBpcyBsZXNzIHRoYW4gNEsKPj4+IHdpdGggbG9ja3By
b2ZpbGUuCj4+Cj4+IEluIHRoZSBpbnRlcnZlbmluZyB0aW1lLCBKdWVyZ2VuIGhhcyB0b3RhbGx5
IHJld3JpdHRlbiBsb2NrIHByb2ZpbGluZywKPj4gYW5kIHRoZSB2aXJ0dWFsIHRpbWVyIGluZnJh
c3RydWN0dXJlIGhhcyBiZWVuIHRha2VuIG91dC1vZi1saW5lLgo+Pgo+PiBJdHMgcHJvYmFibHkg
dGhlIGxhdHRlciB3aGljaCBpcyB0aGUgZG9taW5hdGluZyBmYWN0b3IuCj4gCj4gT0ssIHNvIGlm
IHdlIHJldmVydCA4OTE2ZmNmNDU3NyBpcyBpdCByZWFzb25hYmxlIGZvciBtZSB0byB0aGVuIGFz
c3VtZQo+IHRoYXQgJ3N0cnVjdCBkb21haW4nIHdpbGwgYWx3YXlzIGZpdCB3aXRoaW4gYSBwYWdl
LCBhbmQgZGVjbGFyZSB0aGF0Cj4gbGl2ZSB1cGRhdGUgc2hhbGwgbm90IHdvcmsgdG8gYSBYZW4g
d2hlcmUgdGhhdCBpc24ndCB0cnVlPwpXaGlsZSBpdCBpcyBuaWNlIHRvIGhhdmUgc3RydWN0IGRv
bWFpbiBzbWFsbCwgSSB3b3VsZCByYXRoZXIgbm90IGJha2UgdG8gCnNpemUgYXNzdW1wdGlvbiBp
biBsaXZlIHVwZGF0ZS4KClRoZSBtb3JlIG9uIEFybSB3ZSBoYXZlIGJlZW4gcXVpdGUgb2Z0ZW4g
Y2xvc2UgdG8gdGhlIGxpbWl0LiBTbyBJIGRvbid0IAp3YW50IHRvIGxpbWl0IG15IGNob2ljZXMu
Cgo+IAo+IEkgaGF2ZSBhIG5hc3R5IHRyaWNrIGluIG1pbmQuLi4KPiAKPiBEdXJpbmcgbGl2ZSB1
cGRhdGUsIHdlIG5lZWQgdG8gZG8gYSBwYXNzIG92ZXIgdGhlIGxpdmUgdXBkYXRlIGRhdGEgaW4K
PiBlYXJseSBib290IGluIG9yZGVyIHRvIHdvcmsgb3V0IHdoaWNoIHBhZ2VzIHRvIHJlc2VydmUu
IFRoYXQgcGFydCBoYXMKPiB0byBiZSBkb25lIGVhcmx5LCB3aGlsZSB0aGUgYm9vdCBhbGxvY2F0
b3IgaXMgYWN0aXZlLiBJdCB3b3JrcyBieQo+IHNldHRpbmcgdGhlIFBHQ19hbGxvY2F0ZWQgYml0
IGluIHRoZSBwYWdlX2luZm8gb2YgdGhlIHJlc2VydmVkIHBhZ2VzLAo+IHNvIHRoYXQgaW5pdF9o
ZWFwX3BhZ2VzKCkga25vd3Mgbm90IHRvIGluY2x1ZGUgdGhlbS4gSSd2ZSBwb3N0ZWQgdGhhdAo+
IHBhcnQgYWxyZWFkeS4KPiAKPiBBbHNvIGR1cmluZyBsaXZlIHVwZGF0ZSwgd2UgbmVlZCB0byBj
b25zdW1lIHRoZSBhY3R1YWwgZG9tYWluIHN0YXRlCj4gdGhhdCB3YXMgcGFzc2VkIG92ZXIgZnJv
bSB0aGUgcHJldmlvdXMgWGVuLCBhbmQgZmlsbCBpbiB0aGUgb3duZXIgKGFuZAo+IHJlZmNvdW50
IGV0Yy4pIGluIHRoZSBzYW1lIHBhZ2VfaW5mbyBzdHJ1Y3R1cmVzLCBiZWZvcmUgdGhvc2UgcGFn
ZXMgYXJlCj4gaW4gYSB0cnVseSBjb25zaXN0ZW50IHN0YXRlLgo+IAo+IFJpZ2h0IG5vdywgd2Ug
bmVlZCB0aGUgbGF0dGVyIHRvIGhhcHBlbiAqYWZ0ZXIqIHRoZSBib290IGFsbG9jYXRvciBpcwo+
IGRvbmUgYW5kIHdlJ3JlIGFibGUgdG8gYWxsb2NhdGUgZnJvbSB0aGUgaGVhcC4uLiBiZWNhdXNl
IHdlIG5lZWQgdG8gYmUKPiBhYmxlIHRvIGFsbG9jYXRlIHRoZSBkb21haW4gc3RydWN0dXJlcywg
YW5kIHdlIGRvbid0IHdhbnQgdG8gZW5zdXJlCj4gdGhhdCB0aGVyZSdzIGVub3VnaCBzcGFjZSBp
biB0aGUgTFUgcmVzZXJ2ZWQgYm9vdG1lbSBmb3IgdGhhdCBtYW55Cj4gZG9tYWluIHN0cnVjdHVy
ZXMuCgpBcyB5b3UgcG9pbnRlZCBvdXQgYWJvdmUsIHRoZSBzdHJ1Y3QgZG9tYWluIGl0c2VsZiBp
cyBhIHBhZ2UgKGkuZSA0S0Igb24gCng4NikuIExldCBzYXkgeW91IGhhdmUgMjU2IGRvbWFpbnMs
IHRoaXMgd291bGQgb25seSB1c2UgMU1CLiBXaGljaCBpcyAKbm90IHRvbyBiYWQgdG8gdGFrZSBp
bnRvIGFjY291bnQuCgpCdXQgc3RydWN0IGRvbWFpbiBoYXMgYSBsb3Qgb2Ygb3V0LW9mLWxpbmUg
YWxsb2NhdGlvbi4gSWYgeW91IGFyZSBub3QgCnBsYW5uaW5nIHRvIG1ha2Ugc3RydWN0IGRvbWFp
biBwYXJ0IG9mIHRoZSBBQkksIHRoZW4geW91IHdvdWxkIG5lZWQgCnF1aXRlIGEgZmV3IGFsbG9j
YXRpb25zIGV2ZW4gaW4geW91ciBjYXNlcy4KCk9mIGNvdXJzZSwgeW91IGNvdWxkIGp1c3QgaGFs
ZiBpbml0aWFsaXplIHN0cnVjdCBkb21haW4uIEhvd2V2ZXIsIEkgCndvdWxkIGJlIGNhdXRpb3Vz
IHdpdGggdGhpcyBzb2x1dGlvbiBhcyBpdCB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCB0byAKY2hh
c2UgZG93biBidWcgYXJvdW5kIHN0cnVjdCBwYWdlLiBJbWFnaW5lIHRoZSBkb21haW4gcG9pbnRl
ciBpcyAKYWNjZXNzZWQgZWFybGllciB0aGFuIGV4cGVjdGVkLgoKPiBIZW5jZSB0aGUgbmFzdHkg
dHJpY2s6IFdoYXQgaWYgd2UgYWxsb2NhdGUgdGhlIG5ldyBzdHJ1Y3QgZG9tYWluIG9uCj4gKnRv
cCogb2YgdGhlIG9sZCBvbmUsIHNpbmNlIHdlIGhhcHBlbiB0byBrbm93IHRoYXQgcGFnZSAqd2Fz
bid0KiB1c2VkCj4gYnkgdGhlIHByZXZpb3VzIFhlbiBmb3IgYW55dGhpbmcgdGhhdCBuZWVkcyB0
byBiZSBwcmVzZXJ2ZWQuIFRoZQo+IHN0cnVjdHVyZSBpdHNlbGYgaXNuJ3QgYW4gQUJJIGFuZCBu
ZXZlciBjYW4gYmUsIGFuZCBpdCB3aWxsIGhhdmUgdG8gYmUKPiByZXBvcHVsYXRlZCBmcm9tIHRo
ZSBsaXZlIG1pZ3JhdGlvbiBkYXRhLCBvZiBjb3Vyc2Ug4oCUIGJ1dCBpZiB3ZSBjYW4gYXQKPiBs
ZWFzdCBtYWtlIHRoZSBhc3N1bXB0aW9uIHRoYXQgaXQnbGwgKmZpdCosIHRoZW4gcGVyaGFwcyB3
ZSBjYW4gbWFuYWdlCj4gdG8gZG8gYm90aCBvZiB0aGUgYWJvdmUgd2l0aCBvbmx5IG9uZSBwYXNz
IG92ZXIgYWxsIHRoZSBkb21haW4gcGFnZXMuCj4gCj4gVGhpcyB3aWxsIGhhdmUgYSBkaXJlY3Qg
ZWZmZWN0IG9uIHRoZSBjdXN0b21lci1vYnNlcnZlZCBwYXVzZSB0aW1lIGZvcgo+IGEgbGl2ZSB1
cGRhdGUuIFNvIGl0J3Mga2luZCBvZiBpY2t5LCBidXQgYWxzbyAqdmVyeSogdGVtcHRpbmcuLi4K
Ck1heSBJIHJlY29tbWVuZCB0byBnZXQgc29tZSBudW1iZXJzIHdpdGggdGhlIG11bHRpcGxlIHBh
c3MgYW5kICJuaWNlciIgCmNvZGUgZmlyc3Q/IFdlIGNhbiBkZWNpZGUgb24gdGhhdCB3aGF0IHNv
cnQgb2YgaGFja2VyeSB3ZSBuZWVkIHRvIGxvd2VyIAp0aGUgcGF1c2UgdGltZS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
