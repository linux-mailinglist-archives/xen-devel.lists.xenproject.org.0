Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034BB7EF85
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 10:41:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htT4q-0003bs-2v; Fri, 02 Aug 2019 08:38:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y9bT=V6=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htT4p-0003bn-5v
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 08:38:15 +0000
X-Inumbo-ID: ddffa742-b500-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ddffa742-b500-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 08:38:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h6so25291158iom.7
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqf72sK94KUe5A6gITCp7wGCTbMqCT1wSV26dK4SQg0=;
 b=EI+ktcJ8ty1dba8kt4kHsZMcVJa+T59h1gLGR/fA2Wk+fy2abgosr0VM5m+tqKNw75
 D/3SiqvNFqax919yTinl29Njm1I1g1lO42Mfw1xqVynzDSWzR7ZmUfccDg7rrot5u3jk
 gIyZFn5wH0fLST2HtA0Lrmbl7+Ynd/UqDHpvFgONGKdc3lQQfnVoej3RcQr1QR9Ajxp/
 R2RV1r3R40ehV96I0J0CYaRzJp4sYl7YrrlL4HDiAjLvy5vvxHLdAS9/QZN0N0HCZVff
 6VJC3k15Dl0hLfNj1uR/82hHMWyfAVTY94c9D2o/XcuA6q8kz+F1iajgkKIJrEN35S/L
 CssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqf72sK94KUe5A6gITCp7wGCTbMqCT1wSV26dK4SQg0=;
 b=Z8yX5jkGS2ZHY/L4+pfypVvI3dKb++/HHbmvUAQNF81hcu2ESbn0R7pwnDyMyOLZ4S
 izIASAXZBFB0Qxx+Zq6gDnKlAQY6skVCsWpASpa4g4S+fd2AyWL2eJUOVbRZp5YRcePT
 cVLvu7F+tOet9Ha1+O3LFzq9q9NEO0ZAn4jXOV5qDj6PGWsXLahMtKcNDP3kS0t0WXla
 h2pq1NXq6OChhKrNcEfweIhv6fdYXVqLVVXgCHjsn6Ow7RpPtnRb7Fxxv1C+JfL2v4EY
 k75CNPt846zrbT59hcOXrOPpNsqfKcI7vWVsxHAkuCf8u5dDH0ojApgLWU0fa8hrRnEI
 Wr0Q==
X-Gm-Message-State: APjAAAVzK8+h3SNqbCZU2NmR9BfskBoO58rc+EzSnYy7VYW5in1uhdXj
 XVzUXYqVi9ZhVgQA2pmQtfwqfw9cjjc5L+pbLpc=
X-Google-Smtp-Source: APXvYqzzibncnSMzfn1EwM5OpcNLC7SqjIkZ95vrjbL37yF36hKe2QkfMpdJoz2z4zEqwb4goXd7YNCkYeCTglVX/uw=
X-Received: by 2002:a02:b10b:: with SMTP id
 r11mr130771655jah.140.1564735093671; 
 Fri, 02 Aug 2019 01:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CAOcoXZYfJ--zTmU5SDWM0zV71-dcp=iPfO56noktf=j+MMLLVw@mail.gmail.com>
 <fc7cc403-889c-482c-3037-43eba2a7f80a@suse.com>
 <de9f1e4a-7923-40f8-9c3b-fab912aa250b@arm.com>
 <6aa7726a-5dc2-c901-2700-34bbc2726879@suse.com>
 <CAOcoXZY-0Bru-evWJtVMZ4LB0w1xx0EqD5M8ZDHw+EZUopEr6Q@mail.gmail.com>
 <be9cc69b-41cc-6725-b205-aafa31bdc39c@suse.com>
 <CAOcoXZb8SYbLryapgNmnL3w7oAkyJZtdzM0jRgsvMA=5qtysNQ@mail.gmail.com>
 <d85e76b5-0a68-af0a-375c-7f3844e6e21f@suse.com>
In-Reply-To: <d85e76b5-0a68-af0a-375c-7f3844e6e21f@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 2 Aug 2019 11:38:01 +0300
Message-ID: <CAOcoXZYeV6oXXj4qJRH5pLC8JgM-nghna_JESYBWrO_j4PPL5Q@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAzOjUwIFBNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwMS4wOC4xOSAxNDoxNiwgVmlrdG9yIE1pdGluIHdyb3RlOgo+
ID4gT24gVGh1LCBBdWcgMSwgMjAxOSBhdCAxMDo0MCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMzEuMDcuMjAxOSAxODoyMCwgVmlrdG9yIE1p
dGluIHdyb3RlOgo+ID4+PiBIb3cgYWxsIHRob3NlIHByb2plY3RzIGxpdmUgd2l0aG91dCB0aGlz
IGlzc3VlPwo+ID4+Cj4gPj4gUGVyaGFwcyB0aGV5IGRvbid0IGNhcmU/IEkgZG8uCj4gPj4KPiA+
Pj4gV2hhdCBpcyB0aGUgcmVhc29uIG5vdCB0byBmaXggJ2RpZmYgLXAnPyBJcyBpdCBub3QgcG9z
c2libGUgYXQgYWxsPwo+ID4+Cj4gPj4gSSBoYXZlIG5vIGlkZWEsIGJ1dCBJIGd1ZXNzIHRoZXJl
J3MgYSByZWFzb24gZm9yIGl0cyBjdXJyZW50Cj4gPj4gYmVoYXZpb3IuCj4gPgo+ID4gSmFuLCBp
dCBzZWVtcyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gbW9kaWZ5IHRoZSBYZW4gY29kaW5nIHN0
eWxlCj4gPiB3aXRob3V0IGludmVzdGlnYXRpb24gb2YgdGhlIGlzc3VlIGZpcnN0LiBJdCB0YWtl
cyBzb21lIGVmZm9ydCB0bwo+ID4gYXV0b21hdGUgZXZlcnkgc3VjaCAob3Igc2ltaWxhcikgZXhj
ZXB0aW9uYWwgY29kZSBmb3JtYXR0aW5nIGNhc2UuIFNvCj4gPiBpdCBsb29rcyB3ZSBjb3VsZCBm
aW5kIGEgYmV0dGVyIG9wdGlvbiwgdGhhbiBqdXN0IGFkZGluZyBvbmUgbW9yZQo+ID4gZXhjZXB0
aW9uIHRvIFhlbiBjb2Rpbmcgc3R5bGUsIGF0IGxlYXN0IHdvcnRoIHRvIGludmVzdGlnYXRlIGl0
IGZpcnN0Lgo+ID4KPiA+Pj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSBtb3JlIGRldGFpbHMgYWJv
dXQgdGhlIGJhY2tncm91bmQgb2YgdGhlIGlzc3VlCj4gPj4+IGFuZCBleGFtcGxlcz8KPiA+Pgo+
ID4+IFdoYXQgKGZ1cnRoZXIpIGJhY2tncm91bmQgYW5kIHdoYXQga2luZCBvZiBleGFtcGxlcyBh
cmUgeW91IGFmdGVyPwo+ID4KPiA+IEkgZXhwZWN0ZWQgeW91IHRvIGhhdmUgc29tZSBhcmd1bWVu
dHMgd2h5IGl0IGNhbm5vdCBiZSBmaXhlZCBpbiB0aGUKPiA+IGRpZmYgb3Igb3RoZXIgdG9vbHMu
Cj4KPiBDaGFuZ2luZyBkaWZmIHVwc3RyZWFtIG1pZ2h0IGJlIHBvc3NpYmxlLiBDaGFuZ2luZyB0
b2RheSdzIGluY2FybmF0aW9ucwo+IGluIGFsbCBkaXN0cm9zIG91dCBpbiB0aGUgd2lsZCBpcyBi
YXJlbHkgZG9hYmxlLgo+Cj4gQW5vdGhlciBxdWVzdGlvbiBpcyB3aGV0aGVyIHdlIHJlYWxseSB3
YW50IGRpZmYgdG8gYmUgY2hhbmdlZC4gVGhlCj4gY3VycmVudCBiZWhhdmlvciBpcyBmaW5lIGZv
ciBhc3NlbWJseSBzb3VyY2VzIGZvciBleGFtcGxlLiBBIGNoYW5nZWQKPiBkaWZmIHdvdWxkIG5v
IGxvbmdlciBwcmVzZW50IHRoZSBsYXN0IGxhYmVsIGZvciBjb250ZXh0Lgo+Cj4gPiBUaGUgZXhh
bXBsZXMgSSBtZWFudCBhcmUgYW55IHJlYWwgcGF0Y2hlcyBjb2RlIGV4YW1wbGVzIHRvIGJlIHVz
ZWQgZm9yCj4gPiB0aGlzIGludmVzdGlnYXRpb24uCj4KPiBBIHNuaXBwbGV0IGZyb20gY29tbWl0
IDU3ZjhiMTNjNzI0MDIzYzc4ZmExNWE4MDQ1MmQxZGUzZTUxYTE0MTg6Cj4KPiBAQCAtNDA5Niwx
NCArNDA5NywxMiBAQCByZXRyeV90cmFuc2FjdGlvbjoKPiAgICAgICAgICAgZ290byBvdXQ7Cj4K
PiAgICAgICBpZiAodGFyZ2V0ID09IE5VTEwpIHsKPiAtICAgICAgICBsaWJ4bF9feHNfcHJpbnRm
KGdjLCB0LCB0YXJnZXRfcGF0aCwgIiUiUFJJdTMyLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgKHVpbnQzMl90KSBpbmZvLmN1cnJlbnRfbWVta2IpOwo+IC0gICAgICAgICp0YXJnZXRfbWVt
a2IgPSAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYjsKPiArICAgICAgICBsaWJ4bF9feHNf
cHJpbnRmKGdjLCB0LCB0YXJnZXRfcGF0aCwgIiUiUFJJdTY0LAo+IGluZm8uY3VycmVudF9tZW1r
Yik7Cj4gKyAgICAgICAgKnRhcmdldF9tZW1rYiA9IGluZm8uY3VycmVudF9tZW1rYjsKPiAgICAg
ICB9Cj4gICAgICAgaWYgKHN0YXRpY21heCA9PSBOVUxMKSB7Cj4gLSAgICAgICAgbGlieGxfX3hz
X3ByaW50ZihnYywgdCwgbWF4X3BhdGgsICIlIlBSSXUzMiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICh1aW50MzJfdCkgaW5mby5tYXhfbWVta2IpOwo+IC0gICAgICAgICptYXhfbWVta2Ig
PSAodWludDMyX3QpIGluZm8ubWF4X21lbWtiOwo+ICsgICAgICAgIGxpYnhsX194c19wcmludGYo
Z2MsIHQsIG1heF9wYXRoLCAiJSJQUkl1NjQsIGluZm8ubWF4X21lbWtiKTsKPiArICAgICAgICAq
bWF4X21lbWtiID0gaW5mby5tYXhfbWVta2I7Cj4gICAgICAgfQo+Cj4gICAgICAgcmMgPSAwOwo+
CgpJJ3ZlIGJ1aWxkIGdudSBkaWZmdXRpbHMgbGF0ZXN0IHJlbGVhc2UgMy43IGFuZCBjaGVja2Vk
IHRoZSBjb2RlIGFuZAp0aGUgaXNzdWUuIEl0IHNlZW1zIHRoaXMgZmVhdHVyZSAoLXApIGRvZXNu
J3Qgd29yayBwcm9wZXJseSBhbmQgaGFzCm1hbnkgbW9yZSBidWdzIHRoYW4ganVzdCB0aGUgaXNz
dWUgd2l0aCBsYWJlbHMuIFNlZSB0aGUgZXhhbXBsZSBiZWxvdywKdGhlIGNoYW5nZSBoYXMgYmVl
biBtYWRlIGluIHRoZSBmdW5jdGlvbiBhMSgpLCBob3dldmVyLCBpbiB0aGUgZGlmZgphbm90aGVy
IGZ1bmN0aW9uIGlzIHNob3duIGEoKS4gVGhlcmUgYXJlIG1vcmUgZXhhbXBsZXMgd2hlbiBpdCBk
b2Vzbid0CndvcmsgcHJvcGVybHkuLi4gSSB3b3VsZCBub3QgcmVjb21tZW5kIHJlbHlpbmcgb24g
dGhpcyBmZWF0dXJlIHNpbmNlCml0IHNlZW1zIGl0IGlzIG5vdCB3ZWxsIHRlc3RlZDoKCiAxIGNA
Y24gfi9Eb3dubG9hZHMvZGlmZnV0aWxzLTMuNyQgLi9zcmMvZGlmZiAtLXZlcnNpb24KZGlmZiAo
R05VIGRpZmZ1dGlscykgMy43CkNvcHlyaWdodCAoQykgMjAxOCBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4KTGljZW5zZSBHUEx2Mys6IEdOVSBHUEwgdmVyc2lvbiAzIG9yIGxhdGVyIDxo
dHRwczovL2dudS5vcmcvbGljZW5zZXMvZ3BsLmh0bWw+LgpUaGlzIGlzIGZyZWUgc29mdHdhcmU6
IHlvdSBhcmUgZnJlZSB0byBjaGFuZ2UgYW5kIHJlZGlzdHJpYnV0ZSBpdC4KVGhlcmUgaXMgTk8g
V0FSUkFOVFksIHRvIHRoZSBleHRlbnQgcGVybWl0dGVkIGJ5IGxhdy4KCldyaXR0ZW4gYnkgUGF1
bCBFZ2dlcnQsIE1pa2UgSGFlcnRlbCwgRGF2aWQgSGF5ZXMsClJpY2hhcmQgU3RhbGxtYW4sIGFu
ZCBMZW4gVG93ZXIuCgowIGNAY24gfi9Eb3dubG9hZHMvZGlmZnV0aWxzLTMuNyQgY2F0IH4vdy90
LmMKaW50IGZ1bmMgYSgpCnsKICAgIGludCBhOwogICAgaW50IGI7Cn0KCmludCBmdW5jIGExKHR0
dCwgdHR0dCwgdHR0dCkKewogICAgaW50IGExOwp9CgowIGNAY24gfi9Eb3dubG9hZHMvZGlmZnV0
aWxzLTMuNyQgY2F0IH4vdy90MS5jCmFmZGFzZGZhc2RmCgppbnQgZnVuYyBhKCkKewogICAgaW50
IGE7CiAgICBpbnQgYjsKfQoKaW50IGZ1bmMgYTEodHR0LCB0dHR0LCB0dHR0KQp7CiAgICBpbnQg
YTA7Cn0KCjAgY0BjbiB+L0Rvd25sb2Fkcy9kaWZmdXRpbHMtMy43JCAuL3NyYy9kaWZmIC1wIH4v
dy90LmMgfi93L3QxLmMKKioqIC9ob21lL2Mvdy90LmMgICAgICAgMjAxOS0wOC0wMiAxMToyNDo0
Mi4wNDQzNzYwODQgKzAzMDAKLS0tIC9ob21lL2Mvdy90MS5jICAgICAgMjAxOS0wOC0wMiAxMToy
MjozOS45NDc2MTA4OTMgKzAzMDAKKioqKioqKioqKioqKioqCioqKiAxLDMgKioqKgotLS0gMSw1
IC0tLS0KKyBhZmRhc2RmYXNkZgorCiAgaW50IGZ1bmMgYSgpCiAgewogICAgICBpbnQgYTsKKioq
KioqKioqKioqKioqIGludCBmdW5jIGEoKQoqKiogNiwxMSAqKioqCgogIGludCBmdW5jIGExKHR0
dCwgdHR0dCwgdHR0dCkKICB7CiEgICAgIGludCBhMTsKICB9CgotLS0gOCwxMyAtLS0tCgogIGlu
dCBmdW5jIGExKHR0dCwgdHR0dCwgdHR0dCkKICB7CiEgICAgIGludCBhMDsKICB9CgoKClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
