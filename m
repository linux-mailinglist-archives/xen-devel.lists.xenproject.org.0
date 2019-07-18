Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0A6CEB4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6F5-0007iU-Sh; Thu, 18 Jul 2019 13:14:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho6F4-0007iO-KC
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:14:38 +0000
X-Inumbo-ID: fd7fc6f6-a95d-11e9-9cdf-e7702fff01a0
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd7fc6f6-a95d-11e9-9cdf-e7702fff01a0;
 Thu, 18 Jul 2019 13:14:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563455676; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=B+zHtZxoY5qMQLD0rYefGXUzfWbH+w3dIZ7CIx6ZmpI=;
 b=EsOf0e1hNq7UK6WjcbihG0gDUW4PTBTFH1jq1cmcfgbCm9F3oGgRUcGnaVlO1OY7nppitTvL
 +xmohhHzdurr9V1PmTTy9Px2qyGK6LNe6hAwZgmzPSbBbDC5mR/wGKELlAQc5iWn92ScGq4e
 Hra/KHAEBlpEV4bzHQBaghT6Gpc=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5d3070bb.7f907060b970-smtp-out-n01;
 Thu, 18 Jul 2019 13:14:35 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p74so25536631wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:14:35 -0700 (PDT)
X-Gm-Message-State: APjAAAXLXZmIrxcc5NosTc8QxWXUGwO+ORhnn9f9NR6vSxR8jXKNquy7
 +zfQ2cCLpbNwYflsj69G8X0v6NexJmKWCW0Fp/c=
X-Google-Smtp-Source: APXvYqwLt66BuaGkcZi5ELjJ2Pgqc4ueIbLW6xSRgvpbRhpRU+LePDzGauzKZD5oAjvadIhADOKvvs3Tr/NXv/8edaM=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr41029493wmh.129.1563455674230; 
 Thu, 18 Jul 2019 06:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
In-Reply-To: <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 07:13:57 -0600
X-Gmail-Original-Message-ID: <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
Message-ID: <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzoxMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNDo1NSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDo0NyBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+IE9uIDE3LjA3LjIwMTkgMjE6MzMsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+Pj4gQEAgLTkwMCw2ICs4OTUsNyBAQCBzdGF0aWMgaW50IHNoYXJl
X3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
Pj4+ICAgICAgICBwMm1fdHlwZV90IHNtZm5fdHlwZSwgY21mbl90eXBlOwo+ID4+PiAgICAgICAg
c3RydWN0IHR3b19nZm5zIHRnOwo+ID4+PiAgICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Igcmk7
Cj4gPj4+ICsgICAgdW5zaWduZWQgbG9uZyBwdXRfY291bnQgPSAwOwo+ID4+Pgo+ID4+PiAgICAg
ICAgZ2V0X3R3b19nZm5zKHNkLCBzZ2ZuLCAmc21mbl90eXBlLCBOVUxMLCAmc21mbiwKPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICBjZCwgY2dmbiwgJmNtZm5fdHlwZSwgTlVMTCwgJmNtZm4sIDAs
ICZ0Zyk7Cj4gPj4+IEBAIC05NjQsMTUgKzk2MCw2IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMo
c3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiA+Pj4gICAg
ICAgICAgICBnb3RvIGVycl9vdXQ7Cj4gPj4+ICAgICAgICB9Cj4gPj4+Cj4gPj4+IC0gICAgLyog
QWNxdWlyZSBhbiBleHRyYSByZWZlcmVuY2UsIGZvciB0aGUgZnJlZWluZyBiZWxvdyB0byBiZSBz
YWZlLiAqLwo+ID4+PiAtICAgIGlmICggIWdldF9wYWdlKGNwYWdlLCBkb21fY293KSApCj4gPj4+
IC0gICAgewo+ID4+PiAtICAgICAgICByZXQgPSAtRU9WRVJGTE9XOwo+ID4+PiAtICAgICAgICBt
ZW1fc2hhcmluZ19wYWdlX3VubG9jayhzZWNvbmRwZyk7Cj4gPj4+IC0gICAgICAgIG1lbV9zaGFy
aW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOwo+ID4+PiAtICAgICAgICBnb3RvIGVycl9vdXQ7Cj4g
Pj4+IC0gICAgfQo+ID4+PiAtCj4gPj4+ICAgICAgICAvKiBNZXJnZSB0aGUgbGlzdHMgdG9nZXRo
ZXIgKi8KPiA+Pj4gICAgICAgIHJtYXBfc2VlZF9pdGVyYXRvcihjcGFnZSwgJnJpKTsKPiA+Pj4g
ICAgICAgIHdoaWxlICggKGdmbiA9IHJtYXBfaXRlcmF0ZShjcGFnZSwgJnJpKSkgIT0gTlVMTCkK
PiA+Pj4gQEAgLTk4NCwxMyArOTcxLDE0IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0
IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiA+Pj4gICAgICAgICAg
ICAgKiBEb24ndCBjaGFuZ2UgdGhlIHR5cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVudCBwYWdlLiAq
Lwo+ID4+PiAgICAgICAgICAgIHJtYXBfZGVsKGdmbiwgY3BhZ2UsIDApOwo+ID4+PiAgICAgICAg
ICAgIHJtYXBfYWRkKGdmbiwgc3BhZ2UpOwo+ID4+PiAtICAgICAgICBwdXRfcGFnZV9hbmRfdHlw
ZShjcGFnZSk7Cj4gPj4+ICsgICAgICAgIHB1dF9jb3VudCsrOwo+ID4+PiAgICAgICAgICAgIGQg
PSBnZXRfZG9tYWluX2J5X2lkKGdmbi0+ZG9tYWluKTsKPiA+Pj4gICAgICAgICAgICBCVUdfT04o
IWQpOwo+ID4+PiAgICAgICAgICAgIEJVR19PTihzZXRfc2hhcmVkX3AybV9lbnRyeShkLCBnZm4t
Pmdmbiwgc21mbikpOwo+ID4+PiAgICAgICAgICAgIHB1dF9kb21haW4oZCk7Cj4gPj4+ICAgICAg
ICB9Cj4gPj4+ICAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmY3BhZ2UtPnNoYXJpbmctPmdmbnMp
KTsKPiA+Pj4gKyAgICBCVUdfT04oIXB1dF9jb3VudCk7Cj4gPj4+Cj4gPj4+ICAgICAgICAvKiBD
bGVhciB0aGUgcmVzdCBvZiB0aGUgc2hhcmVkIHN0YXRlICovCj4gPj4+ICAgICAgICBwYWdlX3No
YXJpbmdfZGlzcG9zZShjcGFnZSk7Cj4gPj4+IEBAIC0xMDAxLDcgKzk4OSw5IEBAIHN0YXRpYyBp
bnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVf
dCBzaCwKPiA+Pj4KPiA+Pj4gICAgICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gPj4+
ICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYoY3BhZ2UpOwo+ID4+PiAtICAgIHB1dF9wYWdlKGNw
YWdlKTsKPiA+Pj4gKwo+ID4+PiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4+PiArICAg
ICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4gPj4+Cj4gPj4+ICAgICAgICAvKiBXZSBt
YW5hZ2VkIHRvIGZyZWUgYSBkb21haW4gcGFnZS4gKi8KPiA+Pj4gICAgICAgIGF0b21pY19kZWMo
Jm5yX3NoYXJlZF9tZm5zKTsKPiA+Pj4gQEAgLTExNjUsMTkgKzExNTUsMTMgQEAgaW50IF9fbWVt
X3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4gPj4+ICAgICAgICB7Cj4g
Pj4+ICAgICAgICAgICAgaWYgKCAhbGFzdF9nZm4gKQo+ID4+PiAgICAgICAgICAgICAgICBtZW1f
c2hhcmluZ19nZm5fZGVzdHJveShwYWdlLCBkLCBnZm5faW5mbyk7Cj4gPj4+IC0gICAgICAgIHB1
dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwo+ID4+PiArCj4gPj4+ICAgICAgICAgICAgbWVtX3NoYXJp
bmdfcGFnZV91bmxvY2socGFnZSk7Cj4gPj4+ICsKPiA+Pj4gICAgICAgICAgICBpZiAoIGxhc3Rf
Z2ZuICkKPiA+Pj4gLSAgICAgICAgewo+ID4+PiAtICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2Uo
cGFnZSwgZG9tX2NvdykgKQo+ID4+PiAtICAgICAgICAgICAgewo+ID4+PiAtICAgICAgICAgICAg
ICAgIHB1dF9nZm4oZCwgZ2ZuKTsKPiA+Pj4gLSAgICAgICAgICAgICAgICBkb21haW5fY3Jhc2go
ZCk7Cj4gPj4+IC0gICAgICAgICAgICAgICAgcmV0dXJuIC1FT1ZFUkZMT1c7Cj4gPj4+IC0gICAg
ICAgICAgICB9Cj4gPj4+ICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsK
PiA+Pj4gLSAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwo+ID4+PiAtICAgICAgICB9Cj4gPj4+
ICsKPiA+Pj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7Cj4gPj4+ICAgICAgICAg
ICAgcHV0X2dmbihkLCBnZm4pOwo+ID4+Pgo+ID4+PiAgICAgICAgICAgIHJldHVybiAwOwo+ID4+
Cj4gPj4gLi4uIHRoaXMgKG1haW4sIGFzIEkgZ3Vlc3MgYnkgdGhlIHRpdGxlKSBwYXJ0IG9mIHRo
ZSBjaGFuZ2U/IEkgdGhpbmsKPiA+PiB5b3Ugd2FudCB0byBleHBsYWluIHdoYXQgd2FzIHdyb25n
IGhlcmUgYW5kL29yIHdoeSB0aGUgbmV3IGFycmFuZ2VtZW50Cj4gPj4gaXMgYmV0dGVyLiAoSSdt
IHNvcnJ5LCBJIGd1ZXNzIGl0IHdhcyB0aGlzIHdheSBvbiBwcmlvciB2ZXJzaW9ucwo+ID4+IGFs
cmVhZHksIGJ1dCBhcHBhcmVudGx5IEkgZGlkbid0IG5vdGljZS4pCj4gPgo+ID4gSXQncyB3aGF0
IHRoZSBwYXRjaCBtZXNzYWdlIHNheXMgLSBjYWxsaW5nIHB1dF9wYWdlX2FuZF90eXBlIGJlZm9y
ZQo+ID4gbWVtX3NoYXJpbmdfcGFnZV91bmxvY2sgY2FuIGNhdXNlIGEgZGVhZGxvY2suIFNpbmNl
IG5vdyB3ZSBhcmUgbm93Cj4gPiBob2xkaW5nIGEgcmVmZXJlbmNlIHRvIHRoZSBwYWdlIHRpbGwg
dGhlIGVuZCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUKPiA+IGV4dHJhIGdldF9wYWdlL3B1dF9w
YWdlIGxvZ2ljIHdoZW4gd2UgYXJlIGRlYWxpbmcgd2l0aCB0aGUgbGFzdF9nZm4uCj4KPiBUaGUg
dGl0bGUgc2F5cyAicmVvcmRlciIgd2l0aG91dCBhbnkgIndoeSIuCgpZZXMsIEkgY2FuJ3QgcmVh
c29uYWJseSBmaXQgIkNhbGxpbmcgX3B1dF9wYWdlX3R5cGUgd2hpbGUgYWxzbyBob2xkaW5nCnRo
ZSBwYWdlX2xvY2sgZm9yIHRoYXQgcGFnZSBjYW4gY2F1c2UgYSBkZWFkbG9jay4iIGludG8gdGhl
IHRpdGxlLiBTbwppdCdzIHNwZWxsZWQgb3V0IGluIHRoZSBwYXRjaCBtZXNzYWdlLgoKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
