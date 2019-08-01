Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DC7DE02
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCAh-0005xR-JE; Thu, 01 Aug 2019 14:35:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q0EE=V5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htCAf-0005xJ-6f
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:35:09 +0000
X-Inumbo-ID: 8ec7c79b-b469-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8ec7c79b-b469-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:35:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so69765506ljg.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DIfkJoWXg+/bO3Mpyo0hJ1haqxDvCvyN+IRPXT9Gsjo=;
 b=ah1HSvgZAJuYxI86GoXO4XWg/65HOgvcztTqWg3+NRxCdIT/y3x6mxCxVi9FIqgeQH
 H9bvBO95ITJxa8jcR4of0DDew9TeN7eizDP845NMSgORf1cQtcwubOoV9GCGzSU/iEoO
 5DCOQyF7iT3gFbf3eMkBNhwxnxcjSVuKE5nfSgSCE97tbPKN7r8gjSW6+j0LIdUSaB5M
 7g0h4tKjoMcPfDgLG0PCKdiCOehuZDtSqBeuTLxSugWnMwnivALXxz4UlRq0t3ZjfPmU
 CwDoiJI4IUfQacMNYWw5a9PWoBrSYjgD9sQW8tiYyjXKV566bQRhgT4HnoeBwpILOyaw
 mpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DIfkJoWXg+/bO3Mpyo0hJ1haqxDvCvyN+IRPXT9Gsjo=;
 b=tk+XPskveBbjpAZRi6Cr2o5iiGgC+BMZj5+Isv8IE7HB379ftbrwzGGDEkR/ZgP8w4
 ZAmDBOU0jVpukCRogY1Tc1omQWHBGLMcoOrLsOmEt8eghYTQjw6xTSRsE8zgYN4vRaPa
 mxNtAwUkdGLX7H90Xsd1tPIPx2bLBas/8q9O+1VETqBJ/du9x4e9bpci0HjPdDiIm7P6
 A70w66gJD7um53afxqR5cdcUzPsFJi+SGb6KVW6lJo6/is8EXGJvJB3gw1CYp/FOvkD+
 mUn3DbkjTnEn17H45/GP8BuZEFbg3B0C9NjgSESxWWC80yLDW9H6IVyh386wHUTk4u92
 EFNQ==
X-Gm-Message-State: APjAAAWb1ZrUh5owCkZGcTRZWL1XGWXj3ulpLqdWH9X5DXc0+pq+vqmR
 wZF1n92pcrqBhYRwzhIELmVGopZJUzU=
X-Google-Smtp-Source: APXvYqyNNWLY0TUA42VmtymZQwfwviPdnRWStfZ96n0Aqqva44hZP9hmnNpK8ei9BCuRM2QmTqZM6w==
X-Received: by 2002:a2e:8495:: with SMTP id b21mr50500253ljh.149.1564670106572; 
 Thu, 01 Aug 2019 07:35:06 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id t21sm12274208lfl.17.2019.08.01.07.35.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 07:35:06 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
Message-ID: <02e896ec-1aee-3350-bbf4-8e8c2be0e55e@gmail.com>
Date: Thu, 1 Aug 2019 17:35:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjA4LjE5IDE3OjMxLCBPbGVrc2FuZHIgd3JvdGU6Cj4KPj4gSGVsbG8sCj4KPiBIaSwg
Um9nZXIKPgo+Cj4+IEkgdGhpbmsgaXQgd291bGQgaGVscCBpZiB5b3UgZGVzY3JpYmUgd2h5IHN1
Y2ggZXJyb3IgY29kZSBpcyBuZWVkZWQgYnkKPj4gWGVuIGFuZCBob3cgaXQgd291bGQgYmUgdXNl
ZC4KPgo+IMKgVGhpcyBpcyBuZWVkZWQgZm9yIHRoZSB1cGNvbWluZyBWMiBvZiB0aGUgSVBNTVUg
ZHJpdmVyIChBUk0pIFsxXSAKPiB3aGljaCBtYXkgcmVxdWVzdAo+IMKgZGVmZXJyZWQgcHJvYmlu
ZyAocmV0dXJucyAtRVBST0JFX0RFRkVSKSBkZXBlbmRpbmcgb24gd2hhdCBkZXZpY2UgCj4gd2ls
bCBiZSBwcm9iZWQgdGhlIGZpcnN0Cj4gwqAoUm9vdCBkZXZpY2UgbXVzdCBiZSByZWdpc3RlcmVk
IGJlZm9yZSBDYWNoZSBkZXZpY2VzLiBJZiBub3QgdGhlIGNhc2UsCj4gwqBkcml2ZXIgd2lsbCBk
ZW55IGZ1cnRoZXIgQ2FjaGUgZGV2aWNlIHByb2JlcyB1bnRpbCBSb290IGRldmljZSBpcyAKPiBy
ZWdpc3RlcmVkKS4KPgo+IEFzIHdlIGNhbid0IGd1YXJhbnRlZSBhIGZpeGVkIHByZS1kZWZpbmVk
IG9yZGVyIGZvciB0aGUgZGV2aWNlIG5vZGVzIAo+IGluIERULCB3ZSBuZWVkIHRvIGJlIHJlYWR5
IGZvciB0aGUgc2l0dWF0aW9uIHdoZXJlIGRldmljZXMgYmVpbmcgcHJvYmVkCj4gaW4gImFueSIg
b3JkZXIuIFNvLCBmcmFtZXdvcmsgKGRyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMpIHdp
bGwgCj4gYmUgbW9kaWZpZWQgYSBiaXQgdG8gYmUgYWJsZSB0byBoYW5kbGUgLUVQUk9CRV9ERUZF
UiByZXR1cm5pbmcgYnkgZHJpdmVyLgo+Cj4gWzFdIAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0wNy9tc2cwMjY3OS5odG1sCgpTb3Jy
eSwgSSBwcm92aWRlZCB3cm9uZyBsaW5rLgoKVGhlIGNvcnJlY3QgbGluayBzaG91bGQgYmU6Cgpo
dHRwczovL3BhdGNoZXcub3JnL1hlbi8xNTYxNTQ1MDA5LTE3NDkzLTItZ2l0LXNlbmQtZW1haWwt
b2xla3N0eXNoQGdtYWlsLmNvbS8KCgoKPgo+Cj4KLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlz
aGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
