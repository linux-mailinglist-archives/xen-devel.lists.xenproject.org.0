Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5481A21E
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 19:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP8v0-0000h5-6D; Fri, 10 May 2019 17:02:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=65qy=TK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hP8uy-0000h0-Rh
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 17:02:44 +0000
X-Inumbo-ID: 6cd080bd-7345-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6cd080bd-7345-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 17:02:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so4663894lfl.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2019 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=onh3GgGVoqwWpsMMZvb2s8Mpdf2uIjE1A3fFafrrHFU=;
 b=gsrpecOw7vDZF3jkeghbQcCEsalugrOC8BshsGbK1OxcAEhReAeMXojMUMJaNz2NbL
 zqEYHhsOSmUGeFMq/YZf92tKZusx1egT+UV2jCjhUEMKzeb1QKfCYiM2Z+xxbZY9AL6e
 WiTLiV74x2r8vESyAd1amGCpPezDOMc4fweuJVGjNVsW3G3i6Mgkgv7VByj+bi6LNxqr
 uGN4FD1slqeXykVKKXMuKkBK9KBi9HP1XXMdok9yvCFP8s6zbmLLfOzqZn48r8sOjJkI
 e4hVanVEzx9vW8n6s1p8qSl+uFIJphgEIwgTaxRS24guHTZNRug8JpV5bxyqD6ntUX/t
 d/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=onh3GgGVoqwWpsMMZvb2s8Mpdf2uIjE1A3fFafrrHFU=;
 b=hclitDjiDnPAcfjlKEdgfaelUW/m+G29XxwAsgDCPE3W6tvx6kJDbG8SyoxrucmJvT
 59ZmiNCo6MUg5ZF/pDlE6+JutCruHWnH4chF65cjKchzqC2VktDEJFcN7yQMhli+A9OC
 +77VmAA+1PuZ8F+VvRcGHIP8lisEahr1i6uCGpc9/zghSyzwQzGTCacV69WCzAQiv5Pt
 prMI6H13T+4Thc+GBvnpG4OmJIVz5MdZKL+8KNvmqaSylm8RaCPRf8xSd1EyIu8166XY
 L5+ogm/aiGGbp5kDLOCRi7rqESOClWNhkeYrtH6nH8jKA7Rz2SgApzsf0C07NzFw9+3e
 w3kw==
X-Gm-Message-State: APjAAAXG76Ba1vki9QVX2rMRQsb3FQPn5gVrMs05ioXZHbAjpIk9cPoy
 PWbRmIOH8Bo8xAS3kEA/nkM=
X-Google-Smtp-Source: APXvYqx1g936rj8urOXOnr/Yd8xN9dIXwjaE+PJF7/xsSa9dtad+KuE8TrT9iVFGEchC2jxoWtJbsA==
X-Received: by 2002:ac2:490c:: with SMTP id n12mr6508683lfi.4.1557507761984;
 Fri, 10 May 2019 10:02:41 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id y7sm1555628ljj.34.2019.05.10.10.02.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 10:02:41 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1a6c10cd-0d85-9db9-1f98-602fefb40db8@gmail.com>
 <dd61adad-7f15-d340-19f7-39f663496991@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c120e53b-1f9c-8083-ab90-bde98f3ec408@gmail.com>
Date: Fri, 10 May 2019 20:02:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dd61adad-7f15-d340-19f7-39f663496991@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] Add ability to handle nodes with
 interrupts-extended property
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

Ck9uIDEwLjA1LjE5IDE4OjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6CgpIaSwgSnVsaWVuCgo+Cj4K
PiBPbiAxMC8wNS8yMDE5IDE2OjI5LCBPbGVrc2FuZHIgd3JvdGU6Cj4+Cj4+IEhlbGxvLCBhbGwK
Pj4KPj4KPj4gZ2VudGxlIHJlbWluZGVyLi4uCj4KPiBUaGlzIGlzIG9uIG15IGxvbmcgcXVldWUg
b2YgcGF0Y2hlcyB0byByZXZpZXcuIEFueSBoZWxwIHJldmlld2luZyB0aGUgCj4gb24tZ29pbmcg
c2VyaWVzIHdpbGwgaGVscC4KCk9oLCBJIHNlZS4gRmFpciBlbm91Z2guCgoKPgo+IENoZWVycywK
PgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
