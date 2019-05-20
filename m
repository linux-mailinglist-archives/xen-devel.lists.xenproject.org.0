Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA0238C8
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:52:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSiec-0002s9-Qf; Mon, 20 May 2019 13:48:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ag2u=TU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hSieb-0002s4-93
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:48:37 +0000
X-Inumbo-ID: f62ed503-7b05-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f62ed503-7b05-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 13:48:35 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y13so10356052lfh.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8wkabDjM0Ka7S8unhgT4FeYzJNIkr2Fq6gOkgiCy0iQ=;
 b=qkpInNoNepbXCo63xHjwjC/5sMq6+pjjiRrXlvNMznTxbw3i51l+CU14N3ecYpTCz8
 Q03Bu4e+EEpXpatv/w6Q21l7o3GQ25hTtWR40d4ZcZtsGzBdTTnsZd74lvX41L9cEo+j
 kF3TBVK5ws3Zwq6wbWcek9jS54jiIr0F9nlw/eQYiQwFd8ufqQurVFsRJCtHFxRgvWaY
 B0dwWgPLTaIqjZubFZOXX8nxVllKWA3ULw3EXwBy+k9CvzqAC3+JwTjvvi86yYD1VM2Z
 dmefuEw/EO0UlUyduBBThJiM2M4iyo9uGMmQAZRpijpWijoLtGmOZCnwqf90GIf+jjKb
 zl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8wkabDjM0Ka7S8unhgT4FeYzJNIkr2Fq6gOkgiCy0iQ=;
 b=EQoZou7nH2jwa5ZbYkp6LErGDoF+27WxSWtjuro4X6JqbH0AcEOPBq/GrDMNd/BH94
 Lt20TfE900XGexUSTYYaeIC4/7u9DA33By/nFescwxqQ2ZAm8Fhjx3fI5MxBMoK+PyHB
 x8jI7K8hyu0UkRULIYJeOpIGjXLgA7pNxeSeG1iFaAQ45jNs/f3DIrGFLdCAxoln7EkI
 O21NW53w5AcBlxMoAwXq9Pv3oVIOJjnh3Zv7HPI1rtscbQnSYEWWxAxqW+oJ7Hk9yMoK
 zMyf/QXEev5YQ9dnlsH8BmKpVwziuUpb/okR8VJmK7fOlsqjpCgGMZfjpDUww4i7XHtk
 TkQg==
X-Gm-Message-State: APjAAAUGewdoh9HsspB4XJPLgw/qwwwQWfu8fGydR17OouUXuI4lXeiu
 n7dFUWSDSKanoWYdKZgxj2c=
X-Google-Smtp-Source: APXvYqy1ndkk9b+WMzoSwhg8mFDXY1+kXQtMvyAXdG83mstLSvWNXRPDIJ07K3dGNDk5BO6jhjvYfA==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr37270692lfm.133.1558360114162; 
 Mon, 20 May 2019 06:48:34 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id n196sm2545005lfn.18.2019.05.20.06.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 06:48:33 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-2-git-send-email-olekstysh@gmail.com>
 <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6534c5d0-1164-4076-f22f-6a820eff9c46@gmail.com>
Date: Mon, 20 May 2019 16:48:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ce325872-a19e-2d07-ca88-cd3f0b1bd933@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwLjA1LjE5IDE0OjAzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+IE9uIDAyLzA1LzIwMTkgMTU6MTMsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4+Cj4+IFBvcnQgTGludXggaGVscGVyIG9mX2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzIGZv
ciBjb3VudGluZwo+PiBudW1iZXIgb2YgcGhhbmRsZXMgaW4gYSBwcm9wZXJ0eS4KPgo+IExpbnV4
IDUuMSB1c2VzIGEgY29tcGxldGVseSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24gZm9yIAo+IG9m
X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzLiBTbyB3aGljaCB2ZXJzaW9uIG9mIExpbnV4IGRpZCB5
b3UgcG9ydCBmcm9tPwoKVGhpcyBwYXRjaCBpcyBleGFjdGx5IHRoZSBzYW1lIG9uZSBbMV0sIEkg
ZGlkIG1vcmUgdGhhbiAyIHllYXJzIGFnbyBpbiAKdGhlIGNvbnRleHQgb2Ygbm9uLXNoYXJlZCBJ
T01NVSBwYXRjaCBzZXJpZXMuIExpa2VseSwgSSB3YXMgYmFzZWQgb24gdjQuNC4KClNvcnJ5IGZv
ciB0aGUgY29uZnVzaW5nIGRlc2NyaXB0aW9uLgoKCllvdSBhcmUgcmlnaHQsIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gb2ZfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MgaXMgCmNvbXBsZXRlbHkgZGlm
ZmVyZW50LCBhbmQgSSBhbSBhZnJhaWQsIGlzIG5vdCBlYXNpbHkgYmFjay1wb3J0YWJsZSB0byBY
ZW4uCgpJZiB0aGUgaW1wbGVtZW50YXRpb24gInY0LjQiIGxvb2tzIGNvcnJlY3QgYW5kIGZpdHMg
aW4gY3VycmVudCBYZW4gCmNvZGViYXNlLCBJIGNhbiByZWNvbGxlY3QgYW4gZXhhY3QgdmVyc2lv
biBhbmQgdXBkYXRlIHRoZSBwYXRjaCAKZGVzY3JpcHRpb24uCgpXaGF0IGRvIHlvdSB0aGluaz8K
CgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85ODYyNTU3LwoKPgo+IENo
ZWVycywKPgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
