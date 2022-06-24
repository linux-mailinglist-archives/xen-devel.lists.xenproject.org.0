Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B41B559869
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 13:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355460.583128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hN1-0001gJ-N9; Fri, 24 Jun 2022 11:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355460.583128; Fri, 24 Jun 2022 11:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hN1-0001eS-Ja; Fri, 24 Jun 2022 11:21:03 +0000
Received: by outflank-mailman (input) for mailman id 355460;
 Fri, 24 Jun 2022 11:21:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4hN0-0001eM-8Y
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 11:21:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4hMz-0004SA-Rd; Fri, 24 Jun 2022 11:21:01 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4hMz-0004hA-L1; Fri, 24 Jun 2022 11:21:01 +0000
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
	bh=aBYO87BqO1dAbCxIojsFJFI205Xb1pxEQhjAL1OFQGQ=; b=xUbQ3xttbEucwonneS1Y4jEsqf
	7KZFztsCQ0sgnIkj2OVtLLq14Vgy2TcBbvEnbbGJueJ3ziaJRY4y3iblx8+PAs5dwSyL26ul+W22p
	SDRemN4E5pvAaJZ/0NLXu/S/NN8TWnYMjrp1HvfYFSdNv0d9EyQR6kHiBlm+m63XfZps=;
Message-ID: <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
Date: Fri, 24 Jun 2022 12:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220624105311.21057-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 24/06/2022 11:53, Luca Fancellu wrote:
> Add instructions on how to build cppcheck, the version currently used
> and an example to use the cppcheck integration to run the analysis on
> the Xen codebase
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
>   create mode 100644 docs/misra/cppcheck.txt
> 
> diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
> new file mode 100644
> index 000000000000..4df0488794aa
> --- /dev/null
> +++ b/docs/misra/cppcheck.txt
> @@ -0,0 +1,66 @@
> +Cppcheck for Xen static and MISRA analysis
> +==========================================
> +
> +Xen can be analysed for both static analysis problems and MISRA violation using
> +cppcheck, the open source tool allows the creation of a report with all the
> +findings. Xen has introduced the support in the Makefile so it's very easy to
> +use and in this document we can see how.
> +
> +First recommendation is to use exactly the same version in this page and provide
> +the same option to the build system, so that every Xen developer can reproduce
> +the same findings.

I am not sure I agree. I think it is good that each developper use their 
own version (so long it is supported), so they may be able to find 
issues that may not appear with 2.7.

> +
> +Install cppcheck in the system

NIT: s/in/on/ I think.

> +==============================
> +
> +Cppcheck can be retrieved from the github repository or by downloading the
> +tarball, the version tested so far is the 2.7:
> +
> + - https://github.com/danmar/cppcheck/tree/2.7
> + - https://github.com/danmar/cppcheck/archive/2.7.tar.gz
> +
> +To compile and install it, here the complete command line:
> +
> +make MATCHCOMPILER=yes \
> +    FILESDIR=/usr/share/cppcheck \
> +    CFGDIR=/usr/share/cppcheck/cfg \
> +    HAVE_RULES=yes \
> +    CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" \
> +    install

Let me start that I am not convinced that our documentation should 
explain how to build cppcheck.

But if that's desire, then I think you ought to explain why we need to 
update CXXFLAGS (I would expect cppcheck to build everywhere without 
specifying additional flags).

Cheers,

-- 
Julien Grall

