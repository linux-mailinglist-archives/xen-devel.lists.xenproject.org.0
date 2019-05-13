Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BA1BA20
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCtV-0008PU-EV; Mon, 13 May 2019 15:29:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQCtU-0008PN-50
 for xen-devel@lists.xen.org; Mon, 13 May 2019 15:29:36 +0000
X-Inumbo-ID: e87e81ab-7593-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e87e81ab-7593-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:29:34 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v18so9423647lfi.1
 for <xen-devel@lists.xen.org>; Mon, 13 May 2019 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ke7hR50yNcOKUpt6mIyf1ikjRrJvn80erManiLo7ElM=;
 b=o2UkQC6C7bFKV6bWvIwOlr0FLGnA4nqJmONlA0+fwl1yvttPoxWelxNR3gaXNCw4LV
 0uF/ANtjxZp7DTqSezme18w7T7uWE0v5/G03FXJ08Po14KsLiLFAifEaE6MQVuxrVd0y
 IBLi4+y522GAN6NvKx5oPRH6l4GKGCR/eZuQzvXL0R/GYrUZ5F97VbB7rdNc8JrrzxDQ
 ezY2BD3+TfQ1kyJCUj47JhkbyGN57cEJMyx7iuNq1Z53Aw+zZnUclY5B2sdYQ3TNAlbA
 dQLWZdfjpbSuIw8tDZ32pZ7iWUO5hntixPafSINsPBd7TKOCFMwRglr36Zv5olQrX0vm
 NHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ke7hR50yNcOKUpt6mIyf1ikjRrJvn80erManiLo7ElM=;
 b=cepCdRbuc1asmWQvV/fsej0TzC7Z9gTFUyDFYteve6JvRQHBiyp20DQis7IK86a044
 9wYn3kJfieO1onExCkkhiwEiILCR7e3PBpW0v+Ee6+WetX6izlVS19jZb9MLZr3a4i3C
 9/nnA6H9ygFBlnyKOXkmrL/1iKrgJXf9haLSo5bln5oA3nbyBOfrTVdBr7HY4lFHuthM
 fdyspBrmiqu6XJVQKqs4JpZ5PLYHQmHMQQHZw3lzSuN56NBvaZ+ApE8rRGvhcR6zbqy2
 jxi92JlrFSCvybHrxd2WSY93aqSF1hMjZkLdw6Y1wVw8dQQRovXywwX20JWcCCGeOGlZ
 mPgQ==
X-Gm-Message-State: APjAAAVkoxqjIc/IF3BHyOIVFKwdCcgC0nJwW384h5hyPaUV8hrLLEGU
 PkKhC11ELjZF7e2eehWjx80=
X-Google-Smtp-Source: APXvYqw4pqBrv52nmVorAcyYRaAej6RhV+sAvC8yiUfJs77cKVYrKqHkJ67Z9MhxjlUhcWEzZKHirQ==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr4488083lfd.15.1557761372608; 
 Mon, 13 May 2019 08:29:32 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u6sm3236462lfu.5.2019.05.13.08.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 08:29:31 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
 <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
Date: Mon, 13 May 2019 18:29:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy4wNS4xOSAxNzozNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE15IHBvaW50IG9mIG15
IG1lc3NhZ2UgaXMgdG8gdW5kZXJzdGFuZCB0aGUgZXhhY3Qgd29ya2xvYWQvc2V0dXAgeW91IGFy
ZSB1c2luZy4gImRkIiB3YXMgbm90IGFuIGVudGlyZWx5IG9idmlvdXMgY2hvaWNlIGZvciBDUFVC
dXJuIGFuZCBHb29nbGUgZGlkbid0IHByb3ZpZGUgYSBsb3Qgb2Ygd2Vic2l0ZSBiYWNraW5nIHRo
aXMgaW5mb3JtYXRpb24uCgo+IEFueXdheSwgbm93IEkgdW5kZXJzdGFuZCBhIGJpdCBtb3JlIHRo
ZSB3b3JrbG9hZCwgYSBjb3VwbGUgb2YgbW9yZSBxdWVzdGlvbnM6Cj4gIMKgwqAgLSBIb3cgbWFu
eSB2Q1BVcyBhcmUgeW91IHVzaW5nIGluIGVhY2ggZG9tYWluPwo+ICDCoMKgIC0gV2hhdCBzY2hl
ZHVsZXIgYXJlIHlvdSB1c2luZz8KPiAgwqDCoCAtIFdoYXQgaXMgdGhlIGFmZmluaXR5PwoKRm9y
IHRoZSB0ZXN0IHdpdGggZ2xtYXJrMjogRG9tMCAoNCBWQ1BVcyksIERvbUQgKDQgVkNQVXMpLCA0
IFBDUFVzLCBubyBhZmZpbml0eSBzcGVjaWZpZWQuCgpGb3IgdGhlIHRlc3Qgd2l0aCBUQk06IERv
bTAgKDIgVkNQVXMpIHBpbm5lZCB0byBQQ1BVcyAwIGFuZCAxLCBhbmQgVEJNIGRvbWFpbiB3aXRo
IG9uZSBWQ1BVIHBpbm5lZCB0byBQQ1BVIDIuCgpUaGUgc2NoZWR1bGVyIGlzIGRlZmF1dCAoY3Jl
ZGl0MikuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
