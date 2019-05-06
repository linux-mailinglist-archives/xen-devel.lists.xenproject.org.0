Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9A11461D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 10:23:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYr7-0007mm-SZ; Mon, 06 May 2019 08:20:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYr6-0007mh-AO
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:20:12 +0000
X-Inumbo-ID: c3ba5147-6fd7-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3ba5147-6fd7-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:20:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c6so4853055lji.11
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SYpd/As6flzO6pd5neLZ2eYLU0IdjH47wl+y4jmfELQ=;
 b=oLZHgl5WBQs9VcPdJ82BIUfM8rSyFFIZpIqaa/0Kz3AU7r36EyUrbteUDc1creuS6b
 HDSvCHtCDxacgYLfnOQ83A04jKnWpJGHBzLc12RXSzU0lG5Skr/1TQ7HXNiyV4UpVNT4
 +ptPiHDmcm9CxzaiAW/FsgmOQjAhp8JMTtWpt60wTPr28IEGm4hhMDqrYmUPzPFLJLhH
 TWUn+TKHztqxhM8ciP3NDRSVH0lWjTojQ7l8FILIfG+3JDr7DuBmiBZQPVdFZfJlSsUG
 DoquX6AURErcIJCJg7hf8KziEgPhM7v/GcQCue5LzadjTOCDFGWlgTDKpgoF3iTGRhjj
 grpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SYpd/As6flzO6pd5neLZ2eYLU0IdjH47wl+y4jmfELQ=;
 b=UAGoXsXGtBWWmCjL4Cv2i3q2Ecjk2RolrjfDGWhekcvXAn2Xqm/uHIEV25M+3rVMs+
 +3aYz827oPl8a0cykVFh4rBxRj9xT4ScIXk+BdRDC3u0G0MmFx4NxpKzp2I494AnC8QQ
 G4MnYb6CK/5rJDFknwygzW50lrjKsTgkmqAlBh73JoA+DqJUjHoZHiyLGBE7ExbCQ6DR
 K2pOggKwHI7f139/Pbju+zgY5tCqHNcMrq+X9f6tfMSEjkNoBhdZjQQvYjeXuaXcgyLk
 GcYkjneeZB9uCeje9vq9sqU2fP8fs92bWCTQ5GcMa+JMam5deDB3gEfffl8n3tTV+HiX
 spfw==
X-Gm-Message-State: APjAAAWvm+Ha3FBcMcc5ndSWd0Jq4NsmAUrrXUQ1p9pSvQ2OAVlpxg5o
 xyzEqYypmchLQzl7tv+EZNU=
X-Google-Smtp-Source: APXvYqyKrSQAP0xsnDdtVjV4nnSaG2tDjtwtSG/79SbTjHFNjnBZBTOhj0ITa7T6GAf9aU+7EznCAQ==
X-Received: by 2002:a2e:8916:: with SMTP id d22mr13034564lji.124.1557130809722; 
 Mon, 06 May 2019 01:20:09 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p18sm2400168ljc.54.2019.05.06.01.20.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 01:20:08 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
 <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
 <4bd14bff-9689-7943-9319-908b74139617@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
Date: Mon, 6 May 2019 11:20:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4bd14bff-9689-7943-9319-908b74139617@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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

SGVsbG8gSnVsaWVuLAoKT24gMDMuMDUuMTkgMjA6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
TERSOyBiZWNhdXNlIHhlbiBwYWdlLXRhYmxlcyBhcmUgbm90IHRoYXQgb2Z0ZW4gbW9kaWZpZWQg
YWZ0ZXIgYm9vdC4gWWV0IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIHJhY2UuCj4gCj4gQXQgdGhl
IG1vbWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzKCkgY2FuIG9ubHkgbW9kaWZ5IHRoZSBWQSByYW5n
ZSAwIC0gMkdCLiBJbiB0aGF0IHJhbmdlLCB3ZSBjYW4gbW9kaWZ5IGF0IHJ1bnRpbWUgdGhlIFZN
QVAgYXJlYS4gT25lIHBvdGVudGlhbCBpc3N1ZSBpcwo+IGEgdm1hcCBpc3N1ZWQgYXQgdGhlIHNh
bWUgdGltZS4KPiAKPiBXaGlsZSB0aGUgcmFuZ2UgYWxsb2NhdGlvbiBpcyBwcm90ZWN0ZWQgYnkg
YSBsb2NrIChzZWUgdm1fYWxsb2MpLCB0aGUgbWFwcGluZyBpcyBub3QuIFNvIGl0IHdvdWxkIGJl
IHBvc3NpYmxlIHRvIGVuZCB1cCBtb2RpZnlpbmcgdGhlIHBhZ2UtdGFibGUgYXQgdGhlIHNhbWUu
IFRoYXQgY291bGQgYmxvdyB1cCBpZiBmb3IgaW5zdGFuY2UsIHRoZSBzZWNvbmQtbGV2ZWwgZW50
cnkgaXMgaW52YWxpZCBhcyB3ZSB3b3VsZCBuZWVkIHRvIGFsbG9jYXRlIG1lbW9yeSAob25seSBv
bmUgY2FuIHdpbiB0aGF0IHJhY2UpLgoKSSB1bmRlcnN0YW5kIHRoZSBwb3RlbnRpYWwgcmFjZSwg
YnV0IHN0aWxsIHdvbmRlcmluZyB3aHkgZGlkbid0IHdlIHNlZSB0aG9zZSBpc3N1ZXMuIE1heWJl
IHdlIGFyZSB0b28gbHVja3kuCgo+IEluIGdlbmVyYWwsIGl0IGlzIGEgc2FuZXIgYXBwcm9hY2gg
dG8gdHJ5IHRvIHNlcmlhbGl6ZSB0aGUgbW9kaWZpY2F0aW9ucyBpbiB0aGUgcGFnZS10YWJsZXMu
IFNvIHlvdSBjYW4gc2FmZWx5IHJlYWQgYW4gZW50cnksIGNoZWNrIGl0IGFuZCB0aGVuIHVwZGF0
ZSBpdC4KCllldCwgSSB0aGluayB3ZSB3b3VsZCBzdGljayBhdCB0aGVzZSBsb2NrcyBmb3Igbm93
LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
