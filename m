Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0A639F5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 19:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hktb4-00039T-HJ; Tue, 09 Jul 2019 17:08:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hktb3-00039M-3r
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 17:08:05 +0000
X-Inumbo-ID: 1ce52315-a26c-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ce52315-a26c-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 17:08:03 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j6so44757394ioa.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CaPeHLc5na5UUitarKAHOY6N7SPJArNGrCNKcYasFqs=;
 b=E4roD8GYYFZHFDfP0V7ptwjBoSjqhioYLIp8YgPPE560+vGH/CUCqFifH9DzmUxH5Z
 V5KZOGK2PfFpGvxGfN12vbCsk8nDzIhew4yHKeTdlJMUIsWi5WQUo7aOOPhEB86VxooQ
 aqJzlaFnHwNZGPe8yrG6EPhwpgr9q2F/iRWewBgl8b9qkAe+zenGw0G42supPwWzUzTw
 DDBz3s5Bn+GN8/8HljxrExsj/KcI5q2rLnvycADgY+jjr9Lpzf/aJ3rku9nBbHixgj+E
 jjtdQQFSQXJ05zSDSm0pWaMNGUZ+Oq3Pzt113F/sOwLOpSmQmiH1qX00Y1UBJlCibPcd
 XywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CaPeHLc5na5UUitarKAHOY6N7SPJArNGrCNKcYasFqs=;
 b=Q4x/Qe2Y/WUC2oaXlsIujUyHoHmB0QRnXxoac3pb1wdUhIbssY+kLw6bj9vSW3jEoM
 A/2N6EJxhr/DnCAth0lg8DRGJIpjaO7UPX1BhwQzsnoi/pf+hB/jE3/GONaUH1RXU8Xa
 MwSP4MelOIxzZvlrflj6EckqJkiFNmihDflNLZsPEw6vw9/HxsVjCy7JSGugms4+q0JU
 z48d8ShBoL/BmodBLdmlXOmzs7QNr2kADyxL0b7gNdWvS+7K6uJDL0cTBFGycai+I1Hh
 wh0s4naHub465NeIGXnkPMTOo6/JZsWAG2tJnlzupzsTaEowoyD3S2p7R1nimjOmC2S4
 0lpw==
X-Gm-Message-State: APjAAAWEl1iHrCxz3Xw1oy39t6ItDMB4Po/4cVBnc3eL8GEYoarubvYU
 7uSMryQeIMpeSJEae1n0/mzuUrmxbRVyLvbG1M25CuBc
X-Google-Smtp-Source: APXvYqxRiX4dMPVg0GUvKM7IP7uBWblVzACutMB9B3X92f00ZBLy42ZQ5rFkt3DIkuu7lcsyj692BZj3OQe66JUZVSI=
X-Received: by 2002:a6b:b206:: with SMTP id b6mr28626513iof.286.1562692083361; 
 Tue, 09 Jul 2019 10:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190708123545.19406-1-viktor.mitin.19@gmail.com>
 <a621f734-56c6-b5d9-4926-b7e04c75a4b7@arm.com>
 <CAOcoXZYXwphVM97dwPqgabzoHy48hFTye-Sb5A37w0rdORaGxg@mail.gmail.com>
 <e15fedc0-63f3-0e2c-4aeb-5a6cff95c9be@arm.com>
In-Reply-To: <e15fedc0-63f3-0e2c-4aeb-5a6cff95c9be@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Tue, 9 Jul 2019 20:07:52 +0300
Message-ID: <CAOcoXZaCSd8dk1RUf9h+jbj0J58T4b28_Qtw9cXt0264ELsjMg@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] Improve Dom0-less documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCk9uIFR1ZSwgSnVsIDksIDIwMTkgYXQgMzoxNSBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gNy85LzE5IDg6MjMgQU0sIFZpa3Rv
ciBNaXRpbiB3cm90ZToKPiA+IE9uIE1vbiwgSnVsIDgsIDIwMTkgYXQgNjo0NSBQTSBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhlbGxvLAo+ID4g
SGVsbG8gSnVsaWVuLAo+ID4KPiA+Pgo+ID4+IE9uIDcvOC8xOSAxOjM1IFBNLCBWaWt0b3IgTWl0
aW4gd3JvdGU6Cj4gPj4+IFVwZGF0ZWQgY29uZmlndXJhdGlvbiBleGFtcGxlIGFjY29yZGluZyB0
byBhcm02NAo+ID4+PiBhbmQgYWRkZWQgbW9yZSBjYXNlcyBhYm91dCBrbm93biB4bCBsaW1pdGF0
aW9ucy4KPiA+Pgo+ID4+IGRvbTBsZXNzIGlzIG5vdCBhbiBhcm02NCBzcGVjaWZpYyBmZWF0dXJl
LiBJdCBhbHNvIHdvcmtzIG9uIGFybTMyLCBhbmQKPiA+PiB0aGVyZWZvcmUgdGhlIGRvY3Mgc2hv
dWxkIHdvcmsgZm9yIGJvdGggY2FzZXMuIEhvd2V2ZXIuLi4KPiA+Pgo+ID4gVGhlcmUgaXMgb25l
IGlzc3VlIHdpdGggaXQsIHBsZWFzZSBzZWUgYmVsb3cuCj4gPgo+ID4+Pgo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiA+Pj4gLS0tCj4g
Pj4+ICAgIGRvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kb2NzL2ZlYXR1cmVzL2Rv
bTBsZXNzLnBhbmRvYyBiL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jCj4gPj4+IGluZGV4
IGUwNzZlMzczOWUuLjk2MTgxMzY5NmYgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RvY3MvZmVhdHVyZXMv
ZG9tMGxlc3MucGFuZG9jCj4gPj4+ICsrKyBiL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9j
Cj4gPj4+IEBAIC02MiwxOSArNjIsMTkgQEAgZGV2aWNlIHRyZWUgYWRkaW5nIGEgbm9kZSB1bmRl
ciAvY2hvc2VuIGFzIGZvbGxvd3M6Cj4gPj4+Cj4gPj4+ICAgICAgICBkb21VMSB7Cj4gPj4+ICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsKPiA+Pj4gLSAgICAgICAgbWVtb3J5
ID0gPDB4MjAwMDA+Owo+ID4+PiArICAgICAgICBtZW1vcnkgPSA8MHgwIDB4MjAwMDA+OyA+ICAg
ICAgICAgICBjcHVzID0gMTsKPiA+Pj4gICAgICAgICAgICB2cGwwMTE7Cj4gPj4+Cj4gPj4+ICAg
ICAgICAgICAgbW9kdWxlQDIwMDAwMDAgewo+ID4+PiAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gIm11bHRpYm9vdCxrZXJuZWwiLCAibXVsdGlib290LG1vZHVsZSI7Cj4gPj4+IC0gICAgICAg
ICAgICByZWcgPSA8MHgyMDAwMDAwIDB4ZmZmZmZmPjsKPiA+Pj4gKyAgICAgICAgICAgIHJlZyA9
IDwweDAgMHgyMDAwMDAwIDB4MCAweGZmZmZmZj47Cj4gPj4KPiA+PiAuLi4gbm90aGluZyBvbiBh
cm02NCBpbXBvc2UgI2FkZHJlc3MtY2VsbHMgPSAyIGFuZCAjc2l6ZS1jZWxscyA9IDIuIFRoZQo+
ID4+IHByb2JsZW0gaGVyZSBpcyB0aGUgdHdvIHByb3BlcnRpZXMgYXJlIG1pc3NpbmcgaW4gdGhl
IG5vZGUgZG9tVTEuCj4gPgo+ID4gVGhlIG5leHQgaXNzdWUgd2FzIG9ic2VydmVkIHdpdGggYXJt
NjQgKGFybTMyIHdhcyBub3QgdGVzdGVkKS4KPiA+IFRoZSByZWcgcHJvcGVydGllcyBpbnNpZGUg
J21vZHVsZScgbm9kZXMgYXJlIG9rIGVpdGhlciB3aXRoIGFkZGl0aW9uYWwgJzB4MCcKPiA+IG9y
IHdpdGggI2FkZHJlc3MtY2VsbHMgPSAyIGFuZCAjc2l6ZS1jZWxscyA9IDIuCj4gPgo+ID4gSG93
ZXZlciwgdGhlICdtZW1vcnknIHByb3BlcnR5IGRvZXMgbm90IHdvcmsgd2l0aG91dCBhZGRpdGlv
bmFsICcweDAnCj4gPiBhbmQgI2FkZHJlc3MtY2VsbHMgPSAyIGFuZCAjc2l6ZS1jZWxscyA9IDIg
ZG9uJ3QgYWZmZWN0IGl0Lgo+ID4gVGhlIG5leHQgY29kZSBmYWlscyB3aXRob3V0ICcweDAnLiBU
aGlzIHdhcyB0aGUgcmVhc29uIHdoeSBJIGFkZGVkICcweDAnCj4gPiBhbmQgbm90ICNhZGRyZXNz
LWNlbGxzID0gMiBhbmQgI3NpemUtY2VsbHMgPSAyLiBOb3cgaXQgaXMgY2xlYXIgdGhhdAo+ID4g
d2UgbmVlZCB0byB1c2UKPiA+ICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBhbnl3YXks
IGhvd2V2ZXIsIEknbSBub3Qgc3VyZSBhYm91dAo+ID4gbWVtb3J5IHByb3BlcnR5Lgo+ID4gU2hv
dWxkIGl0IGJlIHdpdGggZXh0cmEgemVybyBhbnl3YXkgZm9yIGJvdGggY2FzZXMgYXJtMzIgYW5k
IGFybTY0Pwo+ID4KPiA+IG1lbW9yeSA9IDwweDAgMHgyMDAwMD47Cj4KPiBQZXIgdGhlIGRvY3Vt
ZW50YXRpb24gKGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQpOgo+Cj4gIi0g
bWVtb3J5Cj4KPiBBIDY0LWJpdCBpbnRlZ2VyIHNwZWNpZnlpbmcgdGhlIGFtb3VudCBvZiBraWxv
Ynl0ZXMgb2YgUkFNIHRvCj4gYWxsb2NhdGUgdG8gdGhlIGd1ZXN0Lgo+ICIKPgo+IFNvIG1lbW9y
eSBpcyBhbHdheXMgYSA2NC1iaXQgaW50ZWdlciBhbmQgdGhlcmVmb3JlIGlzIGRlc2NyaWJlZCB1
c2luZyAyCj4gY2VsbHMuCgpDbGVhci4gV2lsbCBjaGFuZ2UgbWVtb3J5IHByb3BlcnR5IGluIGV4
YW1wbGUgdG8gYmUgd2l0aCBleHRyYSAweDAuCgpUaGFua3MKCj4gQ2hlZXJzLAo+Cj4gLS0KPiBK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
