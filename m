Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF15976808
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797351.1207271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiCN-0004P4-1B; Thu, 12 Sep 2024 11:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797351.1207271; Thu, 12 Sep 2024 11:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiCM-0004NZ-UI; Thu, 12 Sep 2024 11:41:18 +0000
Received: by outflank-mailman (input) for mailman id 797351;
 Thu, 12 Sep 2024 11:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2hp=QK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soiCL-0004NT-P9
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:41:17 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc4f946-70fb-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 13:41:16 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso10586151fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:41:16 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd5207csm6470140a12.47.2024.09.12.04.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:41:15 -0700 (PDT)
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
X-Inumbo-ID: ebc4f946-70fb-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726141276; x=1726746076; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7BdTj7+oo9fRePLWzMAJ09QPmqBYigM2DmpCf2ZoDi4=;
        b=YoH/HYGjdj6As4PswNwOYum85xRXeb0ukgs2Bw/rcRPmyrfReiy1BYXWMhUbl6oAKx
         vW9X9F9CHqhYgAt1f1qWNDA8JEx1g5oQISYQ78VhphlaXxSBHGyTUwZGr386Cs3HyDef
         5LUIsWmi1mER8GzUdHBq1/ARTM8mwphh6DQZxdRANOvkOZlEnL247eu6M481ulSpEamO
         e0nVF8x5VaegXtKmJpnSWvXwlLUlvJD5bd+gevxVw0xT3Rr4oRZGZWZZUxoQrZWh9U/1
         o4KeYdSdJGhHq5sF7mFpbtxIDarB81t87Xb91Kl4YSpuZ++8oDDV2VmbJV9vm0EHq/tg
         nm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726141276; x=1726746076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BdTj7+oo9fRePLWzMAJ09QPmqBYigM2DmpCf2ZoDi4=;
        b=g0mgEUaunhWHD58rwuH6NLBoXwuUoLmrjLv+K2E6Ga0MrnaO2/rBIqvzwwTejOhXGm
         6yPdQjrDUt6PuRW/ooEbTpqj6f6Z2RrNrEuNr/4h3EoNspZMM/5WQx7QEZAD7u32TZGx
         o+pxJ7/pEKmK/ApQonXko1r9zf7uZ3ncgc90u2GU6WnAgrYID+63hY5wkROjl2xDKU7Z
         W4oM0EnzPQX+b7ieEkpqdQ7sykjA+mq/IYNDH0iDNVB5tioT/l2eFSstWZYCAHw9WZoF
         aLuTTeWUT6hSw6gSwx1ir3X7PXIT0SFQZREkPxMbXTUlBlpDQ0lA+kBT0LhCtAH8SOEY
         aVOg==
X-Forwarded-Encrypted: i=1; AJvYcCVIx2rRKGXto0mpwSUCkDraxVHahArt51L0OnblG+qIZsedLHQ8fjErhns+UsgitXF0XxXXGAWhP78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuTSSyehGY+TeoDyWumt1SgpsvDmkOg8mm93HhM+ptIFIjGUKG
	vCBv78mPliZCRaT1jU8mWYh9UPOC+v3+CYsXPCIcMGHfCHu5wU5w
X-Google-Smtp-Source: AGHT+IHR3TM48YTg0X8MAQ87e6fg2IpCJxqLKF5aLQ23fx+s4iTRgapp3287VEstALW34T7H/13Vew==
X-Received: by 2002:a05:6512:3c9c:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-53678feb106mr1561979e87.42.1726141275574;
        Thu, 12 Sep 2024 04:41:15 -0700 (PDT)
Message-ID: <5eb014b9d3624223d6a0dc762fad810b84597082.camel@gmail.com>
Subject: Re: [PATCH v6 3/9] xen/riscv: allow write_atomic() to work with
 non-scalar types
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2024 13:41:14 +0200
In-Reply-To: <b5eb9f937814d9d37db315cea9c53ec1faeb4be7.camel@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <44810c0c3faa4fd2d36a8be9a87c5022088c0e62.1725295716.git.oleksii.kurochko@gmail.com>
	 <687511c2-2c0a-4766-9eb7-427bd648565b@suse.com>
	 <c571f1d2760ea09b6e9dba41c8d6a056a2b69c23.camel@gmail.com>
	 <20a1a3ae-95c4-4568-9cd3-a4f023940b73@suse.com>
	 <bdbf7bbbdb7ec22b157797fe3c09c13a9829f1d6.camel@gmail.com>
	 <59d3ef0f-dc1d-4d6e-9e1e-4fb3550113a8@suse.com>
	 <b5eb9f937814d9d37db315cea9c53ec1faeb4be7.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTA5LTEyIGF0IDEzOjE1ICswMjAwLCBvbGVrc2lpLmt1cm9jaGtvQGdtYWls
LmNvbSB3cm90ZToKPiBPbiBXZWQsIDIwMjQtMDktMTEgYXQgMTM6NDkgKzAyMDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gT24gMTEuMDkuMjAyNCAxMzozNCwgb2xla3NpaS5rdXJvY2hrb0BnbWFp
bC5jb23CoHdyb3RlOgo+ID4gPiBPbiBUdWUsIDIwMjQtMDktMTAgYXQgMTg6MDUgKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IE9uIDEwLjA5LjIwMjQgMTc6MjgsIG9sZWtzaWkua3Vy
b2Noa29AZ21haWwuY29twqB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgMjAyNC0wOS0xMCBhdCAx
MTo1MyArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIDAyLjA5LjIwMjQg
MTk6MDEsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gQEAgLTcyLDcgKzcy
LDcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZAo+ID4gPiA+ID4gPiA+IF93cml0ZV9hdG9t
aWModm9sYXRpbGUKPiA+ID4gPiA+ID4gPiB2b2lkICpwLAo+ID4gPiA+ID4gPiA+IMKgI2RlZmlu
ZSB3cml0ZV9hdG9taWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gPiA+ID4gXAo+ID4gPiA+ID4gPiA+IMKgKHvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4g
PiA+ID4gXAo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgIHR5cGVvZigqKHApKSB4XyA9ICh4KTvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4g
PiA+ID4gPiA+ID4gXAo+ID4gPiA+ID4gPiA+IC3CoMKgwqAgX3dyaXRlX2F0b21pYyhwLCB4Xywg
c2l6ZW9mKCoocCkpKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+ID4g
PiA+IFwKPiA+ID4gPiA+ID4gPiArwqDCoMKgIF93cml0ZV9hdG9taWMocCwgJnhfLCBzaXplb2Yo
KihwKSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+ID4gPiA+IFwKPiA+
ID4gPiA+ID4gPiDCoH0pCj4gPiA+ID4gPiA+ID4gwqAKPiA+ID4gPiA+ID4gPiDCoHN0YXRpYyBh
bHdheXNfaW5saW5lIHZvaWQgX2FkZF9zaXplZCh2b2xhdGlsZSB2b2lkICpwLAo+ID4gPiA+ID4g
PiA+IEBAIC04MiwyNyArODIsMjMgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdm9pZAo+ID4gPiA+
ID4gPiA+IF9hZGRfc2l6ZWQodm9sYXRpbGUKPiA+ID4gPiA+ID4gPiB2b2lkICpwLAo+ID4gPiA+
ID4gPiA+IMKgwqDCoMKgIHsKPiA+ID4gPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDE6Cj4gPiA+ID4g
PiA+ID4gwqDCoMKgwqAgewo+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGlsZSB1
aW50OF90ICpwdHIgPSBwOwo+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB3cml0ZV9hdG9t
aWMocHRyLCByZWFkX2F0b21pYyhwdHIpICsgeCk7Cj4gPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgIHdyaXRlYl9jcHUocmVhZGJfY3B1KHApICsgeCwgcCk7Cj4gPiA+ID4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoCBicmVhazsKPiA+ID4gPiA+ID4gPiDCoMKgwqDCoCB9Cj4gPiA+ID4gPiA+ID4g
wqDCoMKgwqAgY2FzZSAyOgo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgIHsKPiA+ID4gPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqAgdm9sYXRpbGUgdWludDE2X3QgKnB0ciA9IHA7Cj4gPiA+ID4gPiA+ID4g
LcKgwqDCoMKgwqDCoMKgIHdyaXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0cikgKyB4KTsK
PiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgd3JpdGV3X2NwdShyZWFkd19jcHUocCkgKyB4
LCBwKTsKPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+ID4gPiA+
IMKgwqDCoMKgIH0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDQ6Cj4gPiA+ID4gPiA+ID4g
wqDCoMKgwqAgewo+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGlsZSB1aW50MzJf
dCAqcHRyID0gcDsKPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgd3JpdGVfYXRvbWljKHB0
ciwgcmVhZF9hdG9taWMocHRyKSArIHgpOwo+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB3
cml0ZWxfY3B1KHJlYWRsX2NwdShwKSArIHgsIHApOwo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqAgfQo+ID4gPiA+ID4gPiA+IMKgI2lm
bmRlZiBDT05GSUdfUklTQ1ZfMzIKPiA+ID4gPiA+ID4gPiDCoMKgwqDCoCBjYXNlIDg6Cj4gPiA+
ID4gPiA+ID4gwqDCoMKgwqAgewo+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCB2b2xhdGls
ZSB1aW50NjRfdCAqcHRyID0gcDsKPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgd3JpdGVf
YXRvbWljKHB0ciwgcmVhZF9hdG9taWMocHRyKSArIHgpOwo+ID4gPiA+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoCB3cml0ZXFfY3B1KHJlYWR3X2NwdShwKSArIHgsIHApOwo+ID4gPiA+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqAgfQo+ID4gPiA+ID4g
PiA+IMKgI2VuZGlmCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJJ20gYWZyYWlkIEkgZG9uJ3Qg
dW5kZXJzdGFuZCB0aGlzIHBhcnQsIG9yIG1vcmUKPiA+ID4gPiA+ID4gc3BlY2lmaWNhbGx5Cj4g
PiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gPiByZXNwZWN0aXZlCj4gPiA+ID4gPiA+IHBhcnQgb2Yg
dGhlIGRlc2NyaXB0aW9uLiBJdCBpcyB0aGUgZmlyc3QgcGFyYW1ldGVyIG9mCj4gPiA+ID4gPiA+
IHdyaXRlX2F0b21pYygpCj4gPiA+ID4gPiA+IHdoaWNoIGlzCj4gPiA+ID4gPiA+IHZvbGF0aWxl
IHF1YWxpZmllZC4gQW5kIGl0IGlzIHRoZSBmaXJzdCBhcmd1bWVudCB0aGF0J3MKPiA+ID4gPiA+
ID4gdm9sYXRpbGUKPiA+ID4gPiA+ID4gcXVhbGlmaWVkCj4gPiA+ID4gPiA+IGhlcmUuIElzbid0
IHRoZSBwcm9ibGVtIGVudGlyZWx5IHVucmVsYXRlZCB0byB2b2xhdGlsZS0KPiA+ID4gPiA+ID4g
bmVzcywKPiA+ID4gPiA+ID4gYW5kCj4gPiA+ID4gPiA+IGluc3RlYWQgYQo+ID4gPiA+ID4gPiBy
ZXN1bHQgb2YgdGhlIG90aGVyIHBhcmFtZXRlciBjaGFuZ2luZyBmcm9tIHNjYWxhciB0bwo+ID4g
PiA+ID4gPiBwb2ludGVyCj4gPiA+ID4gPiA+IHR5cGUsCj4gPiA+ID4gPiA+IHdoaWNoCj4gPiA+
ID4gPiA+IGRvZXNuJ3QgZml0IHRoZSBhZGRpdGlvbiBleHByZXNzaW9ucyB5b3UgcGFzcyBpbj8K
PiA+ID4gPiA+IGlmIF9hZGRfc2l6ZWQoKSBpcyBkZWZpbmVkIGFzIGl0IHdhcyBiZWZvcmU6Cj4g
PiA+ID4gPiDCoMKgIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX2FkZF9zaXplZCh2b2xhdGls
ZSB2b2lkICpwLAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
eCwKPiA+ID4gPiA+IHVuc2lnbmVkCj4gPiA+ID4gPiBpbnQKPiA+ID4gPiA+IMKgwqAgc2l6ZSkK
PiA+ID4gPiA+IMKgwqAgewo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgIHN3aXRjaCAoIHNpemUgKQo+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgIHsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoCBjYXNlIDE6Cj4g
PiA+ID4gPiDCoMKgwqDCoMKgwqAgewo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9s
YXRpbGUgdWludDhfdCAqcHRyID0gcDsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdy
aXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0cikgKyB4KTsKPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgIH0KPiA+ID4gPiA+IMKg
wqAgLi4uCj4gPiA+ID4gPiBUaGVuIHdyaXRlX2F0b21pYyhwdHIsIHJlYWRfYXRvbWljKHB0cikg
KyB4KSB3aWxsIGJlIGJlCj4gPiA+ID4gPiBjaGFuZ2VkCj4gPiA+ID4gPiB0bzoKPiA+ID4gPiA+
IMKgwqAgdm9sYXRpbGUgdWludDhfdCB4XyA9ICh4KTsKPiA+ID4gPiA+IMKgwqAgCj4gPiA+ID4g
PiBBbmQgdGhhdCB3aWxsIGNhdXNlIGEgY29tcGlsZXIgZXJyb3I6Cj4gPiA+ID4gPiDCoMKgIC4v
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaDo3NToyMjogZXJyb3I6IHBhc3NpbmcKPiA+
ID4gPiA+IGFyZ3VtZW50Cj4gPiA+ID4gPiAyCj4gPiA+ID4gPiDCoMKgIG9mICdfd3JpdGVfYXRv
bWljJyBkaXNjYXJkcyAndm9sYXRpbGUnIHF1YWxpZmllciBmcm9tCj4gPiA+ID4gPiBwb2ludGVy
Cj4gPiA+ID4gPiB0YXJnZXQKPiA+ID4gPiA+IMKgwqAgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQt
cXVhbGlmaWVyc10KPiA+ID4gPiA+IMKgwqDCoMKgwqAgNzUgfMKgwqDCoMKgIF93cml0ZV9hdG9t
aWMocCwgJnhfLCBzaXplb2YoKihwKSkpOwo+ID4gPiA+ID4gQmVjYXVzZSBpdCBjYW4ndCBjYXN0
ICd2b2xhdGlsZSB1aW50OF90IConIHRvICd2b2lkIConOgo+ID4gPiA+ID4gwqDCoCBleHBlY3Rl
ZCAndm9pZCAqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAndm9sYXRpbGUKPiA+ID4gPiA+IHVp
bnQ4X3QKPiA+ID4gPiA+IConCj4gPiA+ID4gPiB7YWthCj4gPiA+ID4gPiDCoMKgICd2b2xhdGls
ZSB1bnNpZ25lZCBjaGFyIConfQo+ID4gPiA+IAo+ID4gPiA+IE9oLCBJIHRoaW5rIEkgc2VlIG5v
dy4gV2hhdCB3ZSdkIGxpa2Ugd3JpdGVfYXRvbWljKCkgdG8gZGVyaXZlCj4gPiA+ID4gaXMKPiA+
ID4gPiB0aGUKPiA+ID4gPiBiYXJlCj4gPiA+ID4gKHVucXVhbGlmaWVkKSB0eXBlIG9mICpwdHIs
IHlldCBpaXJjIG9ubHkgcmVjZW50IGNvbXBpbGVycyBoYXZlCj4gPiA+ID4gYQo+ID4gPiA+IHdh
eQo+ID4gPiA+IHRvCj4gPiA+ID4gb2J0YWluIHRoYXQuCj4gPiA+IEkgYXNzdW1lIHRoYXQgeW91
IGFyZSBzcGVha2luZyBhYm91dCB0eXBlb2ZfdW5xdWFsIHdoaWNoIHJlcXVpcmVzCj4gPiA+IEMy
Mwo+ID4gPiAoPykuCj4gPiAKPiA+IFdoYXQgQyB2ZXJzaW9uIGl0IHJlcXVpcmVzIGRvZXNuJ3Qg
bWF0dGVyIG11Y2ggZm9yIG91ciBwdXJwb3Nlcy4KPiA+IFRoZQo+ID4gcXVlc3Rpb24gaXMgYXMg
b2Ygd2hpY2ggZ2NjIC8gY2xhbmcgdmVyc2lvbiAoaWYgYW55KSB0aGlzIGlzCj4gPiBzdXBwb3J0
ZWQKPiA+IGFzIGFuIGV4dGVuc2lvbi4KPiA+IAo+ID4gPiBfX2F1dG9fdHlwZSBzZWVtcyB0byBt
ZSBjYW4gYWxzbyBkcm9wIHZvbGF0aWxlIHF1aWxpZmllciBidXQgaW4KPiA+ID4gdGhlCj4gPiA+
IGRvY3MgSSBkb24ndCBzZWUgdGhhdCBpdCBzaG91bGQgKG9yIG5vdCkgZGlzY2FyZCBxdWFsaWZp
ZXIuIENvdWxkCj4gPiA+IGl0IGJlCj4gPiA+IGFuIG9wdGlvbjoKPiA+ID4gwqDCoCAjZGVmaW5l
IHdyaXRlX2F0b21pYyhwLCB4KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gPiDCoMKgICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiA+IMKgwqDCoMKgwqDCoCBfX2F1dG9f
dHlwZSB4XyA9ICh4KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gwqDCoMKgwqDCoMKgIF93cml0ZV9hdG9taWMocCwgJnhf
LCBzaXplb2YoKihwKSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4g
wqDCoCB9KQo+ID4gCj4gPiBGb3Igb3VyIHB1cnBvc2VzIF9fYXV0b190eXBlIGRvZXNuJ3QgcHJv
dmlkZSBhZHZhbnRhZ2VzIG92ZXIKPiA+IHR5cGVvZigpLgo+ID4gUGx1cywgbW9yZSBpbXBvcnRh
bnRseSwgdGhlIHVzZSBhYm92ZSBpcyB3cm9uZywganVzdCBsaWtlIHR5cGVvZih4KQo+ID4gd291
bGQgYWxzbyBiZSB3cm9uZy4gSXQgbmVlZHMgdG8gYmUgcCB0aGF0IHRoZSB0eXBlIGlzIGRlcml2
ZWQKPiA+IGZyb20uCj4gPiBPdGhlcndpc2UgY29uc2lkZXIgd2hhdCBoYXBwZW5zIHdoZW4gcHRy
IGlzIHVuc2lnbmVkIGxvbmcgKiBvcgo+ID4gdW5zaWduZWQgc2hvcnQgKiBhbmQgeW91IHdyaXRl
Cj4gPiAKPiA+IMKgwqDCoCB3cml0ZV9hdG9taWMocHRyLCAwKTsKPiA+IAo+ID4gPiBBbmQgYW5v
dGhlciBvcHRpb24gY291bGQgYmUganVzdCBkcm9wIHZvbGF0aWxlIGJ5IGNhc3Rpbmc6Cj4gPiA+
IMKgwqAgI2RlZmluZSB3cml0ZV9hdG9taWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ID4gwqDCoCAuLi4KPiA+ID4g
wqDCoMKgwqDCoMKgIF93cml0ZV9hdG9taWMocCwgKGNvbnN0IHZvaWQgKikmeF8sCj4gPiA+IHNp
emVvZigqKHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gPiAKPiA+IFNl
ZSB3aGF0IEkgc2FpZCBlYXJsaWVyIGFib3V0IGNhc3RzOiBZb3Ugc2hhbGwgbm90IGNhc3QgYXdh
eQo+ID4gcXVhbGlmaWVycy4gQmVzaWRlcyBkb2luZyBzbyBiZWluZyBiYWQgcHJhY3RpY2UsIHlv
dSdsbCBub3RpY2UgdGhlCj4gPiBsYXRlc3Qgd2hlbiBSSVNDLVYgY29kZSBhbHNvIGJlY29tZXMg
c3ViamVjdCB0byBNaXNyYSBjb21wbGlhbmNlLgo+IAo+IFRoZW4gcHJvYmFibHkgdGhlIGJlc3Qg
b25lIG9wdGlvbiB3aWxsIGJlIHRvIHVzZSB1bmlvbjoKPiDCoMKgICNkZWZpbmUgd3JpdGVfYXRv
bWljKHAsIHgpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiDCoMKgIFwKPiDCoMKgICh7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAKPiDCoMKgIFwKPiDCoMKgwqDCoMKgwqAgdW5pb24geyB0eXBlb2YoKihwKSkgdmFs
OyBjaGFyIGNbc2l6ZW9mKCoocCkpXTsgfSB4XyA9IHsgLnZhbAo+ID0KPiDCoMKgICh4KSB9O8Kg
IFwKPiDCoMKgwqDCoMKgwqAgX3dyaXRlX2F0b21pYyhwLCB4Xy5jLCBzaXplb2YoKihwKSkpO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gwqDCoCBc
Cj4gwqDCoCB9KQpPciBtYXliZSB3ZSBjYW4gdXNlICd1bnNpZ25lZCBsb25nJyBpbnN0ZWFkIG9m
IGNoYXIgY1tdIGFuZCB0aGVuIHRoZQpjYXN0cyBpbnNpZGUgX3dyaXRlX2F0b21pYygpIGNvdWxk
IGJlIGRyb3BwZWQgYXMgd2UgY2FuIHN0YXJ0IHRvIHVzZQpfd3JpdGVfYXRvbWljKC4uLiwgY29u
c3QgdW5zaWduZWQgbG9uZyB4LCAuLi4pLgoKQnV0IHRoZW4gcHJvYmFibHkgaXQgd2lsbCBiZSBn
b29kIHRvIGluaXQ6IHhfLmMgPSAwVUwgdG8gYmUgc3VyZSB0aGF0CndoZW4gdHlwZSBvZiB2YWwg
aXMgdWludDhfdCBmb3IgZXhhbXBsZSB0aGVuIHRoZSBzaWduaWZpY2FudCBieXRlcyBvZgondW5p
b24gey4uLjsgdW5zaWduZWQgbG9uZyBjfScgYXJlIDAuCgp+IE9sZWtzaWkK


