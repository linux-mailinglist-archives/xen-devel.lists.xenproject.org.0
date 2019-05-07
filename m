Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1315E5E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 09:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNugY-0003tz-LQ; Tue, 07 May 2019 07:38:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DEOA=TH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNugX-0003tu-72
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 07:38:45 +0000
X-Inumbo-ID: 2377aa51-709b-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2377aa51-709b-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 07:38:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u27so10786104lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2019 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8gs6iRTrAHFvJvKEahFd0vrmPDMg8iTHqhlo3aYXBPw=;
 b=TShb4qVkDM2g03cqbtgBHCPT/fQKNOSiEdlJSTYtsLnh5QDnkmxLHynugFLcfqYJRR
 nGBEudYrHZCLeHGfsYItWRti8wHZ2MpzmNsiZWgsTUKGSFCpUEvDCjpREW1DBoYApFvH
 6M4f+bs6K4rH+6UzYJEPVZvEJ6GuKXgbca7xfSgmWMwHVF5ZM2fzhljD1j459w4OK4c5
 Q9RKTagiOzcJ8vqKTNKgNDkTbHoxgR0NNnagnPwMZPurCYeE+5GO4BGZ/jofcP5vjqpK
 lQHNi6G2VqL/GEFM0LeukFGAbV2OuueaqCtfFsBylm8rH4gKlWacg+GCH4Z3bdqrpB9r
 K7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8gs6iRTrAHFvJvKEahFd0vrmPDMg8iTHqhlo3aYXBPw=;
 b=hzSnzFhU8sfyH99AA1htNHQC/J8+gE2NCNKqI69wVgkXRbjC2IS7lsmhk8+8P2tO4i
 WmZuv0J49VrFodD5ZG1NI4hv0hAcp4DJuTQQkOE/sRVXrCeErCmspcXW+LwBRLrdCFFo
 3/yMgKo822wn1m4oy6AmrjOxczzF4fmzEFax/yvVVPSbtdlB8fxpmGl+sA6je17Ii08U
 +VoW9ISrvq2jfm9eSOqbYaKGwgMbcpM8PC/t3Jd9cmO1uEGJhDZK7U3ZnrI0E8v6Sr8O
 sU1VoxmbkS/A8x2I49QAbSxG4P/o7bwOpjo+A1Hl9RdO5FEtNgP+GQPur71XpKcFpGQm
 b+jw==
X-Gm-Message-State: APjAAAULsVMa3ah5QIOk5onfJQzupgaiBhTojr6BfhvzIA6SmACwtGW3
 wBpt743w5yxpHyXBVQEtx5o=
X-Google-Smtp-Source: APXvYqylfqAf4pG1jxVQaBW/zDITBE0VyuxNs3byjQp1GO6ecsHr5GI8kQiiOrYU7UOUWT8R82I0UQ==
X-Received: by 2002:ac2:4315:: with SMTP id l21mr6506093lfh.143.1557214722331; 
 Tue, 07 May 2019 00:38:42 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 i27sm400826ljb.48.2019.05.07.00.38.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 00:38:41 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-7-julien.grall@arm.com>
 <7a6cb580-e4d7-7325-7797-d16ca0856c57@gmail.com>
 <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <11365b97-c8e5-a3f5-247b-822fc80e441a@gmail.com>
Date: Tue, 7 May 2019 10:38:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ac720fde-f515-dd69-69d8-761f7f119d74@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/12] xen/arm: mm: Sanity check any update
 of Xen page tables
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMDYuMDUuMTkgMjA6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
dCBpcyBub3QgdW5yZWxhdGVkLCB0aGUgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRvIG1ha2UgdGhpcyBw
YXRjaCB3b3Jrcy4gT3RoZXJ3aXNlIHlvdSB3aWxsIGhpdCB0aGUgQVNTRVJUKG1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSkgYWZ0ZXIgb25lIGl0ZXJhdGlvbi4KCkknbSBkZWZpbml0ZWx5IG5vdCBz
YXlpbmcgaXQgaXMgdG90YWxseSBvZGQgaGVyZS4gSSdtIGp1c3QgZXhwcmVzcyBteSBvcGluaW9u
IHRoYXQgcGF0Y2hlcyB3aXRoIGZsYWdzIGludHJvZHVjdGlvbiBhbmQgaW1wbGVtZW50YXRpb24g
YmV0dGVyIGdvIG9uZSBhZnRlciBhbm90aGVyLgpCdXQgZm9yIHN1cmUgdGhpcyBjb21tZW50IGlz
IGEgbWlub3Igbm90ZSwgc28gaXQncyB1cCB0byB5b3U6KQoKQlRXLCB3aXRoIHRoZSBmaXhlZCBj
b25kaXRpb246CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
