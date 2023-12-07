Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ADB808D77
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 17:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650032.1015258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHKJ-0007qL-RV; Thu, 07 Dec 2023 16:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650032.1015258; Thu, 07 Dec 2023 16:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBHKJ-0007oS-NU; Thu, 07 Dec 2023 16:34:15 +0000
Received: by outflank-mailman (input) for mailman id 650032;
 Thu, 07 Dec 2023 16:34:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBHKI-0007oM-HI
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 16:34:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBHKI-0007mc-2z; Thu, 07 Dec 2023 16:34:14 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBHKH-0008Am-Ty; Thu, 07 Dec 2023 16:34:14 +0000
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
	bh=KkM237Y1AOZO0VNc6OIB0BGwC0Jd9vMhnus7vkdq0v4=; b=IWOWEA8B1nn4W4zgxZaWIiRenE
	0GZktSyAH58FQS4F0wgFNM6hED0VW6NCKWYc+7NKSbSCsRIhcQz/1LVgZ+orBpUNnFHjrEv/9Ss1t
	TEvMBEVzwvpxgzLz/s/sAQEHlaraWI8qPseI97YNkqLa9O1d0BrSL9DVWPZl6Flwi+zg=;
Message-ID: <bc72e8c4-d370-4537-8e05-abd547de3bea@xen.org>
Date: Thu, 7 Dec 2023 16:34:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <4fa08aaed77d2b68db39ce51beef29820f1ba9b0.1701940034.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4fa08aaed77d2b68db39ce51beef29820f1ba9b0.1701940034.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi again,

On 07/12/2023 09:08, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states that an unconditional break statement
> shall terminate every switch-clause.
> 
> Update ECLAIR configuration to take into account:
> - continue, goto, return statements;
> - functions and macros that do not give the control back;
> - fallthrough comments and pseudo-keywords.
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   .../eclair_analysis/ECLAIR/deviations.ecl     | 18 ++++++++++++++
>   docs/misra/deviations.rst                     | 24 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index b0c79741b5..df0b58a010 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -321,6 +321,24 @@ statements are deliberate"
>   -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
>   -doc_end
>   
> +#
> +# Series 16.
> +#
> +
> +-doc_begin="Switch clauses ending with continue, goto, return statements are safe."
> +-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
> +-doc_end
> +
> +-doc_begin="Switch clauses not ending with the break statement are safe if a function/macro that does not give the control back is present."
> +-config=MC3R1.R16.3,terminals+={safe, "call(decl(name(__builtin_unreachable||do_unexpected_trap||fatal_trap||machine_halt||machine_restart||maybe_reboot||panic)))"}
> +-config=MC3R1.R16.3,terminals+={safe,"macro(name(BUG||BUG_ON))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses not ending with the break statement are safe if an explicit comment or pseudo-keyword indicating the fallthrough intention is present."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(any_loc(any_exp(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))))"}
> +-config=MC3R1.R16.3,reports+={safe, "any_area(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))"}
> +-doc_end
> +
>   #
>   # Series 20.
>   #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 6e7c4f25b8..fecd2bae8e 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -270,6 +270,30 @@ Deviations related to MISRA C:2012 Rules:
>          statements are deliberate.
>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>   
> +   * - R16.3
> +     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses not ending with the break statement are safe if a
> +       function/macro that does not give the control back is present.
> +     - Tagged as `safe` for ECLAIR, such functions/macros are:
> +        - __builtin_unreachable
> +        - do_unexpected_trap
> +        - fatal_trap
> +        - machine_halt
> +        - machine_restart
> +        - maybe_reboot
> +        - panic
> +        - BUG
> +        - BUG_ON
> +
> +   * - R16.3
> +     - Switch clauses not ending with the break statement are safe if an
> +       explicit comment or pseudo-keyword indicating the fallthrough intention
> +       is present.

One more thing. This is not explicit which comment should be added. But 
would should deprecate the comment in favor of "fallthrough".

The deviation should have it written down (similar to SAF-1 for rule 8.4).

Cheers,

-- 
Julien Grall

