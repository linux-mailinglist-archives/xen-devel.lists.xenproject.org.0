Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5AA5C602
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908324.1315459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1P2-00019X-2V; Tue, 11 Mar 2025 15:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908324.1315459; Tue, 11 Mar 2025 15:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1P1-00016o-VC; Tue, 11 Mar 2025 15:20:19 +0000
Received: by outflank-mailman (input) for mailman id 908324;
 Tue, 11 Mar 2025 15:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1P0-00016i-BZ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:20:18 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54e082a7-fe8c-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:20:15 +0100 (CET)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff80290e44so9174098a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:20:15 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff53eda418sm11565063a91.45.2025.03.11.08.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:20:13 -0700 (PDT)
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
X-Inumbo-ID: 54e082a7-fe8c-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741706414; x=1742311214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ1DlCBUIbAraI/JTg1m2qqamEpgEFznt1TObYD6Os0=;
        b=bVEH06M6bNQDiS2U+ZGR4FHli+h9htWlMvk5qEIGD0ah8tmy792LmF0PivfHwosWu7
         sRLeRvi/jUSy8uH1wEZtasAE6d/KwKcywhaADK9Gx004jYmQRxDedaVvF4ONNy95aDm/
         h0mW2hodynw4+DMu8+vSW/iKFtK7YbFTuv60JC0M+sC+dtKu75nxtuyd8BGcVvasKYkl
         Tk9jq9XlNyqHLRwZ+vV/hOK4vD/4gbM5kPNqvyqoCMhHMZRKl2Npn9+LiIMgOrWtaLDj
         ukJkzIAC5NV2Mtzr3nC/HHXFtsQueuKJnEPyAOUnJB/Kjlbm4aUVblQa3b/TV+WJZ92C
         CemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706414; x=1742311214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ1DlCBUIbAraI/JTg1m2qqamEpgEFznt1TObYD6Os0=;
        b=SkiOJNlD2i8xnbz6X9RBeoV/PjJxV2nAPIFwL1v3WVF2FL9YFBUM2kseHCa6WuXVSR
         C85+a95whYvi3YmvcO13uHVoFEO969o3D0WqgqkJsdoCy+9UAjRj4l/4g541wrFvpolc
         AQcnYSA8p8wqfEk3wsFoLdzgF8B/pGmN9OIdAoOGFvchYr615owS2BV3FmgRuV22XZ7D
         MFp98fTKc8GFWLaBlZCzRWra1H9xHWneVipD7CN1ydp9uLSdWdO3Fzw+Zn0iVAKPHdCI
         Nh/5duG1PSlDKukNR2l04ODBA+eGZbUJFYVCTsFCMmURpPrno9G5lPAM6Jz1XIuo8oqp
         kxag==
X-Forwarded-Encrypted: i=1; AJvYcCUSE56gRkJVh19XFpwiLU1+W0pEiIpyV3cl718HDjD+nnSqCke5+FsVB82paas+U+8ZHbyWFrLmSVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywj2kEi+Lqf5xh+Df/X9xAPcZUmSfT1YoeL0uVWRvlxefpRuudL
	5xTYN88jZVnbLWj6/UEgrx6agCrv75zBWGEvWCF3WCz+VRqskT3C4OeUL5ULaTw=
X-Gm-Gg: ASbGncv8L7Gdrlpn1zqLbA6KBD1WSgys+8Qnz5riB4ivA59PZ3M07yHpmQ0z72YC5yR
	cVW5v4g4tcAFrJJuUV1W/6adnOGhNOro8ZKq2P44fUjzt2mu5IUBzGap1W1ytIiFc823eSAPttC
	CJIDWsAsOpUfgHe8AHVqV/yuY7KEB1NzG4+b5fmvCy+nUnLLvxPEHrfsDtl2Exy3/AH9t1uimpN
	n7fOOx64Uwdk085H8ZFrHV5VmPrNSw0QRI35mI7UFEEQFRfqa4VVS2lH9oikDu2IWhncrEbU4yw
	7aRQizKZCX87E1+Zn9tlCPwJJUUq57OuxHg+7z0Hx+7HdzvnE/QbMRIejA==
X-Google-Smtp-Source: AGHT+IHB6/PW0IHKkK7wGI9UOrKJJD3Du6pkJ5/gnIg+/UfsjtLDQjkMRqgvo/n5/5r2fsfdUad9Yg==
X-Received: by 2002:a17:90b:2883:b0:2ff:52e1:c4a1 with SMTP id 98e67ed59e1d1-2ff7cf128acmr27929118a91.24.1741706413718;
        Tue, 11 Mar 2025 08:20:13 -0700 (PDT)
Message-ID: <42184de6-5484-4e5a-b502-48db0e6d2cf5@linaro.org>
Date: Tue, 11 Mar 2025 08:20:12 -0700
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
b2xzIGluDQo+IG15IHBhdGNoIHdvcmtmbG93Lg0KPiANCj4gT25seSB1c2VkIGluIHN5c3Rl
bS97bWVtb3J5LHBoeXNtZW19LmMsIHdvcnRoIG1vdmUgdG8gYSBsb2NhbA0KPiBzeXN0ZW0v
bWVtb3J5LWludGVybmFsLmggaGVhZGVyPyBPciBldmVuIHNpbXBsZXIsIG1vdmUNCj4gaW5j
bHVkZS9leGVjL21lbW9yeS1pbnRlcm5hbC5oIC0+IGV4ZWMvbWVtb3J5LWludGVybmFsLmgg
Zmlyc3QuDQo+IA0KDQpHb29kIHBvaW50LCBJJ2xsIG1vdmUgdGhlbSB0byB0aGUgZXhpc3Rp
bmcgZXhlYy9tZW1vcnktaW50ZXJuYWwuaCBpbiBhbiANCmFkZGl0aW9uYWwgY29tbWl0Lg0K
DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVy
QGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCB8IDE4
ICsrKysrKysrKysrKy0tLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhl
Yy9tZW1vcnkuaCBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaA0KPj4gaW5kZXggNjBjMGZiNmNj
ZDQuLjU3NjYxMjgzNjg0IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9leGVjL21lbW9yeS5o
DQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgNCj4+IEBAIC0zMTM4LDE2ICszMTM4
LDIyIEBAIGFkZHJlc3Nfc3BhY2Vfd3JpdGVfY2FjaGVkKE1lbW9yeVJlZ2lvbkNhY2hlICpj
YWNoZSwgaHdhZGRyIGFkZHIsDQo+PiAgICBNZW1UeFJlc3VsdCBhZGRyZXNzX3NwYWNlX3Nl
dChBZGRyZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ4X3QgYywgaHdhZGRyIGxlbiwgTWVtVHhBdHRycyBhdHRy
cyk7DQo+PiAgICANCj4+IC0vKiBlbnVtIGRldmljZV9lbmRpYW4gdG8gTWVtT3AuICAqLw0K
Pj4gLXN0YXRpYyBpbmxpbmUgTWVtT3AgZGV2ZW5kX21lbW9wKGVudW0gZGV2aWNlX2VuZGlh
biBlbmQpDQo+PiArLyogcmV0dXJucyB0cnVlIGlmIGVuZCBpcyBiaWcgZW5kaWFuLiAqLw0K
Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBkZXZlbmRfYmlnX2VuZGlhbihlbnVtIGRldmljZV9l
bmRpYW4gZW5kKQ0KPj4gICAgew0KPj4gICAgICAgIFFFTVVfQlVJTERfQlVHX09OKERFVklD
RV9IT1NUX0VORElBTiAhPSBERVZJQ0VfTElUVExFX0VORElBTiAmJg0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIERFVklDRV9IT1NUX0VORElBTiAhPSBERVZJQ0VfQklHX0VORElB
Tik7DQo+PiAgICANCj4+IC0gICAgYm9vbCBiaWdfZW5kaWFuID0gKGVuZCA9PSBERVZJQ0Vf
TkFUSVZFX0VORElBTg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgPyB0YXJnZXRfd29y
ZHNfYmlnZW5kaWFuKCkNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIDogZW5kID09IERF
VklDRV9CSUdfRU5ESUFOKTsNCj4+IC0gICAgcmV0dXJuIGJpZ19lbmRpYW4gPyBNT19CRSA6
IE1PX0xFOw0KPj4gKyAgICBpZiAoZW5kID09IERFVklDRV9OQVRJVkVfRU5ESUFOKSB7DQo+
PiArICAgICAgICByZXR1cm4gdGFyZ2V0X3dvcmRzX2JpZ2VuZGlhbigpOw0KPj4gKyAgICB9
DQo+PiArICAgIHJldHVybiBlbmQgPT0gREVWSUNFX0JJR19FTkRJQU47DQo+PiArfQ0KPj4g
Kw0KPj4gKy8qIGVudW0gZGV2aWNlX2VuZGlhbiB0byBNZW1PcC4gICovDQo+PiArc3RhdGlj
IGlubGluZSBNZW1PcCBkZXZlbmRfbWVtb3AoZW51bSBkZXZpY2VfZW5kaWFuIGVuZCkNCj4+
ICt7DQo+PiArICAgIHJldHVybiBkZXZlbmRfYmlnX2VuZGlhbihlbmQpID8gTU9fQkUgOiBN
T19MRTsNCj4+ICAgIH0NCj4+ICAgIA0KPj4gICAgLyoNCj4gDQo=

