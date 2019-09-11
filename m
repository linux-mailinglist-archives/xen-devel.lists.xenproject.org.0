Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123CB01BB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 18:38:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i85Zf-0001Ph-7s; Wed, 11 Sep 2019 16:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oCsH=XG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i85Zd-0001PW-IB
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 16:34:29 +0000
X-Inumbo-ID: 05e3257a-d4b2-11e9-b299-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e3257a-d4b2-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 16:34:28 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h2so14121258ljk.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ebHxKo3QYo4kzkhRJ2+zGPVxOkHrYLG1EsTh3qr49aw=;
 b=V5g6ZHJ+hU1d1q/T0M+NjPhOX3GhSXTZSMW98Lo7C38HjPHJ7ZV/oPZxyaY6MR+fst
 btEOL7Y6ofVrdmpxbP9cDCMv+8ccN+oLHL2085eHIjDg5ZYS+Wi09YuWuRZ0/6jaQWQJ
 TBvV1PXcHYC5nW5VV9rsdR8l3r5DSnMmtOzfCjVz6wSOxvFixRQ36Rsn5P+26L0FaFlW
 uo/9L0vy7l6rKoCD0xoa4l+hoa8IHoN/T/bmhdbbxVrsaf5pedz6xDy4dEp/EzjKLfqJ
 NpBe2OkGpSqlfN55a/bV9bX9eXrj0S+0muqbVkcDdf1mQmPbiMd9rPUqNHqWSi2gLBaV
 4h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ebHxKo3QYo4kzkhRJ2+zGPVxOkHrYLG1EsTh3qr49aw=;
 b=A09jLlW/jIJnLD15RsycKmkCpF+te3NGTl2EIuytfuQkrumOv0KqI9epk2i2i85ppZ
 UFAio7PWQHF5hTBEFuXZJWcp6wExVr7Z/jPkqE89eBXeA/YGXp6bX+SnjBl0sk5sAtAx
 3o1hwxKAcKChji+NgOSPWu/X6ITI4pT9xxW0Nf2E8XZFYUzqtkfQEEgxccZa3XRUB2mY
 +sceCXS5freSZ48LBZiqUhJm7uYSPaG6b0dStt8b69H2T4H+lnfdxFMh/7IARcxDMJIl
 zEnRVoNM05gFRkY2mS9v/76+j5opE5gpIM0kJxVR51dKwIeEcLkpLWlQnLM5AEIZk2rN
 eFsQ==
X-Gm-Message-State: APjAAAV/mNmFeUMDl2au9YEP4miADg9o8GcZIfeOftJU6b4Dq+ufnIw8
 yZdGaRtuJdVP+pSUXF/xrPc=
X-Google-Smtp-Source: APXvYqygd8JYzgBZaFaZ+tLxrQgyP+MAweTLVopVQvwoiGCoG6/ZDbDMZMOWkyL6zFUWYQgqiILjeA==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr24013370ljg.144.1568219667352; 
 Wed, 11 Sep 2019 09:34:27 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id x15sm6144454lff.54.2019.09.11.09.34.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 09:34:26 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1566588892-5305-1-git-send-email-olekstysh@gmail.com>
 <d844f8b1-380d-0aed-785c-d889050b62c5@arm.com>
 <e7520ee5-2a31-d129-d736-7ce56589cb3e@gmail.com>
 <cec380f6-daf6-242f-3b57-2b08b3140248@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ca7a004d-9e3c-575f-bded-7a0fd5c7ef63@gmail.com>
Date: Wed, 11 Sep 2019 19:34:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cec380f6-daf6-242f-3b57-2b08b3140248@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] [RFC V2] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLjA5LjE5IDIxOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOS8xMC8xOSA1OjI0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4+Cj4+IE9uIDEwLjA5
LjE5IDE4OjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBPbGVrc2FuZHIsCj4+Cj4+IEhp
LCBKdWxpZW4KPj4KPj4KPj4+Cj4+PiBPbiA4LzIzLzE5IDg6MzQgUE0sIE9sZWtzYW5kciBUeXNo
Y2hlbmtvIHdyb3RlOgo+Pj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Pgo+Pj4+IFRoZXJlIGlzIGEgc3RyaWN0IHJlcXVpcmVt
ZW50IGZvciB0aGUgSU9NTVUgd2hpY2ggd2FudHMgdG8gc2hhcmUKPj4+PiB0aGUgUDJNIHRhYmxl
IHdpdGggdGhlIENQVS4gVGhlIElPTU1VJ3MgU3RhZ2UtMiBpbnB1dCBzaXplIG11c3QgYmUgCj4+
Pj4gZXF1YWwKPj4+PiB0byB0aGUgUDJNIElQQSBzaXplLiBJdCBpcyBub3QgYSBwcm9ibGVtIHdo
ZW4gdGhlIElPTU1VIGNhbiBzdXBwb3J0Cj4+Pj4gYWxsIHZhbHVlcyB0aGUgQ1BVIHN1cHBvcnRz
LiBJbiB0aGF0IGNhc2UsIHRoZSBJT01NVSBkcml2ZXIgd291bGQganVzdAo+Pj4+IHVzZSBhbnkg
InAybV9pcGFfYml0cyIgdmFsdWUgYXMgaXMuIEJ1dCwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gbm90
Lgo+Pj4+Cj4+Pj4gSW4gb3JkZXIgdG8gbWFrZSBQMk0gc2hhcmluZyBwb3NzaWJsZSBvbiB0aGUg
cGxhdGZvcm1zIHdoaWNoCj4+Pj4gSVBNTVVzIGhhdmUgYSBsaW1pdGF0aW9uIGluIG1heGltdW0g
U3RhZ2UtMiBpbnB1dCBzaXplIGludHJvZHVjZQo+Pj4+IHRoZSBmb2xsb3dpbmcgbG9naWMuCj4+
Pj4KPj4+PiBGaXJzdCBpbml0aWFsaXplIHRoZSBJT01NVSBzdWJzeXN0ZW0gYW5kIGdhdGhlciBy
ZXF1aXJlbWVudHMgcmVnYXJkaW5nCj4+Pj4gdGhlIG1heGltdW0gSVBBIGJpdHMgc3VwcG9ydGVk
IGJ5IGVhY2ggSU9NTVUgZGV2aWNlIHRvIGZpZ3VyZSBvdXQKPj4+PiB0aGUgbWluaW11bSB2YWx1
ZSBhbW9uZyB0aGVtLiBJbiB0aGUgUDJNIGNvZGUsIHRha2UgaW50byB0aGUgYWNjb3VudAo+Pj4+
IHRoZSBJT01NVSByZXF1aXJlbWVudHMgYW5kIGNob29zZSBzdWl0YWJsZSAicGFfcmFuZ2UiIGFj
Y29yZGluZwo+Pj4+IHRvIHRoZSByZXN0cmljdGVkICJwMm1faXBhX2JpdHMiLgo+Pj4KPj4+IEFz
IEkgcG9pbnRlZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYWxsIHRoZSBjb2RlIHlvdSBtb2Rp
ZnkgaXMgCj4+PiBhcm02NCBzcGVjaWZpYy4gRm9yIGFybTMyLCB0aGUgbnVtYmVyIG9mIElQQSBi
aXRzIGlzCj4+PiBoYXJkY29kZWQuIFNvIGlmIHlvdSBtb2RpZnkgcDJtX2lwYV9iaXRzLCB5b3Ug
d291bGQgZW5kIHVwIHRvIAo+Pj4gbWlzY29uZmlndXJlIFZUQ1IuCj4+PiBJbiBvdGhlciB3b3Jk
cywgZm9yIEFybTMyLCB5b3UgbmVlZCB0byBjaGVjayBwMm1faXBhX2JpdHMgaXMgYXQgCj4+PiBs
ZWFzdCA0MC1iaXRzIGJlZm9yZSBvdmVycmlkaW5nIGl0Lgo+Pgo+PiBCdXQsIGFsbCBtb2RpZmlj
YXRpb25zIHdpdGggcDJtX2lwYV9iaXRzIGFyZSBkb25lIGJlZm9yZSAKPj4gc2V0dXBfdmlydF9w
YWdpbmcoKSwgd2hlcmUsIGFjdHVhbGx5LCB0aGUgcDJtX2lwYV9iaXRzIGlzIGhhcmQtY29kZWQg
Cj4+IHRvIDQwIGJpdHMuIEhvdyBjYW4gd2UgZW5kIHVwIG1pc2NvbmZpZ3VyaW5nIFZUQ1IgZm9y
IEFSTTMyPyBPciBJIAo+PiByZWFsbHkgbWlzc2VkIHNvbWV0aGluZz8KPgo+IFNvcnJ5IGlmIEkg
d2Fzbid0IGNsZWFyZWQsIEkgbWVhbnQgdGhlIFZUQ1IgZm9yIHRoZSBJT01NVS4gWW91IHdvdWxk
IAo+IGVuZCB1cCB0byBjb25maWd1cmUgd2l0aCBhIHZhbHVlIHRoYXQgaXMgYmlnZ2VyIHRoYW4g
d2hhdCBpdCBjYW4gc3VwcG9ydC4KPiBJIGFtIG9rIGlmIHlvdSBkb24ndCByZXN0cmljdCB0aGUg
cDJtX2lwYV9iaXRzIGFuZCBqdXN0IGZhaWwuIFRoZSAKPiBwb2ludCBpcyB0byBub3RpZnkgdGhl
IHVzZXIgQVNBUCByYXRoZXIgdGhhbiBhbGxvd2luZyB0byBjb250aW51ZS4KPgo+IFRoaXMgd291
bGQgbWFrZSB0aGUgYmVoYXZpb3Igc2ltaWxhciB0byB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biAKPiAoYWx0aG91Z2ggdGhlIGVycm9yIHdvdWxkIGJlIGRpZmZlcmVudCkuCgpTbywgaW4gSU9N
TVUgZHJpdmVyIHdlIHNob3VsZCBjaGVjayBpZiBJT01NVSBpcyBhYmxlIHRvIHN1cHBvcnQgYXQg
bGVhc3QgCjQwLWJpdCBJUEEgYmVmb3JlIHRyeWluZyB0byByZXN0cmljdC4gSWYgeWVzLCB0aGVu
IGdvIGFoZWFkLCBidXQgaWYgbm8sIAp0aGVuIGp1c3QgZmFpbC4gQ29ycmVjdD8KCgo+Pj4+ICt7
Cj4+Pj4gK8KgwqDCoCAvKgo+Pj4+ICvCoMKgwqDCoCAqIENhbGN1bGF0ZSB0aGUgbWluaW11bSBv
ZiB0aGUgbWF4aW11bSBJUEEgYml0cyB0aGF0IGFueSBJT01NVQo+Pj4+ICvCoMKgwqDCoCAqIGNh
biBzdXBwb3J0Lgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgaWYgKCBpb21tdV9pcGFf
Yml0cyA8IHAybV9pcGFfYml0cyApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHAybV9pcGFfYml0cyA9
IGlvbW11X2lwYV9iaXRzOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+IMKgIC8qIFZUQ1IgdmFsdWUgdG8g
YmUgY29uZmlndXJlZCBieSBhbGwgQ1BVcy4gU2V0IG9ubHkgb25jZSBieSB0aGUgCj4+Pj4gYm9v
dCBDUFUgKi8KPj4+PiDCoCBzdGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSB2dGNyOwo+Pj4+
IMKgIEBAIC0xOTY2LDEwICsxOTc3LDI4IEBAIHZvaWQgX19pbml0IHNldHVwX3ZpcnRfcGFnaW5n
KHZvaWQpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIFs3XSA9IHsgMCB9wqAgLyogSW52YWxpZCAq
Lwo+Pj4+IMKgwqDCoMKgwqAgfTsKPj4+PiDCoCAtwqDCoMKgIHVuc2lnbmVkIGludCBjcHU7Cj4+
Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaSwgY3B1Owo+Pj4+IMKgwqDCoMKgwqAgdW5zaWduZWQg
aW50IHBhX3JhbmdlID0gMHgxMDsgLyogTGFyZ2VyIHRoYW4gYW55IHBvc3NpYmxlIAo+Pj4+IHZh
bHVlICovCj4+Pj4gwqDCoMKgwqDCoCBib29sIHZtaWRfOF9iaXQgPSBmYWxzZTsKPj4+PiDCoCAr
wqDCoMKgIGlmICggaW9tbXVfZW5hYmxlZCApCj4+Pgo+Pj4gQ291bGQgd2UgbWFrZSB0aGlzIElP
TU1VLWFnbm9zdGljPyBUaGUgbWFpbiByZWFzb24gdG8gY29udmVydCBmcm9tIAo+Pj4gcDJtX2lw
YV9iaXRzIHRvIHBhX3JhbmdlIGlzIHRvIGNhdGVyIHRoZSByZXN0IG9mIHRoZSBjb2RlLgo+Pj4K
Pj4+IEJ1dCB3ZSBjb3VsZCByZXdvcmsgdGhlIGNvZGUgdG8gZG8gdGhlIGNvbXB1dGF0aW9uIHdp
dGggcDJtX2lwYV9iaXRzIAo+Pj4gYW5kIHRoZW4gbG9vay11cCBmb3IgdGhlIHBhX3JhbmdlLiAK
Pj4KPj4gSSBhbSBhZnJhaWQsIEkgZG9uJ3QgY29tcGxldGVseSB1bmRlcnN0YW5kIHlvdXIgaWRl
YSBvZiBtYWtpbmcgdGhpcyAKPj4gSU9NTVUtYWdub3N0aWMgYW5kIHdoYXQgSSBzaG91bGQgZG8u
Li4KPgo+IFJvdWdobHkgd2hhdCB5b3UgYXJlIGRvaW5nIHRvZGF5IGlzOgo+Cj4gaWYgKCBpb21t
dV9lbmFibGVkICkKPiDCoMKgIHBhX3JhbmdlID0gZmluZF9wYV9yYW5nZV9mcm9tX3AybV9iaXRz
KCkuCj4KPiBmb3JfZWFjaF9jcHUoKQo+IMKgwqAgaWYgKCBjcHUucGFfcmFuZ2UgPCBwYV9yYW5n
ZSApCj4gwqDCoMKgwqAgcGFfcmFuZ2UgPSBjcHUucGFfcmFuZ2UKPgo+IC4uLi4KPgo+IFdoYXQg
eW91IGNvdWxkIGRvIGlzOgoKVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSB0aGlu
ayBJIHVuZGVyc3RhbmQgeW91ciBpZGVhLgoKQnV0IC4uLgoKPgo+IGZvcl9lY2hfY3B1KCkKPiDC
oMKgIGlmICggcDJtX2lwYV9iaXRzIDwgcGFfcmFuZ2VfaW5mb1tjcHUucGFfcmFuZ2VdLnBhYml0
cyApCgpQcm9iYWJseSB5b3UgbWVhbnQgIj4iIGhlcmU/CgoKPiBwMm1faXBhX2JpdHMgPSBwYV9y
YW5nZV9pbmZvW2NwdS5wYV9yYW5nZV0ucGFiaXRzOwo+Cj4gcGFfcmFuZ2UgPSBmaW5kX3BhX3Jh
bmdlX2Zyb21fcDJtX2JpdHMoKTsKPiAvKiBDaGVjayB2YWxpZGl0eSAqLwoKCi0tIApSZWdhcmRz
LAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
