Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735980538C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647694.1011223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATzO-0006nO-Nl; Tue, 05 Dec 2023 11:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647694.1011223; Tue, 05 Dec 2023 11:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATzO-0006ky-KZ; Tue, 05 Dec 2023 11:53:22 +0000
Received: by outflank-mailman (input) for mailman id 647694;
 Tue, 05 Dec 2023 11:53:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rATzN-0006jd-5i
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:53:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rATzM-0004G4-TM; Tue, 05 Dec 2023 11:53:20 +0000
Received: from [15.248.3.117] (helo=[10.24.67.37])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rATzM-0000KZ-Ng; Tue, 05 Dec 2023 11:53:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=U9c8mR1DZocEOTXExm9KvDdFaKFd0emz9LynjhI4/K0=; b=0G/BivVq7DGwm1O0uKCdP/+V1p
	kIeJeXZGOf4uVj8+XOsNhqe1ZU/9dLuwkXtHWd9dT/CkSvDt/jhmRg3WXWg3U3pMzWUJC9ATyQWYF
	hJReM06QsR0GAeMqbDf956akQvOVhY+9FvQVjTGQxwnVLI4yPKuP2qnbTYZT7RvPOTLA=;
Message-ID: <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
Date: Tue, 5 Dec 2023 11:53:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231205100756.18920-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/12/2023 10:07, Juergen Gross wrote:
> Instead of defining get_unaligned() and put_unaligned() in a way that
> is only supporting architectures allowing unaligned accesses, use the
> same approach as the Linux kernel and let the compiler do the
> decision how to generate the code for probably unaligned data accesses.
> 
> Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
> the Linux kernel.
> 
> The generated code has been checked to be the same on x86.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
> Signed-off-by: Juergen Gross <jgross@suse.com>

Can you outline your end goal? At least on arm32, I believe this will 
result to abort because event if the architecture support unaligned 
access, we are preventing them on Arm32.

Cheers,

-- 
Julien Grall

