Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443C91089C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744750.1151867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIwW-0004lo-Eu; Thu, 20 Jun 2024 14:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744750.1151867; Thu, 20 Jun 2024 14:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIwW-0004in-BU; Thu, 20 Jun 2024 14:39:16 +0000
Received: by outflank-mailman (input) for mailman id 744750;
 Thu, 20 Jun 2024 14:39:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sKIwV-0004iN-9W
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:39:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sKIwU-0000le-O2; Thu, 20 Jun 2024 14:39:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sKIwU-0007Zu-Hp; Thu, 20 Jun 2024 14:39:14 +0000
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
	bh=jhEcHgIlZfdJss6WFCMhzkj5kMkSAoudV6UuxVlBjlY=; b=u1UqwounVdmEKudk8K1HxU3cwB
	7mdCXHiT864a/nri04fjkOIiJO5do2JcB6+zKVaxPgF2HrS0mkP3mKpOapKXa19lw+D5BnvZvyZ7h
	SbDHd1bHh8Uz1G8BIF9nW+qUB6i802P0vTi2+iBhpJQ3ItfQoYeW+HUa9CBjE5e7UaWg=;
Message-ID: <846a944c-13a6-4b38-915a-d29136a90c19@xen.org>
Date: Thu, 20 Jun 2024 15:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/13] automation/eclair: consider also hypened
 fall-through
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
 <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2024 15:02, Federico Serafini wrote:
> Update ECLAIR configuration to deviate MISRA C Rule 16.3
> using different version of hypened fall-through and search for
> the comment for 2 lines after the last statement.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>   docs/misra/deviations.rst                        | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index b8f9155267..b99a6b8a92 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -400,7 +400,7 @@ safe."
>   -doc_end
>   
>   -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all[ -]?through.? \\*/.*$,0..2))))"}
>   -doc_end
>   
>   -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 41cdfbe5f5..411e1fed3d 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -353,6 +353,10 @@ Deviations related to MISRA C:2012 Rules:
>          However, the use of such comments in new code is deprecated:
>          the pseudo-keyword "fallthrough" shall be used.
>        - Tagged as `safe` for ECLAIR. The accepted comments are:
> +         - /\* fall-through \*/
> +         - /\* Fall-through. \*/
> +         - /\* Fall-through \*/
> +         - /\* fall-through. \*/

How many places use the 4 above? The reason I am asking is I am not 
particularly happy to add yet another set of variant.

I would rather prefer if we settle down with a single comment and 
therefore convert them to the pseudo-keyword.

Cheers,

-- 
Julien Grall

