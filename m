Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03417F633
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 13:47:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htVzR-0000c1-GF; Fri, 02 Aug 2019 11:44:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y9bT=V6=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htVzQ-0000bw-KK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 11:44:52 +0000
X-Inumbo-ID: ef995697-b51a-11e9-8980-bc764e045a96
Received: from mail-io1-xd31.google.com (unknown [2607:f8b0:4864:20::d31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef995697-b51a-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 11:44:50 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id g20so151486741ioc.12
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/X+kzNRfpoENmntPgU5VMB2fuaw/3SiAHYMehqRlTN4=;
 b=H36GcKTKExCp7WEcjDFvrH93BFdkA9DiDmPG+Wh7NRXGivQBEZsEB3xoNbJfP6s740
 0OaHL4t5l3za/bt91RWNavY6dNl6OwVQpUw/L1nDL6WjxaGQpWmBVzIGPRtaGq0uSSTe
 k72kMALikG0dFwAuA0apkZ+TfsjWUDK7hkTAft7EzIaW/ivAgm+o0AJqnB+yLPJEtnsi
 TAp6cf7MyZu/Woq/4jVAwsAKolV37xDnGSJ9Rs7VHjiy1vhr3thS5vFoUSaHshhBhUbJ
 +wGr19f+sYKbHgNfy/e1U+DNd3l/eQhM7qjW03J5qKDGJNU0ovUPj0c/seI85KJprpEy
 rS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/X+kzNRfpoENmntPgU5VMB2fuaw/3SiAHYMehqRlTN4=;
 b=SI0XaI7v6Rdis4CZ9EHyo8y8TUlSyiCDwgPFIeftUy9jDaen+2pxuLaAor9SmlkxwY
 JuNQgQfZLUJCidlCJLrKnf5BwCim3Taz+4NzZ7YgWVzys1EDu53EzcvxuTTSNdKI9dHi
 06yX2fz377G98aukbBXHhQLBukaaC3776rjR4LJ0mFdt8hiO3JrRFeCKxoaccAcu+umd
 Zwclmo5zIcfMlWRStYtGHH6tHC6w73udNiz8u7ACc9bpPGDrhDra0oKfR/KUlU5AgqPN
 xpLav8hmN9eCTgG+swWVb0KlRLxv1S9i5B8qvmGFSiRO6lB1rLhRJIxteYv3SeKoudcL
 YiYQ==
X-Gm-Message-State: APjAAAX/k5+pmJk7GWh00cIXB124x9ClfvdlMA3GfyHRcCfkvH4tAjr8
 IfZzclzvYJoth7gg5VuGFcAmHLQGXi1b53XHmLk=
X-Google-Smtp-Source: APXvYqzcG6DUvhAMn8+jrxK0A8njwtoH+ggtL8Ha1gXTXqfniHtKqJu/HLEFtaovTzEAT1LPS+y2Obrh2pi7dzZfjQQ=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr20746555iof.147.1564746290165; 
 Fri, 02 Aug 2019 04:44:50 -0700 (PDT)
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
 <CAOcoXZYeV6oXXj4qJRH5pLC8JgM-nghna_JESYBWrO_j4PPL5Q@mail.gmail.com>
 <dcee6c93-df93-3118-1c13-75dfcc001965@suse.com>
In-Reply-To: <dcee6c93-df93-3118-1c13-75dfcc001965@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 2 Aug 2019 14:44:38 +0300
Message-ID: <CAOcoXZY2O96w3s4sPVhLbvSJ3wW0KMz7HzSJjRN1C1H=RvS7Qw@mail.gmail.com>
To: Juergen Gross <jgross@suse.com>
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
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMjoyMyBQTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgoKPiA+PiBBIHNuaXBwbGV0IGZyb20gY29tbWl0IDU3ZjhiMTNjNzI0MDIz
Yzc4ZmExNWE4MDQ1MmQxZGUzZTUxYTE0MTg6Cj4gPj4KPiA+PiBAQCAtNDA5NiwxNCArNDA5Nywx
MiBAQCByZXRyeV90cmFuc2FjdGlvbjoKPiA+PiAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+Cj4g
Pj4gICAgICAgIGlmICh0YXJnZXQgPT0gTlVMTCkgewo+ID4+IC0gICAgICAgIGxpYnhsX194c19w
cmludGYoZ2MsIHQsIHRhcmdldF9wYXRoLCAiJSJQUkl1MzIsCj4gPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAodWludDMyX3QpIGluZm8uY3VycmVudF9tZW1rYik7Cj4gPj4gLSAgICAgICAg
KnRhcmdldF9tZW1rYiA9ICh1aW50MzJfdCkgaW5mby5jdXJyZW50X21lbWtiOwo+ID4+ICsgICAg
ICAgIGxpYnhsX194c19wcmludGYoZ2MsIHQsIHRhcmdldF9wYXRoLCAiJSJQUkl1NjQsCj4gPj4g
aW5mby5jdXJyZW50X21lbWtiKTsKPiA+PiArICAgICAgICAqdGFyZ2V0X21lbWtiID0gaW5mby5j
dXJyZW50X21lbWtiOwo+ID4+ICAgICAgICB9Cj4gPj4gICAgICAgIGlmIChzdGF0aWNtYXggPT0g
TlVMTCkgewo+ID4+IC0gICAgICAgIGxpYnhsX194c19wcmludGYoZ2MsIHQsIG1heF9wYXRoLCAi
JSJQUkl1MzIsCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAodWludDMyX3QpIGluZm8u
bWF4X21lbWtiKTsKPiA+PiAtICAgICAgICAqbWF4X21lbWtiID0gKHVpbnQzMl90KSBpbmZvLm1h
eF9tZW1rYjsKPiA+PiArICAgICAgICBsaWJ4bF9feHNfcHJpbnRmKGdjLCB0LCBtYXhfcGF0aCwg
IiUiUFJJdTY0LCBpbmZvLm1heF9tZW1rYik7Cj4gPj4gKyAgICAgICAgKm1heF9tZW1rYiA9IGlu
Zm8ubWF4X21lbWtiOwo+ID4+ICAgICAgICB9Cj4gPj4KPiA+PiAgICAgICAgcmMgPSAwOwo+ID4+
Cj4gPgo+ID4gSSd2ZSBidWlsZCBnbnUgZGlmZnV0aWxzIGxhdGVzdCByZWxlYXNlIDMuNyBhbmQg
Y2hlY2tlZCB0aGUgY29kZSBhbmQKPiA+IHRoZSBpc3N1ZS4gSXQgc2VlbXMgdGhpcyBmZWF0dXJl
ICgtcCkgZG9lc24ndCB3b3JrIHByb3Blcmx5IGFuZCBoYXMKPiA+IG1hbnkgbW9yZSBidWdzIHRo
YW4ganVzdCB0aGUgaXNzdWUgd2l0aCBsYWJlbHMuIFNlZSB0aGUgZXhhbXBsZSBiZWxvdywKPiA+
IHRoZSBjaGFuZ2UgaGFzIGJlZW4gbWFkZSBpbiB0aGUgZnVuY3Rpb24gYTEoKSwgaG93ZXZlciwg
aW4gdGhlIGRpZmYKPiA+IGFub3RoZXIgZnVuY3Rpb24gaXMgc2hvd24gYSgpLgo+Cj4gVGhpcyBj
YXNlIGlzIGNvbXBsZXRlbHkgZmluZSwgYXMgdGhlIGNvbnRleHQgb2YgdGhlIGRpZmYgaXMgc3Rh
cnRpbmcKPiBiZWZvcmUgdGhlIGRlZmluaXRpb24gb2YgYSgpIChhbmQganVzdCBhZnRlciBhMSgp
KS4gVGhpcyBpcyBpbXBvcnRhbnQgaW4KPiBjYXNlIHlvdSBvbmx5IGFkZCBhIG5ldyBmdW5jdGlv
biBmb3IgZXhhbXBsZS4KPgoKSnVlcmdlbiwgdGhlIGRpZmYgcmV0dXJucyB3cm9uZyBuYW1lIG9m
IHRoZSBmdW5jdGlvbiBzaWxlbnRseS4gSSBkb24ndAp0aGluayBpdCBpcyAnY29tcGxldGVseSBm
aW5lJywgSSB3b3VsZCByYXRoZXIgY2FsbCBpdCBhIGJ1Zywgb3IKbm9uLWRvY3VtZW50ZWQgbGlt
aXRhdGlvbiwgYnV0IGRlZmluaXRlbHkgbm90IGEgZmVhdHVyZS4gQXMgSSB3cm90ZQpwcmV2aW91
c2x5LCBJIHBsYXllZCB3aXRoIC1wIGEgbGl0dGxlIGFuZCBvYnNlcnZlZCBtb3JlIHNpbWlsYXIg
aXNzdWVzCndpdGggaXQuIFRoZSByZWFzb24gaXMgdGhhdCB0aGUgbmV4dCBkaWZmIGNvZGUgKHNl
ZSBiZWxvdykgdHJpZXMgdG8KbWF0Y2ggZnVuY3Rpb24gbmFtZXMgdXNpbmcgc2ltcGxlIHJlZ2V4
cCBmb3IgYSBsaW5lLCBhc3N1bWluZyB0aGF0CmxpbmUgd2l0aCBmdW5jdGlvbiBuYW1lIGNhbm5v
dCBzdGFydCB3aXRoIGEgJ25vbi1hbHBoYScgY2hhcmFjdGVycy4gU28KZXZlbiBhZGRpbmcgb25l
IG1vcmUgc3BhY2UgYmVmb3JlIGEgbGluZSB3aXRoIGZ1bmN0aW9uIG5hbWUgYnJlYWtzIGl0LgoK
ZGlmZnV0aWxzLTMuNy9zcmMvZGlmZi5jOjQ2MgogICAgY2FzZSAncCc6CiAgICAgIHNob3dfY19m
dW5jdGlvbiA9IHRydWU7CiAgICAgIGFkZF9yZWdleHAgKCZmdW5jdGlvbl9yZWdleHBfbGlzdCwg
Il5bWzphbHBoYTpdJF9dIik7CgpJdCBpcyBwcm9iYWJseSBjb3VsZCBiZSBpbXByb3ZlZCBieSBh
ZGRpbmcgJ25vIDogc3ltYm9sIGF0IHRoZSBlbmQgb2YKdGhlIGxpbmUnIGxvZ2ljIHRvIHRoaXMg
cmVnZXhwLiBJdCB3aWxsIHJlc29sdmUgdGhlIGlzc3VlIHdpdGggbGFiZWxzLApidXQgd2lsbCBh
ZGQgb25lIG1vcmUgYnVnIChvciBsaW1pdGF0aW9uKSBhYm91dCB1c2luZyAiOiIgaW4gc3VjaAps
aW5lcy4KClRoZSBpc3N1ZSBpcyBtb3JlIGdlbmVyYWwgaGVyZS4gVGhlIGRpZmYgdG9vbCBzaG91
bGQgbm90IHBhcnNlIGFueQpwcm9ncmFtbWluZyBsYW5ndWFnZXMsIGl0IHNob3VsZCBqdXN0IGNv
bXBhcmUgdGhlIHN0cmluZ3MuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
