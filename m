Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E0838B99
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 11:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670332.1043029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDu8-0005IK-Pw; Tue, 23 Jan 2024 10:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670332.1043029; Tue, 23 Jan 2024 10:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDu8-0005F7-N1; Tue, 23 Jan 2024 10:21:16 +0000
Received: by outflank-mailman (input) for mailman id 670332;
 Tue, 23 Jan 2024 10:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSDu7-0005F1-CS
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 10:21:15 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 227c0054-b9d9-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 11:21:13 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28bd9ca247so457842266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 02:21:13 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ci1-20020a170906c34100b00a30dae38ff5sm173634ejb.114.2024.01.23.02.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 02:21:12 -0800 (PST)
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
X-Inumbo-ID: 227c0054-b9d9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706005273; x=1706610073; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=38DKqM/HWmC87egWIAVZD/Dtyytpjpp5o67PwUTrZxs=;
        b=WWqaavSFhRiHazNp2xLvzDvtZ1wcq2LzD/SotSP162bC6ofmdqGYoNXGJXioPosTmz
         jmyLQvTQ2Rt+BZ8xkhHLlCJ2iZ8BkIiqksWx0OT7PP5xC7jTqhcQ8g5gwPAOV7YRlK4U
         g/MpTCvUNk1GM1vdB2FijHQbUFybsoBKdzc6QHM+8Af6orGx9Bd30oOUD59NpJmpK0Oy
         yr7/51OIDCx/miswTmCb2tPpX/ZN6GxGXhhBXVhvijlKZdLVbCujuhx+x/T32Oa2IJzG
         S7aV+5p76DsOSpHNO6GWJwSFaB4zeTOLtHlfaT0ohkzvTZmt/eQh68Qrimi+Ap/3fdYF
         htfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706005273; x=1706610073;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38DKqM/HWmC87egWIAVZD/Dtyytpjpp5o67PwUTrZxs=;
        b=Z9ifMb73EmWXPbR+RC2IR+XyDmfp/L3MWeLtstm11TVBtEe/uTXxj7Z84ps3SxEMX/
         v8wVNolM23MFpQ8Xo8rAwejK3mgltk2TiLyUm3q3umLQCavlE8xvQqks4BisAXVJHfMg
         NMFxZHHqN5/CuraKZoj5M8DtYhKfBnoeqsWLQtfBC+AR/a1PJNkgVKALKcuE9i3X0cVA
         alEbXSkqZ0f9VhVuNMY00LODghVNgSyIK8oxdu9E6Xwejhfomtf/tIexrifYVfmjNuVS
         Q/8f5jeseaexMOpq8W2kKEtRDC6Qsfiq4v7VlzCB30kSqypioKSxr8frdHuKRUMokoLK
         TGPA==
X-Gm-Message-State: AOJu0YyujssoofQYVuLMr6YHpPS4WL3b0TCAU/cQxNjP4UHvT9fsGMvO
	IxgbkD8FLfRr1Gboot6A4o2zcdhO8gyinc2TK42uXVT7x64QJ6XD
X-Google-Smtp-Source: AGHT+IEGJFdQoq8wQH4DVjb9OuIIg/QBhH8CDybsinbqKBZJe6IbR62kjcdocMTvmWHkpiGCcFuMBQ==
X-Received: by 2002:a17:906:80c7:b0:a30:75e6:9865 with SMTP id a7-20020a17090680c700b00a3075e69865mr1200516ejx.102.1706005272562;
        Tue, 23 Jan 2024 02:21:12 -0800 (PST)
Message-ID: <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 12:21:10 +0200
In-Reply-To: <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
	 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDE3OjU2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyMi4xMi4yMDIzIDE2OjEyLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmgKPiA+IEBA
IC0wLDAgKzEsMzg0IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLwo+ID4gKy8qCj4gPiArICogVGFrZW4gYW5kIG1vZGlmaWVkIGZyb20gTGludXguCj4g
PiArICogCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDA3IFJlZCBIYXQsIEluYy4gQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTIgUmVnZW50cyBvZiB0aGUgVW5p
dmVyc2l0eSBvZiBDYWxpZm9ybmlhCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE3IFNpRml2ZQo+
ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBWYXRlcyBTQVMKPiA+ICsgKi8KPiA+ICsKPiA+ICsj
aWZuZGVmIF9BU01fUklTQ1ZfQVRPTUlDX0gKPiA+ICsjZGVmaW5lIF9BU01fUklTQ1ZfQVRPTUlD
X0gKPiA+ICsKPiA+ICsjaW5jbHVkZSA8eGVuL2F0b21pYy5oPgo+ID4gKyNpbmNsdWRlIDxhc20v
Y21weGNoZy5oPgo+ID4gKyNpbmNsdWRlIDxhc20vZmVuY2UuaD4KPiA+ICsjaW5jbHVkZSA8YXNt
L2lvLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4KPiA+ICsKPiA+ICt2b2lkIF9fYmFk
X2F0b21pY19zaXplKHZvaWQpOwo+ID4gKwo+ID4gK3N0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQg
cmVhZF9hdG9taWNfc2l6ZShjb25zdCB2b2xhdGlsZSB2b2lkICpwLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2b2lkICpyZXMsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBzaXplKQo+ID4gK3sKPiA+ICvCoMKgwqAgc3dpdGNoICggc2l6ZSAp
Cj4gPiArwqDCoMKgIHsKPiA+ICvCoMKgwqAgY2FzZSAxOiAqKHVpbnQ4X3QgKilyZXMgPSByZWFk
YigoY29uc3QgdWludDhfdCAqKXApOyBicmVhazsKPiA+ICvCoMKgwqAgY2FzZSAyOiAqKHVpbnQx
Nl90ICopcmVzID0gcmVhZHcoKGNvbnN0IHVpbnQxNl90ICopcCk7IGJyZWFrOwo+ID4gK8KgwqDC
oCBjYXNlIDQ6ICoodWludDMyX3QgKilyZXMgPSByZWFkbCgoY29uc3QgdWludDMyX3QgKilwKTsg
YnJlYWs7Cj4gPiArwqDCoMKgIGNhc2UgODogKih1aW50MzJfdCAqKXJlc8KgID0gcmVhZHEoKGNv
bnN0IHVpbnQ2NF90ICopcCk7IGJyZWFrOwo+IAo+IEp1c3QgbGlrZSBjb25zdCwgeW91IHNob3Vs
ZCBhbHNvIGF2b2lkIGNhc3RpbmcgYXdheSB2b2xhdGlsZS4KVGhhbmtzLiBJIHdpbGwgZHJvcCBj
YXN0aW5nLgoKPiAKPiA+ICvCoMKgwqAgZGVmYXVsdDogX19iYWRfYXRvbWljX3NpemUoKTsgYnJl
YWs7Cj4gPiArwqDCoMKgIH0KPiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSByZWFkX2F0b21pYyhw
KQo+ID4gKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
IHVuaW9uIHsgdHlwZW9mKCpwKSB2YWw7IGNoYXIgY1swXTsgfQo+ID4geF87wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAg
cmVhZF9hdG9taWNfc2l6ZShwLCB4Xy5jLAo+ID4gc2l6ZW9mKCpwKSk7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKg
Cj4gPiB4Xy52YWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgCj4gPiBcCj4gPiArfSkKPiA+ICsKPiA+ICsKPiAKPiBOaXQ6IE5v
IGRvdWJsZSBibGFuayBsaW5lcyBwbGVhc2UuClN1cmUuIEknbGwgZHJ0b3Agb25lIGJsYW5rIGxp
bmUuCj4gCj4gPiArI2RlZmluZSB3cml0ZV9hdG9taWMocCwgeCkKPiA+ICh7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgdHlwZW9mKCpwKSB4X18gPQo+ID4gKHgpO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgc3dpdGNoICgg
c2l6ZW9mKCpwKQo+ID4gKQkJCQkJCQkJCQkJCVwKPiA+ICvCoMKgwqAKPiA+IHvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAJCQkJCQlcCj4gCj4gVGhlc2UgbGluZXMgbG9vayBleGNl
c3NpdmVseSBsb25nLCBwb3NzaWJseSBhcyBhIHJlc3VsdCBvZiBsZWF2aW5nCj4gaGFyZCB0YWJz
Cj4gaW4gcGxhY2UuCj4gCj4gT3ZlcmFsbCBzb21lIG9mIHRoZSBzdHlsZSBjb21tZW50cyBvbiB0
aGUgZWFybGllciBwYXRjaCBzZWVtIHRvIGFwcGx5Cj4gaGVyZQo+IGFzIHdlbGwuCj4gCj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mZW5jZS5o
Cj4gPiBAQCAtMCwwICsxLDEzIEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb3ItbGF0ZXIgKi8KPiA+ICsjaWZuZGVmIF9BU01fUklTQ1ZfRkVOQ0VfSAo+ID4gKyNk
ZWZpbmUgX0FTTV9SSVNDVl9GRU5DRV9ICj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19TTVAKPiA+
ICsjZGVmaW5lIFJJU0NWX0FDUVVJUkVfQkFSUklFUgkJIlx0ZmVuY2UgciAsIHJ3XG4iCj4gPiAr
I2RlZmluZSBSSVNDVl9SRUxFQVNFX0JBUlJJRVIJCSJcdGZlbmNlIHJ3LMKgIHdcbiIKPiA+ICsj
ZWxzZQo+ID4gKyNkZWZpbmUgUklTQ1ZfQUNRVUlSRV9CQVJSSUVSCj4gPiArI2RlZmluZSBSSVND
Vl9SRUxFQVNFX0JBUlJJRVIKPiA+ICsjZW5kaWYKPiAKPiBEbyB5b3UgcmVhbGx5IGNhcmUgYWJv
dXQgdGhlICFTTVAgY2FzZT8gT24geDg2IGF0IGxlYXN0IHdlIHN0b3BwZWQKPiBzcGVjaWFsLQo+
IGNhc2luZyB0aGF0IGNvbmZpZ3VyYXRpb24gbWFueSB5ZWFycyBhZ28gKHRoZSBmZXcgY2FzZXMg
d2hlcmUgZm9yCj4gdHlwaWNhbGx5Cj4gYnVpbGQgcmVhc29ucyBpdCBtYXR0ZXJzLCB1c2luZyBD
T05GSUdfTlJfQ1BVUyBpcyBzdWZmaWNpZW50KS4gSWYgeW91Cj4gY2FyZQo+IGFib3V0IGl0LCB0
aGVyZSBuZWVkcyB0byBiZSBzb21ld2hlcmUgeW91IGFjdHVhbGx5ICNkZWZpbmUKPiBDT05GSUdf
U01QLgpDYW4ndCB3ZSB1c2UgaW5zdGVhZCBvZiBDT05GSUdfU01QIC0gQ09ORklHX05SX0NQVVM/
IEkgbWlzc2VkIHRoYXQKQ09ORklHX1NNUCBpcyBwcmVzZW50IGluIExpbnV4LCBidXQgbm90IGlu
IFhlbi4KCn4gT2xla3NpaQoK


