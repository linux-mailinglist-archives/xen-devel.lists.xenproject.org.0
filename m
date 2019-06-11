Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9623C8E7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadxF-00041W-5C; Tue, 11 Jun 2019 10:24:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hadxD-00041P-HZ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:24:35 +0000
X-Inumbo-ID: 1aa14ff7-8c33-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1aa14ff7-8c33-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 10:24:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x25so6436029ljh.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 03:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7qGg3qf2C7Elm2HsCPeMRIO3HS0iCwobtL9QVjQDp20=;
 b=eF+LTEnfPyc1APVhP3ViW7itAwa5B7LTRU7rgOQb/7tpGUqNNbaPVxQCXGe/IiY+Pm
 VNr+96tkLDluJXpTrEWVtbp/mOmDF4fZOqT05p5+7sfh2Vn7yuqPlB1ZDCCxTwXjj0R0
 LueBU3RLBClnX/lq+3sEQ3WWqFvPTk8wBH5I8n45jCajoz02e6tq0P4HFvv+chuUZdFp
 Rv5ZwoYU+d+Igmwp0szF6GJEwnnaqoop1HRXUvuFdF242klJ2T9dftq5mXPiXFJeOg5K
 82roQ228g5wO8+IsBHQzLg/G2vWZeq5BX6EUuJ4ti7rtgKVuwj/J6kJekpK0Jy9TcKxh
 C3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7qGg3qf2C7Elm2HsCPeMRIO3HS0iCwobtL9QVjQDp20=;
 b=hT4YJ6n4/euXwARdNzFKwNcAkA/P089JNR9nQFLVG52+eW/hMdJVLuIqE6zlyQLbzQ
 S/vwloOG8jum3VBBDOYmrAQl+GXeNRL0enJZrHE8NbHVJnixXBQ+3UTFquPV2l1qOaWB
 xlWIaffGNT1eRPXHTOiV4Eqo0cZzwrCWQU6KFph5wq9VG5AAD+n6f3RqlRj87BBAabsf
 gevQTpiuxvyo7TGsh6YRlWJipdiMBVvZvq4EiG9LT9GS0Wzoob81Dc9GE5NS6o/E0Ako
 6C5HGg7bK2N31vkdce6AQarzO6AMgHYUg8JecFEX6Wk0erPwxRMrc+RJXbpGh34NjGBa
 oOig==
X-Gm-Message-State: APjAAAW4plglQOadVFIbWs+o3HIqc3xgIoNkUGhyvXgVHSQISdgEwMGi
 gJiHl2fZtAp51UfaKPJAXXI=
X-Google-Smtp-Source: APXvYqwPq4/3z6/A2ssXzY4QNZK+3yL3IgX8yYrR58RF1wgGtW/HfssU1VMCYh20V/cHsx9vVop+Lg==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr35462579ljc.110.1560248672396; 
 Tue, 11 Jun 2019 03:24:32 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 m17sm2493893lji.16.2019.06.11.03.24.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:24:31 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
 <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
 <1dd86fe1814a52cb9b521a39511c2c5b70379b03.camel@suse.com>
 <fef869c7-263f-6595-4f38-7a10f94bd18f@gmail.com>
 <92e876b270f5ab823f34033ce9ba3460250759b5.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <fbdd3369-3d58-fa52-10e6-0b252e2f63d7@gmail.com>
Date: Tue, 11 Jun 2019 13:24:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <92e876b270f5ab823f34033ce9ba3460250759b5.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8KCgpPbiAxMS4wNi4xOSAxMzowMSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cgo+
PiBBcyBwZXIgdGhlIGN1cnJlbnQgY29kZSBJJ2QgcmVuYW1lIHRoZSBtZW1iZXIgdG8gYGxhc3Rf
c2NoZWRfdGltZWAuCj4+IFRvIHJlZmxlY3QgdGhhdCBpdCBpcyB0aGUgdGltZSB3aGVuIHRoZSB2
Y3B1IHdlbnQgdGhyb3VnaCBzY2hlZHVsaW5nCj4+IHBhdGguCj4+Cj4gT2ssIHllcywgdGhpcyBp
cyBzb21ldGhpbmcgSSBwZXJzb25hbGx5IGNhbiBsaXZlIHdpdGguIDotKQoKR29vZC4KSSdsbCBz
ZW5kIHY0IHdpdGggbm8gY29tbWVudCBidXQgcmVuYW1lZCBtZW1iZXIuCgotLSAKU2luY2VyZWx5
LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
