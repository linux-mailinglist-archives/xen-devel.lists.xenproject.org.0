Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422AA3C6D56
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155235.286611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EgA-0003Mf-NT; Tue, 13 Jul 2021 09:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155235.286611; Tue, 13 Jul 2021 09:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EgA-0003Jk-JT; Tue, 13 Jul 2021 09:26:14 +0000
Received: by outflank-mailman (input) for mailman id 155235;
 Tue, 13 Jul 2021 09:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFX4=MF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1m3Eg8-0003JY-MA
 for xen-devel@lists.xen.org; Tue, 13 Jul 2021 09:26:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5caadb4e-e3bc-11eb-8732-12813bfff9fa;
 Tue, 13 Jul 2021 09:26:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3Eg5-0001qy-0U; Tue, 13 Jul 2021 09:26:09 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3Eg4-0001V2-Qv; Tue, 13 Jul 2021 09:26:08 +0000
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
X-Inumbo-ID: 5caadb4e-e3bc-11eb-8732-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3YQrEjXOnQWWIIrOWht7OZAhShEQAqUA1Tq0eteRHHg=; b=2aFvsSyxwNQ1DGx74zQwi3B6+q
	LHMncAcPkN8iSeUwznRHAmp/Fr1AVuQgZTZryl8wNccIBy8aHXFsru6Iz5mxB3rL5OclvBA1gPRN7
	uV+HCRLxuDTJ7+sewUXyRl1pMuYczEzRt8NNlBhD5j/L7bUuGF/LtGpTC7ZNHxuwTAJY=;
Subject: Re: DMA restriction and NUMA node number
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <DB9PR08MB68573DE6333A36646EDC75409E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <89025168-bf55-5dff-db61-989b95934775@xen.org>
Date: Tue, 13 Jul 2021 10:26:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB68573DE6333A36646EDC75409E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+Andrew, Jan, Roger)

On 13/07/2021 04:19, Wei Chen wrote:
> Hi,
> 
> I am doing some NUMA testing on Xen. And I find the DMA restriction is
> based on NUMA node number [1].
>      if ( !dma_bitsize && (num_online_nodes() > 1) )
>          dma_bitsize = arch_get_dma_bitsize();
> 
> On Arm64, we will set dma_bitsize [2] to 0, that means we don't need to
> reserve DMA memory. But when num_online_nodes > 1, the dma_bitsize
> will override to 32. This may be caused by the Arm64 version
> arch_get_dma_bitsize, it may be a simple implementation and not NUMA
> aware.
> 
> But I still quite curious about why DMA restriction depends on NUMA
> node number. In Arm64, dma_bitsize does not change when the NUMA node
> changes. So we didn't expect arch_get_dma_bitsize to be called here.
> 
> I copied Keir's commit message from 2008. It seems this code was considered
> only for x86, when he was working on it. But I'm not an x86 expert, so I
> hope Xen x86 folks can give some help. Understanding this will help us to

It is best to CCed the relevant person so they know you have requested 
there input. I have added the x86 maintainers in the thread.

> do some adaptations to Arm in subsequent modifications : )
> 
> commit accacb43cb7f16e9d1d8c0e58ea72c9d0c32cec2
> Author: Keir Fraser <keir.fraser@citrix.com>
> Date:   Mon Jul 28 16:40:30 2008 +0100
> 
>      Simplify 'dma heap' logic.
> 
>      1. Only useful for NUMA systems, so turn it off on non-NUMA systems by
>         default.
>      2. On NUMA systems, by default relate the DMA heap size to NUMA node 0
>         memory size (so that not all of node 0's memory ends up being 'DMA
>         heap').
>      3. Remove the 'dma emergency pool'. It's less useful now that running
>         out of low memory isn;t as fatal as it used to be (e.g., when we
>         needed to be able to allocate low-memory PAE page directories).
> 
> [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/page_alloc.c;h=958ba0cd9256c8270e38585d272be2bf5cc0679e;hb=refs/heads/master#l1876
> [2] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/page_alloc.c;h=958ba0cd9256c8270e38585d272be2bf5cc0679e;hb=refs/heads/master#l226

Cheers,

-- 
Julien Grall

