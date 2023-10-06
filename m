Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9F7BB435
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613436.953931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoh9e-0002fi-Nv; Fri, 06 Oct 2023 09:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613436.953931; Fri, 06 Oct 2023 09:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoh9e-0002dR-LD; Fri, 06 Oct 2023 09:29:54 +0000
Received: by outflank-mailman (input) for mailman id 613436;
 Fri, 06 Oct 2023 09:29:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoh9c-0002dL-ED
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:29:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoh9b-0001po-Q3; Fri, 06 Oct 2023 09:29:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoh9b-0004QD-Kq; Fri, 06 Oct 2023 09:29:51 +0000
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
	bh=+fO5+qW0hffLu8Tdz7j2uvKFtiao0r0DsdQ66uHQ6oY=; b=PRwFcdpPe0t4uPiSWK9gNcoqnm
	mnHh5P2xfwwj8I4GwyyIRbGaKSZ0JFEWp6+pGNDXrv6TK81578wGeu1ex4VzXikj3z4pU6tPyi+vL
	NgDzBnmWL0HjizZ5OWyM9mA5E33mQqrWFbj4hMcAF7+wy03v02AP4icLMNI9buCdVEFs=;
Message-ID: <6102db25-2fd6-49fa-be66-ec2b627b019b@xen.org>
Date: Fri, 6 Oct 2023 10:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 1/9] xen/include: add macro LOWEST_POW2
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/10/2023 09:26, Nicola Vetrini wrote:
> The purpose of this macro is to encapsulate the well-known expression
> 'x & -x', that in 2's complement architectures on unsigned integers will
> give 2^ffs(x), where ffs(x) is the position of the lowest set bit in x.
> 
> A deviation for ECLAIR is also introduced.

Can you explain why this is a deviation in ECLAIR rather than one with 
/* SAF-* */ (or whichever name we decide to rename to)? Is this because 
the code is correct from MISRA perspective but the tool is confused?

> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>   xen/include/xen/macros.h                         | 6 ++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b449..016164643105 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,12 @@ still non-negative."
>   -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>   -doc_end
>   
> +-doc_begin="The macro LOWEST_POW2 encapsulates a well-known pattern to obtain the value
> +2^ffs(x) for unsigned integers on two's complement architectures
> +(all the architectures supported by Xen satisfy this requirement)."
> +-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_POW2$))))"}
> +-doc_end
> +
>   ### Set 3 ###
>   
>   #
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index d0caae7db298..bb9a1c9a53d0 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,10 @@
>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>   
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +#define LOWEST_POW2(x) ((x) & -(x))
> +
> +#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_POW2(m))
> +#define MASK_INSR(v, m) (((v) * LOWEST_POW2(m)) & (m))
>   
>   #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
>   #define count_args(args...) \

-- 
Julien Grall

