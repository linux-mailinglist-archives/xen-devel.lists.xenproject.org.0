Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F807B038
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsW1s-0008WI-Es; Tue, 30 Jul 2019 17:35:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2K5v=V3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hsW1q-0008W6-Vc
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:35:15 +0000
X-Inumbo-ID: 6285cffc-b2f0-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6285cffc-b2f0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:35:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q26so45360901lfc.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F9PMZbmOxDMzKlvj5x6hpT2rBrfl7ZYqfhmO3sicWAU=;
 b=bFUaeL1FUKt8JH8xvYwVNPHrf8lZdGCI4li/0JW1or6qWHbJXEtR5UrgIqGiIpKm/p
 5U2Af24YQA1qkJQ9sU3zpiXOMmm8xFI4+w+mCwse7N1vV+nomh2qaYW6kpQ1CAgKSe7M
 O3gpOh5isfcQsYYLI4kZK7Mo8DFdOn9hTT7Kw+Hzagmgct3/aaEMeTZqRh+BR4nFCBoA
 pEryAxbuTnRTzj117IisDsLzrrwzYcIxeAvjX4Wb55E4ZQxYhCo83PiSDe6yTbGAaiBE
 CX8V6comSBAoNw8AyeKlL9uQYi5elPEgkb9gf4MOq99s/Xny2PGhMgDzdGXvyqa3U4dU
 gz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F9PMZbmOxDMzKlvj5x6hpT2rBrfl7ZYqfhmO3sicWAU=;
 b=bKJranBmfIMjAGL5YKV4FiDoJ7aiteQQlGUDKOFoKofogGGCgkt/Ps7Vzj7tpAJ5FM
 nxM1Ncy2C+SpbXtIczbtRZwD6Vn3Ms7SW/ew32ccWiQucNS9K1/JSDlkCnWg7Ihkup67
 EINsHOEKE6YblI6R+gzUalHl5/6o14ffBOwTdJ6n5+9SI1SgUdMGg2OA/fSfHB/VdoTE
 D1jVKeVJWQHN4+elQe5h4uuWTCL/Q+eKsqw6kaSvSUE2Exb05znAy81SXS74laub8im0
 pPvovBOU+Sy4R6BynJFWcRHs0EPpcw9TzzhA+ziWpQz6sP6bJCjOUlPpl/IGtsuDiuQY
 6cTg==
X-Gm-Message-State: APjAAAVcaOAg18UH0X4nYfHYkwg4H8lNyPzx9uufk/lPi0S6+ZNa94+G
 gLpFJkBngHNEpORcd0JSE5c=
X-Google-Smtp-Source: APXvYqwOCRGeShbT2Bef3goVwJy3lmrML6H8sJOmT4tO+2xJGNRDmKgs1X4VdYh9uP1wH8Rdem0Sfg==
X-Received: by 2002:ac2:43bb:: with SMTP id t27mr20831023lfl.187.1564508111956; 
 Tue, 30 Jul 2019 10:35:11 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 e62sm13531564ljf.82.2019.07.30.10.35.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 10:35:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
Date: Tue, 30 Jul 2019 20:35:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMTkgMTM6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBUaGlzIGlzIHRoZSAzcmQg
dGltZSB5b3Ugc2VuZCB0aGlzIHBhdGNoLi4uIGFuZCBzdGlsbCBubyBwcm9wZXIgZXhwbGFuYXRp
b24gd2h5IHRoaXMgaXMgZG9uZSBub3IgdGhlIGltcGFjdCBvbiBrZWVwaW5nIHRoZSBpbnRlcnJ1
cHRzIGRpc2FibGVkIGxvbmdlciB0aGFuIG5lY2Vzc2FyeS4KCkkga25vdyBpdCBpcyB0aGUgdGhp
cmQgdGltZSBmb3IgdGhpcyBwYXRjaC4gWWV0IGl0IGlzIGluIHRoZSBSRkMgc2VyaWVzIGFnYWlu
LgpJbiB0aGlzIHNlcmllcyBJIHRoaW5rIEkgbmVlZCBpbnRlcnJ1cHRzIGxvY2tlZCB1bnRpbCBJ
IHN0YXJ0IHRpbWUgYWNjb3VudGluZyBmb3IgaHlwZXJ2aXNvci4gVGltZSBhY2NvdW50aW5nIGlz
IHN0YXJ0ZWQgYnkgYHRhY2NfaGVhZCgpYCBmdW5jdGlvbi4gSSBwcmVmZXIgdG8gaGF2ZSBpdCBj
YWxsZWQgZnJvbSBDLCBiZWNhdXNlIGl0IGlzIG1vcmUgY29udmVuaWVudCBhbmQgb2J2aW91cyBm
b3IgdGhvc2Ugd2hvIGFyZSBsZXNzIGZhbWlsaWFyIHdpdGggdGhlIEFSTSBjb2RlLgoKPiBSZXNl
bmRpbmcgdGhlIHBhdGNoIHdpdGhvdXQgdGhpbmdzIGFkZHJlc3NlZCBpcyBvbmx5IGdvaW5nIHRv
IG1ha2UgaXQgd29yc3QuCgpJJ20gc3RpbGwgY29udmluY2VkIHRoZSBwYXRjaCB3b3VsZCBpbXBy
b3ZlIGludGVycnVwdCBsYXRlbmN5IGZvciBoaWdoIGludGVycnVwdCByYXRlIHVzZSBjYXNlcy4K
QnV0IEkgdW5kZXJzdGFuZCB0aGF0IEkgaGF2ZSBubyBleHBlcmltZW50IHRvIHByb3ZlIHRoZSBl
ZmZlY3QsIHNvIEknbSBub3Qgd2lsbGluZyB0byBwdXNoIHRocm91Z2ggdGhlIHBhdGNoLgoKQWxz
bywgSSBoYXZlIGEgcXVlc3Rpb24gdG8geW91IGFib3V0IGFub3RoZXIgYXNwZWN0IG9mIHRoaXMg
cGF0Y2guIEluIHRoZSBmdW5jdGlvbiBgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKClgIHRoZXJlIGlz
IGEgY2hlY2sgZm9yIGEgZGlzYWJsZWQgd29ya2Fyb3VuZCBhbmQgdHVybmluZyBpdCBvbi4gSWYg
d2UgaGF2ZSB0aGUgaW50ZXJydXB0cyBlbmFibGVkIHVudGlsIHRoZXJlLCB3ZSBoYXZlIGdvb2Qg
Y2hhbmNlcyB0byBnbyB0aHJvdWdoIHRoZSBpbnRlcnJ1cHQgcHJvY2Vzc2luZyBgZG9fSVJRKClg
IGJlZm9yZSBXQSBlbmFibGVkLiBJcyBpdCBzdGlsbCBPSz8KCi0tIApTaW5jZXJlbHksCkFuZHJp
aSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
