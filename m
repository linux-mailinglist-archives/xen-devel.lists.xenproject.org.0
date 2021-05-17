Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE710383BFE
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 20:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128454.241160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihjG-0006M6-ID; Mon, 17 May 2021 18:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128454.241160; Mon, 17 May 2021 18:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lihjG-0006Ji-F5; Mon, 17 May 2021 18:12:34 +0000
Received: by outflank-mailman (input) for mailman id 128454;
 Mon, 17 May 2021 18:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lihjF-0006Jc-7Z
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 18:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihjB-0001Ib-LY; Mon, 17 May 2021 18:12:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lihjB-0000d7-Bg; Mon, 17 May 2021 18:12:29 +0000
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
	bh=1UCfJABfTb6rfYAygapJEkqrS8gUWVMJiYUEUif62Ww=; b=rOp3S6lX7OF9+TUx1iyKJNxiH5
	/xE57QzzJc2YFt8tdSYrdpkPD8mQQAa1LDBjPl7RisaEHqcgNQ1F3ADkQ4jdgqQrTVMdjk+a9xQn4
	bB+LzOZzTad5HEbgNhEnS32i5gamOOXKSxCzpjDBwughLhjzU+VBGmxsDPj9XZn3UBqk=;
Subject: Re: [PATCH v3 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE
 redefinition error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <2040286fc39b7e1d46376a8e75ac59d8d3be5aff.1620633386.git.costin.lupu@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <690806fb-e6e2-f61f-d7d6-a17efa6329d9@xen.org>
Date: Mon, 17 May 2021 19:12:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2040286fc39b7e1d46376a8e75ac59d8d3be5aff.1620633386.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Costin,

On 10/05/2021 09:35, Costin Lupu wrote:
> @@ -168,7 +168,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>       size_t i;
>       int rc;
>   
> -    addr = mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED,
> +    addr = mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED,
>                   fd, 0);
>       if ( addr == MAP_FAILED )
>           return NULL;
> @@ -198,9 +198,10 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>            */
>           privcmd_mmapbatch_t ioctlx;
>           xen_pfn_t *pfn;
> -        unsigned int pfn_arr_size = ROUNDUP((num * sizeof(*pfn)), PAGE_SHIFT);
> +        unsigned int pfn_arr_size = ROUNDUP((num * sizeof(*pfn)), XC_PAGE_SHIFT);
> +        int os_page_size = getpagesize();

Hmmm... Sorry I only realized now that the manpage suggests that 
getpagesize() is legacy:

     SVr4, 4.4BSD, SUSv2.  In SUSv2 the getpagesize() call is labeled 
LEGACY, and in POSIX.1-2001 it has been dropped; HP-UX does not have 
this call.

And then:

    Portable applications should employ sysconf(_SC_PAGESIZE) instead of 
getpagesize():

            #include <unistd.h>
            long sz = sysconf(_SC_PAGESIZE);

As this is only used by Linux, it is not clear to me whether this is 
important. Ian, what do you think?

>   
> -        if ( pfn_arr_size <= PAGE_SIZE )
> +        if ( pfn_arr_size <= os_page_size )

Your commit message suggests we are only s/PAGE_SHIFT/XC_PAGE_SHIFT/ but 
this is using getpagesize() instead. I agree it should be using the OS 
size. However, this should be clarified in the commit message.

The rest of the patch looks fine to me .

Cheers,

-- 
Julien Grall

