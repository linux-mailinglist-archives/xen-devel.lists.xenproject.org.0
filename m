Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249A65755
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 14:53:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlYWU-00007N-R5; Thu, 11 Jul 2019 12:50:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QTNt=VI=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hlYWT-0008SX-L7
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 12:50:05 +0000
X-Inumbo-ID: 66f82ba4-a3da-11e9-8980-bc764e045a96
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 66f82ba4-a3da-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 12:50:04 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id e2so5654456edi.12
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2019 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NgJxWUl57/k989xUear9uyuK6xvzM+DNFinZ/LF513s=;
 b=hm0eQj8Vtd/wZVvcT6CyF7bYNz3qTrXWXyEeobAZppER1mHUWuX5SME8/15clOrb2p
 xiFtqoU5MKIHwXsy2hL4nIew21AOCgXOQwIOhdmkBPL1ssheK56zloxM/NhVw44RDkHG
 5YQfGHCWIYzOCPIieSrEAHiaI6yenQozfOC0lGZdGWElik8DEd/aE83LTuBM3s4kVhEz
 u6er0na39COsfnkAMjz/IZjMlBZEaUbvfO+XtYhBCi0Y1nyx0C3eiCedo75QvjD4GBEb
 cgBffDgXiiUpoHFJk5xhjmLU2N4d7pU2l4djiwnhGEvWDuTmuZ07ZTwW1dAT/f/57y5c
 VASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NgJxWUl57/k989xUear9uyuK6xvzM+DNFinZ/LF513s=;
 b=HO3HNj4vCme0wPwtrw+S7ghbZmiZ/knJ+xdO3aiWJm2n/IjI9FM/+ovZV+G2E0kxBu
 h1rdM0rBSFISY5ZaD7l3+MxLIHZ2Kiih5WK6xtcwEnyjCaDCi0IJyuIzZ4n0JMKRUfuC
 ETLrWP/JvMWJSvNXGev/JTy2ZhyZdB+E3Pt0HiXYRaF8NUOCExlBEuCfHllESHppi4a2
 Kg5EEZFC4uzMhkJ8UPqYRtkGdW5XaHWc2w90NMNDoQ+xnXnbwAFTbSXGbxu5oSBSgJld
 xqOPC4zmkiZ0OWOSU2Il29LqQN5dqs8g9OaBzPYktZjDqA7t+Avp/1L/ueBQxRc8PP3R
 rAEA==
X-Gm-Message-State: APjAAAWgkio+dOXlEDwH5hvW2yW8feEJF0BsCZj7fh05pCZwgijPPuVw
 RyJjXWB2EpKCnn/0pyeiEL5hYnE8
X-Google-Smtp-Source: APXvYqxmuDMX9UxBc9KQnxOidXmo8NYZuudKPkoLs8D6BecceqEXyVxqEvjJVdGI4YiYuPYoZau6ow==
X-Received: by 2002:a17:906:9149:: with SMTP id
 y9mr2943780ejw.98.1562849403350; 
 Thu, 11 Jul 2019 05:50:03 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6623:b200:1e4b:d6ff:fef9:46e6?
 (200116b86623b2001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6623:b200:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id o11sm1151884ejd.68.2019.07.11.05.50.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 05:50:02 -0700 (PDT)
To: Hunyue Yau <hy-gsoc@hy-research.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
 <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com> <520937670.d9P0eaHOQZ@acer0>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
Date: Thu, 11 Jul 2019 14:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <520937670.d9P0eaHOQZ@acer0>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgo+Pgo+PiBJIGFtIGludGVyZXN0ZWQgd2hldGhlciB3ZSBzaG91bGQgZG8gc29tZXRoaW5n
IHdpdGggb21hcDUtd3VnZW4tbXB1LiBJCj4+IGZvdW5kIHRoYXQgY3Jvc3NiYXIgaXMgY29ubmVj
dGVkIHRvIEdJQy4gQW5kIG9uIHNvbWUgc2NoZW1lcyBpbiB0cm0gaXQKPj4gaXMgY29ubmVjdGVk
IHZpYSBvbWFwNS13dWdlbi1tcHUuIFNvLCBpdCBpcyBub3QgY2xlYXIgZm9yIG1lIHdoZXRoZXIg
aXQKPj4gc2hvdWxkIGJlIGhhbmRsZWQgaW4geGVuLgo+IAoKQWxzbywgSSBhbSBpbnRlcmVzdGVk
IGluIGhvdyB0byBhZGQgdGhlIGNyb3NzYmFyLiBJIGNhbiBzZWUgdHdvIG9wdGlvbnMKYXMgd2Ug
ZGlzY3Vzc2VkIGVhcmxpZXIuIFRoZSBmaXJzdCBvcHRpb24gaXMgdG8gcmVtb3ZlIHRoZSBjcm9z
c2JhciBidXQKZm9yIG1lIGl0IG1pZ2h0IGNhdXNlIHNvbWUgcHJvYmxlbXMgc2luY2UgYSBndWVz
dCBtaWdodCB3YW50IHRvIHVzZSBpdC4KVGhlIHNlY29uZCBvcHRpb24gaXMgdG8gZXhwb3NlIHRo
ZSBjcm9zc2JhciBhbmQgaW50ZXJjZXB0IGFsbCB0aGUgY2FsbHMKdG8gaXQuIEJ1dCB0aGUgcHJv
YmxlbSBpcyB0aGF0IG5vdyB4ZW4gc3VwcG9ydHMgb25seSBvbmUKaW50ZXJydXB0LWNvbnRyb2xs
ZXIuIEFuZCBhdCB0aGUgc2FtZSB0aW1lIG1vc3Qgb2YgdGhlIFNQSSBJUlFzIGFyZQptYXBwZWQg
dG8gdGhlIGNyb3NzYmFyLiBTbywgd2hlbiB4ZW4gY2hlY2tzIHdoZXRoZXIgdGhlIG1haW4KaW50
ZXJydXB0LWNvbnRyb2xsZXIgaXMgdGhlIHNhbWUgYXMgdGhlIG9uZSB0byB3aG8gZXh0ZXJuYWwg
aW50ZXJydXB0cwphcmUgbWFwcGVkIGl0IGZhaWxzLgooeGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5j
OmR0X2lycV90cmFuc2xhdGUoKSkuCkFuZCBJIGRvbid0IHRoaW5rIHRoYXQgSSBzaG91bGQgY2hh
bmdlIGludGVycnVwdC1wYXJlbnQgb3B0aW9uIG9mCmRldmljZXMgdG8gbWFwIHRoZW0gdG8gdGhl
IEdJQyBiZWNhdXNlIGl0IGlzIGVzc2VudGlhbGx5IHRoZSBmaXJzdApvcHRpb24gbWVudGlvbmVk
IGFib3ZlLiBTbywgaXQgc2VlbXMgdGhhdCBwcm9iYWJseSBpbnRlcnJ1cHQtcGFyZW50CmZpbmRp
bmcgZGVjaXNpb24gbG9naWMgc2hvdWxkIGJlIGNoYW5nZWQgYSBiaXQ/IExpa2UgdG8gZmluZCBh
IEdJQyBub2RlCm5vdCBpbiBhIGRpcmVjdCBpbnRlcnJ1cHQtcGFyZW50IGJ1dCB0cmFuc2l0aXZl
bHkgaW4gb25lIG9mIGFuY2VzdG9yczoKClVBUlQgLT4gY3Jvc3NiYXIgLT4gd3VnZW4gLT4gR0lD
CgpXaGF0IGRvIHlvdSB0aGluaz8KCi0tIApSZWdhcmRzLCBEZW5pcyBPYnJlemtvdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
