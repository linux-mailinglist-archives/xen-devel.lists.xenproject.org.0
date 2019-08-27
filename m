Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34549EBC4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cwY-0003eK-Oe; Tue, 27 Aug 2019 14:59:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d4NK=WX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i2cwW-0003eE-Jm
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:59:32 +0000
X-Inumbo-ID: 46299cbe-c8db-11e9-8980-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46299cbe-c8db-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 14:59:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id q27so5841225lfo.10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2019 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QesnovSaRXkpJLBiRvdQpSUkYTuXBlU2aFIkUgnCdzI=;
 b=gbEvhJ0p1pX3+SMH09dNw1zKEhKDcW4tkgYcEv4I+V4pbRuWyFXWGx6TMDMbHECPUt
 +oH2HvreW/xm0XY4w5ljJQEItwx14C2/MVBaCh43mXZzn6w4wONDfjQrhi1lYYBhcYnG
 Qd7Y7HOzxAe0/99CwYKxuXO75Zw+H0MnGbKPOoNaNT3p1zvwCX0rOwES8yWdcArHszPK
 uGdnhrSgcS9CYFp22yUDAfMvo+E3HuDrfrxy4hwEAplHgLoyM5uM3eHYTqTfqqYUQ9Ks
 bTcKWBD2AJaPfMqd6zkEqyLdsFMbryaeyMe7q+AkFdP4Oe193udl4kya6qoWw2L4X8HX
 M7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QesnovSaRXkpJLBiRvdQpSUkYTuXBlU2aFIkUgnCdzI=;
 b=jsnzRJcG+ccC4K9chBiMtm6S7U01/BCztasuxWNn/bTS9rbfCgoOkENe8oc2pCAl79
 upnpIh42XG6Zrh33EdVJuc2xki6kFqIeJNrzjx7tHFH6pjZrlF5XdRmUAY5nCRG6t61+
 7P5TemPrWHncaUtyTui2mf8+mA36tmkXnX+lCP/d05vy0DCPplo0tgBIB4uIJJnwWoAE
 KN5R946ijWOTybZHeUhj375nQLPg21N+WxdSMmbiRoffQ3CY0GqARx8Gulc249nMGarO
 uLD7QgTMjP0FtfOX2XKIv9CuYiklJc5TIpzaL0pVD9ESg1kkvUfXc7K06CTnvrJVwLhV
 E45Q==
X-Gm-Message-State: APjAAAWr4Hi03+MHYt2EvRKcwFNCcwdg7qm1cqZS+X2tbWeHDkeT6y/L
 E7oRp4rezblvOPw0HUdbvX0=
X-Google-Smtp-Source: APXvYqxlCcG4HqUGY/p35mZ1n6vWnnBWffVr+wRO8VURgzE4l0T5H3kC/MBUdDYuEXSdazy5aAcZuA==
X-Received: by 2002:a19:e04f:: with SMTP id g15mr15118666lfj.46.1566917970598; 
 Tue, 27 Aug 2019 07:59:30 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r76sm2536726ljb.13.2019.08.27.07.59.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 07:59:30 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
 <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
Date: Tue, 27 Aug 2019 17:59:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEphbgoKPiBPbiAyMC4wOC4yMDE5IDIwOjA5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90
ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPj4gKysrIGIveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgKPj4gQEAgLTI0MCw2ICsyNDAsMTYgQEAgc3RydWN0IGlvbW11X29wcyB7Cj4+
IMKgwqDCoMKgwqAgaW50IF9fbXVzdF9jaGVjayAoKmlvdGxiX2ZsdXNoX2FsbCkoc3RydWN0IGRv
bWFpbiAqZCk7Cj4+IMKgwqDCoMKgwqAgaW50ICgqZ2V0X3Jlc2VydmVkX2RldmljZV9tZW1vcnkp
KGlvbW11X2dyZG1fdCAqLCB2b2lkICopOwo+PiDCoMKgwqDCoMKgIHZvaWQgKCpkdW1wX3AybV90
YWJsZSkoc3RydWN0IGRvbWFpbiAqZCk7Cj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfSEFTX0RFVklD
RV9UUkVFCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogQWxsIElPTU1VIGRyaXZlcnMgd2hp
Y2ggc3VwcG9ydCBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIAo+PiBzaG91bGQgdXNlCj4+ICvC
oMKgwqDCoCAqIHRoaXMgY2FsbGJhY2suIFRoaXMgaXMgYSB3YXkgZm9yIHRoZSBmcmFtZXdvcmsg
dG8gcHJvdmlkZSB0aGUgCj4+IGRyaXZlcgo+PiArwqDCoMKgwqAgKiB3aXRoIERUIElPTU1VIHNw
ZWNpZmllciB3aGljaCBkZXNjcmliZXMgdGhlIElPTU1VIG1hc3RlciAKPj4gaW50ZXJmYWNlcyBv
Zgo+PiArwqDCoMKgwqAgKiB0aGF0IGRldmljZSAoZGV2aWNlIElEcywgZXRjKS4KPj4gK8KgwqDC
oMKgICovCj4+ICvCoMKgwqAgaW50ICgqb2ZfeGxhdGUpKGRldmljZV90ICpkZXYsIHN0cnVjdCBk
dF9waGFuZGxlX2FyZ3MgKmFyZ3MpOwo+PiArI2VuZGlmCj4+IMKgIH07Cj4KPiBJIHRoaW5rIHRo
aXMgc2hvdWxkIGJlIGZvbGRlZCBpbnRvIHRoZSBmaXJzdCBwYXRjaCB1c2luZyBpdC4gRG9pbmcK
PiBzbyBtYXkgYWxzbyBhbnN3ZXIgbXkgcXVlc3Rpb24gb2Ygd2hhdCAib2YiIGhlcmUgc3RhbmRz
IGZvci4KCkluIExpbnV4LCBjb2RlIHJlbGF0ZWQgdG8gdGhlIGRldmljZS10cmVlIGlzIHByZWZp
eGVkIHdpdGggIm9mXyIuIEJ1dCwgCmluIFhlbiwgY29kZSByZWxhdGVkIHRvIHRoZSBkZXZpY2Ut
dHJlZSBpcyBwcmVmaXhlZCB3aXRoICJkdF8iIFsxXS4gCkxvb2tzIGxpa2UsIEkgc2hvdWxkIGhh
dmUgbmFtZWQgaXQgImR0X3hsYXRlIiB0byBiZSBjb25zaXN0ZW50LgpUaGVyZSB3YXMgYSBwcmVm
ZXJlbmNlIHRvIGludHJvZHVjZSBjYWxsYmFjayBpbiBhIHNlcGFyYXRlIHBhdGNoIFsyXS4gCkFu
eXdheSwgc2hhbGwgSSBmb2xkIGl0PwoKClsxXSAKaHR0cHM6Ly9naXRodWIuY29tL3hlbi1wcm9q
ZWN0L3hlbi9ibG9iL21hc3Rlci94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaApbMl0gCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0w
OC9tc2cwMTM5My5odG1sCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
