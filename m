Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DD86097
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:08:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgEI-0005eC-6k; Thu, 08 Aug 2019 11:05:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvgEH-0005e7-BE
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:05:09 +0000
X-Inumbo-ID: 6181b739-b9cc-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6181b739-b9cc-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 11:05:08 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so88393712lje.12
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i3vSEzFpWAQ5Kw2qnuHiRXVfUbdD4SvqK6HhatX/QiU=;
 b=GlW2wN51S5K54t5DY//alds3gEDGuKVaPtdBEsbgVgrdenOyD6gM5KLKkZ7sU5iEie
 DgjK49F8cwOEd5zIpz8k3297oY1L4UsQ5qN17RBncwa1mpBNXVtF92eu6z/gXBmjM6HC
 6gk2WeMNSaqZ0rGiWo3bhlA2qWCmdWBFz+5dHmCOL2iLG3ij2G5/PfRjSuK58GuPENgo
 pjcfXg5haNUMw2CUN3waJNYTfSKwStKW/ob6C46AQEVhMyDLjTsTUnXRhuMf5kRiBQi5
 gQjeHIXo/F1CQArf7UBZ49N2Si1X48zhQWTb18xLOQgP2WFIY3T3t5qhc6pP2RK2fyii
 09SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i3vSEzFpWAQ5Kw2qnuHiRXVfUbdD4SvqK6HhatX/QiU=;
 b=LCS0KT7QYb/oLxP1tfCK9M2o7g0/ButbKqdxDIU8DC1XDJlDOHRz5kYcB/hvze1772
 WrThSksYojI6lW0p0wiqhVqlIctdvC0YezyaQDv8AlQOvGwWjW0EByQGAf1utjWj6NOs
 LkKEsu2RltLXaR+5DPLyylTIGo9q7hnuxTK2SEOSGxDDfdEPU5W+IoPZEB9ryjHSh+aM
 EgVWj7ZBdrOGrENZ1ZSA3o3NBLjarcX0Akp+qrwOg7weI6+bFeP3SW+j+7uxqj2xIzGg
 Isc2JOv8Q5SzVpP4fx0QSQJuK3zUTHfWj5KU1C9SetuOAtU3vlC5UM0bJTLKV2IhOyKU
 ZogQ==
X-Gm-Message-State: APjAAAWxksSDmivrK9PWSJ5QUGY49aj8I9EZrDgZJQQR22+AY5yYVW6k
 TKiFZ8XnTsTlLeZ6Gj7e7ME=
X-Google-Smtp-Source: APXvYqz41aFEIbtM7Sv4AZhIOe90nI9aEVzYdLBoLfErCr2vek2ZpZD/hoPEnU2a9lGfSz8X1aPgZQ==
X-Received: by 2002:a2e:b048:: with SMTP id d8mr8147472ljl.118.1565262306590; 
 Thu, 08 Aug 2019 04:05:06 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k27sm18481767lfm.90.2019.08.08.04.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 04:05:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com> <87sgqegji0.fsf@epam.com>
 <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
 <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
 <c11e9c93-e83b-906c-2a99-2a4580c5d797@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6adfe27d-4a30-196c-cc8e-39d59b9068af@gmail.com>
Date: Thu, 8 Aug 2019 14:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c11e9c93-e83b-906c-2a99-2a4580c5d797@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDA4LjA4LjE5IDEwOjA1LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpIEphbgoKPiAoSSdtIHNv
cnJ5IGlmIHlvdSByZWNlaXZlIGR1cGxpY2F0ZXMgb2YgdGhpcywgYnV0IEkndmUgZ290IGEgcmVw
bHkKPiBiYWNrIGZyb20gb3VyIG1haWwgc3lzdGVtIHRoYXQgc2V2ZXJhbCBvZiB0aGUgcmVjaXBp
ZW50cyBkaWQgbm90Cj4gaGF2ZSB0aGVpciBob3N0IG5hbWVzIHJlc29sdmVkIGNvcnJlY3RseSBv
biB0aGUgZmlyc3QgYXR0ZW1wdC4pCgpBYnNvbHV0ZWx5IG5vIHByb2JsZW0uCgoKPj4gSmFuLCBo
b3cgdGhpcyBjb3VsZCBiZSB0ZWNobmljYWxseSBpbXBsZW1lbnRlZCwgb3IgYXJlIHRoZXNlIGFu
eSBleGlzdGluZyBleGFtcGxlcyBpbiBYZW4/Cj4gU2VlIHg4NidzIGNvcHlfdG9fZ3Vlc3Rfb2Zm
c2V0KCksIGZvciBleGFtcGxlLiBUbyBnZXQgdGhlIGNvbXBpbGVyCj4gdG8gZW1pdCBhIHdhcm5p
bmcgKGF0IGxlYXN0KSwgYSAodHlwaWNhbGx5IG90aGVyd2lzZSBkZWFkKQo+IGNvbXBhcmlzb24g
b2YgcG9pbnRlcnMgaXMgY29tbW9ubHkgdXNlZC4KCgpUaGFuayB5b3UgZm9yIHRoZSBwb2ludGVy
LiBJdCBpcyBjbGVhciBub3cuCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
