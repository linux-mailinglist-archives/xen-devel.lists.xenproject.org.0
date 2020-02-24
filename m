Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA816B42D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 23:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6MKm-000346-5N; Mon, 24 Feb 2020 22:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6MKk-000341-UE
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 22:36:14 +0000
X-Inumbo-ID: 0ff1a47b-5756-11ea-925b-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ff1a47b-5756-11ea-925b-12813bfff9fa;
 Mon, 24 Feb 2020 22:36:14 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r18so13894859edl.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOgk0PUi0sNwkzMgqkQCzQwJq1JGoK/OafR/9Qivq18=;
 b=Wzszn+aki0rodr/XBUjqpun8m5Pw6y+HvhTdGPy4jtM9xUyF6DU2x40VlUo9DZ66gB
 btGGw6AM+/32O90H9UH7j5Veh2ht3Zkys7vo7biQY8cmjZ12Fqei/WNynK/C5MgSd8Qi
 ROdJIoVItVlFM4ydPfOWb6KjHI9mN+14MGS2+slLnnaZVxoeXco3jTBNFd77mGZvzY5Y
 ptPwe3EcgbF9dWj2VoEF3H9fzDhdNfrYHj1nCqkzA0pJSkJrwdgunTIp7oV06avhSuau
 i75s2mp9s7Hi1cZ59xmGvzAFtNZkU4vNt7E4OEpKe4IVk1XP45eSXepk/y9eEeUQEioo
 s3jQ==
X-Gm-Message-State: APjAAAWRx6EMfbuefqLOez0RYiblye+J3fGsLhFmAqFjb7ndlItbJaSr
 i7nDJOCBR2a0qsQ3ha6vEu4=
X-Google-Smtp-Source: APXvYqzfA1JcjOZhvvuW6QvYhQ+ImvbOW7YJ3d9TFb7iEaZGf7AY+9RLJ+KxcJzm3ThYbsJJ977vFA==
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr49567677edw.137.1582583773357; 
 Mon, 24 Feb 2020 14:36:13 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id k12sm1052351edq.27.2020.02.24.14.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:36:12 -0800 (PST)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d22dbdc5-efff-0678-4227-7ab4585916a7@xen.org>
Date: Mon, 24 Feb 2020 22:36:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1581951935-5279-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH V2] iommu/arm: Don't allow the same
 micro-TLB to be shared between domains
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTcvMDIvMjAyMCAxNTowNSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IEZvciB0aGUgSVBNTVUtVk1TQSB3ZSBuZWVkIHRvIHByZXZlbnQgdGhl
IHVzZSBjYXNlcyB3aGVyZSBkZXZpY2VzCj4gd2hpY2ggdXNlIHRoZSBzYW1lIG1pY3JvLVRMQiBh
cmUgYXNzaWduZWQgdG8gZGlmZmVyZW50IFhlbiBkb21haW5zCj4gKG1pY3JvLVRMQiBjYW5ub3Qg
YmUgc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMsIHNpbmNlIGl0Cj4gcG9pbnRz
IHRvIHRoZSBjb250ZXh0IGJhbmsgdG8gdXNlIGZvciB0aGUgcGFnZSB3YWxrKS4KPiAKPiBBcyBl
YWNoIFhlbiBkb21haW4gdXNlcyBpbmRpdmlkdWFsIGNvbnRleHQgYmFuayBwb2ludGVkIGJ5IGNv
bnRleHRfaWQsCj4gd2UgY2FuIHBvdGVudGlhbGx5IHJlY29nbml6ZSB0aGF0IHVzZSBjYXNlIGJ5
IGNvbXBhcmluZyBjdXJyZW50IGFuZCBuZXcKPiBjb250ZXh0X2lkIGZvciB0aGUgYWxyZWFkeSBl
bmFibGVkIG1pY3JvLVRMQiBhbmQgcHJldmVudCBkaWZmZXJlbnQKPiBjb250ZXh0IGJhbmsgZnJv
bSBiZWluZyBzZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9s
ZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+CgpJdCB3b3VsZCBiZSBnb29kIHRvIGdldCBhIHJldmlldyBmcm9tIFlvc2hp
aGlyby4gSWYgSSBkb24ndCBzZWUgYW4gCmFuc3dlciBieSB0aGUgZW5kIG9mIHRoZSB3ZWVrLCBJ
IHdpbGwgY29tbWl0IHdpdGhvdXQgaXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
