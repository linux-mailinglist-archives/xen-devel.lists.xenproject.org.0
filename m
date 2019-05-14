Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F51C7FA
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:48:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVs2-0003OO-0F; Tue, 14 May 2019 11:45:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQVs1-0003OJ-3e
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:45:21 +0000
X-Inumbo-ID: bfc47a0c-763d-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bfc47a0c-763d-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 11:45:20 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h13so11603647lfc.7
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gnZ6J2PPyWQOuCJVGEgaDiRN2lXZ4Aur+3GYifFBr0w=;
 b=apY6ZnA8SwyrZLuIdl+1Hk2AqS2gm0StOP6uz2zUezJm57rHeLoCRN5O6Tl5GLpI3p
 8bl0RgYIOGC/4MX0iOrBF8DaUstDQOjGtNw9HcGN59Bm6GRMG8TMW9wis2dkEqgAYNDO
 RMTaGDAJml8POMNQAu/KtoNhQm5okjXDgPJt+I85zCa2KFLHCfDVim3me1fsdTuiHgT0
 paCsCazagDDrcANUDPw3B4528S50KHSHAVkBzydN2mT3IFrHNjE1lci1D0nUG1h3T7at
 qdgdwTsfPaQeoJQ7UTv71d7tsX6LobP/k5jMd5oTOCMSPr8Df6s/sWiBiCNwcCmmxu2Z
 u7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnZ6J2PPyWQOuCJVGEgaDiRN2lXZ4Aur+3GYifFBr0w=;
 b=GYKqWkL+fq/VV+c8h2m92ilq3Uc2Yd+VhLCK88VElSVTe3eHiu+vFQwtEQ3HGXE2YD
 N7cn8mzCZQz/K1QH1h4i1XVtPvQO310FCDjVT+obJ0hltFT7idCf+GxhTUmhfMcyWIVL
 MG9QLqcL3uOuoG+2vTzZKtrHJYMnKwxWwpK/WnRZxEQ8GsDeVZPMHJn7P3ATLPfT5O3Z
 apAoFJC9tFbTB4OdBKYuu48QuZ9sTKH3wHqRXGPots9aBNvY2aNFMkVP9QhbSq/jdxc5
 Jkrh82344hQs3iACLc5echAc0LyE0F/TexVaMdVay0sSjV4hUci9le4jsFgGTqw25MX3
 K7hg==
X-Gm-Message-State: APjAAAURRtvcwZmB2Y3F1r8Emv1tj/VA70+iY/E/6Ouvfw5mAxAqm0Pu
 1QMGZDf7hpfKet1iP6M5SrM=
X-Google-Smtp-Source: APXvYqxNwSG9bkhXo2A+81H+2cseirJ2IikLim+k+04Z6dfp0a4iVZQNVJvJEQKH4aDgRktXK3bUCw==
X-Received: by 2002:ac2:483c:: with SMTP id 28mr16493799lft.93.1557834318640; 
 Tue, 14 May 2019 04:45:18 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 o70sm3823034lff.53.2019.05.14.04.45.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 04:45:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
Date: Tue, 14 May 2019 14:45:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
 Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNDoyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSSB0aGluayB0aGVy
ZSBhcmUgYW4gYWdyZWVtZW50IHRoYXQgdGhlIHR3byBtZXRob2RzIHNob3VsZCBub3QgYmUgdXNl
ZCB0b2dldGhlci4KPj4KPj4gRm9yIGEgZG9tYWluIG9yIGZvciBhIHBhcnRpY3VsYXIgVkNQVT8K
Pj4gSG93IHNob3VsZCB3ZSByZXNwb25zZSBvbiB0aGUgcmVxdWVzdCB0byByZWdpc3RlciBwYWRk
ciB3aGVuIHdlIGFscmVhZHkgaGF2ZSByZWdpc3RlcmVkIHZhZGRyIGFuZCB2aWNlIHZlcnNhPwo+
IAo+ICBGcm9tIHRoZSBkaXNjdXNzaW9uIHdpdGggSmFuLCB5b3Ugd291bGQgdGVhciBkb3duIHRo
ZSBwcmV2aW91cyBzb2x1dGlvbiBhbmQgdGhlbgo+IHJlZ2lzdGVyIHRoZSBuZXcgdmVyc2lvbi4g
U28gdGhpcyBhbGxvd3MgY2FzZXMgbGlrZSBhIGJvb3Rsb2FkZXIgYW5kIGEga2VybmVsIHVzaW5n
IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBpbnRlcmZhY2UuCgpJJ20gbm90IHN1cmUgSmFuIHN0
YXRlZCB0aGF0LCBoZSByYXRoZXIgcXVlc3Rpb25lZCB0aGF0LgoKSmFuLCBjb3VsZCB5b3UgcGxl
YXNlIGNvbmZpcm0geW91IGFncmVlIHRoYXQgaXQgc2hvdWxkIGJlIGRyb3BwZWQgYWxyZWFkeSBy
ZWdpc3RlcmVkIHJ1bnN0YXRlIGFuZCAocG90ZW50aWFsbHkpIGNoYW5nZWQgdmVyc2lvbiBpbiBj
YXNlIG9mIHRoZSBuZXcgcmVnaXN0ZXIgcmVxdWVzdD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
