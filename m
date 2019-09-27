Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA16C0368
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:29:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnS9-0007tO-U2; Fri, 27 Sep 2019 10:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1rL=XW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDnS8-0007tG-1B
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:26:20 +0000
X-Inumbo-ID: 3e38836e-e111-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 3e38836e-e111-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 10:26:19 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b20so1974430ljj.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rgMBREI/NjJvXAms3h5hBUipMHHLsxI1R7M4ItebGc8=;
 b=JIkw+oEJHZ/QEcC1CXrgxAW0naS5yrFR4JZMbPQGgoaNcM8P51q4UCR7QW51YNIHYi
 lp8keSxnZLr2RMc0kzL/+bvDB0SMZ5lZo8FW01LsbHWf+CQrTQ5aYp+muymJRQJuC5M0
 yLYe12W5P+RqCcQv8eKW0hZS1eEocJ+TSmz/LEkkQ0nN/RBnejiwyiIeL94vf83LNNe+
 GDUTygIM1GlCPsmvGVf+EkcwFCK6+U1VOA0jJ0XVavE5k+QDZeFtATnaLfrxBgmX1ZGj
 8oAw5rK2AbCMQVSQheYzRoQ99SdnGCTNUQygv/lAl3Bqc7fmpEeefGfI/KWKp3ISvF39
 9HKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rgMBREI/NjJvXAms3h5hBUipMHHLsxI1R7M4ItebGc8=;
 b=eZrTHLQ2LO5AhVtCx9+z6oyOZZU1jh87XyxsIPXHujxNetJfJ9z7NdiF/UrU05aBkC
 RVAi5Rhi5V9b18qv+sIn5vda1gN5sapx+lvYZPhvVIOetLDfyOPA8twFAI2g5CzlBTzX
 KxsYZh4NPJrz74KEmTp0dmwBoxoQJR4xyRnbKVMzOUtC4cPcTTUSaBEYic6bMWu0BJZs
 m9jeaU5Btvrg39ERLfYFao5JAmxLGuJgJIIDjOaryC47lSbSy3oRUj5D7VR4H1/jemoP
 oYCwpabHJIL8RPN7F0fU/CDvNzwmY8fmf1at4PWxGGAVpg0zD3u2h5HzrrSlzmwP7WME
 dHhg==
X-Gm-Message-State: APjAAAWL1TeCWQkh2e7O+bUoe/U2j3MrphGGeOoTFV3YvnTf2XBF5dKk
 TE126srSuzaqCB1bJ08myv8=
X-Google-Smtp-Source: APXvYqxcMzmcW1RMXD475LAU1r08nCYrEGVSXF5ek+gcwFoz/B6aLcoJ2JhNwcxnE4tj3RSiH0dtDw==
X-Received: by 2002:a2e:b0d1:: with SMTP id g17mr2268766ljl.238.1569579978038; 
 Fri, 27 Sep 2019 03:26:18 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r75sm398851lff.7.2019.09.27.03.26.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 03:26:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1569340911-20793-1-git-send-email-olekstysh@gmail.com>
 <70a1fc15-9069-3971-5fe2-5265efa7e4ca@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <eac9ce94-ecef-efe8-017b-80bb3f5761ce@gmail.com>
Date: Fri, 27 Sep 2019 13:26:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <70a1fc15-9069-3971-5fe2-5265efa7e4ca@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI3LjA5LjE5IDEzOjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHJlc3Bpbi4gVGhlIGNvZGUgaW4gcDJt
LmMgbG9va3MgZ29vZCB0byBtZSBrbm93LiBPbmUgY29tbWVudCByZWdhcmRpbmcgdGhlIFNNTVUg
Y29kZSBiZWxvdy4KPgo+IE9uIDI0LzA5LzIwMTkgMTc6MDEsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKPj4gaW5kZXggOGFlOTg2YS4u
NzAxZmU5YyAxMDA2NDQKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
Ywo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4+IEBAIC0yMTk4
LDE0ICsyMTk4LDkgQEAgc3RhdGljIGludCBhcm1fc21tdV9kZXZpY2VfY2ZnX3Byb2JlKHN0cnVj
dCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpCj4+ICAgIAlzaXplID0gYXJtX3NtbXVfaWRfc2l6ZV90
b19iaXRzKChpZCA+PiBJRDJfSUFTX1NISUZUKSAmIElEMl9JQVNfTUFTSyk7Cj4+ICAgIAlzbW11
LT5zMV9vdXRwdXRfc2l6ZSA9IG1pbl90KHVuc2lnbmVkIGxvbmcsIFBIWVNfTUFTS19TSElGVCwg
c2l6ZSk7Cj4+ICAgIAo+PiAtCS8qIFhlbjogU3RhZ2UtMiBpbnB1dCBzaXplIGhhcyB0byBtYXRj
aCBwMm1faXBhX2JpdHMuICAqLwo+PiAtCWlmIChzaXplIDwgcDJtX2lwYV9iaXRzKSB7Cj4+IC0J
CWRldl9lcnIoc21tdS0+ZGV2LAo+PiAtCQkJIlAyTSBJUEEgc2l6ZSBub3Qgc3VwcG9ydGVkIChQ
Mk09JXUgU01NVT0lbHUpIVxuIiwKPj4gLQkJCXAybV9pcGFfYml0cywgc2l6ZSk7Cj4+IC0JCXJl
dHVybiAtRU5PREVWOwo+PiAtCX0KPj4gLQlzbW11LT5zMl9pbnB1dF9zaXplID0gcDJtX2lwYV9i
aXRzOwo+PiArCS8qIFhlbjogU2V0IG1heGltdW0gU3RhZ2UtMiBpbnB1dCBzaXplIHN1cHBvcnRl
ZCBieSB0aGUgU01NVS4gKi8KPj4gKwlwMm1fcmVzdHJpY3RfaXBhX2JpdHMoc2l6ZSk7Cj4+ICsJ
c21tdS0+czJfaW5wdXRfc2l6ZSA9IHNpemU7Cj4gU29ycnkgSSBkaWRuJ3QgcmV2aWV3IGNsb3Nl
bHkgdGhlIFNNTVUgY29kZSBjbG9zZWx5IHVudGlsIG5vdy4KPgo+IHMyX2lucHV0X3NpemUgaXMg
Z29pbmcgdG8gYmUgdXNlZCBieSB0aGUgU01NVSB0byBjb25maWd1cmUgdGhlCj4gY29udGV4dCBi
YW5rcy4gSG93ZXZlciwgdGhlIG51bWJlciBvZiBJUEEgYml0cyBtYXkgaGF2ZSBiZWVuCj4gcmVz
dHJpY3RlZCBmdXJ0aGVyIGJ5IHRoZSBQMk0gbGF0ZXIgb24uCj4KPiBTbyBJIHdvdWxkIHNxdWFz
aCB0aGUgZm9sbG93aW5nIGh1bmsgaW4gdGhpcyBwYXRjaCAodW50ZXN0ZWQpOgo+Cj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gaW5kZXggOGFlOTg2YTE4ZC4uMjkzZjQyOGZjNyAxMDA2
NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+IEBAIC0xMTEwLDcgKzExMTAsMTEgQEAg
c3RhdGljIHZvaWQgYXJtX3NtbXVfaW5pdF9jb250ZXh0X2Jhbmsoc3RydWN0IGFybV9zbW11X2Rv
bWFpbiAqc21tdV9kb21haW4pCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IFRUQkNS
X1RHMF82NEs7Cj4gICAKPiAgICAgICAgICAgICAgICAgIGlmICghc3RhZ2UxKSB7Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgcmVnIHw9ICg2NCAtIHNtbXUtPnMyX2lucHV0X3NpemUpIDw8IFRU
QkNSX1QwU1pfU0hJRlQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgKiBYZW46IFRoZSBJT01NVSBzaGFyZSB0aGUgcGFnZS10YWJsZXMgd2l0
aCB0aGUgUDJNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogd2hpY2ggbWF5IGhhdmUgcmVz
dHJpY3QgdGhlIHNpemUgZnVydGhlci4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZWcgfD0gKDY0IC0gcDJtX2lwYV9iaXRzKSA8PCBUVEJD
Ul9UMFNaX1NISUZUOwo+ICAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoc21t
dS0+czJfb3V0cHV0X3NpemUpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAzMjoK
CgpJbmRlZWQsIG1ha2VzIHNlbnNlLCBJIHdpbGwgc3F1YXNoLgoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
