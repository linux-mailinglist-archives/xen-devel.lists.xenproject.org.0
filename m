Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3806185BFA1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683570.1063145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRpP-0007tt-CV; Tue, 20 Feb 2024 15:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683570.1063145; Tue, 20 Feb 2024 15:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRpP-0007so-9l; Tue, 20 Feb 2024 15:14:39 +0000
Received: by outflank-mailman (input) for mailman id 683570;
 Tue, 20 Feb 2024 15:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcRpN-0007kg-Tb
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:14:37 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c23201e9-d002-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 16:14:36 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3e7f7b3d95so297051566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 07:14:36 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vb7-20020a170907d04700b00a3dabd0d000sm3997443ejc.209.2024.02.20.07.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:14:34 -0800 (PST)
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
X-Inumbo-ID: c23201e9-d002-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708442075; x=1709046875; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCo217VIQDdyMozUTvAlDqcrb3LIxMx88qr1WrJ9aH4=;
        b=ImCLZZXcCo5NdRouzLfxSrj/6NRcCsbJtYC0GFVHq3MHx3PC/Ds33uh8QDkJkJCqHG
         FDhDmEMDZ5/dszvmcFjWzXQqoDG4umpUzz2amYb8l2M+e0V7Ddde3NnbHpt5l/PLlTAk
         NzcwFEN4HU9WYxCCLFu6szHWJy5DLoCFgfcNTlorvbbHNEFDVPHN9nSXp/AZcxuVmzum
         lC/vOCauMFcuAOGAd/L5hx1no7JtgWV37cClGSnB4wRyr+YOuIir3W53j75sOLuagjvo
         +nlkKc+ajCTSXweHkh11kfwXmtzEERUTN6iAfPsoQHQ9tyQ4SKGywjGROdhTMvlNnWtE
         zvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442075; x=1709046875;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eCo217VIQDdyMozUTvAlDqcrb3LIxMx88qr1WrJ9aH4=;
        b=NbLNgx9GwCrCqjLScyHrYZd815zOhRxGqvl4YSkVYfNwSJU0fS9BdX7JpzNHOp/Fq8
         WyjkqQshfRp/tj1p8ByOGJ71NgyJ+DDZSKHo8X9LepVIsoUHEMZmhT6di1QgPOdBJXFQ
         eTbzVsqXQePzZ/jMjz6T8VB+DGKqPl97xgEMNIZ4A6zvXm59CAwUqoaYYg4YMTvbwxBZ
         TVvfPSbuMHx8imCwC7bUqTa569YQKS4Z0ijNYhSpY16aGV9JhnvtPf0cFTwGWNRznEsm
         pvFdRV9WryNPXJI+8LwAjmxg+fVq0J/kLvx37FjN35zahTMafE8j2GY+aMfZHmVpmJ+C
         bAOg==
X-Gm-Message-State: AOJu0Ywh7ION1vxjvDm4T2GyEzZ+LfY0cloteKuXV5dibS4hAkhmnzVC
	LSujYhR5DvXwoNHyBAtHSNfkJg6LC+q9O1O6cOc8ZKZnHwcRb6lpZjEgCABA
X-Google-Smtp-Source: AGHT+IHdcPnjyR9dZN/l51OaGsncFKH8H69QwSlDLhsizRrbN3tqUurK4a2/H7nzIbUPZ3nnPF2gyg==
X-Received: by 2002:a17:906:40d8:b0:a3e:e678:556 with SMTP id a24-20020a17090640d800b00a3ee6780556mr2217599ejk.58.1708442075022;
        Tue, 20 Feb 2024 07:14:35 -0800 (PST)
Message-ID: <c3efe22792dd732522b1a9240f8807f53756e6c0.camel@gmail.com>
Subject: Re: [PATCH v9 6/7] xen/ppc: switch PPC to use asm-generic/device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Date: Tue, 20 Feb 2024 16:14:34 +0100
In-Reply-To: <222ae66639312712e145bd04d5dd1ebd2c511d43.1708086092.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
	 <222ae66639312712e145bd04d5dd1ebd2c511d43.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

SGVsbG8gU2hhd24sCgpXb3VsZCB5b3UgbWluZCB0YWtpbmcgYSBsb29rIGF0IHRoaXMgcGF0Y2g/
CgpUaGFua3MgaW4gYWR2YW5jZS4KCkJlc3QgcmVnYXJkcywKIE9sZWtzaWkKCk9uIEZyaSwgMjAy
NC0wMi0xNiBhdCAxMzozOSArMDEwMCwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToKPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KPiAt
LS0KPiBDaGFuZ2VkIGluIFY4Ogo+IMKgLSBub3RoaW5nIGNoYW5nZWQuIG9ubHkgcmViYXNlLgo+
IC0tLQo+IENoYW5nZXMgaW4gVjc6Cj4gwqAtIG5ld2x5IGludHJvZHVjZWQgcGF0Y2ggd2hpY2gg
aXMgYmFzZWQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YKPiB0aGUgcGF0Y2g6Cj4gwqDCoMKg
wqAgW1BBVENIIHY2IDkvOV0geGVuL2FzbS1nZW5lcmljOiBpbnRyb2R1Y2UgZ2VuZXJpYyBkZXZp
Y2UuaAo+IC0tLQo+IMKgeGVuL2FyY2gvcHBjL2luY2x1ZGUvYXNtL01ha2VmaWxlIHzCoCAxICsK
PiDCoHhlbi9hcmNoL3BwYy9pbmNsdWRlL2FzbS9kZXZpY2UuaCB8IDUzIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDUzIGRlbGV0aW9ucygtKQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3BwYy9pbmNs
dWRlL2FzbS9kZXZpY2UuaAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9wcGMvaW5jbHVkZS9h
c20vTWFrZWZpbGUKPiBiL3hlbi9hcmNoL3BwYy9pbmNsdWRlL2FzbS9NYWtlZmlsZQo+IGluZGV4
IDNmZDg5M2YzZTAuLmNlZDAyZTI2ZWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvcHBjL2luY2x1
ZGUvYXNtL01ha2VmaWxlCj4gKysrIGIveGVuL2FyY2gvcHBjL2luY2x1ZGUvYXNtL01ha2VmaWxl
Cj4gQEAgLTEsNSArMSw2IEBACj4gwqAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkKPiDCoGdlbmVyaWMteSArPSBhbHRwMm0uaAo+ICtnZW5lcmljLXkgKz0gZGV2aWNlLmgK
PiDCoGdlbmVyaWMteSArPSBkaXY2NC5oCj4gwqBnZW5lcmljLXkgKz0gaGFyZGlycS5oCj4gwqBn
ZW5lcmljLXkgKz0gaHlwZXJjYWxsLmgKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcHBjL2luY2x1
ZGUvYXNtL2RldmljZS5oCj4gYi94ZW4vYXJjaC9wcGMvaW5jbHVkZS9hc20vZGV2aWNlLmgKPiBk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA4MjUzZTYxZDUxLi4wMDAwMDAwMDAwCj4g
LS0tIGEveGVuL2FyY2gvcHBjL2luY2x1ZGUvYXNtL2RldmljZS5oCj4gKysrIC9kZXYvbnVsbAo+
IEBAIC0xLDUzICswLDAgQEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLwo+IC0jaWZuZGVmIF9fQVNNX1BQQ19ERVZJQ0VfSF9fCj4gLSNkZWZpbmUgX19BU01f
UFBDX0RFVklDRV9IX18KPiAtCj4gLWVudW0gZGV2aWNlX3R5cGUKPiAtewo+IC3CoMKgwqAgREVW
X0RULAo+IC3CoMKgwqAgREVWX1BDSSwKPiAtfTsKPiAtCj4gLXN0cnVjdCBkZXZpY2Ugewo+IC3C
oMKgwqAgZW51bSBkZXZpY2VfdHlwZSB0eXBlOwo+IC0jaWZkZWYgQ09ORklHX0hBU19ERVZJQ0Vf
VFJFRQo+IC3CoMKgwqAgc3RydWN0IGR0X2RldmljZV9ub2RlICpvZl9ub2RlOyAvKiBVc2VkIGJ5
IGRyaXZlcnMgaW1wb3J0ZWQgZnJvbQo+IExpbnV4ICovCj4gLSNlbmRpZgo+IC19Owo+IC0KPiAt
ZW51bSBkZXZpY2VfY2xhc3MKPiAtewo+IC3CoMKgwqAgREVWSUNFX1NFUklBTCwKPiAtwqDCoMKg
IERFVklDRV9JT01NVSwKPiAtwqDCoMKgIERFVklDRV9QQ0lfSE9TVEJSSURHRSwKPiAtwqDCoMKg
IC8qIFVzZSBmb3IgZXJyb3IgKi8KPiAtwqDCoMKgIERFVklDRV9VTktOT1dOLAo+IC19Owo+IC0K
PiAtc3RydWN0IGRldmljZV9kZXNjIHsKPiAtwqDCoMKgIC8qIERldmljZSBuYW1lICovCj4gLcKg
wqDCoCBjb25zdCBjaGFyICpuYW1lOwo+IC3CoMKgwqAgLyogRGV2aWNlIGNsYXNzICovCj4gLcKg
wqDCoCBlbnVtIGRldmljZV9jbGFzcyBjbGFzczsKPiAtwqDCoMKgIC8qIExpc3Qgb2YgZGV2aWNl
cyBzdXBwb3J0ZWQgYnkgdGhpcyBkcml2ZXIgKi8KPiAtwqDCoMKgIGNvbnN0IHN0cnVjdCBkdF9k
ZXZpY2VfbWF0Y2ggKmR0X21hdGNoOwo+IC3CoMKgwqAgLyoKPiAtwqDCoMKgwqAgKiBEZXZpY2Ug
aW5pdGlhbGl6YXRpb24uCj4gLcKgwqDCoMKgICoKPiAtwqDCoMKgwqAgKiAtRUFHQUlOIGlzIHVz
ZWQgdG8gaW5kaWNhdGUgdGhhdCBkZXZpY2UgcHJvYmluZyBpcyBkZWZlcnJlZC4KPiAtwqDCoMKg
wqAgKi8KPiAtwqDCoMKgIGludCAoKmluaXQpKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LCBj
b25zdCB2b2lkICpkYXRhKTsKPiAtfTsKPiAtCj4gLXR5cGVkZWYgc3RydWN0IGRldmljZSBkZXZp
Y2VfdDsKPiAtCj4gLSNkZWZpbmUgRFRfREVWSUNFX1NUQVJUKG5hbWVfLCBuYW1lc3RyXywgY2xh
c3NfKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gXAo+IC1zdGF0aWMg
Y29uc3Qgc3RydWN0IGRldmljZV9kZXNjIF9fZGV2X2Rlc2NfIyNuYW1lXyBfX3VzZWTCoMKgwqDC
oMKgwqDCoMKgwqDCoAo+IFwKPiAtX19zZWN0aW9uKCIuZGV2LmluZm8iKSA9IHvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgCj4gXAo+IC3CoMKgwqAgLm5hbWUgPSBuYW1lc3RyXyzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IFwKPiAtwqDCoMKgIC5jbGFzcyA9IGNsYXNzXyzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gXAo+IC0KPiAtI2RlZmluZSBE
VF9ERVZJQ0VfRU5EwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBcCj4gLX07
Cj4gLQo+IC0jZW5kaWYgLyogX19BU01fUFBDX0RFVklDRV9IX18gKi8KCg==


