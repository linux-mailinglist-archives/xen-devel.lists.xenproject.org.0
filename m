Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808E9750E8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 13:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796463.1206066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLce-00036l-HP; Wed, 11 Sep 2024 11:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796463.1206066; Wed, 11 Sep 2024 11:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLce-00034w-Ek; Wed, 11 Sep 2024 11:34:56 +0000
Received: by outflank-mailman (input) for mailman id 796463;
 Wed, 11 Sep 2024 11:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soLcc-00034q-Of
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 11:34:54 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc6dee96-7031-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 13:34:52 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f75129b3a3so67307081fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 04:34:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bfe69a9sm15381471fa.27.2024.09.11.04.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 04:34:50 -0700 (PDT)
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
X-Inumbo-ID: dc6dee96-7031-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726054492; x=1726659292; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XbRlX/w/XeoaNeAx+qr/LI/FU1upm/NjGI7hC9PSJxY=;
        b=ieI2e5PdUUTnMaiP3GhORDSlpEpSoDzmVQccv6heZRWPMxznOAv501nBh8FFDKulaY
         NnHLp4T48T8tsBC9hD9dNVXzkDXnvLlFRPdGDsQ5PsQfhI+3OgYj94tzwRKKyoCX5Qxn
         NeV4udutM3Kk5sbM0/e7npU/KFHUAuSef+AV9iFjQAh/7tepuBojq16rUY+CE2GyU0qC
         jn7rVBNGUI5A4n3FKNsJEsK/gVshp06pxb9LB8H0X5jC7WhOmnXkL0kYzbqKgN7J9SUs
         erRnbVAxjNApELRZnS+gQwfoBOmIHm0oZG/8C1t6TspvCxx/m6S6touwwZgc7DVT69eF
         M69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726054492; x=1726659292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbRlX/w/XeoaNeAx+qr/LI/FU1upm/NjGI7hC9PSJxY=;
        b=Y4LcJ2L7TAHNJVu7qxd9oKFWM2Mtrl6pFJOgijh9Q/r333bZ8h6I2WBhWYIt5KA0wx
         SgWIpM8x+ZeeFFjUbZFhuFgNtSVY3yJmP2N1/Pr/2nVJVGspv8BV5u7knxWALT8byhIh
         F1fY/uBGCwpVE1JrQswg3Qa6QoIkAh/UAVIxc9jw2yTeyWD1r7nEFK2MF4iU2dZdqjwZ
         xSnPsUS/dZfxeq0SQL4yNObuo8OTyvDcb1FSgNEmOff7ye1hd0VoD/2fjMqKsR/tja2B
         VA/YYWaidXQom6Tm3L92jpVabsO6zLTWfPFj9wLd2PsWPV6h26xf0qHR6KkmadekEA1o
         fM6A==
X-Forwarded-Encrypted: i=1; AJvYcCUesSf2I6FCHxwz5eyCRGM6JIazdtD0wtxmssonZ26n15f3FoQ+o6m/yWaKvDAUq/Z322Q91u/rubc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymdgvusDFKy/K1PuVpYLu1E2P0GKQxGMqLx/Ilnk7qEAjpbiKw
	gIGHuBS4eBC8HifzbsBDiGkPbQqVvmWa0hA/iG/WwQjj7RE/ZaUj
X-Google-Smtp-Source: AGHT+IElgWPeHjQHJajfJfFJTmR1HsCFHMe0RRS4fcvfmUg/yNGZAWaOPcJstDI+JQMLc06s0Sz9/g==
X-Received: by 2002:a2e:b88d:0:b0:2f6:6576:ae6e with SMTP id 38308e7fff4ca-2f751efa719mr130156361fa.21.1726054491312;
        Wed, 11 Sep 2024 04:34:51 -0700 (PDT)
Message-ID: <bdbf7bbbdb7ec22b157797fe3c09c13a9829f1d6.camel@gmail.com>
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2024 13:34:50 +0200
In-Reply-To: <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
	 <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
	 <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
	 <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA5LTEwIGF0IDE4OjA1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxMC4wOS4yMDI0IDE3OjI4LCBvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbcKgd3JvdGU6Cj4g
PiBPbiBUdWUsIDIwMjQtMDktMTAgYXQgMTE6NTMgKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPiBPbiAwMi4wOS4yMDI0IDE5OjAxLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gPiA+
IC0tLSBhL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0b21pYy5oCj4gPiA+ID4gKysrIGIv
eGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+ID4gPiBAQCAtNTQsMTYgKzU0
LDE2IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQKPiA+ID4gPiByZWFkX2F0b21pY19zaXpl
KGNvbnN0IHZvbGF0aWxlIHZvaWQgKnAsCj4gPiA+ID4gwqB9KQo+ID4gPiA+IMKgCj4gPiA+ID4g
wqBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkIF93cml0ZV9hdG9taWModm9sYXRpbGUgdm9pZCAq
cCwKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgeCwKPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKngsCj4gPiA+IAo+ID4gPiBQb2ludGVyLXRv
LWNvbnN0IHBsZWFzZSwgdG8gZnVydGhlciBhaWQgaW4gZWFzaWx5IHJlY29nbml6aW5nCj4gPiA+
IHdoaWNoCj4gPiA+IHBhcmFtZXRlciBpcyB3aGF0LiBBZnRlciBhbGwgLi4uCj4gPiA+IAo+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzaXplKQo+ID4gPiA+IMKg
ewo+ID4gPiA+IMKgwqDCoMKgIHN3aXRjaCAoIHNpemUgKQo+ID4gPiA+IMKgwqDCoMKgIHsKPiA+
ID4gPiAtwqDCoMKgIGNhc2UgMTogd3JpdGViX2NwdSh4LCBwKTsgYnJlYWs7Cj4gPiA+ID4gLcKg
wqDCoCBjYXNlIDI6IHdyaXRld19jcHUoeCwgcCk7IGJyZWFrOwo+ID4gPiA+IC3CoMKgwqAgY2Fz
ZSA0OiB3cml0ZWxfY3B1KHgsIHApOyBicmVhazsKPiA+ID4gCj4gPiA+IC4uLiB1bmhlbHBmdWxs
eSBlbm91Z2ggcGFyYW1ldGVycyBhcmUgdGhlbiBzd2FwcGVkLCBqdXN0IHRvCj4gPiA+IGNvbmZ1
c2UKPiA+ID4gdGhpbmdzLgo+ID4gSWYgaXQgd291bGQgYmUgYmV0dGVyIHRvIGtlZXAgJ3Vuc2ln
bmVkIGxvbmcnIGFzIHRoZSB0eXBlIG9mIHgsCj4gPiB0aGVuLAo+ID4gaWYgSSBhbSBub3QgbWlz
dGFrZW4sIHdyaXRlX2F0b21pYygpIHNob3VsZCBiZSB1cGRhdGVkIGluIHRoZQo+ID4gZm9sbG93
aW5nCj4gPiB3YXk6Cj4gPiDCoMKgICNkZWZpbmUgd3JpdGVfYXRvbWljKHAsIHgpwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiDC
oMKgICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiDCoMKgwqDCoMKgwqAgdHlwZW9mKCoocCkpIHhfID0gKHgpO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gwqDCoMKgwqDC
oMKgIF93cml0ZV9hdG9taWMocCwgKih1bnNpZ25lZCBsb25nICopJnhfLAo+ID4gc2l6ZW9mKCoo
cCkpKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+ID4gwqDCoCBcCj4gPiDCoMKgIH0pCj4gPiBI
b3dldmVyLCBJIGFtIG5vdCBzdXJlIGlmIGl0IGlzIHNhZmUgd2hlbiB4IGlzIGEgMi1ieXRlIHZh
bHVlIChmb3IKPiA+IGV4YW1wbGUpIHRoYXQgaXQgd2lsbCByZWFkIG1vcmUgdGhhbiAyIGJ5dGVz
IGJlZm9yZSBwYXNzaW5nIHRoZQo+ID4gdmFsdWUKPiA+IHRvIHRoZSBfd3JpdGVfYXRvbWljKCkg
ZnVuY3Rpb24uCj4gCj4gTm8sIHRoYXQncyBkZWZpbml0ZWx5IHVuc2FmZS4KClRoZW4sIGF0IHRo
ZSBtb21lbnQsIEkgZG9uJ3Qgc2VlIGEgYmV0dGVyIG9wdGlvbiB0aGFuIGhhdmluZyBjb25zdCB2
b2lkCip4IGFzIGFuIGFyZ3VtZW50IGZvciB0aGUgX3dyaXRlX2F0b21pYygpIGZ1bmN0aW9uIGFu
ZCB0aGVuIHBlcmZvcm1pbmcKY2FzdHMgd2hlbiB3cml0ZVhfY3B1KCooY29uc3QgdWludFggKil4
LCBwKSBpcyBjYWxsZWQuCgo+IAo+ID4gPiA+IEBAIC03Miw3ICs3Miw3IEBAIHN0YXRpYyBhbHdh
eXNfaW5saW5lIHZvaWQKPiA+ID4gPiBfd3JpdGVfYXRvbWljKHZvbGF0aWxlCj4gPiA+ID4gdm9p
ZCAqcCwKPiA+ID4gPiDCoCNkZWZpbmUgd3JpdGVfYXRvbWljKHAsIHgpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+ID4gwqAo
e8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4g
PiA+IMKgwqDCoMKgIHR5cGVvZigqKHApKSB4XyA9ICh4KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiAtwqDCoMKgIF93
cml0ZV9hdG9taWMocCwgeF8sIHNpemVvZigqKHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+ID4gPiA+ICvCoMKgwqAgX3dyaXRlX2F0b21pYyhwLCAmeF8sIHNpemVvZigq
KHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gPiDCoH0pCj4gPiA+
ID4gwqAKPiA+ID4gPiDCoHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX2FkZF9zaXplZCh2b2xh
dGlsZSB2b2lkICpwLAo+ID4gPiA+IEBAIC04MiwyNyArODIsMjMgQEAgc3RhdGljIGFsd2F5c19p
bmxpbmUgdm9pZAo+ID4gPiA+IF9hZGRfc2l6ZWQodm9sYXRpbGUKPiA+ID4gPiB2b2lkICpwLAo+
ID4gPiA+IMKgwqDCoMKgIHsKPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDE6Cj4gPiA+ID4gwqDCoMKg
wqAgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGlsZSB1aW50OF90ICpwdHIgPSBwOwo+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRyLCByZWFkX2F0b21pYyhwdHIp
ICsgeCk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlYl9jcHUocmVhZGJfY3B1KHApICsg
eCwgcCk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gPiDCoMKgwqDCoCB9
Cj4gPiA+ID4gwqDCoMKgwqAgY2FzZSAyOgo+ID4gPiA+IMKgwqDCoMKgIHsKPiA+ID4gPiAtwqDC
oMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDE2X3QgKnB0ciA9IHA7Cj4gPiA+ID4gLcKgwqDCoMKg
wqDCoMKgIHdyaXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0cikgKyB4KTsKPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqAgd3JpdGV3X2NwdShyZWFkd19jcHUocCkgKyB4LCBwKTsKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+IMKgwqDCoMKgIH0KPiA+ID4gPiDCoMKgwqDC
oCBjYXNlIDQ6Cj4gPiA+ID4gwqDCoMKgwqAgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xh
dGlsZSB1aW50MzJfdCAqcHRyID0gcDsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgd3JpdGVfYXRv
bWljKHB0ciwgcmVhZF9hdG9taWMocHRyKSArIHgpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB3
cml0ZWxfY3B1KHJlYWRsX2NwdShwKSArIHgsIHApOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4gPiA+ID4gwqDCoMKgwqAgfQo+ID4gPiA+IMKgI2lmbmRlZiBDT05GSUdfUklTQ1Zf
MzIKPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDg6Cj4gPiA+ID4gwqDCoMKgwqAgewo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoCB2b2xhdGlsZSB1aW50NjRfdCAqcHRyID0gcDsKPiA+ID4gPiAtwqDCoMKg
wqDCoMKgwqAgd3JpdGVfYXRvbWljKHB0ciwgcmVhZF9hdG9taWMocHRyKSArIHgpOwo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoCB3cml0ZXFfY3B1KHJlYWR3X2NwdShwKSArIHgsIHApOwo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gwqDCoMKgwqAgfQo+ID4gPiA+IMKgI2Vu
ZGlmCj4gPiA+IAo+ID4gPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHBhcnQs
IG9yIG1vcmUgc3BlY2lmaWNhbGx5IHRoZQo+ID4gPiByZXNwZWN0aXZlCj4gPiA+IHBhcnQgb2Yg
dGhlIGRlc2NyaXB0aW9uLiBJdCBpcyB0aGUgZmlyc3QgcGFyYW1ldGVyIG9mCj4gPiA+IHdyaXRl
X2F0b21pYygpCj4gPiA+IHdoaWNoIGlzCj4gPiA+IHZvbGF0aWxlIHF1YWxpZmllZC4gQW5kIGl0
IGlzIHRoZSBmaXJzdCBhcmd1bWVudCB0aGF0J3Mgdm9sYXRpbGUKPiA+ID4gcXVhbGlmaWVkCj4g
PiA+IGhlcmUuIElzbid0IHRoZSBwcm9ibGVtIGVudGlyZWx5IHVucmVsYXRlZCB0byB2b2xhdGls
ZS1uZXNzLCBhbmQKPiA+ID4gaW5zdGVhZCBhCj4gPiA+IHJlc3VsdCBvZiB0aGUgb3RoZXIgcGFy
YW1ldGVyIGNoYW5naW5nIGZyb20gc2NhbGFyIHRvIHBvaW50ZXIKPiA+ID4gdHlwZSwKPiA+ID4g
d2hpY2gKPiA+ID4gZG9lc24ndCBmaXQgdGhlIGFkZGl0aW9uIGV4cHJlc3Npb25zIHlvdSBwYXNz
IGluPwo+ID4gaWYgX2FkZF9zaXplZCgpIGlzIGRlZmluZWQgYXMgaXQgd2FzIGJlZm9yZToKPiA+
IMKgwqAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZCBfYWRkX3NpemVkKHZvbGF0aWxlIHZvaWQg
KnAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB4LCB1bnNpZ25lZAo+
ID4gaW50Cj4gPiDCoMKgIHNpemUpCj4gPiDCoMKgIHsKPiA+IMKgwqDCoMKgwqDCoCBzd2l0Y2gg
KCBzaXplICkKPiA+IMKgwqDCoMKgwqDCoCB7Cj4gPiDCoMKgwqDCoMKgwqAgY2FzZSAxOgo+ID4g
wqDCoMKgwqDCoMKgIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvbGF0aWxlIHVpbnQ4X3Qg
KnB0ciA9IHA7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9taWMocHRyLCByZWFk
X2F0b21pYyhwdHIpICsgeCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+IMKg
wqDCoMKgwqDCoCB9Cj4gPiDCoMKgIC4uLgo+ID4gVGhlbiB3cml0ZV9hdG9taWMocHRyLCByZWFk
X2F0b21pYyhwdHIpICsgeCkgd2lsbCBiZSBiZSBjaGFuZ2VkIHRvOgo+ID4gwqDCoCB2b2xhdGls
ZSB1aW50OF90IHhfID0gKHgpOwo+ID4gwqDCoCAKPiA+IEFuZCB0aGF0IHdpbGwgY2F1c2UgYSBj
b21waWxlciBlcnJvcjoKPiA+IMKgwqAgLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0b21pYy5o
Ojc1OjIyOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudAo+ID4gMgo+ID4gwqDCoCBvZiAnX3dyaXRl
X2F0b21pYycgZGlzY2FyZHMgJ3ZvbGF0aWxlJyBxdWFsaWZpZXIgZnJvbSBwb2ludGVyCj4gPiB0
YXJnZXQKPiA+IMKgwqAgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KPiA+IMKg
wqDCoMKgwqAgNzUgfMKgwqDCoMKgIF93cml0ZV9hdG9taWMocCwgJnhfLCBzaXplb2YoKihwKSkp
Owo+ID4gQmVjYXVzZSBpdCBjYW4ndCBjYXN0ICd2b2xhdGlsZSB1aW50OF90IConIHRvICd2b2lk
IConOgo+ID4gwqDCoCBleHBlY3RlZCAndm9pZCAqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAn
dm9sYXRpbGUgdWludDhfdCAqJwo+ID4ge2FrYQo+ID4gwqDCoCAndm9sYXRpbGUgdW5zaWduZWQg
Y2hhciAqJ30KPiAKPiBPaCwgSSB0aGluayBJIHNlZSBub3cuIFdoYXQgd2UnZCBsaWtlIHdyaXRl
X2F0b21pYygpIHRvIGRlcml2ZSBpcyB0aGUKPiBiYXJlCj4gKHVucXVhbGlmaWVkKSB0eXBlIG9m
ICpwdHIsIHlldCBpaXJjIG9ubHkgcmVjZW50IGNvbXBpbGVycyBoYXZlIGEgd2F5Cj4gdG8KPiBv
YnRhaW4gdGhhdC4KSSBhc3N1bWUgdGhhdCB5b3UgYXJlIHNwZWFraW5nIGFib3V0IHR5cGVvZl91
bnF1YWwgd2hpY2ggcmVxdWlyZXMgQzIzCig/KS4KCl9fYXV0b190eXBlIHNlZW1zIHRvIG1lIGNh
biBhbHNvIGRyb3Agdm9sYXRpbGUgcXVpbGlmaWVyIGJ1dCBpbiB0aGUKZG9jcyBJIGRvbid0IHNl
ZSB0aGF0IGl0IHNob3VsZCAob3Igbm90KSBkaXNjYXJkIHF1YWxpZmllci4gQ291bGQgaXQgYmUK
YW4gb3B0aW9uOgogICAjZGVmaW5lIHdyaXRlX2F0b21pYyhwLCB4KSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgICBfX2F1dG9fdHlwZSB4XyA9ICh4KTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCiAgICAgICBfd3JpdGVfYXRvbWljKHAsICZ4Xywgc2l6ZW9m
KCoocCkpKTsgICAgICAgICAgICAgICAgIFwKICAgfSkKCkFuZCBhbm90aGVyIG9wdGlvbiBjb3Vs
ZCBiZSBqdXN0IGRyb3Agdm9sYXRpbGUgYnkgY2FzdGluZzoKICAgI2RlZmluZSB3cml0ZV9hdG9t
aWMocCwgeCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgIC4uLgogICAgICAgX3dy
aXRlX2F0b21pYyhwLCAoY29uc3Qgdm9pZCAqKSZ4Xywgc2l6ZW9mKCoocCkpKTsgICAgICAgICAg
ICAgICAgIAogICAKfiBPbGVrc2lpCg==


