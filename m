Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC32144260
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 17:45:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwbR-0006fh-1I; Tue, 21 Jan 2020 16:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mze0=3K=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1itwbQ-0006fc-3J
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:42:08 +0000
X-Inumbo-ID: f083153c-3c6c-11ea-8e9a-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f083153c-3c6c-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579624917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ZQr3GJu4EloNbDA2o3rszEPhn62VWD7FbqVrGUQdLc=;
 b=IMOgbK0xw6eE+38JxY3TSAvxTolemdMEekD73oEr6k8N/HGKJh8vLpQ7oKA+WjUhnBiaY2
 9Rjzhsq2RE5NTfh/j4lr7hv7ZSQusBvbs0Z/axymyg0TpdLlqJbIGmdL25Q5vk4RdpL/FF
 b1wWgNj6g3h+KgtnIGgN1ZH6E5D5Z5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-c4D0uUKYPnWuE7hTJxDdHg-1; Tue, 21 Jan 2020 11:41:55 -0500
Received: by mail-wm1-f72.google.com with SMTP id p5so585239wmc.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 08:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=50Z4SvxBYXC9Ur5iEhPZHFt5fxBKiuXYxOly19jt+08=;
 b=PxdmBYFhWe6qXKoWfRsi+gdJsgQlUVPMJR/N+8SMw8iPREim6HqzqJA2B6/e2Ly5o5
 u3gcR6RTGwwEomrP6V80M6KcfMlTyDJomn+QAAPAGjnkYNTLvd0aIdEXvxPtSle+iwlZ
 DmSD2KkhGoFwOQsvGyYSC5M/RdB11o+4mg/OPs1XCs77h+yCX8APi3ImLTLFHpPYVXV8
 3R4nc5U4BXhhwHMwiEUXJNDulXyp8Li2L92Dar8LCHkMuW3UwAyn7IcPsokF8OQPbtNG
 k9aj5Jlv1syVUrivsNFkjhMlyxHwq6joAeK1xe8aDl976a5EqJ3JT7R2lvx758aTDs2d
 3aOw==
X-Gm-Message-State: APjAAAUrWY9h4qaZ4CqcOLS7bhp4umfqnIJrdJul9B9tBxtySE7dm4jd
 ZI0M/+/T4MmFWaTeEmHXS4HwQlQuDYaAF7n4YscfQJpFzVZexu3BMUgYmsyILlUM1KMYt5nLrEG
 I5obS5kCjalz8RV1JccnVtpCGqhQ=
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr5265091wml.110.1579624914096; 
 Tue, 21 Jan 2020 08:41:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfF6tXDyMLPEMBHkhw2xOprNxB5uRcWPNI62+6B4YfZ4FR0hQHYnaHFyHAGh5pRvoDRHMpug==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr5265070wml.110.1579624913800; 
 Tue, 21 Jan 2020 08:41:53 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id w8sm493719wmd.2.2020.01.21.08.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 08:41:53 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20200121161747.10569-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cf8a8ee3-0c95-20f3-3225-31bb8413344e@redhat.com>
Date: Tue, 21 Jan 2020 17:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121161747.10569-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: c4D0uUKYPnWuE7hTJxDdHg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH] trivial: Remove xenfb_enabled
 from sysemu.h
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
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMS8yMCA1OjE3IFBNLCBUaG9tYXMgSHV0aCB3cm90ZToKPiBUaGUgZGVmaW5lIGlzIG9u
bHkgdXNlZCBpbiBvbmUgb3RoZXIgcGxhY2UuIE1vdmUgdGhlIGNvZGUgdGhlcmUKPiBpbnN0ZWFk
IG9mIGtlZXBpbmcgdGhpcyB4ZW4tc3BlY2lmaWMgZGVmaW5lIGluIHN5c2VtdS5oLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KCj4gLS0tCj4gICBo
dy94ZW5wdi94ZW5fbWFjaGluZV9wdi5jIHwgMiArLQo+ICAgaW5jbHVkZS9zeXNlbXUvc3lzZW11
LmggICB8IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcveGVucHYveGVuX21hY2hpbmVfcHYuYyBiL2h3L3hl
bnB2L3hlbl9tYWNoaW5lX3B2LmMKPiBpbmRleCAzYThhZjFhMWUwLi44ZGY1NzVhNDU3IDEwMDY0
NAo+IC0tLSBhL2h3L3hlbnB2L3hlbl9tYWNoaW5lX3B2LmMKPiArKysgYi9ody94ZW5wdi94ZW5f
bWFjaGluZV9wdi5jCj4gQEAgLTYwLDcgKzYwLDcgQEAgc3RhdGljIHZvaWQgeGVuX2luaXRfcHYo
TWFjaGluZVN0YXRlICptYWNoaW5lKQo+ICAgICAgIHhlbl9iZV9yZWdpc3RlcigicW5pYyIsICZ4
ZW5fbmV0ZGV2X29wcyk7Cj4gICAKPiAgICAgICAvKiBjb25maWd1cmUgZnJhbWVidWZmZXIgKi8K
PiAtICAgIGlmICh4ZW5mYl9lbmFibGVkKSB7Cj4gKyAgICBpZiAodmdhX2ludGVyZmFjZV90eXBl
ID09IFZHQV9YRU5GQikgewo+ICAgICAgICAgICB4ZW5fY29uZmlnX2Rldl92ZmIoMCwgInZuYyIp
Owo+ICAgICAgICAgICB4ZW5fY29uZmlnX2Rldl92a2JkKDApOwo+ICAgICAgIH0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zeXNlbXUvc3lzZW11LmggYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaAo+
IGluZGV4IDgwYzU3ZmRjNGUuLjJjY2YyMTYxNTggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zeXNl
bXUvc3lzZW11LmgKPiArKysgYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaAo+IEBAIC0zMiw3ICsz
Miw2IEBAIHR5cGVkZWYgZW51bSB7Cj4gICB9IFZHQUludGVyZmFjZVR5cGU7Cj4gICAKPiAgIGV4
dGVybiBpbnQgdmdhX2ludGVyZmFjZV90eXBlOwo+IC0jZGVmaW5lIHhlbmZiX2VuYWJsZWQgKHZn
YV9pbnRlcmZhY2VfdHlwZSA9PSBWR0FfWEVORkIpCj4gICAKPiAgIGV4dGVybiBpbnQgZ3JhcGhp
Y193aWR0aDsKPiAgIGV4dGVybiBpbnQgZ3JhcGhpY19oZWlnaHQ7Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
