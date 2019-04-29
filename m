Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34EDE72D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:01:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8gd-00025Z-Od; Mon, 29 Apr 2019 15:59:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8gd-00025U-1z
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:59:23 +0000
X-Inumbo-ID: be71ee62-6a97-11e9-a9f5-df806056c4b1
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be71ee62-6a97-11e9-a9f5-df806056c4b1;
 Mon, 29 Apr 2019 15:59:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556553558; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=DcNdY0pmiJnfLwAdrI6waSrGHiYNwfZEKehDucoSebg=;
 b=W5SSmFtOpd8+WhQhdKp30+qX6cKT8JTNqER11ECud2SrDaCJVBJasdQXhYpM0hv852AkFvSN
 GcMBG356OYohdRmCqnzJz6+f131Jd4aT6WIMx09Te+kkdb72D7lYwaJmw6EXvj6xNiHBBaWo
 2S5yO0mTR6c3dCKWV3YUIYHJpiI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mxa.mailgun.org with ESMTP id 5cc71f55.7f417c42d7b0-smtp-out-n01;
 Mon, 29 Apr 2019 15:59:17 -0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c12so16802039wrt.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 08:59:16 -0700 (PDT)
X-Gm-Message-State: APjAAAX0WSb10WXBY8RoMqZtfcnGx7ChlNUTWqGQidSHnQ0Z7z9brAw+
 RWnzNcoR3csW/jxvqTtxNVqOIkEAsT7PdGzUCE8=
X-Google-Smtp-Source: APXvYqyIaIGLQwgTwQXieYP1e8HkOIfe88OiFmMg+dlLVfwo1aU9U+tZqGoJUhdgAaFsU4Tg8YlyIhs3tusZ0hJv3cg=
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr1052366wrn.113.1556553556071; 
 Mon, 29 Apr 2019 08:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <e9a3ba2d-fc1b-fc4a-02f7-9f8fe3eafc8f@citrix.com>
In-Reply-To: <e9a3ba2d-fc1b-fc4a-02f7-9f8fe3eafc8f@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Apr 2019 09:58:39 -0600
X-Gmail-Original-Message-ID: <CABfawhmOzNUJex0SxHdgJTv6bnHCJWUHwF_1YK83sPf7mwDgYw@mail.gmail.com>
Message-ID: <CABfawhmOzNUJex0SxHdgJTv6bnHCJWUHwF_1YK83sPf7mwDgYw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo0NCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8yNi8xOSA2OjIxIFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBDYWxsaW5nIF9wdXRfcGFnZV90eXBlIHdoaWxlIGFsc28gaG9sZGlu
ZyB0aGUgcGFnZV9sb2NrCj4gPiBmb3IgdGhhdCBwYWdlIGNhbiBjYXVzZSBhIGRlYWRsb2NrLgo+
Cj4gSSBjYW4ndCBpbW1lZGlhdGVseSBzZWUgd2hhdCB0aGUgbWVtX3NoYXJpbmdfcGFnZV9bdW5d
bG9jaygpIGZ1bmN0aW9ucwo+IGFyZSBtZWFudCB0byBiZSBwcm90ZWN0aW5nIGFnYWluc3QuICBJ
cyB0aGVyZSBhIGNvbW1lbnQgYW55d2hlcmUKPiBkZXNjcmliaW5nIHdoYXQgdGhleSdyZSB1c2Vk
IGZvciBvciBob3cgdGhleSB3b3JrPwoKVGhlcmUgYXJlIG5vbmUuIFRoZSB3aG9sZSBzdWJzeXN0
ZW0gYW5kIGl0cyBvZiBwYWdlX2xvY2svdW5sb2NrIHVzZSBpcwp1bmRvY3VtZW50ZWQuIFRoZSBs
b2NrIGlzIHVzZWQgdG8gcHJvdGVjdCB0aGUgcGFnZV9zaGFyaW5nX2luZm8Kc3RydWN0dXJlIGZy
b20gc2ltdWx0YW5lb3VzIHVwZGF0ZXMgKHdoZW4gdGhlIHBhZ2UgaXMgc2hhcmVkL3Vuc2hhcmVk
KQphbmQgYWxzbyB0byBtYWtlIGZyZWVpbmcgdGhhdCBzdHJ1Y3R1cmUgc2FmZS4KCj4KPiBCZWNh
dXNlLi4uCj4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KPiA+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPiA+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+ID4gLS0tCj4gPiB2Mzogc2ltcGxpZmllZCBwYXRjaCBieSBrZWVwaW5nIHRoZSBh
ZGRpdGlvbmFsIHJlZmVyZW5jZXMgYWxyZWFkeSBpbi1wbGFjZQo+ID4gLS0tCj4gPiAgeGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21t
L21lbV9zaGFyaW5nLmMKPiA+IGluZGV4IGRmYzI3OWQzNzEuLmUyZjc0YWM3NzAgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L21tL21lbV9zaGFyaW5nLmMKPiA+IEBAIC02NDgsMTAgKzY0OCw2IEBAIHN0YXRpYyBpbnQg
cGFnZV9tYWtlX3ByaXZhdGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkKPiA+ICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiAgICAgIH0KPiA+Cj4gPiAtICAgIC8q
IFdlIGNhbiBvbmx5IGNoYW5nZSB0aGUgdHlwZSBpZiBjb3VudCBpcyBvbmUgKi8KPiA+IC0gICAg
LyogQmVjYXVzZSB3ZSBhcmUgbG9ja2luZyBwYWdlcyBpbmRpdmlkdWFsbHksIHdlIG5lZWQgdG8g
ZHJvcAo+ID4gLSAgICAgKiB0aGUgbG9jayBoZXJlLCB3aGlsZSB0aGUgcGFnZSBpcyB0eXBlZC4g
V2UgY2Fubm90IHJpc2sgdGhlCj4gPiAtICAgICAqIHJhY2Ugb2YgcGFnZV91bmxvY2sgYW5kIHRo
ZW4gcHV0X3BhZ2VfdHlwZS4gKi8KPgo+IC4uLnRoZSBjb21tZW50IHlvdSdyZSByZW1vdmluZyBl
eHBsaWNpdGx5IHNheXMgdGhhdCB3aGF0IHlvdSdyZSBkb2luZyBpcwo+ICJyaXNrIi15LjsgYnV0
IHlvdSBkb24ndCBleHBsYWluIGF0IGFsbCB3aHkgdGhlIGNvbW1lbnQgaXMgd3JvbmcuCgpBRkFJ
Q1QgdGhhdCBjb21tZW50IHdhcyBjb3JyZWN0IHdoZW4gaXQgd2FzIGFkZGVkIGJ1dCBzaW5jZSB0
aGVuIGl0IGlzCm91dC1vZi1kYXRlLiBUaGVyZSBpcyBub3cgYW4gZXhwbGljaXQgc3dpdGNoIGNh
c2UgYWRkZWQgdG8KX3B1dF9wYWdlX3R5cGUgdGhhdCBzZWVtIHRvIGhhbmRsZSB0aGlzIHNpdHVh
dGlvbiAoY2FzZSBQR1RfbG9ja2VkIHwKMSkgdGhhdCB3YXMgbm90IHRoZXJlIHdoZW4gdGhpcyBj
b21tZW50IHdhcyBpbnRyb2R1Y2VkLiBUaGF0J3Mgd2hhdCBJCndhcyBhYmxlIHRvIGRlY2lwaGVy
IHVzaW5nIGdpdCBhcmNoZW9sb2d5LiBJTUhPIHRoZSB3aG9sZQpwYWdlX2xvY2svcHV0X3R5cGUg
YW5kIHJlZmVyZW5jZSBjb3VudGluZyBpcyB1bmRlY2lwaGVyYWJsZSAoYXQgbGVhc3QKSSdtIG5v
IGNsb3NlciB0byB1bmRlcnN0YW5kaW5nIGl0IGFmdGVyIHN0YXJpbmcgYXQgdGhpcyBmb3IgMiB3
ZWVrcwpub3cpIGFuZCBJIHdpc2ggdGhlcmUgd2FzIGEgd2F5IHRvIGp1c3QgZ2V0dGluZyByaWQg
b2YgdGhlIHdob2xlIHRoaW5nCmJ1dCB1bmZvcnR1bmF0ZWx5IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0
byBiZSBvbmUgZHVlIHRvIG5vdCBiZWluZyBhYmxlCnRvIGVhc2lseSBncm93IHBhZ2VfaW5mby4K
Cj4KPiBVbHRpbWF0ZWx5IHlvdSdyZSB0aGUgbWFpbnRhaW5lciwgYW5kIHRoaXMgaXMgbm9uLXNl
Y3VyaXR5LXN1cHBvcnRlZCwgc28KPiBpZiB5b3UgaW5zaXN0IGl0J3Mgc2FmZSwgSSB3b24ndCBv
cHBvc2UgaXQ7IGJ1dCBpdCBzZWVtcyBsaWtlIGhhdmluZwo+IHNvbWUgY2xhcml0eSBhYm91dCB3
aGF0IGlzIG9yIGlzIG5vdCByaXNreSBhbmQgd2h5IHdvdWxkIGJlIGhlbHBmdWwuCgpJJ20ganVz
dCB0cnlpbmcgdG8gcmV2aXZlIHRoZSBzdWJzeXN0ZW0gYXMgdGhlIHdheSB0aGluZ3MgYXJlIHJp
Z2h0Cm5vdyBpdCdzIGJyb2tlbi4gRG9pbmcgdGhpcyByZW9yZGVyIG1ha2VzIHRoZSBkZWFkbG9j
ayBnbyBhd2F5LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
