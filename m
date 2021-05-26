Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96244391B91
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132587.247262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvMQ-00064c-T3; Wed, 26 May 2021 15:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132587.247262; Wed, 26 May 2021 15:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvMQ-00062l-Pa; Wed, 26 May 2021 15:22:18 +0000
Received: by outflank-mailman (input) for mailman id 132587;
 Wed, 26 May 2021 15:22:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llvMP-00062M-Kf
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:22:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvML-0003JB-RQ; Wed, 26 May 2021 15:22:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvML-0007OT-LN; Wed, 26 May 2021 15:22:13 +0000
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
	bh=zoAuU7FmjXI3cpHS6x/57rn0nuIppVk1pzVGGjtL/V0=; b=QtPZ6TOWQQIVeXARZxJpaCXnoq
	OkPUsoH4inb6iEmh0O4SSuKWlWQo6pkLEBi0qApti48QSeYrYg6YVG6I9vEG+NaMGgeR02epDSQCS
	1JS8WJiNrdHI3+4+Wu2mMMTg/PFrGY1LOFgRROENUJUEgzqTgnUJAbj3T4aEOfOnNDT8=;
Subject: Re: [PATCH v2 0/2] Use const whenever we point to literal strings
 (take 1)
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210518140134.31541-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <d6a96741-6b78-882e-4dcf-cb2439846927@xen.org>
Date: Wed, 26 May 2021 16:22:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518140134.31541-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/05/2021 15:01, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> By default, both Clang and GCC will happily compile C code where
> non-const char * point to literal strings. This means the following
> code will be accepted:
> 
>      char *str = "test";
> 
>      str[0] = 'a';
> 
> Literal strings will reside in rodata, so they are not modifiable.
> This will result to an permission fault at runtime if the permissions
> are enforced in the page-tables (this is the case in Xen).
> 
> I am not aware of code trying to modify literal strings in Xen.
> However, there is a frequent use of non-const char * to point to
> literal strings. Given the size of the codebase, there is a risk
> to involuntarily introduce code that will modify literal strings.
> 
> Therefore it would be better to enforce using const when pointing
> to such strings. Both GCC and Clang provide an option to warn
> for such case (see -Wwrite-strings) and therefore could be used
> by Xen.
> 
> This series doesn't yet make use of -Wwrite-strings because
> the tree is not fully converted. Instead, it contains some easy
> and non-controversial use of const in the code.
> 
> Julien Grall (2):
>    xen/char: console: Use const whenever we point to literal strings
>    tools/console: Use const whenever we point to literal strings

I have committed the two patches.

> 
>   tools/console/client/main.c |  4 ++--
>   tools/console/daemon/io.c   | 15 ++++++++-------
>   xen/drivers/char/console.c  |  7 ++++---
>   3 files changed, 14 insertions(+), 12 deletions(-)
> 

-- 
Julien Grall

