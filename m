Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE86930018
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 18:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWNjy-0005jd-K3; Thu, 30 May 2019 16:17:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNjx-0005jY-N5
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:17:17 +0000
X-Inumbo-ID: 63b0c55e-82f6-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63b0c55e-82f6-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 16:17:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j24so6672698ljg.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iyCkRNpbo7o7xdXkuW7Srwk8lp+dy3MfPujmXuRTEKE=;
 b=fvqD66YuKHf0Z4y6muGiV8L/r4DUmW+zMXYNiImCPQjCHbsRd0pdsK0GajjV4UhdG6
 vuBUFC2oB6Wms/MEMysBjxcCfdm6eNVTDqDwg6UrrzAwQeCWiSovy4jM9ZYAzJ0Cewxq
 EsRgqcVyjdmZd8mOMuhC+hiUv6cvJt9o+rjf6/Q8lb0kRKZxUFXqdb95dl9o+qmHpRPt
 42HsncAR2b7n6BOvdEOtsWrfRKSvBSVkQcTQfgf1/UQK61tuFpNMvVusOQlJZOYSgt+7
 OdLq+S7s9fTrijdjcxFTw3Yn+L1GCJOu6YmKPH5+1NesJqrHtjn3Xiwd39EWmtF8zHLP
 4CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iyCkRNpbo7o7xdXkuW7Srwk8lp+dy3MfPujmXuRTEKE=;
 b=XblIrEXfPEsO9sAbSD8BLPcR4o4C79MBwse7z1h8eC//obCcUg4Smuyzg4ohSA2a7P
 9ihF7+3NMz9z26zdm23r0Ia/zvf06yE3dJn9YB9c0L/x507iLLV345GySgcuCgfIpP+y
 GSRENXwfDXS4Buue2pFgaCTR5A/SwTJ1sl3W2p6mwQlv5sWwuQqFUhA3KVr1Ckguk4MG
 KzLvcUC6sSchWstmi422vDmL1KGnQFIae/eUlQ8yL2Ye1lWjHLHJ/AF0IqLeJqjZLimr
 /XM8rPMdGq+aRjjwVPHYZ4rl3ZHEPlZK8VDpFybNdm19kz5IvSWBIM904ZobVUKT4kDW
 i6KA==
X-Gm-Message-State: APjAAAWWHM7JP4d+2Ct3uWPBu52x2a2guofQ10Ty/JLXIlXvf58ppH6L
 g8fa0BbkOk4GKJJM4pmmWgI=
X-Google-Smtp-Source: APXvYqxRcnppf2KPT8FHbt0bUtW9KGjURA8k7tu4rYUOn7lDJp2jUi7lAWU76aFAphW0VQdGCxD0hg==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr2704906ljk.10.1559233035296; 
 Thu, 30 May 2019 09:17:15 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 i74sm562318lfg.78.2019.05.30.09.17.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:17:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
 <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <db46cc3c-23cf-671d-3b4e-2b188f1dd985@gmail.com>
Date: Thu, 30 May 2019 19:17:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 04/19] xen/arm: Rework
 HSCTLR_BASE
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS4wNS4xOSAxMzowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDUv
MjAvMTkgMTE6NTYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAxNCBN
YXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gVGhlIGN1cnJlbnQgdmFsdWUgb2YgSFND
VExSX0JBU0UgZm9yIEFybTY0IGlzIHByZXR0eSB3cm9uZy4gSXQgd291bGQKPj4+IGFjdHVhbGx5
IHR1cm4gb24gU0NUTFJfRUwyLm5BQSAoYml0IDYpIG9uIGhhcmR3YXJlIGltcGxlbWVudGluZwo+
Pj4gQVJNdjguNC1MU0UuCj4+Pgo+Pj4gRnVydGhlcm1vcmUsIHRoZSBkb2N1bWVudGF0aW9uIG9m
IHdoYXQgaXMgY2xlYXJlZC9zZXQgaW4gU0NUTFJfRUwyIGlzCj4+PiBhbHNvIG5vdCBjb3JyZWN0
IGFuZCBsb29rcyBsaWtlIHRvIGJlIGEgdmVyYmF0aW0gY29weSBmcm9tIEFybTMyLgo+Pj4KPj4+
IEhTQ1RMUl9CQVNFIGlzIHJlcGxhY2VkIHdpdGggYSBidW5jaCBvZiBwZXItYXJjaGl0ZWN0dXJl
IG5ldyBkZWZpbmVzCj4+PiBoZWxwaW5nIHRvIHVuZGVyc3RhbmQgYmV0dGVyIHdoYXQgaXMgdGhl
IGluaXRpYWxpZSB2YWx1ZSBmb3IKPiAKPiBzL2luaXRpYWxpZS9pbml0aWFsLwo+IAo+Pj4gTGFz
dGx5LCB0aGUgZG9jdW1lbnRhdGlvbiBpcyBkcm9wcGVkIGZyb20gYXJtezMyLDY0fS9oZWFkLlMg
YXMgaXQgd291bGQKPj4+IGJlIHByZXR0eSBlYXN5IHRvIGdldCBvdXQtb2Ytc3luYyB3aXRoIHRo
ZSBkZWZpbml0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKRldJVywgd2l0aCBtaXNwcmludCBmaXhlZAoKUmV2aWV3ZWQtYnk6
IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApB
bmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
