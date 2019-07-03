Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C75DD7D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 06:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiWy3-0001WL-HA; Wed, 03 Jul 2019 04:34:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ilX4=VA=gmail.com=minwoo.im.dev@srs-us1.protection.inumbo.net>)
 id 1hiSzO-0006dv-Fm
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 00:19:10 +0000
X-Inumbo-ID: 2d056d0e-9d28-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d056d0e-9d28-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 00:19:09 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id r7so269695pfl.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 17:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G2YqfkEvAQAEaHiI4AbuUSgjkEW4+tXLhh4WWMs6JGc=;
 b=tizq4CrVTABFZl6lnMuMEVk6tKI1qJnrWGFe4D/LjmvB+V/tTxAnsgpyrZ8ifIyQMT
 DeSjjLtTF+MYi9fu+Udh57TbTdSonKNX1fyQwjbtUsQ1mNxyYGZ0tOg7kdONrRwWYHRU
 /81FIsGttSimYEFso4N+gs0xCCAPgOYT7desTo5Us0nvxbySoSFC5NjbJlBLCdASlvYe
 Z+BerYub+aib38bjlte4Y2MPUytGx4mmaBBg24mm2Se4RN4gJJ/BwU8sdjhBPIqh0JjG
 vO+YziBW9IDARDb2dlpWDmQmaMHMRdAKP9RusLrskr5Z+0YQY4lT5v/jU4vBxDvMKwVO
 ynBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G2YqfkEvAQAEaHiI4AbuUSgjkEW4+tXLhh4WWMs6JGc=;
 b=uMbxj8ejjqFnyIhgpdr6fQil2FqXcVGSk65VCwfmaCWUehzyLEaLUYEYOcn2g20Nmq
 qOzsai4fkH8U+cCEzrxdegyPi5PQBxvcQGweyiYjbP/nGZ32w+9c6Qs8zfFDsLNEI8wI
 KMdb63kxnubikTYr6nhALRV3h1pG32rXLvWsN53dxjE0yOHCi2r9TUzko62b2IA7TmMP
 aK5V2PMbfsXQNgVTdGhH9mutIyNLjZ5wxHT3mkwsXjtt/5EpJWF1/pEpjybPe7Z+RUk/
 bBg7RCd3yTyo4fDazsJs6XJnuuHNuK+wY/i+IaOBT5g9O/rLJR5ug/nzMnKe7HnugtvS
 DU7A==
X-Gm-Message-State: APjAAAX+Sr7iK7c/lxQ7vfGcmtHM+Xsmro6/uqRJzeJ///IxRbXPu9tX
 z5uEntx+AgYdhkK7T15GTmc=
X-Google-Smtp-Source: APXvYqy+IWFwh62Asy5np8pkDyBI/cyqwDN82970y6xL03Sfn32ecxy0iA6/KhMffPZM6PpjIKF3hg==
X-Received: by 2002:a17:90a:1785:: with SMTP id
 q5mr8609557pja.106.1562113148665; 
 Tue, 02 Jul 2019 17:19:08 -0700 (PDT)
Received: from localhost ([123.213.206.190])
 by smtp.gmail.com with ESMTPSA id y5sm246107pgv.12.2019.07.02.17.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 17:19:07 -0700 (PDT)
Date: Wed, 3 Jul 2019 09:19:04 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20190703001904.GB15705@minwoo-desktop>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 03 Jul 2019 04:34:02 +0000
Subject: Re: [Xen-devel] [PATCH V3 1/9] block: add a helper function to read
 nr_setcs
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTktMDctMDIgMTA6NDI6MjcsIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBUaGlzIHBh
dGNoIGludHJvZHVjZXMgaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdGhlIG51bWJlciBvZiBzZWN0
b3JzCj4gZnJvbSBzdHJ1Y3QgYmxvY2tfZGV2aWNlLT5iZF9wYXJ0IG1lbWJlci4gRm9yIG1vcmUg
ZGV0YWlscyBQbGVhc2UgcmVmZXIKPiB0byB0aGUgY29tbWVudCBpbiB0aGUgaW5jbHVkZS9saW51
eC9nZW5oZC5oIGZvciBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KCldpdGhvdXQgYmRfbXV0ZXggbG9j
a2VkLCB0aGlzIGhlbHBlciBzZWVtcyB1c2VmdWwgdG8gaGF2ZS4KClJldmlld2VkLWJ5OiBNaW53
b28gSW0gPG1pbndvby5pbS5kZXZAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
