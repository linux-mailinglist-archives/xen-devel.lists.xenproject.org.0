Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF087DD86
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:12:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBmY-00041D-Bi; Thu, 01 Aug 2019 14:10:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q0EE=V5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htBmW-000416-Ct
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:10:12 +0000
X-Inumbo-ID: 12a09a8c-b466-11e9-8980-bc764e045a96
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12a09a8c-b466-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:10:11 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p197so50334294lfa.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=lwRZ7JPbeXanvY9+QW/Ko512f/QJC6Tx7ipOCQm2CKU=;
 b=vcY9Fl2+RayMvXvM+Tw2+7V/qnFQu4eEmSRqy+i4Cyrxc0q3VTN8UdeNEcBPYYpZ/A
 hGk+nosevq0hUpta3snPG3zWW5fb1WAWjhNLJmZ+1VbmJHWubwcHAp4OjqW3GfFsEPH0
 cF5AGUIV89WOSdhnaciil84Uy0V7yKG7M2Ft5oie5g0KAske+o00bp0JJSwGo4dIjdDy
 6I5PHIiKj6M+G1FyTvg70vbg4QtYR3ABrqEX8cB8x3NjUuVXGBqgBZ3VbTTwliJY74jV
 vZDkrC6dO8jUN03SzwJu9D60ytzV8I8haxf195T65kXIR4TH4D/uBy96/d6MRWGjG+0v
 E4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=lwRZ7JPbeXanvY9+QW/Ko512f/QJC6Tx7ipOCQm2CKU=;
 b=CfpZXeAMvHn45+ryKxqm3J0WY/fmKcX/mig3v1sari88CxSMdifVp/Qf0ZO7BdArsV
 +I+qbe3nLl8k/BZC0tDqPsPPr3GeH4fDi81G95+y7u6HbQda556zwjO8N/Pl4F03fV+d
 +lcRF8TtrO1hS21zbQQtXl+JBotDer+5M9F9t4uJOtj8yQkVLPp/LohfN7KbFKInJriy
 7kvs5aZi/7zOSA/4K56DaR9ED/XYWeSY3+D1za08oNkoFUtjvRej4NBO2yAtLMC6HLYs
 1zcGUbR8ZH5UCiXBM1b+Idmjigkv9quUt6MOkKKMqWwNbi75a7cAgNavNbFPubqa151S
 pXNw==
X-Gm-Message-State: APjAAAVmZny+FZO38aMA6dVRgz9MbW2HjKjdum9ozhG8i19UmkGZG3Nn
 SNiS9MQcZ0lxcBjqmjsAsMXPdTb6hc8=
X-Google-Smtp-Source: APXvYqx0PJqdL3wM1NzdCqoMsSSY9onRH67Ew5HRd/NUMgnmYE2Hz3eq8YtZ0evUME4fAP09I2iPQA==
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr10834220lfp.72.1564668609665; 
 Thu, 01 Aug 2019 07:10:09 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q4sm16613422lje.99.2019.08.01.07.10.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:10:09 -0700 (PDT)
To: xen-devel <xen-devel@lists.xenproject.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
Date: Thu, 1 Aug 2019 17:10:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [Question] Proper location for Linux error code
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gYWxsLgoKV2hhdCBpcyB0aGUgcHJvcGVyIGxvY2F0aW9uIHRvIHBsYWNlIExpbnV4IGVy
cm9yIGNvZGUgKC1FUFJPQkVfREVGRVIpIGluIApYZW4/Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjMtcmMyL3NvdXJjZS9pbmNsdWRlL2xpbnV4L2Vycm5vLmgjTDE5CgouLi4K
QWx0aG91Z2ggdGhhdCBlcnJvciBpcyBnb2luZyB0byBiZSB1c2VkIGJ5IEFybSBjb2RlIHRoZSBm
aXJzdCwgSSBmZWVsIGl0IApzaG91bGQgYmUgc29tZXdoZXJlIGluIGNvbW1vbiBwbGFjZSBhcyBp
dCBpcyBub3QgQXJtIHNwZWNpZmljLgpJIHdhcyB0aGlua2luZyB0byBwbGFjZSBpdCB0byB4ZW4v
aW5jbHVkZS9wdWJsaWMvZXJybm8uaCBhbmQgZ3VhcmQgd2l0aCAKI2lmZGVmIF9fWEVOX18gdG8g
aGlkZSBmcm9tIHVzZXJzcGFjZSwgYnV0IG5vdCBzdXJlIGl0IGlzIGEgZ29vZCBpZGVhLCAKc2lu
Y2UgaXQgbG9va3MgbGlrZSBub3QgYSBQT1NJWCBvbmUgdG8gYmUgaW4gdGhhdCBoZWFkZXIuLi4K
Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
