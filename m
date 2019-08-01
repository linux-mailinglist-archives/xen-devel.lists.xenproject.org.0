Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94C7D785
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 10:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht6NW-0000ZG-OV; Thu, 01 Aug 2019 08:24:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d+It=V5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ht6NV-0000ZB-Sj
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 08:24:01 +0000
X-Inumbo-ID: b63ccc93-b435-11e9-8980-bc764e045a96
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b63ccc93-b435-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 08:24:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id q26so49593014lfc.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wVLKf45mH2lkLJ43zjcKhZTz4Yix5m14Y5TiKZNrRPs=;
 b=gSI57IJqTcUi1gRdufJuBQGf6ilGswBe/4klD42fSj86s89XX+6VBYgceSPwnxYHUr
 vPQntiWjchJ/Swsc0LuP3X8Br8l+vOYEn6BcTX8LbWbABNbxF9/j5Z9xduEjOEJE6svq
 W8CJycAB9lPZfEqBlh65lLKrBSCOToY25wdTpjHrXsldH8KR3vXdCAxv/B1LKy7cgwrn
 Ora1RPiwmwHxlqK4vDFDOy2H134xx848ukXBzqQvHjiUm/uYfNUbtBI6b2vH8abhGVQp
 sg8Fs5jykGPNThnNT8vwgrL9Sb64vNOW4Q8Yl1RETel8i3k0fUUz2QWUZHm+zxK1cK+m
 qC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wVLKf45mH2lkLJ43zjcKhZTz4Yix5m14Y5TiKZNrRPs=;
 b=kHkG/Cy0SVXjSKl++wO3wGvPERb2qKAoHFpYZ9PhOk/P/YAjh/FzbMILj7bHtVHgTl
 9kMza7bwic77M4C/ATxLHvSqnB/M8MMDNprHJqjG+ObQ8Qn5VvSLmdS2wNc8EPY+3p1H
 zw0QNfaKJfE8YaXq0p1yAZH4THT/4JX9We0XxVdo+nPyinnn6KvigGSeILuJxbdTvhNH
 kO+ClsWdPnEmuTUqk51MIx+9RfiYuIrmgRUcZy3L4IJ7lYGQk08t+wy+eWRKdtpChjrC
 9YqpuBBYvOsWgBpyrsxAuOaRoBDbPGecGgzMPfskCxhhpjVyXeRNMQ+9U5m8OMUROuwe
 gSbg==
X-Gm-Message-State: APjAAAV0g8x6Gxe+Y0pTKX7RxOrazJAHQp3U1eBvbKlSs8dqPf3G1BXK
 +dsBO5tWQUx8MG2eD3JjfR4=
X-Google-Smtp-Source: APXvYqzvFNW6fuoK60MqE+/4OmYd7LFhYAjKgrC5vkCt9oAOaXoN5g/zEI469XP+5nqSCxo14d7mOg==
X-Received: by 2002:a05:6512:48f:: with SMTP id
 v15mr17629051lfq.37.1564647838907; 
 Thu, 01 Aug 2019 01:23:58 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 h129sm12130962lfd.74.2019.08.01.01.23.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 01:23:58 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
 <f8e9bd7c08f85acc17af58fa305495113c990e0a.camel@suse.com>
 <7b374888-c394-d741-f34b-28eb8647e507@gmail.com>
 <a219e3d1bad84d08c5eabc06dbcc89c9b8c2e330.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4137cced-5a70-11ac-dbaa-98e85a6b30eb@gmail.com>
Date: Thu, 1 Aug 2019 11:23:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a219e3d1bad84d08c5eabc06dbcc89c9b8c2e330.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/6] schedule: account true system idle time
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8sCgpPbiAyOS4wNy4xOSAxNDo0MCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+
IFllcywgaW4gdGVybXMgb2YgdGhpcyBwYXRjaCwgaWRsZV92Y3B1X3J1bnN0YXRlX2NoYW5nZSgp
IGJldHRlciBiZQo+PiBtb3ZlZCB0byBjb21tb24vc2NoZWR1bGUuYy4KPj4KPiBJIHRoaW5rIHdl
IHNob3VsZCwgZmlyc3Qgb2YgYWxsLCB0aGluaywgaWYgdXNpbmcgcnVuc3RhdGVzIGFuZAo+IHJ1
bnN0YXRlcyBtYW5pcHVsYXRpb24gZnVuY3Rpb25zIGlzIHJlYWxseSB0aGUgYmVzdCB3YXkgZm9y
d2FyZCBoZXJlLgo+IAo+IEFuZCwgaWYgdGhhdCByZXZlYWxzIHRvIGJlIHRoZSBjYXNlLCBJIGZl
ZWwgbGlrZSBydW5zdGF0ZXMgd291bGQgbmVlZAo+IHRvIGJlIGV4dGVuZGVkIHRvIGJlIGFibGUg
dG8gZGVhbCB3aXRoIHdhbnQgd2Ugd2FudCB0byBhY2hpZXZlLgo+IAo+IEknbGwgdGhpbmsgbW9y
ZSBhYm91dCB0aGlzLCBhbmQgdHJ5IHRvIGZvcm0gYW4gaWRlYS4uLgoKSSB0aGluayBydW5zdGF0
ZSBkb2VzIG5vdCBzdWl0ZS4gSXRzIGZvcm1hdCBpcyBsaW5rZWQgdG8gdGhlIGV4aXN0aW5nIGlu
dGVyZmFjZSBhbmQgaXMgbm90IGZsZXhpYmxlIGVub3VnaCBmb3IgcG9zc2libGUgY2hhbmdlcy4K
IEZyb20gb3RoZXIgaGFuZCwgd2Ugd291bGQgbmVlZCByZW9yZGVyaW5nIGluIHJ1bnN0YXRlIHRp
bWUgY2FsY3VsYXRpb24gYXMgd2VsbC4KCj4gSWYgd2UgdGltZS4gZS5nLiwgaW50ZXJydXB0cywg
c29mdGlycXMgYW5kIHRhc2tsZXRzLCB3ZSBjYW4gc3RvcmUgc3VjaAo+IG1ldHJpY3MgdG9vLCBh
bmQsIGlmIHdlIHdhbnQsIHJlcG9ydCBhIGJyZWFrb3V0IG9mIHRoZSB0aW1lIHNwZW50IGluCj4g
aHlwZXJ2aXNvci4uLiBzb21ldGhpbmcgbGlrZSAoaW4geGVudG9wLCBhcyB5b3UncmUgZG9pbmcg
YWxyZWFkeSwgb3IKPiBzb21ld2hlcmUgZWxzZSk6Cj4gCj4gICBoeXA9MTIlKGlycT00JStzb2Z0
aXJxPTElK3Rhc2tsZXQ9NSUrb3RoZXI9MiUpCgpPbmUgbW9yZSBkb3duc2lkZSBvZiBydW5zdGF0
ZSAtIGl0IHdpbGwgbm90IGhvbGQgYWxsIHRoYXQgc3R1ZmYuCgotLSAKU2luY2VyZWx5LApBbmRy
aWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
