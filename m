Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EE41F5C1
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 15:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQu85-0005f2-5t; Wed, 15 May 2019 13:39:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzW7=TP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hQu83-0005ex-Ki
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 13:39:31 +0000
X-Inumbo-ID: dd2c55c6-7716-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dd2c55c6-7716-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 13:39:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r76so2520320lja.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=D3D4nPFILoSPIEmccGa3O7dNoHYUdqV6OFLUNIDt2cM=;
 b=nfxDS5Evs8ZWJm1wZlHNwHpGfplIbwwZUIZkdoyFL3OrjTt5Pkki1v/mFrVz9voJnW
 Ilc/y1U0Kzi/PBeTn7CpS1/jXc8dTvfPl06VGTtj/yfGDAsiuUkfhWl0720T+mQB7mBu
 i0fY+YcBdIThFL0VQ8zwZqdHNVX2hZ1aTgjaQKbT/a3IbB6doe1qLD0oHnhmA7Q+C9jk
 VRGI158A/XNakaOLsnBcQ3F578ce5OYhu6cCiFMgvhHO4eIDlqjmXHb7oQs+Mse5pg4/
 Ae/BZn3CfNzqRRX2V78a0xT3Yx2pfiOenDAN04p8SIJbhTqSzVJHAMZLo/sf1LbHa+ua
 mFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D3D4nPFILoSPIEmccGa3O7dNoHYUdqV6OFLUNIDt2cM=;
 b=AO1bfzw7M3lNeq2F2ik+0cogt17sPi/w0E7p6MYLyRoo5kqi/msM5cwUPkxhgO6Bvs
 wjbsc9yoIpRxlAejgrvfDwgTxp+dyG3MACvoj0CE1fXktfVhPSS+TItfWHMRXZEcpgMA
 C/9aJk+7j04XmmLj6/jkQ9KRC+E6sfiQKp55ilUWzQdb0gzCfFntb8prp5utZPzRMEi/
 4mKfbqELfyUSAa6YZB1OlpyD9Q0WFIEw5F2vzCvInIN8hK/y/pnn3iF2EDthppgsMSf1
 1eEoSxN9IREfWKT6znbIuWYOIfQlMh254XR3fYQx9ZOSDUTnOg1cOQTJzaYDe2Sw+p1K
 7BeQ==
X-Gm-Message-State: APjAAAXTlMYgbwmF43v41XX+SsMeQSUWh552/Yv45X5nQx6aN9EejG8p
 kLXltyPuEl7r1XLaMFWML1w=
X-Google-Smtp-Source: APXvYqzLBF8qpL2++8PE6F/a1tfiN9xaC7oFUY8Cu2zXiGcZ0E8WFRGns2E/5EfxJSs1gW3rGFS7+g==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr14919528ljj.137.1557927568975; 
 Wed, 15 May 2019 06:39:28 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id b23sm391174lfg.41.2019.05.15.06.39.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 06:39:28 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2d610735-2354-ac4b-980a-7961d689a5af@gmail.com>
Date: Wed, 15 May 2019 16:39:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/10] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 JBeulich@suse.com, andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjA1LjE5IDAwOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSwgU3RlZmFu
bwoKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMKPiBpbmRleCBlZmI2Y2E5Li42YWRmYTU1IDEwMDY0NAo+IC0tLSBhL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
Cj4gQEAgLTUyLDcgKzUyLDggQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9uZyBz
LCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsCj4gICAgICAgICAgICAqIC0ge3VufW1hcF9t
bWlvX3JlZ2lvbnMgZG9lc24ndCBzdXBwb3J0IHByZWVtcHRpb24uCj4gICAgICAgICAgICAqLwo+
ICAgCj4gLSAgICAgICAgcmMgPSBtYXAtPm1hcCA/IG1hcF9tbWlvX3JlZ2lvbnMobWFwLT5kLCBf
Z2ZuKHMpLCBzaXplLCBfbWZuKHMpKQo+ICsgICAgICAgIHJjID0gbWFwLT5tYXAgPyBtYXBfbW1p
b19yZWdpb25zKG1hcC0+ZCwgX2dmbihzKSwgc2l6ZSwgX21mbihzKSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fbW1pb19kaXJlY3QpCgpOb3QgcmVhbGx5
IHN1cmUgdGhlIFZQQ0kgaXMgdXNlZCBvbiBBUk0sIGJ1dCB4ZW4vZHJpdmVycy92cGNpLyBsb29r
cyAKbGlrZSBhIGNvbW1vbiBjb2RlLgoKQnV0LCBhY2NvcmRpbmcgdG8gdGhlIGNvbW1pdCBkZXNj
cmlwdGlvbiwgd2Ugc2hvdWxkIHBhc3MgCiJwMm1fbW1pb19kaXJlY3QiIG9uIHg4NiBhbmQgInAy
bV9tbWlvX2RpcmVjdF9kZXYiIG9uIEFSTS4uLgoKPiAgICAgICAgICAgICAgICAgICAgICAgICA6
IHVubWFwX21taW9fcmVnaW9ucyhtYXAtPmQsIF9nZm4ocyksIHNpemUsIF9tZm4ocykpOwo+ICAg
ICAgICAgICBpZiAoIHJjID09IDAgKQo+ICAgICAgICAgICB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oCgotLSAKUmVn
YXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
