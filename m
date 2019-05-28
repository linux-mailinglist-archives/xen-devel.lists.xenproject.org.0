Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7C2C307
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 11:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVYEu-00065A-8k; Tue, 28 May 2019 09:17:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M056=T4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVYEt-000655-9U
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:17:47 +0000
X-Inumbo-ID: 743589ad-8129-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 743589ad-8129-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 09:17:46 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u27so13974875lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 02:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TeRljmn7ABXAfmPDukOiU4aQuCtAuY6xTc+OOJ5kZuY=;
 b=RQ1jwqHiVnsX9sDV2qYizYqMuQuV8wqlwc/rp5IKo+fgV8Q15kcqIaieGJuZRUz9b+
 5Wgi2U0pNqWShl4v6eSj/chAt3dZQdGcKsgca7kcOR+iirrin9EVKlU+Xi83jwCZHbXj
 1gllI95oZsAAda9lVIpN2OPJsRZy56ngfnnCB82iRAdH4phsv3kz5YyyJzqPCLZJRFKN
 3HcnoU39mwo2DqKgwxKiC+0IJ453JqnjqDJkMWbbWkOIOecek1z5p/ISodU8WeSm1NW2
 8TTCu5nMDOCv34E4VVZZ+cHfavhLO4bsw1EkGj2WvkSby0pqjzCoXf4k0UhXMOBFNun7
 OSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TeRljmn7ABXAfmPDukOiU4aQuCtAuY6xTc+OOJ5kZuY=;
 b=GgsmI6TGRnSFI/ckjoN0gfZDAWkKDhKjZe14YoIr2GRR92pgaz074stgXM2SaA9R/p
 jyEoqyiIx+zsbMGwgPrGIr1VtkLymmFdb132bgkzVMFtc+lxKaYUQv+BaVytEw0t8HAd
 Be9QrHww3jawJ9JYm6vHu2sep8PfMluK6GmeCAiTaggGn0bjta3IXc5vzHDxQdJnuA7B
 sGR55ekM3ZMBDwD2vvvD6J1+V7/NZ56y/sB+jkobqlhpw+A+j+fGOqMDnv5vBAk1ohwE
 MxvYa383le7aacTAF3Yt0+ZKUK9b9CiDXZZgxwuxPQz6J2FTnss8XBv5K6sl0OTiIhNk
 0gSw==
X-Gm-Message-State: APjAAAVTrbv1d7XwiTLUpGXPfvngvkBkyG4zhpS2wOB3jOQIp56luxsL
 CyAS5bgRLh21wxtO6OZxCkc+b9h3350=
X-Google-Smtp-Source: APXvYqxHKwSKyTO0AGXuv+qiA/hfEOaxuuhuvo3KAz7sqsWgTKVDjomgU29CvSAzbhgl6z4olLoV8w==
X-Received: by 2002:ac2:598d:: with SMTP id w13mr813564lfn.165.1559035064430; 
 Tue, 28 May 2019 02:17:44 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v16sm2832371lji.88.2019.05.28.02.17.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:17:43 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
Date: Tue, 28 May 2019 12:17:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjguMDUuMTkgMTE6NTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
IGFtIG5vdCBhbnN3ZXJpbmcgb24gdGhlIGNvbnRlbnQgeWV0LCBJIHdpbGwgZG8gdGhhdCBzZXBh
cmF0ZWx5LiBUaGUgdGhyZWFkaW5nIGZvciB0aGlzIHNlcmllcyBsb29rcyBxdWl0ZSBjb25mdXNp
bmcuIFRoZSBoZWFkIG9mIHRoZSB0aHJlYWQgaXMgdGhpcyBwYXRjaCAoaS5lIFJGQyAyKSBidXQg
dGhlbiB5b3UgaGF2ZSBhIGNvdmVyIGxldHRlciB3aXRoaW4gdGhlIHRocmVhZCB0YWdnZWQgIlYz
Ii4KCkFjdHVhbGx5IEkndmUgbm90aWNlZCB0aGUgbWFuZ2xlZCB0aHJlYWRpbmcuIEJ1dCBub3Qg
c3VyZSB3aHkgaXQgaXMgc28uIEkganVzdCBwYXNzZWQgYSBmb2xkZXIgd2l0aCB0aG9zZSBwYXRj
aGVzIHRvIGdpdC1zZW5kLW1haWwuCgo+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBl
LW1haWxzIHRhZ2dlZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIHdoZXJlIGFzIFJGQyAy
IGFuZCBSRkMgMyBhcmUgdmFyaWFudHMuIEFtIEkgY29ycmVjdD8KClllcywgc3VyZS4KCj4gSWYg
c28sIGZvciBuZXh0IHRpbWUsIEkgd291bGQgcmVjb21tZW5kIHRvIGhhdmUgdGhlIGNvdmVyIGxl
dHRlciBmaXJzdCBhbmQgdGhlbiBhbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8iIHRo
ZSBjb3ZlciBsZXR0ZXIuIFRoaXMgbWFrZXMgZWFzaWVyIHRvIHRyYWNrIHNlcmllcy4KCkl0IG1p
Z2h0IGhlbHAuIEJ1dCBiZWZvcmUgaXQgd29ya2VkIHdlbGwgd2l0aG91dCBhZGRpdGlvbmFsIHRy
aWNrcy4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
