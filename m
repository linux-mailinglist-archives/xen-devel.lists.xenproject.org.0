Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F563C47D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 17:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449523.706328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p032m-00077M-GS; Tue, 29 Nov 2022 16:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449523.706328; Tue, 29 Nov 2022 16:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p032m-00073u-DO; Tue, 29 Nov 2022 16:01:12 +0000
Received: by outflank-mailman (input) for mailman id 449523;
 Tue, 29 Nov 2022 16:01:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p032k-00073o-U1
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 16:01:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p032k-0002L8-Dg; Tue, 29 Nov 2022 16:01:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p032k-0000I9-72; Tue, 29 Nov 2022 16:01:10 +0000
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
	bh=svQxUMSWfOExL3cPaeMnZg6XEheL7L8GNxXplaBauek=; b=i06g/gdK4Jbqmu9JcouK1zEgk9
	cI3n40wuIaLpULkI9L2WAzFhfbp8aeVKaB0QuUZE1L/lYHGmZrJcaSKKkAiCh6pjg+gDySxRHij2f
	NIeIlqC5kHR/NLwL3s2YfbbQCqe2m9DRjsaYU6UBy0hC6edNZ8DDqVpW3WMdu4BMIcu4=;
Message-ID: <4a93a89a-7d00-491d-766e-fd9a524d96c0@xen.org>
Date: Tue, 29 Nov 2022 16:01:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] Arm64: make setup_virt_paging()'s pa_range_info[] static
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <5a249b00-5467-1733-cab0-fd6d55765e20@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a249b00-5467-1733-cab0-fd6d55765e20@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/11/2022 15:39, Jan Beulich wrote:
> While not as inefficient as it would be on x86 (due to suitable constant
> loading and register pair storing instructions being available to fill
> some of the fields), having the compiler construct an array of constants
> on the stack still looks odd to me.

The function is only called once at boot. So this seems more a 
micro-optimization than anything else.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Actual space savings could be had if further converting the field types
> to e.g. unsigned char (all of the values fit in that type).

This is a micro-optimization. If you want to send it then I will review it.

> 
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2281,12 +2281,12 @@ void __init setup_virt_paging(void)
>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>       val |= VTCR_SL0(0x1); /* P2M starts at first level */
>   #else /* CONFIG_ARM_64 */
> -    const struct {
> +    static const struct {
>           unsigned int pabits; /* Physical Address Size */
>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>           unsigned int root_order; /* Page order of the root of the p2m */
>           unsigned int sl0;    /* Desired SL0, maximum in comment */
> -    } pa_range_info[] = {
> +    } pa_range_info[] __initconst = {
>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>           /*      PA size, t0sz(min), root-order, sl0(max) */
>           [0] = { 32,      32/*32*/,  0,          1 },

-- 
Julien Grall

