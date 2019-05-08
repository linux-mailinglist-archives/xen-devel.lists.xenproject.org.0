Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92B17594
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 12:04:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOJPp-0006Zk-Kx; Wed, 08 May 2019 10:03:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hOJPo-0006Zf-HD
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 10:03:08 +0000
X-Inumbo-ID: 79b4b13d-7178-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79b4b13d-7178-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 10:03:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n4so1021757ljg.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kUYfIOI/dX6Eo0a7YSZabosEkctek8F7P01X+OTN00Q=;
 b=rJwgUr4GsI26naR7i3bRg1v4jHY7nIzldb+YiOUPqVougOXkWLWnnRa0bcxQjIVVAE
 eVTjgnvo/UeX/anmbMnOu8AjGZpatC+2QlKS/5x4y7IrFw1MzN6/+DO961oGtTjwsVwM
 zFDKA/Zb5NRbI7Ecq03LlZrFqoRHyTXUyTQM7/XCcRPSEi/3ZQ77jbcNwznvHrVuqkMk
 /KHMN23pZ5sEEYYgbaHpDQXMrSa3oIME3p45ySxgqiHjuZ5yNNTiEhhLkqiZDkYqFDRA
 1vV58G3kuSR1j7DECqY2MfNuyu0OCUG93KEDVc07mZM+IqofT5xZ60mF3FzVmA/xflFf
 GgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUYfIOI/dX6Eo0a7YSZabosEkctek8F7P01X+OTN00Q=;
 b=qO0li7d4PpwcUr5Rnfpgt9OQpW7e48GevOlKgirpS/p0g53oPRkkbB013TC7yz4h1u
 FUVxmQW8QxDge+/ydEtVnu7ZDn7SF7nTSUsEhdZwPK54jGnyqhoPq7Lf1azruuWTrmc6
 LUxD1cu8m8ZXhFcuI1h1bYGEt5wFsQIIfNvbarN1qOqIpABMFw6Foc2mSKRNgEh3vLk4
 MG0CponJnLvLE6TkXRL9ojbERNre3KYk3Sa0JyaAsjckyGhUHt517jEvk+nxv76pu6EG
 qKTiNrZgDybfPyczlfa4Xc9niSR8vPQ62ewWLLjm/YULMVbP6xDKyXaRCgqUETTOLObh
 r8hg==
X-Gm-Message-State: APjAAAUK5IzjCvGmpApipKGTRhF5xj//SVRipkjdAbka3u5R2uOBVFoR
 CzAUqEWnrvAx00b2nq+s6xQ=
X-Google-Smtp-Source: APXvYqxxM5Aka8xbfs0fkork+lJaL89EKl9ws7nOOKGYVEr8aC1NygaqTeD5jn8DU7dPefSi0h++og==
X-Received: by 2002:a2e:96d9:: with SMTP id d25mr19586669ljj.78.1557309785840; 
 Wed, 08 May 2019 03:03:05 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p74sm361234ljb.92.2019.05.08.03.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 03:03:04 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
 <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <964c1e29-2d83-3c7c-06eb-424c29ce6cfa@gmail.com>
Date: Wed, 8 May 2019 13:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8sCgpTb3JyeSBmb3IgYSBkZWxheWVkIGFuc3dlciwKCk9uIDI2LjA0LjE5IDE4
OjEzLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBZb3UncmUgc3VnZ2VzdGluZyB0aGF0J3MgcmVk
dW5kYW50IHRvbywgYXJlbid0IHlvdT8KClllcywgSSBkby4KQW5kIGhhdmUgcHVzaGVkIHRoZSBw
YXRjaCBbMV0uCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA1L21zZzAwNTk3Lmh0bWwKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
