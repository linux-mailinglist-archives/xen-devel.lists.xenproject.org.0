Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BED72F9B9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548636.856661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N6f-0005tG-N8; Wed, 14 Jun 2023 09:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548636.856661; Wed, 14 Jun 2023 09:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N6f-0005rH-IZ; Wed, 14 Jun 2023 09:48:01 +0000
Received: by outflank-mailman (input) for mailman id 548636;
 Wed, 14 Jun 2023 09:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRK2=CC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q9N6d-0005rB-Vs
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:48:00 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89eaceda-0a98-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 11:47:56 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so8568091e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 02:47:56 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a19f50e000000b004f645d15150sm2035536lfb.277.2023.06.14.02.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 02:47:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 89eaceda-0a98-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686736075; x=1689328075;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SDYhrbqb109v9AIQIXTNEd18fXk/huAC/WHDfPBoFhY=;
        b=nrasBDSmT1NmFSUyU2C67A/sMFLe1Vzgk+Xm/0vFS9edOjXWokuJ8TWk6pABNAfkpd
         ArtCO5XOr46EN/gPeI8cur2jpX5jbHmnsIeu7z19o7ue6OVxbLUYZ00IBAyZQYfM7h8r
         POyEXfBbVSJ308za9zkQ2HoAtaaAJ5yKPd1cs3quLZqUcvCR4Wjreqx009PYD6pUY/j0
         W39YXxb8WM6ozpw+3+mNpZg3PxNhA0S+A0j0ixGHcF8yjB2/L4r7JBTKFSUiQ0LQh3Gz
         rj2Kr8XWMK8AksSTool1UaV975vpzY5J8uqNEbt097DeAv3xOKVqXcieHAitJ5WYZs39
         VtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686736075; x=1689328075;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDYhrbqb109v9AIQIXTNEd18fXk/huAC/WHDfPBoFhY=;
        b=YVjGYc0+87XTBaxdEfIrlP8hVRtPwP628BTZkuaCBmLKGPCUVdKlyKM0QyWMT40TCh
         tBeJQNUlIGGvl1/KThJZcxNvjmfEs6z4G7XKTz6A+XnmDX0NQ8+A1DJG22uoE1iLtraU
         EOxGDzO/IWizbOLU2fEJflzLV8oG+sOoDVU+HMfJd7RBKkaembEaCh2KOniyq8xXBZqp
         9DvtKhZGOOoybDoMlmGR127tApQrUxg7QkXwSdwowK/aCHP3onCvo36UO1FcogbLWY+C
         EUJTGrKtZZENbhuoTlKX0bbODgvQad2jQWClo8wKQlH+PovCJ4fgYkYnXh6JqDRoLjEE
         1PBg==
X-Gm-Message-State: AC+VfDz5ijuhOmb71+PMplHjsqehwSA/8rHDl9cR27iaCO2WFHZNPzSa
	ORjduxcT1Nhyc+WzvVIzMmY=
X-Google-Smtp-Source: ACHHUZ6qfD6ZtzudA9TFzf6tQv3tSXuVAL9rqdgX/NSAIDIkB7+ItxU3O30qlKGxurc8lRQLdLFSGA==
X-Received: by 2002:a19:6446:0:b0:4e8:5e39:6234 with SMTP id b6-20020a196446000000b004e85e396234mr6935678lfj.16.1686736075221;
        Wed, 14 Jun 2023 02:47:55 -0700 (PDT)
Message-ID: <3fa74b20c3516dbeaceada0f8e045d697f926000.camel@gmail.com>
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 14 Jun 2023 12:47:54 +0300
In-Reply-To: <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
	 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

T24gTW9uLCAyMDIzLTA2LTEyIGF0IDE1OjQ4ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwNi4wNi4yMDIzIDIxOjU1LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gVGhlIHdheSBo
b3cgc3dpdGNoIHRvIHZpcnR1YWwgYWRkcmVzcyB3YXMgaW1wbGVtZW50ZWQgaW4gdGhlCj4gPiBj
b21taXQgZTY2MDAzZTdiZSAoInhlbi9yaXNjdjogaW50cm9kdWNlIHNldHVwX2luaXRpYWxfcGFn
ZXMiKQo+ID4gd2Fzbid0IHNhZmUgZW5vdWdoIHNvIGlkZW50aXR5IG1hcHBpbmcgd2FzIGludHJv
ZHVjZWQgYW5kCj4gPiB1c2VkLgo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzdWZmaWNpZW50
IGFzIGEgZGVzY3JpcHRpb24uIFlvdSB3YW50IHRvIG1ha2UKPiBjbGVhciB3aGF0IHRoZSAibm90
IHNhZmUgZW5vdWdoIiBpcywgYW5kIHlvdSBhbHNvIHdhbnQgdG8gZ28gaW50bwo+IG1vcmUgZGV0
YWlsIGFzIHRvIHRoZSBzb2x1dGlvbiBjaG9zZW4uIEknbSBwYXJ0aWN1bGFybHkgcHV6emxlZCB0
aGF0Cj4geW91IG1hcCBqdXN0IHR3byBzaW5ndWxhciBwYWdlcyAuLi4KSSdsbCB1cGRhdGUgYSBk
ZXNjcnB0aW9uLgoKSSBtYXAgdHdvIHBhZ2VzIGFzIGl0IGxpa2VseSB0byBiZSBlbm91Z2ggdG8g
c3dpdGNoIGZyb20gMToxIG1hcHBpbmcKd29ybGQuIE15IHBvaW50IGlzIHRoYXQgd2UgbmVlZCAx
OjEgbWFwcGluZyBvbmx5IGZvciBmZXcgaW5zdHJ1Y3Rpb25zCndoaWNoIGFyZSBsb2NhdGVkIGlu
IHN0YXJ0KCkgWyBpbiAudGV4dC5oZWFkZXIgc2VjdGlvbiBdOgoKICAgICAgICBsaSAgICAgIHQw
LCBYRU5fVklSVF9TVEFSVAogICAgICAgIGxhICAgICAgdDEsIHN0YXJ0CiAgICAgICAgc3ViICAg
ICB0MSwgdDEsIHQwCgogICAgICAgIC8qIENhbGN1bGF0ZSBwcm9wZXIgVkEgYWZ0ZXIganVtcCBm
cm9tIDE6MSBtYXBwaW5nICovCiAgICAgICAgbGEgICAgICB0MCwgLkxfcHJpbWFyeV9zd2l0Y2hl
ZAogICAgICAgIHN1YiAgICAgdDAsIHQwLCB0MQoKICAgICAgICAvKiBKdW1wIGZyb20gMToxIG1h
cHBpbmcgd29ybGQgKi8KICAgICAgICBqciAgICAgIHQwCgpBbmQgaXQgaXMgbmVlZGVkIHRvIG1h
cCAxOjEgY3B1MF9ib290X3N0YWNrIHRvIG5vdCB0byBmYXVsdCB3aGVuCmV4ZWN1dGluZyBlcGls
b2cgb2YgZW5hYmxlX21tdSgpIGZ1bmN0aW9uIGFzIGl0IGFjY2Vzc2VzIGEgdmFsdWUgb24gdGhl
CnN0YWNrOgogICAgZmZmZmZmZmZjMDAwMDFiMDogICAgICAgNjQyMiAgICAgICAgICAgICAgICAg
ICAgbGQgICAgICBzMCw4KHNwKQogICAgZmZmZmZmZmZjMDAwMDFiMjogICAgICAgMDE0MSAgICAg
ICAgICAgICAgICAgICAgYWRkaSAgICBzcCxzcCwxNgogICAgZmZmZmZmZmZjMDAwMDFiNDogICAg
ICAgODA4MiAgICAgICAgICAgICAgICAgICAgcmV0Cgo+IAo+ID4gQEAgLTM1LDggKzQwLDEwIEBA
IHN0YXRpYyB1bnNpZ25lZCBsb25nIHBoeXNfb2Zmc2V0Owo+ID4gwqAgKgo+ID4gwqAgKiBJdCBt
aWdodCBiZSBuZWVkZWQgb25lIG1vcmUgcGFnZSB0YWJsZSBpbiBjYXNlIHdoZW4gWGVuIGxvYWQK
PiA+IGFkZHJlc3MKPiA+IMKgICogaXNuJ3QgMiBNQiBhbGlnbmVkLgo+ID4gKyAqCj4gPiArICog
MyBhZGRpdGlvbmFsIHBhZ2UgdGFibGVzIGFyZSBuZWVkZWQgZm9yIGlkZW50aXR5IG1hcHBpbmcu
Cj4gPiDCoCAqLwo+ID4gLSNkZWZpbmUgUEdUQkxfSU5JVElBTF9DT1VOVCAoKENPTkZJR19QQUdJ
TkdfTEVWRUxTIC0gMSkgKyAxKQo+ID4gKyNkZWZpbmUgUEdUQkxfSU5JVElBTF9DT1VOVCAoKENP
TkZJR19QQUdJTkdfTEVWRUxTIC0gMSkgKyAxICsgMykKPiAKPiBXaGF0IGlzIHRoaXMgMyBjb21p
bmcgZnJvbT8gSXQgZmVlbHMgbGlrZSB0aGUgdmFsdWUgc2hvdWxkIChhZ2FpbikKPiBzb21laG93
IGRlcGVuZCBvbiBDT05GSUdfUEFHSU5HX0xFVkVMUy4KMyBpcyB0b28gbXVjaCBpbiB0aGUgY3Vy
cmVudCBjYXNlLiBJdCBzaG91bGQgYmUgMiBtb3JlLgoKVGhlIGxpbmtlciBhZGRyZXNzIGlzIDB4
RkZGRkZGRkMwMDAwMDAwMCB0aGVyZWJ5IG1hcHBpbmcgdGhlIGxpbmtlciB0bwpsb2FkIGFkZHJl
c3Nlcwp3ZSBuZWVkIDMgcGFnZXMgKCB3aXRoIHRoZSBjb25kaXRpb24gdGhhdCB0aGUgc2l6ZSBv
ZiBYZW4gd29uJ3QgYmUKbGFyZ2VyIHRoYW4gMiBNQiApIGFuZCAxIHBhZ2UgaWYgdGhlIGNhc2Ug
d2hlbiBYZW4gbG9hZCBhZGRyZXNzIGlzbid0CjJNViBhbGlnbmVkLgoKV2UgbmVlZCAyIG1vcmUg
cGFnZSB0YWJsZXMgYmVjYXVzZSBYZW4gaXMgbG9hZGVkIHRvIGFkZHJlc3MgMHg4MDIwMDAwMApi
eSBPcGVuU0JJIGFuZCB0aGUgbG9hZCBhZGRyZXNzIGlzbid0IGVxdWFsIHRvIHRoZSBsaW5rZXIg
YWRkcmVzcyBzbyB3ZQpuZWVkIGFkZGl0aW9uYWwgMiBwYWdlcyBhcyB0aGUgTDIgdGFibGUgd2Ug
YWxyZWFkeSBhbGxvY2F0ZWQgd2hlbgptYXBwaW5nIHRoZSBsaW5rZXIgdG8gbG9hZCBhZGRyZXNz
ZXMuCgpBbmQgaXQgbG9va3MgbGlrZSAyIGlzIGVub3VnaCBmb3IgU3Y0OCwgU3Y1NyBhcyBMNCwg
TDMgYW5kIEwyCnBhZ2V0YWJsZXMgd2lsbCBiZSBhbHJlYWR5IGFsbG9jYXRlZCBkdXJpbmcgbWFw
cGluZyB0aGUgbGlua2VyIHRvIGxvYWQKYWRkcmVzc2VzLgoKQW5kIGl0IG9ubHkgd2lsbCBiZSB0
b28gbXVjaCBmb3IgU3YzMiAoIHdoaWNoIGhhcyBvbmx5IEwxLCBMMCBpbgpnZW5lcmFsICkgYnV0
IEkgYW0gbm90IHN1cmUgdGhhdCBhbnlvbmUgY2FyZXMgYWJvdXQgU3YzMi4KCj4gCj4gPiBAQCAt
MTA4LDE2ICsxMTYsMTggQEAgc3RhdGljIHZvaWQgX19pbml0Cj4gPiBzZXR1cF9pbml0aWFsX21h
cHBpbmcoc3RydWN0IG1tdV9kZXNjICptbXVfZGVzYywKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IHBhZGRyID0gKHBhZ2VfYWRkciAtIG1hcF9zdGFydCkgKwo+ID4gcGFfc3RhcnQ7Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcGVybWlzc2lvbnMgPSBQ
VEVfTEVBRl9ERUZBVUxUOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIGFkZHIgPSAoaXNfaWRlbnRpdHlfbWFwcGluZykgPwo+IAo+IE5pdDogTm8gbmVl
ZCBmb3IgcGFyZW50aGVzZXMgaGVyZS4KVGhhbmtzLgoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cGFnZV9hZGRyIDoKPiA+IExJTktfVE9fTE9BRChwYWdlX2FkZHIpOwo+IAo+IEFzIGEgcmVtYXJr
LCB3aGlsZSB3ZSB3YW50IGJpbmFyeSBvcGVyYXRvcnMgYXQgdGhlIGVuZCBvZiBsaW5lcyB3aGVu
Cj4gd3JhcHBpbmcsIHdlIHVzdWFsbHkgZG8gdGhpbmdzIGRpZmZlcmVudGx5IGZvciB0aGUgdGVy
bmFyeSBvcGVyYXRvcjoKPiBFaXRoZXIKPiAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBhZGRyID0gaXNfaWRlbnRpdHlfbWFwcGluZwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA/IHBhZ2VfYWRkciA6Cj4gTElOS19UT19MT0FEKHBhZ2VfYWRkcik7Cj4gCj4gb3IKPiAK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhZGRyID0gaXNf
aWRlbnRpdHlfbWFwcGluZwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA/IHBhZ2VfYWRkcgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA6IExJTktfVE9fTE9BRChwYWdlX2FkZHIpOwpJdCBsb29rcyBiZXR0ZXIuIFRoYW5r
cy4KPiAKPiAuCj4gCj4gPiBAQCAtMjMyLDIyICsyNDIsMjcgQEAgdm9pZCBfX2luaXQgc2V0dXBf
aW5pdGlhbF9wYWdldGFibGVzKHZvaWQpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpbmtlcl9zdGFydCwKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlua2VyX2VuZCwKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9hZF9z
dGFydCk7Cj4gPiArCj4gPiArwqDCoMKgIGlmICggbGlua2VyX3N0YXJ0ID09IGxvYWRfc3RhcnQg
KQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPiA+ICsKPiA+ICvCoMKgwqAgc2V0dXBfaW5p
dGlhbF9tYXBwaW5nKCZtbXVfZGVzYywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2FkX3N0YXJ0LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvYWRfc3RhcnQgKyBQQUdFX1NJWkUs
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bG9hZF9zdGFydCk7Cj4gPiArCj4gPiArwqDCoMKgIHNldHVwX2luaXRpYWxfbWFwcGluZygmbW11
X2Rlc2MsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKHVuc2lnbmVkIGxvbmcpY3B1MF9ib290X3N0YWNrLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nKWNwdTBf
Ym9vdF9zdGFjayArCj4gPiBQQUdFX1NJWkUsCj4gCj4gU2hvdWxkbid0IHRoaXMgYmUgU1RBQ0tf
U0laRSAoYW5kIHRoZW4gYWxzbyBiZSBwcmVwYXJlZCBmb3IKPiBTVEFDS19TSVpFID4gUEFHRV9T
SVpFKT8KWWVzLCBpdCB3aWxsIGJlIGJldHRlciB0byB1c2UgU1RBQ0tfU0laRSBidXQgZm9yIDE6
MSBtYXBwaW5nIGl0IHdpbGwgYmUKZW5vdWdoIFBBR0VfU0laRSBhcyBJIG1lbnRpb25lZCBhYm92
ZSB0aGlzIG9ubHkgbmVlZCBmb3IgZXBpbG9ndWUgb2YKZW5hYmxlX21tdSgpIGZ1bmN0aW9uLgo+
IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICh1bnNpZ25lZCBsb25nKWNwdTBfYm9vdF9zdGFjayk7Cj4gPiDCoH0KPiA+IMKgCj4gPiAtdm9p
ZCBfX2luaXQgbm9yZXR1cm4gbm9pbmxpbmUgZW5hYmxlX21tdSgpCj4gPiArLyoKPiA+ICsgKiBl
bmFibGVfbW11KCkgY2FuJ3QgYmUgX19pbml0IGJlY2F1c2UgX19pbml0IHNlY3Rpb24gaXNuJ3Qg
cGFydAo+ID4gb2YgaWRlbnRpdHkKPiA+ICsgKiBtYXBwaW5nIHNvIGl0IHdpbGwgY2F1c2UgYW4g
aXNzdWUgYWZ0ZXIgTU1VIHdpbGwgYmUgZW5hYmxlZC4KPiA+ICsgKi8KPiAKPiBBcyBoaW50ZWQg
YXQgYWJvdmUgYWxyZWFkeSAtIHBlcmhhcHMgdGhlIGlkZW50aXR5IG1hcHBpbmcgd2FudHMgdG8g
YmUKPiBsYXJnZXIsIHVwIHRvIGNvdmVyaW5nIHRoZSBlbnRpcmUgWGVuIGltYWdlPyBTaW5jZSBp
dCdzIHRlbXBvcmFyeQo+IG9ubHkgYW55d2F5LCB5b3UgY291bGQgZXZlbiBjb25zaWRlciB1c2lu
ZyBhIGxhcmdlIHBhZ2UgKGFuZCBSV1gKPiBwZXJtaXNzaW9uKS4gWW91IGFscmVhZHkgcmVxdWly
ZSBubyBvdmVybGFwIG9mIGxpbmsgYW5kIGxvYWQKPiBhZGRyZXNzZXMsCj4gc28gYXQgbGVhc3Qg
c21hbGwgcGFnZSBtYXBwaW5ncyBvdWdodCB0byBiZSBwb3NzaWJsZSBmb3IgdGhlIGVudGlyZQo+
IGltYWdlLgpJdCBtYWtlcyBzZW5zZSBhbmQgc3RhcnRlZCB0byB0aG91Z2h0IGFib3V0IHRoYXQg
YWZ0ZXIgSSBhcHBsaWVkIHRoZQpwYXRjaCBmb3IgRG9tMCBydW5uaW5nLi4uIEkgdGhpbmsgd2Ug
Y2FuIG1hcCAxIEdCIHBhZ2Ugd2hpY2ggd2lsbCBjb3Zlcgp0aGUgd2hvbGUgWGVuIGltYWdlLiBB
bHNvIGluIHRoYXQgY2FzZSB3ZSBoYXZlbid0IHRvIGFsbG9jYXRlIDIgbW9yZQpwYWdlIHRhYmxl
cy4KCj4gCj4gPiBAQCAtMjU1LDI1ICsyNzAsNDEgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gbm9p
bmxpbmUgZW5hYmxlX21tdSgpCj4gPiDCoMKgwqDCoCBjc3Jfd3JpdGUoQ1NSX1NBVFAsCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBGTl9ET1dOKCh1bnNpZ25lZCBsb25nKXN0YWdl
MV9wZ3RibF9yb290KSB8Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJWX1NUQUdF
MV9NT0RFIDw8IFNBVFBfTU9ERV9TSElGVCk7Cj4gPiArfQo+ID4gKwo+ID4gK3ZvaWQgX19pbml0
IHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKHZvaWQpCj4gPiArewo+ID4gK8KgwqDCoCBpbnQgaSwg
ajsKPiAKPiBOaXQ6IHVuc2lnbmVkIGludCBwbGVhc2UuClRoYW5rcy4KCj4gCj4gPiArwqDCoMKg
IHB0ZV90ICpwZ3RibDsKPiA+ICvCoMKgwqAgdW5zaWduZWQgaW50IGluZGV4LCB4ZW5faW5kZXg7
Cj4gCj4gVGhlc2Ugd291bGQgYWxsIHByb2JhYmx5IGJldHRlciBiZSBkZWNsYXJlZCBpbiB0aGUg
bmFycm93ZXN0IHBvc3NpYmxlCj4gc2NvcGUuClN1cmUuCgo+IAo+ID4gLcKgwqDCoCBhc20gdm9s
YXRpbGUgKCAiLnAyYWxpZ24gMiIgKTsKPiA+IC0gbW11X2lzX2VuYWJsZWQ6Cj4gPiDCoMKgwqDC
oCAvKgo+ID4gLcKgwqDCoMKgICogU3RhY2sgc2hvdWxkIGJlIHJlLWluaXRlZCBhczoKPiA+IC3C
oMKgwqDCoCAqIDEuIFJpZ2h0IG5vdyBhbiBhZGRyZXNzIG9mIHRoZSBzdGFjayBpcyByZWxhdGl2
ZSB0byBsb2FkCj4gPiB0aW1lCj4gPiAtwqDCoMKgwqAgKsKgwqDCoCBhZGRyZXNzZXMgd2hhdCB3
aWxsIGNhdXNlIGFuIGlzc3VlIGluIGNhc2Ugb2YgbG9hZCBzdGFydAo+ID4gYWRkcmVzcwo+ID4g
LcKgwqDCoMKgICrCoMKgwqAgaXNuJ3QgZXF1YWwgdG8gbGlua2VyIHN0YXJ0IGFkZHJlc3MuCj4g
PiAtwqDCoMKgwqAgKiAyLiBBZGRyZXNzZXMgaW4gc3RhY2sgYXJlIGFsbCBsb2FkIHRpbWUgcmVs
YXRpdmUgd2hpY2ggY2FuCj4gPiBiZSBhbgo+ID4gLcKgwqDCoMKgICrCoMKgwqAgaXNzdWUgaW4g
Y2FzZSB3aGVuIGxvYWQgc3RhcnQgYWRkcmVzcyBpc24ndCBlcXVhbCB0bwo+ID4gbGlua2VyCj4g
PiAtwqDCoMKgwqAgKsKgwqDCoCBzdGFydCBhZGRyZXNzLgo+ID4gLcKgwqDCoMKgICoKPiA+IC3C
oMKgwqDCoCAqIFdlIGNhbid0IHJldHVybiB0byB0aGUgY2FsbGVyIGJlY2F1c2UgdGhlIHN0YWNr
IHdhcyByZXNldGVkCj4gPiAtwqDCoMKgwqAgKiBhbmQgaXQgbWF5IGhhdmUgc3Rhc2ggc29tZSB2
YXJpYWJsZSBvbiB0aGUgc3RhY2suCj4gPiAtwqDCoMKgwqAgKiBKdW1wIHRvIGEgYnJhbmQgbmV3
IGZ1bmN0aW9uIGFzIHRoZSBzdGFjayB3YXMgcmVzZXRlZAo+ID4gK8KgwqDCoMKgICogaWRfYWRk
cnMgc2hvdWxkIGJlIGluIHN5bmMgd2l0aCBpZCBtYXBwaW5nIGluCj4gPiArwqDCoMKgwqAgKiBz
ZXR1cF9pbml0aWFsX3BhZ2V0YWJsZXMoKQo+IAo+IFdoYXQgaXMgImlkIiBtZWFudCB0byBzdGFu
ZCBmb3IgaGVyZT8gQWxzbyBpZiB0aGluZ3MgbmVlZCBrZWVwaW5nIGluCj4gc3luYywgdGhlbiBh
IHNpbWlsYXIgY29tbWVudCBzaG91bGQgZXhpc3Qgb24gdGhlIG90aGVyIHNpZGUuCiJpZCIgaGVy
ZSBtZWFuIGlkZW50aXR5LgoKPiAKPiA+IMKgwqDCoMKgwqAgKi8KPiA+ICvCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBpZF9hZGRyc1tdID3CoCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMSU5LX1RPX0xPQUQoX3N0YXJ0
KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExJTktfVE9fTE9BRChjcHUwX2Jvb3Rfc3RhY2spLAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4gPiDCoAo+ID4gLcKgwqDCoCBzd2l0Y2hfc3RhY2tfYW5kX2p1bXAoKHVuc2lnbmVkIGxv
bmcpY3B1MF9ib290X3N0YWNrICsKPiA+IFNUQUNLX1NJWkUsCj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udF9hZnRlcl9tbXVfaXNfZW5h
YmxlZCk7Cj4gPiArwqDCoMKgIHBndGJsID0gc3RhZ2UxX3BndGJsX3Jvb3Q7Cj4gPiArCj4gPiAr
wqDCoMKgIGZvciAoIGogPSAwOyBqIDwgQVJSQVlfU0laRShpZF9hZGRycyk7IGorKyApCj4gPiAr
wqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKCBwZ3RibCA9IHN0YWdlMV9wZ3RibF9y
b290LCBpID0gQ09ORklHX1BBR0lOR19MRVZFTFMKPiA+IC0gMTsgaSA+PSAwOyBpLS0gKQo+ID4g
K8KgwqDCoMKgwqDCoMKgIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZGV4ID0gcHRf
aW5kZXgoaSwgaWRfYWRkcnNbal0pOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuX2lu
ZGV4ID0gcHRfaW5kZXgoaSwgWEVOX1ZJUlRfU1RBUlQpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCBpbmRleCAhPSB4ZW5faW5kZXggKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ3RibFtpbmRl
eF0ucHRlID0gMDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gVXAgdG8gaGVyZSBJIHVuZGVyc3RhbmQg
aW5kZXggc3BlY2lmaWVzIGEgcGFydGljdWxhciBQVEUgd2l0aGluCj4gcGd0YmxbXS4KPiAKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBndGJsID0gJnBndGJsW2luZGV4XTsKPiAKPiBCdXQg
dGhlbiBob3cgY2FuIHRoaXMgYmUgdGhlIGNvbnRpbnVhdGlvbiBvZiB0aGUgcGFnZSB0YWJsZSB3
YWxrPwo+IERvbid0Cj4geW91IG5lZWQgdG8gcmVhZCB0aGUgYWRkcmVzcyBvdXQgb2YgdGhlIFBU
RT8KWW91IGFyZSByaWdodC4gaXQgc2hvdWxkIGJlOgogICBwZ3RibCA9IChwdGVfdCAqKXB0ZV90
b19wYWRkcihwZ3RibFtpbmRleF0pOyAKCj4gCj4gPiAtLS0gYS94ZW4vYXJjaC9yaXNjdi9yaXNj
djY0L2hlYWQuUwo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvcmlzY3Y2NC9oZWFkLlMKPiA+IEBA
IC0zMSw2ICszMSwzNiBAQCBFTlRSWShzdGFydCkKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDCoMKg
IGphbMKgwqDCoMKgIGNhbGNfcGh5c19vZmZzZXQKPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqAg
amFswqDCoMKgwqAgc2V0dXBfaW5pdGlhbF9wYWdldGFibGVzCj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqAgamFswqDCoMKgwqAgZW5hYmxlX21tdQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgIC8q
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoCAqIENhbGN1bGF0ZSBwaHlzaWNhbCBvZmZzZXQKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgICoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgICogV2UgY2FuJ3QgcmUtdXNl
IGEgdmFsdWUgaW4gcGh5c19vZmZzZXQgdmFyaWFibGUgaGVyZSBhcwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqAgKiBwaHlzX29mZnNldCBpcyBsb2NhdGVkIGluIC5ic3MgYW5kIHRoaXMgc2VjdGlvbiBp
c24ndAo+ID4gK8KgwqDCoMKgwqDCoMKgwqAgKiAxOjEgbWFwcGVkIGFuZCBhbiBhY2Nlc3MgdG8g
aXQgd2lsbCBjYXVzZSBNTVUgZmF1bHQKPiA+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDC
oMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHQwLCBYRU5fVklSVF9TVEFSVAo+ID4gK8KgwqDCoMKg
wqDCoMKgIGxhwqDCoMKgwqDCoCB0MSwgc3RhcnQKPiA+ICvCoMKgwqDCoMKgwqDCoCBzdWLCoMKg
wqDCoCB0MSwgdDEsIHQwCj4gCj4gSWYgSSdtIG5vdCBtaXN0YWtlbiB0aGlzIGNhbGN1bGF0ZXMg
c3RhcnQgLSBYRU5fVklSVF9TVEFSVCwgYW5kIC4uLgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgIC8q
IENhbGN1bGF0ZSBwcm9wZXIgVkEgYWZ0ZXIganVtcCBmcm9tIDE6MSBtYXBwaW5nICovCj4gPiAr
wqDCoMKgwqDCoMKgwqAgbGHCoMKgwqDCoMKgIHQwLCAuTF9wcmltYXJ5X3N3aXRjaGVkCj4gPiAr
wqDCoMKgwqDCoMKgwqAgc3ViwqDCoMKgwqAgdDAsIHQwLCB0MQo+IAo+IC4uLiB0aGVuIHRoaXMg
LkxfcHJpbWFyeV9zd2l0Y2hlZCAtIChzdGFydCAtIFhFTl9WSVJUX1NUQVJUKS4gV2hpY2gKPiBj
YW4KPiBhbHNvIGJlIGV4cHJlc3NlZCBhcyAoLkxfcHJpbWFyeV9zd2l0Y2hlZCAtIHN0YXJ0KSAr
IFhFTl9WSVJUX1NUQVJULAo+IHRoZSBmaXJzdCBwYXJ0IG9mIHdoaWNoIGdhcyBvdWdodCB0byBi
ZSBhYmxlIHRvIHJlc29sdmUgZm9yIHlvdS4gQnV0Cj4gdXBvbiBleHBlcmltZW50aW5nIGEgbGl0
dGxlIGl0IGxvb2tzIGxpa2UgaXQgY2FuJ3QuIChJIGhhZCB0aG91Z2h0IG9mCj4gc29tZXRoaW5n
IGFsb25nIHRoZSBsaW5lcyBvZgo+IAo+IMKgwqDCoMKgwqDCoMKgIGxpwqDCoMKgwqDCoCB0MCwg
LkxfcHJpbWFyeV9zd2l0Y2hlZCAtIHN0YXJ0Cj4gwqDCoMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKg
IHQxLCBYRU5fVklSVF9TVEFSVAo+IMKgwqDCoMKgwqDCoMKgIGFkZMKgwqDCoMKgIHQwLCB0MCwg
dDEKPiAKPiBvciBldmVuCj4gCj4gwqDCoMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHQxLCBYRU5f
VklSVF9TVEFSVAo+IMKgwqDCoMKgwqDCoMKgIGFkZMKgwqDCoMKgIHQwLCB0MSwgJXBjcmVsX2xv
KC5MX3ByaW1hcnlfc3dpdGNoZWQgLSBzdGFydCkKPiAKPiAuKQpDYWxjdWxhdGlvbiBvZiAiLkxf
cHJpbWFyeV9zd2l0Y2hlZCAtIHN0YXJ0IiBtaWdodCBiZSBhbiBpc3N1ZSBmb3IgZ2NjLgpJIHRy
aWVkIHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGFuZCByZWNpZXZlZCBvciAiRXJyb3I6IGNhbid0
IHJlc29sdmUKLkxfcHJpbWFyeV9zd2l0Y2hlZCAtIHN0YXJ0IiBvciAiRXJyb3I6IGlsbGVnYWwg
b3BlcmFuZHMgYGxpCnQwLC5MX3ByaW1hcnlfc3dpdGNoZWQtc3RhcnQnIgoKfiBPbGVrc2lpCg==


