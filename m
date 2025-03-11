Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF818A5C656
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908337.1315467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Si-0001nG-K7; Tue, 11 Mar 2025 15:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908337.1315467; Tue, 11 Mar 2025 15:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Si-0001l0-HI; Tue, 11 Mar 2025 15:24:08 +0000
Received: by outflank-mailman (input) for mailman id 908337;
 Tue, 11 Mar 2025 15:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1Sh-0001ku-8z
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:24:07 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dddfe0cc-fe8c-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:24:05 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2feae794508so8460492a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:24:05 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff4e773c7csm12057570a91.15.2025.03.11.08.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:24:03 -0700 (PDT)
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
X-Inumbo-ID: dddfe0cc-fe8c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741706643; x=1742311443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9SkM+QBVMzm9A6N98427a8lsiY/0Sg+B4uvqfE1GeA4=;
        b=cV+R5Dhs/TKomlOD7qavZp4QGYzEnyATmeD4p9rGXhxwPbn+s9VfCOimNMgicWXloM
         URx/26SH9chIuX+fe1QNLnaDIlLGABmC/VyFv+XwHAoB4XygY5ALbfhA4TIc1M4EtwsD
         I5mHKfSpD8l8YYb8wrXa3Gl7RqoR9J7SxXFFfu2TTlfoya+89HjEo/JWTtQr1aBcOhY5
         vSS3OxyxPyyxK68Wy7jj/hPeLzUPDNtg3lOn01KlI4F/4rRjD+UdS1RY31f4lTfVPNo9
         /8TkNla5y4w4CuGWmcdsaZjuVkOdbW3aEfdib5hdjg/JXKZki4mRYQ45X8H+ZsFrAXa3
         uAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706643; x=1742311443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SkM+QBVMzm9A6N98427a8lsiY/0Sg+B4uvqfE1GeA4=;
        b=ew33vz9HOU2hTcW/ipeJ+iBQqeZ1IDO6tGa92+if4ePCQnEJrX05XImI+Terxme4zq
         mkg2GSlADmJa2vH6mVGum9rN+mMirLZ92QVkoDM56bKZQaOtSStG145cfh1ajc+Wuogb
         EgIu48ZL0pKXntSmgCN8uFP+cR/MTj1GrnREWifcbyKTrkfUsegusAEY8ne/8oqO3+ds
         JdzIGxK4BEmspT/a8KUtZGS3FnIpHJOyNM2SPSvKRZeKDxwjM+mrHjxrA3PRhH6LnQV1
         LU/A45ThGR5Wf4yyXwuG5b+A6t6zehHfMV+frQwtEEUzFZLvMeVC83CZVmO/VCHog6PT
         UKZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPqkjKrJwoFVCeBkN/IdYGfwZ//Ui3k5jEKNW4CfaaT5qVKTh9gl9F7LoX9M3ksPQ4CPHrXAWSuqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqGgJBr8KI8zvz015d10YZAQggRUA24rjeczwncfdV0uxXfhWr
	F3JHvIYVnSPf1lf6erWOiQp1UOB+Npp7ITEru98RNLQqtO7F7dMJuICElRC53AQ=
X-Gm-Gg: ASbGncuoDoUj6biDyzs884mRBxUZzklzzS7Qs5S+9H4ed96OXpw6HU/UmXAlBV28Wb2
	eYHqvKAPopoCwBz0d8091FqoiUq0E9jo3A80LQuhyFV14eUn9qXmWl8hIwjj5MPjNHb+lqpe8+j
	bi1kZJFxf98fjOTShQbxIGT9ecC6otmwtLP5lisD17h2BRmL2uguIfb6oHjGPZY7LSf0dVVYLIa
	pliHVTXlqxTFtYFSkIPAhEkf1BAHz4KV0eDT2sdZEEHTD8/IeJSKzuDcqsi0Br8F+7FzlsCaWvD
	sNAR8td5QCtDr+SSbsciFr+Ui/BGE05nSVtF6FCqJCQPQ1e6CPXW6zvpZUlkw7D/4FpF
X-Google-Smtp-Source: AGHT+IFBs0+S+LkojiDrxva0/M3wYEnbIAEG3pIneKNxcshy9ERSmJz3RFAr2j7Us8awjWxYZcw3Bg==
X-Received: by 2002:a17:90b:1c05:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2ff7ce6d543mr28614081a91.9.1741706643713;
        Tue, 11 Mar 2025 08:24:03 -0700 (PDT)
Message-ID: <dbe403b1-a90a-4e32-a773-680539ce5550@linaro.org>
Date: Tue, 11 Mar 2025 08:24:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] include/exec/memory: extract devend_big_endian
 from devend_memop
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
 <b8073e25-ae8a-462b-b085-84c471a4bf5e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <b8073e25-ae8a-462b-b085-84c471a4bf5e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xMS8yNSAwMDozNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiB3ZSdsbCB1c2Ug
aXQgaW4gc3lzdGVtL21lbW9yeS5jLg0KPiANCj4gSGF2aW5nIHBhcnQgb2YgdGhlIGNvbW1p
dCBkZXNjcmlwdGlvbiBzZXBhcmF0ZWQgaW4gaXRzIHN1YmplY3QgaXMgYQ0KPiBiaXQgYW5u
b3lpbmcuIEJ1dCB0aGVuIEknbSBwcm9iYWJseSB1c2luZyAyMC15ZWFycyB0b28gb2xkIHRv
b2xzIGluDQo+IG15IHBhdGNoIHdvcmtmbG93Lg0KDQpDYW4geW91IHBsZWFzZSBzaGFyZSB3
aGF0IHdvdWxkIGJlIHRoZSBtZXNzYWdlIHlvdSAob3IgdGhlIHRvb2wpIHdvdWxkIA0KcHJl
ZmVyIGluIHRoaXMgY2FzZT8NCg0KSXQncyBqdXN0IGEgc2luZ2xlIGxpbmUgc3ViamVjdCAo
c2F5aW5nICJ3ZSBleHRyYWN0IHRoZSBmdW5jdGlvbiIpICsgYW4gDQphZGRpdGlvbmFsIGxp
bmUganVzdGlmeWluZyB3aHkgaXQncyBuZWVkZWQuDQoNCj4gDQo+IE9ubHkgdXNlZCBpbiBz
eXN0ZW0ve21lbW9yeSxwaHlzbWVtfS5jLCB3b3J0aCBtb3ZlIHRvIGEgbG9jYWwNCj4gc3lz
dGVtL21lbW9yeS1pbnRlcm5hbC5oIGhlYWRlcj8gT3IgZXZlbiBzaW1wbGVyLCBtb3ZlDQo+
IGluY2x1ZGUvZXhlYy9tZW1vcnktaW50ZXJuYWwuaCAtPiBleGVjL21lbW9yeS1pbnRlcm5h
bC5oIGZpcnN0Lg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVj
L21lbW9yeS5oIHwgMTggKysrKysrKysrKysrLS0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9leGVjL21lbW9yeS5oIGIvaW5jbHVkZS9leGVjL21lbW9yeS5oDQo+PiBp
bmRleCA2MGMwZmI2Y2NkNC4uNTc2NjEyODM2ODQgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRl
L2V4ZWMvbWVtb3J5LmgNCj4+ICsrKyBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaA0KPj4gQEAg
LTMxMzgsMTYgKzMxMzgsMjIgQEAgYWRkcmVzc19zcGFjZV93cml0ZV9jYWNoZWQoTWVtb3J5
UmVnaW9uQ2FjaGUgKmNhY2hlLCBod2FkZHIgYWRkciwNCj4+ICAgIE1lbVR4UmVzdWx0IGFk
ZHJlc3Nfc3BhY2Vfc2V0KEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBjLCBod2FkZHIgbGVuLCBN
ZW1UeEF0dHJzIGF0dHJzKTsNCj4+ICAgIA0KPj4gLS8qIGVudW0gZGV2aWNlX2VuZGlhbiB0
byBNZW1PcC4gICovDQo+PiAtc3RhdGljIGlubGluZSBNZW1PcCBkZXZlbmRfbWVtb3AoZW51
bSBkZXZpY2VfZW5kaWFuIGVuZCkNCj4+ICsvKiByZXR1cm5zIHRydWUgaWYgZW5kIGlzIGJp
ZyBlbmRpYW4uICovDQo+PiArc3RhdGljIGlubGluZSBib29sIGRldmVuZF9iaWdfZW5kaWFu
KGVudW0gZGV2aWNlX2VuZGlhbiBlbmQpDQo+PiAgICB7DQo+PiAgICAgICAgUUVNVV9CVUlM
RF9CVUdfT04oREVWSUNFX0hPU1RfRU5ESUFOICE9IERFVklDRV9MSVRUTEVfRU5ESUFOICYm
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgREVWSUNFX0hPU1RfRU5ESUFOICE9IERF
VklDRV9CSUdfRU5ESUFOKTsNCj4+ICAgIA0KPj4gLSAgICBib29sIGJpZ19lbmRpYW4gPSAo
ZW5kID09IERFVklDRV9OQVRJVkVfRU5ESUFODQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICA/IHRhcmdldF93b3Jkc19iaWdlbmRpYW4oKQ0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgOiBlbmQgPT0gREVWSUNFX0JJR19FTkRJQU4pOw0KPj4gLSAgICByZXR1cm4gYmlnX2Vu
ZGlhbiA/IE1PX0JFIDogTU9fTEU7DQo+PiArICAgIGlmIChlbmQgPT0gREVWSUNFX05BVElW
RV9FTkRJQU4pIHsNCj4+ICsgICAgICAgIHJldHVybiB0YXJnZXRfd29yZHNfYmlnZW5kaWFu
KCk7DQo+PiArICAgIH0NCj4+ICsgICAgcmV0dXJuIGVuZCA9PSBERVZJQ0VfQklHX0VORElB
TjsNCj4+ICt9DQo+PiArDQo+PiArLyogZW51bSBkZXZpY2VfZW5kaWFuIHRvIE1lbU9wLiAg
Ki8NCj4+ICtzdGF0aWMgaW5saW5lIE1lbU9wIGRldmVuZF9tZW1vcChlbnVtIGRldmljZV9l
bmRpYW4gZW5kKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIGRldmVuZF9iaWdfZW5kaWFuKGVu
ZCkgPyBNT19CRSA6IE1PX0xFOw0KPj4gICAgfQ0KPj4gICAgDQo+PiAgICAvKg0KPiANCg0K


