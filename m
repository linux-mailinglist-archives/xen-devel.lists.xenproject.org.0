Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3DBBF41C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTsy-00006s-3X; Thu, 26 Sep 2019 13:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDTsx-00006n-DG
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:32:43 +0000
X-Inumbo-ID: 1d9623fa-e062-11e9-97fb-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by localhost (Halon) with ESMTPS
 id 1d9623fa-e062-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 13:32:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n14so2177117ljj.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FP3ZHuR+AXcbEU6q8iqI+zoSgKASthpVPocb7d3TK5I=;
 b=ExHENkFvN20egaKE39GVkv7Ius+99ReppPgKVmE2YKNcQeIpnnyONOxj2ZP9EumdxW
 z7Jh5jGhUl7+tKe6tZYTowJ2a8ii16hagUaApxVYKzzsB6xP+98MNzuq9niBoQ38h7pN
 cBVp7qP3yFzq4i1Xe9hmMP7yTcBkPMYxXfsL2FpBjG/PJWgdNWmWW5BS4NfQ8Ca6Kxma
 zEUlxgHv1GVfpaBgbbZTrFbNsbL6cwRj0qbolWdPEDHjFflL3dgZhbVSxfPq5HKUrfcx
 2RaKaxhm1sQzD0KzAAeXPC+Z8AhNLgpB9JfJVs/awqq+qrVPca7EJcEHHPGK+8S5Fh5l
 DnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FP3ZHuR+AXcbEU6q8iqI+zoSgKASthpVPocb7d3TK5I=;
 b=UjcqtPm+t3L5MBjsN/dUz02T0jJzSqauxcOEI331cFSIGgFsO5MngdVab/FZCrRKCe
 SSU2IfGhHcxI/Qguh06Rrt5LWjdA1ZmZMsqUSEKg2IF3/ubjGS+fXo2dF3oXM2QYPtAw
 waaL9EpF/AutMvgZRQE3ZMK+SndXu9hWAlv3yrKcrvDN8cPngeP0kFT3wWOWe6nwEruS
 wnWXzLPINRNbncXLQTptJBFiDrgcqCB8iRk/C9OAHJCIS9lNvzzop9a/vnl8dSFNyEUJ
 4kmmmdIy/vbGvarecMSCnjrd4/D/3N6ZyL3uzGFoDiDn5TPZ7FFPpVtYxQx6KNG9pYP4
 B60w==
X-Gm-Message-State: APjAAAVH6v+DgYrjp/3E72LBw2xPtFEKRraIZtKVh5QTq2Jz9XK/wZO2
 GJ1GKQMdr86OrExW2OuUPHE=
X-Google-Smtp-Source: APXvYqzVYbk9EZ2R0ClVPTMKAXBTSazV4yNOy8G+TzS6HheSRG6m9Njb9wRRaAxNwr9NxznZTvQrxA==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr2630299lje.211.1569504761406; 
 Thu, 26 Sep 2019 06:32:41 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id c21sm531777lff.61.2019.09.26.06.32.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 06:32:40 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-9-git-send-email-olekstysh@gmail.com>
 <ae55d9e3-2dd8-abf7-c31c-603f5fd230ed@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <64467283-3a4c-e364-1682-c5491330a920@gmail.com>
Date: Thu, 26 Sep 2019 16:32:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ae55d9e3-2dd8-abf7-c31c-603f5fd230ed@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: sstabellini@kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 xen-devel@lists.xenproject.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA5LjE5IDE1OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMjYu
MDkuMjAxOSAxMzoyMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvS2NvbmZpZwo+PiBAQCAtMTIsNiArMTIsMTkgQEAgY29uZmlnIEFSTV9TTU1VCj4+ICAgCj4+
ICAgCSAgU2F5IFkgaGVyZSBpZiB5b3VyIFNvQyBpbmNsdWRlcyBhbiBJT01NVSBkZXZpY2UgaW1w
bGVtZW50aW5nIHRoZQo+PiAgIAkgIEFSTSBTTU1VIGFyY2hpdGVjdHVyZS4KPj4gKwo+PiArY29u
ZmlnIElQTU1VX1ZNU0EKPj4gKwlib29sICJSZW5lc2FzIElQTU1VLVZNU0EgZm91bmQgaW4gUi1D
YXIgR2VuMyBTb0NzIiBpZiBFWFBFUlQgPSAieSIKPj4gKwlkZWZhdWx0IG4KPiBJIHdvdWxkIGZp
bmQgaXQgbmljZSwgYnR3LCBpZiBzdWNoIHVubmVjZXNzYXJ5IGxpbmVzIHdlcmUgb21pdHRlZAo+
IChjYW4gbGlrZWx5IGFnYWluIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZykuCgpZZXMgKGFzc3Vt
aW5nIHlvdSBhcmUgc3BlYWtpbmcgYWJvdXQgb21pdHRpbmcgImRlZmF1bHQgbiIpLgoKCj4gRm9y
IHNvbWUgcmVhc29uIEkKPiB3YXNuJ3QgQ2MtZWQgb24gdGhpcyBwYXRjaCwgc28gSSBkaWRuJ3Qg
bm90aWNlIHNvIGZhci4KClNvcnJ5IGZvciB0aGF0LCBJIHNob3VsZCBoYXZlIGFkZGVkIHlvdS4K
CgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
