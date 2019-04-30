Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6EF50B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 13:06:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLQYl-0006KY-1j; Tue, 30 Apr 2019 11:04:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SUxV=TA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hLQYj-0006KS-Mv
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:04:25 +0000
X-Inumbo-ID: b61c9df4-6b37-11e9-843c-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b61c9df4-6b37-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 11:04:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id t30so10380377lfd.8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aqMFl0NHWXOcKtDcM1MfrsxOj401xV5+zbcKkY2rvGg=;
 b=DLoYwrgIoaOyC8qRfY/jAON785BjArSX6S964fV4y3ITKhS4DkNP0ySlqLbGlFOPdd
 L7bt9g0PE0fWfSur6byzOGEC3ORjolvv9RTlbuE6nSoFlyQdRPj4pVudhZR2BdJns6Jl
 Vq+D5LFcIotTwzjSoo4Y9kX2q5icj/59+/02raP5dFXJeganjaHwuj2RET/LUjoG1h8l
 OdiUyoB9Xl4QIGkoxDjS8RxdDJvs5SaEsBupgmVRcLVK4ehF04BkLpJyuPtVdOJZhS7j
 B1h8cfZ8OAePGeIhlW84qhg8l4wsFsYl/uYD/oEqQLBhcuU+eOEAankX8TYBwJT62ful
 WF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aqMFl0NHWXOcKtDcM1MfrsxOj401xV5+zbcKkY2rvGg=;
 b=Cvxvg88Bg9fcacCJ256wQa/lF3QIDIgFis7zCDYhv1q1l78VyN8CMsCrFIife90eE9
 OYBq4M73GXylthekd6VouDeOghYj/Z+En3cGcGVk0ngOQY6zvEzGHM/Jn+XURbGaI8sZ
 3T8zEt0dcQBgfbylvbxsyLLINnEklhEnmT9YemS0l+l2pxwcJ+qszBRzxJVPJjMWqm37
 7xaSsrikfhNTQ4OXVqW6B7IJXjlDM/ImffhGS4WpPqaF+PF1OgNjOUtaF3RBrKIG+55z
 MQkkpRNPyLYPQ+w1bP0NvCidYwfQfP4OyTl1xWkK6Lizcyda5JH6bGEd3g5EgqEV0KE6
 fG5w==
X-Gm-Message-State: APjAAAVi1XCMlHB00c1YnNbIHgDWysVyPRFrsegiwbw4iFxZ5MVLfnNx
 KbbZEG7n6iDheMKpfyl2kJxJPKTwQow=
X-Google-Smtp-Source: APXvYqzbecxBu//dzJhl5/1XlKS8/fKhQ19Wgm0aRWuFOKI4V4BZ63CM/Do8XfROOTTLI7OTawKfcQ==
X-Received: by 2002:a19:c301:: with SMTP id t1mr34314712lff.167.1556622262892; 
 Tue, 30 Apr 2019 04:04:22 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id p18sm2117794ljc.54.2019.04.30.04.04.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 04:04:22 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-6-git-send-email-olekstysh@gmail.com>
 <c7ac1368-a3cc-0eb2-76ca-195665db5fff@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <864da0bc-0c5d-9ef8-f0dc-02d89dd34cab@gmail.com>
Date: Tue, 30 Apr 2019 14:04:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c7ac1368-a3cc-0eb2-76ca-195665db5fff@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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

Ck9uIDI5LjA0LjE5IDE3OjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4+IEBAIC0yMiwxMCArMjIsMTMgQEAKPj4gwqAgI2lmZGVmIEVBUkxZX1BS
SU5US19WRVJTSU9OX05PTkUKPj4gwqAgI2RlZmluZSBTVEFUVVNfUkVHwqDCoMKgIFNDSUZfU0NG
U1IKPj4gwqAgI2RlZmluZSBUWF9GSUZPX1JFR8KgwqAgU0NJRl9TQ0ZURFIKPj4gKyNlbGlmIEVB
UkxZX1BSSU5US19WRVJTSU9OX0EKPj4gKyNkZWZpbmUgU1RBVFVTX1JFR8KgwqDCoCBTQ0lGQV9T
Q0FTU1IKPj4gKyNkZWZpbmUgVFhfRklGT19SRUfCoMKgIFNDSUZBX1NDQUZURFIKPj4gwqAgI2Vu
ZGlmCj4+IMKgIMKgIC8qCj4+IC0gKiBTQ0lGIFVBUlQgd2FpdCBVQVJUIHRvIGJlIHJlYWR5IHRv
IHRyYW5zbWl0Cj4+ICsgKiBXYWl0IFVBUlQgdG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKPgo+IFRo
aXMgY2hhbmdlIGFuZCAuLi4KPgo+PiDCoMKgICogcmI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5z
IHRoZSBVQVJUIGJhc2UgYWRkcmVzcwo+PiDCoMKgICogcmM6IHNjcmF0Y2ggcmVnaXN0ZXIKPj4g
wqDCoCAqLwo+PiBAQCAtMzcsNyArNDAsNyBAQAo+PiDCoCAuZW5kbQo+PiDCoCDCoCAvKgo+PiAt
ICogU0NJRiBVQVJUIHRyYW5zbWl0IGNoYXJhY3Rlcgo+PiArICogVUFSVCB0cmFuc21pdCBjaGFy
YWN0ZXIKPgo+IC4uLiB0aGlzIG9uZSBsb29rIGxpa2UgbW9yZSBhIGNoYW5nZSBmb3IgdGhlIHBy
ZXZpb3VzIHRoYW4gdGhpcyBvbmUuCgphZ3JlZSwgd2lsbCBtb3ZlIHRvIHByZXZpb3VzIHBhdGNo
LgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
