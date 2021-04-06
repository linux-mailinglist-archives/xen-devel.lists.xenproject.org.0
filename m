Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F19355B6C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106221.203165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqUQ-0007aI-NA; Tue, 06 Apr 2021 18:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106221.203165; Tue, 06 Apr 2021 18:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqUQ-0007Zt-JV; Tue, 06 Apr 2021 18:31:50 +0000
Received: by outflank-mailman (input) for mailman id 106221;
 Tue, 06 Apr 2021 18:31:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTqUP-0007Ze-1N
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqUH-0004ly-RI; Tue, 06 Apr 2021 18:31:41 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqUH-0004UM-GK; Tue, 06 Apr 2021 18:31:41 +0000
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
	bh=tWsW5Yoj4ql+j1gAVglHFf6MMTnUyNPXS0mFzyE1Gv0=; b=ZgAa1fbMHt7iXBcwBp9I6VE+3l
	3BrnVHFa8AK80SBzFdT+gpk3ZPU4Y+i15uczb+JYEbq0CC+5vPXWhbElYIWAxXlGLxGJfAf+VmvA4
	VsjCF6Bsj4oJZ8VdChKVpVE4v4UoIboaGp0B8SZ+3AxEJbsAzalnBhJCMzc/DJtncv9s=;
Subject: Re: [PATCH 0/2] xen/arm: Couple of bug fixes when decompressing
 kernels
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210402152105.29387-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7d105207-7bd4-66b2-0ff3-d1e684da123f@xen.org>
Date: Tue, 6 Apr 2021 19:31:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402152105.29387-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/04/2021 16:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> The main goal of this series is to address the bug report [1]. It is not
> possible
> 
> While testing the series, I also noticed that it is not possible to
> re-use the same compressed kernel for multiple domains as the module
> will be overwritten during the first decompression.
> 
> I am still a bit undecided how to fix it. We can either create a new
> module for the uncompressed kernel and link with the compressed kernel.
> Or we could decompress everytime.
> 
> One inconvenience to kernel to only decompress once is we have to keep
> it until all the domains have booted. This may means a lot of memory to be
> wasted just for keeping the uncompressed kernel (one my setup, it takes
> ~3 times more space).
> 
> Any opinions on how to approach it?
> 
> Cheers,
> 
> [1] https://lists.xenproject.org/archives/html/xen-users/2021-02/msg00027.html
> 
> Julien Grall (2):
>    xen/arm: kernel: Propagate the error if we fail to decompress the
>      kernel
>    xen/gunzip: Allow perform_gunzip() to be called multiple times

I have committed the second patch as it is independent. The first patch 
still need some reviews.

Cheers,

-- 
Julien Grall

