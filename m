Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D65FB4E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLTcP-00072V-Ez; Tue, 30 Apr 2019 14:20:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xZw=TA=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLTcN-00072Q-Fe
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:20:23 +0000
X-Inumbo-ID: 16c2ad85-6b53-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16c2ad85-6b53-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 14:20:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556634022; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=DOjDpUWU8D/2A0f0PUzexgB7AnmW9S4X7ANDrdva20Q=;
 b=HVNGiz03uVmKEQdQp6B+8+lAk7QoGDb+UcfC85+l1Dt4z2wyC7QYielXwOFLnkRDt6f3jQKQ
 nMlmj9QMWVPonMwVC1bnH0UEkt6xW/DJuYp42gi6CjjvUz0POezA9rcmm/peeOjEGw1cdX6J
 CPazavrH2HZiS50GTFj8mKBlg7k=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5cc859a5.7f1849b613f0-smtp-out-n03;
 Tue, 30 Apr 2019 14:20:21 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a12so21221440wrq.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 07:20:20 -0700 (PDT)
X-Gm-Message-State: APjAAAUtgP2CWVeIDvz9uZP3FFC4kLwGu1kLsUxkxhXyU72D6Cr2MtUp
 On7VW5dRUey4VO2F7FZ31ppRQ2wffzO2w/UbH7c=
X-Google-Smtp-Source: APXvYqy8iRmM5/Qkw0wcU4T+0iaoOJEKtDBFYjieJj9uLleJ4mVUCsLKSrbAe+odP70IpRloMVOL33yGL4kU3wutVBQ=
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr400807wrs.157.1556634019609; 
 Tue, 30 Apr 2019 07:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
In-Reply-To: <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 30 Apr 2019 08:19:43 -0600
X-Gmail-Original-Message-ID: <CABfawhnARMZWkpKmk=biuZ6j2fZFfDTi--KPd0i_WbgsQekuoQ@mail.gmail.com>
Message-ID: <CABfawhnARMZWkpKmk=biuZ6j2fZFfDTi--KPd0i_WbgsQekuoQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMjo0NCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDMwLjA0LjE5IGF0IDEwOjI4LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUsIEFwciAzMCwgMjAxOSBhdCAxOjE1IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiA+Pj4gT24gMjkuMDQu
MTkgYXQgMTg6MzUsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+PiA+IE9uIE1vbiwg
QXByIDI5LCAyMDE5IGF0IDk6MTggQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPiA+PiA+PiA+Pj4gT24gMjYuMDQuMTkgYXQgMTk6MjEsIDx0YW1hc0B0a2xlbmd5ZWwu
Y29tPiB3cm90ZToKPiA+PiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPj4gPj4gPiAr
KysgYi94ZW4vYXJjaC94ODYvbW0uYwo+ID4+ID4+ID4gQEAgLTIwMzAsMTIgKzIwMzAsMTEgQEAg
c3RhdGljIGlubGluZSBib29sCj4gPiBjdXJyZW50X2xvY2tlZF9wYWdlX25lX2NoZWNrKHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2UpIHsKPiA+PiA+PiA+ICAjZGVmaW5lIGN1cnJlbnRfbG9ja2VkX3Bh
Z2VfbmVfY2hlY2soeCkgdHJ1ZQo+ID4+ID4+ID4gICNlbmRpZgo+ID4+ID4+ID4KPiA+PiA+PiA+
IC1pbnQgcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4gPj4gPiArI2lmIGRl
ZmluZWQoQ09ORklHX1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NIQVJJTkcpCj4gPj4g
Pj4gPiArc3RhdGljIGludCBfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPj4g
Pj4KPiA+PiA+PiBBcyBwZXIgYWJvdmUsIHBlcnNvbmFsbHkgSSdtIGFnYWluc3QgaW50cm9kdWNp
bmcKPiA+PiA+PiBwYWdlX3ssdW59bG9ja19tZW1zaHIoKSwgYXMgdGhhdCBtYWtlcyB0aGUgYWJ1
c2UgZXZlbiBtb3JlCj4gPj4gPj4gbG9vayBsaWtlIHByb3BlciB1c2UuIEJ1dCBpZiB0aGlzIHdh
cyB0byBiZSBrZXB0IHRoaXMgd2F5LCBtYXkgSQo+ID4+ID4+IGFzayB0aGF0IHlvdSBzd2l0Y2gg
aW50IC0+IGJvb2wgaW4gdGhlIHJldHVybiB0eXBlcyBhdCB0aGlzIG9jY2FzaW9uPwo+ID4+ID4K
PiA+PiA+IFN3aXRjaGluZyB0aGVtIHRvIGJvb2wgd291bGQgYmUgZmluZS4gUmVwbGFjaW5nIHRo
ZW0gd2l0aCBzb21ldGhpbmcKPiA+PiA+IHNhbmVyIGlzIHVuZm9ydHVuYXRlbHkgb3V0LW9mLXNj
b3BlIGF0IHRoZSBtb21lbnQuIFVubGVzcyBzb21lb25lIGhhcwo+ID4+ID4gYSBzcGVjaWZpYyBz
b2x1dGlvbiB0aGF0IGNhbiBiZSBwdXQgaW4gcGxhY2UuIEkgZG9uJ3QgaGF2ZSBvbmUuCj4gPj4K
PiA+PiBJJ3ZlIG91dGxpbmVkIGEgc29sdXRpb24gYWxyZWFkeTogTWFrZSBhIG1lbS1zaGFyaW5n
IHByaXZhdGUgdmFyaWFudAo+ID4+IG9mIHBhZ2Vfeyx1bn1sb2NrKCksIGRlcml2ZWQgZnJvbSB0
aGUgUFYgb25lcyAoYnV0IHdpdGggcGllY2VzCj4gPj4gZHJvcHBlZCB5b3UgZG9uJ3Qgd2FudC9u
ZWVkKS4KPiA+Cj4gPiBXZWxsLCB0aGF0J3Mgd2hhdCBJIGFscmVhZHkgZGlkIGhlcmUgaW4gdGhp
cyBwYXRjaC4gTm8/Cj4KPiBObyAtIHlvdSd2ZSByZXRhaW5lZCBhIHNoYXJlZCBfcGFnZV97LHVu
fWxvY2soKSwgd2hlcmVhcyBteQo+IHN1Z2dlc3Rpb24gd2FzIHRvIGhhdmUgYSBjb21wbGV0ZWx5
IGluZGVwZW5kZW50IHBhaXIgb2YKPiBmdW5jdGlvbnMgaW4gbWVtX3NoYXJpbmcuYy4gVGhlIG9u
bHkgdGhpbmcgbmVlZGVkIGJ5IGJvdGggUFYKPiBhbmQgSFZNIHdvdWxkIHRoZW4gYmUgdGhlIFBH
VF9sb2NrZWQgZmxhZy4KCkkgc2VlLiBTdXJlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
