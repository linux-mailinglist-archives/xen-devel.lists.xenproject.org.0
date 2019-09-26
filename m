Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E247DBF5B9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVUz-0006fV-KD; Thu, 26 Sep 2019 15:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDVUy-0006fN-AW
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:16:04 +0000
X-Inumbo-ID: 8db63ff4-e070-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 8db63ff4-e070-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 15:16:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q64so2558853ljb.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 08:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=qsuzdrWogScaXuO7WJ81PNYroD9+U8pVk1feHrn9hu8=;
 b=kUiUxzA534Cf0XL7MAqj1xBQr1raIeSdJdPoX8y+XI0fiKBw0sD63Vp6J9F8l4P6sn
 Tw5pMyjKCB6Md5A49kTQlYHOvTNo23c/7O58PZvazGPb+MjUAOThIOyRprhzyhx0Mb89
 edJH8QoPTbQqUIXfEtD9ebFfnLX3ZrTPFNeoCSnhkCX4fY9b1cJSRhCaKuRhR3XsmXDV
 idnfW3hval0fXRPpQOBygfeRddNPiFvd3RjnDSAZmOdY8yoyJqxRdZLR5R/6TWSVkVPS
 /cXpef6+YB8HbxE1KcwZiaSkRLAEKyBPUAaMXZSwzMUtS9Fzgk6C2Rc+9Te+/sdorR4+
 ea0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qsuzdrWogScaXuO7WJ81PNYroD9+U8pVk1feHrn9hu8=;
 b=Kb5T3iA8+B/9GX5BXPg7PUCDdvjTVRNalPM2kqpa00DWZY9Qps7pxiwdqnABj1L//1
 Dd5cQopK4dgRt8SfPSLdQBEdOHQn7luteIRrl1hT5AtO3ZsJRwxiTYzXR4MMuktb7Hg0
 UJLqfhAdfTZbNetKXQ+3SvRg1HepgiA1O7wicpqtyo/JjZnN1xNuAIIukSFebNTRW+ZN
 EbJOyxyLmMiV5nLuO8Z7BcNFkgjbnHyBO1NhapVLeWMUk8Dbjk93JDXuY55+sSvYB/qA
 ggC87LDVczMc7VGhHzaZlBtg6agflBmyOTTEm+sSFLHwo/vFYHILi+CgX3c6TavL0Nhi
 mpzQ==
X-Gm-Message-State: APjAAAVaPZrP86Cf0djgHxFkfZZq6LBzHlbFaMuhr6xYO917QPDXrIuT
 YUcTQtr+TQr5h/jRye3J6qM=
X-Google-Smtp-Source: APXvYqxdBnQ9lLPjtKaA/Jgfrkw7erg4m0tAy7teejuqFas+9Qui5WSLuAEJ8tSBZRNwyKmjlxfLlw==
X-Received: by 2002:a2e:91cf:: with SMTP id u15mr2945251ljg.184.1569510962524; 
 Thu, 26 Sep 2019 08:16:02 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id f22sm572269lfk.56.2019.09.26.08.16.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 08:16:02 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
Date: Thu, 26 Sep 2019 18:16:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA5LjE5IDE3OjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOS8yNi8xOSAxMjoyMCBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+
IE9sZWtzYW5kciBUeXNoY2hlbmtvICg4KToKPj4gwqDCoCBpb21tdS9hcm06IEFkZCBpb21tdV9o
ZWxwZXJzLmMgZmlsZSB0byBrZWVwIGNvbW1vbiBmb3IgSU9NTVVzIHN0dWZmCj4+IMKgwqAgaW9t
bXUvYXJtOiBBZGQgYWJpbGl0eSB0byBoYW5kbGUgZGVmZXJyZWQgcHJvYmluZyByZXF1ZXN0Cj4+
IMKgwqAgeGVuL2NvbW1vbjogSW50cm9kdWNlIF94cmVhbGxvYyBmdW5jdGlvbgo+PiDCoMKgIHhl
bi9jb21tb246IEludHJvZHVjZSB4cmVhbGxvY19mbGV4X3N0cnVjdCgpIGhlbHBlciBtYWNyb3MK
Pj4gwqDCoCBpb21tdS9hcm06IEFkZCBsaWdodHdlaWdodCBpb21tdV9md3NwZWMgc3VwcG9ydAo+
PiDCoMKgIGlvbW11OiBPcmRlciB0aGUgaGVhZGVycyBhbHBoYWJldGljYWxseSBpbiBkZXZpY2Vf
dHJlZS5jCj4+IMKgwqAgaW9tbXUvYXJtOiBJbnRyb2R1Y2UgaW9tbXVfYWRkX2R0X2RldmljZSBB
UEkKPj4gwqDCoCBpb21tdS9hcm06IEFkZCBSZW5lc2FzIElQTU1VLVZNU0Egc3VwcG9ydAo+Cj4g
VGhpcyBzZXJpZXMgaXMgbm93IG1lcmdlZC4KClRoYW5rIHlvdSEKCgpKdWxpZW4sIHdoYXQgZG8g
eW91IHRoaW5rIHJlZ2FyZGluZyB0aGUgZm9sbG93aW5nOgoKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAyMzA0Lmh0bWwKCnRo
aXMgb25lIGlzIGludGVuZGVkIHRvIGFkZHJlc3MgInRoZSBtYWluIFRPRE8iIGluIHRoZSBJUE1N
VS1WTVNBIGRyaXZlciAKYW5kIGl0IHdvdWxkIGJlIHJlYWxseSBuaWNlIGlmCgppdCBjb3VsZCBn
byBpbiB0b28uLi4gKEkgd2lsbCBiZSBhYmxlIHRvIHJlc29sdmUgYW55IGlzc3VlcyB3aXRoIGl0
IAp0b2RheS90b21vcnJvdyBpZiBzdGlsbCBwcmVzZW50KQoKCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
