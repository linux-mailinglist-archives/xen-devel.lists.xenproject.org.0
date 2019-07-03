Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DA5DD7E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 06:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiWy4-0001WX-4o; Wed, 03 Jul 2019 04:34:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ilX4=VA=gmail.com=minwoo.im.dev@srs-us1.protection.inumbo.net>)
 id 1hiT1M-0007Ex-6C
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 00:21:12 +0000
X-Inumbo-ID: 7593bbb3-9d28-11e9-8980-bc764e045a96
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7593bbb3-9d28-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 00:21:11 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z75so218725pgz.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SyGygRvF7tQ7FctjsD/yOuoqXJYtp+eTsFPKMcnatrs=;
 b=NQdsT26kXB30wQgDd6j8wAXc3lqYA4/QUO5XOL6I5fkc1jnphiYqUeyGX6P6OFkBQ7
 PlEpA9WenC+UpJJzbdKxtHQOH2KRMejNADumCvIOtw/AkQEbWhHRoDdX4sB1fE1bDX3G
 gs9JSvVI2g2BlldCrIJ8keNsHGUigpT9Zw0weSM5IOOJ3H9vZ2p4ZQf6nAltXIqWdto4
 YkA6NLmw9ck0MpNkqZzpLCfa0Hp2n2J2GA3Vq9GgMOQiAZyt/0ehAQyHCcqcfG+6jygd
 OaHnoMOeLseIg4q4efZQZ9Z7nejF9blCnwnb9wSxDxzy6eSf5WjTFgAAMEgUeiA8u0wp
 Ob5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SyGygRvF7tQ7FctjsD/yOuoqXJYtp+eTsFPKMcnatrs=;
 b=JVvnReyqNIiQ2b7rTRlXH/4cX9I6y+4sWPstuEHFvlXed9mROR88wgtdG5MSErl3M9
 UwBLX2bzTcxk0XiFkR/dBfF4K+zk+ZclsV6A3DipOQHwgQDlXlbhlPZ3aVpQ4vQ/hS+6
 X2o937T5XORCc7oUlWyd+0xoLkdlZaVle72q4DPeh0DVOMe7U1SaBTRs3PpymJ1uDZtz
 6ZsAqC+DUpcoXyiSl6sbYmmry8nKdWSYeTZSxu0kk6k4gVpuTXEgksharahWiww4oC0D
 5eEq+Jp13sjstFqGOQkUjzLFlvJygQVAqWfmYBiglvnCigXQ2YavYzdxhmkRC6T4zPeB
 Q2eg==
X-Gm-Message-State: APjAAAUnJdD6nkL4I2bnTFP9M9TEMWlPfFLoShNf773phDQvPz+eV+jg
 0d2MDVN2OOP2J3Pv9+WK2S3HaHPWKq8=
X-Google-Smtp-Source: APXvYqw7GdQJdCoAqYc4RVF3EPx6ukesK6aJ9nue2vSbAqwQbZroX7LfXxNcySyQWP7wMZbNvVuzvw==
X-Received: by 2002:a17:90a:5207:: with SMTP id
 v7mr8302656pjh.127.1562113270544; 
 Tue, 02 Jul 2019 17:21:10 -0700 (PDT)
Received: from localhost ([123.213.206.190])
 by smtp.gmail.com with ESMTPSA id h11sm212092pfn.170.2019.07.02.17.21.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 17:21:09 -0700 (PDT)
Date: Wed, 3 Jul 2019 09:21:07 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20190703002107.GD15705@minwoo-desktop>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-4-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702174236.3332-4-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 03 Jul 2019 04:34:02 +0000
Subject: Re: [Xen-devel] [PATCH V3 3/9] blk-zoned: update
 blkdev_report_zone() with helper
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

T24gMTktMDctMDIgMTA6NDI6MjksIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBUaGlzIHBh
dGNoIHVwZGF0ZXMgdGhlIGJsa2Rldl9yZXBvcnRfem9uZShzKSgpIHdpdGggbmV3bHkgaW50cm9k
dWNlZAo+IGhlbHBlciBmdW5jdGlvbiB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRl
dmljZSdzIGhkX3BhcnRzIHdpdGgKPiB0aGUgaGVscCBvZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4K
Ckl0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogTWlud29vIEltIDxtaW53b28uaW0u
ZGV2QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
