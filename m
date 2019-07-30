Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAA7B037
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:37:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsW22-000076-Pc; Tue, 30 Jul 2019 17:35:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2K5v=V3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hsW21-00006o-8Z
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:35:25 +0000
X-Inumbo-ID: 68e86ab9-b2f0-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68e86ab9-b2f0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:35:24 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s19so45329307lfb.9
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+OcJtMq1o7Foj00Z68M3q6RdHHtu0K9mFDU06sutZ54=;
 b=sLKuXD4Ek/s6aCm61pEbwC38PyY3Mw3YjTpoWL616LQgmzM3GhWbhJ8u1TzUvbM0Ry
 IpEFu/XNsL9WSUjSWsFlVJNZoWw/YuqLtkUbODlPPx6YrJBfP45NceCZCoD/Z8djH4S5
 X56WgoukIhKjKQo9wkNddHtRkD0+N4ZxPc2ZZQe70NVfDxPvpARywYYLlMl2a1iaphIh
 ce8wbxkfTj+WgQzCcT7BiuPUiXRza3n5YNKX1wnjnvaTeYbwxl+sDleGzJZmMqAx13hC
 SqGSJtSS+KCKpPeiYbL7VnMpcX7oGwFpyo2NakiEPt4hXfLsOD1vn4mXIGJOqsJlU7SU
 21Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+OcJtMq1o7Foj00Z68M3q6RdHHtu0K9mFDU06sutZ54=;
 b=AzvtBe2cye4cdL+5SFdcZOpzVupb3cOmQijH9hZ9GJMglfBBpqIC0uxqYUqmNFL5gP
 N63/JTtj0PPdgCp1O/9kuYpakxwvwfrgZlHO+jbPRb4LAHk2Sh5iFg0GdmiU74KuDuQ1
 V25r909ewk8i0BbqXEi8wdoiZnjiToD+RGjjBNyCzfodYIByf+U4EEm2oTBvNxCxNJXW
 7PhIrkQmqT4WKiJ3sOxloRL66iTsmCgswdVRfAqzEi2sJpuCJq3xB7jQ6d9bZZ1U1lOw
 0t8J3D5bb4Rcxg1D/rFrFglprLdTpSsFR8RWOajKUeFltRpSwpA3He/ua9hKyvxsoOqz
 DhzQ==
X-Gm-Message-State: APjAAAWFu5+Th03c6SiLKmOYwmju+2rj/POijx+ir+tvp7MYL7E9oo+1
 3PS26bclsiSZps4KSK/IXCI=
X-Google-Smtp-Source: APXvYqxW96bJFeYM1nB75XVohJQnUoNR0hVgcJUKrVJBLup834stKsW8CQWYCBfVWLrB+t5FqFmobw==
X-Received: by 2002:a19:5218:: with SMTP id m24mr38935649lfb.164.1564508122790; 
 Tue, 30 Jul 2019 10:35:22 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p5sm13650076ljb.91.2019.07.30.10.35.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 10:35:22 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
Date: Tue, 30 Jul 2019 20:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA3LjE5IDEzOjU5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMjYv
MDcvMjAxOSAxMTozNywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gRnJvbTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4KPj4gT24gQVJNNjQgd2Uga25vdyBleGFjdGx5
IGlmIHRyYXAgaGFwcGVuZWQgZnJvbSBoeXBlcnZpc29yIG9yIGd1ZXN0LCBzbwo+PiB3ZSBkbyBu
b3QgbmVlZCB0byB0YWtlIHRoYXQgZGVjaXNpb24uIFRoaXMgcmVkdWNlcyBhIGNvbmRpdGlvbiBm
b3IKPj4gYWxsIGVudGVyX2h5cGVydmlzb3JfaGVhZCBjYWxscyBhbmQgdGhlIGZ1bmN0aW9uIGNh
bGwgZm9yIHRyYXBzIGZyb20KPj4gdGhlIGh5cGVydmlzb3IgbW9kZS4KPiAKPiBPbmUgY29uZGl0
aW9uIGxvc3QgYnV0IC4uLgoKLi4uSW4gdGhlIGhvdCBwYXRoIChhY3R1YWxseSBhdCBhbnkgdHJh
cCkuCkFuZCB0aGUgZnVuY3Rpb24gY2FsbCBmb3IgdHJhcHMgZnJvbSBoeXAuCgo+PiBDdXJyZW50
bHksIGl0IGlzIGltcGxlbWVudGVkIGZvciBBUk02NCBvbmx5LiBJbnRlZ3JhdGluZyB0aGUgc3R1
ZmYKPj4gd2l0aCBBUk0zMiByZXF1aXJlcyBtb3ZpbmcgYCBpZiAoIGd1ZXN0X21vZGUocmVncykg
KWAgY29uZGl0aW9uCj4+IGludG8gQVJNMzIgc3BlY2lmaWMgdHJhcHMuCj4gCj4gLi4uIG9uZSBt
b3JlIGRpdmVyZ2VuY2UgYmV0d2VlbiBhcm0zMiBhbmQgYXJtNjQuCj4gCj4gVGhlcmUgYXJlIHBy
b2JhYmx5IGRvemVucyBvZiBtb3JlIGNvbmRpdGlvbnMgaW4gdGhlIGNvZGUgdGhhdCBhcmUgbm90
IG5lY2Vzc2FyeSBmb3Igb25lIG9mIHRoZSBhcmNoaXRlY3R1cmVzLgo+IFlldCB0aGVyZSBhcmUg
dmFsdWUgdG8ga2VlcCBldmVyeXRoaW5nIGNvbW1vbiBiZWNhdXNlIHRoZSBiZW5lZml0cyBvdXR3
ZWlnaCB0aGUgbGlrZWx5IG5vbiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudC4KCkknbSBub3Qgc2Vl
aW5nIGFueSBiZW5lZml0cyBpbiBjYWxsaW5nIGBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKWAgZnJv
bSBmdW5jdGlvbnMgbmFtZWQgYGRvX3RyYXBfaHlwXypgLiBUaGF0IGNvZGUgaXMgY29uZnVzaW5n
IGZvciBtZS4KSU1ITywgZGl2aWRpbmcgYGRvX3RyYXBfaXJxL2ZpcSgpYCBpbnRvIGd1ZXN0IGFu
ZCBoeXAgc3BlY2lmaWMgZnVuY3Rpb25zIGlzIG5vdCBhIGJpZyBkZWFsLiBFdmVuIGZvciBBUk0z
Mi4gTW9yZW92ZXIsIGl0IHdpbGwgbWFrZSBtb3JlIG9idmlvdXMgdGhlIGZhY3QgdGhhdCBub3Ro
aW5nIGZyb20gYGVudGVyX2h5cGVydmlzb3JfaGVhZCgpYCBpcyBkb25lIGZvciBJUlEgdHJhcHMg
dGFrZW4gZnJvbSBoeXAuCgo+IFNvIEkgYW0gbm90IGNvbnZpbmNlZCB0aGF0IHRoaXMgaGFzIGFu
eSB2YWx1ZSBmb3IgWGVuLgoKT0ssIEkgd291bGRuJ3QgaW5zaXN0LgoKLS0gClNpbmNlcmVseSwK
QW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
