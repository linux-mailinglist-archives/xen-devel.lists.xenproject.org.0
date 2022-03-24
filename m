Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDEF4E62DF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 13:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294267.500269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXM8p-0006TZ-5L; Thu, 24 Mar 2022 12:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294267.500269; Thu, 24 Mar 2022 12:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXM8p-0006RP-2B; Thu, 24 Mar 2022 12:00:35 +0000
Received: by outflank-mailman (input) for mailman id 294267;
 Thu, 24 Mar 2022 12:00:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXM8m-0006RH-W4
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 12:00:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXM8m-0002oz-El; Thu, 24 Mar 2022 12:00:32 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.236.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXM8m-00073e-7x; Thu, 24 Mar 2022 12:00:32 +0000
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
	bh=fBev3nM3lIJoBhXSh0cdhTtmHP15TCYjwjPJeqEeoQQ=; b=YdY38iZR/aTauRi2rSLSKhjQL4
	PFGWNNrVNsIWwxISBSoXuJaJ67xzwOI+hhsLstKDFFZpBXEjO/6cWN9QpyPqTYrCTGyqp0KsbiJKb
	wG0PywBJIC0catD16QwV9UkjVRZTOoAXOqG+GIxVufpdTaLav1XymBEbofCrtFBt4wNg=;
Message-ID: <60d17fb0-1a1a-0793-5989-506f03f143b7@xen.org>
Date: Thu, 24 Mar 2022 12:00:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/03/2022 11:04, Bertrand Marquis wrote:
> cppcheck can be used to check Xen code quality.

Is there anything we should be concerned of in the initial report?

> 
> To create a report do "make cppcheck" on a built tree adding any options
> you added during the process you used to build xen (like CROSS_COMPILE
> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
> 
> To create a html report do "make cppcheck-html" in the same way and a
> full report to be seen in a browser will be generated in
> cppcheck-htmlreport/index.html.
> 
> For better results it is recommended to build your own cppcheck from the
> latest sources that you can find at [1].
> Development and result analysis has been done with cppcheck 2.7.

We want to write down the minimum version of cppcheck we are going to 
support. My suggestion would be to use the version you picked for your 
development.

> 
> The Makefile rule is searching for all C files which have been compiled
> (ie which have a generated .o file) and is running cppcheck on all of
> them using the current configuration of xen so only the code actually
> compiled is checked.
> 
> A new tool is introduced to merge all cppcheck reports into one global
> report including all findings and removing duplicates.
> 
> Some extra variables can be used to customize the report:
> - CPPCHECK can be used to give the full path to the cppcheck binary to
> use (default is to use the one from the standard path).
> - CPPCHECK_HTMLREPORT can be used to give the full path to
> cppcheck-htmlreport (default is to use the one from the standard path).
> 
> This has been tested on several arm configurations (x86 should work but
> has not been tested).
> 
> [1] https://cppcheck.sourceforge.io/
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   .gitignore                           |  3 ++
>   xen/Makefile                         | 75 +++++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/processor.h |  4 +-
>   xen/include/xen/config.h             |  4 ++
>   xen/include/xen/kconfig.h            |  5 ++
>   xen/tools/merge_cppcheck_reports.py  | 73 +++++++++++++++++++++++++++

In the long term, I think it would be useful if we generate the report 
regularly. We might be able to hook the script that generate 
https://xenbits.xen.org/docs/.

> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 852b5f3c24..0b4ba73760 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -219,9 +219,11 @@
>                            SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>                            SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>   
> -#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffUL
> +#ifndef CPPCHECK
> +#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffULL
>   #error "Inconsistent SCTLR_EL2 set/clear bits"
>   #endif
> +#endif

Why is it necessary?

Cheers,

-- 
Julien Grall

