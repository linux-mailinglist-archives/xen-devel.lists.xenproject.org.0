Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25979904F60
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739067.1145987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKMJ-00013p-CL; Wed, 12 Jun 2024 09:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739067.1145987; Wed, 12 Jun 2024 09:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKMJ-00010y-9V; Wed, 12 Jun 2024 09:33:35 +0000
Received: by outflank-mailman (input) for mailman id 739067;
 Wed, 12 Jun 2024 09:33:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FFiX=NO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHKMH-00010s-Ms
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:33:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d5a8eb-289e-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:33:31 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6efe62f583so186620566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:33:31 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1ad792e8sm417785366b.152.2024.06.12.02.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 02:33:30 -0700 (PDT)
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
X-Inumbo-ID: d4d5a8eb-289e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718184811; x=1718789611; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=myKzWYdJrGl7pYBItkqX4vkGRMnqNTAXx8KujSOPhko=;
        b=ZvT85qILKrLshVzssqZFiOmBgvQIHcNtkLzeXimvxwLt8qjQAE7e1M5fRaYKjgshRf
         gSJR7AZ9u5ox0A5e1NuKN889oldwWUl0SDct4hcsNCFqxiuehWDfSRjnyEIVTA7TZKPn
         s7gifuatkkuba+oYzczo06XSfl+yWAk98pv7RVdzGJsl2sw204O6BGczKGr049luoBjy
         NTOCV3NOKvtpi9kXcMAw4/QMtFssmSGSei/Y9f4zSf5MkGFUMZoQIjp3zT0Y0HPgCNdj
         XGmItVnInDy9itR0+zkpWvxO09ioKrc7oWSFLdNv27Cg8UiYXB9I0vSZyutRJ5oTxQcK
         uL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184811; x=1718789611;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myKzWYdJrGl7pYBItkqX4vkGRMnqNTAXx8KujSOPhko=;
        b=bQxn53M8kGKlPQEasySUKYdAr4QILS8Gx2PgI6PP1d6zsqaox1m7uLz9l1J5EyS0Vp
         Tgj14xS0bv2tAcQG40jiELjb8UXhf0/mxIdw+qkJKJnywGr2qNSOMfHzb1Qf9k0L9/Xf
         3kac8hyDRbsG8iVVkLo4+9OPcD81kAiAJ6WhDTxy7+lcNQ4W37M3kNxRU5loBNSJv2se
         tFrk7yzF5GyrA8QwiRF/LungqoKGQoWXZXC5EW++A+BCgOVA5r40hu20nlc7I6TmXhvP
         g6nF2nRGORccgqiHVHSw4stvnqPAkPJMqzIjedE4wXRa68C3/kCSO0BziHcFGlUvUviV
         E0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2P9omQ/hO7RAIaERfYIesEwv6PPbVeA51t9sahYoLMFTR3bewJcnJxliQ1h0LrGoTliRnpJ8QdCN3y01ILRF80TzvzGbAxELn7S9LmWs=
X-Gm-Message-State: AOJu0Ywv8j9uwO5dmZyAdDVa4LcUOYx9YEeS0or6ETmJlQyUrh33yphO
	Ze4Lj/fprMD/6m3k4+JDcDvVGdJYHpI8+3kbQfKovmfeNQ9q2F5K
X-Google-Smtp-Source: AGHT+IGHUGpjTf269uyO5+qcGpEOFC4EvxM2Qrc9ovPlvSF/n7l51+9mowHq88Xm4MkXkZlG9jPqvg==
X-Received: by 2002:a17:906:c11:b0:a6f:bc2:e579 with SMTP id a640c23a62f3a-a6f47c9ef52mr68251366b.30.1718184810912;
        Wed, 12 Jun 2024 02:33:30 -0700 (PDT)
Message-ID: <8ba52fb7b6fd6757d5defa515d45f50b99f7bc0d.camel@gmail.com>
Subject: Re: [PATCH for-4.19???] x86/physdev: replace
 physdev_{,un}map_pirq() checking against DOMID_SELF
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Date: Wed, 12 Jun 2024 11:33:30 +0200
In-Reply-To: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
References: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDEwOjQ0ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBJ
dCdzIGhhcmRseSBldmVyIGNvcnJlY3QgdG8gY2hlY2sgZm9yIGp1c3QgRE9NSURfU0VMRiwgYXMg
Z3Vlc3RzIGhhdmUKPiB3YXlzIHRvIGZpZ3VyZSBvdXQgdGhlaXIgZG9tYWluIElEcyBhbmQgaGVu
Y2UgY291bGQgaW5zdGVhZCB1c2UgdGhvc2UKPiBhcwo+IGlucHV0cyB0byByZXNwZWN0aXZlIGh5
cGVyY2FsbHMuIE5vdGUsIGhvd2V2ZXIsIHRoYXQgZm9yIG9yZGluYXJ5Cj4gRG9tVS1zCj4gdGhl
IGFkanVzdG1lbnQgaXMgcmVsYXhpbmcgdGhpbmdzIHJhdGhlciB0aGFuIHRpZ2h0ZW5pbmcgdGhl
bSwgc2luY2UKPiAtIGFzIGEgcmVzdWx0IG9mIFhTQS0yMzcgLSB0aGUgcmVzcGVjdGl2ZSBYU00g
Y2hlY2tzIHdvdWxkIGhhdmUKPiByZWplY3RlZAo+IHNlbGYgKHVuKW1hcHBpbmcgYXR0ZW1wdHMg
Zm9yIG90aGVyIHRoYW4gdGhlIGNvbnRyb2wgZG9tYWluLgo+IAo+IFNpbmNlIGluIHBoeXNkZXZf
bWFwX3BpcnEoKSBoYW5kbGluZyBvdmVyYWxsIGlzIGEgbGl0dGxlIGVhc2llciB0aGlzCj4gd2F5
LCBtb3ZlIG9idGFpbmluZyBvZiB0aGUgZG9tYWluIHBvaW50ZXIgaW50byB0aGUgY2FsbGVyLiBE
b2luZyB0aGUKPiBzYW1lIGZvciBwaHlzZGV2X3VubWFwX3BpcnEoKSBpcyBqdXN0IHRvIGtlZXAg
Ym90aCBjb25zaXN0ZW50IGluIHRoaXMKPiByZWdhcmQuIEZvciBib3RoIHRoaXMgaGFzIHRoZSBh
ZHZhbnRhZ2UgdGhhdCBpdCBpcyBub3cgcHJvdmFibGUgKGJ5Cj4gdGhlCj4gYnVpbGQgbm90IGZh
aWxpbmcpIHRoYXQgdGhlcmUgYXJlIG5vIERPTUlEX1NFTEYgY2hlY2tzIGxlZnQgKGFuZCBub25l
Cj4gY291bGQgZWFzaWx5IGJlIHJlLWFkZGVkKS4KPiAKPiBGaXhlczogMGI0NjljZDY4NzA4ICgi
SW50ZXJydXB0IHJlbWFwcGluZyB0byBQSVJRcyBpbiBIVk0gZ3Vlc3RzIikKPiBGaXhlczogOWUx
YTM0MTViNzczICgieDg2OiBmaXhlcyBhZnRlciBlbXVpcnEgY2hhbmdlcyIpCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZWxlYXNlLUFja2VkLUJ5OiBP
bGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KCn4gT2xla3NpaQo+
IC0tLQo+IE5vdGUgdGhhdCB0aGUgbW92aW5nIG9mIHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQo
KSBpcyBhbHNvIGdvaW5nIHRvCj4gaGVscAo+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDI0LTA2L21zZzAwMjA2Lmh0bWwuCj4gCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3BoeXNkZXYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMKPiBAQCAtMTgs
OSArMTgsOSBAQAo+IMKgI2luY2x1ZGUgPHhzbS94c20uaD4KPiDCoCNpbmNsdWRlIDxhc20vcDJt
Lmg+Cj4gwqAKPiAtaW50IHBoeXNkZXZfbWFwX3BpcnEoZG9taWRfdCBkb21pZCwgaW50IHR5cGUs
IGludCAqaW5kZXgsIGludAo+ICpwaXJxX3AsCj4gK2ludCBwaHlzZGV2X21hcF9waXJxKHN0cnVj
dCBkb21haW4gKmQsIGludCB0eXBlLCBpbnQgKmluZGV4LCBpbnQKPiAqcGlycV9wLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXNpX2luZm8gKm1z
aSk7Cj4gLWludCBwaHlzZGV2X3VubWFwX3BpcnEoZG9taWRfdCBkb21pZCwgaW50IHBpcnEpOwo+
ICtpbnQgcGh5c2Rldl91bm1hcF9waXJxKHN0cnVjdCBkb21haW4gKmQsIGludCBwaXJxKTsKPiDC
oAo+IMKgI2luY2x1ZGUgIng4Nl82NC9tbWNvbmZpZy5oIgo+IMKgCj4gQEAgLTg4LDEzICs4OCwx
MiBAQCBzdGF0aWMgaW50IHBoeXNkZXZfaHZtX21hcF9waXJxKAo+IMKgwqDCoMKgIHJldHVybiBy
ZXQ7Cj4gwqB9Cj4gwqAKPiAtaW50IHBoeXNkZXZfbWFwX3BpcnEoZG9taWRfdCBkb21pZCwgaW50
IHR5cGUsIGludCAqaW5kZXgsIGludAo+ICpwaXJxX3AsCj4gK2ludCBwaHlzZGV2X21hcF9waXJx
KHN0cnVjdCBkb21haW4gKmQsIGludCB0eXBlLCBpbnQgKmluZGV4LCBpbnQKPiAqcGlycV9wLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXNpX2lu
Zm8gKm1zaSkKPiDCoHsKPiAtwqDCoMKgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21h
aW47Cj4gwqDCoMKgwqAgaW50IHJldDsKPiDCoAo+IC3CoMKgwqAgaWYgKCBkb21pZCA9PSBET01J
RF9TRUxGICYmIGlzX2h2bV9kb21haW4oZCkgJiYgaGFzX3BpcnEoZCkgKQo+ICvCoMKgwqAgaWYg
KCBkID09IGN1cnJlbnQtPmRvbWFpbiAmJiBpc19odm1fZG9tYWluKGQpICYmIGhhc19waXJxKGQp
ICkKPiDCoMKgwqDCoCB7Cj4gwqDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDCoMKgwqDC
oCAqIE9ubHkgbWFrZXMgc2Vuc2UgZm9yIHZlY3Rvci1iYXNlZCBjYWxsYmFjaywgZWxzZSBIVk0t
SVJRCj4gbG9naWMKPiBAQCAtMTA2LDEzICsxMDUsOSBAQCBpbnQgcGh5c2Rldl9tYXBfcGlycShk
b21pZF90IGRvbWlkLCBpbnQKPiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBwaHlzZGV2X2h2bV9t
YXBfcGlycShkLCB0eXBlLCBpbmRleCwgcGlycV9wKTsKPiDCoMKgwqDCoCB9Cj4gwqAKPiAtwqDC
oMKgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGRvbWlkKTsKPiAtwqDCoMKgIGlmICgg
ZCA9PSBOVUxMICkKPiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FU1JDSDsKPiAtCj4gwqDCoMKg
wqAgcmV0ID0geHNtX21hcF9kb21haW5fcGlycShYU01fRE1fUFJJViwgZCk7Cj4gwqDCoMKgwqAg
aWYgKCByZXQgKQo+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIGZyZWVfZG9tYWluOwo+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+IMKgCj4gwqDCoMKgwqAgLyogVmVyaWZ5IG9yIGdldCBpcnEu
ICovCj4gwqDCoMKgwqAgc3dpdGNoICggdHlwZSApCj4gQEAgLTEzNSwyNCArMTMwLDE3IEBAIGlu
dCBwaHlzZGV2X21hcF9waXJxKGRvbWlkX3QgZG9taWQsIGludAo+IMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4gwqDCoMKgwqAgfQo+IMKgCj4gLSBmcmVlX2RvbWFpbjoKPiAtwqDCoMKgIHJjdV91
bmxvY2tfZG9tYWluKGQpOwo+IMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiAtaW50
IHBoeXNkZXZfdW5tYXBfcGlycShkb21pZF90IGRvbWlkLCBpbnQgcGlycSkKPiAraW50IHBoeXNk
ZXZfdW5tYXBfcGlycShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgcGlycSkKPiDCoHsKPiAtwqDCoMKg
IHN0cnVjdCBkb21haW4gKmQ7Cj4gwqDCoMKgwqAgaW50IHJldCA9IDA7Cj4gwqAKPiAtwqDCoMKg
IGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKGRvbWlkKTsKPiAtwqDCoMKgIGlmICggZCA9
PSBOVUxMICkKPiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FU1JDSDsKPiAtCj4gLcKgwqDCoCBp
ZiAoIGRvbWlkICE9IERPTUlEX1NFTEYgfHwgIWlzX2h2bV9kb21haW4oZCkgfHwgIWhhc19waXJx
KGQpICkKPiArwqDCoMKgIGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gfHwgIWlzX2h2bV9kb21h
aW4oZCkgfHwgIWhhc19waXJxKGQpICkKPiDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHhzbV91bm1h
cF9kb21haW5fcGlycShYU01fRE1fUFJJViwgZCk7Cj4gwqDCoMKgwqAgaWYgKCByZXQgKQo+IC3C
oMKgwqDCoMKgwqDCoCBnb3RvIGZyZWVfZG9tYWluOwo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+IMKgCj4gwqDCoMKgwqAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmIGhhc19waXJxKGQp
ICkKPiDCoMKgwqDCoCB7Cj4gQEAgLTE2MCw4ICsxNDgsOCBAQCBpbnQgcGh5c2Rldl91bm1hcF9w
aXJxKGRvbWlkX3QgZG9taWQsIGluCj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGRvbWFpbl9waXJx
X3RvX2VtdWlycShkLCBwaXJxKSAhPSBJUlFfVU5CT1VORCApCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IHVubWFwX2RvbWFpbl9waXJxX2VtdWlycShkLCBwaXJxKTsKPiDCoMKgwqDC
oMKgwqDCoMKgIHdyaXRlX3VubG9jaygmZC0+ZXZlbnRfbG9jayk7Cj4gLcKgwqDCoMKgwqDCoMKg
IGlmICggZG9taWQgPT0gRE9NSURfU0VMRiB8fCByZXQgKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gZnJlZV9kb21haW47Cj4gK8KgwqDCoMKgwqDCoMKgIGlmICggZCA9PSBjdXJyZW50
LT5kb21haW4gfHwgcmV0ICkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+
IMKgwqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIHBjaWRldnNfbG9jaygpOwo+IEBAIC0xNzAsOCAr
MTU4LDYgQEAgaW50IHBoeXNkZXZfdW5tYXBfcGlycShkb21pZF90IGRvbWlkLCBpbgo+IMKgwqDC
oMKgIHdyaXRlX3VubG9jaygmZC0+ZXZlbnRfbG9jayk7Cj4gwqDCoMKgwqAgcGNpZGV2c191bmxv
Y2soKTsKPiDCoAo+IC0gZnJlZV9kb21haW46Cj4gLcKgwqDCoCByY3VfdW5sb2NrX2RvbWFpbihk
KTsKPiDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IMKgfQo+IMKgI2VuZGlmIC8qIENPTVBBVCAqLwo+
IEBAIC0xODQsNiArMTcwLDggQEAgcmV0X3QgZG9fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VF
U1RfSAo+IMKgCj4gwqDCoMKgwqAgc3dpdGNoICggY21kICkKPiDCoMKgwqDCoCB7Cj4gK8KgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkb21haW4gKmQ7Cj4gKwo+IMKgwqDCoMKgIGNhc2UgUEhZU0RFVk9Q
X2VvaTogewo+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBoeXNkZXZfZW9pIGVvaTsKPiDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBwaXJxICpwaXJxOwo+IEBAIC0zMzEsOCArMzE5LDE1IEBAIHJl
dF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0gKPiDCoMKgwqDCoMKgwqDCoMKg
IG1zaS5zYmRmLmRldmZuID0gbWFwLmRldmZuOwo+IMKgwqDCoMKgwqDCoMKgwqAgbXNpLmVudHJ5
X25yID0gbWFwLmVudHJ5X25yOwo+IMKgwqDCoMKgwqDCoMKgwqAgbXNpLnRhYmxlX2Jhc2UgPSBt
YXAudGFibGVfYmFzZTsKPiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGh5c2Rldl9tYXBfcGlycSht
YXAuZG9taWQsIG1hcC50eXBlLCAmbWFwLmluZGV4LAo+ICZtYXAucGlycSwKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZtc2kp
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQobWFw
LmRvbWlkKTsKPiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVTUkNIOwo+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoICFkICkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgIHJldCA9IHBoeXNkZXZfbWFwX3BpcnEoZCwgbWFwLnR5cGUsICZtYXAuaW5kZXgs
ICZtYXAucGlycSwKPiAmbXNpKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgIHJjdV91bmxvY2tfZG9t
YWluKGQpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIG1hcC50eXBlID09IE1BUF9QSVJR
X1RZUEVfTVVMVElfTVNJICkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLmVudHJ5X25y
ID0gbXNpLmVudHJ5X25yOwo+IEBAIC0zNDgsNyArMzQzLDE1IEBAIHJldF90IGRvX3BoeXNkZXZf
b3AoaW50IGNtZCwgWEVOX0dVRVNUX0gKPiDCoMKgwqDCoMKgwqDCoMKgIGlmICggY29weV9mcm9t
X2d1ZXN0KCZ1bm1hcCwgYXJnLCAxKSAhPSAwICkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGh5c2Rldl91bm1hcF9waXJxKHVu
bWFwLmRvbWlkLCB1bm1hcC5waXJxKTsKPiArwqDCoMKgwqDCoMKgwqAgZCA9IHJjdV9sb2NrX2Rv
bWFpbl9ieV9hbnlfaWQodW5tYXAuZG9taWQpOwo+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRVNS
Q0g7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmICggIWQgKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gcGh5c2Rldl91bm1hcF9waXJxKGQs
IHVubWFwLnBpcnEpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAgcmN1X3VubG9ja19kb21haW4oZCk7
Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgwqAgfQo+IMKgCgo=


