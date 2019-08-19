Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F691CC1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 07:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzaWA-0006c3-Cj; Mon, 19 Aug 2019 05:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=udnD=WP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hzaW9-0006by-AI
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 05:47:45 +0000
X-Inumbo-ID: dd459488-c244-11e9-a661-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd459488-c244-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 05:47:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s19so456350lfb.9
 for <xen-devel@lists.xenproject.org>; Sun, 18 Aug 2019 22:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=erjIQpQNUGu7HuSQuJJUvVSR284H0Ix2U9qE6kAaZtg=;
 b=E7vNKNhgLv3sU3lnHP4/Mcyg/wtkCiY4YzbNQmnNeDNetcYDSAol+vl5zIRzljkM2F
 jRA2quCnMkvLNmdXPk1x3KewFVT1qrANmZWJI7jCmM+k3NM0TsYzAeItbAjqwYoyzHvI
 LOqx8Dl75txcWwNqQohjMzdkciZlHVbgkKo6t/z4kZyawZipwV7PkaD7mEYUohEMbZig
 0DUtOm7WJyBWTgKrZy0MFdYlG8Z+Q+fYakQBBPbMZD4rJ8VEkzrkxYZvprWbv27PvIs+
 pdSXfp7uLeBB8hA58GBCWau9/g5l+1uZN0DAvLX/2f/DLnPWsys3yN/LZasLOOOnAZD2
 FX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=erjIQpQNUGu7HuSQuJJUvVSR284H0Ix2U9qE6kAaZtg=;
 b=LpXnG5BMa9biozBLScjA6mfhtFZmz0oD1DfmW6/Lmzh4fBR+Lvm0+z1sEBhRfO0xTq
 cNkqSJG1hbRyy/nNz7Xq/k0gSPbPosZSu6YoX81H5bf4IfU9n0yzpy1osBWT+aR6VzL9
 ClQGYVNG1w1v/9QT/+wdVXMtOYRHG6IV8OkXCi4k0tBnW9JkH+CaBy8FF6+l905klZvZ
 +c6DXIi/mETZmys/kkR1WSvyi64GLrBzWPRC8uGNpIsyKWTYyswPdH8xRzIf74ISD+Qc
 LN1OyCMLtE3NtyGrU1AxSj+LZ1DMLoth9Yh4ZQtQIx9DDRT3J8JF9TiKDfWXxwc/sJyR
 M6iw==
X-Gm-Message-State: APjAAAWvXZuQOru0Zd8PagqHyRnepzCGGrp48A7YpsE5x78qb8gAvgAa
 4IWr2ywmc94xent/tfn+1qal6CgwnE4=
X-Google-Smtp-Source: APXvYqz5qQnCdjl9yEjNCdSCR3lrCzcXCqxwHh1I5O+Hoa44a05S8KycXsF/aaYM4JQtZV4V/1KwSA==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr11245747lfn.20.1566193662622; 
 Sun, 18 Aug 2019 22:47:42 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 r68sm2149207lff.52.2019.08.18.22.47.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 22:47:41 -0700 (PDT)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
 <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
 <20190814172620.GO7444@phenom.ffwll.local>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <1eddff91-02d4-4378-e78d-6899dec26a80@gmail.com>
Date: Mon, 19 Aug 2019 08:47:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814172620.GO7444@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
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
Cc: airlied@linux.ie, xen-devel@lists.xenproject.org,
 dri-devel@lists.freedesktop.org, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNC8xOSA4OjI2IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDEz
LCAyMDE5IGF0IDEwOjMyOjAwQU0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Ogo+PiBPbiA4LzEzLzE5IDk6MjcgQU0sIE5pc2hrYSBEYXNndXB0YSB3cm90ZToKPj4+IFN0YXRp
YyBzdHJ1Y3R1cmUgZmJfZnVuY3MsIG9mIHR5cGUgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLCBpcyB1
c2VkIG9ubHkKPj4+IHdoZW4gaXQgaXMgcGFzc2VkIHRvIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhf
ZnVuY3MoKSBhcyBpdHMgbGFzdAo+Pj4gYXJndW1lbnQuIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhf
ZnVuY3MgZG9lcyBub3QgbW9kaWZ5IGl0cyBsc3QgYXJndW1lbnQKPj4+IChmYl9mdW5jcykgYW5k
IGhlbmNlIGZiX2Z1bmNzIGlzIG5ldmVyIG1vZGlmaWVkLiBUaGVyZWZvcmUgbWFrZSBmYl9mdW5j
cwo+Pj4gY29uc3RhbnQgdG8gcHJvdGVjdCBpdCBmcm9tIGZ1cnRoZXIgbW9kaWZpY2F0aW9uLgo+
Pj4gSXNzdWUgZm91bmQgd2l0aCBDb2NjaW5lbGxlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5p
c2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGludXhAZ21haWwuY29tPgo+PiBSZXZpZXdlZC1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pgo+IEknbSBhc3N1bWluZyB5b3UnbGwgYXBwbHkgdGhpcyB0byBkcm0tbWlzYy1uZXh0IHRvbz8g
R29vZCB0byBzdGF0ZSB0aGF0LAo+IHRvIGF2b2lkIGNvbmZ1c2lvbiBhbmQgY29vcmRpbmF0aW9u
IGlzc3Vlcy4KPiAtRGFuaWVsCj4KU29ycnkgZm9yIHRoZSBkZWxheSBhbmQgY29uZnVzaW9uLgpB
cHBsaWVkIHRvIGRybS1taXNjLW5leHQKPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYwo+Pj4gaW5kZXggYzI5NTVkMzc1Mzk0Li40YTk4NGY0NTU1NWUgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+Pj4gQEAgLTQ1LDcg
KzQ1LDcgQEAgc3RhdGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YikKPj4+ICAgIAlkcm1fZ2VtX2ZiX2Rlc3Ryb3koZmIpOwo+Pj4gICAgfQo+Pj4gLXN0YXRpYyBz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGZiX2Z1bmNzID0gewo+Pj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzIGZiX2Z1bmNzID0gewo+Pj4gICAgCS5kZXN0
cm95ID0gZmJfZGVzdHJveSwKPj4+ICAgIH07CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
