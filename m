Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFB4955F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 00:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd0LR-0003xS-TK; Mon, 17 Jun 2019 22:43:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hd0LQ-0003wv-0M
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 22:43:20 +0000
X-Inumbo-ID: 4d1e1d86-9151-11e9-8f6d-e3f305457464
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d1e1d86-9151-11e9-8f6d-e3f305457464;
 Mon, 17 Jun 2019 22:43:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDECC208C0;
 Mon, 17 Jun 2019 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560811398;
 bh=+RCeZs8n2yQXbrGlDYQJuvmG7HAtmjF96GIuGlArC98=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KphiSZQyI8QqJmJaRmyrqhiIAsNKZBl63jHyWWb85fLRkmo8nji5OJdHAKyQwmnDO
 RZzxjKB5wjMfUGIm8Z2Jyj9cvdhcTH84yKMUVTe/+u9alRB1gCD6c/r6672LQW2cD5
 moNTsUN+kdfGv6IEMX6ldilDP3/kfSieTZBfZzaw=
Date: Mon, 17 Jun 2019 15:43:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <a0eaef9c-543f-831c-c856-862f9e20c2f7@arm.com>
Message-ID: <alpine.DEB.2.21.1906171541120.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <a0eaef9c-543f-831c-c856-862f9e20c2f7@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiArI2RlZmluZSBNRU1P
UllfUE9MSUNZX0FSTV9ERVZfbkdSRSAgICAgICAwCj4gPiArLyogQXJtIG9ubHkuIE91dGVyIFNo
YXJlYWJsZSwgT3V0ZXIvSW5uZXIgV3JpdGUtQmFjayBDYWNoZWFibGUgbWVtb3J5ICovCj4gPiAr
I2RlZmluZSBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0IgICAgICAgICAxCj4gCj4gSSBhbSB3b25k
ZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgcHV0IEFybSAocmVzcC4geDg2KSBkZWZpbmVzIHVuZGVy
IGFuIGlmZGVmCj4gYXJtIChyZXNwLiB4ODYpLiBEbyB5b3Ugc2VlIGFueSB1c2UgaW4gdGhlIGNv
bW1vbiB0b29sc3RhY2sgY29kZSBvZiB0aG9zZQo+ICNpZmRlZj8KClllcywgdGhleSBhcmUgdXNl
ZCBpbiBsaWJ4bF9jcmVhdGUuYy4gSSB3b3VsZCBwcmVmZXIgdG8gYXZvaWQKaW50cm9kdWNpbmcg
I2lmZGVmIGhlcmUgYmVjYXVzZSBpdCB3aWxsIGFsbG93IHVzIHRvIGdldCBhd2F5IHdpdGggbm8K
I2lmZGVmIGluIGxpYnhsL3hsLgoKT0sgdG9vIGFsbCBvdGhlciBjb21tZW50cy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
