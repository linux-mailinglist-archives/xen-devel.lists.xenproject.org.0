Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688C5679D2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 00:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361639.591256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qby-0001sb-9g; Tue, 05 Jul 2022 22:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361639.591256; Tue, 05 Jul 2022 22:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qby-0001qS-6X; Tue, 05 Jul 2022 22:01:38 +0000
Received: by outflank-mailman (input) for mailman id 361639;
 Tue, 05 Jul 2022 22:01:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qbw-0001qM-M2
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 22:01:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qbw-0006fW-4G; Tue, 05 Jul 2022 22:01:36 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qbv-00088q-Ux; Tue, 05 Jul 2022 22:01:36 +0000
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
	bh=1ZABEC9njBC5aai4/GIav7Ak4LagUmq/AVgkeQZvHKE=; b=aZ0M/ryouasMZQWW2DRnryJ5SN
	pK8V3Sn1QDPHJFTxw8tuipyx1BVLV/wEoJhEfNHqSPlFtk0qrXE0o3yqmhuaXkZeLWG1qF5tlpMmj
	eFRGgcROiqPVOodoeeT6uwpcb6djnMz76OV2xxEHLatpkj4gfXA3j+WgFFMcTJGA5epU=;
Message-ID: <bc0c9bcb-9781-6cf5-1189-c29c5cc89b09@xen.org>
Date: Tue, 5 Jul 2022 23:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220705122114.419634-1-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220705122114.419634-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 05/07/2022 13:21, Xenia Ragiadakou wrote:
> Add the function prototype of show_stack() in <asm/processor.h> header file
> so that it is visible before its definition in traps.c.
> 
> Although show_stack() is referenced only in traps.c, it is declared with
> external linkage because, during development, it is often called also by
> other files for debugging purposes. Declaring it static would increase
> development effort. Add appropriate comment
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

With one request below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/include/asm/processor.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 4188ec6bfb..c021160412 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -558,7 +558,9 @@ extern register_t __cpu_logical_map[];
>   void panic_PAR(uint64_t par);
>   
>   void show_execution_state(const struct cpu_user_regs *regs);
> +/* Debugging functions are declared with external linkage to aid development. */

I agree that those functions are only used for debugging today. But 
there are no reason they can't be used in code in the future.
So I would like this comment to be dropped because it could easily 
become stale.

If the others argue for keeping it, then I think...

>   void show_registers(const struct cpu_user_regs *regs);
> +void show_stack(const struct cpu_user_regs *regs);

... we need a newline here so it is clearer which set of functions you 
are referring to (at the moment one may think that 
dump_execution_state()) is also included.

>   //#define dump_execution_state() run_in_exception_handler(show_execution_state)
>   #define dump_execution_state() WARN()
>   

Cheers,

-- 
Julien Grall

