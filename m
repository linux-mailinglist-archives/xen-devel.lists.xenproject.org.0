Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3502143060
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 18:02:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itaNf-000133-D8; Mon, 20 Jan 2020 16:58:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vx53=3J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1itaNc-00012u-Vn
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:58:25 +0000
X-Inumbo-ID: 0c6602a4-3ba6-11ea-aecd-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c6602a4-3ba6-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 16:58:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579539496; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=8DjmB4DJ1WsK9mYbgZBFZutqjS9mrluVccllGbjgSM0=;
 b=kOGPXgi7zBN0VAEO4ogfelJhhbXJzbMHFeFAWtofm3w1cpnz9P095Z3lF2h45JqfxJnHK+6m
 YRQByRR4WGsvC4DOMmiiXIO5nbMvG2T5WEZqZOhXQicH32jtInrWWOJBIi/g8AO6kW51ZArq
 NMbSU1jq913wf7oF+F3ZqhGit3E=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5e25d636.7fbc2e4ddf70-smtp-out-n01;
 Mon, 20 Jan 2020 16:32:54 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y11so100568wrt.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 08:32:54 -0800 (PST)
X-Gm-Message-State: APjAAAVVorxJQFC8IJ/Mgh2mDK+jxeBrNF3iFar+N8KbMSC/IuGhuC04
 VJ1I6jC0E702SlhXC6pQaHwlYbungGY02dEIk5E=
X-Google-Smtp-Source: APXvYqyH3mrfj5oZ9VGMlB5L/6SsXduJ3u8NgbHOVABFEXxBYlNoBM9F+S9DgN/LWp4Z/AXBioeGUCHqR/Bc/klf2V8=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr374567wrp.182.1579537973169; 
 Mon, 20 Jan 2020 08:32:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <ce3871c8e9ee01523d2032990ff8acaaaf69a350.1578503483.git.tamas.lengyel@intel.com>
 <03edb7c7-967a-19f4-76bd-9aa9c9af1bd3@suse.com>
In-Reply-To: <03edb7c7-967a-19f4-76bd-9aa9c9af1bd3@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Jan 2020 09:32:18 -0700
X-Gmail-Original-Message-ID: <CABfawh=mNt8nX_oMZV2zg_S9oDey4=KWNHJuk32hxLnpjgRnBQ@mail.gmail.com>
Message-ID: <CABfawh=mNt8nX_oMZV2zg_S9oDey4=KWNHJuk32hxLnpjgRnBQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 13/18] x86/mem_sharing: Skip xen heap
 pages in memshr nominate
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgOToyMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gVHJ5aW5nIHRvIHNoYXJlIHRoZXNlIHdvdWxkIGZhaWwgYW55d2F5LCBiZXR0ZXIg
dG8gc2tpcCB0aGVtIGVhcmx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IGFsYmVpdCBJIHdvbmRlciBpZiB0aGlzIGNvdWxkbid0IGJl
IGZ1cnRoZXIgZ2VuZXJhbGl6ZWQgYnkgLi4uCj4KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fc2hhcmluZy5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4g
QEAgLTg1Miw2ICs4NTIsMTEgQEAgc3RhdGljIGludCBub21pbmF0ZV9wYWdlKHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwKPiA+ICAgICAgaWYgKCAhcDJtX2lzX3NoYXJhYmxlKHAybXQpICkK
PiA+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4KPiA+ICsgICAgLyogU2tpcCB4ZW4gaGVhcCBwYWdl
cyAqLwo+ID4gKyAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKPiA+ICsgICAgaWYgKCAhcGFn
ZSB8fCBpc194ZW5faGVhcF9wYWdlKHBhZ2UpICkKPiA+ICsgICAgICAgIGdvdG8gb3V0Owo+Cj4g
Li4uIGNoZWNraW5nIGZvciBhIHplcm8gdHlwZSByZWYgY291bnQgKHRoZSBvbmx5IG1lYW5zIHRv
IHBlcm1pdAo+IGEgdHlwZSBjaGFuZ2UpIGhlcmUsIGFuZCBtYXliZSBhbHNvIC0+Y291bnRfaW5m
byB0byBmaXQgd2hhdAo+IHBhZ2VfbWFrZV9zaGFyYWJsZSgpIGV4cGVjdHMuCgpOb3Qgc3VyZSBJ
IGZvbGxvdyB5b3UsIHR5cGUgY291bnQgaXMgY2hlY2tlZCBieSBwYWdlX21ha2Vfc2hhcmFibGUg
YnV0Cml0IGhhcyB0byBiZSBleGFjdGx5IDE6CgogICAgLyogQ2hlY2sgaWYgcGFnZSBpcyBhbHJl
YWR5IHR5cGVkIGFuZCBiYWlsIGVhcmx5IGlmIGl0IGlzICovCiAgICBpZiAoIChwYWdlLT51Lmlu
dXNlLnR5cGVfaW5mbyAmIFBHVF9jb3VudF9tYXNrKSAhPSAxICkKICAgIHsKICAgICAgICBzcGlu
X3VubG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKICAgICAgICByZXR1cm4gLUVFWElTVDsKICAg
IH0KCkkgc3BlY2lmaWNhbGx5IHdhbnQgdG8gYXZvaWQgY2FsbGluZyBwYWdlX21ha2Vfc2hhcmFi
bGUgb24geGVuIGhlYXAKcGFnZXMgYmVjYXVzZSB0aGV5IGVuZCB1cCBwcmludGluZyBhbiBlcnJv
ciB0byB0aGUgY29uc29sZSB3aGljaCBpcwp2ZXJ5IGFubm95aW5nLgoKVGFtYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
