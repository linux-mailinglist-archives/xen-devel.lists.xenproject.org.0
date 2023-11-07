Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46E7E3E33
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 13:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628800.980636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LIA-0006M1-O6; Tue, 07 Nov 2023 12:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628800.980636; Tue, 07 Nov 2023 12:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LIA-0006HL-LG; Tue, 07 Nov 2023 12:34:50 +0000
Received: by outflank-mailman (input) for mailman id 628800;
 Tue, 07 Nov 2023 12:34:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0LI8-0006HE-MT
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 12:34:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LI7-0002ES-SM; Tue, 07 Nov 2023 12:34:47 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LI7-0004vJ-Jb; Tue, 07 Nov 2023 12:34:47 +0000
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
	bh=86lfeKoZX+zDzdVpym6XzXLdYJA9pnX+Ew+xdYT6kQU=; b=S4O9/jHrRrBWUS31W1d+2VSbrA
	niW8Hn2ethf4E+lrHBbOigE930YmGBBOooumM3cOg53iyo0FPAe8gJAwW940EpKiKXvxPmiZ2m0yF
	okat2VA537otr4dmsoey8HGqZ8zutF8hRQwEbsrR3Ryqlm0/UAbfUvUlIdt/r6dVzHfM=;
Message-ID: <c77af36e-5b12-48ba-8ce9-c94fab85194f@xen.org>
Date: Tue, 7 Nov 2023 12:34:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] xen/arm: GICv3: address MISRA C:2012 Rule 15.2
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <135227bde7bc41f44e9c3ae264dae8efc71ef8f0.1699295113.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <135227bde7bc41f44e9c3ae264dae8efc71ef8f0.1699295113.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 07/11/2023 10:33, Nicola Vetrini wrote:
> The backwards jump due to the "goto retry;" statement
> can be transformed into a loop, without losing much in terms
> of readability.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This specific patch was provided by Stefano, I just added the
> commit message.

If that's the case, then Stefano should be the Author (at the moment 
this is you).

> ---
>   xen/arch/arm/gic-v3-its.c | 81 ++++++++++++++++++++-------------------
>   1 file changed, 42 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 8afcd9783bc8..4ba3f869ddf2 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -341,6 +341,7 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
>       unsigned int pagesz = 2;    /* try 64K pages first, then go down. */
>       unsigned int table_size;
>       void *buffer;
> +    bool retry = false;

retry is false so...

>   
>       attr  = GIC_BASER_InnerShareable << GITS_BASER_SHAREABILITY_SHIFT;
>       attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
> @@ -351,55 +352,57 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
>        * it back and see what sticks (page size, cacheability and shareability
>        * attributes), retrying if necessary.
>        */
> -retry:
> -    table_size = ROUNDUP(nr_items * entry_size,
> -                         BIT(BASER_PAGE_BITS(pagesz), UL));
> -    /* The BASE registers support at most 256 pages. */
> -    table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
> +    while ( retry )

... you will never end in the loop. I also think that name 'retry' is 
confusing as the first time is not retry.

It would be clearer if we use a

do {

} while (retry)

That said, I actually prefer the goto version because some of the lines 
within the loop are now over 80 characters and splitting them would make 
the code harder to read.

Below an example, with the new indentation it is just over 80 characters.

if ( (regc & GITS_BASER_SHAREABILITY_MASK) == GIC_BASER_NonShareable )

One possibly would be to move the logic within the loop in a separate 
function.

Cheers,

-- 
Julien Grall

