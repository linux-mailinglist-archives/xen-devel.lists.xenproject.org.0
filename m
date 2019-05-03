Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F092131A9
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaY6-0006fo-5w; Fri, 03 May 2019 15:56:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaY4-0006ff-9x
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:32 +0000
X-Inumbo-ID: 03e51383-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03e51383-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:56:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z26so828947ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IZ/+u+TQwLcsWXuYAeN2A6+wlpiytzaNGcXTuvrXKqc=;
 b=gqOJqg4bVnZzCufb4rrjV32RaiCJc+2WHnIH0IkwwzPMWCUEAC6V4Tj5ar+MnR/HLm
 6iZpmQeshAlxvv45Vk5luhRrJUOkbDtAkn/wb49irahlIm6pVJfgbCm+WdesO+p2qDaj
 DcZnltEhvrTyDylQ+8H9LTD34L2VSGkSu74ruFU5SYFUtU58+BpckuBMCFNOdRbRxOvq
 zh1zfNsa/beYGoJmFuK8GbuJv5cmWUBeGJx+hbnkK5/5pCAzEPPwR00PVhpXN5Ofx9mp
 thc2ed/hATYYXTJj8MWUSf0iEu3XgLM6321Bt/mE2ElS3iYqIRTuXKWzPm0SGsqfiz26
 2Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IZ/+u+TQwLcsWXuYAeN2A6+wlpiytzaNGcXTuvrXKqc=;
 b=Vm7dldt0MenYWvKvcjJe/M3qUppr6jaN9F9qBm+eQQSTUR0hAiHUNNBzOIps996Ns3
 /PXKUshLwQVd04UX6SV1GdJHujlrovyNua1kVVIHxHA6Od+SZFRM+zxaWb3lAo0B7oBB
 AxqdOjgu9+wtFA45J7euwlnPkYDcOqjf5Az/TKDNMk4WQgXL4r7MLF8UKkXThcrnorrv
 X0iN4qaDQVljnBDWy/QOCWkU+++ImXzYAxTkR3+h+5fm288kwo+tzrOGnj9IVwBsLCBE
 4uhi9ob+e1/yzmACX+I8ToJZ42+WV2rF6CKGu0D972Mutbtthk5Y7IcBiHIYLSHaadb7
 gqlg==
X-Gm-Message-State: APjAAAWwlvdVFHbtPLcum3Wc/o6s+ZLEAZ8uqz6vmS4hAdSJOKCtK2BY
 aKX5yV0xxHgqlKeQSq3AJFI/ciS74RA=
X-Google-Smtp-Source: APXvYqyx2asU6qcrF8seavl+fTbEJggqT2Z7mBvLfJh8GRftJVjJIjVVd7sUS2wxrfAJC4nNqg9qXQ==
X-Received: by 2002:a2e:3c06:: with SMTP id j6mr4972007lja.99.1556898989296;
 Fri, 03 May 2019 08:56:29 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 z16sm563595lfi.9.2019.05.03.08.56.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:56:28 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-4-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
Date: Fri, 3 May 2019 18:56:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-4-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/20] xen/arm: processor: Use _BITUL
 instead of _AC(1, U) in SCTLR_ defines
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgbmV3bHkgaW50cm9kdWNlZCBtYWNybyBfQklUVUwgbWFrZXMgdGhlIGNvZGUgbW9yZSByZWFk
YWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+IC0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDE4ICsrKysr
KysrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3Iu
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgKPiBpbmRleCBjNmY1NjQ5MGIzLi4x
YTE0M2ZiNmEzIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oCj4gQEAgLTExNSwyMCArMTE1
LDIwIEBACj4gICAKPiAgIC8qIEJpdHMgc3BlY2lmaWMgdG8gU0NUTFJfRUwxIGZvciBBcm0zMiAq
Lwo+ICAgCj4gLSNkZWZpbmUgU0NUTFJfQTMyX0VMMV9WICAgICAoX0FDKDEsVSk8PDEzKQo+ICsj
ZGVmaW5lIFNDVExSX0EzMl9FTDFfViAgICAgX0JJVFVMKDEzKQo+ICAgCj4gICAvKiBDb21tb24g
Yml0cyBmb3IgU0NUTFJfRUx4IGZvciBBcm0zMiAqLwo+ICAgCj4gLSNkZWZpbmUgU0NUTFJfQTMy
X0VMeF9URSAgICAoX0FDKDEsVSk8PDMwKQo+IC0jZGVmaW5lIFNDVExSX0EzMl9FTHhfRkkgICAg
KF9BQygxLFUpPDwyMSkKPiArI2RlZmluZSBTQ1RMUl9BMzJfRUx4X1RFICAgIF9CSVRVTCgzMCkK
PiArI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJICAgIF9CSVRVTCgyMSkKPiAgIAo+ICAgLyogQ29t
bW9uIGJpdHMgZm9yIFNDVExSX0VMeCBvbiBhbGwgYXJjaGl0ZWN0dXJlcyAqLwo+IC0jZGVmaW5l
IFNDVExSX0F4eF9FTHhfRUUgICAgKF9BQygxLFUpPDwyNSkKPiAtI2RlZmluZSBTQ1RMUl9BeHhf
RUx4X1dYTiAgIChfQUMoMSxVKTw8MTkpCj4gLSNkZWZpbmUgU0NUTFJfQXh4X0VMeF9JICAgICAo
X0FDKDEsVSk8PDEyKQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfQyAgICAgKF9BQygxLFUpPDwy
KQo+IC0jZGVmaW5lIFNDVExSX0F4eF9FTHhfQSAgICAgKF9BQygxLFUpPDwxKQo+IC0jZGVmaW5l
IFNDVExSX0F4eF9FTHhfTSAgICAgKF9BQygxLFUpPDwwKQo+ICsjZGVmaW5lIFNDVExSX0F4eF9F
THhfRUUgICAgX0JJVFVMKDI1KQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfV1hOICAgX0JJVFVM
KDE5KQo+ICsjZGVmaW5lIFNDVExSX0F4eF9FTHhfSSAgICAgX0JJVFVMKDEyKQo+ICsjZGVmaW5l
IFNDVExSX0F4eF9FTHhfQyAgICAgX0JJVFVMKDIpCj4gKyNkZWZpbmUgU0NUTFJfQXh4X0VMeF9B
ICAgICBfQklUVUwoMSkKPiArI2RlZmluZSBTQ1RMUl9BeHhfRUx4X00gICAgIF9CSVRVTCgwKQo+
ICAgCj4gICAjZGVmaW5lIEhTQ1RMUl9CQVNFICAgICBfQUMoMHgzMGM1MTg3OCxVKQo+ICAgCj4g
CgpSZXNvbHV0aW9uIG9mIHRoZSBkaXNwdXRlIHdpdGggSmFuIGFib3V0IFtQQVRDSCAwMS8yMF0g
aXMgcmVxdWlyZWQgZmlyc3QuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
