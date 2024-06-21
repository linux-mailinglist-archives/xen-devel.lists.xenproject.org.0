Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC99120D0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745185.1152353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKajK-0000CR-4e; Fri, 21 Jun 2024 09:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745185.1152353; Fri, 21 Jun 2024 09:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKajK-00009k-1h; Fri, 21 Jun 2024 09:38:50 +0000
Received: by outflank-mailman (input) for mailman id 745185;
 Fri, 21 Jun 2024 09:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgEJ=NX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKajI-00009e-Ny
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:38:48 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f0556d5-2fb2-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 11:38:47 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52c94cf4c9bso2286550e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 02:38:47 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cda743110sm43690e87.201.2024.06.21.02.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 02:38:46 -0700 (PDT)
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
X-Inumbo-ID: 0f0556d5-2fb2-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962727; x=1719567527; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=penVdCFQ4sC++G2qfQuDyrB4tANgUxqYAXUDBN2/v9w=;
        b=lok9+a4oNpGt0yqVJKJYgcoJi2zDYO2h5VME7KbnsL/+c61tnPHL2WoCQH03EWY854
         Na0fPmzFIZY6YmvxmqC4m6c/jCRyYQikiTulknwRQ/uo+weaQWR4y/t35IwN8d5SKrir
         m4RqpcO4DGY4xNTR8SQ7EnkCM2QPQbfRgES8oxA901teV2KeeCBchOwhJ4ARXfhVKNx9
         ZKc1Nhi9CQ/CtuWkGbJ5NvxUxWaKi205X2Q35AXSAh+B6mqaAk25ycZg/u16/Nxlf8Wz
         G1qw2dLcV+dkPmxlFfxWWx7I17StYUH1c/HiZ4GfNNkTxKUQJOskYo1bnsz35lk9VPv6
         ItDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962727; x=1719567527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=penVdCFQ4sC++G2qfQuDyrB4tANgUxqYAXUDBN2/v9w=;
        b=ZAguyKkuMXmbTeeIU5aAj2QqeYoavWbxZvI6fKZXMx+Vww0NlorY1wIWay4KBpe0NR
         hg9H6TaKHaFHmi4/DT9sebcKZGb6G7ZxRiqUaa2oE6vsu/XTRBuscT1VH5aE85UuGF3A
         eHa8p+auKkVRaA4pplmHcObmcgRX289pQwEg5V77Q16qtWnXf3oB8ROppka7xqcmg/SW
         SdiawjKsqsnH3vmw66iA4sTVMrlUlHvzESNLaUqovfmS2RPAbS5vU9yCKhmi7WBxvHli
         9SoS0F+Rd8v6PLG26ZD8jyiXCu7CSvXV9Z9p6+/0RCfcaRyvXVCo9xMXrxtfg4ETCnwv
         OxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUrHvZacO7gyIqYLWPuGzSVDyLYCZFB4WuyUlE8GFWemIMG10C1dSNxos1fHbuhbuAk9DyITHePcw2S7vIXZrh8IRLPPq0gBE8AylOYU4=
X-Gm-Message-State: AOJu0YziPSvxlooZcIbA6Ln0u7qNfiXzahXtu3vxJ4oQfCRn5UrCJitb
	FhaJeRn6yaLzcP1cMt87DjFJtnuZUyjDQBb9eRtB9D0waizm8TCp
X-Google-Smtp-Source: AGHT+IH1i4kbje+DslaSrUM6HBz8lfQ5+dYTjbfaAO6pD42p33DBIs65vCg7Biq7lJYxY6pvJN7kxw==
X-Received: by 2002:ac2:4dac:0:b0:52c:dacf:e5ac with SMTP id 2adb3069b0e04-52cdacfe7e9mr177368e87.54.1718962726820;
        Fri, 21 Jun 2024 02:38:46 -0700 (PDT)
Message-ID: <0d890819b8f8616df7592d39bdd97b117c51c643.camel@gmail.com>
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: request host address to
 be specified for 1:1 domains
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Date: Fri, 21 Jun 2024 11:38:45 +0200
In-Reply-To: <20240621092205.30602-1-michal.orzel@amd.com>
References: <20240621092205.30602-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

T24gRnJpLCAyMDI0LTA2LTIxIGF0IDExOjIyICswMjAwLCBNaWNoYWwgT3J6ZWwgd3JvdGU6Cj4g
QXMgYSBmb2xsb3cgdXAgdG8gY29tbWl0IGNiMWRkYWZkYzU3MyAoInhlbi9hcm0vc3RhdGljLXNo
bWVtOiBTdGF0aWMtCj4gc2htZW0KPiBzaG91bGQgYmUgZGlyZWN0LW1hcHBlZCBmb3IgZGlyZWN0
LW1hcHBlZCBkb21haW5zIikgYWRkIGEgY2hlY2sgdG8KPiByZXF1ZXN0IHRoYXQgYm90aCBob3N0
IGFuZCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIG11c3QgYmUgc3VwcGxpZWQKPiBmb3IKPiBkaXJl
Y3QgbWFwcGVkIGRvbWFpbnMuIE90aGVyd2lzZSByZXR1cm4gYW4gZXJyb3IgdG8gcHJldmVudCB1
bndhbnRlZAo+IGJlaGF2aW9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWlj
aGFsLm9yemVsQGFtZC5jb20+Cj4gLS0tCj4gUmVhc29uaW5nIGZvciA0LjE5Ogo+IHRoaXMgaXMg
aGFyZGVuaW5nIHRoZSBjb2RlIHRvIHByZXZlbnQgYSBmZWF0dXJlIG1pc3VzZSBhbmQgdW53YW50
ZWQKPiBiZWhhdmlvci4KPiAtLS0KUmVsZWFzZS1BY2tlZC1CeTogT2xla3NpaSBLdXJvY2hrbyA8
b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cgp+IE9sZWtzaWkKPiDCoHhlbi9hcmNoL2FybS9z
dGF0aWMtc2htZW0uYyB8IDcgKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMgYi94ZW4v
YXJjaC9hcm0vc3RhdGljLQo+IHNobWVtLmMKPiBpbmRleCBjZDQ4ZDI4OTZiN2UuLmFhODA3NTZj
M2NhNSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMKPiArKysgYi94
ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMKPiBAQCAtMzc4LDYgKzM3OCwxMyBAQCBpbnQgX19p
bml0IHByb2Nlc3Nfc2htKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+IGtlcm5lbF9pbmZvICpr
aW5mbywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG1lbWJhbmsgKmFs
bG9jX2JhbmsgPQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbmRfc2htX2Jh
bmtfYnlfaWQoZ2V0X3NobWVtX2hlYXBfYmFua3MoKSwgc2htX2lkKTsKPiDCoAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICggaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBy
aW50aygiJXBkOiBob3N0IGFuZCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIG11c3QgYmUKPiBzdXBw
bGllZCBmb3IgZGlyZWN0LW1hcHBlZCBkb21haW5zXG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiArCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGd1ZXN0IHBoeXMgYWRkcmVzcyBpcyByaWdodCBh
dCB0aGUgYmVnaW5uaW5nICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdiYXNlID0gZHRf
cmVhZF9wYWRkcihjZWxscywgYWRkcl9jZWxscyk7Cj4gwqAKCg==


