Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA21907563
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 16:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740038.1147039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlcI-00080G-Mg; Thu, 13 Jun 2024 14:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740038.1147039; Thu, 13 Jun 2024 14:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHlcI-0007xD-JJ; Thu, 13 Jun 2024 14:39:54 +0000
Received: by outflank-mailman (input) for mailman id 740038;
 Thu, 13 Jun 2024 14:39:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g45b=NP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHlcH-0007x5-7Z
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 14:39:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca48798d-2992-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 16:39:52 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1223413e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 07:39:50 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287ae79sm219196e87.202.2024.06.13.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:39:49 -0700 (PDT)
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
X-Inumbo-ID: ca48798d-2992-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718289590; x=1718894390; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ec9JPpKhNcApee8NaDvVHEWeq39BraxKjX5B4FRrBUI=;
        b=UASa6DA/LtUBgVKW2VTNWAoTTxT2StDqVhTxwHklexAkF0W57YZshifNeKYLI10h5e
         mvJa50RqsdqXoFSZR6GgjF/5Tkfi9RuXBmnJxB5eC5xi77cWgHSSoPkM+OqPKsqZYRSA
         hAMBYE8uV1f+EA3k0BkWyzWml45cv7qxlCMYQAhWfZcxDD6o8BedcEpMnRj8lRzMVEON
         vgJF8iWUu/FS0ETQA8hgAy//ldNQyXdlYR89MXeBxkj0CJTR6OLDXhLeL7hQnXicTuDP
         t5kIaufiIh/XkDxIj4HI3UGPYtxZHKRq/MtOHU7OZTiNUl/0layzuT38b5gbRNyRWy/v
         ztLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289590; x=1718894390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ec9JPpKhNcApee8NaDvVHEWeq39BraxKjX5B4FRrBUI=;
        b=MbyJbqSEwgZftoEawOldgeD9seIp912LruHLktrWlWfl8hCbvPlGZGhJ4tSbTOSQCB
         JiQi17yhr/sHJdjp/VqCz9c+P39WjUt1GMutznAOIaOjdEfalZGSM6CN66FrUf57j+JH
         3bpT9cQYOuy2UIu9RkBVyDRHFRY3abz94QT3piQ79EvKE/Fp0NiSF0DXnSkhFDAZlCcH
         vQMpYGBi9gbxyMY7xGiMDJ/JRlLdXMXHth3BghwvTEmE5aRnKIcqcwOG2jrJsB48XV+t
         lzBBkqtqNDnnIZx6OBd4Q2ngMZ9y7dbst7MCahZY5jMxI9emJHDZmBastOxZfF7yBdO3
         z+SA==
X-Forwarded-Encrypted: i=1; AJvYcCXMCipBfpqtrjP9FjqIN41GCm3HtQU/VXKQQQI1fpnHCqWK8Ltm73kmGhSrdHED8QDKm7i4yfJUVO/LNelUZv4rJ7wVLzluozs0YwK9oG4=
X-Gm-Message-State: AOJu0YyZ0qI8pn9FGB1Cqg+TV5weJHfsPINADuSv9OtKNrNumV1t045b
	e7H8e2SFYID1hDBW3vHrBzor2PHf2GHf8wQGvqjBMC06lvQ5dkXJ
X-Google-Smtp-Source: AGHT+IFp4/JsvV6tLQqoQAz/NQPkpjzz5AikW9wFNTTlYMsx5gWmhIz6XSu+LrdqjpAX9Tr9tkwYOQ==
X-Received: by 2002:a19:384f:0:b0:52c:8009:e0cb with SMTP id 2adb3069b0e04-52c9a3dfacamr3049459e87.41.1718289590088;
        Thu, 13 Jun 2024 07:39:50 -0700 (PDT)
Message-ID: <eeed765c5d0a849742d51f829dc4c7ab2f967b81.camel@gmail.com>
Subject: Re: [PATCH v2 for-4.19 2/3] x86/EPT: avoid marking non-present
 entries for re-configuring
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 13 Jun 2024 16:39:49 +0200
In-Reply-To: <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
	 <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDE1OjE2ICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBG
b3Igbm9uLXByZXNlbnQgZW50cmllcyBFTVQsIGxpa2UgbW9zdCBvdGhlciBmaWVsZHMsIGlzIG1l
YW5pbmdsZXNzCj4gdG8KPiBoYXJkd2FyZS4gTWFrZSB0aGUgbG9naWMgaW4gZXB0X3NldF9lbnRy
eSgpIHNldHRpbmcgdGhlIGZpZWxkIChhbmQKPiBpUEFUKQo+IGNvbmRpdGlvbmFsIHVwb24gZGVh
bGluZyB3aXRoIGEgcHJlc2VudCBlbnRyeSwgbGVhdmluZyB0aGUgdmFsdWUgYXQgMAo+IG90aGVy
d2lzZS4gVGhpcyBoYXMgdHdvIGVmZmVjdHMgZm9yIGVwdGVfZ2V0X2VudHJ5X2VtdCgpIHdoaWNo
IHdlJ2xsCj4gd2FudCB0byBsZXZlcmFnZSBzdWJzZXF1ZW50bHk6Cj4gMSkgVGhlIGNhbGwgbW92
ZWQgaGVyZSBub3cgd29uJ3QgYmUgaXNzdWVkIHdpdGggSU5WQUxJRF9NRk4gYW55bW9yZQo+IChh
Cj4gwqDCoCByZXNwZWN0aXZlIEJVR19PTigpIGlzIGJlaW5nIGFkZGVkKS4KPiAyKSBOZWl0aGVy
IG9mIHRoZSBvdGhlciB0d28gY2FsbHMgY291bGQgbm93IGJlIGlzc3VlZCB3aXRoIGEKPiB0cnVu
Y2F0ZWQKPiDCoMKgIGZvcm0gb2YgSU5WQUxJRF9NRk4gYW55bW9yZSAoYXMgbG9uZyBhcyB0aGVy
ZSdzIG5vIGJ1ZyBhbnl3aGVyZQo+IMKgwqAgbWFya2luZyBhbiBlbnRyeSBwcmVzZW50IHdoZW4g
dGhhdCB3YXMgcG9wdWxhdGVkIHVzaW5nCj4gSU5WQUxJRF9NRk4pLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmVsZWFzZS1BY2tlZC1CeTogT2xl
a3NpaSBLdXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+Cgp+IE9sZWtzaWkKPiAt
LS0KPiB2MjogTmV3Lgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiArKysg
Yi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCj4gQEAgLTY1MCw2ICs2NTAsOCBAQCBzdGF0aWMg
aW50IGNmX2NoZWNrIHJlc29sdmVfbWlzY29uZmlnKHN0Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICggZS5lbXQgIT0gTVRSUl9OVU1fVFlQRVMgKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNTRVJU
KGlzX2VwdGVfcHJlc2VudCgmZSkpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KCBsZXZlbCA9PSAwICkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoIGdmbiAtPSBpLCBpID0gMDsgaSA8IEVQVF9QQUdF
VEFCTEVfRU5UUklFUzsKPiArK2kgKQo+IEBAIC05MTUsMTcgKzkxNyw2IEBAIGVwdF9zZXRfZW50
cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2YKPiDCoAo+IMKgwqDCoMKgIGlmICggbWZuX3Zh
bGlkKG1mbikgfHwgcDJtX2FsbG93c19pbnZhbGlkX21mbihwMm10KSApCj4gwqDCoMKgwqAgewo+
IC3CoMKgwqDCoMKgwqDCoCBib29sIGlwYXQ7Cj4gLcKgwqDCoMKgwqDCoMKgIGludCBlbXQgPSBl
cHRlX2dldF9lbnRyeV9lbXQocDJtLT5kb21haW4sIF9nZm4oZ2ZuKSwgbWZuLAo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaSAqIEVQVF9UQUJMRV9PUkRFUiwgJmlwYXQsCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBw
Mm10KTsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgIGlmICggZW10ID49IDAgKQo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5ld19lbnRyeS5lbXQgPSBlbXQ7Cj4gLcKgwqDCoMKgwqDCoMKgIGVsc2Ug
LyogZXB0X2hhbmRsZV9taXNjb25maWcoKSB3aWxsIG5lZWQgdG8gdGFrZSBjYXJlIG9mCj4gdGhp
cy4gKi8KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfZW50cnkuZW10ID0gTVRSUl9OVU1f
VFlQRVM7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoCBuZXdfZW50cnkuaXBhdCA9IGlwYXQ7Cj4gwqDC
oMKgwqDCoMKgwqDCoCBuZXdfZW50cnkuc3AgPSAhIWk7Cj4gwqDCoMKgwqDCoMKgwqDCoCBuZXdf
ZW50cnkuc2FfcDJtdCA9IHAybXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoCBuZXdfZW50cnkuYWNjZXNz
ID0gcDJtYTsKPiBAQCAtOTQxLDYgKzkzMiwyMiBAQCBlcHRfc2V0X2VudHJ5KHN0cnVjdCBwMm1f
ZG9tYWluICpwMm0sIGdmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5lZWRfbW9kaWZ5X3Z0
ZF90YWJsZSA9IDA7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgIGVwdF9wMm1fdHlwZV90b19mbGFn
cyhwMm0sICZuZXdfZW50cnkpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAgaWYgKCBpc19lcHRlX3By
ZXNlbnQoJm5ld19lbnRyeSkgKQo+ICvCoMKgwqDCoMKgwqDCoCB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYm9vbCBpcGF0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBlbXQgPSBl
cHRlX2dldF9lbnRyeV9lbXQocDJtLT5kb21haW4sIF9nZm4oZ2ZuKSwKPiBtZm4sCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGkgKiBFUFRfVEFCTEVfT1JERVIsICZpcGF0LAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwMm10KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQlVH
X09OKG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICggZW10ID49IDAgKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3
X2VudHJ5LmVtdCA9IGVtdDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIC8qIGVwdF9o
YW5kbGVfbWlzY29uZmlnKCkgd2lsbCBuZWVkIHRvIHRha2UgY2FyZSBvZgo+IHRoaXMuICovCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfZW50cnkuZW10ID0gTVRSUl9OVU1f
VFlQRVM7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV3X2VudHJ5LmlwYXQgPSBpcGF0Owo+
ICvCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqAgfQo+IMKgCj4gwqDCoMKgwqAgaWYgKCBzdmUg
IT0gLTEgKQo+IAoK


