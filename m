Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF844E3EF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225010.388595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlSzG-0001JN-0u; Fri, 12 Nov 2021 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225010.388595; Fri, 12 Nov 2021 09:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlSzF-0001H3-Sa; Fri, 12 Nov 2021 09:36:45 +0000
Received: by outflank-mailman (input) for mailman id 225010;
 Fri, 12 Nov 2021 09:36:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mlSzF-0001Gx-05
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:36:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlSzE-0004w6-DD; Fri, 12 Nov 2021 09:36:44 +0000
Received: from [54.239.6.189] (helo=[192.168.1.222])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlSzE-0003Lm-6Z; Fri, 12 Nov 2021 09:36:44 +0000
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
	bh=TQFaUKswhNJagBIiN1qoja/mkeeJ5OuTAIzdUcMPuY4=; b=cZQ6yHBNYbn7wLW6MvVkqaDF4v
	MJKYHeDRBcuibR9By4/T1wqF2wkRot2koIQ4RlG/eEqDn/TlC8IlZZfV3F7llqoZIleuCkKbKRmDk
	yzzsonZK04W0YP90Y9E/EsbbwtTThtMp+BDJzq3ECT0TUyQ+oVbzMTsB743WpJHMT3M8=;
Message-ID: <dc639bdb-a025-4ddf-f328-8aca91bf9ea9@xen.org>
Date: Fri, 12 Nov 2021 09:36:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] xen/domain: Remove function pointers from domain
 pause helpers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211111175740.23480-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

  ~/works/oss/linux/scripts/bloat-o-meter xen-syms-old xen-syms

On 11/11/2021 17:57, Andrew Cooper wrote:
> Retpolines are expensive, and all these do are select between the sync and
> nosync helpers.  Pass a boolean instead, and use direct calls everywhere.

To be honest, I much prefer to read the old code. I am totally not 
against the change but I can see how I would be ready to introduce new 
function pointers use in the future.

So I think we need some guidelines on when to use function pointers in 
Xen. The more...

> 
> Pause/unpause operations on behalf of dom0 are not fastpaths, so avoid
> exposing the __domain_pause_by_systemcontroller() internal.
> 
> This actually compiles smaller than before:

... the code doesn't really compile smaller on Arm:

42sh>  ../scripts/bloat-o-meter xen-syms-old xen-syms

add/remove: 4/2 grow/shrink: 0/6 up/down: 272/-252 (20)
Function                                     old     new   delta
_domain_pause                                  -     136    +136
_domain_pause_by_systemcontroller              -     120    +120
domain_pause_by_systemcontroller_nosync        -       8      +8
domain_pause_by_systemcontroller               -       8      +8
domain_resume                                136     132      -4
domain_pause_nosync                           12       8      -4
domain_pause                                  12       8      -4
domain_pause_except_self                     188     180      -8
do_domctl                                   5480    5472      -8
domain_kill                                  372     356     -16
do_domain_pause                               88       -     -88
__domain_pause_by_systemcontroller           120       -    -120
Total: Before=966919, After=966939, chg +0.00%

> 
>    $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
>    add/remove: 3/1 grow/shrink: 0/5 up/down: 250/-273 (-23)
>    Function                                     old     new   delta
>    _domain_pause                                  -     115    +115
>    domain_pause_by_systemcontroller               -      69     +69
>    domain_pause_by_systemcontroller_nosync        -      66     +66
>    domain_kill                                  426     398     -28
>    domain_resume                                246     214     -32
>    domain_pause_except_self                     189     141     -48
>    domain_pause                                  59      10     -49
>    domain_pause_nosync                           59       7     -52
>    __domain_pause_by_systemcontroller            64       -     -64
> 
> despite GCC's best efforts.  The new _domain_pause_by_systemcontroller()
> really should not be inlined, considering that the difference is only the
> setup of the sync boolean to pass to _domain_pause(), and there are plenty of
> registers to spare.

Cheers,

-- 
Julien Grall

