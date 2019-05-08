Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E53317E22
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:33:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOPT9-0002Bp-Ed; Wed, 08 May 2019 16:30:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TsEx=TI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hOPT8-0002Bk-9r
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:30:58 +0000
X-Inumbo-ID: a7bb5223-71ae-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7bb5223-71ae-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 16:30:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 14so248573ljj.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=A2FCmW41IBZSOaF4wrpdk+qr2jpZjEzvC8NGQuT6Sak=;
 b=A9B+siWkaEFc9Uj/dJhk7iNwnhb+YUH/86a9ji9irKPCjv1/O5kGOfrxA8UP2qGl3k
 9jbHosrn9AxTBI1BPgaR7yXwSSQ81MnWjKfnAmFYYi4gQB/rbpBSlqGfxZXMWYqnrT+g
 vnX12btO9BE09YdgfNH9qlyZxJZkInc43OxE5WyEWOaQBtDYFcsgeRh18Pa5ccWxPKK9
 5h3VQacTU/LAScPuLCDZV+OggDgKolyL7hoXFTMS2ZLiJEQzWdclqNrjMro5m9enC9Lx
 Ch3IbzeJUotP0yoqVIdL6yZb9Zl0Yxsj9bq43R0tj6tqsv+XLCVRmncR8M+fM5vIQYjW
 KXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A2FCmW41IBZSOaF4wrpdk+qr2jpZjEzvC8NGQuT6Sak=;
 b=QjezGn/TXQ/uJddxIhJ/ReU0nxe5UGfnDf/aOLN+5toO/YuHfLFIiDjXYB1LavT80L
 qMzkQUWI547IFnl6Bnq5imb9PhuT2W8nS4C1PUx+ccAZvrvyuy4ZdvR9AFakhv9R2drO
 dOn5qBaDWdBtSN9mtrACiJfJVJeFfq82SYbPwc0/+dyvnawdTcnIS/+eUP+vK15/2db4
 PpgpkntDzFiTldSKSWrWMxUljftk/rWe8k2oP+5f2jqK4Tod7uqbcABvj5spl3pvCj6C
 a9rPV0xIG0hazjV/bOxDw/lK1EV+fcULBWXSEaRI+9ZLQEEUQdjMr4RYiGxbx2P0KEmC
 2DEg==
X-Gm-Message-State: APjAAAV6kcyj89KLO3mkhLrL7rPsCxuVLcJF2bcnrC+o3GsJSyHUABDw
 s4X7++eLHhe+2W/HeLR5Jko=
X-Google-Smtp-Source: APXvYqzX2IS3VsyJWVHNWCwe5RgKlRMqpSa1VdQ9Qyvpqo2A/TJ6VmAhm2TNI2YMs91OJuJdvc47Aw==
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr22019971ljj.104.1557333055836; 
 Wed, 08 May 2019 09:30:55 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q125sm3993621ljb.76.2019.05.08.09.30.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 09:30:54 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <ec3339b0-6588-2a54-d0db-1e9c157f9259@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <128c02c6-412a-bb65-c665-133c525e506e@gmail.com>
Date: Wed, 8 May 2019 19:30:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ec3339b0-6588-2a54-d0db-1e9c157f9259@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 0/4] Renesas Stout board support (R-Car
 Gen2)
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

Ck9uIDA4LjA1LjE5IDE5OjE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IE9uIDAyLzA1LzIwMTkgMTg6MDAsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+PiBPbGVrc2FuZHIgVHlzaGNoZW5rbyAoNCk6Cj4+IMKgwqAgeGVuL2FybTogZHJp
dmVyczogc2NpZjogRXh0ZW5kIGRyaXZlciB0byBoYW5kbGUgb3RoZXIgaW50ZXJmYWNlcwo+PiDC
oMKgIHhlbi9hcm06IGRyaXZlcnM6IHNjaWY6IEFkZCBzdXBwb3J0IGZvciBTQ0lGQSBjb21wYXRp
YmxlIFVBUlRzCj4KPiBJIGhhdmUgbWVyZ2VkIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBpbiBteSBi
cmFuY2ggeGVuLTQuMTMuIEkgd2lsbCAKPiBtZXJnZSB0aGVtIGluIHN0YWdpbmcgb24gdGhlIHRy
ZWUgaXMgcmVvcGVuZWQuCgpUaGFuayB5b3UhCgoKSnVzdCB0byBjbGFyaWZ5OgoKV2UgYXJlIHdh
aXRpbmcgZm9yIHRoZSByZXZpZXcgZnJvbSBTdGVmYW5vIGZvciB0aGUgZm9sbG93aW5nIHBhdGNo
OgoKIltQQVRDSCBWNSAzLzRdIHhlbi9hcm06IEV4dGVuZCBTQ0lGIGVhcmx5IHByaW5rIGNvZGUg
dG8gaGFuZGxlIG90aGVyIAppbnRlcmZhY2VzIgoKCkFtIEkgY29ycmVjdD8KCgo+Cj4gQ2hlZXJz
LAo+Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
