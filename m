Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C125817515
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 11:24:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOIkv-0002rv-Dk; Wed, 08 May 2019 09:20:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TsEx=TI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hOIku-0002rq-JW
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 09:20:52 +0000
X-Inumbo-ID: 9217443d-7172-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9217443d-7172-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 09:20:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w23so13991484lfc.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aaN8T0/Igx//sDVBzIWcIr29i9DlJ9COTzhBMfwXIPE=;
 b=ZrtENce/P2UeNy05hKeVr+PCoDFolv25jEvchnXnuWkfeXn4W3/6QdTUR1WVxo+V1e
 J1SHmu3XIjRJzbeeUGoE79s+UPhr5eXpzBDf3i/qun5tSyoU6nYf/UJqHVf84wQRkpIp
 iA+IIhmVo1XdSu/w3DWvXZonnmYYXxFzNUoBc5GtV6SDFZ0n6pj4CxFy0XnLQNLHVwFg
 WpME7jK2XiD6FrEZAfe1mqY3pAIYSrUkbUkMgLVh+98iy/a5Oi/OxpbwNZ691iiCCziu
 lG+ofsBVapC0ttgkjz5A125D2XkSaCV0bGYq2IZn/XJPA0jI083gVy5XSquO5ICgfGsW
 xqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aaN8T0/Igx//sDVBzIWcIr29i9DlJ9COTzhBMfwXIPE=;
 b=N/I3inJ315XXNoGTCog3OazoN4gmtpwl6Eh9h8rvO8fKze2+EdXV0n22HNFksV24OA
 ePWQzSaWASpuksjjyvtSw5to029MZjji2Rn3cCq+0y1f4qLIWB6dGzwdcMUxVHyZ3WiB
 QIkYbmOoIEYjXaOAcwKAwssK0Zm2PXKF+dwag48Batm773/rHN7YYuE/2sucLc2sAouC
 XN634tJERk6o9dQIzCyBFJh+vmUp0JULt+HBYZ+Dj3FVG9R/u5QnwIjYQ9fdelwrb4el
 6w4pP3/qewrGx9rA3+jspYyQvfJ7I7YPpTh5tZesEqxdr71lC7ZZ7Eo/ZNqOMji3qLif
 emhQ==
X-Gm-Message-State: APjAAAUHGKzDEU8+AVbBXxwZv0q70msUWzhnw+8UbryHhv34s52EmGOF
 50wxCfziLQo7XLteHsFtvfU=
X-Google-Smtp-Source: APXvYqyWzDY5s5wcrry6PiLQ5ZWWCTxoeJeiRJX9veGt7Mb0ZZTjRGzSJ2GoWhth/PGza5alKmGbNQ==
X-Received: by 2002:ac2:4479:: with SMTP id y25mr9550958lfl.95.1557307249671; 
 Wed, 08 May 2019 02:20:49 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id j24sm3688380lfh.28.2019.05.08.02.20.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 02:20:49 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <1556816422-25185-4-git-send-email-olekstysh@gmail.com>
 <06cd7a91-e70b-1eeb-bafb-d59a7f5d4d2b@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <81ae5be3-42ea-ab0e-f887-0ccc1e9dcfb6@gmail.com>
Date: Wed, 8 May 2019 12:20:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <06cd7a91-e70b-1eeb-bafb-d59a7f5d4d2b@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 3/4] xen/arm: Extend SCIF early prink
 code to handle other interfaces
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

Ck9uIDA3LjA1LjE5IDE5OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+IE9uIDUvMi8xOSA2OjAwIFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
wqAgZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0wqDCoMKgIHzCoCA1ICsrKysrCj4+IMKg
IHhlbi9hcmNoL2FybS9SdWxlcy5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKysr
KysrCj4+IMKgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8IDE3ICsrKysrKysr
KysrLS0tLS0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4
dCAKPj4gYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKPj4gaW5kZXggYjIzYzU0Zi4u
ODllMDgxZSAxMDA2NDQKPj4gLS0tIGEvZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0Cj4+
ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+PiBAQCAtMjcsNiArMjcsMTEg
QEAgCj4+IENPTkZJR19FQVJMWV9QUklOVEs9PElOQz4sPEJBU0VfQUREUkVTUz4sPE9USEVSX09Q
VElPTlM+Cj4+IMKgwqDCoMKgwqDCoMKgIElmIDxCQVVEX1JBVEU+IGlzIG5vdCBnaXZlbiB0aGVu
IHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwo+PiDCoMKgwqDCoMKgwqDCoCBpbml0aWFsaXplIHRo
ZSBVQVJULCBzbyB0aGF0IGJvb3Rsb2FkZXIgb3IgZmlybXdhcmUgc2V0dGluZ3MgY2FuCj4+IMKg
wqDCoMKgwqDCoCBiZSB1c2VkIGZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHkuCj4+ICvCoCAtIHNj
aWYsPEJBU0VfQUREUkVTUz4sPFZFUlNJT04+Cj4+ICvCoMKgwqAgLSBTQ0lGPFZFUlNJT04+IGlz
LCBvcHRpb25hbGx5LCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gb2YgdGhlIFVBUlQuCj4+ICsKPj4g
K8KgwqDCoMKgwqAgSWYgPFZFUlNJT04+IGlzIG5vdCBnaXZlbiB0aGVuIHRoZSBkZWZhdWx0IGlu
dGVyZmFjZSB2ZXJzaW9uIAo+PiAoU0NJRikKPj4gK8KgwqDCoMKgwqAgd2lsbCBiZSB1c2VkLgo+
Cj4gVGhpcyBwYXRjaCBub3cgbG9va3MgZ29vZC4gSSB3b3VsZCBsaWtlIHNvbWUgaW5wdXQgZnJv
bSBTdGVmYW5vIG9uIHRoZSAKPiB3b3JkaW5nIGhlcmUgYmVmb3JlIGl0IGdldHMgbWVyZ2VkLgpJ
IHVuZGVyc3RhbmQuIFRoYW5rIHlvdS4KCgo+Cj4gQ2hlZXJzLAo+Ci0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
