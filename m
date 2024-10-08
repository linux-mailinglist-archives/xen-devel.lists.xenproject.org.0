Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B107995366
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813244.1226090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syC8U-0005SY-AR; Tue, 08 Oct 2024 15:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813244.1226090; Tue, 08 Oct 2024 15:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syC8U-0005Q0-71; Tue, 08 Oct 2024 15:28:30 +0000
Received: by outflank-mailman (input) for mailman id 813244;
 Tue, 08 Oct 2024 15:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syC8T-0005Pu-1Q
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:28:29 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77d0f7b-8589-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 17:28:28 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5398939d29eso7127937e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:28:28 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff233a0sm1223916e87.199.2024.10.08.08.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 08:28:27 -0700 (PDT)
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
X-Inumbo-ID: f77d0f7b-8589-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728401308; x=1729006108; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+0QgJr4CAoh+r2Aye/Kcb7f5/wbnuGkuXv0LfoUMzA=;
        b=boXtW3sKaSRASpjhNQ0nvTg+Ql8iyY/HxqzRx21Jyox6fiSL73LjJJCypLL2J9kROb
         raq4V4zCqAalBqHmG0P0k7wG9b0Ndw6SlYg2LOr2IbVgGFp1pehulHzGK1NftFU/4ZWo
         H+gqr4tI2sluC0Uzo9uT0tN5Rh9TndBL3d0xLWkamyZFwJ3e3wTjr3XyGJGqgVuk5ipN
         3MdN14Szb3Kk6L7ypKlpJENH6dqbicPfmlmV+up9zV1/wgtFgmGM8AAqFwfVtjWz8Ke6
         XgF5wk8nNFEA2a+K0O9ZkKxt9oeTYzISbDh30+rW4Ltgvp2kTZWIt+xTJxmUcXMMTWlQ
         KCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401308; x=1729006108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+0QgJr4CAoh+r2Aye/Kcb7f5/wbnuGkuXv0LfoUMzA=;
        b=SyKvp1GFehJQrkRh/9YV3P7aZLFlf+0cO3vshG7MCCcQb31ZlM446o6trc9Y9p/CZy
         S5hDUitv+/uJSGdjw3oNtpOTeQRZPlTfSWDcCUtc/sFExE2lI6+IE6PfBcdOLeWnH73l
         LuMdAhJwI3uY9xgUlP6bov4IrkR9i5lidpJgQAI0cdkXeDbHkPxHB/Dlxtgspe6X1vkP
         y82W3PFMdwwmzB6j6IMVOQZQgCobacYIGYNrqz6q1dtCF3euI8OmQtj8ky8EpN1WdDoX
         jHer65Ut3x/T5t7TAo7ghDEbdydpnPzefe/XJMASZJABzoEYhPYPtAno4qhZLU6wowyB
         kjDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtERf2lhZmEJICYNs5Fhd/6sqiavDSVq3Xy8vqTDbQtCfPHfQIQF9XgRzo8E/cduIWiAhNOLZQeu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk7y4/VH0nhdMDXv1bSl77gQEe7tUqtXR490iuddZz/I1Mbc9w
	fRI7vqWljqlgpKoRw6JwGclAmZ+CTVTcj0EIdl0zknQZOzj8Oj5h
X-Google-Smtp-Source: AGHT+IGqrCB69/cN/2ne/yc+LB74SI1R5+qU+Jt3woNSn40sE1XtbqV4FR9+ffqk1OuzRp23kg5weA==
X-Received: by 2002:a05:6512:239c:b0:536:5625:511a with SMTP id 2adb3069b0e04-539ab8adc1emr7175470e87.47.1728401307331;
        Tue, 08 Oct 2024 08:28:27 -0700 (PDT)
Message-ID: <c11cbcc557ce4a33c14f721e9a9e7305ba7c9231.camel@gmail.com>
Subject: Re: [PATCH v3 15/19] xen: Update header guards - RISC-V
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio
 <frediano.ziglio@cloud.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Tue, 08 Oct 2024 17:28:26 +0200
In-Reply-To: <3ba27327-a2f1-4544-8437-678ba01f7c4d@suse.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
	 <20241004081713.749031-16-frediano.ziglio@cloud.com>
	 <3ba27327-a2f1-4544-8437-678ba01f7c4d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDE2OjM0ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAwNC4xMC4yMDI0IDEwOjE3LCBGcmVkaWFubyBaaWdsaW8gd3JvdGU6Cj4gPiBVcGRhdGVkIGhl
YWRlcnMgcmVsYXRlZCB0byBSSVNDLVYuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZyZWRpYW5v
IFppZ2xpbyA8ZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+ID4gLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FjcGkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKg
eGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
NiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmjCoMKgwqDC
oMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0
b3BzLmjCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYnVnLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVu
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYnl0ZW9yZGVyLmjCoMKgwqDCoMKgIHwgNiArKystLS0K
PiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGUuaMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaMKg
wqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y29uZmlnLmjCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5owqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4ZW4vYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0t
LQo+ID4gwqB4ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jdXJyZW50LmjCoMKgwqDCoMKgwqDC
oCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2RvbWFpbi5owqDC
oMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Vhcmx5X3ByaW50ay5owqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2V2ZW50LmjCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4ZW4vYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9mZW5jZS5owqDCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0K
PiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZml4bWFwLmjCoMKgwqDCoMKgwqDCoMKg
IHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZmx1c2h0bGIuaMKg
wqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2d1
ZXN0X2FjY2Vzcy5owqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2d1ZXN0X2F0b21pY3MuaMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaW8uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhl
bi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYg
KysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tLmjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9t
b25pdG9yLmjCoMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL25vc3BlYy5owqDCoMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3AybS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYgKysr
LS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UtYml0cy5owqDCoMKgwqDC
oCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcG1hcC5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4ZW4vYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaMKgwqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4
ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yZWdzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYg
KysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Jpc2N2X2VuY29kaW5nLmgg
fCA0ICsrLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2V0dXAuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDYgKysrLS0tCj4gPiDCoHhlbi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NtcC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgKystLQo+ID4gwqB4
ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5owqDCoMKgwqDCoMKgIHwgNiArKyst
LS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmjCoMKgwqDCoMKgwqDC
oMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzdGVtLmjC
oMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGltZS5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQo+ID4gwqB4ZW4vYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90cmFwcy5owqDCoMKgwqDCoMKgwqDCoMKgIHwgNiArKystLS0KPiA+
IMKgeGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDYgKysrLS0tCj4gPiDCoDQxIGZpbGVzIGNoYW5nZWQsIDEyMSBpbnNlcnRpb25zKCspLCAxMjEg
ZGVsZXRpb25zKC0pCj4gCj4gRm9yIHRoZSBidWxrIG9mIHRoZSBjaGFuZ2VzIHlvdSBkaWRuJ3Qg
Q2MgYW55b25lIHdobyBjYW4gYWNrIHRoZW0uCj4gTm90ZSB0aGF0Cj4gdGhlIFJJU0NWIHNlY3Rp
b24gb2YgLi9NQUlOVEFJTkVSUyBwcmVzZW50bHkgaGFzIG9ubHkgUjogZW50cmllcy4gWW91Cj4g
bmVlZAo+IHRvIENjIFRIRSBSRVNUIGluIHN1Y2ggYSBjYXNlLgo+IAo+IEl0IGlzIHByb2JhYmx5
IGFsc28gYSBnb29kIGlkZWEgdG8gQ2MgdGhlIHBlcnNvbihzKSBkb2luZyB0aGUgYnVsayBvZgo+
IHRoZQo+IHdvcmsgaW4gYSBnaXZlbiBhcmVhIGF0IGEgZ2l2ZW4gcG9pbnQgaW4gdGltZS4gVGhl
biBhZ2FpbiwgT2xla3NpaSwKPiBtYXliZQo+IHlvdSB3YW50IHRvIGNvbnNpZGVyIGFkZGluZyB5
b3Vyc2VsZiBhcyBSOiBpbiB0aGF0IHNlY3Rpb24sIHRvbz8gVGhhdAo+IHdheQo+IHlvdSB3aWxs
IGJlIENjLWVkIG9uIHBhdGNoZXMgKGFzIGxvbmcgYXMgcGVvcGxlIHJlc3BlY3QKPiAuL01BSU5U
QUlORVJTKS4KU3VyZSwgSSB3aWxsIHNlbmQgYSBwYXRjaCB3aXRoIGFkZGluZyBteXNlbGYgYXMg
UjogZm9yIFJJU0MtViBpbgpNQUlOVEFJTkVSUyBmaWxlLgoKfiBPbGVrc2lpCg==


