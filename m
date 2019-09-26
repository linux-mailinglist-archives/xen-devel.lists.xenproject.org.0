Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F6BF422
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTuO-0000LL-T2; Thu, 26 Sep 2019 13:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDTuN-0000L4-3F
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:34:11 +0000
X-Inumbo-ID: 51e980c0-e062-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by localhost (Halon) with ESMTPS
 id 51e980c0-e062-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 13:34:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f5so2185705ljg.8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bXuePlXzWyk4pGlz6AGpeIoi8xK5kS+B1UTD2EeWjsQ=;
 b=Tzq/UcB8s3cBdOoSqRK9alq3JFS2CSzRbmBxisP+jo2IdtemUrlZtsI0Fa3nVtUYgo
 9XJtZbPLyM7qwH6lJ9REZtAOUGmYVQqWxsAd3qvTx9u42EzpJwb6xKipnwhgRx1uipu0
 6k4al6lkXWsDrTmcYOVyFlthTY9iNjPkqrb2VniBfthquYwnMDv6tqwlQntCj71rpT26
 QfblV+VV9Asn5OWDiwSHkPIV1qvuYIjKYiTufDulZKas8iZOFR1g4Md7SCCChd2XvnuX
 9qE+fMhmF9RP5oLE2LPfAOWSs5nJ76jyXpjUNqrbIq6qj5m0kR9r077uWMdDno8CM0HC
 zB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bXuePlXzWyk4pGlz6AGpeIoi8xK5kS+B1UTD2EeWjsQ=;
 b=cA1GBQ4vLUGx/LBuRGXOVBaGij+Pnh8IYPRcpqN01qjT6EJQue3UJLVXBgzrSnDSNf
 ndV9ZlewD80QH5OMropZwoBveRZczDdAR8rhsp3kful7DQiaalLFAxX9CTlQiy79GaMv
 dyobU++z2iiV/NVs1FnA6fY/PlXm6bhO3n0+wB0rlvxdyRAWPOFt6WZS74lgKWSnhoPZ
 0sDwg1/KQ35P/UZQQeC3qARhcP3+YiFGYVE5aT9tvlaj8AD24GH1XTUkQj/mt+zNInx6
 kVlI2CXWDHjlyCD8I77FlpQwSsFTesIW0l+AyPDi6wjFdEg4HpsA8/2AtEORgi/idP8N
 ptCA==
X-Gm-Message-State: APjAAAVb0ywz7oGjUC1En70nnGRNd/5MIxLgnZwLK0Wf/QdqcnO63v41
 SXovfaFaPiQeeVeqUbzrpAg=
X-Google-Smtp-Source: APXvYqwe5SIUoPjFsKTncNWppgfPkqzRnnjB6wf85ZgdK1oT64nJT68bZUOungyXxWpFqVQSDNgwsQ==
X-Received: by 2002:a2e:9096:: with SMTP id l22mr2643108ljg.125.1569504849337; 
 Thu, 26 Sep 2019 06:34:09 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m10sm533870lfo.69.2019.09.26.06.34.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 06:34:08 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-8-git-send-email-olekstysh@gmail.com>
 <55a32546-9a54-c326-f4ae-83c0dc5fb69d@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a4f5eb1d-1f20-9c88-5ea0-718a7af4cba8@gmail.com>
Date: Thu, 26 Sep 2019 16:34:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <55a32546-9a54-c326-f4ae-83c0dc5fb69d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI2LjA5LjE5IDE1OjUyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOS8yNi8xOSAxMjoyMCBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+
IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4KPj4KPj4gVGhlIG1haW4gcHVwcm9zZSBvZiB0aGlzIHBhdGNoIGlzIHRvIGFkZCBhIHdheSB0
byByZWdpc3RlciBEVCBkZXZpY2UKPj4gKHdoaWNoIGlzIGJlaGluZCB0aGUgSU9NTVUpIHVzaW5n
IHRoZSBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIFsxXQo+PiBiZWZvcmUgYXNzaWduaW5nIHRo
YXQgZGV2aWNlIHRvIGEgZG9tYWluLgo+Pgo+PiBTbywgdGhpcyBwYXRjaCBhZGRzIG5ldyAiaW9t
bXVfYWRkX2R0X2RldmljZSIgQVBJIGZvciBhZGRpbmcgRFQgZGV2aWNlCj4+IHRvIHRoZSBJT01N
VSB1c2luZyBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIGFuZCBwcmV2aW91c2x5IGFkZGVkCj4+
ICJpb21tdV9md3NwZWMiIHN1cHBvcnQuIEFzIGRldmljZXMgY2FuIGJlIGFzc2lnbmVkIHRvIHRo
ZSBoYXJkd2FyZSAKPj4gZG9tYWluCj4+IGFuZCBvdGhlciBkb21haW5zIHRoaXMgZnVuY3Rpb24g
aXMgY2FsbGVkIGZyb20gdHdvIHBsYWNlczogCj4+IGhhbmRsZV9kZXZpY2UoKQo+PiBhbmQgaW9t
bXVfZG9fZHRfZG9tY3RsKCkuCj4+Cj4+IEJlc2lkZXMgdGhhdCwgdGhpcyBwYXRjaCBhZGRzIG5l
dyAiZHRfeGxhdGUiIGNhbGxiYWNrIChib3Jyb3dlZCBmcm9tCj4+IExpbnV4ICJvZl94bGF0ZSIp
IGZvciBwcm92aWRpbmcgdGhlIGRyaXZlciB3aXRoIERUIElPTU1VIHNwZWNpZmllcgo+PiB3aGlj
aCBkZXNjcmliZXMgdGhlIElPTU1VIG1hc3RlciBpbnRlcmZhY2VzIG9mIHRoYXQgZGV2aWNlIChk
ZXZpY2UgCj4+IElEcywgZXRjKS4KPj4gQWNjb3JkaW5nIHRvIHRoZSBnZW5lcmljIElPTU1VIERU
IGJpbmRpbmdzIHRoZSBjb250ZXh0IG9mIHJlcXVpcmVkCj4+IHByb3BlcnRpZXMgZm9yIElPTU1V
IGRldmljZS9tYXN0ZXIgbm9kZSAoI2lvbW11LWNlbGxzLCBpb21tdXMpIGRlcGVuZHMKPj4gb24g
bWFueSBmYWN0b3JzIGFuZCBpcyByZWFsbHkgZHJpdmVyIGRlcGVuZGVkIHRoaW5nLgo+Pgo+PiBQ
bGVhc2Ugbm90ZSwgYWxsIElPTU1VIGRyaXZlcnMgd2hpY2ggc3VwcG9ydCBnZW5lcmljIElPTU1V
IERUIGJpbmRpbmdzCj4+IHNob3VsZCB1c2UgImR0X3hsYXRlIiBhbmQgImFkZF9kZXZpY2UiIGNh
bGxiYWNrcy4KPj4KPj4gWzFdIAo+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9tbXUudHh0Cj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4KPgo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKVGhh
bmsgeW91IQoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
