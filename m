Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B878827
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 11:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1jR-0000lE-CH; Mon, 29 Jul 2019 09:14:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lmhy=V2=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hs1jP-0000l7-Bu
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 09:14:11 +0000
X-Inumbo-ID: 39788d0e-b1e1-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39788d0e-b1e1-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 09:14:10 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k8so118430041iot.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqbsLeclLbfi+L02npe7JLAEg9jGtuRrpuo7V9jPphQ=;
 b=ViI5cY5Z8keH2q5UNW79kBY9EusSEIilSXZhD8f53gXPiZOz/33LRcOH6z9QRAHzCL
 2bYiWb6n311enismJ/wz+c4iti021xi/HH3IKIr82F0vFG0OAd/tgWKilus15qiCpjmH
 tDyZsZeouseVqh3O5pL1C/VhzuTRhl98KlHgBUHJ25+tWUH+L+e8K2bTxyPpc/e2CgDy
 p2OuaiQReQasNPq9/t5SKrjgj+uaXScQNYhK6yfkdkZvbRQlzYVtxwty9lNIBA/94+OE
 Ckqe9TwJRLVvZwYmtVyWDX/bUWult3iPWmP1uLFB70LmXOddh5cRR15HXwXcHp1Hsn/G
 W9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqbsLeclLbfi+L02npe7JLAEg9jGtuRrpuo7V9jPphQ=;
 b=Hlg3OM+BO0SYvuuwBrthObQ/nONXgRyM2a9xG2o6ZhFLqL66F4UHmL9o4pV08+Q8qa
 Z5AkTvCqq1CseRmUgNgnaWQPi+CBKe6PyQNFNwa438Ax7ESRRUBMb/dOaVxRdDZoCJrn
 JFkwgwolqG3HxxjE7qNClic9L5aFl8k//80vud0dOR0bR7zoTPpvHuDF8ml6XBTvPeVz
 D5HDNtxMdPiuXyxxqBVXgbg7QFKBdF/E16qSitA3M9lppcjHoYlHR3nppDMxZ00ArIrV
 bMRBsnwdW7q8d5r4J8RGo4UWmm5lt0fuB+bZy2O3FfjepjY6uPfKUEwi+5WHPtyZqXxp
 9/Lw==
X-Gm-Message-State: APjAAAVyBD1UuCpdt4he5N8BMEMuL+Zx0S+UJvPsUlGvvDj9lz1RAorz
 RykzfANQit6Dq3g3IdJdv2Uptom6DKirzAj1EuY=
X-Google-Smtp-Source: APXvYqyE4x3laTywlC5JCm0Lm1KAEkLNxZEFyG22Y1WESd4JA+ikAqG+GrcwBaA4Vc8BYuM+lEBXHMb1ucFwU8gaYtU=
X-Received: by 2002:a5e:9506:: with SMTP id r6mr34901783ioj.219.1564391649756; 
 Mon, 29 Jul 2019 02:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
In-Reply-To: <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Mon, 29 Jul 2019 12:13:58 +0300
Message-ID: <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Lars Kurth <lars.kurth.xen@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMzo1MCBQTSBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+IEkgaGF2ZSBhbHJlYWR5IGRvbmUgc29t
ZSB0ZXN0aW5ncyBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28gd2l0aCB0aGUgcGF0Y2ggWzFdLiBJCj4g
aGF2ZSBzZW50IHNvbWUgY29tbWVudHMgcmVnYXJkaW5nIHRoZSBjaGFuZ2UgbWFkZSBieSB0aGUg
dG9vbHMgdGhhdCByZXF1aXJlIHNvbWUKPiBhdHRlbnRpb24uIEl0IHdvdWxkIGJlIGdvb2QgaWYg
c29tZW9uZSBnbyB0aHJvdWdoIHRoZW0gYW5kIHRyeSB0byBhZGRyZXNzIG9uZSBieQo+IG9uZS4g
Rm9yIGNvbnZlbmllbmNlIEkgaGF2ZSByZXBsaWNhdGVkIG15IGUtbWFpbCBwdWJsaWNseSBiZWxv
dy4KCj4gKioqIHhlbi9hcm0vZG9tYWluX2J1aWxkLmMgKioqCj4KPiAqKioqKgo+Cj4gLSAgICBE
MTFQUklOVCgiQWxsb2NhdGVkICUjIlBSSXBhZGRyIi0lIyJQUklwYWRkciIgKCVsZE1CLyVsZE1C
LCBvcmRlciAlZClcbiIsCj4gLSAgICAgICAgICAgICBzdGFydCwgc3RhcnQgKyBzaXplLAo+IC0g
ICAgICAgICAgICAgMVVMIDw8IChvcmRlciArIFBBR0VfU0hJRlQgLSAyMCksCj4gKyAgICBEMTFQ
UklOVCgiQWxsb2NhdGVkICUjIiBQUklwYWRkciAiLSUjIiBQUklwYWRkcgo+ICsgICAgICAgICAg
ICAgIiAoJWxkTUIvJWxkTUIsIG9yZGVyICVkKVxuIiwKPiAgICBXZSB1c3VhbGx5IHJlY29tbWVu
ZCB0byBhdm9pZCBzcGxpdHRpbmcgdGhlIGZvcm1hdCBzdHJpbmcgc28gaXQgaXMKPiBlYXNpZXIg
dG8gZ3JlcCBpbiB0aGUgY29kZS4KCkluIHRoaXMgY2FzZSwgdGhlIHN0cmluZyBpcyBsb25nZXIg
dGhhbiA3OSBjaGFyYWN0ZXJzLCBzbyB0aGVyZSB3YXMgc3BsaXR0aW5nLgoKPgo+ICoqKioqCj4K
PiAtIyBkZWZpbmUgRDExUFJJTlQoZm10LCBhcmdzLi4uKSBkbyB7fSB3aGlsZSAoIDAgKQo+ICsj
ZGVmaW5lIEQxMVBSSU5UKGZtdCwgYXJncy4uLikgXAo+ICsgICAgZG8geyAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgfSB3aGlsZSAoIDAgKQo+Cj4gSXQgaXMgZmFpcmx5IGNvbW1vbiB0
byBrZWVwIGV2ZXJ5dGhpbmcgb24gYSBsaW5lIHdoZW4gdGhlCj4gYm9keSBpcyBlbXB0eS4gV2Ug
YWxzbyB1c2UgaXMgZm9yIHN0dWIgc3RhdGljIGlubGluZSBoZWxwZXIuCj4gSSBhbSBub3Qgc3Vy
ZSBob3cgZGlmZmljdWx0IGl0IHdvdWxkIGJlIHRvIGltcGxlbWVudCB0aGF0IHdpdGggY2xhbmct
Zm9ybWF0LgoKU29ycnkgZm9yIHJlcGVhdGluZyBpdCBhZ2FpbiBhbmQgYWdhaW4sIGJ1dCBzdWNo
IGNhc2VzIHNob3VsZCBiZSBhZGRlZAp0byB0aGUgY29kaW5nIHN0eWxlIGRvY3VtZW50IGV4cGxp
Y2l0bHkuCkl0IGlzIHVua25vd24gaG93IGRpZmZpY3VsdCBpdCB3b3VsZCBiZSB0byBpbXBsZW1l
bnQgdGhhdCB3aXRoCmNsYW5nLWZvcm1hdCwgaG93ZXZlciwgaXQgY2FuIGJlIGFuYWx5emVkLgo+
Cj4gKioqKioKPgo+IC0gICAgLyogU2VlIGxpbnV4Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybSxnaWMudHh0ICovCj4gKyAgICAvKiBT
ZWUgbGludXgKPiArICAgICAqIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9hcm0sZ2ljLnR4dCAqLwo+Cj4gTXVsdGktbGluZXMgY29tbWVudCBv
biBYZW4gYXJlIHVzaW5nCj4gLyoKPiAgICogRm9vCj4gICAqIEJhcgo+ICAgKi8KClNlZSBteSBj
b21tZW50IGFib3V0IGNsYW5nLWZvcm1hdCBzdXBwb3J0cyBvbmx5IGNvbW1lbnRzIGluZGVudGF0
aW9uIGZvciBub3cuCgo+Cj4gKioqKioKPgo+IC0gICAgY29uc3QgY2hhciBjb21wYXRbXSA9Cj4g
LSAgICAgICAgImFybSxwc2NpLTEuMCIiXDAiCj4gLSAgICAgICAgImFybSxwc2NpLTAuMiIiXDAi
Cj4gLSAgICAgICAgImFybSxwc2NpIjsKPiArICAgIGNvbnN0IGNoYXIgY29tcGF0W10gPSAiYXJt
LHBzY2ktMS4wIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJcMCIKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAiYXJtLHBzY2ktMC4yIgo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICJcMCIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAiYXJtLHBzY2kiOwo+Cj4gSSBh
bSBub3Qgc3VyZSB3aHkgY2xhbmctZm9ybWF0IGRlY2lkZWQgdG8gZm9ybWF0IGxpa2UgdGhhdC4g
RG8geW91IGtub3cgd2h5PwoKVGhlIHJlYXNvbiBpcyB0aGF0IHRoZXJlIGFyZSB0d28gc3RyaW5n
cyBpbiBvbmUgbGluZS4gSXQgd291bGQgbm90CmNoYW5nZSBpdCBpZiBpdCB3ZXJlCm5vdCAiYXJt
LHBzY2ktMS4wIiJcMCIsIGJ1dCAiYXJtLHBzY2ktMS4wXDAiLgoKPgo+ICoqKioqCj4KPiAtICAg
IGNsb2NrX3ZhbGlkID0gZHRfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiY2xvY2stZnJlcXVlbmN5
IiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNsb2NrX2ZyZXF1
ZW5jeSk7Cj4gKyAgICBjbG9ja192YWxpZCA9Cj4gKyAgICAgICAgZHRfcHJvcGVydHlfcmVhZF91
MzIoZGV2LCAiY2xvY2stZnJlcXVlbmN5IiwgJmNsb2NrX2ZyZXF1ZW5jeSk7Cj4KPiBJIGFtIG5v
dCBzdXJlIHdoeSBjbGFuZy1mb3JtYXQgZGVjaWRlIHRvIGZvcm1hdCBsaWtlIHRoYXQuIFRoZSBj
dXJyZW50IHZlcnNpb24KPiBpcyBkZWZpbml0ZWx5IHZhbGlkLgoKVGhlIGN1cnJlbnQgdmVyc2lv
biBpcyBub3QgdmFsaWQgYXMgaXQgdGFrZXMgODEgY2hhcnMsIHdoaWxlIDc5IGlzCmFsbG93ZWQg
YWNjb3JkaW5nIHRvIGNvZGluZyBzdHlsZS4KCj4KPiAqKioqKgo+Cj4gLSBnb3RfYmFuazA6Cj4g
K2dvdF9iYW5rMDoKPgo+IElJUkMsIEphbiByZXF1ZXN0cyB0byBoYXZlIGEgc3BhY2UgYmVmb3Jl
IHRoZSBsYWJlbC4gSmFuPwo+Cj4gSmFuJ3MgYW5zd2VyIHdhczoKPgo+IFllcy4gTm8gaW5kZW50
YXRpb24gYXQgYWxsIGZvciBsYWJlbHMgbGVhZHMgdG8gdGhlbSBiZWluZwo+ICh3cm9uZ2x5KSB1
c2VkIHdoZW4gZGlmZiAtcCB0cmllcyB0byBpZGVudGlmeSBjb250ZXh0LiBUaGF0J3MKPiB0aGUg
Y2FzZSBldmVuIHdpdGggdXAtdG8tZGF0ZSBkaWZmIGlpcmM7IEkgZG9uJ3QgcmVjYWxsCj4gd2hl
dGhlciBnaXQgYWxzbyBnZXRzIGNvbmZ1c2VkIGJ5IHRoaXMuCj4KU28gY3VycmVudCBjbGFuZy1m
b3JtYXQgYmVoYXZpb3VyIGlzIGNvcnJlY3QgYW5kIG5vdGhpbmcgdG8gY2hhbmdlLgoKPiAqKioq
Kgo+Cj4gLSAgICBjb25zdCBjaGFyIGNvbXBhdFtdID0KPiAtICJ4ZW4seGVuLSJfX3N0cmluZ2lm
eShYRU5fVkVSU0lPTikiLiJfX3N0cmluZ2lmeShYRU5fU1VCVkVSU0lPTikiXDAiCj4gLSAgICAg
ICAgInhlbix4ZW4iOwo+ICsgICAgY29uc3QgY2hhciBjb21wYXRbXSA9ICJ4ZW4seGVuLSIgX19z
dHJpbmdpZnkoWEVOX1ZFUlNJT04pICIuIiBfX3N0cmluZ2lmeSgKPiArICAgICAgICBYRU5fU1VC
VkVSU0lPTikgIlwwIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAieGVuLHhlbiI7Cj4KPiBX
aGF0IGlzIHRoZSBjb2Rpbmcgc3R5bGUgcnVsZSBmb3IgdGhpcyBjaGFuZ2U/CgpJdCBzZWVtcyB0
aGUgcmVhc29uIGZvciB0aGUgY2hhbmdlIGlzIHRoZSB3cm9uZyBpbmRlbnRhdGlvbiBvZiB0aGUK
c2Vjb25kIGxpbmUsIHdoZW4gdGhlIGZpcnN0IGxpbmUgaGFzIGV4dHJhIHNwYWNlLCBub3Qgc3Vy
ZS4KCj4gKioqKioKPgo+IC0gICAgc3RydWN0IG1hcF9yYW5nZV9kYXRhIG1yX2RhdGEgPSB7IC5k
ID0gZCwgLnAybXQgPSBwMm10IH07Cj4gKyAgICBzdHJ1Y3QgbWFwX3JhbmdlX2RhdGEgbXJfZGF0
YSA9IHsuZCA9IGQsIC5wMm10ID0gcDJtdH07Cj4KPiBBRkFJQ1QsIHdlIGNvbW1vbmx5IHB1dCBh
IHNwYWNlIGFmdGVyIHsgYW5kIGJlZm9yZSB9LgoKVGhpcyBpcyBubyBleHBsaWNpdGx5IGRvY3Vt
ZW50ZWQgaW4gdGhlIGNvZGluZyBzdHlsZS4KSXQgc3RpbGwgc2VlbXMgbm90IGFuIGlzc3VlIHRv
IGFkZCBzdWNoIGNhc2VzIHRvIGNsYW5nLWZvcm1hdC4KCj4gKioqIHhlbi9hcm0vbW0uYyAqKioK
Pgo+ICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBvZmZzZXRzWzRdID0gewo+IC0gICAgICAgIHpl
cm9ldGhfdGFibGVfb2Zmc2V0KGFkZHIpLAo+IC0gICAgICAgIGZpcnN0X3RhYmxlX29mZnNldChh
ZGRyKSwKPiAtICAgICAgICBzZWNvbmRfdGFibGVfb2Zmc2V0KGFkZHIpLAo+IC0gICAgICAgIHRo
aXJkX3RhYmxlX29mZnNldChhZGRyKQo+IC0gICAgfTsKPiArICAgICAgICB6ZXJvZXRoX3RhYmxl
X29mZnNldChhZGRyKSwgZmlyc3RfdGFibGVfb2Zmc2V0KGFkZHIpLAo+ICsgICAgICAgIHNlY29u
ZF90YWJsZV9vZmZzZXQoYWRkciksIHRoaXJkX3RhYmxlX29mZnNldChhZGRyKX07Cj4KPiBUaGUg
b2xkIGNvZGUgaXMgdGVjaG5pY2FsbHkgdmFsaWQgYW5kIEkgZmluZCB0aGUgbmV3IGNvZGUgbGVz
cyByZWFkYWJsZS4gV2h5Cj4gY2xhbmctZm9ybWF0IGRlY2lkZWQgdG8gcmVmb3JtYXQgaXQ/IEkg
bm90aWNlZCBzaW1pbGFyIHRoaW5ncyBwcm9ibGVtIHdpdGgKPiBwcm90b3R5cGUuCgpJdCBpcyBu
b3QgY2xlYXIgYW5kIHRvIGJlIGludmVzdGlnYXRlZC4KCj4KPiAqKioqKgo+Cj4gLSAgICByYyA9
IGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KGN1cnJlbnQtPmRvbWFpbiwgZ2FkZHJfdG9fZ2ZuKGFk
ZHIpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFtZSwgMCwgdCk7Cj4g
KyAgICByYyA9IGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KGN1cnJlbnQtPmRvbWFpbiwgZ2FkZHJf
dG9fZ2ZuKGFkZHIpLCBmcmFtZSwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdCk7Cj4KPiBJdCBmZWVscyB0byBtZSB0aGF0IGNsYW5nLWZvcm1hdCBpcyB0cnlpbmcgdG8g
Y3JhbSBhcyBtdWNoIGFzIHBvc3NpYmxlIG9uIGEKPiBsaW5lLiAgQ2FuIHlvdSBjb25maXJtIGl0
PwoKU2VlbXMgeWVzLCBpbiB0aGlzIGNhc2UuCgo+Cj4gVGhlIGNvZGUgcGVyIHNlIGlzIHZhbGlk
IGFuZCBpdCBmZWVscyB0byBtZSBtb3JlIHJlYWRhYmxlLiBJIHdvdWxkIGV4cGVjdAo+IGNsYW5n
LWZvcm1hdCB0byBub3QgbW9kaWZ5IGEgbGluZSBpZiB0aGUgY29kZSBpcyB2YWxpZCBwZXIgdGhl
IGNvZGluZyBzdHlsZS4KClRoZSB0aGluZyBpcyB3aGF0IGlzIHRoZSBkZWZpbml0aW9uIG9mICJt
b3JlIHJlYWRhYmxlIiBhbmQgInZhbGlkIHBlcgp0aGUgY29kaW5nIHN0eWxlIi4KSW4gdGhpcyBj
YXNlLCBpdCB0cmllcyB0byB1c2UgYWxsIG9mIHRoZSA3OSBjaGFyYWN0ZXJzIG9mIHRoZSBsaW5l
LgoKPiAqKioqKgo+Cj4gLSAgICBzd2l0Y2ggKCBhdHRyICkKPiArICAgIHN3aXRjaCAoYXR0cikK
Pgo+IHN3aXRjaCBpcyBhIGxvZ2ljYWwgc3RhdGVtZW50LCBzbyB3ZSByZXF1aXJlIHRoZSBzcGFj
ZSBhZnRlciAoIGFuZCBiZWZvcmUgKS4KClRoaXMgaXMgdG8gYmUgYWRkZWQgdG8gaW1wbGVtZW50
YXRpb24uCgpUaGFua3MKPgo+Cj4gLS0KPiBKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
