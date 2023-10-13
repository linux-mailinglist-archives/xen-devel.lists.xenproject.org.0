Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AAB7C8032
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616281.958146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDUi-00042L-86; Fri, 13 Oct 2023 08:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616281.958146; Fri, 13 Oct 2023 08:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDUi-0003zu-57; Fri, 13 Oct 2023 08:26:04 +0000
Received: by outflank-mailman (input) for mailman id 616281;
 Fri, 13 Oct 2023 08:26:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrDUg-0003zo-A9
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:26:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDUf-0002A1-K8; Fri, 13 Oct 2023 08:26:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrDUf-0001Z6-AK; Fri, 13 Oct 2023 08:26:01 +0000
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
	bh=mciXo5VSHN4Y2AwqDeq6JGM6fOrgiK8JupZgrwn+T6E=; b=o15wgXsl5EKVaTM0AW6Ehg9PuD
	EF4yyY+48ro7vKwqVDGFGMyO8rAK5A+h0yzE3H1v5JzqWZ6e90ZXL0r9+4/193GEuSH5dQe3jmrJN
	puADxfpB+CiqHr5M9gyYoUA5XHTby5r01ma5BNU+6n8FFYQo6zrgM8Cj94ZZQF/w/5PU=;
Message-ID: <f62ad310-0f9a-4b28-9592-023d6a98c0dd@xen.org>
Date: Fri, 13 Oct 2023 09:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 12/10/2023 16:28, Nicola Vetrini wrote:
> The purpose of this macro is to encapsulate the well-known expression
> 'x & -x', that in 2's complement architectures on unsigned integers will
> give 2^ffs(x), where ffs(x) is the position of the lowest set bit in x.

In the commit message it is clear that the macro will return the lowest 
set bit. But...

> 
> A deviation for ECLAIR is also introduced.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - rename to LOWEST_BIT
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>   xen/include/xen/macros.h                         | 6 ++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b449..b8e1155ee49d 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,12 @@ still non-negative."
>   -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>   -doc_end
> 
> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
> +2^ffs(x) for unsigned integers on two's complement architectures
> +(all the architectures supported by Xen satisfy this requirement)."
> +-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
> +-doc_end
> +
>   ### Set 3 ###
> 
>   #
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index d0caae7db298..af47179d1056 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,10 @@
>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> 
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +#define LOWEST_BIT(x) ((x) & -(x))

... this is not reflected in the name of the macro. So it is not obvious 
if it will return the lowest bit set or clear.

Can you at least add a comment on top explaining what it returns? 
Something like:

/* Return the lowest bit set */

Cheers,

-- 
Julien Grall

