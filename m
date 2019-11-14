Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA482FC1B3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 09:38:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVAba-0007CP-AS; Thu, 14 Nov 2019 08:35:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lr3c=ZG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iVAbY-0007CK-1n
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 08:35:52 +0000
X-Inumbo-ID: c2b83922-06b9-11ea-b678-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2b83922-06b9-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 08:35:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y186so4345341lfa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 00:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OMFPfdDBqZlaMjjBWDeecyvQPGsVbyfBQN7ahdgY5fg=;
 b=gCR9RAFSK32WOI7uTHuf4vfFWX1EgLM3ZabWZKciLxKxLMf06jnVz5VOZAgsZi5MNP
 JEfLQ61L635rTQoj3bHzMBSSC2OWGPhb8vP0cA7n1s5GZg/FysR3cPqgWX9uCXLilzGu
 Vc7im0Lc3Og+dm/HUlYuaWSHLEe/uQSYlscqlKJf2He57KAow3Vhu/ZwssHZZc6JgOXt
 s4QwHfG9oJ8r2F29tqZyTA6SWIgrE6Xk0WcYJkARrufQUb3dTC32tS7FHmEknw+3bYbt
 8gVlZk3V9u4BPonm7+aSJTCzF0/M2yMkOk3UYtNEuCA8B84K1DvG77NqE2MEC4Q9YBcE
 qRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OMFPfdDBqZlaMjjBWDeecyvQPGsVbyfBQN7ahdgY5fg=;
 b=ufUMWH7EA3eAsWXsHNQrtcMYo4RVqK9mT6lQkKpVPdhbN+Be1SKshPW++4ODjfPn1h
 mjrqerNaX8csLMHteWGxgxdjcN8psDCIqJFz0iZC2105+odeEyOoe0PytM3TqH22INvX
 +B7v+qccOF5Bjr2N7SjjlGI0ch+VoA00qwZ7wbwNsPJ+ZRjlDHqwD5Nc5ItDdayFNApe
 wq8P4detwx3PiveFQ5tzmI0AYiAfHOADL0l4MckK17EWKSFUVbUX+widrI0vx+Tsgj+/
 365S64ahB5e3Hk1pm/0oT+/mQXf5JeVtvDQLYxoBXGBQVybbtXDBeYyAEnPEAqhCFIyB
 50Nw==
X-Gm-Message-State: APjAAAU5oFQmBLldx7erHs2qKBlqUM665lAasrFqX0QwqvzfM9YlESH5
 AKI6nheVJhpaKBQjBE+pARU=
X-Google-Smtp-Source: APXvYqyZn2gXK6AxNTbW/4I5jwD9vqWwcDeGFmotDv4qvlcHQIMpr2HZ+iSIGscZ3Mhn5JZXC0vWpg==
X-Received: by 2002:a19:3f07:: with SMTP id m7mr6033331lfa.136.1573720548788; 
 Thu, 14 Nov 2019 00:35:48 -0800 (PST)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 t16sm1889722ljc.106.2019.11.14.00.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 00:35:48 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-8-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3884e2f3-b523-01ac-e3c3-d6229a91d703@gmail.com>
Date: Thu, 14 Nov 2019 10:35:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 7/7] arm/gic-v3: add GIC version suffix to
 iomem range variables
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
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gU3RlZmFubywKCk9uIDExLjExLjE5IDIyOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gdGhpcyBzZWVtcyBhIHZlcnkgc2VyaW91cyBjb21waWxlciBidWcuCgpZZXAuCgo+IFRo
aXMsIHRvZ2V0aGVyIHdpdGggdGhlIG90aGVyIGJ1ZyBkZXNjcmliZWQgaW4gdGhlIHByZXZpb3Vz
IHBhdGNoLCBtYWtlcwo+IG1lIHRoaW5rIHRoZSBBUk1DQyBpcyBub3QgcXVpdGUgcmVhZHkgZm9y
IHNob3d0aW1lLgoKWWV0LCB0aGlzIHBhcnRpY3VsYXIgQVJNIENvbXBpbGVyIHZlcnNpb24gaXMg
c2FmZXR5IGNlcnRpZmllZCBhbmQgTFRTLgoKPiBEbyB5b3Uga25vdyBpZiB0aGVyZQo+IGFyZSBh
bnkgbGF0ZXIgdmVyc2lvbiBvZiB0aGUgY29tcGlsZXIgdGhhdCBkb24ndCBoYXZlIHRoZXNlIHBy
b2JsZW1zPwoKSSBkb24ndCBrbm93LCBBUk0gZGlkIG5vdCBzYXkgc29tZXRoaW5nIHNwZWNpYWwg
YWJvdXQgaXQuIEFzIEkga25vdywgdGhlIHJlYXNvbiB0byB0YWtlIHRoaXMgY29tcGlsZXIgdmVy
c2lvbiB3YXMgdGhhdCBpdCBpcyB0aGUgImxhdGVzdCBhbmQgZ3JlYXRlc3QiIHNhZmV0eSBjZXJ0
aWZpZWQKCj4gSSB3b3VsZCBoYXRlIHRvIGludHJvZHVjZSB0aGVzZSB3b3JrYXJvdW5kcwoKSSBo
YXRlZCBmaW5kaW5nIGFuZCBwdWJsaXNoaW5nIHRoZXNlIHdvcmthcm91bmRzLCBidXQgaGVyZSB3
ZSBhcmUuCgpUaGUgbWFpbiBxdWVzdGlvbiBoZXJlIGlzIGlmIFhFTiBuZWVkcyBhIHRhZyAiU3Vw
cG9ydCBzYWZldHkgY2VydGlmaWVkIGNvbXBpbGVyIiBieSB0aGUgY29zdCBvZiBhY2NlcHRpbmcg
c3VjaCB3b3JrYXJvdW5kcy4KVGhlbiBkaXNjdXNzIGhvdyB0byByZWR1Y2UgdGhlaXIgc3RlbmNo
LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
