Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4611017C897
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 23:56:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jALpq-0004ah-TT; Fri, 06 Mar 2020 22:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BnZ=4X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jALpp-0004ac-BN
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 22:52:49 +0000
X-Inumbo-ID: 32f4c7e0-5ffd-11ea-a8d3-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32f4c7e0-5ffd-11ea-a8d3-12813bfff9fa;
 Fri, 06 Mar 2020 22:52:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u9so4031012wml.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 14:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ASo089KEaSHLak161dupCvtd5NOLXi07QNBRsJx83s=;
 b=LzGlN3idxBQCWQpJszRDCAm/0yQbsO8IplT3l4PODQHG1eabafT6qpHcvtXiTUaV0s
 aDKcU7b3+1UiHu6aUpH0aZ331VLN9KykpJUF9BvnGQr6NRW9U6oTLyB19TS0bdTqLYC2
 0s0VDZn8Sk4h/WoKIMW4ktgJJgyfwFwBNjmsdukeU3/Kngb6jp6WROTX7Besrv+FiDIv
 1AVRBkg4+9tL6NjL8xeIrzfPD2tkg5NAZ2MPPWbe5XCv+3959qODdyHhtXH7E1HNqAc6
 FPzfMiXU0rGcv1MY/vqLrlXdcoFLtXPHjhUBmwjityAzV5RY4zNyK12aT1fsdkRis1rj
 Reug==
X-Gm-Message-State: ANhLgQ0QCukn447Sm+qrxhvo/VjxOo3l7jUFoHREM9J4jPWg99jg5Xds
 cExk9t0vcPIi3O31uOCMiqk=
X-Google-Smtp-Source: ADFU+vvZelEfYIeQXkjGQlcC2c3H4EUxko0v1mOvo97fvVbITUxDNvDuPiQTxXNydj6WfXdQr/aMKQ==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr6235759wmj.170.1583535167065; 
 Fri, 06 Mar 2020 14:52:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id f8sm7977475wmf.20.2020.03.06.14.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 14:52:46 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-2-dwmw2@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <09caa9de-9572-17f4-d935-fc5b56b2239f@xen.org>
Date: Fri, 6 Mar 2020 22:52:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-2-dwmw2@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/8] x86/setup: Fix badpage= handling for
 memory above HYPERVISOR_VIRT_END
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAwMS8wMi8yMDIwIDAwOjMyLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
ICAvKgo+ICAgICogSGFuZCB0aGUgc3BlY2lmaWVkIGFyYml0cmFyeSBwYWdlIHJhbmdlIHRvIHRo
ZSBzcGVjaWZpZWQgaGVhcCB6b25lCj4gICAgKiBjaGVja2luZyB0aGUgbm9kZV9pZCBvZiB0aGUg
cHJldmlvdXMgcGFnZS4gIElmIHRoZXkgZGlmZmVyIGFuZCB0aGUKPiBAQCAtMTc5OSwxOCArMTgx
MSwyMyBAQCBzdGF0aWMgdm9pZCBpbml0X2hlYXBfcGFnZXMoCj4gICAgICAgewo+ICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgbmlkID0gcGh5c190b19uaWQocGFnZV90b19tYWRkcihwZytpKSk7Cj4g
ICAKPiArICAgICAgICAvKiBJZiB0aGUgKGZpcnN0KSBwYWdlIGlzIGFscmVhZHkgbWFya2VkIGJy
b2tlbiwgZG9uJ3QgYWRkIGl0LiAqLwo+ICsgICAgICAgIGlmICggcGdbaV0uY291bnRfaW5mbyAm
IFBHQ19icm9rZW4gKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgIGlm
ICggdW5saWtlbHkoIWF2YWlsW25pZF0pICkKPiAgICAgICAgICAgewo+ICsgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGNvbnRpZ19ucl9wYWdlcyA9IGNvbnRpZ19hdmFpbF9wYWdlcyhwZyArIGks
IG5yX3BhZ2VzKTsKCkkgc3BlbnQgdGhlIGV2ZW5pbmcgY2hhc2luZyBhIGJ1ZyBkdWUgdG8gdGhp
cyBjaGFuZ2UuIFhlbiBtYXkgZ2l2ZSB0byAKaW5pdF9oZWFwX3BhZ2VzKCkgYSByYW5nZSB0aGF0
IGNyb3NzZXMgTlVNQSBub2RlLgoKY29udGlnX2F2YWlsX3BhZ2VzIHdpbGwgZ28gdGhyb3VnaCB0
aGUgcmFuZ2UgW3BnICsgMSwgcGcgKyBpICsgCm5yX3BhZ2VzKS4gQXMgbnJfcGFnZXMgY29ycmVz
cG9uZHMgdG8gdGhlIG51bWJlciBvZiBwYWdlcyBpbiB0aGUgCm9yaWdpbmFsIHJhbmdlLCB3ZSBt
YXkgb3ZlcnJ1biB0aGUgZnJhbWV0YWJsZSBhbmQgY3Jhc2guCgpTbyBJIHRoaW5rIHlvdSB3YW50
IHRvIHVzZSBjb250aWdfYXZhaWxfcGFnZXMocGcgKyBpLCBucl9wYWdlcyAtIGkpLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
