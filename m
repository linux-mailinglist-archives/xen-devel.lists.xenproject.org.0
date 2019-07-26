Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EECB7661C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:46:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzYi-0001Yk-V0; Fri, 26 Jul 2019 12:42:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqzYg-0001YU-PG
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:42:50 +0000
X-Inumbo-ID: dfdbd15e-afa2-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dfdbd15e-afa2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:42:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r9so51346305ljg.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i92OdDwhd2fVSfec6MVgeqUMS0zVbX1o9sjl45PPOiM=;
 b=uHcItgRNo4+a+uim6BJ+hmXzJGK5Sy7O438DA3DWyjWkzyyrdkOnXnt5BlWWr6ktw9
 +2YsbZ4gjfTFeO2pYTUDciUda4i67DzzGSc4Mk8qvhgQF/3GMSZVieHWbyC5Hh801XI6
 WclptvJteLP7fxy98VgT39G5jqH+VAqsUDgGkBC8oxmpMJBxcMqneUG5yERFMTkoIl+z
 392JYd3F/tFnQojkazs0kTWVVZquycgANLF57HNe3VvpQLZHILxxdbsO18am22sBn184
 EusDaYKSmUDzaBkog2ZXgnZpQuFP8xLpmJF0d1RFcGA9P/9GomuvV7nvYqcexFY2HA21
 uBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i92OdDwhd2fVSfec6MVgeqUMS0zVbX1o9sjl45PPOiM=;
 b=IQDt6TjEUIrBFlkisUxwY6pFMUoEvTPr60py7ZjGtgLfdAiX/sPaP1nqAXArUq7x8X
 MSPBhBySTjWQnNCcn7/WoP/hEz6uV5n9K5hHYkEl/TBs494pnqxG+tRkvio3F2VKgLlx
 itW5b9T+vdFhlPtw711Yt6M/EH+PQ73pOlWVVaNSnVRofnF1QVabQR4n6qSCgqzIwCGV
 hQHrRZ8PW2ZuS6TPte5Z3DFJwlm6IGBZtoePySRtdE3O26NIHR0QtT2YslnhbZ/YK/lM
 gYy2OTf14U7NBfeN1zGpiVjj4dwmlPmoofIQd+jwu/11y24ZU09MzcE8uBbmbE+ghC5T
 yOfQ==
X-Gm-Message-State: APjAAAUfJkc+gIye+DKPDB6lFA6p32MN5KSxrkwt9IxFBb4DBKbi2N6O
 UXHlt5d2d8surwRA8wo6CxM=
X-Google-Smtp-Source: APXvYqyFCtxganTZXl8nyE8IWykzfmIYKObA7f+tgr47nbbe+lHVkijGSr7fKHZcK9o1eCGyOurbIA==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr49743262lja.230.1564144967854; 
 Fri, 26 Jul 2019 05:42:47 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t23sm9961161ljd.98.2019.07.26.05.42.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 05:42:47 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
 <f8e9bd7c08f85acc17af58fa305495113c990e0a.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <7b374888-c394-d741-f34b-28eb8647e507@gmail.com>
Date: Fri, 26 Jul 2019 15:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f8e9bd7c08f85acc17af58fa305495113c990e0a.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 2/6] schedule: account true system idle time
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8sCgpPbiAyNi4wNy4xOSAxNTowMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
T24gRnJpLCAyMDE5LTA3LTI2IGF0IDEzOjM3ICswMzAwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+
PiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+Pgo+PiBDdXJy
ZW50bHkgdGhlIGlkbGUgdGltZSBpcyBiZWluZyBhY2NvdW50ZWQgYXMgYSBpZGxlIHZjcHUgcnVu
dGltZS4KPj4gVGhpcyBpcyBub3QgZW50aXJlbHkgY29ycmVjdCwgYmVjYXVzZSB0aGUgZW50aXR5
IG5hbWVkIGlkbGUgdmNwdSBpcwo+PiBpbiBmYWN0IGEgaHlwZXJ2aXNvciB0YXNrcyB3b3JrZXIu
IEUuZy4gc29tZSBzb2Z0aXJxcyBhcmUgcHJvY2Vzc2VkCj4+IGJ5IHRoZSBpZGxlIHZjcHUuCj4+
Cj4gVGhhdCdzIGFsbCB2ZXJ5IHRydWUsIGFuZCwgYXMgZGlzY3Vzc2VkIGJvdGggdmlhIG1haWwg
YW5kIGluIHBlcnNvbiwKPiBJJ20gYWxsIGZvciBpdC4KClRoYW5rIHlvdSBmb3IgeW91IGludGVy
ZXN0LiBBbmQgSSBob3BlIHRvIGhhdmUgc29tZSBwcm9kdWN0aXZlIGRpc2N1c3Npb24gaGVyZS4g
OikKCj4gYW5kIHRoYXQncyBieSBoaWRpbmcgcmVhbCBpZGxlCj4gdGltZSBpbiB0aGUgaWRsZV92
Y3B1IGJsb2NrZWQgdGltZSBtZXRyaWM/IDotRCA6LVAKClllcywgSSBkby4gWW91IHNob3VsZCBi
ZSBub3RpY2VkIEkgdG9sZCBhYm91dCBpZGxlX3ZjcHUgcmVuYW1pbmcgaW4gdGhlIGNvdmVyIGxl
dHRlci4KU28gaWYgeW91IHRyZWF0IGN1cnJlbnQgaWRsZV92Y3B1IGFzIGEgaHlwZXJ2aXNvcl92
Y3B1LCB5b3Ugd2lsbCBzZWUgdGhhdCBnZXR0aW5nIGl0IGJsb2NrZWQgb24gd2FpdCBmb3IgZXZl
bnQgc3RyaWN0bHkgbWF0Y2ggdGhlIGlkbGUgY29uY2VwdC4KCj4gSm9rZXMgYXBhcnQsCgpTbyBs
ZXQgaXQgYmUgOikKCj4gSSBzZWUgaG93IGl0IGlzIHJhdGhlciBlYXN5IHRvIGRvIHNvbWV0aGlu
ZyBsaWtlIHRoaXMsIHNvCj4gSSB1bmRlcnN0YW5kIGl0IGJlaW5nIGRvbmUgbGlrZSB0aGlzIGlu
IGFuIFJGQyBwYXRjaCwgYnV0IEkgZG9uJ3QgdGhpbmsKPiBpdCdzIGNvcnJlY3QuCgpUaGlzIGlz
IHRoZSBWRVJZIFJGQyB3aXRoIHRoZSBtaW5pbWFsIGNoYW5nZXMgdG8gdGhlIGV4aXN0aW5nIGNv
ZGUgYW5kIGFkb3B0aW5nIGV4aXN0aW5nIGFwcHJvYWNoZXMuClRoaXMgdG9waWMgaXMgcmVhbGx5
IGNvbXBsZXggYW5kIHJlcXVpcmVzIHdpZGUgZGlzY3Vzc2lvbiwgc28gdGhpcyBzZXJpZXMgaXMg
cmF0aGVyIGFuIGludml0YXRpb24gdG8gdGhlIGRpc2N1c3Npb24uCgo+IEFuZCwgb24gYW4gZXZl
biBtb3JlIGdlbmVyYWwgcGVyc3BlY3RpdmUsIHRoZSBmYWN0IHRoYXQgdGhlIGh5cGVydmlzb3Is
Cj4gd2hlbiBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUsIHJ1bnMgc29mdGlycSwgdGFza2xldHMs
IGV0YywgaXQncyBhCj4gZ2VuZXJpYyBjb25jZXB0LCBub3QgYW4gYXJjaCBzcGVjaWZpYyBvbmUu
IFNvLCB3ZSByZWFsbHkgc2hvdWxkIGZpbmQgYQo+IHdheSB0byBpbXBsZW1lbnQgdGhpcyBpbiBj
b21tb24gY29kZSwgbm90IGluIGFyY2ggY29kZS4KClllcywgaW4gdGVybXMgb2YgdGhpcyBwYXRj
aCwgaWRsZV92Y3B1X3J1bnN0YXRlX2NoYW5nZSgpIGJldHRlciBiZSBtb3ZlZCB0byBjb21tb24v
c2NoZWR1bGUuYy4KCj4gTWF5YmUsIGJ1dCBJJ20ganVzdCB0aGlua2luZyBvdXQgbG91ZCwgYW5k
IEkgbmVlZCB0byB0aGluayBtb3JlIGFib3V0Cj4gdGhpcywgd2UgY2FuIGRvIHRoaW5ncyB0aGUg
b3RoZXIgd2F5IHJvdW5kLiBJLmUuLCB3ZSBtZWFzdXJlIHRoZSB0aW1lCj4gdGhhdCBpdCB0YWtl
cyB0byBydW4gc29mdGlycSBhbmQgdGFza2xldHMsIGFuZCB3ZSBzdWJ0cmFjdCBpdCBmcm9tCj4g
aWRsZV92Y3B1IHJ1bnRpbWU/CgpJbiB0aGUgcGF0Y2ggInNjaGVkdWxlOiBhY2NvdW50IGFsbCB0
aGUgaHlwZXJ2aXNvciB0aW1lIHRvIHRoZSBpZGxlIHZjcHUiIEkgZXh0ZW5kIHdoYXQgSSB0aGlu
ayBzaG91bGQgYmUgYWNjb3VudGVkIGZvciB0aGUgaHlwZXJ2aXNvciBydW4gdGltZS4gQW5kIHN1
YnRyYWN0aW9uIGFwcHJvYWNoIHdpbGwgcmVzdWx0IGluIG1vcmUgY29tcGxleCBjb2RlIG92ZXIg
dGhlcmUuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
