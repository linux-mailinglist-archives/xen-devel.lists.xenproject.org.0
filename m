Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFE76B6A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:21:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr12t-0002av-6A; Fri, 26 Jul 2019 14:18:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr12r-0002aq-9f
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:18:05 +0000
X-Inumbo-ID: 2e7794b6-afb0-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e7794b6-afb0-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:18:04 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id f4so105128714ioh.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2NpB6+KO/Yf2WuAPzlYbs9+hpbY5ouyh2c61FXwaJI=;
 b=IDtpdNnf/H0ElRkATXhQBJMbhZACfN59Wpgoo9r9w4IGaWcBjOkGW0bAU34MWw5bFB
 PURh+UDjcsuMep1AjShlovVRhKTQN3jM1UaOuJYYTUFhEAzIU54i5JhKWQJQkNB5dvsi
 i1UtsrZSGL5lHO3rE0qKT56RW9nGUsoHZr4ePTHeCl4r5GBNJjgqqp3IsGptk/faZB/L
 oac06TIeCOW/a8/puqdrEGnZgYc3Pj5c66cqb8OOqMIHbnxcm6RdwPUFx1H3uw3HLXSu
 imLRYw2PXIKma63QH8DUFoIONe02VEbblA3+t8vCGLxbIW6kbQRFUF2MJsx+Axk00TUy
 gs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2NpB6+KO/Yf2WuAPzlYbs9+hpbY5ouyh2c61FXwaJI=;
 b=SmzyxxbVIaVlzbdWEualzy7TBXOSCL9Ys0z2NOf+Hrg7xsQDktorYojHd4kmkjCB4S
 Etvy0+LUpZrgrIyvhGFFXh3gk0ikb6LaLWLQEjm8A5zSEL/GilpgCy/6q5GYAKZyOSgW
 D/+VQakE/G9a3/eCnbw5e8bbrvaC70wTXmhEYcY1e789sTgorXb0J9esfv7KBlbmlv1r
 Mx6zet4WDoRiYk7WblEMHwC9EzIbKufcJPoiO8Dlj/bCH5YF0mV2zzqaa9cFiPsMUHNr
 /Admjyy4anteqRl3sQT/X58f2J188tL/2NhxQv1ehjbcBOUARBAwE41a1DMijqAcwTts
 m5dQ==
X-Gm-Message-State: APjAAAVEP6qT0O8Qmsy7LYYwTEs05Fi3oYam7TdXIPAzbnAA3II6wgYa
 edt8rqJ7IoIdNPm+SnNerg1HeMLkuzhwByjKHJM=
X-Google-Smtp-Source: APXvYqylNafaD5XMjTHpx+5MjK+ePzvDxNMoYrJdIM3i9M3KyfJ3vZIoQ6kjZGAIkvfEMY95J2z1gHa923m1LzX+EaE=
X-Received: by 2002:a02:16c5:: with SMTP id a188mr99803787jaa.86.1564150683621; 
 Fri, 26 Jul 2019 07:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <CAOcoXZbXPys+LjzhwP5f75rcKSXKatmPSaiA+MvVVm0_FWK7GA@mail.gmail.com>
 <D8A1ACAC-5830-4C1A-8A85-A86C5B05246D@gmail.com>
In-Reply-To: <D8A1ACAC-5830-4C1A-8A85-A86C5B05246D@gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:17:52 +0300
Message-ID: <CAOcoXZbHJxuDfGQK4mPBGvcPgZhgO6SwsQwwTBc=4z+=C3yfyw@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNDo1MiBQTSBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhl
bkBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IHRoYW5rIHlvdSBmb3IgcHV0dGluZyB0aGlzIG1haWwg
dG9nZXRoZXIgYW5kIGRyaXZpbmcgdGhpcyBmb3J3YXJkLiBJIGFkZGVkIGNvbW1pdHRlcnNAIGFz
IHdlbGwgYXMgRG91Zy4gSSBhbSBnb2luZyB0byBsZXQgb3RoZXJzIHJlc3BvbmQgZmlyc3QuCj4g
Pj4gSSBhbSBhc3N1bWluZyB3ZSBhcmUgbG9va2luZyBmb3Igc29tZSB0ZXN0aW5nPwo+ID4KPiA+
IFllcywgeW91IGFyZSByaWdodC4KPiA+IFRoZSBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbiB1cGRh
dGVkIGFuZCByZXRlc3RlZCB3aXRoIG5ld2VyIHZlcnNpb25zCj4gPiBvZiBjbGFuZyBjb2RlLgo+
ID4gV2UgYXJlIGxvb2tpbmcgZm9yIHNvbWUgdGVzdGluZyBhbmQgZmVlZGJhY2sgdG8gbW92ZSBm
b3J3YXJkLgo+ID4KPiA+PiBJcyB0aGVyZSBhIHNpbXBsZSBzZXQgb2YgaW5zdHJ1Y3Rpb25zIHRv
IGdldCBzdGFydGVkIGFuZCB0ZXN0IHRoZSB0b29sPwo+ID4KPiA+IFllcywgaG93ZXZlciwgc2lu
Y2UgdGhlIGNoYW5nZXMgYXJlIG5vdCBpbnRlZ3JhdGVkIGludG8gY2xhbmctZm9ybWF0Cj4gPiBt
YWlubGluZSB5ZXQsCj4gPiB0byB0ZXN0IHRoZSB0b29sIGl0IG5lZWRzIHRvIGNvbXBpbGUgY2xh
bmctZm9ybWF0IHRvb2wgd2l0aCB0aGUgcGF0Y2ggZmlyc3QuCj4KPiBPSwo+IElzIHRoZXJlIGEg
Z2l0IHJlcG8gd2hpY2ggaW5jbHVkZXMgdGhlIHBhdGNoPyBUaGF0IHdvdWxkIG1ha2UgdGhpbmdz
IGEgbGl0dGxlIGVhc2llcgoKVGhlcmUgaXMgbm8gbGx2bSByZXBvIHdpdGggdGhlIHBhdGNoIHNp
bmNlIHdlIGNoZWNrZWQgdmFyaW91cyByZWxlYXNlcwpvZiBjbGFuZyB3aXRoIGl0Li4uLgpIb3dl
dmVyLCBpdCBpcyBhIGdvb2QgaWRlYSB0byBwcmVwYXJlIHN1Y2ggYSByZXBvIHRvIHNpbXBsaWZ5
IHRoZQpidWlsZCBvZiB0aGUgdG9vbC4KV2Ugd2lsbCBwcmVwYXJlIHRoZSByZXBvIGZvciBpdC4K
Cj4KPiA+IFRoZXJlIGFyZSB0d28gdXNlLWNhc2VzIHdpdGggaXQ6Cj4gPiAtIGNsYW5nLWZvcm1h
dCBiaW5hcnkgY2FuIGJlIHVzZWQgYXMtaXMgdG8gY2hlY2sgZ2l2ZW4gZmlsZSBvciBtYW55IGZp
bGVzLgo+ID4gRm9yIGV4YW1wbGUsIHRoZSBuZXh0IGNvbW1hbmQgZm9ybWF0cyBhbGwgeGVuICou
YyBmaWxlcyB3aXRoIGl0Lgo+ID4gZmluZCB+L3cveGVuL3hlbiAtbmFtZSAnKi5jJyAtcHJpbnQw
IHwgeGFyZ3MgLTAgLW4gMSAtUCAxMgo+ID4gfi93L2xsdm0tcHJvamVjdC9iaW4vY2xhbmctZm9y
bWF0IC1pIC1zdHlsZT14ZW4KPiA+Cj4gPiBTZWUgb3V0cHV0IGV4YW1wbGUgaW46Cj4gPiBodHRw
czovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vdmlrdG9yLW1pdGluL3hlbi1jbGFuZy1mb3Jt
YXQtZXhhbXBsZS9tYXN0ZXIvMDAwMS1jbGFuZy1mb3JtYXQtY2hlY2twYXRjaC1vdXRwdXQtZXhh
bXBsZS5wYXRjaAo+ID4KPiA+IC0gYW5vdGhlciB1c2UtY2FzZSBpcyB0byBydW4gaXQgd2l0aCBj
bGFuZy1mb3JtYXQgZGlmZiBjaGVja2VyLAo+ID4gRm9yIGV4YW1wbGUsIHRoZSBuZXh0IGNvbW1h
bmQgbGluZSBjaGVja3MgdGhlIGxhdGVzdCBjb21taXQgaW4gY2FzZSBvZiBnaXQ6Cj4gPiBnaXQg
ZGlmZiAtVTAgLS1uby1jb2xvciBIRUFEXiB8IGNsYW5nLWZvcm1hdC1kaWZmIC1wMQo+Cj4gRG9l
cyB0aGlzIHJlcXVpcmUgdG8gY29weSB0aGUgbW9kaWZpZWQgY2xhbmctZm9ybWF0LWRpZmYucHkg
KHdoaWNoIGlzIG1lbnRpb25lZCBpbiB0aGUgbWFpbCkgc29tZXdoZXJlCgpOb3QgcmVhbGx5LCBt
ZWFuIGl0IGRvZXMgbm90IHJlcXVpcmUgdG8gY29weSB0aGUgbW9kaWZpZWQKY2xhbmctZm9ybWF0
LWRpZmYucHkuIFRoZSBvbmx5IGZlYXR1cmUgbW9kaWZpZWQgY2xhbmctZm9ybWF0LWRpZmYucHkK
cHJvdmlkZXMgaXMgY292ZXJpbmcgY29kZSBmaWxlIHRvIGNvZGUgc3R5bGUgbWFwcGluZ3MuClRo
aXMgaXMgYSBtaW5vciBmZWF0dXJlLCBhbmQgaXQgaXMgbm90IHJlbGV2YW50IGZvciB0aGUgWGVu
IGNvZGUgc3R5bGUKcGF0Y2hlcyB0ZXN0aW5nLiBJdCBoYXMgYmVlbiBkZWNpZGVkIG5vdCB0byBt
b2RpZnkgcHl0aG9uIHRvb2wgZm9yCm5vdy4uLgpTbyBpdCBpcyBwb3NzaWJsZSB0byB1c2Ugbm90
IG1vZGlmaWVkIHZlcnNpb24gb2YgY2xhbmctZm9ybWF0LWRpZmYKdG9vbCBmb3IgdGhlIHBhdGNo
ZXMgY2hlY2tzLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
