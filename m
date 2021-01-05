Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EA2EA9A5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 12:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61811.108912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkKv-0003pY-AR; Tue, 05 Jan 2021 11:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61811.108912; Tue, 05 Jan 2021 11:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkKv-0003p9-74; Tue, 05 Jan 2021 11:17:13 +0000
Received: by outflank-mailman (input) for mailman id 61811;
 Tue, 05 Jan 2021 11:17:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwkKt-0003p4-KT
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:17:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwkKt-0007S1-9n; Tue, 05 Jan 2021 11:17:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwkKt-0000Dr-0m; Tue, 05 Jan 2021 11:17:11 +0000
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
	bh=LsI0Avom9OlbDvrvvI8tC+YgPSjieqm8KrJhTuFkFt8=; b=DmB7zqClto/9ZHYpWq/zo00vme
	vQRcFVet0hUtDsNXWD6eCQE4Ok9KzWok5xhfZZuPoKy8tRHajkZ61UtKmEE+ygLwVHLwQUiuW2xS+
	/DOFnT0Q01yYNjG+VkmYbKhK2xbxr1cWKBhknhwb6BtVW8smdtm1ucrFeODtfpyGr7w4=;
Subject: Re: [PATCH 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210105071946.1971229-1-wei.chen@arm.com>
 <20210105071946.1971229-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <522b798d-5f89-648e-bfe2-6fe36cc7a571@xen.org>
Date: Tue, 5 Jan 2021 11:17:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105071946.1971229-2-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 05/01/2021 07:19, Wei Chen wrote:
> As the dicsussion [1] in mailing list. We'd better to have

I would say "Per the discussion [1] on the ...". I would also suggest to 
replace the "." with ",".

> a barrier after reading CNTPCT in get_cycles. If there is
> not any barrier there. When get_cycles being used in some
> seqlock critical context in the future, the seqlock can be
> speculated potentially.

This comment seems a little off because we don't have seqlock on Xen. I 
think it would be best if you re-use the Linux commit as it would be 
clear that this is a backport.

Something like:

"Import commit .... from Linux:

<entire commit message indented by one>

While we are not aware of such use in Xen, it would be best to add the 
barrier to avoid any suprise."
"

> 
> In order to reduce the impact of new barrier, we perfer to
> use enforce order instead of ISB [2].
> 
> Currently, enforce order is not applied to arm32 as this is
> not done in Linux at the date of this patch. If this is done
> in Linux it will need to be also done in Xen.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg00181.html
> [2] https://lkml.org/lkml/2020/3/13/645
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-arm/time.h | 43 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 5c4529ebb5..3ef4e7cd3d 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -11,9 +11,26 @@
>   
>   typedef uint64_t cycles_t;
>   
> -static inline cycles_t get_cycles(void)
> +/*
> + * Ensure that reads of the counter are treated the same as memory reads
> + * for the purposes of ordering by subsequent memory barriers.
> + */

The comment is before the #ifdef which suggests the ordering is required 
for Arm as well. I would suggest to either mention that oddity or move 
the comment after the #ifdef.

> +#if defined(CONFIG_ARM_64)
> +#define read_cntpct_enforce_ordering(val) do { \
> +    u64 tmp, _val = (val);                     \

Please use uint64_t here.

> +                                               \
> +    asm volatile(                              \
> +    "eor %0, %1, %1\n"                         \
> +    "add %0, sp, %0\n"                         \
> +    "ldr xzr, [%0]"                            \
> +    : "=r" (tmp) : "r" (_val));                \
> +} while (0)
> +#else
> +#define read_cntpct_enforce_ordering(val) do {} while (0)
> +#endif
> +
> +static inline cycles_t read_cntpct_stable(void)
>   {
> -    isb();
>       /*
>        * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
>        * can return a wrong value when the counter crosses a 32bit boundary.
> @@ -36,6 +53,28 @@ static inline cycles_t get_cycles(void)
>       }
>   }
>   
> +static inline cycles_t get_cycles(void)
> +{
> +    cycles_t cnt;
> +
> +    isb();
> +    cnt = read_cntpct_stable();
> +
> +    /*
> +     * If there is not any barrier here. When get_cycles being used in
> +     * some seqlock critical context in the future, the seqlock can be
> +     * speculated potentially.
> +     *
> +     * To prevent seqlock from being speculated silently, we add a barrier
> +     * here defensively. Normally, we just need an ISB here is enough, but
> +     * considering the minimum performance cost. We prefer to use enforce
> +     * order here.
> +     */

We don't use seqlock in Xen, so this comment looks quite confusing.. I 
think the comment on top of reach_cntpct_enforce_ordering() is 
sufficient, so I would drop this one. The alternative is to find a way 
to make the comment more Xen focused.

Although, I don't have a good suggestion so far.

> +    read_cntpct_enforce_ordering(cnt);
> +
> +    return cnt;
> +}
> +
>   /* List of timer's IRQ */
>   enum timer_ppi
>   {
> 

Cheers,

-- 
Julien Grall

