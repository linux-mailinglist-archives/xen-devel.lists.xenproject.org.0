Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08D14A37
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd3M-0007ig-5S; Mon, 06 May 2019 12:49:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3K-0007hn-Gv
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:06 +0000
X-Inumbo-ID: 548b6891-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 548b6891-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:49:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y10so2360316lfl.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=soGcENGufaeHi3wR1V9wUkDxGaivtzUYb5T0R+bvA+E=;
 b=l1ipU+4+c309CgW+IMm1o6dQLfkDr6vJE9smz9omX+nAy4QmGhBrkQtFeabq9pj22H
 yJDvV/XwoA3cHbCxA7WMhNJOALKuh4gpjUyox3nb8s7qQMTAxpwb6nsPYFLZLqMKGRm/
 /+3aR9KPbIlsKnlEml58WXlW5Qa25VdltCQ1ZPgOAFKB/hSdBdKntbcXzMGe746zhgGp
 jLqhdNjQEraaI7dC4IMOAXuPwFtu0lYIr0xHsGYx9Tta1Rjp4sBaiWfViJvkUf9/pv+U
 WDZPjVrKoG+4kQoG82eJK7TBV/WxmeGqiBTn9pNbZyuCMBup/XmJjTj7J5P+c81N9q/A
 wVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soGcENGufaeHi3wR1V9wUkDxGaivtzUYb5T0R+bvA+E=;
 b=M34wThke7I/NlrzEZp0bTdIJ0qxKIQ+ADJ6KaiqKsNG+M1iVQy6SY2PXO+pLTR7MBV
 o4+4ifLb97oeecSpo4h+clhwxX9WAr1j9D/G9dXmYXNi8uhlLwbYTi5/AZdfx8kHrYPI
 uDB3xhCrao68chWeMLcSr3k0g7svYUsf+E5GNvFOQRA9wb36KqoZ1Wzj8SDM5twfGuWo
 ItQAOCQWRI0uZPlwG8GRCvV4wmB2Z8tpkTA81OfndprrhKb7aDplMtnvWeXRL7Zg6x9P
 Z61/7w2UYKWISIA4JxWV1lPt+Cx5Td5XAiLcRG2Ly+a6wvkzrM/UsU/nW9FPSVqBpxih
 yX6A==
X-Gm-Message-State: APjAAAWc8TTc0NWkaD2vlZHqizQHEOq4PM7R48xMYbJgcQPTsvntxpVF
 s2DNxJh11OHc948S1GfFBjPSFeW8VOo=
X-Google-Smtp-Source: APXvYqwLeirwqpk57kkYyR0ptxjooh/3eaGG/yk8i60uDbxChlcRJU9tCow4LOpjwJaymlsA9sf6zw==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr12292299lfl.68.1557146944236; 
 Mon, 06 May 2019 05:49:04 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 k2sm2287397ljg.6.2019.05.06.05.49.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:49:03 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-11-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3aa4cb6e-506b-cf93-9b2a-493a64fd3704@gmail.com>
Date: Mon, 6 May 2019 15:49:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-11-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/12] xen/arm: mm: Rework Xen page-tables
 walk during update
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgeGVu
X3B0X3VwZGF0ZV9lbnRyeSgpIGlzIG9ubHkgYWJsZSB0byB1cGRhdGUgdGhlIHJlZ2lvbiBjb3Zl
cmVkCj4gYnkgeGVuX3NlY29uZCAoaS5lIDAgdG8gMHg3ZmZmZmZmZikuCj4gCj4gQmVjYXVzZSBv
ZiB0aGUgcmVzdHJpY3Rpb24gd2UgZW5kIHRvIGhhdmUgbXVsdGlwbGUgZnVuY3Rpb25zIGluIG1t
LmMKPiBtb2RpZnlpbmcgdGhlIHBhZ2UtdGFibGVzIGRpZmZlcmVudGx5Lgo+IAo+IEZ1cnRoZXJt
b3JlLCB3ZSBuZXZlciB3YWxrZWQgdGhlIHBhZ2UtdGFibGVzIGZ1bGx5LiBUaGlzIG1lYW5zIHRo
YXQgYW55Cj4gY2hhbmdlIGluIHRoZSBsYXlvdXQgbWF5IHJlcXVpcmVzIG1ham9yIHJld3JpdGUg
b2YgdGhlIHBhZ2UtdGFibGVzIGNvZGUuCj4gCj4gTGFzdGx5LCB3ZSBoYXZlIGJlZW4gcXVpdGUg
bHVja3kgdGhhdCBubyBvbmUgZXZlciB0cmllZCB0byBwYXNzIGFuIGFkZHJlc3MKPiBvdXRzaWRl
IHRoaXMgcmFuZ2UgYmVjYXVzZSBpdCB3b3VsZCBoYXZlIGJsb3duLXVwLgo+IAo+IHhlbl9wdF91
cGRhdGVfZW50cnkoKSBpcyByZXdvcmtlZCB0byB3YWxrIG92ZXIgdGhlIHBhZ2UtdGFibGVzIGV2
ZXJ5Cj4gdGltZS4gVGhlIGxvZ2ljIGhhcyBiZWVuIGJvcnJvd2VkIGZyb20gYXJjaC9hcm0vcDJt
LmMgYW5kIGNvbnRhaW4gc29tZQo+IGxpbWl0YXRpb25zIGZvciB0aGUgdGltZSBiZWluZzoKPiAg
ICAgIC0gU3VwZXJwYWdlIGNhbm5vdCBiZSBzaGF0dGVyZWQKPiAgICAgIC0gT25seSBsZXZlbCAz
IChpLmUgNEtCKSBjYW4gYmUgZG9uZQo+IAo+IE5vdGUgdGhhdCB0aGUgcGFyYW1ldGVyICdhZGRy
JyBoYXMgYmVlbiByZW5hbWVkIHRvICd2aXJ0JyB0byBtYWtlIGNsZWFyCj4gd2UgYXJlIGRlYWxp
bmcgd2l0aCBhIHZpcnR1YWwgYWRkcmVzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlz
b3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
