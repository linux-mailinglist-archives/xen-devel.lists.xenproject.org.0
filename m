Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8E939E52
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762943.1173182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCGB-0004dl-7I; Tue, 23 Jul 2024 09:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762943.1173182; Tue, 23 Jul 2024 09:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCGB-0004bJ-44; Tue, 23 Jul 2024 09:56:43 +0000
Received: by outflank-mailman (input) for mailman id 762943;
 Tue, 23 Jul 2024 09:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWCG9-0004Zz-9m
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:56:41 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dad8c71b-48d9-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:56:39 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a88be88a3aso1948692a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:56:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm7255758a12.27.2024.07.23.02.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 02:56:38 -0700 (PDT)
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
X-Inumbo-ID: dad8c71b-48d9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721728599; x=1722333399; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPjq/0Ae7menY2n7fzEAajEy8OOwH/UzGbAMjQ7op6A=;
        b=fklYcF+FWaeBjjRIP0G4gexznvjUH297V+sFzxXtcJ2pncy6Vo3YK97+km5F0FuwmZ
         JlmIx+dTGNDPyD2K5j461aoUUNIxh/SYKdigEQpJiIAKtMmNQnxdV8a6xoD7GQy1sZ1J
         SVXStkkRbD+FtyTEPWndgiPPUNQEmUSQ7pvWToPzQ+7ieV3SakydXLNQSHW4JjiTmODh
         yg/5ME4kNcHhDvXOYxWkLHvXAii6YaJNr2Xu5hA6eR8MSBNzphnhTqXu7VusqXZ0wPMy
         Reg4EHGOCnN3qBoMHMUvp67Qz01+DDx/sNZrnodjBE2qsy2XZunBBv0Y6vRS2ZtNKoll
         3i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728599; x=1722333399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPjq/0Ae7menY2n7fzEAajEy8OOwH/UzGbAMjQ7op6A=;
        b=S4gMR13jy+xGGP4MEPJ7Rw4eYkLBGfAI4rRqRiO8nznZBuChsdAZD8rtEFGJXOuBHo
         GqWjhnHpGLnBzn+nIM9sK/HvrJIFDx9MUmhIY2EOu7W9BUYjKNAO5+JlJu862SWp7bjm
         dF2qNZrazVEpR7vnfp5KE6PqPDQJ9JlhcWJ2gW44Qki/0kspq2UbaKoo846+YPhjhU+E
         tnRUVcB3l9QzWFdFKWr+2+JBFY3HWQNiIQnbSETOCfwXPEcvfAJVd2mtVmwg9i9j3Pa4
         FIwpJFMTAzDmcRsRF80APd4joYYTcL6SJM1+GBIBZnlCCu0NkjAce6YxrR/Lo5F6Nj3C
         jRnw==
X-Forwarded-Encrypted: i=1; AJvYcCWmhLDtLzTEnVZ7FvNpcUDO/FM1JDDoYo2Y705/QwuaSLjZeN+HDI/OHIk7G/kIZfJSAUkJxhicCACSKY4WhkR4PYrAziFqrycmkaBT1e0=
X-Gm-Message-State: AOJu0YyVUJqIYQGtuUtCItb0NZOCgRNdX+oDsNNvCnoRhcyAllunkF3y
	a+zl4y21nL1RZq9XXKp2rVPR6OhkYFoTzsARPFIfGiSemnsa7+A0
X-Google-Smtp-Source: AGHT+IG8J47QLKlCu7MsaXfk1C2J2p6R2mlNreCOcJ3cZicgGVa9iZSik8UE7UfNCln/fXMyo180xg==
X-Received: by 2002:a05:6402:2682:b0:5a3:d140:1a46 with SMTP id 4fb4d7f45d1cf-5a479b6e59emr6905021a12.23.1721728598540;
        Tue, 23 Jul 2024 02:56:38 -0700 (PDT)
Message-ID: <d5b315641064cb66efaafe972f2a08ee9f2a0a58.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
From: oleksii.kurochko@gmail.com
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Date: Tue, 23 Jul 2024 11:56:37 +0200
In-Reply-To: <20240723093117.99487-1-roger.pau@citrix.com>
References: <20240723093117.99487-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTA3LTIzIGF0IDExOjMxICswMjAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gWWV0IGFub3RoZXIgY2xhbmcgY29kZSBnZW5lcmF0aW9uIGlzc3VlIHdoZW4gdXNpbmcgYWx0
Y2FsbHMuCj4gCj4gVGhlIGlzc3VlIHRoaXMgdGltZSBpcyB3aXRoIHVzaW5nIGxvb3AgY29uc3Ry
dWN0cyBhcm91bmQKPiBhbHRlcm5hdGl2ZV97LHZ9Y2FsbAo+IGluc3RhbmNlcyB1c2luZyBwYXJh
bWV0ZXIgdHlwZXMgc21hbGxlciB0aGFuIHRoZSByZWdpc3RlciBzaXplLgo+IAo+IEdpdmVuIHRo
ZSBmb2xsb3dpbmcgZXhhbXBsZSBjb2RlOgo+IAo+IHN0YXRpYyB2b2lkIGJhcihib29sIGIpCj4g
ewo+IMKgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPiAKPiDCoMKgwqAgZm9yICggaSA9IDA7IGkgPCAx
MDsgaSsrICkKPiDCoMKgwqAgewo+IMKgwqDCoMKgwqDCoMKgIGludCByZXRfOwo+IMKgwqDCoMKg
wqDCoMKgIHJlZ2lzdGVyIHVuaW9uIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgZTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgcjsKPiDCoMKgwqDCoMKgwqDC
oCB9IGRpIGFzbSgicmRpIikgPSB7IC5lID0gYiB9Owo+IMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVy
IHVuc2lnbmVkIGxvbmcgc2kgYXNtKCJyc2kiKTsKPiDCoMKgwqDCoMKgwqDCoCByZWdpc3RlciB1
bnNpZ25lZCBsb25nIGR4IGFzbSgicmR4Iik7Cj4gwqDCoMKgwqDCoMKgwqAgcmVnaXN0ZXIgdW5z
aWduZWQgbG9uZyBjeCBhc20oInJjeCIpOwo+IMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyIHVuc2ln
bmVkIGxvbmcgcjggYXNtKCJyOCIpOwo+IMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyIHVuc2lnbmVk
IGxvbmcgcjkgYXNtKCJyOSIpOwo+IMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyIHVuc2lnbmVkIGxv
bmcgcjEwIGFzbSgicjEwIik7Cj4gwqDCoMKgwqDCoMKgwqAgcmVnaXN0ZXIgdW5zaWduZWQgbG9u
ZyByMTEgYXNtKCJyMTEiKTsKPiAKPiDCoMKgwqDCoMKgwqDCoCBhc20gdm9sYXRpbGUgKCAiY2Fs
bCAlY1thZGRyXSIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6ICIrciIgKGRpKSwgIj1yIiAoc2kpLCAiPXIiIChkeCksCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICI9ciIgKGN4KSwgIj1yIiAocjgpLCAiPXIi
IChyOSksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICI9ciIgKHIxMCksICI9ciIgKHIxMSksICI9YSIgKHJldF8pCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBbYWRkcl0gImkiICgmKGZ1bmMpKSwgImciIChm
dW5jKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIm1l
bW9yeSIgKTsKPiDCoMKgwqAgfQo+IH0KPiAKPiBTZWU6IGh0dHBzOi8vZ29kYm9sdC5vcmcvei9x
dnhNR2Q4NHEKPiAKPiBDbGFuZyB3aWxsIGdlbmVyYXRlIG1hY2hpbmUgY29kZSB0aGF0IG9ubHkg
cmVzZXRzIHRoZSBsb3cgOCBiaXRzIG9mCj4gJXJkaQo+IGJldHdlZW4gbG9vcCBjYWxscywgbGVh
dmluZyB0aGUgcmVzdCBvZiB0aGUgcmVnaXN0ZXIgcG9zc2libHkKPiBjb250YWluaW5nCj4gZ2Fy
YmFnZSBmcm9tIHRoZSB1c2Ugb2YgJXJkaSBpbnNpZGUgdGhlIGNhbGxlZCBmdW5jdGlvbi7CoCBO
b3RlIGFsc28KPiB0aGF0IGNsYW5nCj4gZG9lc24ndCB0cnVuY2F0ZSB0aGUgaW5wdXQgcGFyYW1l
dGVycyBhdCB0aGUgY2FsbGVlLCB0aHVzIGJyZWFraW5nCj4gdGhlIHBzQUJJLgo+IAo+IEZpeCB0
aGlzIGJ5IHR1cm5pbmcgdGhlIGBlYCBlbGVtZW50IGluIHRoZSBhbm9ueW1vdXMgdW5pb24gaW50
byBhbgo+IGFycmF5IHRoYXQKPiBjb25zdW1lcyB0aGUgc2FtZSBzcGFjZSBhcyBhbiB1bnNpZ25l
ZCBsb25nLCBhcyB0aGlzIGZvcmNlcyBjbGFuZyB0bwo+IHJlc2V0IHRoZQo+IHdob2xlICVyZGkg
cmVnaXN0ZXIgaW5zdGVhZCBvZiBqdXN0IHRoZSBsb3cgOCBiaXRzLgo+IAo+IEZpeGVzOiAyY2U1
NjJiMmE0MTMgKCd4ODYvYWx0Y2FsbDogdXNlIGEgdW5pb24gYXMgcmVnaXN0ZXIgdHlwZSBmb3IK
PiBmdW5jdGlvbiBwYXJhbWV0ZXJzIG9uIGNsYW5nJykKPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBBZGRpbmcgT2xla3NpaSBhcyB0byB3aGV0
aGVyIHRoaXMgY291bGQgYmUgY29uc2lkZXJlZCBmb3IgNC4xOTogaXQncwo+IHN0cmljdGx5Cj4g
bGltaXRlZCB0byBjbGFuZyBidWlsZHMsIHBsdXMgd2lsbCBuZWVkIHRvIGJlIGJhY2twb3J0ZWQg
YW55d2F5Lgo+IC0tLQpJIGFtIG9rYXkgdG8gaGF2ZSB0aGlzIGNoYW5nZSBpbiA0LjE5IGJ1dCB0
aGVuIGl0IHNob3VsZCBiZSByZXZpZXdlZAphbmQgbWVyZ2VkIEFTQVAgYXMgdGhlIHRyZWUgd2Fz
IHRhZ2dlZCBmZXcgbWludXRlcyBhZ28gYW5kIEkgZXhwZWN0ZWQKdGhhdCBpdCB3aWxsIGJlIHRo
ZSBsYXN0IG9uZSBSQyBpbiB0aGlzIHJlbGVhc2UgY3ljbGU6CgpSZWxlYXNlLUFja2VkLUJ5OiBP
bGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KCn4gT2xla3NpaQoK
PiDCoHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5oIHwgNCArKy0tCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUuaAo+IGIveGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPiBpbmRleCAwZDM2OTdmMWRlNDkuLmU2
M2I0NTkyNzY0MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYWx0ZXJu
YXRpdmUuaAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5oCj4g
QEAgLTE4NSwxMCArMTg1LDEwIEBAIGV4dGVybiB2b2lkIGFsdGVybmF0aXZlX2JyYW5jaGVzKHZv
aWQpOwo+IMKgICovCj4gwqAjZGVmaW5lIEFMVF9DQUxMX0FSRyhhcmcsCj4gbinCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqAgcmVnaXN0ZXIgdW5pb24KPiB7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiAtwqDCoMKgwqDCoMKg
wqAgdHlwZW9mKGFyZykKPiBlO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiArwqDCoMKgwqDCoMKgwqAgdHlwZW9mKGFyZykgZVtzaXplb2YobG9uZykgLwo+IHNp
emVvZihhcmcpXTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+
IMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZwo+IHI7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqAgfSBhICMjIG4gIyMgXyBhc20gKCBBTFRfQ0FM
TF9hcmcgIyMgbiApID0KPiB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPiAtwqDCoMKgwqDCoMKgwqAgLmUgPSAoeyBCVUlMRF9CVUdfT04oc2l6ZW9m
KGFyZykgPiBzaXplb2Yodm9pZCAqKSk7IChhcmcpOwo+IH0pwqDCoCBcCj4gK8KgwqDCoMKgwqDC
oMKgIC5lWzBdID0gKHsgQlVJTERfQlVHX09OKHNpemVvZihhcmcpID4gc2l6ZW9mKHZvaWQgKikp
Owo+IChhcmcpOyB9KVwKPiDCoMKgwqDCoCB9Cj4gwqAjZWxzZQo+IMKgI2RlZmluZSBBTFRfQ0FM
TF9BUkcoYXJnLCBuKSBcCgo=


