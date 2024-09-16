Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F0979D48
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799336.1209309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7Va-0007a2-Vo; Mon, 16 Sep 2024 08:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799336.1209309; Mon, 16 Sep 2024 08:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7Va-0007YJ-SO; Mon, 16 Sep 2024 08:54:58 +0000
Received: by outflank-mailman (input) for mailman id 799336;
 Mon, 16 Sep 2024 08:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CfyS=QO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sq7VZ-0007Y9-Uu
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:54:58 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590a3d39-7409-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 10:54:56 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so46632371fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 01:54:56 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d599a20sm7470851fa.125.2024.09.16.01.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 01:54:55 -0700 (PDT)
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
X-Inumbo-ID: 590a3d39-7409-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726476896; x=1727081696; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvLeCE28ltECQs+RVQPgT/TpLki4VIiGB+j2x270m70=;
        b=HlS5pBOBGTDgmvx4PiHuEW8lmZRrCQ3slbrbqILrg9fZScvih//S/FkltX6EZs38A8
         zS1uRw7soWVpFE+Tv9fPJDaVuWy1FbUncP/jOUD/j/kU9I49SscOD4PA5HdKsEMyx7Lf
         P3KBOSOtTaQTxJt+bBZlFwTx8nfvHA2XK4ewWfcBE5/OA8T8jMTlJMNMXsfg0vRR2gh5
         XJN55GkjsoymatIT3fR8s+3tqYP8baj8NvkPkqb8qiRZGevyV8LKMxz/tcydwSUx66cA
         nLeiJQJX3y/8gmYGoq/mUwxfHM5BBtZ0ovVUR8rL0VvQRib51uT+66yG4yNj5ofF8SSM
         8gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726476896; x=1727081696;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvLeCE28ltECQs+RVQPgT/TpLki4VIiGB+j2x270m70=;
        b=xUmnYxZFxMVV9FwWAG9G7N9ZamLohbD9N+3x2PomT94tsHClQf9fo11OC/eWLs6ivq
         xqqf7jsx5Hm19fdxcks2bz+gh7LyKieC0Z0IGywg5x1ICa2CD8XiDsjpW2621G+FMtvT
         fUpp1JHT9VQGOLWsVLcg6T32B1M1IKwbFbbWc7e2PibuBF0F5QCpX3VSOcixQy98J76y
         nFrMGH8DwktBU4q6V1WFswmK5EaKnTVAZa0Fqva/noFqCqecjA/dNmHfATbbH30AJBlx
         w7qa4AEbZ1OJPf+z39L4Bxz1oBdhtaBTcMif8iB6EPW5vXbC84c+W53RpICdZxiNhNmC
         pQKg==
X-Forwarded-Encrypted: i=1; AJvYcCXm1IxWP035zZYMbANKHxmFBjyUFekbXFjUYncLy9Lj5VZLo+CbVHdq6EBg9RZnCrUU5+UYXeoXdJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2IJqk1xgv3OTkj81juw6uHA6eaHuyZpVtDyRYZ8KztibQLHNx
	CH0mcRxt4DEmaTTOYhadhe8r5WWjJCLTNJnLe7IMJIyUKmyyUmgB
X-Google-Smtp-Source: AGHT+IGFu5oLTOGGxfKHloYSHhkdmKIdPmJR3Uyf5ER4fInhdn8zqSq3WH/l4BT2K2AVZh9ETEam7A==
X-Received: by 2002:a2e:f0a:0:b0:2f6:6576:ae6e with SMTP id 38308e7fff4ca-2f787ed9065mr59940341fa.21.1726476895371;
        Mon, 16 Sep 2024 01:54:55 -0700 (PDT)
Message-ID: <8a2ca782f0b059f58107a9545a63cce59a118a41.camel@gmail.com>
Subject: Re: [PATCH v7 2/8] xen/riscv: allow write_atomic() to work with
 non-scalar types
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 16 Sep 2024 10:54:54 +0200
In-Reply-To: <441d53b7-71ee-483c-8d46-b3f7efeda023@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <bf5c566bd4c2adf0518a9785627bdc5f12a7187b.1726242605.git.oleksii.kurochko@gmail.com>
	 <441d53b7-71ee-483c-8d46-b3f7efeda023@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

T24gTW9uLCAyMDI0LTA5LTE2IGF0IDA4OjI1ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxMy4wOS4yMDI0IDE3OjU3LCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gVXBkYXRlIHRo
ZSBkZWZpbnRpb24gb2Ygd3JpdGVfYXRvbWljKCkgdG8gc3VwcG9ydCBub24tc2NhbGFyIHR5cGVz
LAo+ID4gYWxpZ25pbmcgaXQgd2l0aCB0aGUgYmVoYXZpb3Igb2YgcmVhZF9hdG9taWMoKS4KPiAK
PiAiQWxpZ25pbmciIHdvdWxkIGltbyBpbXBseSB5ZXQgbW9yZSBzaW1pbGFyaXR5LiBUeXBlcyBh
cmUgZGlmZmVyZW50LAo+IG5hbWVzIGFyZSBkaWZmZXJlbnQuIEhvdyBhYm91dCAiYnJpbmdpbmcg
aXQgY2xvc2VyIHRvIj8KPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0
b21pYy5oCj4gPiArKysgYi94ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaAo+ID4g
QEAgLTY5LDEwICs2OSwxMSBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB2b2lkCj4gPiBfd3JpdGVf
YXRvbWljKHZvbGF0aWxlIHZvaWQgKnAsCj4gPiDCoMKgwqDCoCB9Cj4gPiDCoH0KPiA+IMKgCj4g
PiAtI2RlZmluZSB3cml0ZV9hdG9taWMocCwgeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+IC0oe8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gLcKgwqDCoCB0eXBlb2YoKihw
KSkgeF8gPSAoeCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4gPiAtwqDCoMKgIF93cml0ZV9hdG9taWMocCwgeF8sIHNpemVvZigq
KHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gKyNkZWZpbmUgd3Jp
dGVfYXRvbWljKHAsCj4gPiB4KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4g
PiArKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIHVuaW9uIHsg
dHlwZW9mKCoocCkpIHY7IHVuc2lnbmVkIGxvbmcgdl91bDsgfSB4XyA9IHsgLnZfdWwgPQo+ID4g
MFVMIH07IFwKPiA+ICvCoMKgwqAgeF8udiA9Cj4gPiAoeCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArwqDCoMKgIF93cml0ZV9h
dG9taWMocCwgeF8udl91bCwKPiA+IHNpemVvZigqKHApKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiAKPiB2X3VsIGlzIGFuIG9kZCBu
YW1lIGZvciBteSB0YXN0ZS4gV2h5IG5vdCBqdXN0IHVsLCB3aGljaCBpcyBjbG9zZXIgdG8KPiBy
ZWFkX2F0b21pYygpJ3MgYz8gUHJlZmVyYWJseSB3aXRoIHRoZSBhZGp1c3RtZW50cyAod2hpY2gg
SSBndWVzcwo+IGNvdWxkCj4gYmUgZG9uZSB3aGlsZSBjb21taXR0aW5nLCBzbyBsb25nIGFzIHlv
dSBhZ3JlZSkKSSB3aWxsIGJlIGhhcHB5IHdpdGggdGhhdC4KCj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KVGhhbmtzLgoKfiBPbGVrc2lpCg==


