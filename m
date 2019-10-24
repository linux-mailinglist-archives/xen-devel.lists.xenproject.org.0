Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D52E2FAC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:01:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNaol-00067p-3j; Thu, 24 Oct 2019 10:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssR6=YR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iNaoj-00067k-66
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 10:58:09 +0000
X-Inumbo-ID: 2931a544-f64d-11e9-beca-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2931a544-f64d-11e9-beca-bc764e2007e4;
 Thu, 24 Oct 2019 10:58:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id g3so6539489lfb.11
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XcdOZ1Vr8qF+WapdLeHnrKCPQ1fic4DU5DxSK74zpjI=;
 b=ivK0FQgMsoEUg3E2P9KWAI61kpG49E3VOw/r6RV+wBct0r3wwA3Qos8g19A+NsW3Nw
 bbX/kQzWFdkYTpJbDvtYAgRIieayaJwEjWJ9HTbmSHpPpAthjv0OlmNbzT1/lKzP3A/K
 0ZYOvmPuvWp9HgLk1F6+Vk30RpDtkArc+3YAVBBrUaXFb3p7WvKUD+bep327ca/O2AeV
 faI20JkMg/6eHMz8d4CmYBtDXvoBOfItV5VXKsJs8+HVEJYQx9vh2o/zEjbrBx2sMRIs
 PjPeXNh1wAEICgnsPfC3kLCSrN2C0N5zlpuqbiEMEG93IZcp4JAFYPEKu+gEH1Qnbo+S
 0C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XcdOZ1Vr8qF+WapdLeHnrKCPQ1fic4DU5DxSK74zpjI=;
 b=lUxNAQR9iLmZhpt1VTs8ryfzCOGu7dhJ5SxUuERu/JKaHIv/8g1QXNnszE+H5c5LV0
 9Y4EWnj/k6eiCgrIrCjlN3if5LOS3OXtUubk9yTYAUMfmmqg/RLRwKlTaKnZNiBNscOX
 f583txBi6KHKmeKNEr+4+IyDvunVkCcW1ZvfTRVPyFuWqPnE8uzLDQTGUNx00T21gTxc
 r12sIHuCib4iL/xUR+XGBhKkfh8aV9stb1czb/bTPJm0+AfK1TrZpMjuKVNdhwENw22N
 Sk1VHCX+hdk9g4g696TNu+YmSZQpug2zRuf3qRi4w7AfFEYGQ1ti9Kk1olmMJNnbvS37
 gEQA==
X-Gm-Message-State: APjAAAUPnpmJUjOMtHUPiKqOBK4T4ISwwGQ9vnGEykhkx0V4edqFTaS3
 tEP0+ddrFx0/HZdB3x74DW0=
X-Google-Smtp-Source: APXvYqwbRzLhMp/GcKvz9s1YqbjRbvmPk/y099s1w3mj36IjRuayljt6kUWphKUp9DVECQjgWePeRg==
X-Received: by 2002:ac2:43c2:: with SMTP id u2mr6183514lfl.61.1571914687074;
 Thu, 24 Oct 2019 03:58:07 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id p88sm4664843ljp.13.2019.10.24.03.58.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 03:58:06 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien.grall@arm.com>
References: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
 <eea875c2-5d6e-5a49-b1c5-1248d447edbb@arm.com>
 <a0e71d6d-eeda-8f69-d4fb-ea6cf6ee49d7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <00c942ce-cfe4-d181-ff28-e698cda17c34@gmail.com>
Date: Thu, 24 Oct 2019 13:58:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a0e71d6d-eeda-8f69-d4fb-ea6cf6ee49d7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI0LjEwLjE5IDEyOjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDI0LjEwLjE5IDEw
OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIE9sZWtzYW5kciwKPj4KPj4gT24gMTAvMTYv
MTkgMTE6MDggQU0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4gRnJvbTogT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IFdl
IGFsd2F5cyBza2lwIHRoZSBJT01NVSBkZXZpY2Ugd2hlbiBjcmVhdGluZyBEVCBmb3IgaHdkb20g
aWYgdGhlcmUgaXMKPj4+IGFuIGFwcHJvcHJpYXRlIGRyaXZlciBmb3IgaXQgaW4gWGVuIChkZXZp
Y2VfZ2V0X2NsYXNzKGlvbW11X25vZGUpCj4+PiByZXR1cm5zIERFVklDRV9JT01NVSkuIFNvLCBl
dmVuIGlmIGl0IGlzIG5vdCB1c2VkIGJ5IFhlbiBpdCB3aWxsIGJlIAo+Pj4gc2tpcHBlZC4KPj4+
Cj4+PiBXZSBzaG91bGQgYWxzbyBza2lwIHRoZSBJT01NVSBzcGVjaWZpYyBwcm9wZXJ0aWVzIG9m
IHRoZSBtYXN0ZXIgZGV2aWNlCj4+PiBiZWhpbmQgdGhhdCBJT01NVSBpbiBvcmRlciB0byBhdm9p
ZCBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIElPTU1VCj4+PiBiaW5kaW5ncyB0byBod2RvbS4K
Pj4+Cj4+PiBBY2NvcmRpbmcgdG8gdGhlIExpbnV4J3MgZG9jczoKPj4+IDEuIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50eHQKPj4+IDIuIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlvbW11LnR4dAo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4KPj4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+
Cj4+IEBKdWVyZ2VuOiB3aGlsZSB0aGUgZHJpdmVyIHJlbHlpbmcgb24gdGhvc2UgYmluZGluZ3Mg
aXMgZXhwZXJpbWVudGFsIAo+PiBmb3IgWGVuIDQuMTMsIGl0IHdvdWxkIGJlIGdvb2QgdG8gYXZv
aWQgZXhwb3NpbmcgaGFsZiB0aGUgYmluZGluZ3Mgb2YgCj4+IElPTU1VLgo+Pgo+PiBUaGUgYmlu
ZGluZ3MgYXJlIGdlbmVyaWMgYnV0IGl0IGlzIG5vdCB1c2VkIGJ5IHRoZSBTTU1VIGRyaXZlciB5
ZXQgCj4+IGFuZCB0aGVyZWZvcmUgc2hvdWxkIG5vdCBhZmZlY3QgcGxhdGZvcm0gdXNpbmcgU01N
VXMuCj4KPiBUaGFua3MgZm9yIHRoZSBiYWNrZ3JvdW5kIGluZm8uIFdpdGggdGhhdDoKPgo+IFJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+Cj4gSnVl
cmdlbgoKR3JlYXQsCgpJIHRoYW5rIHlvdSBhbGwuCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIg
VHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
