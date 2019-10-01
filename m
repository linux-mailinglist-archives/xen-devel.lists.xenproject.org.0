Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B0C38C0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJt7-0006jD-P8; Tue, 01 Oct 2019 15:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYZ1=X2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iFJt6-0006j8-OT
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:16:28 +0000
X-Inumbo-ID: 7033f86c-e45e-11e9-b588-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by localhost (Halon) with ESMTPS
 id 7033f86c-e45e-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 15:16:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l21so13814058lje.4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DMnjBNHP95RDdTutSOhnnWbGoHkoH2/vCPc74E3oK3w=;
 b=oMlAqms1ppV8yZH6DGxEU2w7IbbfpaU5vyZQ3TNeSblHq6yP+nM1UDTO7mAMCF0C8r
 7cDxgBNtK1JNtUcYCNCo4y1I4xOZ7iu/j3Grc637Qn0sKyRBDjBQ1+SDmF7ZXVXEcxl5
 GCCmUkejyg1KhWy8aFPZ4ZPtWZaJr/tjiualmxDdgExH6vag+e/3lHBICXW8RG1wjjVs
 9jUmQxqiB4VM8BbC/hrueJXKXy9P6kROOX4nf7zLvnu6kOjXhowUQv7HOdRKf/F+3H1T
 MpWJewrOrG9hNUvvVT4kdgaY7wRNSJiYMFzS9LtzuUmRlHnZnTtwb1dPeCOYyB2Bwr7n
 Jyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DMnjBNHP95RDdTutSOhnnWbGoHkoH2/vCPc74E3oK3w=;
 b=tnRo0qtCwNi/uKu+lFId3Gpu8p2HVi7wiQQLVY1l1BGEPtL9um0EcMGdNgh+wBmKhb
 Qm3fbWnplcelPMr0R4k1NzhkCcLqiPVSDJzyaenuv3Mc6ZL1H+JkOdZprPQgvGn5waqr
 vmeaRYOcQKpIogPu6wncX0yKkbUZckTJEX2Ojks13vPW8G1244X5YR4HTz8LQyNqjuqs
 P5aPo4zhJ6HZiswd70L6Snr6MNCL/4gvi4muZgXJEbZOZKBPBFtNFC5Zyo5fw0aDUl1Q
 8Nxu3vYzCvkemmzdUANzDT/PNQbAg7Qoe9vUiKEE2IiiFEJB4T2xNHK4RP2F+XwexZR8
 RFyw==
X-Gm-Message-State: APjAAAWpq+obEXzEvRN70P+KKMQJr61NvyiifoN8nmY6g4ShvuyzFewb
 BC4KnA5OaAbSt6EG1NbnImU=
X-Google-Smtp-Source: APXvYqze3tTH4vVi0xFZLICvSxnjNUra0jBF87OgWd6CJp3EWRoDct1IlAHW1qYkw5FFH5x8zJY6vQ==
X-Received: by 2002:a2e:1614:: with SMTP id w20mr16191707ljd.159.1569942986702; 
 Tue, 01 Oct 2019 08:16:26 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id g10sm3932130lfb.76.2019.10.01.08.16.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 08:16:26 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, julien.grall@arm.com
References: <20190930205618.29942-1-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <53deb838-677a-5d4b-7b40-fcdb935751cc@gmail.com>
Date: Tue, 1 Oct 2019 18:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930205618.29942-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: boot with device trees
 with "mmu-masters" and "iommus"
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDMwLjA5LjE5IDIzOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSBTdGVmYW5v
Cgo+IFNvbWUgRGV2aWNlIFRyZWVzIG1heSBleHBvc2UgYm90aCBsZWdhY3kgU01NVSBhbmQgZ2Vu
ZXJpYyBJT01NVSBiaW5kaW5ncwo+IHRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2ZXIg
aW4gWGVuIGlzIG9ubHkgc3VwcG9ydGluZyB0aGUgbGVnYWN5Cj4gU01NVSBiaW5kaW5ncywgbGVh
ZGluZyB0byBmYXRhbCBpbml0aWFsaXphdGlvbiBlcnJvcnMgYXQgYm9vdCB0aW1lLgo+Cj4gVGhp
cyBwYXRjaCBmaXhlcyB0aGUgYm9vdGluZyBwcm9ibGVtIGJ5IGFkZGluZyBhIGNoZWNrIHRvCj4g
aW9tbXVfYWRkX2R0X2RldmljZTogaWYgdGhlIFhlbiBkcml2ZXIgZG9lc24ndCBzdXBwb3J0IHRo
ZSBuZXcgZ2VuZXJpYwo+IGJpbmRpbmdzLCBhbmQgdGhlIGRldmljZSBpcyBiZWhpbmQgYW4gSU9N
TVUsIGRvIG5vdCByZXR1cm4gZXJyb3IuIFRoZQo+IGZvbGxvd2luZyBpb21tdV9hc3NpZ25fZHRf
ZGV2aWNlIHNob3VsZCBzdWNjZWVkLgo+Cj4gVGhpcyBjaGVjayB3aWxsIGJlY29tZSBzdXBlcmZs
dW91cywgaGVuY2UgcmVtb3ZhYmxlLCBvbmNlIHRoZSBYZW4gU01NVQo+IGRyaXZlciBnZXRzIHN1
cHBvcnQgZm9yIHRoZSBnZW5lcmljIElPTU1VIGJpbmRpbmdzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4KPiAtLS0K
PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgfCAxNyArKysrKysrKysr
KysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5j
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYwo+IGluZGV4IGNjOTAwYmFj
NzAuLjI3ZTI2NWI5MzYgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2
aWNlX3RyZWUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMK
PiBAQCAtMTU1LDcgKzE1NSwyMiBAQCBpbnQgaW9tbXVfYWRkX2R0X2RldmljZShzdHJ1Y3QgZHRf
ZGV2aWNlX25vZGUgKm5wKQo+ICAgICAgICAgICAgKiB0aGVzZSBjYWxsYmFjayBpbXBsZW1lbnRl
ZC4KPiAgICAgICAgICAgICovCj4gICAgICAgICAgIGlmICggIW9wcy0+YWRkX2RldmljZSB8fCAh
b3BzLT5kdF94bGF0ZSApCj4gLSAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAg
IHsKPiArICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogU29tZSBEZXZpY2UgVHJlZXMg
bWF5IGV4cG9zZSBib3RoIGxlZ2FjeSBTTU1VIGFuZCBnZW5lcmljCj4gKyAgICAgICAgICAgICAq
IElPTU1VIGJpbmRpbmdzIHRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2ZXIgaXMgb25s
eQo+ICsgICAgICAgICAgICAgKiBzdXBwb3J0aW5nIHRoZSBmb3JtZXIgYW5kIHdpbGwgcHJvdGVj
dCB0aGVtIGR1cmluZyB0aGUKPiArICAgICAgICAgICAgICogaW5pdGlhbGl6YXRpb24uIFNvIHdl
IG5lZWQgdG8gc2tpcCB0aGVtIGFuZCBub3QgcmV0dXJuCj4gKyAgICAgICAgICAgICAqIGVycm9y
IGhlcmUuCj4gKyAgICAgICAgICAgICAqCj4gKyAgICAgICAgICAgICAqIFhYWDogVGhpcyBjYW4g
YmUgZHJvcHBlZCB3aGVuIHRoZSBTTU1VIGlzIGFibGUgdG8gZGVhbAo+ICsgICAgICAgICAgICAg
KiB3aXRoIGdlbmVyaWMgYmluZGluZ3MuCj4gKyAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAg
ICBpZiAoIGR0X2RldmljZV9pc19wcm90ZWN0ZWQobnApICkKPiArICAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICsgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArICAgICAgICB9Cj4gICAKPiAgICAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX2F2
YWlsYWJsZShpb21tdV9zcGVjLm5wKSApCj4gICAgICAgICAgICAgICBicmVhazsKClBhdGNoIGxv
b2tzIGNvcnJlY3QgYW5kIHF1aXRlIHdlbGwgZGVzY3JpYmVkLi4uCgoKWW91IGNhbiBhZGQgKGlm
IG5lZWRlZCk6CgpSZXZpZXdlZC1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90
eXNoY2hlbmtvQGVwYW0uY29tPgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
