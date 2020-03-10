Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA664180294
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:56:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhDW-00048q-Ur; Tue, 10 Mar 2020 15:54:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBhDV-00048l-MU
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:54:49 +0000
X-Inumbo-ID: 78789958-62e7-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78789958-62e7-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 15:54:49 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a20so11017059edj.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=eAXnhzN01Mzv7GM1HSDL4HHmo18Q3htM27Y4whagJMQ=;
 b=SplDy7XORWBJK23uqqz8k4UJRYabv+A3eCmsohpyAdmPckIqBWPyWF4fKZn6TyhxPq
 OBfjsuKN0N7uDTjVfzaEKNUKfyokKZtZIRCDJ5ADsPcSFGXAkMHj9vFkw4aBLt4ftblg
 H86Kh9qzdtz4zzfbMIRSDrXQ6pGLAPm47BmH5c7kIbu552EEPcSame6AfP2tcDUmtyv3
 K8sf5cdxvF4Q8wIlAChyf2P/bnTFuF4ejFe1NqpBf/4at/Yfot2okP4/OTVU1gwFbT37
 /VD43BIxTZyJUTZbAKn2J7UvZ4rTIVrtbOYyUpIMFTPF9ixzVe6dfrlhJ67kXWOiia25
 xnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=eAXnhzN01Mzv7GM1HSDL4HHmo18Q3htM27Y4whagJMQ=;
 b=LhEcHsjPC406vH4/Z5NYLCYCFzmNHQXEg3Q8Xk2xfXjHQTAf+nzMy/vuAwKSgBl8Pr
 7aPCHJudXP8jcgjBeKNaLR1+O+TVca16NNRujCypTxOTMjfTI0XVvzGhEK42GX15ur4/
 /0SAKBVi4tLkCD2xU8S46MW+HTFoj6+1NB+pDilID4yIdr8VBVjl/McVWraQjXwJTo/+
 y/kbnNYzbabIb33ZezJWJ7PqYXSmXtfyRNVJEfuU64p69VZOD147MnRB1SEjlODoCMxf
 BZ19p9cVeQrwDaWj4a2Bd+J3VZh4Gok5h4y/yDLeZ9FxjdUsSgk3PJWSTi3ZZDyMKdPl
 7/vQ==
X-Gm-Message-State: ANhLgQ2sEeywJevHO3EMb/l9L+yPKOfdR0QdVPpvDIJEOvYLUJn2QYg9
 5qoP/BkC2KgswO6JDx8LxPk=
X-Google-Smtp-Source: ADFU+vuqKb3uVc02mKb9VPveLIIUCNqzNuESKTtfpCGflZza39aNM07nX10qmrj70gcm4Q7Dv+o9Zw==
X-Received: by 2002:aa7:d793:: with SMTP id s19mr22434805edq.306.1583855688339; 
 Tue, 10 Mar 2020 08:54:48 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v2sm3600690ejj.44.2020.03.10.08.54.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:54:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
 <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
 <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
 <1b2299fa-c19c-19fc-820a-783642ea85d5@suse.com>
 <002f01d5f6ee$e2edc3e0$a8c94ba0$@xen.org>
 <89616d2f-62ae-8c08-377c-0a7c3f082884@suse.com>
In-Reply-To: <89616d2f-62ae-8c08-377c-0a7c3f082884@suse.com>
Date: Tue, 10 Mar 2020 15:54:46 -0000
Message-ID: <003001d5f6f4$39a315a0$ace940e0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgMqvTqhAWAuss4C0MCOMwISxzrQATzy1GYB0OkvGQG77WJWAdozx2endPHfQA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDE1OjMzCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdQYXVsIER1cnJhbnQnIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgJ0FuZHJldyBDb29wZXInCj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyAnUm9nZXIgUGF1IE1vbm7DqScgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMy82XSB4ODYgLyBw
djogZG8gbm90IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0KPiAKPiBPbiAxMC4wMy4yMDIw
IDE2OjE2LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gU2VudDog
MTAgTWFyY2ggMjAyMCAxNToxMwo+ID4+IFRvOiBwYXVsQHhlbi5vcmcKPiA+PiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyAnUGF1bCBEdXJyYW50JyA8cGR1cnJhbnRAYW1hem9u
LmNvbT47ICdBbmRyZXcgQ29vcGVyJwo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsg
J1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgJ1JvZ2VyIFBhdSBNb25uw6knIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDMvNl0geDg2IC8gcHY6IGRvIG5v
dCB0cmVhdCBQR0NfZXh0cmEgcGFnZXMgYXMgUkFNCj4gPj4KPiA+PiBPbiAxMC4wMy4yMDIwIDE2
OjA1LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+Pj4gU2Vu
dDogMTAgTWFyY2ggMjAyMCAxNDo1OQo+ID4+Pj4KPiA+Pj4+IEluIHJlcGx5IHRvIHBhdGNoIDYg
SSBkaWQgc3VnZ2VzdCB0bwo+ID4+Pj4gaGF2ZSBhIHNlcGFyYXRlIGxpc3QsIGJ1dCB3aXRob3V0
IHRha2luZyB0aGVzZSBwYWdlcyBvZmYKPiA+Pj4+IGQtPnBhZ2VfbGlzdCwKPiA+Pj4KPiA+Pj4g
SG93IHdvdWxkIHRoYXQgd29yayB3aXRob3V0IGFkZGluZyBhbiBleHRyYSBwYWdlX2xpc3RfZW50
cnkgaW50byBzdHJ1Y3QgcGFnZV9pbmZvPwo+ID4+Cj4gPj4gQXMgc2FpZCB0aGVyZSwgaXQnZCBi
ZSBhIHNpbmdseSBsaW5rZWQgbGlzdCB1c2luZyBhIF9fcGR4X3QKPiA+PiBmaWVsZCBqdXN0IGxp
a2UgdGhlcmUgYWxyZWFkeSBpcyB3aXRoICJuZXh0X3NoYWRvdyIsIGkuZS4KPiA+PiB5b3UnZCBh
ZGQgYW5vdGhlciB1bmlvbiBtZW1iZXIgIm5leHRfZXh0cmEiIG9yIHNvbWUgc3VjaC4gT2YKPiA+
PiBjb3Vyc2UgdGhlIGxpc3Qgc2hvdWxkbid0IGdyb3cgdG9vIGxvbmcsIG9yIGVsc2UgaW5zZXJ0
aW9uCj4gPj4gYW5kIHJlbW92YWwgbWF5IGJlY29tZSBhIGJvdHRsZW5lY2suIE5vdCBzdXJlIGhv
dyB3ZWxsIHRoaXMKPiA+PiB3b3VsZCBmaXQgQXJtLCB0aG91Z2g7IG1heWJlIHRoZXkgd291bGRu
J3QgbmVlZCB0aGlzLCBidXQKPiA+PiB0aGF0IGRlcGVuZHMgb24gd2hldGhlciB0aGUgbGlzdCB3
b3VsZCBiZSB1c2VkIGZvciBwdXJwb3Nlcwo+ID4+IGJleW9uZCBkdW1waW5nLgo+ID4KPiA+IFRo
YXQgc2VlbXMgbW9yZSBvYnNjdXJlIGFuZCBidWctcHJvbmUgdGhhbiBhbiBleHRyYSBsaXN0IGhl
YWQKPiA+IGluIHN0cnVjdCBkb21haW4uIEknZCByZWFsbHkgcHJlZmVyIHRvIHN0aWNrIHdpdGgg
dGhhdCBldmVuCj4gPiBpZiBpdCBkb2VzIG1ha2UgdGhpbmdzIGEgbGl0dGxlIG1vcmUgdWdseSB1
bnRpbCB4ZW5wYWdlX2xpc3QKPiA+IGdvZXMgYXdheS4KPiAKPiBPa2F5IHdpdGggbWUgaWYgdGhl
cmUgcmVhbGx5IHdhcyBubyBwcm9wZXJ0eSAob3RoZXIgdGhhbgo+IGFzc2lnbl9wYWdlcygpIHRo
ZW4gbmVlZGluZyB0byBwaWNrIHRoZSByaWdodCBsaXN0LCB3aGljaCBpcwo+IG5vdCBtdWNoIGRp
ZmZlcmVudCBmcm9tIG5lZWRpbmcgdG8gcHV0IHRoZSBleHRyYSBwYWdlcyBvbiB0d28KPiBsaXN0
cykgdGhhdCB5b3UnZCBsb3NlIGJ5IG5vIGxvbmdlciBoYXZpbmcgdGhlIHBhZ2VzIG9uIHRoZQo+
IHNhbWUgbGlzdC4KCkp1c3QgYXNzaWduX3BhZ2VzKCkgYW5kIGFyY2hfZnJlZV9oZWFwX3BhZ2Uo
KSwgYW5kIG15IHRlc3QgcGF0Y2ggZGVmaW5lczoKCitzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdl
X2xpc3RfaGVhZCAqcGFnZV90b19saXN0KAorICAgIHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0
cnVjdCBwYWdlX2luZm8gKnBnKQoreworICAgIGlmICggaXNfeGVuX2hlYXBfcGFnZShwZykgKQor
ICAgICAgICByZXR1cm4gJmQtPnhlbnBhZ2VfbGlzdDsKKyAgICBlbHNlIGlmICggcGctPmNvdW50
X2luZm8gJiBQR0NfZXh0cmEgKQorICAgICAgICByZXR1cm4gJmQtPmV4dHJhX3BhZ2VfbGlzdDsK
KworICAgIHJldHVybiAmZC0+cGFnZV9saXN0OworfQoKd2hpY2ggdGhleSBib3RoIHVzZSB0byBz
ZWxlY3QgdGhlIHJpZ2h0IGxpc3QuCgpPbmNlIHhlbnBhZ2VfbGlzdCBnb2VzIGF3YXkgdGhlbiB0
aGlzIGNhbiBiZSBzaW1wbGlmaWVkIHRvIHVzZSBhIHRlcm5hcnkgb3BlcmF0b3IuCgogIFBhdWwK
Cj4gCj4gSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
