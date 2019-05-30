Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB7A3000A
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 18:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWNfI-0005Tu-LA; Thu, 30 May 2019 16:12:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNfH-0005To-DN
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:12:27 +0000
X-Inumbo-ID: b620fb96-82f5-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b620fb96-82f5-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 16:12:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b11so5486497lfa.5
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SFbAopx5jRm8n+lh8oVxjDtswAitT0woBIbeAe7jUmA=;
 b=WyTsMa+KlbLiG3Tx0w5osGEcFnlN1RwueDejmuUSugrFloty2aDJFg4Td757YeA3Th
 pU72ZkSahDDkW1YHVtATRqSe3bzqSRMJjjIY9/KSbd9RhCHfNhgenUrBHKgrlkFosk+Z
 AfwUrewG+xcx+r2yvlrVgOFj/DsmTKMiLS2p0Q2LaqeWQdhQMVbWBK5MEpqZ9yL0tU1M
 LcNUgFcCCEU/IUTh+8Q5/NZGv3kXPPt7yHjxWI3mvOALUZOV4xAA9uqcUGd8czjNGMbt
 23hYBIg6aXnZm94rw6sxBaJsRy3sn36Fd7MDZeLjZ9F8a1N+S7SLVQzzGqNm8iXMLX+5
 4xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SFbAopx5jRm8n+lh8oVxjDtswAitT0woBIbeAe7jUmA=;
 b=nDFI9DZ2y4AkKg+97Dxkf+BTWKTTGsqxSQLQNL2H9vRLDRkeJkyZsk7jv/nw5RdcZ1
 8LFMj5N6T3pGoOvCneFt1xMW+AYU4Gl9+3Q6den9VZNXzFEsuRrveJf+gBFyWQ0oCUTo
 1TGVRozlIZYF95zBbEf+pC/HDbRjCF2PSkrh9I7BqX+15e33c+Dae8pzpFlxm6gdBC0q
 v3hH3ofG/6KwfzUZginaDqqObftsL+Cln0/kccbXnIcclRDYapvzvuhUzLUjlRPa81bL
 q1pGpY4ttSy9zyT5f2JkkNaLbKptMlD9mS1TLkQHvNzFGh+Zo8XAoRG3ry7b80xhQ+M5
 +8IQ==
X-Gm-Message-State: APjAAAUVS2W4j8xdCUyENmUZY+TI/bkZ5P1+fSLkcRJHsR/Z5DF/e/QS
 z7KQG1nrd3VLbjhDWQm/gDs=
X-Google-Smtp-Source: APXvYqwWWVna+ANNxILul3YhJv8z6qqT6we5vo2tbjHi9l0OWQ0ktAkZCRVJSdD9oZb03UJ+hxTrSA==
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr749546lfm.36.1559232744003;
 Thu, 30 May 2019 09:12:24 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b29sm561323lfo.38.2019.05.30.09.12.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:12:22 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
Date: Thu, 30 May 2019 19:12:21 +0300
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

CgpPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlIHRvIGF0IGxlYXN0IGZpeCB1cCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCB0aGUg
dHlwb2VzIChhbmQgcmV3b3JkaW5nKSBJIG1lbnRpb25lZCBpbiBteSBwcmV2aW91cyBlLW1haWwu
Cj4gWW91ciBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBleHBsYWluZWQgd2h5IHRoaXMgaXMgZmlu
ZSB0byBrZWVwIHRoZSBpbnRlcnJ1cHQgbWFza2VkIGEgYml0IGxvbmdlci4gSSB3cm90ZSB0aGUg
ZXhwbGFuYXRpb24gaW4gbXkgcHJldmlvdXMgZS1tYWlsIHNvIHlvdSBjYW4gYm9ycm93IHRoZSBy
YXRpb25hbGUgZnJvbSB0aGVyZS4KeGVuL2FybTogZ2ljOiBEZWZlciB0aGUgZGVjaXNpb24gdG8g
dW5tYXNrIGludGVycnVwdHMgdG8gZG9fe0xQSSwgSVJRfSgpCgpIYXZpbmcgaXJxcyBlbmFibGVk
IGhlcmUgbGVhdmVzIGEgcm9vbSBmb3IgdHJhcHBpbmcgYW5kIGdvaW5nIHRocm91Z2ggdGhlIHRy
YXAKcGF0aCBhZ2FpbiBpZiB3ZSBoYXZlIGEgbmV3IGd1ZXN0IGludGVycnVwdCBhcnJpdmVkIChl
dmVuIHdpdGggdGhlIHNhbWUgb3IKbG93ZXIgcHJpb3JpdHksIGFmdGVyIGBkZXNjLT5oYW5kbGVy
LT5lbmQoZGVzYylgIGluIGBkb19JUlEoKWApLgpLZWVwaW5nIGludGVycnVwdHMgZGlzYWJsZWQg
ZHVyaW5nIGd1ZXN0IGludGVycnVwdHMgcHJvY2Vzc2luZyBhbGxvd3MgYXMKYXZvaWRpbmcgZXhj
ZXNzaXZlIHRyYXBzIChhbmQgd2FzdGluZyBjcHUgY3ljbGVzIGZvciB0cmFwIHBhdGgpIHdoaWxl
IHRoZSBuZXcKaW50ZXJydXB0cyB3b3VsZCBiZSBwcm9jZXNzZWQgaW4gdGhlIGxvb3AgYW55d2F5
LiBQcm9jZXNzaW5nIGd1ZXN0IGludGVycnVwdHMgYnkKdGhlIGxvb3Agc2hvdWxkIG5vdCBpbnRy
b2R1Y2Ugc2lnbmlmaWNhbnQgYWRkaXRpb25hbCBsYXRlbmN5IGJlY2F1c2UKdmdpY19pbmplY3Rf
aXJxKC4uLikgYWxyZWFkeSBtYXNraW5nIHRoZSBpbnRlcnJ1cHRzIGluIG1vc3Qgb2YgdGhlIGNh
c2VzLgoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
