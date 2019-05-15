Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84391FA45
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 20:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQz3Q-0005YL-4L; Wed, 15 May 2019 18:55:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzW7=TP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hQz3O-0005YG-Uq
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 18:55:03 +0000
X-Inumbo-ID: f0ee99c8-7742-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f0ee99c8-7742-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 18:55:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d8so627622lfb.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5sGhzphuVQdfoih0VE7ys2uya8g1L0i7yLxq3QPf7ek=;
 b=h0Qe5GD8PQdCN4+0XRLgtfwaJSbLmgdk87BvMneS7bdUL+SY/iJ584gTLLT3R0rMGO
 OX+lvsEo7voYTXxLF7679cHYkGDdfV2ZyMHWQAHUAIn6xPkwUGqMMTLyyFyLt2lmg94c
 8H6+Wk5Olwmktuc+xk+2R3VsgUQ+PlDPbcq5+q8Yq1BUFp20axc7pp1lwWvsAQMVMl+w
 ZTjCHmnXa6muVzXdWPRL1Se8YPvosIQiEGp3kTIDGpFoWvYRDGB8GJv1j1j2FQe8SuUE
 cEDkqu/ELB1/W0NgZpsSHwuOS5wqy+qSvPoo6qg62oxfRA5V14bRPtQgM/rreOB5o+V6
 AXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5sGhzphuVQdfoih0VE7ys2uya8g1L0i7yLxq3QPf7ek=;
 b=tvwNEwEgBM5XaiJxoVSAmPnx8tLqMlSvW4GQEuGFwajalG2nSWNz/Qz0da09Pe4Iak
 bw/l4wG68BjBSrJYZi9uSJdCgmrkfGSSiq5Akzym0Zchzu7nCMua/BJbBlD7dZ8lNljm
 oFh7ylPk6C2q3W3LIa8ouwSDKudG5XBapO7QXekeNacqXtnsba2HMUjRl5GPumXJ2hCl
 80TXqo/PQR9jKghl3MTLBNj0GjmXyxTE8zMrrZEFNCoo98FYdpvRQ1YneErhqjGTiNzH
 96QGPGzs5POVaTXD8ULPTPko/dEDuxlZbMovAkPm0Nh/hbxPAU/o8Iiydt2/7GeaSAYU
 p+fw==
X-Gm-Message-State: APjAAAWdKtmNmICp0QD2RHOMBRdK9qcwafihOBXmK3FNJpTUMilHmkjO
 kam5xe/iiRzYldZTeuViUlA=
X-Google-Smtp-Source: APXvYqzjHhk2/Qfj199Wa6oWOBxQPLjho3kK1QPK6ABhYVc1mrzv1OmLlB8QfNjE4HhJTm/KngVZIA==
X-Received: by 2002:ac2:4857:: with SMTP id 23mr7646665lfy.158.1557946500038; 
 Wed, 15 May 2019 11:55:00 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id s12sm469493ljd.66.2019.05.15.11.54.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 11:54:59 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <60d23898-7e91-bb59-5bc8-b36d06452f28@gmail.com>
Date: Wed, 15 May 2019 21:54:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAzLjA1LjE5IDIwOjAyLCBBbWl0IFNpbmdoIFRvbWFyIHdyb3RlOgoKSGksIEFtaXQKCj4g
WEVOIHNob3VsZCBub3QgZm9yd2FyZCBQUElzIHRvIERvbTAgYXMgaXQgb25seSBzdXBwb3J0IFNQ
SXMuCj4gT25lIG9mIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBpcyB0byBza2lwIGFueSBkZXZp
Y2UgdGhhdAo+IHVzZXMgUFBJIHNvdXJjZSBjb21wbGV0ZWx5IHdoaWxlIGJ1aWxkaW5nIGRvbWFp
biBpdHNlbGYuCj4KPiBUaGlzIHBhdGNoIGdvZXMgdGhyb3VnaCBhbGwgdGhlIGludGVycnVwdCBz
b3VyY2VzIG9mIGRldmljZSBhbmQgc2tpcCBpdAo+IGlmIG9uZSBvZiBpbnRlcnJ1cHQgc291cmNl
IGlzIFBQSS4gSXQgZml4ZXMgWEVOIGJvb3Qgb24gaS5NWDhNUSBieQo+IHNraXBwaW5nIFBNVSBu
b2RlLgo+Cj4gU3VnZ2VzdGVkLWJ5OiAgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBBbWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5j
b20+Cj4gLS0tCj4gICAgICAqIFRoaXMgcmVwbGFjZXMgZm9sbG93aW5nIHBhdGNoLgo+ICAgICAg
ICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODk5ODgxLwo+IC0tLQo+ICAg
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTYgKysrKysrKysrKysrKysrLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMKPiBpbmRleCBkOTgzNjc3Li44ZjU0NDcyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBA
IC0xMzUzLDcgKzEzNTMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9kZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+ICAgICAgICAgICB7IC8qIHNl
bnRpbmVsICovIH0sCj4gICAgICAgfTsKPiAgICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmNo
aWxkOwo+IC0gICAgaW50IHJlczsKPiArICAgIGludCByZXMsIGksIG5pcnEsIGlycV9pZDsKPiAg
ICAgICBjb25zdCBjaGFyICpuYW1lOwo+ICAgICAgIGNvbnN0IGNoYXIgKnBhdGg7Cj4gICAKPiBA
QCAtMTM5OSw2ICsxMzk5LDIwIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4gICAgICAgICAgIHJldHVy
biAwOwo+ICAgICAgIH0KPiAgIAo+ICsgICAgLyogU2tpcCB0aGUgbm9kZSwgdXNpbmcgUFBJIHNv
dXJjZSAqLwo+ICsgICAgbmlycSA9IGR0X251bWJlcl9vZl9pcnEobm9kZSk7Cj4gKwo+ICsgICAg
Zm9yICggaSA9IDAgOyBpIDwgbmlycSA7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgaXJxX2lk
ID0gcGxhdGZvcm1fZ2V0X2lycShub2RlLCBpKTsKCkRvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5n
IGhlcmUgaWYgcGxhdGZvcm1fZ2V0X2lycSgpIHJldHVybnMgLTE/Cgo+ICsKPiArICAgICAgICBp
ZiAoIGlycV9pZCA+PSAxNiAmJiBpcnFfaWQgPCAzMiApCj4gKyAgICAgICAgewo+ICsgICAgICAg
ICAgICBkdF9kcHJpbnRrKCIgU2tpcCBub2RlIHdpdGggKFBQSSBzb3VyY2UpXG4iKTsKPiArICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKPiAgICAgICAvKgo+
ICAgICAgICAqIFhlbiBpcyB1c2luZyBzb21lIHBhdGggZm9yIGl0cyBvd24gcHVycG9zZS4gV2Fy
biBpZiBhIG5vZGUKPiAgICAgICAgKiBhbHJlYWR5IGV4aXN0cyB3aXRoIHRoZSBzYW1lIHBhdGgu
CgpQYXRjaCBsb29rcyBnb29kLiBBbHRob3VnaCBSLUNhciBIMyBzZWVtcyB0byBub3QgdXNlIFBQ
SXMgZm9yIFBNVSwgSSAKaGF2ZSB0ZXN0ZWQgeW91ciBwYXRjaCBqdXN0IHRvIGJlIHN1cmUgaXQg
d291bGRuJ3Qgc2tpcCBhbnl0aGluZyBieSBhIAptaXN0YWtlKQoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
