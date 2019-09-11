Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F12B001B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:32:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Z9-0003GH-JT; Wed, 11 Sep 2019 15:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oCsH=XG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i84Z8-0003G9-BJ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:29:54 +0000
X-Inumbo-ID: 0047ba12-d4a9-11e9-978d-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0047ba12-d4a9-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 15:29:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h2so13915776ljk.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cm1c6DCV3Td5VveZd+5Jsd7jzJkhM9hCPxpwWXFmmbE=;
 b=aunYK4EY9YwgnvduQv0Gvha/rOnJs/1aYKMuHGbjr7FhmVETs4SBGjqJz/gNjtlu7T
 Th8LniAzWoYR3ACeSbpakSaM8nfdD1ayJjHT16U6/xx6s9vmVLcZJDHmAznsfa7DetEW
 VzGZvZJ9y1+MVDF5WRZd5vT48Rfkvhf1xybiY5SlpB+yJUJWlGniK6YnEIaBNQFQ/tRs
 vAMFP92JJerfkZr7Pa3sayT5GyYoZ6RR5Z+bBEFC3cSX+W51n1r4r3AnlHd60NTs/Zvj
 6waQ+urpENR6yJU8K6UAYILt5K1hejpASZ7U4ILfCWcFq4+yPcLFvj+bnVn1XcAfELtq
 8cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cm1c6DCV3Td5VveZd+5Jsd7jzJkhM9hCPxpwWXFmmbE=;
 b=oakDdHV25SfzrnZ7EkMU2VxdMCL2WJAT9wh8VURfPJSF8fx6lbaIBPb8W9pBs/GAS6
 78u5HG3ok5b0i/VFoFKij4CWb7v3fKn0gGL/1+srKgRiqPVYRsx0l58F2HmNExd18div
 PgzLyWaKk4Gzj5yQMEfIntXfSrd7IZywi0Wet2NO7wSX5oX1jYKhuOYEdnWQMX3lDbZd
 eXtKkIbpaK83IlDK3iZcNrAcEBk6RqFUodlUd0PF8AyWSiqGTXwnL8KrEehE+DRDhXLi
 Vx/6dgMhv4kq7m6Y7wngz4W6KBnyG6JcU6vUJoaR/UOeAhJCEyCr1I5y6i+HtbwKg2WZ
 cw6A==
X-Gm-Message-State: APjAAAWAAbL/ANWNISRO3P+sgCx7bmilv4sdz3iNzQucQtbTBjqEtj+d
 1llNJmeA19KxxozR+3XlC7g=
X-Google-Smtp-Source: APXvYqxU9mtJR79nP6L5WPl7toPtRKLubtmJJ0ZekshSazbRSNYRheaS2+nlTYW38JWhdm9vaKyHJQ==
X-Received: by 2002:a2e:9a18:: with SMTP id o24mr23699811lji.123.1568215792130; 
 Wed, 11 Sep 2019 08:29:52 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id u10sm5225643lfk.34.2019.09.11.08.29.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 08:29:51 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
 <2b1d815c-720d-46c1-04de-0b8eb627b22f@arm.com>
 <1f14d80f-9110-9bf1-42ba-87168896c05c@gmail.com>
 <0c39fe9f-2e3b-2119-4542-dcf5922be701@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d7bea05d-7d10-8326-ef09-6a84a6a90e36@gmail.com>
Date: Wed, 11 Sep 2019 18:29:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0c39fe9f-2e3b-2119-4542-dcf5922be701@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLjA5LjE5IDE3OjMxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOS8xMC8xOSAxMjowNCBQTSwgT2xla3NhbmRyIHdyb3RlOgo+PiBPbiAxMC4wOS4x
OSAwMDoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IMKgwqDCoMKgwqAgLS0taGVscC0tLQo+
Pj4+IMKgwqDCoMKgwqAgRW5hYmxlIGFsbCB0aGUgcmVxdWlyZWQgZHJpdmVycyBmb3IgUmVuZXNh
cyBSQ2FyMwo+Pj4+IMKgIGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9LY29u
ZmlnIAo+Pj4+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZwo+Pj4+IGluZGV4IGEz
YzA2NDkuLjQ3ZWFkYjQgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
S2NvbmZpZwo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcKPj4+PiBA
QCAtMTIsNCArMTIsMTcgQEAgY29uZmlnIEFSTV9TTU1VCj4+Pj4gwqAgwqDCoMKgwqDCoMKgwqAg
U2F5IFkgaGVyZSBpZiB5b3VyIFNvQyBpbmNsdWRlcyBhbiBJT01NVSBkZXZpY2UgCj4+Pj4gaW1w
bGVtZW50aW5nIHRoZQo+Pj4+IMKgwqDCoMKgwqDCoMKgIEFSTSBTTU1VIGFyY2hpdGVjdHVyZS4K
Pj4+PiArCj4+Pj4gK2NvbmZpZyBJUE1NVV9WTVNBCj4+Pj4gK8KgwqDCoCBib29sICJSZW5lc2Fz
IElQTU1VLVZNU0EgZm91bmQgaW4gUi1DYXIgR2VuMyBTb0NzIgo+Pgo+PiBTaGFsbCBJIGFkZCBF
WFBFUlQgaGVyZSBhbHNvPwo+Cj4gR29vZCBxdWVzdGlvbi4gUHJvYmFibHksIGJ1dCB0aGVuIEkg
YW0gd29uZGVyaW5nIGlmIHRoZSBFWFBFUlQgPSAieSIgCj4gd291bGQgYWN0dWFsbHkgYmUgc3Vm
ZmljaWVudC4KClNob3VsZCBiZSBpbiBib3RoIHBsYWNlcywgaGVyZSBhbmQgd2hlcmUgeW91IHBv
aW50ZWQgKGNvbmZpZyBSQ0FSMykuCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5r
bwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
