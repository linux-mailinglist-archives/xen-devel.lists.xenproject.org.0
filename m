Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C49B8E11
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 11:53:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBFZk-00058C-VG; Fri, 20 Sep 2019 09:51:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5Xb=XP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iBFZj-000582-0d
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 09:51:39 +0000
X-Inumbo-ID: 3cf57190-db8c-11e9-b76c-bc764e2007e4
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cf57190-db8c-11e9-b76c-bc764e2007e4;
 Fri, 20 Sep 2019 09:51:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id 72so4602252lfh.6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2019 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NQ8R0UFg+RzOjH0dXf4eI264VeMlMPrfsuwTBUGRL7g=;
 b=ub7VI3jotGoVEMB030bEEVMGES05YuBZ1rVQDcR94mtN0+oKS3NpTBTIkucmKvAJ+T
 w/cJaa1/naP4krhFI090AREn2sKL884aPj1MF2VeZ6/Sa2s9cc/OiACHoGQkGHo7MEPv
 BVDr55ANlQbR2zve3IvLIpWMEDw4y3+I0R65trIm8t5zOvjz4BdpuU7QuDDM+p73oGug
 Fd6sR7xQEsNEF6i+ay/Yzd76wSx5ND9OMzlfSE2AtyQoRoDDpZ5yGQ3ItOP7btB3pFrb
 MvQ1lnFTSrc6FVeGTFlfrwnxooQ/ErBam4TQ44f99nDeEIYDwPUD1hpha/5lQAcvxmgD
 G+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NQ8R0UFg+RzOjH0dXf4eI264VeMlMPrfsuwTBUGRL7g=;
 b=stKqdQH2VM2ZpUAVb61+g0DDNRz1nobSwfHrcyJN8JVHPdqOOTJXwowoy5+jJOELGG
 68wezEesxo8a5qMG4kFeuwb5Huc9Da7QmN+CI7xQpQUcnKEcseLSSC5stiY1JKp4946b
 fdwWrtRyht2shySDtNlxZfkbU+hsebGA2M5+CXITv/GgiF0kkJSsNwiH5sWpxCKsNUnU
 29rAIkA6fySkEvV+hTDNp2ygJcrOXqoPy/ECB5JIrVBOVMa0iK3Nmzv7dYrBKlPzGTsA
 ceCKNHoOzy8mzOwUJ3O4O9DLWCkaT7D4BJr4qnMyF9V5s9EotKrL53v8VrpTp4TPxTjV
 t8QQ==
X-Gm-Message-State: APjAAAWadpcyvxGh7Rxdzs8zcag+Kp3TBvs+61i/Ip+9df8Hxkvfd1li
 LnLjst2MNXTEkmLcDT85zMo=
X-Google-Smtp-Source: APXvYqxQYluiaoHormALN5PWUGFcw48T/9jIUr7YkyPDruAqJi8LwU0UCexP7nD1TwS/ibypr5jDIQ==
X-Received: by 2002:ac2:44d2:: with SMTP id d18mr8527944lfm.67.1568973097165; 
 Fri, 20 Sep 2019 02:51:37 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id p22sm319014ljp.69.2019.09.20.02.51.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 02:51:36 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
 <e27f519a-465f-58b9-b517-67c23cb85444@suse.com>
 <79a765a6-c3be-bb52-611d-ceddc3837a22@gmail.com>
Message-ID: <2bc775b5-fa9a-c4e7-8183-0f961a89c30f@gmail.com>
Date: Fri, 20 Sep 2019 12:51:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <79a765a6-c3be-bb52-611d-ceddc3837a22@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEphbgoKCj4KPj4gT24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCj4+PiArKysgYi94ZW4v
aW5jbHVkZS94ZW4veG1hbGxvYy5oCj4+PiBAQCAtMzUsNiArMzUsMTUgQEAKPj4+IMKgICNkZWZp
bmUgeHphbGxvY19hcnJheShfdHlwZSwgX251bSkgXAo+Pj4gwqDCoMKgwqDCoCAoKF90eXBlICop
X3h6YWxsb2NfYXJyYXkoc2l6ZW9mKF90eXBlKSwgX19hbGlnbm9mX18oX3R5cGUpLCAKPj4+IF9u
dW0pKQo+Pj4gwqAgKy8qIEFsbG9jYXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxl
eGlibGUgYXJyYXkgb2YgdHlwZWQgCj4+PiBvYmplY3RzLiAqLwo+Pj4gKyNkZWZpbmUgeG1hbGxv
Y19mbGV4X3N0cnVjdCh0eXBlLCBmaWVsZCwgbnIpIFwKPj4+ICvCoMKgwqAgKHR5cGUgKilfeG1h
bGxvYyhvZmZzZXRvZih0eXBlLCBmaWVsZFtucl0pLCBfX2FsaWdub2ZfXyh0eXBlKSkKPj4+ICsK
Pj4+ICsvKiBSZS1hbGxvY2F0ZSBzcGFjZSBmb3IgYSBzdHJ1Y3R1cmUgd2l0aCBhIGZsZXhpYmxl
IGFycmF5IG9mIHR5cGVkIAo+Pj4gb2JqZWN0cy4gKi8KPj4+ICsjZGVmaW5lIHhyZWFsbG9jX2Zs
ZXhfc3RydWN0KHB0ciwgZmllbGQsIAo+Pj4gbnIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gK8KgwqDCoCAodHlwZW9mKHB0cikpX3hyZWFs
bG9jKHB0ciwgb2Zmc2V0b2YodHlwZW9mKCoocHRyKSksIAo+Pj4gZmllbGRbbnJdKSzCoCBcCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBf
X2FsaWdub2ZfXyh0eXBlb2YoKihwdHIpKSkpCj4+IFdpdGggdGhlIG1pc3NpbmcgcGFyZW50aGVz
ZXMgYXJvdW5kIHRoZSBlbnRpcmUgY29uc3RydWN0cyBhZGRlZAo+PiBSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gVGhhbmsgeW91LgoKCldvdWxkIHlvdSBi
ZSBoYXBweSBpZiBJIGFkZCB4emFsbG9jX2ZsZXhfc3RydWN0IGhlcmUgYXMgd2VsbCAobWF5IEkg
CnJldGFpbiB5b3VyIFItYik/CgpBY3R1YWxseSB0aGUgeHphbGxvY19mbGV4X3N0cnVjdCBiZXR0
ZXIgZml0cyBpbiBbMV0gLi4uCgoKWzFdIApodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3hl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2c1NTU1Ny5odG1sCgoKLS0gClJlZ2FyZHMs
CgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
