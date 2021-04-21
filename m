Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C036677C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114170.217452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8lo-0005sQ-Ep; Wed, 21 Apr 2021 09:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114170.217452; Wed, 21 Apr 2021 09:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8lo-0005s1-Bh; Wed, 21 Apr 2021 09:03:40 +0000
Received: by outflank-mailman (input) for mailman id 114170;
 Wed, 21 Apr 2021 09:03:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZ8ln-0005rw-FK
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:03:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ8ln-0003tN-AK; Wed, 21 Apr 2021 09:03:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZ8ln-0004PM-2v; Wed, 21 Apr 2021 09:03:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cvgkbdI/kjFRa3Ce0DDZ2MT/+NXb1k3YJicVzsyszOk=; b=ml9uUk9TUBXenHrg/IRvEDmltj
	6q87zvBFQkJxqPnASCO4YebZftgGdwozjV5qAYqk5h5+YmOOrUVzeverMWADFx1FcpxsnLFj+J7Hd
	LkcuEIORWsaXb86WPCnFZW0bSKEHiMx3RktYWOIq8P8KmBn9EXrVW5F0dBDOoFS1hZ4w=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
Date: Wed, 21 Apr 2021 10:03:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 21/04/2021 07:28, Henry Wang wrote:
> Hi,

Hi Henry,

> 
> We are trying to implement the static memory allocation on AArch64. Part of
> this feature is the reserved heap memory allocation, where a specific range of
> memory is reserved only for heap. In the development process, we found a
> pitfall in current AArch64 setup_xenheap_mappings() function.
> 
> According to a previous discussion in community
> https://lore.kernel.org/xen-devel/20190216134456.10681-1-peng.fan@nxp.com/,
> on AArch64, bootmem is initialized after setup_xenheap_mappings(),
> setup_xenheap_mappings() may try to allocate memory before memory has been
> handed over to the boot allocator. If the reserved heap memory allocation is
> introduced, either of below 2 cases will trigger a crash:
> 
> 1. If the reserved heap memory is at the end of the memory block list and the
> gap between reserved and unreserved memory is bigger than 512GB, when we setup
> mappings from the beginning of the memory block list, we will get OOM caused
> by lack of pages in boot allocator. This is because the memory that is reserved
> for heap has not been mapped and added to the boot allocator.
> 
> 2. If we add the memory that is reserved for heap to boot allocator first, and
> then setup mappings for banks in the memory block list, we may get a page which
> has not been setup mapping, causing a data abort.

There are a few issues with setup_xenheap_mappings(). I have been 
reworking the code on my spare time and started to upstream bits of it. 
A PoC can be found here:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/pt/dev

Cheers,

-- 
Julien Grall

