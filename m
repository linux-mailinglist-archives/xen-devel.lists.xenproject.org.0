Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E3C9AF1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 11:44:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxcH-000174-6R; Thu, 03 Oct 2019 09:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cg2n=X4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iFxcG-00016z-Bs
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 09:41:44 +0000
X-Inumbo-ID: 01dc5bb0-e5c2-11e9-9bee-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01dc5bb0-e5c2-11e9-9bee-bc764e2007e4;
 Thu, 03 Oct 2019 09:41:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j19so1962923lja.1
 for <xen-devel@lists.xen.org>; Thu, 03 Oct 2019 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AHUIYAWSpb+JfN2hpKoYe0hQISyyC27xi3KXDoavcdg=;
 b=VBBjAEEksc1t5wwjV7Hk5+HX0ZIvDf53FoNtdpJ29+Eot41POPDdlzOJWFmzsr6NoO
 QvGVssUcBKQQiLZ+/QJfVO0K0rYBvXzrWDzantC5OV4GrCo7g/wJEAYKv/pbWJCRIlT1
 OoytC9Yz5TocDvKbbwfhJNA8vJmmts+Huli39pieDcrKT3oaYp+5vumnxxzYmT760tna
 /ZTRismKw/WFWGV+mm069f11f55j9mmAL2nMpqZVa+QKgzJUOrLKohHUmFrwWV/atQF5
 122vtYpFLYvgsP3Rmke1kqBzb6HWIFhqxvCr0khozSP55VErROO7yMEwHqeqIxmXGTtJ
 jzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AHUIYAWSpb+JfN2hpKoYe0hQISyyC27xi3KXDoavcdg=;
 b=WFLeilq4oDbZ8XUwG0gFrzpFzyO+8wIu36idF/XVX/j6HH9PMIklfwuCX1apiOZ02m
 PA/0O59oRytT+2L4h3J+9W95i23FFmrR6Xt3CVfo4mo6r3Yfff1mUoAu7B0z0LUQDnD6
 ATekRdv7Runt3jD4FVAGKE216Zl+pCLdQ+DKolLy3GDOMVFXbMgNci9MDjSib8+KywiG
 MgUsMQQsFtrla85c7xCjReBUq8Rwhnw9QGI0mSyN79db+3DKXDW4OkawiqupL+sZNxWw
 JiIcngsYyVq6XLenozuTuy8tmqcyZkhBgUcOjq6U1uJByTA2GqI8e82ivK3juBbRa6qB
 fOxQ==
X-Gm-Message-State: APjAAAV+AeAI61moOHpchGUSHne6Wa3jbgK4MbDty3KNEDs8GhobcTbi
 XwsFtZNgCxOHuDE0U5S0l8Y=
X-Google-Smtp-Source: APXvYqxT5ZA0JWc4kaRETqqS+z1YKXbRIHCXWkQE7jvaQ6vTxsJMwvNwecLR5ykYlk+jRlII/I9NgQ==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr5627406lji.101.1570095702128; 
 Thu, 03 Oct 2019 02:41:42 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id 28sm338444lfy.47.2019.10.03.02.41.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 02:41:41 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-5-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <24969c37-cd89-c213-8d64-62eb4eb13f54@gmail.com>
Date: Thu, 3 Oct 2019 12:41:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930233032.2120-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7b 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, julien.grall@arm.com,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjEwLjE5IDAyOjMwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSBTdGVmYW5v
Cgo+ICsKPiArICAgIC8qIElmIHhlbl9mb3JjZSwgd2UgaWdub3JlIElPTU1VIGZhaWx1cmVzLiAq
Lwo+ICsgICAgcmVzID0gaW9tbXVfYWRkX2R0X2RldmljZShub2RlKTsKPiArICAgIGlmICggcmVz
IDwgMCApCj4gKyAgICAgICAgcmV0dXJuIHhlbl9mb3JjZSA/IDAgOiAtRUlOVkFMOwoKQW55IHNw
ZWNpZmljIHJlYXNvbiB0byByZXR1cm4gLUVJTlZBTCBpZiBub3QgZm9yY2luZyAod2h5IGRvbid0
IHJldHVybiAKcmVzKT8KCgo+ICsKPiArICAgIHJlcyA9IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2Uo
a2luZm8tPmQsIG5vZGUpOwo+ICsgICAgcmV0dXJuIHJlczsKCmNvdWxkIGJlIG9wdGltaXplZDoK
CnJldHVybiBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKGtpbmZvLT5kLCBub2RlKTsKCgotLSAKUmVn
YXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
