Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00930E4A3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 22:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81065.149097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7PLl-0006ji-TP; Wed, 03 Feb 2021 21:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81065.149097; Wed, 03 Feb 2021 21:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7PLl-0006jJ-Q0; Wed, 03 Feb 2021 21:06:09 +0000
Received: by outflank-mailman (input) for mailman id 81065;
 Wed, 03 Feb 2021 21:06:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DaK9=HF=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1l7PLj-0006jC-JN
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 21:06:08 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb56a75f-4fe9-484c-a239-a35ce530000e;
 Wed, 03 Feb 2021 21:06:03 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::aec2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7PLd-00070g-Ac; Wed, 03 Feb 2021 21:06:01 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bb56a75f-4fe9-484c-a239-a35ce530000e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oZBuJOenngoomghCK7kOaxz4eUOh9dK/zu7ReamXwRw=; b=WqTbYln7KEBuj5REqZLx/+qn5d
	EYp78dgxS8hJpncZvcCNQTtQdv02rKO9IBx+9gRZYRhtT+bYvKOTs6cpoaCedKZx/iSLPMzB+2O23
	4UY+J5SOwCzRQI2dXS5H6uZL2Om85x4T9ZgWmS0Coz4UV99NMucKEulkug+oTUafI8TTc8RxDh5mc
	HQpYu/MxNl2VpX03uS1OCZRVBb1PAX+mXYmqdpjfOcSiRL4Ln73mKJwpgSgRcMD1k3LpcA+jmzyiw
	naDL2kmKVUvOYTSx1vz0ReG/nOlpwiTDbe49f+5gX4FuKjMemY5tpGHeKQoIZ8VIEke+vJ+QScyp7
	fI+bclfw==;
Subject: Re: Linux 5.11-rc6 compile error
To: Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 xen-devel@lists.xenproject.org
References: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cbaa9611-ad63-94c3-5205-c8e28a3211d5@infradead.org>
Date: Wed, 3 Feb 2021 13:05:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/3/21 11:58 AM, Shuah Khan wrote:
> I am seeing the following compile error on Linux 5.11-rc6.
> No issues on 5.11.0-rc5 with the same config.
> 
> ld: arch/x86/built-in.a: member arch/x86/kernel/pci-swiotlb.o in archive is not an object
> make: *** [Makefile:1170: vmlinux] Error 1
> 
> CONFIG_SWIOTLB_XEN=y
> CONFIG_SWIOTLB=y

Those config settings in allmodconfig builds for me.


> I can debug further later on today. Checking to see if there are any
> known problems.


-- 
~Randy


