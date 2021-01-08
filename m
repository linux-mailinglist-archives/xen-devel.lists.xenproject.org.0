Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73A2EF1AD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63394.112578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqMv-0005YZ-NM; Fri, 08 Jan 2021 11:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63394.112578; Fri, 08 Jan 2021 11:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqMv-0005Y9-JN; Fri, 08 Jan 2021 11:55:49 +0000
Received: by outflank-mailman (input) for mailman id 63394;
 Fri, 08 Jan 2021 11:55:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxqMu-0005Y3-1O
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:55:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxqMt-0007ZK-S4; Fri, 08 Jan 2021 11:55:47 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxqMt-0008ED-Fj; Fri, 08 Jan 2021 11:55:47 +0000
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
	bh=PFwTP2YogD4QqgM0tlLxlM9HYjcp2GrTzoCHIRbwTTk=; b=tpB11HJJJ0UDsjE3Fw37bNwCUq
	99kx6OLNPyrPykzcpkfS0Jnch5izURHoqv37WdYv4ito6cEq+oIq/Nip2p5h6clbRukE0+Ce5f/AD
	/VJEhv9OHli8gnpfkfo8qzVF7t9a3iY0YK9TL6xmX7OB5yXHEkABu8W6E2CZbZlg8ipc=;
Subject: Re: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Penny.Zheng@arm.com, Jiamei.Xie@arm.com,
 nd@arm.com
References: <20210108062126.2335873-1-wei.chen@arm.com>
 <20210108062126.2335873-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6de687f-2836-ec44-7d24-b088bfa10378@xen.org>
Date: Fri, 8 Jan 2021 11:55:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108062126.2335873-2-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 08/01/2021 06:21, Wei Chen wrote:
> Per the discussion [1] on the mailing list, we'd better to
> have a barrier after reading CNTPCT in get_cycles. If there
> is not any barrier there. When get_cycles being used in some
> seqlock critical context in the future, the seqlock can be
> speculated potentially.
> 
> We import Linux commit 75a19a0202db21638a1c2b424afb867e1f9a2376:
>      arm64: arch_timer: Ensure counter register reads occur with seqlock held
> 
>      When executing clock_gettime(), either in the vDSO or via a system call,
>      we need to ensure that the read of the counter register occurs within
>      the seqlock reader critical section. This ensures that updates to the
>      clocksource parameters (e.g. the multiplier) are consistent with the
>      counter value and therefore avoids the situation where time appears to
>      go backwards across multiple reads.
> 
>      Extend the vDSO logic so that the seqlock critical section covers the
>      read of the counter register as well as accesses to the data page. Since
>      reads of the counter system registers are not ordered by memory barrier
>      instructions, introduce dependency ordering from the counter read to a
>      subsequent memory access so that the seqlock memory barriers apply to
>      the counter access in both the vDSO and the system call paths.
> 
>      Cc: <stable@vger.kernel.org>
>      Cc: Marc Zyngier <marc.zyngier@arm.com>
>      Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>      Link: https://lore.kernel.org/linux-arm-kernel/alpine.DEB.2.21.1902081950260.1662@nanos.tec.linutronix.de/
>      Reported-by: Thomas Gleixner <tglx@linutronix.de>
>      Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> While we are not aware of such use in Xen, it would be best to add the
> barrier to avoid any suprise.
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
> v1 -> v2:
> 1. Update commit message to refer Linux commit.
> 2. Change u64 to uint64_t
> ---
>   xen/include/asm-arm/time.h | 43 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 5c4529ebb5..6b8fd839dd 100644
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
> +#if defined(CONFIG_ARM_64)
> +#define read_cntpct_enforce_ordering(val) do { \
> +    uint64_t tmp, _val = (val);                \
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

OOI, is there any particular reason to create a new helper?

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

I thought, we agreed to remove the comment. Did I miss anything?

I can fix this one on commit if there is no need for a new revision.

Cheers,

> +    read_cntpct_enforce_ordering(cnt);
> +
> +    return cnt;
> +}
> +
>   /* List of timer's IRQ */
>   enum timer_ppi
>   {
> 

-- 
Julien Grall

