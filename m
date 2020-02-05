Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9E1532F2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:31:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLgi-0003o0-Uh; Wed, 05 Feb 2020 14:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2f8c=3Z=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izLgi-0003nv-87
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:29:56 +0000
X-Inumbo-ID: fa5a55da-4823-11ea-8396-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa5a55da-4823-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 14:29:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so2704447wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2020 06:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mOSaufHIjQM0P8fmHyQFV8ZfqqWbIwJunKm220lMqHo=;
 b=Jatlo2RT3HLuq9Fzaz1OKjQzQ9oG+HFB2FtsCMpJxHdKuCTHyd9zJzclqiigxJzPQB
 kp0d2O9HaYUekLddoLym68N9m0vWoTuxMTPJMWiXsk94TMm2LRVbgnPnhBJa3859wHxv
 /CMRnm1hb0fEhetwUEPKemOLzSZcqR8EussnYnKNVxLrWFEQ/ktKnZIyqedQQ5QLj0La
 xtCg5GF/a2wXxS2UYIjsXOsIGLMZ1uZ3eFePNlPVeqwV5bnp+nQbctlacue6ZwGD6hdX
 Hvf/UraK0rOr8dcV3ydpcIb2IidFN5S6A/f7Aw2PIsBtcFa0y4DkALxlT3eazyNwLSSR
 0Kzw==
X-Gm-Message-State: APjAAAUeDT+LW3O9dS+ZA4yxB5aJd1JmUiVKpS5saeX0a1BnVcnM688v
 c0M5W7nMwhQU0G6rC5oGhpE=
X-Google-Smtp-Source: APXvYqzerfDt1KNt5/cCnIA9DsPlQWUGpYvh0XT9Ey1gFkmMFP/RvnX4xSYj/NatN6S5yJGZJDqUwg==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr5951212wmj.43.1580912994591; 
 Wed, 05 Feb 2020 06:29:54 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id a13sm35445929wrp.93.2020.02.05.06.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 06:29:53 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
 <f08d9928-1285-4ca3-44e3-9e75d8cd9e5a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2300d9cf-e7c9-2aa5-34d3-6987e7fc67d3@xen.org>
Date: Wed, 5 Feb 2020 14:29:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <f08d9928-1285-4ca3-44e3-9e75d8cd9e5a@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/6] Arm/GICv2: don't needlessly use
 xzalloc_bytes()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDIvMjAyMCAxMzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLi4uIHdo
ZW4gcGxhaW4geHphbGxvYygpICh3aGljaCBpcyBtb3JlIHR5cGUgc2FmZSkgZG9lcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCj4gCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2dpYy12Mi5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCj4gQEAgLTk2OSw3
ICs5NjksNyBAQCBzdGF0aWMgdm9pZCBnaWN2Ml9hZGRfdjJtX2ZyYW1lX3RvX2xpc3QoCj4gICAg
ICAgICAgICAgICAgIG5yX3NwaXMsIFYyTV9NQVhfU1BJIC0gVjJNX01JTl9TUEkgKyAxKTsKPiAg
IAo+ICAgICAgIC8qIEFsbG9jYXRlIGFuIGVudHJ5IHRvIHJlY29yZCBuZXcgdjJtIGZyYW1lIGlu
Zm9ybWF0aW9uLiAqLwo+IC0gICAgdjJtX2RhdGEgPSB4emFsbG9jX2J5dGVzKHNpemVvZihzdHJ1
Y3QgdjJtX2RhdGEpKTsKPiArICAgIHYybV9kYXRhID0geHphbGxvYyhzdHJ1Y3QgdjJtX2RhdGEp
Owo+ICAgICAgIGlmICggIXYybV9kYXRhICkKPiAgICAgICAgICAgcGFuaWMoIkdJQ3YyOiBDYW5u
b3QgYWxsb2NhdGUgbWVtb3J5IGZvciB2Mm0gZnJhbWVcbiIpOwo+ICAgCj4gCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
