Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08060860C6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgWS-0007H1-PG; Thu, 08 Aug 2019 11:23:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvgWR-0007Gu-Ft
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:23:55 +0000
X-Inumbo-ID: 00945abf-b9cf-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 00945abf-b9cf-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 11:23:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 62so61679118lfa.8
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LC77IWUekN8C0dTXUGhclOdftw9ZdW20ypIyYhloQFg=;
 b=YC4vEwSl4GhzZSjA1b1cvf4SDwKpdi/aCF3ok/USxSSakASZs/1a6K7ZI4b2pvREvd
 s92UwMZjUoHMk3xP2gNXGtJcaKsy5/Mwg0ajLdFsoRM39tgeciwG6XhczrBOOfX7o/sV
 GYNnp0zPXATAZ/zuJLS4TIZH/RzSQxKT648snH9p8AbnMfuENOshoviqRG0qXLvtSesl
 HZ7sO8zQQhiJMwk0ZNV8jvnWcNfLOkWKqszj8q9um46UtxMLUe+TiqWzAGpXZCcSSCmR
 F6gCM6okxm6qt+xTcBdnWp1Wn3Asbj5BtRBh13OnN/Wjt0amxIMw8yWxvQvSn3anuCgy
 9SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LC77IWUekN8C0dTXUGhclOdftw9ZdW20ypIyYhloQFg=;
 b=FXI4kbzZo4GYkWVVLxc1dly/GsV5O5YtX0b8ZammJNlRsh0y6rJ9CQSqIIf8iOj6UT
 0euNVsfn0c9H3VuJafH+0OTG4g0bh3EjRWDWvrhtHi19gJ+9KCbwz3SovJi/vcvYH7uL
 Fese+c0bS0DY6Q7v8TaYcdCi87SmBi+WUEehC2WhIi5MYx+cwWtOfh6MHLxGlbGxQdEh
 noj83ejX5y7HrV+jmlMCeN4N24o6gnDYZ6hjOx6r47g+KOtEc92Lkxm5kjz3PrWSAQMf
 G6JmEB8vRlqchBqWa8vepAl4OHhbpYfi7YZ8k7GOe6rtftjprSjU3MzNnZo9Y6XAPISM
 /chQ==
X-Gm-Message-State: APjAAAVjTrBM5X+gkRcODPOc4rPeClu6ItQruTLCDs+8avhdlgnzVLiI
 1RIe6KJMNM4vEAsvmfR+Ep0=
X-Google-Smtp-Source: APXvYqxY4kLNipKR8OZtMJaYInS0UTN23x4YDmsCAzHt1KvLETWcF+8sAYIYxHXbmOXq9O84/+buLw==
X-Received: by 2002:a19:6f4b:: with SMTP id n11mr8812128lfk.163.1565263432528; 
 Thu, 08 Aug 2019 04:23:52 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id j14sm18846608ljc.67.2019.08.08.04.23.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 04:23:52 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
Date: Thu, 8 Aug 2019 14:23:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
 sstabellini@kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA4LjA4LjE5IDE0OjAxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgoKSGksIFJvZ2VyLgoK
Cj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDE6NTM6MjNQTSArMDMwMCwgT2xla3NhbmRyIFR5
c2hjaGVua28gd3JvdGU6Cj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4KPj4gRG9uJ3Qgc2tpcCBJT01NVSBub2RlcyB3aGVuIGNy
ZWF0aW5nIERUIGZvciBEb20wIGlmIElPTU1VIGhhcyBiZWVuCj4+IGZvcmNpYmx5IGRpc2FibGVk
IGluIGJvb3RhcmdzIChlLmcuICJpb21tdT0wIikgaW4gb3JkZXIgdG8gbGV0Cj4+IHRoZSBJT01N
VSBiZSBhY2Nlc3NpYmxlIGJ5IERPTTAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBU
eXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4gLS0tCj4+IEkgaGF2
ZSBoZWFyZCB0aGVyZSBpcyBhICJwb3NzaWJsZSIgY2FzZSB3aGVuIHRoZSBJT01NVSBjb3VsZCBi
ZSBhY2Nlc3NpYmxlIGJ5IERPTTAuCj4+IFNvLCBJIHRoaW5rLCBmb3IgdGhpcyB0byB3b3JrIHdl
IG5lZWQgdG8gY3JlYXRlIGNvcnJlc3BvbmRpbmcgRFQgbm9kZXMgaW4gdGhlIERUCj4+IGF0IGxl
YXN0Lgo+IGRvbTAgb24gQVJNIGJlaW5nIGFuIGF1dG90cmFuc2xhdGVkIGd1ZXN0IEknbSBub3Qg
c3VyZSBob3cgaXQncyBnb2luZwo+IHRvIHByb2dyYW0gdGhlIERNQSByZW1hcHBpbmcgaW4gdGhl
IGlvbW11LCBzaW5jZSBpdCBkb2Vzbid0IGtub3cgdGhlCj4gbWZucyBvZiB0aGUgbWVtb3J5IGl0
IHVzZXMgYXQgYWxsLCBoZW5jZSBJIGRvbid0IHNlZSB0aGUgcG9pbnQgaW4KPiBleHBvc2luZyB0
aGUgaGFyZHdhcmUgaW9tbXUgdG8gZG9tMCB1bmxlc3MgdGhlcmUncyBzb21lIGVtdWxhdGlvbiBk
b25lCj4gdG8gbWFrZSBkb20wIGFibGUgdG8gYWNjZXNzIGl0LgoKQ3VycmVudGx5LCBEb20wIG9u
IEFSTSBpcyBhbHdheXMgMToxIG1hcHBlZCAoZ2ZuID09IG1mbikuIEhvd2V2ZXIsIEkgCmRvbid0
IHJlYWxseSBrbm93IGhvdyBsb25nIHRoaXMgYXNzdW1wdGlvbiBpdCBpcyBnb2luZyB0byBiZSB0
cnVlLgoKQmVpbmcgaG9uZXN0LCBJIGRvbid0IG5lZWQgdGhpcyB1c2UtY2FzZSBhdCB0aGUgbW9t
ZW50LiBJIGhhdmUgCmV4cGVyaW1lbnRlZCB3aXRoIHRoZSBjb2RlIHdoaWNoIGNyZWF0ZXMgRFQg
bm9kZXMgZm9yIERvbTAgYSBiaXQsIGFuZCAKcmVjb2xsZWN0ZWQKCmFib3V0IHRoZSBwb3NzaWJp
bGl0eSBmb3IgdGhlIElPTU1VIHRvIGJlIGFjY2Vzc2libGUgYnkgRG9tMC4gSWYgdGhpcyAKcGF0
Y2ggZG9lc24ndCBoYXZlIGFueSByZWFsIHZhbHVlLCBJIHdvdWxkIGJlIG9rIHRvIGp1c3QgZHJv
cCBpdC4KCj4KPiBUaGFua3MsIFJvZ2VyLgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNo
ZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
