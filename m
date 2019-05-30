Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EC3000B
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 18:16:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWNhR-0005bh-3y; Thu, 30 May 2019 16:14:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNhO-0005at-OU
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:14:38 +0000
X-Inumbo-ID: 04a40bc2-82f6-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 04a40bc2-82f6-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 16:14:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q16so6622286ljj.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=63Uq8BS7Nsa+XCQhXnjHoypOfh+NTNAcP86FUTKc8Zg=;
 b=a9bmXbcJACq98uzFVc/Rucm3ZTd0iwywnJaMNrQSk6DKhA6IbiSu86mYCCXxXf/aE7
 DSY8W8+KUQ5P6aPhftQdf6/TJwAkgMsyYRy0n+CB5jdVRyGrKN1HW0n3b0bG5RFQylCk
 PWkc1QcREcJGbks/SMUedqmYJaq3F+2pDIWs1okZSPFCaxIJxqgF2trJAtcTtl2n2j6s
 FhBjteCxJDLppeCoc7RpqPZtd0ZtqfnRv+LPVAFu7xgQJ9KWUeMbmimVF2kSHtka9thI
 Fn6inLzYUYcI/cme5Gq1c48prCcrpMBy5VesWQoV8Cv4DNkH6sCdnG6QThM1z3Ah8UWo
 Fldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=63Uq8BS7Nsa+XCQhXnjHoypOfh+NTNAcP86FUTKc8Zg=;
 b=QAtnQA1QmlxZ49yCC5CNCmjIMCGUwmiousUJ+JYY1ttTZaFo7+MWSGMTrcOdiXzT1w
 KMkoblBn9LRhOfJVtZb6cCaf3bGiXspjxWUkty1ZTbMHl77TfL4luAHT8XEWRSEKwF6v
 XjcfhFxVpR/AQqWFBhaYmEOSSP+7ZI1BaQnTXo3ZXGrRfH8FYQpeguRysxeEpJeSyqfW
 7X16unBbNX4G3G4p+q43T17jtkngllHJ/SzNf3g408Td6/ivEci1jQjuCSH+vLvE+2ya
 JNJIUi2uAgv+Z3vGwHITaRmST7KxWXX5Kv+FsteDK9PlGlsyPweSB1ayC1CM3j4j9lOA
 AU7Q==
X-Gm-Message-State: APjAAAVlqV06UHilxH9P6BWxk0pWskikikLLKL6osJ4Yuk3reym4z+5c
 XR6x/2JuHAOVuMuS3KLV51Y=
X-Google-Smtp-Source: APXvYqxfuWKMQ7sNF5mzLCOrOQtLPv7+M2iR04cmTr0BvI28QIeocjoNs8T0mbaeJT1oCv7z6VcynQ==
X-Received: by 2002:a2e:2b58:: with SMTP id q85mr2687230lje.179.1559232875758; 
 Thu, 30 May 2019 09:14:35 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v64sm571612lje.40.2019.05.30.09.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:14:35 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
Date: Thu, 30 May 2019 19:14:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBCVFcsIGRvIHlvdSBo
ZWFyIGFib3V0IHBsYW5zIGZvciB0aGUgbmV3IHZnaWM/IFNvbWUgdGltZSBhZ28gaXQgd2FzIHNh
aWQgdGhhdCBuZXcgdmdpYyBpbXBsZW1lbnRhdGlvbiBnb2luZyB0byByZXBsYWNlIHRoZSBvbGQg
b25lLCBhbmQgb3B0aW1pemluZyB0aGUgb2xkIGlzIHdvcnRobGVzcy4gQnV0IGFzIEkgc2VlLCB0
aGVyZSBhcmUgbm8gdXBkYXRlcyBpbnRvIHRoYXQgYXJlYSB5ZXQuCj4gCj4gV2UgbmVlZCBoZWxw
IHRvIG1ha2UgaXQgaGFwcGVuLgpJJ20gbm90IHN1cmUgSSdsbCBoYXZlIHNwYXJlIHRpbWUgc29v
biwgYnV0IHdoYXQga2luZCBvZiBoZWxwIHlvdSBuZWVkPyBEbyB5b3UgaGF2ZSBhIFRPRE8gbGlz
dD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
