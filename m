Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB182D5DB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667245.1038312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJEj-00012E-Ew; Mon, 15 Jan 2024 09:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667245.1038312; Mon, 15 Jan 2024 09:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJEj-0000zr-Bm; Mon, 15 Jan 2024 09:26:29 +0000
Received: by outflank-mailman (input) for mailman id 667245;
 Mon, 15 Jan 2024 09:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPJEh-0000zj-US
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:26:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2823f4d1-b388-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 10:26:26 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2d04888d3dso235017666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:26:26 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a1709066b1500b00a2990007447sm5024457ejr.122.2024.01.15.01.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 01:26:25 -0800 (PST)
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
X-Inumbo-ID: 2823f4d1-b388-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705310786; x=1705915586; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=twn8mxq6QWu6op/kJWNGEolTbdkLvo3nNC4I8/wKp6Q=;
        b=aMLGYJaVdwOPJahDNj+fN1tSPE3MdHMaxyMKdk2xeWg42pbcS92Y9v8/gx2yQ4Qxwp
         amNsxBrzMtGCoIUJzdD3CHgGaMXgDCIub2eyrO3kvfrDCkVIkqVdtcxvcvtH1w0dGQoE
         u00q1poQSKkKQCMb1WFrAhmzrlHA1h3BnBzuv3N3RS/mCm+V7JvLtotELTPfIFWNRps7
         GGoPmpXu+vQ6GmLpSxrNsU3fU3QBjfnGKLzaOzFhq566B/mGolxpHGCZgbaB5im0Ujqk
         hnX1SOv6PKQYq0xiz/fua+ltoEEr7Q16kiO0BsekTBT2o4/wkkqeUUEL/pyRk23RQJ+D
         Ctdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705310786; x=1705915586;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twn8mxq6QWu6op/kJWNGEolTbdkLvo3nNC4I8/wKp6Q=;
        b=KreEmfck7OjVpAIKiXkZWaZm60otyqPJjw4lVnaAG4K2157rBascLJqJW0DKQYO99L
         FU+8Nuhjizc/vqHLEs0oMhAnToB6HW6LMzftPoHPyk1t4iD9FmbutI+f4/Gsl0dLLgLi
         MkDn1GFOzncgy9Xhk3bZdH/X7wBRG0mswisHqZ1BZnXDETSmfQ+evBV8wQDSR8qvr8Vf
         gvLIFftA4f72/j1rHceK9t3tet50Idv7nNpc83Lzjk6LTAc9FfNmhYHmLUHmm0CrXFWT
         trFFh4LcoVHvfnCh5EhU7PaTVqhVYz45CtYLpl/x9Pw86XTPteIa++OIWHA1o9l2zStE
         a4aw==
X-Gm-Message-State: AOJu0YwZSNBNmUi1lWZhM6qTKdxHxQd9xcUf2KL18dC6KIBb6qETqM9U
	zy8Jdax5vlvcNC+YF9f+iQY=
X-Google-Smtp-Source: AGHT+IEgcI3SDw1hYUzuO0HkE+6F/LQQxTB0oKGKGUfbjjcbiPhIsDSn8zZITt2h4xmjQQgVYs3pLA==
X-Received: by 2002:a17:907:a094:b0:a2b:5d55:c322 with SMTP id hu20-20020a170907a09400b00a2b5d55c322mr2550239ejc.25.1705310785933;
        Mon, 15 Jan 2024 01:26:25 -0800 (PST)
Message-ID: <b518eb0c42b4c14cf6ae2bae781dfdc32df8c500.camel@gmail.com>
Subject: Re: [PATCH v3 05/34] xen/riscv: introduce guest_atomics.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 15 Jan 2024 11:26:24 +0200
In-Reply-To: <076d5ca3-90df-46ac-9309-a2a96ffc378d@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <fdbe7261178d057d9868aacea19c1c2b82d2da16.1703255175.git.oleksii.kurochko@gmail.com>
	 <076d5ca3-90df-46ac-9309-a2a96ffc378d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTAxLTExIGF0IDE2OjU3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyMi4xMi4yMDIzIDE2OjEyLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogT2xla3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgaW4gVjM6Cj4gPiDCoC0gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZQo+
IAo+IFRoZXJlIChzdGlsbCkgaXMgbm9uZSAtIHdoYXQgaXMgdGhlIGFib3ZlIGFib3V0PwpNaXNz
ZWQgc29tZXRoaW5nLiBJJ2xsIGRvdWJsZSBjaGVjayBkdXJpbmcgcHJvdmlkaW5nIHRoZSBuZXh0
IHBhdGNoCnZlcnNpb24uCj4gCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9ndWVzdF9hdG9taWNzLmgKPiA+IEBAIC0wLDAgKzEsNDkgQEAKPiA+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiArI2lmbmRl
ZiBfX0FTTV9SSVNDVl9HVUVTVF9BVE9NSUNTX0gKPiA+ICsjZGVmaW5lIF9fQVNNX1JJU0NWX0dV
RVNUX0FUT01JQ1NfSAo+ID4gKwo+ID4gKyNkZWZpbmUKPiA+IGd1ZXN0X3Rlc3RvcChuYW1lKcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiBcCj4gPiArc3RhdGlj
IGlubGluZSBpbnQgZ3Vlc3RfIyNuYW1lKHN0cnVjdCBkb21haW4gKmQsIGludCBuciwgdm9sYXRp
bGUKPiA+IHZvaWQgKnApwqAgXAo+ID4gK3vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+ID4gK8KgwqDCoCAodm9pZCkKPiA+IGQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDC
oMKgICh2b2lkKQo+ID4gbnI7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCAodm9pZCkKPiA+IHA7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gCj4gV2hhdCBhcmUgdGhlc2UgYW5kIC4uLgo+IAo+ID4gK8KgwqDCoAo+ID4g
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
PiA+IMKgwqDCoMKgIFwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4gPiArwqDCoMKgIHJldHVybgo+ID4gMDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9Cj4gPiAr
Cj4gPiArI2RlZmluZQo+ID4gZ3Vlc3RfYml0b3AobmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiBcCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGd1ZXN0
XyMjbmFtZShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgbnIsIHZvbGF0aWxlCj4gPiB2b2lkICpwKSBc
Cj4gPiAre8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDC
oMKgICh2b2lkKQo+ID4gZDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgKHZvaWQpCj4gPiBucjvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4gPiArwqDCoMKgICh2b2lkKQo+ID4gcDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiAKPiAuLi4g
dGhlc2UgYWJvdXQ/IElmIHRoZXJlJ3MgYSByZWFzb24gZm9yIGhhdmluZyB0aGVtLCB0aGVuIChu
aXQpCj4gdGhlcmUKPiBhcmUgc3RyYXkgYmxhbmtzLgpJdCBpcyBvbmx5IG9uZSByZWFzb24gZm9y
IHRoYXQgdG8gc2hvdyB0aGF0IGFyZ3MgYXJlIHVudXNlZCBmb3IgdGltZQpiZWluZy4KQnV0IEkg
dGhpbmsgSSBjYW4gZHJvcCB0aGVzZSBjaGFuZ2VzLgoKCn4gT2xla3NpaQo=


