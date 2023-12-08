Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CC809FB9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650497.1016094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXO2-00045i-8i; Fri, 08 Dec 2023 09:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650497.1016094; Fri, 08 Dec 2023 09:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXO2-00043h-4J; Fri, 08 Dec 2023 09:43:10 +0000
Received: by outflank-mailman (input) for mailman id 650497;
 Fri, 08 Dec 2023 09:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXO0-000425-8r
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:43:08 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302c6991-95ae-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:43:06 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so247145266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:43:06 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b00a1de512fa1fsm777782ejb.186.2023.12.08.01.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:43:05 -0800 (PST)
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
X-Inumbo-ID: 302c6991-95ae-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702028585; x=1702633385; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TBFXRlxfSFsiVB4InwckoGKMhnTBJztIMhK2AdvjcPk=;
        b=W1sglXZIcftf7/Huf0SZu+1GLFIBd/4M1JU39lkKjp1yFxwKoL+itFOnsZEXJHe7jh
         3F9+xzDLih+xlFEL/fhsoS8Kykb8IPAj6ctaD+P/egY14WW7LKINLEPrvBjGbmPjHi2/
         Pvm8iVjfG4Mb1xfrEMRVsxfsiVtXvILjtvnpI70Yjhl7LCyI4llWeFPG+vcA3J+a5Zrc
         L9V91swL2QeXLQaIxWQrwJ91oLxpFBTwN5o7XZnZ/ql6bLKGBzz8QBUS5DO903g4UTIY
         tIra8DOqOWiGvAncJ9TPv3R4j8Q2EsjOqLyGC/zjadqTX+EIeHXDXTgOeB7OuTI9AbNH
         LQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702028585; x=1702633385;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBFXRlxfSFsiVB4InwckoGKMhnTBJztIMhK2AdvjcPk=;
        b=sKv3iC+zD9k0NqSZt9t+BFUKPXuEd/49fAIJoUTK9qlRo0lWnorVnAbLWL2BNVFpda
         h2RRhuU42PyqHVNDahuzehBzQ+GeeHUCIf3r8uPrx4DXJWDuyOmPVM1AROe/wsl9E1Hp
         b8XCZjlQlAUlp4zRNkV0VES874HUV5RPNmZ5nUSf/YRPeMG2SOp+i4Cjr+ikz5RNhNbm
         hB27V/OQ6cVLcXrUT1HNQ0Uc37Y0nlUDGzerDseENBjfK3oaGx0riV3/Qv98j2hUFcKZ
         2c4f6qHwwN9qHbRFTkVFB7VsbuYDZUGsMSJyVyndwhrJiKBJcP2KHY0XnVC3jQ4V7e/r
         SK4g==
X-Gm-Message-State: AOJu0YyRrh9CQ4MbCzjC6+GyXFgN4V23frtX73ZCdVvbN1w7dRo9/zNt
	KRLJyM+eM9vpWKDqsq4XLIQ=
X-Google-Smtp-Source: AGHT+IHidMwjq4Cq8VSiW0Xit4XIZTett3Z+TIjPLsLi/YhYf2dXwz1EWIjk3+J/EBhsEUK5Yx4NEw==
X-Received: by 2002:a17:906:16c4:b0:a0d:38b0:7286 with SMTP id t4-20020a17090616c400b00a0d38b07286mr2103577ejd.69.1702028585533;
        Fri, 08 Dec 2023 01:43:05 -0800 (PST)
Message-ID: <69be4bce2a1a87bb4ed6c73a388d637fb233222a.camel@gmail.com>
Subject: Re: [PATCH v2 13/39] xen/riscv: introduce asm/system.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:43:04 +0200
In-Reply-To: <671d903b-8135-4b30-a197-36bffed180da@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <3007fb3d841dbaa078bb5b7af699c883356badca.1700761381.git.oleksii.kurochko@gmail.com>
	 <671d903b-8135-4b30-a197-36bffed180da@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

T24gVGh1LCAyMDIzLTEyLTA3IGF0IDE2OjA3ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAyNC4xMS4yMDIzIDExOjMwLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOgo+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzdGVtLmgKPiA+IEBA
IC0wLDAgKzEsNzkgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAq
Lwo+ID4gKwo+ID4gKyNpZm5kZWYgX0FTTV9SSVNDVl9CQVJSSUVSX0gKPiA+ICsjZGVmaW5lIF9B
U01fUklTQ1ZfQkFSUklFUl9ICj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9jc3IuaD4KPiA+ICsK
PiA+ICsjaWZuZGVmIF9fQVNTRU1CTFlfXwo+ID4gKwo+ID4gKyNkZWZpbmUgUklTQ1ZfRkVOQ0Uo
cCwgcykgXAo+ID4gK8KgwqDCoCBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImZlbmNlICIgI3AgIiwi
ICNzIDogOiA6ICJtZW1vcnkiKQo+IAo+IE5pdCAoc3R5bGUpOiBNaXNzaW5nIGJsYW5rcyBpbW1l
ZGlhdGVseSBpbnNpZGUgdGhlIHBhcmVudGhlc2VzLgpUaGFua3MgZm9yIHRoZSBjb21tZW50LiBJ
J2xsIHVwZGF0ZSBjb2RlIHN0eWxlLgoKPiAKPiA+ICsvKiBUaGVzZSBiYXJyaWVycyBuZWVkIHRv
IGVuZm9yY2Ugb3JkZXJpbmcgb24gYm90aCBkZXZpY2VzIG9yCj4gPiBtZW1vcnkuICovCj4gPiAr
I2RlZmluZSBtYigpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUklTQ1Zf
RkVOQ0UoaW9ydyxpb3J3KQo+ID4gKyNkZWZpbmUgcm1iKCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgUklTQ1ZfRkVOQ0UoaXIsaXIpCj4gPiArI2RlZmluZSB3bWIoKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSSVNDVl9GRU5DRShvdyxvdykKPiAKPiBO
aXQgKHN0eWxlKTogTWlzc2luZyBibGFua3MgYWZ0ZXIgdGhlIGNvbW1hcyAoYWxzbyBhZ2FpbiBi
ZWxvdykuClRoYW5rcyBmb3IgdGhlIGNvbW1lbnQuIEknbGwgdXBkYXRlIGNvZGUgc3R5bGUuCgo+
IAo+ID4gKy8qIFRoZXNlIGJhcnJpZXJzIGRvIG5vdCBuZWVkIHRvIGVuZm9yY2Ugb3JkZXJpbmcg
b24gZGV2aWNlcywganVzdAo+ID4gbWVtb3J5LiAqLwo+ID4gKyNkZWZpbmUgc21wX21iKCnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUklTQ1ZfRkVOQ0UocncscncpCj4gPiArI2RlZmlu
ZSBzbXBfcm1iKCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0ZFTkNFKHIscikK
PiA+ICsjZGVmaW5lIHNtcF93bWIoKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUklTQ1Zf
RkVOQ0Uodyx3KQo+ID4gKyNkZWZpbmUgc21wX21iX19iZWZvcmVfYXRvbWljKCkgc21wX21iKCkK
PiA+ICsjZGVmaW5lIHNtcF9tYl9fYWZ0ZXJfYXRvbWljKCnCoCBzbXBfbWIoKQo+ID4gKwo+ID4g
Ky8qCj4gPiArI2RlZmluZSBfX3NtcF9zdG9yZV9yZWxlYXNlKHAsIHYpwqDCoMKgwqDCoMKgIFwK
PiAKPiBJcyB0aGVyZSBhIG5lZWQgZm9yIHRoZSBkb3VibGUgdW5kZXJzY29yZXMgaGVyZT8gV2Ug
dHJ5IHRvIG5vdAo+IGludHJvZHVjZSBuZXcgaW5zdGFuY2VzIG9mIHVuZHVlIGxlYWRpbmcgdW5k
ZXJzY29yZXMsIGJ1dCB0aGVyZSBtaWdodAo+IGJlIGUuZy4gYSBzdHJvbmcgZGVzaXJlIHRvIHN0
YXkgaW4gc3luYyB3aXRoLCBzYXksIExpbnV4LgpJIGRvbid0IGhhdmUgc3VjaCBhIHN0cm9uZyBk
ZXNpcmUgdG8gYmUgaW4gc3luYyB3aXRoIExpbnV4IHNvIGxldCdzCnN0aWNrIHRvIFhlbiBjb2Rl
IHN0eWxlLiBJJ2xsIHVwZGF0ZSB0aGlzIHBsYWNlIGluIG5leHQgcGF0Y2ggdmVyc2lvbi4KCj4g
Cj4gPiArZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ID4gKwljb21waWxldGltZV9hc3NlcnRfYXRvbWlj
X3R5cGUoKnApOyBcCj4gPiArCVJJU0NWX0ZFTkNFKHJ3LHcpO8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+ID4gKwlXUklURV9PTkNFKCpwLCB2KTvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPiAKPiBOaXQ6IENhbiB0aGUgdHJhaWxpbmcgYmFja3NsYXNo
ZXMgYmUgYWxpZ25lZCwgcGxlYXNlPwpTdXJlLiBJJ2xsIGFsaWduZWQgdGhlbS4gVGhhbmtzLgo+
IAo+ID4gK30gd2hpbGUgKDApCj4gPiArCj4gPiArI2RlZmluZSBfX3NtcF9sb2FkX2FjcXVpcmUo
cCnCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiArKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gPiAr
wqDCoMKgIHR5cGVvZigqcCkgX19fcDEgPSBSRUFEX09OQ0UoKnApO8KgwqAgXAo+IAo+IEhtbSwg
eWV0IG1vcmUgbGVhZGluZyB1bmRlcnNjb3JlcywgYW5kIGhlcmUgc3VyZWx5IG5vdCBuZWVkZWQu
CkknbGwgdXBkYXRlIHRoZSBjb2RlIGFjY29yZGluZyB0byB5b3VyIHJlY29tbWVuZGF0aW9uLiBU
aGFua3MuCgo+IAo+ID4gK8KgwqDCoCBjb21waWxldGltZV9hc3NlcnRfYXRvbWljX3R5cGUoKnAp
OyBcCj4gPiArwqDCoMKgIFJJU0NWX0ZFTkNFKHIscncpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+ID4gK8KgwqDCoCBfX19wMTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICt9KQo+ID4gKyovCj4gPiAr
Cj4gPiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGxvY2FsX3NhdmVfZmxhZ3Modm9pZCkK
PiA+ICt7Cj4gPiArwqDCoMKgIHJldHVybiBjc3JfcmVhZChzc3RhdHVzKTsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2lycV9lbmFibGUodm9pZCkKPiA+ICt7Cj4g
PiArwqDCoMKgIGNzcl9zZXQoc3N0YXR1cywgU1NUQVRVU19TSUUpOwo+ID4gK30KPiA+ICsKPiA+
ICtzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfaXJxX2Rpc2FibGUodm9pZCkKPiA+ICt7Cj4gPiAr
wqDCoMKgIGNzcl9jbGVhcihzc3RhdHVzLCBTU1RBVFVTX1NJRSk7Cj4gPiArfQo+ID4gKwo+ID4g
KyNkZWZpbmUgbG9jYWxfaXJxX3NhdmUoeCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiA+ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPiA+ICvCoMKgwqAgeCA9IGNzcl9yZWFkX2NsZWFyKENTUl9TU1RB
VFVTLCBTU1RBVFVTX1NJRSk7wqDCoCBcCj4gPiArwqDCoMKgIGxvY2FsX2lycV9kaXNhYmxlKCk7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
PiA+ICt9KQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9pcnFfcmVzdG9yZSh1
bnNpZ25lZCBsb25nIGZsYWdzKQo+ID4gK3sKPiA+ICsJY3NyX3NldChDU1JfU1NUQVRVUywgZmxh
Z3MgJiBTU1RBVFVTX1NJRSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGxv
Y2FsX2lycV9pc19lbmFibGVkKHZvaWQpCj4gPiArewo+ID4gK8KgwqDCoCB1bnNpZ25lZCBsb25n
IGZsYWdzID0gbG9jYWxfc2F2ZV9mbGFncygpOwo+ID4gKwo+ID4gK8KgwqDCoCByZXR1cm4gZmxh
Z3MgJiBTU1RBVFVTX1NJRTsKPiAKPiBTU1RBVFVTX1NJRSBkb2Vzbid0IGV2ZW4gaGFwcGVuIHRv
IGJlIDEsIHNvIEkgdGhpbmsgeW91J3JlIGJldHRlciBvZmYKPiBhZGRpbmcgIT0gMCwgdW5sZXNz
IHlvdSB3b3VsZCBkbyBhcyBJIHRoaW5rIEkgaGFkIHN1Z2dlc3RlZCBiZWZvcmUKPiBhbmQKPiBo
YXZlIHRoZSBmdW5jdGlvbiByZXR1cm4gYm9vbCByaWdodCBhd2F5LgpJdCBtYWtlcyBzZW5zZS4g
SSdsbCBhcHBseSB5b3VyIHJlY29tbWVuZGF0aW9ucyBpbiB0aGUgbmV4dCBwYXRjaAp2ZXJzaW9u
LgoKfiBPbGVrc2lpCgo=


