Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304F37DDF4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:34:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htC6y-0005mK-VY; Thu, 01 Aug 2019 14:31:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q0EE=V5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htC6w-0005mC-To
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:31:19 +0000
X-Inumbo-ID: 058b1e97-b469-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 058b1e97-b469-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:31:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v18so69568017ljh.6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cZTxWtjeRtOzgscLc//CRL4H412A0s2wsFJOlWpxevU=;
 b=GJqbM3rynxiKudym6+cyWINRydYZgD8TgaBsjcjUivOx9L0bo3h55SRizSdMdJmIoG
 r00JaR3/gcUU31cAdIa4dbPY5AFFr3usHbql0GtF3TTOFO58tkH+MD/uMNEWfbGEcegf
 uvVIHKQLC1x2WSOybLW9Lj7D71ituONK93fyEHvEPs3hLgl/AyDl8ikHScUkr9P/IcY+
 fYAUz0I8NywJl1RXHfpMvzZckWoxLizjCxX+pQHUJhj0Xhz5EoT/wJjswVckUxY8l4PA
 vHYH+gczi1IrVQUQ+VtGOkJu4eG4zAUig0hueHeCtC28WtFe3F3R7wPFWKmIdiYjgbXn
 OHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cZTxWtjeRtOzgscLc//CRL4H412A0s2wsFJOlWpxevU=;
 b=G327zOmOeYN/pU7zgZWMKnD2dxtclTskEJA9krTId9e+UBEtiEaN7oePs6I5/hhh6s
 rlpWZeHAvEaEIWDGw1vAFEnFKEMP07G7HUWQ/ZqreZDPGkLC9/60UWmbAcNjX1VSGpM8
 MYgsXa4wnqfYattQOXWACctXN46qSXrqGTP2Z1rlVzTDs4N0nCOBoiK0ihWYmnvZRI3k
 wytJ2kkiBjfsxn8gWXhhsxPKGbiDhSdwGVpM6qvu8Qe92E54nyzmUE0uGi8IhaR5hn+N
 WwSBf4VTYujjjT3afGCKdTNUGPJjw6tDDs6JxE/dIY9G2j2b6mX2GpkFZ0SP1tU0yHCR
 8P3w==
X-Gm-Message-State: APjAAAWIz/yyaxmScQ8uHRckDkr74kCgflSMzjNVgCvNpMKZO7/rtC2a
 twRo1EP2c7kdrrX7PXSjN09W3ckYEtI=
X-Google-Smtp-Source: APXvYqz0RqDo2osnuVi7YTCH/TDvuyuRj9MGmnKB51MPh8sMkmfYoggBUNdmbRJ4XOzehYVJCnFbYQ==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr7261394lji.103.1564669876305; 
 Thu, 01 Aug 2019 07:31:16 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id j3sm12320980lfp.34.2019.08.01.07.31.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:31:15 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
Date: Thu, 1 Aug 2019 17:31:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gSGVsbG8sCgpIaSwgUm9nZXIKCgo+IEkgdGhpbmsgaXQgd291bGQgaGVscCBpZiB5b3UgZGVz
Y3JpYmUgd2h5IHN1Y2ggZXJyb3IgY29kZSBpcyBuZWVkZWQgYnkKPiBYZW4gYW5kIGhvdyBpdCB3
b3VsZCBiZSB1c2VkLgoKIMKgVGhpcyBpcyBuZWVkZWQgZm9yIHRoZSB1cGNvbWluZyBWMiBvZiB0
aGUgSVBNTVUgZHJpdmVyIChBUk0pIFsxXSB3aGljaCAKbWF5IHJlcXVlc3QKIMKgZGVmZXJyZWQg
cHJvYmluZyAocmV0dXJucyAtRVBST0JFX0RFRkVSKSBkZXBlbmRpbmcgb24gd2hhdCBkZXZpY2Ug
d2lsbCAKYmUgcHJvYmVkIHRoZSBmaXJzdAogwqAoUm9vdCBkZXZpY2UgbXVzdCBiZSByZWdpc3Rl
cmVkIGJlZm9yZSBDYWNoZSBkZXZpY2VzLiBJZiBub3QgdGhlIGNhc2UsCiDCoGRyaXZlciB3aWxs
IGRlbnkgZnVydGhlciBDYWNoZSBkZXZpY2UgcHJvYmVzIHVudGlsIFJvb3QgZGV2aWNlIGlzIApy
ZWdpc3RlcmVkKS4KCkFzIHdlIGNhbid0IGd1YXJhbnRlZSBhIGZpeGVkIHByZS1kZWZpbmVkIG9y
ZGVyIGZvciB0aGUgZGV2aWNlIG5vZGVzIGluIApEVCwgd2UgbmVlZCB0byBiZSByZWFkeSBmb3Ig
dGhlIHNpdHVhdGlvbiB3aGVyZSBkZXZpY2VzIGJlaW5nIHByb2JlZAppbiAiYW55IiBvcmRlci4g
U28sIGZyYW1ld29yayAoZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYykgd2lsbCBiZSAK
bW9kaWZpZWQgYSBiaXQgdG8gYmUgYWJsZSB0byBoYW5kbGUgLUVQUk9CRV9ERUZFUiByZXR1cm5p
bmcgYnkgZHJpdmVyLgoKWzFdIApodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMTctMDcvbXNnMDI2NzkuaHRtbAoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
