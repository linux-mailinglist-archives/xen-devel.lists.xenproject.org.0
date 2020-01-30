Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B640C14DCE0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixAu7-0001UO-SE; Thu, 30 Jan 2020 14:34:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Eky=3T=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1ixAu6-0001UI-Oi
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:34:46 +0000
X-Inumbo-ID: a8ff491c-436d-11ea-8396-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8ff491c-436d-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 14:34:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q8so3619670ljb.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2020 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=k3C+MibcxhxF2QaxstcPN06TyJ+jfe4Ya1kNE8PNGWE=;
 b=Q1e7DKYvWD62XaBRF9BoqiWukiXPtYEXwvn28CRAjXISorpJBZR63/zsAKv756QMSa
 B83LNizgF/kSwRutx2Mz7lkpzikkZByja5QjgF0TfOAVaP/3uMZ93CK1X8yUSykD/Mjv
 O9FCRJEfYn0bN7xU/J8Jf2CBKRmDynJjwLrfxrijCATC3BjZ4bsvZBDQUGhc/Hv20gwu
 DRqXsOpu1dAwoLBIaWGlFbyJ958p3bldKwKjCIexy4wqUNjVWM1NOW9cuIu3m5UG92TB
 5u4MtIvRmN4XuVhNJWfWanQh4Yq2C5OPO9dSYNAgm8K3iSAsr0KxaZ65Su1VQXZWQIql
 pEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=k3C+MibcxhxF2QaxstcPN06TyJ+jfe4Ya1kNE8PNGWE=;
 b=ocIrJ5hp+arzYfz3BYX8KRJ7Kr/ETz1NdEoqYe4H2imgT5Epi9vDRLOnAgQyCSqrAZ
 XgQF8L/e7IuFrFM9sHj+Cj/806a4T6/Y8SMcJ3sp2cJNP7rEDId4f0FlNcmmGES2bIal
 d0wunpcFTUTEjozbZ7TYUvUelHowPte8XMn1j3YmHoupghDGpRkVOTh6KTg+Za+hCdkQ
 +Mdwz/Chx2AjzJPD/mDUjrOn5yGXRQSJ1VKCx+jIhnZAxSVHcdjTKbSEsQUnqxY5s/5j
 ILoz/QydV5esd5rzVEaDzOHSV2hkyEr+CoEr4OMwcSovN2OVnKzkRnWrj5+vcuSJfR3o
 P2dQ==
X-Gm-Message-State: APjAAAVn0SCEYT9ERK/SU7Av+6IBFpd0UIJ7F3eVgnJR1o6Xc6tik6uf
 OyU0d7LXmEEvrkvRXsfqSEk=
X-Google-Smtp-Source: APXvYqyrN9pT2U44HS7rm+y7RqS9BYHwuuM/CqdPpgTxz96+5xPKmrXeI4PKOrgFzuvOyjVm6szXug==
X-Received: by 2002:a2e:96c4:: with SMTP id d4mr3060253ljj.225.1580394884891; 
 Thu, 30 Jan 2020 06:34:44 -0800 (PST)
Received: from [10.17.84.46] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n1sm2909024lfq.16.2020.01.30.06.34.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jan 2020 06:34:44 -0800 (PST)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
 <874kwep7pe.fsf@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b3cf0ae9-d9ea-5a8a-0f2d-36f158aa680b@gmail.com>
Date: Thu, 30 Jan 2020 16:34:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <874kwep7pe.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu/arm: Don't allow the same micro-TLB
 to be shared between domains
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gSGkgT2xla3NhbmRyLAoKSGkgVm9sb2R5bXlyCgoKPj4gQEAgLTQzNCwxOSArNDM1LDQ1IEBA
IHN0YXRpYyB2b2lkIGlwbW11X3RsYl9pbnZhbGlkYXRlKHN0cnVjdCBpcG1tdV92bXNhX2RvbWFp
biAqZG9tYWluKQo+PiAgIH0KPj4gICAKPj4gICAvKiBFbmFibGUgTU1VIHRyYW5zbGF0aW9uIGZv
ciB0aGUgbWljcm8tVExCLiAqLwo+PiAtc3RhdGljIHZvaWQgaXBtbXVfdXRsYl9lbmFibGUoc3Ry
dWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgdXRsYikKPj4gK3N0YXRpYyBpbnQgaXBtbXVfdXRsYl9lbmFi
bGUoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCB1dGxiKQo+PiAgIHsKPj4gICAgICAgc3RydWN0IGlw
bW11X3Ztc2FfZGV2aWNlICptbXUgPSBkb21haW4tPm1tdTsKPj4gKyAgICB1aW50MzJfdCBkYXRh
Owo+IEp1c3Qgbml0cGlja2luZzogSSBiZWxpZXZlLCB0aGF0ICJpbXVjdHIiIGlzIGJldHRlciBu
YW1lIHRoYW4gImRhdGEiLgoKQWdyZWUsIHdpbGwgcmVuYW1lCgoKPgo+PiArCj4+ICsgICAgLyoK
Pj4gKyAgICAgKiBXZSBuZWVkIHRvIHByZXZlbnQgdGhlIHVzZSBjYXNlcyB3aGVyZSBkZXZpY2Vz
IHdoaWNoIHVzZSB0aGUgc2FtZQo+PiArICAgICAqIG1pY3JvLVRMQiBhcmUgYXNzaWduZWQgdG8g
ZGlmZmVyZW50IFhlbiBkb21haW5zIChtaWNyby1UTEIgY2Fubm90IGJlCj4+ICsgICAgICogc2hh
cmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMsIHNpbmNlIGl0IHBvaW50cyB0byB0aGUg
Y29udGV4dCBiYW5rCj4+ICsgICAgICogdG8gdXNlIGZvciB0aGUgcGFnZSB3YWxrKS4KPj4gKyAg
ICAgKiBBcyBlYWNoIFhlbiBkb21haW4gdXNlcyBpbmRpdmlkdWFsIGNvbnRleHQgYmFuayBwb2lu
dGVkIGJ5IGNvbnRleHRfaWQsCj4+ICsgICAgICogd2UgY2FuIHBvdGVudGlhbGx5IHJlY29nbml6
ZSB0aGF0IHVzZSBjYXNlIGJ5IGNvbXBhcmluZyBjdXJyZW50IGFuZCBuZXcKPj4gKyAgICAgKiBj
b250ZXh0X2lkIGZvciBhbHJlYWR5IGVuYWJsZWQgbWljcm8tVExCIGFuZCBwcmV2ZW50IGRpZmZl
cmVudCBjb250ZXh0Cj4+ICsgICAgICogYmFuayBmcm9tIGJlaW5nIHNldC4KPj4gKyAgICAgKi8K
Pj4gKyAgICBkYXRhID0gaXBtbXVfcmVhZChtbXUsIElNVUNUUih1dGxiKSk7Cj4gSSBjYW4gc2Vl
IHRoYXQgdGhpcyBjb2RlIGlzIG5vdCBjb3ZlcmVkIGJ5IHNwaW5sb2NrLiBTbywgSSBiZWxpZXZl
LAo+IHRoZXJlIGNhbiBiZSBhIHJhY2UgY29tZGl0aW9uLCB3aGVuIHRoaXMgcmVnaXN0ZXIgaXMg
YmVpbmcgcmVhZCBvbiB0d28KPiBDUFVzIHNpbXVsdGFuZW91c2x5LgoKSSBkb24ndCB0aGluaywg
aXBtbXVfYXNzaWduKGRlYXNzaWduKV9kZXZpY2UgY2FsbGJhY2tzIHRha2UgYSBzcGlubG9jaywg
CnNvIHRoZSBtaWNyby1UTEIgbWFuYWdlbWVudCByb3V0aW5lcyBpbnNpZGUKYXJlIHByb3RlY3Rl
ZC4KCgo+ICAgCj4gICAvKiBEaXNhYmxlIE1NVSB0cmFuc2xhdGlvbiBmb3IgdGhlIG1pY3JvLVRM
Qi4gKi8KPiBAQCAtNjcxLDcgKzY5OCwxMiBAQCBzdGF0aWMgaW50IGlwbW11X2F0dGFjaF9kZXZp
Y2Uoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4gICAgICAgICAgIGRldl9pbmZv
KGRldiwgIlJldXNpbmcgSVBNTVUgY29udGV4dCAldVxuIiwgZG9tYWluLT5jb250ZXh0X2lkKTsK
PiAgIAo+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgZndzcGVjLT5udW1faWRzOyArK2kgKQo+IC0g
ICAgICAgIGlwbW11X3V0bGJfZW5hYmxlKGRvbWFpbiwgZndzcGVjLT5pZHNbaV0pOwo+ICsgICAg
ewo+ICsgICAgICAgIGludCByZXQgPSBpcG1tdV91dGxiX2VuYWJsZShkb21haW4sIGZ3c3BlYy0+
aWRzW2ldKTsKPiArCj4gKyAgICAgICAgaWYgKCByZXQgKQo+ICsgICAgICAgICAgICByZXR1cm4g
cmV0Owo+IEkgY2FuJ3Qgc2VlIGVycm9yIHBhdGggd2hlcmUgaXBtbXVfdXRsYl9kaXNhYmxlKCkg
d291bGQgYmUgY2FsbGVkIGZvcgo+IGFscmVhZHkgZW5hYmxlIHVUTEJzLiBJcyB0aGlzIG5vcm1h
bD8KCkdvb2QgcXVlc3Rpb24uIEluZGVlZCwgd2UgbmVlZCB0byByZXN0b3JlIHByZXZpb3VzIHN0
YXRlIGluIGNhc2Ugb2YgZXJyb3IuCgoKSSB3aWxsIGFkZCB0aGUgZm9sbG93aW5nOgoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgCmIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwppbmRleCBjMjFkMmQ3Li40MTFmYzBm
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCisr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKQEAgLTcwMiw3ICs3
MDIsMTIgQEAgc3RhdGljIGludCBpcG1tdV9hdHRhY2hfZGV2aWNlKHN0cnVjdCAKaXBtbXVfdm1z
YV9kb21haW4gKmRvbWFpbiwKIMKgwqDCoMKgwqDCoMKgwqAgaW50IHJldCA9IGlwbW11X3V0bGJf
ZW5hYmxlKGRvbWFpbiwgZndzcGVjLT5pZHNbaV0pOwoKIMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBy
ZXQgKQorwqDCoMKgwqDCoMKgwqAgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aGlsZSAoIGkt
LSApCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXBtbXVfdXRsYl9kaXNhYmxlKGRv
bWFpbiwgZndzcGVjLT5pZHNbaV0pOworCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKK8KgwqDCoMKgwqDCoMKgIH0KIMKgwqDCoMKgIH0KCiDCoMKgwqDCoCByZXR1cm4gMDsK
CgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
