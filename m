Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD378B8D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vn-0006in-EE; Mon, 29 Jul 2019 12:12:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61H9=V2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hs4Vl-0006gL-Ev
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:17 +0000
X-Inumbo-ID: 1a644d36-b1fa-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a644d36-b1fa-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:12:16 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v24so58458817ljg.13
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9XsWnL1pM5EdFZZs5goGdGisThLXzzf+DGIXfqGyzsU=;
 b=dE7aauYHrFeKOaapIaerug1VOX5LzrbpNETrmLYJfFGEh1lBJ/mxBps2hEGM7zkGWl
 Ym4mdK4PgbQSePFdE9jRTJV7qPyFoG3Qj2x2UzeWBX2MFQS5jtOHRejyY+cSLuB8ou6B
 8lNPudCaYD0LxOzYum4TKGHmW9YvXd6wbNMnQjjIYUgNL7O7jwSEGhkI2e36tXrMTXfe
 WiwgoRUB/4EC6wuIY9LUDdLbBB4F1WydGtwekvJbffXVgCCOUcUm+JJXgelPEOK3cVgF
 Vd1YCdBa6D40lUDEywuorSbr3DGYtcr8fyJvm8Hk16Fdts8/FkZQFHBUtYKNyJEXC4UC
 LtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9XsWnL1pM5EdFZZs5goGdGisThLXzzf+DGIXfqGyzsU=;
 b=aNahvsg/2WznNRzRG0EOtpmYDDCZw2E10AgPjkIOPzSLl5erp/22Y077xIZC5x+NSE
 ZN0fnvXQqUcSkiC6YmbsH++wV62DsNc7/5bMh00FG1w124hKLJqe0YQmKp84nhYlJgO5
 BoVdDrwOUyBcACGVBPWwzwZX4tPPJ4Ip+eigbknI8yk2Y0pyUFzuCCs2RSymxxM2i65Z
 KiVOayQ82MXdwgq4YpAwnIFZQt+o88LvIHhB3YLUMJP82qa1ji8doO9RYm1dMoUxqFPA
 /zEHtBc0D40Qj3Bv6J9mKgVtzDrwFV1J9m9nKFRTjS19MXlNii5xoDk0yJNE+CkO6kPK
 gTsg==
X-Gm-Message-State: APjAAAWANx1agMBCMN/Rndmy1MaFQtgNINEYqhVWAZ1FrbgVerH1Jasi
 RRRoI2opI9/t15OFJ5557lg=
X-Google-Smtp-Source: APXvYqxJNBC1DUjgQx22O8R+yoszJoNn6mIv4n3fXpu0kpuZNAYEu7Ad9CbLWBesb49m8co7N/riAQ==
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr7963384ljd.193.1564402334718; 
 Mon, 29 Jul 2019 05:12:14 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p9sm12950964lji.107.2019.07.29.05.12.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 05:12:13 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <156439734950.9656.3257482583234913248.stgit@Palanthas>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <120f52c4-5398-23b0-1e22-de944c23570a@gmail.com>
Date: Mon, 29 Jul 2019 15:12:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156439734950.9656.3257482583234913248.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: credit2: avoid using
 cpumask_weight() in hot-paths
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOS4wNy4xOSAxMzo0OSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gY3B1bWFza193ZWln
aHQoKSBpcyBrbm93biB0byBiZSBleHBlbnNpdmUuIEluIENyZWRpdDIsIHdlIHVzZSBpdCBpbgo+
IGxvYWQtYmFsYW5jaW5nLCBidXQgb25seSBmb3Iga25vd2luZyBob3cgbWFueSBDUFVzIGFyZSBh
Y3RpdmUgaW4gYQo+IHJ1bnF1ZXVlLgo+IAo+IEtlZXBpbmcgc3VjaCBjb3VudCBpbiBhbiBpbnRl
Z2VyIGZpZWxkIG9mIHRoZSBwZXItcnVucXVldWUgZGF0YQo+IHN0cnVjdHVyZSB3ZSBoYXZlLCBj
b21wbGV0ZWx5IGF2b2lkcyB0aGUgbmVlZCBmb3IgY3B1bWFza193ZWlnaHQoKS4KPiAKPiBXaGls
ZSB0aGVyZSwgcmVtb3ZlIGFzIG11Y2ggb3RoZXIgdXNlcyBvZiBpdCBhcyB3ZSBjYW4sIGV2ZW4g
aWYgbm90IGluCj4gaG90LXBhdGhzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEZhZ2dpb2xp
IDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gLS0tCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiBDYzogQW5kcmlpIEFuaXNvdiA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+
Cj4gLS0tCj4gSSBqdXN0IHJlYWxpemVkIHRoaXMgcGF0Y2ggZmVsbCB0aHJvdWdoIHRoZSBjcmFj
a3MhIDotTwo+IAo+IEkgc2VudCBpdCBxdWl0ZSBhIHdoaWxlIGFnbywgSSBnb3Qgc29tZSBjb21t
ZW50cyBmcm9tIEFuZHJldyBhbmQKPiBBbmRyaWksIGJ1dCB0aGVuIG5ldmVyIHJlYWxseSBmb2xs
b3dlZCB1cC4KPiAKPiBTbyBoZXJlIHdlIGhhcmUhCj4gCj4gQ2hhbmdlcyBmcm9tIHYxOgo+ICog
bnJfY3B1cyBpcyBub3cgdW5zaWduZWQKPiAqIGNvZGluZyBzdHlsZSAobm8gaGFyZCB0YWJzKQo+
ICoga2lsbGVkIGEgY291cGxlIG9mIHJlZHVuZGFudCBBU1NFUlQoKXMKPiAtLS0KClJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
