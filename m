Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204617F6CA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 14:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htWbh-0003ci-5t; Fri, 02 Aug 2019 12:24:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bRuE=V6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1htWbf-0003cd-Fb
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:24:23 +0000
X-Inumbo-ID: 74b08c51-b520-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74b08c51-b520-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 12:24:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m8so39051360lji.7
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYh6mq7wedimG9+i0ADbLsmUMFydmJN44VUKqEdz7Cc=;
 b=aqyPBJdpAvuI0Dz0rjaqV4fD8RzpYFECGX87PuS95i4kpGWitgMZgCUndURLy2sC7n
 Ll0+6jPVHsD2gyTq+fFJVxzWu1yhuw1njjuY2gwQ2F2KT8AH6iTCkbq/zZu4eOLDgk1i
 2yldDsp1COT4ZjmPs++CVGw62Tud8tTO6Df9VqvTcJY9WkFrdo5V1FzEXK3sBT2BytVO
 YAvAylIG0rhKtNZiw9qSehPlIxHSMitKC7uAPMx1qZ7SN5JGAR3Ou0//WNKnENRdW7PP
 gE+TqlUesjGYFRauS97KDTujqBZEEAKDUDtqwov5GSw1myn6Czou5HF1ooRn4MMuohAC
 C0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYh6mq7wedimG9+i0ADbLsmUMFydmJN44VUKqEdz7Cc=;
 b=rksumP8kn5M8JO202NxDbS5dLn04QFl676iOWu9nbCDLRGyLaYFLv0hmMwCDe8Hirc
 2Bp3cJRdW1xLLqD1O74aUU9XFGjG4khumAV5Mik2xtgiLPBFGszlMWX8t5mtSeBuAnKU
 M2gG8a2O4N9TvcSrdSf5op5jj8TOyXbF/pd6qBIzx0fKAYuKfKvD5pWQYpPydbZ0NOIQ
 gd1ZqsCHXtb/R5cepG0Tr0kQDgxMIhFbFf+qqqCd468Bohe7iUvgH/x/suQdBCWaBuVz
 pDshPXTc4jrzbIHwYw/R4M+K9+i3JpbOdRz5phs/B0bAtBNVE/PkFfteiLpGbkDEEgXS
 e8bA==
X-Gm-Message-State: APjAAAVYkr/dEmJWSFcH5TwfHHwPrhT1OhSh9LL4p7Cw1omf3Pu1crwN
 PzhdfUqlaaZiaHgVdV8H1VE=
X-Google-Smtp-Source: APXvYqy2flmbOngArSSg+d6tyxCuEsyEwMY78ifIC61vzF3W3XA+2jaSgeZigkQgIFwyLubxR7MEIA==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr35366981lji.171.1564748660716; 
 Fri, 02 Aug 2019 05:24:20 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 p76sm15083566ljb.49.2019.08.02.05.24.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 05:24:19 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
 <0f4bd23e-587d-d166-01a1-7c4d44ad4b50@gmail.com>
 <10fd9482-8440-ac7c-c40e-4b735ecfe97c@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <2e95c614-e01a-ddc3-7c96-3de4ca9c73b4@gmail.com>
Date: Fri, 2 Aug 2019 15:24:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <10fd9482-8440-ac7c-c40e-4b735ecfe97c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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

CgpPbiAwMi4wOC4xOSAxMjowMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZmFpciBhbW91bnQg
b2YgbGVhdmVfaHlwZXJ2aXNvcl90YWlsKCkgZGVhbCB3aXRoIHRoZSBndWVzdCBpdHNlbGYgKGku
ZSB2R0lDLCBQMk0uLi4pCgpBbGwgdGhhdCBzdHVmZiBpcyB3aGF0IGh5cGVydmlzb3IgZG9lcyBm
b3IgdGhlIGd1ZXN0LiBBbmQgZG9lcyBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFjay4KCj4gLCBzbyBJ
IHRoaW5rIHRoZXkgc2hvdWxkIGJlIGFjY291bnRlZCB0byB0aGUgZ3Vlc3QgdGltZS4KVGhpcyBw
b2ludCBpcyBhcmd1YWJsZS4gVGhhdCdzIHdoeSB3ZSBoYXZlIGEgZGlzY3Vzc2lvbiBoZXJlIHRv
IGFncmVlIG9uIHRoZSB0aW1lIGFjY291bnRpbmcgYXBwcm9hY2gsIHdoYXQgd2lsbCBkaXJlY3Rs
eSBhZmZlY3Qgc2NoZWR1bGluZyBhY2N1cmFjeS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
