Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33E809F2A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650473.1016054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX4T-0004rv-R4; Fri, 08 Dec 2023 09:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650473.1016054; Fri, 08 Dec 2023 09:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBX4T-0004pX-Ni; Fri, 08 Dec 2023 09:22:57 +0000
Received: by outflank-mailman (input) for mailman id 650473;
 Fri, 08 Dec 2023 09:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBX4T-0003Qs-2w
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:22:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e88c4a7-95ab-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:22:55 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1f0616a15bso173088766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:22:55 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 mm20-20020a1709077a9400b00a1a53e9f401sm765100ejc.132.2023.12.08.01.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:22:54 -0800 (PST)
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
X-Inumbo-ID: 5e88c4a7-95ab-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702027375; x=1702632175; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vAPihQE3snyW2VHTowdcIRjngwKbTcKlBYQnCO7n/pA=;
        b=TA82YGFkevJ62m33Y21ESGRztbFXKzwEy6jSeqcU7zEAAHXktVQJiwFmBz10m9o48R
         xYKsaEFNeAC5Drrxc4c6HqEb4Ho/O1rI+4pCJZt7fxfDCXxBXZChE2Pl75fc7+8DBn7j
         zBt2Jrj6eAcBFrsxU8MtHsNIhCJ2kkJYVjTvqKgpvLZmupiI2ghzQbs9r+kmIxZky5zL
         7mHY/qJleB99yG4HUjS0osHINHZiAej9T/U4zwBH5vUX5aKv8y643W1c6cbIYsNN5Fhk
         NxnH6LmTirlQ+g+weAVcVXyss//qvzAslV5prINmKOKxkNxlBYaf5Zn8nftn0IrFR869
         kFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702027375; x=1702632175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAPihQE3snyW2VHTowdcIRjngwKbTcKlBYQnCO7n/pA=;
        b=QlwAyxDm5ZZP+orshGhRZXxbsKzExUqpR8GDMbXggH8eHiUgmCsn8ugiqC/ow5U6tZ
         r8HdCuklm5bNse/L06USGA/dzVnhSgtTyKnd7sI3IbiBcio90B3LG4vtvnd764dJ6YG3
         NynvdnG/d4NLK0V0wJuijt9zt96843BUA5tjf+XHfaFosEQ5RKmPjbDhTla/4NvXp1MN
         3TKg7aqJ5KriLSC+BpADT++CPBKzGsqe9sn/4gg3dgS2c9APcSZyKocth+g3SQmL0Vtd
         zR5d84BuGiW5bFHzH9CwQkIlzIL+qLDiBn6a4ODoXeuyTWeZtT+O6vBsimOHaIZpSmk4
         3PXA==
X-Gm-Message-State: AOJu0YwjbqozfGO8tmmgoihnpsdCNyWD2j/eItZSQDY+cufDMawFmpqt
	gDrQN6fhPnKZAM7iPrTLoxk=
X-Google-Smtp-Source: AGHT+IFRE9Dpt1uo3jcILXvCt6Vpek3vBH2M31vZivEq+HKQhK2DLbz073YU8mYBwmL3HOMgXUiIFA==
X-Received: by 2002:a17:907:9546:b0:a19:a19b:78ac with SMTP id ex6-20020a170907954600b00a19a19b78acmr1900607ejc.111.1702027374912;
        Fri, 08 Dec 2023 01:22:54 -0800 (PST)
Message-ID: <5c26e012e16b8170cf0da03c252355e820c95179.camel@gmail.com>
Subject: Re: [PATCH v2 09/39] xen/riscv: introduce asm/guest_atomics.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:22:53 +0200
In-Reply-To: <9f894049-ce44-41a4-b470-a27b7b46f26d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <48ecbc771d3870eee86dd11a19f0dd9029e93c01.1700761381.git.oleksii.kurochko@gmail.com>
	 <9f894049-ce44-41a4-b470-a27b7b46f26d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE1OjIwICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNC4xMS4yMDIzIDExOjMwLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZ3Vlc3RfYXRvbWljcy5o
Cj4gPiBAQCAtMCwwICsxLDQ4IEBACj4gPiArI2lmbmRlZiBfX0FTTV9SSVNDVl9HVUVTVF9BVE9N
SUNTX0gKPiA+ICsjZGVmaW5lIF9fQVNNX1JJU0NWX0dVRVNUX0FUT01JQ1NfSAo+ID4gKwo+ID4g
Ky8qCj4gPiArICogVE9ETzogaW1wbGVtZW50IGd1ZXN0IGF0b21pY3MKPiA+ICsgKi8KPiAKPiBB
bG9uZyB3aXRoIHRoaXMsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBoYXZlIGUuZy4KPiBBU1NF
UlRfVU5SRUFDSEFCTEUoKQo+IGluIHRoZSB1bmltcGxlbWVudGVkIGZ1bmN0aW9ucz8KVGhhbmtz
IGZvciByZWNvbW1lbmRhdGlvbi4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGFkZApBU1NFUlRfVU5S
RUFDSEFCTEUuCgp+IE9sZWtzaWkKPiAKPiA+ICsjZGVmaW5lCj4gPiBndWVzdF90ZXN0b3AobmFt
ZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gXAo+ID4gK3N0
YXRpYyBpbmxpbmUgaW50IGd1ZXN0XyMjbmFtZShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgbnIsIHZv
bGF0aWxlCj4gPiB2b2lkICpwKcKgIFwKPiA+ICt7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgKHZvaWQpCj4gPiBkO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4g
K8KgwqDCoCAodm9pZCkKPiA+IG5yO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgKHZvaWQpCj4gPiBw
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiA+ICvCoMKgwqAgcmV0dXJuCj4gPiAwO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK30KPiA+ICsK
PiA+ICsjZGVmaW5lCj4gPiBndWVzdF9iaXRvcChuYW1lKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IFwKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZ3Vlc3Rf
IyNuYW1lKHN0cnVjdCBkb21haW4gKmQsIGludCBuciwgdm9sYXRpbGUKPiA+IHZvaWQgKnApIFwK
PiA+ICt7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKg
wqAgKHZvaWQpCj4gPiBkO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCAodm9pZCkKPiA+IG5yO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPiA+ICvCoMKgwqAgKHZvaWQpCj4gPiBwO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gK30KPiA+
ICsKPiA+ICtndWVzdF9iaXRvcChzZXRfYml0KQo+ID4gK2d1ZXN0X2JpdG9wKGNsZWFyX2JpdCkK
PiA+ICtndWVzdF9iaXRvcChjaGFuZ2VfYml0KQo+ID4gKwo+ID4gKyN1bmRlZiBndWVzdF9iaXRv
cAo+ID4gKwo+ID4gK2d1ZXN0X3Rlc3RvcCh0ZXN0X2FuZF9zZXRfYml0KQo+ID4gK2d1ZXN0X3Rl
c3RvcCh0ZXN0X2FuZF9jbGVhcl9iaXQpCj4gPiArZ3Vlc3RfdGVzdG9wKHRlc3RfYW5kX2NoYW5n
ZV9iaXQpCj4gPiArCj4gPiArI3VuZGVmIGd1ZXN0X3Rlc3RvcAo+ID4gKwo+ID4gKyNkZWZpbmUg
Z3Vlc3RfdGVzdF9iaXQoZCwgbnIsIHApICgodm9pZCkoZCksIHRlc3RfYml0KG5yLCBwKSkKPiA+
ICsKPiA+ICsjZW5kaWYgLyogX19BU01fUklTQ1ZfR1VFU1RfQVRPTUlDU19IICovCj4gPiArLyoK
PiA+ICsgKiBMb2NhbCB2YXJpYWJsZXM6Cj4gPiArICogbW9kZTogQwo+ID4gKyAqIGMtZmlsZS1z
dHlsZTogIkJTRCIKPiA+ICsgKiBjLWJhc2ljLW9mZnNldDogNAo+ID4gKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbAo+ID4gKyAqIEVuZDoKPiA+ICsgKi8KPiAKCg==


