Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDCE7ED
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:39:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL9Gd-0006iN-0Q; Mon, 29 Apr 2019 16:36:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL9Gb-0006iI-Bt
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:36:33 +0000
X-Inumbo-ID: f1e25548-6a9c-11e9-b78a-3bce8d8bd9cc
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e25548-6a9c-11e9-b78a-3bce8d8bd9cc;
 Mon, 29 Apr 2019 16:36:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556555791; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ce2EF9gNzOddCmEYYktT7FC+1mVXOEHZjoED27p8bXU=;
 b=MXt7fP7XtzTuqIKMU0+pPFfI8Nd4JC1gO5Vunm174LloRsE2/F5TiNDqtGwS2CJwCsc43COj
 rOaH2SCgPPLSVnnnsfa5Dk6+Vp5Uv+5uOVpFSUztpww4T/R+Tyy8wtCWBMpsk0vXVba5xzYu
 YJOHvEQJUCVEBNHrmCvF7BbT1ko=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mxa.mailgun.org with ESMTP id 5cc7280f.7f8fb8fb10f0-smtp-out-n03;
 Mon, 29 Apr 2019 16:36:31 -0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c12so16978184wrt.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:36:30 -0700 (PDT)
X-Gm-Message-State: APjAAAVD2zkkavUT3GoDqRWN1PoFWSBX7CgvmJt2honxNCDGVPvH9qbE
 Bd2StQBoMCErHNElPE/ranm7hS2SjSQYawAFAVU=
X-Google-Smtp-Source: APXvYqxe6HixMFJx0nw7kNgN7+PpRIc6u7Ts3YrqbP2i9X3N1FDElwA3moZLudaz1TgmYG1cguj/VsZhn97BsFQhNkQ=
X-Received: by 2002:adf:e4c2:: with SMTP id v2mr40883988wrm.124.1556555789902; 
 Mon, 29 Apr 2019 09:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
In-Reply-To: <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 10:35:53 -0600
X-Gmail-Original-Message-ID: <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
Message-ID: <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
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

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOToxOCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBQYXRjaCBjZjRiMzBkY2EwYSAiQWRkIGRlYnVnIGNvZGUgdG8g
ZGV0ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRfcGFnZV90eXBlCj4gPiBvcmRlcmluZyIg
YWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNraW5nIHRvIHBhZ2VfbG9jay9wYWdlX3VubG9jayBmb3Ig
ZGVidWcgYnVpbGRzCj4gPiB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBw
YXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2VzIGF0IG9uY2UuCj4gPgo+ID4gVGhpcyBhc3N1bXB0aW9u
IGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5IHNoYXJpbmcgc28gd2UgaW50cm9kdWNlIHNlcGFy
YXRlCj4gPiBmdW5jdGlvbnMsIHBhZ2VfbG9ja19tZW1zaHIgYW5kIHBhZ2VfdW5sb2NrX21lbXNo
ciwgdG8gYmUgdXNlZCBleGNsdXNpdmVseQo+ID4gaW4gdGhlIG1lbW9yeSBzaGFyaW5nIHN1YnN5
c3RlbS4KPgo+IENvbXBsZXRlbHkgYnlwYXNzaW5nIHRoZXNlIGNoZWNrcyBsb29rcyB1bmRlc2ly
YWJsZSB0byBtZSwgdG8KPiBiZSBob25lc3QuIE90b2ggYXMgZGlzY3Vzc2VkIG1lbS1zaGFyaW5n
IGlzIGFidXNpbmcgdGhlIGxvY2sKPiBhbnl3YXkuIFNvIGlmIHRoaXMgaXMgdG8gcmVtYWluIHRo
YXQgd2F5LCBJIHdvbmRlciB3aGV0aGVyIHRoZQo+IGJldHRlciBjb3Vyc2Ugb2YgYWN0aW9uIHdv
dWxkbid0IGJlIHRvIHN0b3AgYWJ1c2luZyB0aGUKPiBmdW5jdGlvbnMsIGNsb25pbmcgdGhlbSB0
byBjb250aW51ZSB1c2luZyB0aGUgUEdUX2xvY2tlZCBmbGFnLgo+IEkgd291bGQgdGhlbiB3b25k
ZXIgd2hldGhlciBlLmcuIHRoZSBjaGVja2luZyBvZiBQR1RfdmFsaWRhdGVkCj4gd291bGQgYWN0
dWFsbHkgYmUgbmVlZGVkIGluIHRoZSBjbG9uZWQgZnVuY3Rpb25zIC0gdGhhdCdzIGFnYWluCj4g
YSBmbGFnIHdoaWNoIG91Z2h0IHRvIGhhdmUgbWVhbmluZyBtYWlubHkgKGV4Y2x1c2l2ZWx5Pykg
Zm9yCj4gaGFuZGxpbmcgb2YgUFYgZ3Vlc3RzLgoKSSBkb24ndCBoYXZlIGFuIGFuc3dlciB0byB5
b3VyIHF1ZXN0aW9uLiBJIHdvdWxkIHByZWZlciBnZXR0aW5nIHJpZCBvZgp0aGlzIHdob2xlIHRo
aW5nIG15c2VsZi4gRm9yIG5vdyBJJ20ganVzdCB0cnlpbmcgdG8gbWFrZSBpdCB1c2FibGUKYWdh
aW4uCgo+Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L21tLmMKPiA+IEBAIC0yMDMwLDEyICsyMDMwLDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjdXJy
ZW50X2xvY2tlZF9wYWdlX25lX2NoZWNrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpIHsKPiA+ICAj
ZGVmaW5lIGN1cnJlbnRfbG9ja2VkX3BhZ2VfbmVfY2hlY2soeCkgdHJ1ZQo+ID4gICNlbmRpZgo+
ID4KPiA+IC1pbnQgcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4gPiArI2lmIGRl
ZmluZWQoQ09ORklHX1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NIQVJJTkcpCj4gPiAr
c3RhdGljIGludCBfcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCj4KPiBBcyBwZXIg
YWJvdmUsIHBlcnNvbmFsbHkgSSdtIGFnYWluc3QgaW50cm9kdWNpbmcKPiBwYWdlX3ssdW59bG9j
a19tZW1zaHIoKSwgYXMgdGhhdCBtYWtlcyB0aGUgYWJ1c2UgZXZlbiBtb3JlCj4gbG9vayBsaWtl
IHByb3BlciB1c2UuIEJ1dCBpZiB0aGlzIHdhcyB0byBiZSBrZXB0IHRoaXMgd2F5LCBtYXkgSQo+
IGFzayB0aGF0IHlvdSBzd2l0Y2ggaW50IC0+IGJvb2wgaW4gdGhlIHJldHVybiB0eXBlcyBhdCB0
aGlzIG9jY2FzaW9uPwoKU3dpdGNoaW5nIHRoZW0gdG8gYm9vbCB3b3VsZCBiZSBmaW5lLiBSZXBs
YWNpbmcgdGhlbSB3aXRoIHNvbWV0aGluZwpzYW5lciBpcyB1bmZvcnR1bmF0ZWx5IG91dC1vZi1z
Y29wZSBhdCB0aGUgbW9tZW50LiBVbmxlc3Mgc29tZW9uZSBoYXMKYSBzcGVjaWZpYyBzb2x1dGlv
biB0aGF0IGNhbiBiZSBwdXQgaW4gcGxhY2UuIEkgZG9uJ3QgaGF2ZSBvbmUuCgpUaGFua3MsClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
