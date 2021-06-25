Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C93B3CCB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 08:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147053.270790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfYF-0002yr-IV; Fri, 25 Jun 2021 06:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147053.270790; Fri, 25 Jun 2021 06:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwfYF-0002vT-Em; Fri, 25 Jun 2021 06:42:55 +0000
Received: by outflank-mailman (input) for mailman id 147053;
 Fri, 25 Jun 2021 06:42:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwfYE-0002vN-P0
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 06:42:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwfYE-0004Di-Hs; Fri, 25 Jun 2021 06:42:54 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwfYE-0005Mz-A7; Fri, 25 Jun 2021 06:42:54 +0000
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
	bh=BC3HwrowlnMRI5KWlGcyY94VD2SmNqiuRgOC2C/HonI=; b=xjA1Qv1OU9vt7RGWjBgaRgzAq6
	mey5IRsEwsfo/+OKx+4QejxFz0d76ukdNvNddmdyXLef4q2VOvbEwj0tYmGCx8ppJAGS9IhFC3rpK
	iXwqVeNiTfbywME6mHzqtxAbXA0uiPXvISARj8qNSg+WlVWAX6GghTrNiN7mYGtQ1Pak=;
Subject: Re: [PATCH] xen/arm: add forward_smc command line option for
 debugging
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b5ba0757-322f-a77a-2293-111b77b29d35@xen.org>
Date: Fri, 25 Jun 2021 08:42:51 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 25/06/2021 02:51, Stefano Stabellini wrote:
> It has become clear that an option to disable trapping SMC calls to Xen
> is very useful for debugging user issues.
 >
> Instead of having to provide a
> patch to users every time, it would be great if we could just tell them
> to add forward_smc=true to the Xen command line.

I can understand this woud be useful to go a bit further in dom0 boot. 
But I am quite sceptical on the idea of providing an option directly in 
Xen because:

1) This breaks other SMC uses in Xen (optee, VM monitor...)
2) There are no guarantee that the SMC call will not wreck Xen. To be 
clear, I don't refer to a malicious OS here, but a normal OS that boot
3) Very likely the next steps for the user (or better call it the 
developper because that option should really not be used by a normal 
user) will be to decide whether they should modify the kernel or 
implement a mediator in Xen.

> This option is obviously unsafe and unsecure and only meant for
> debugging. Make clear in the description that if you pass
> forward_smc=true then the system is not security supported.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 3ece83a427..0833fe80fc 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2501,6 +2501,16 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
>   suboptimal scheduling decisions, but only when the system is
>   oversubscribed (i.e., in total there are more vCPUs than pCPUs).
>   
> +### forward_smc (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +If enabled, instead of trapping firmware SMC calls to Xen, allow SMC
> +calls from VMs directly to the firmware. This option is UNSAFE and it is
> +only meant for debugging. Systems with forward_smc=true are not security
> +supported.
> +
>   ### watchdog (x86)
>   > `= force | <boolean>`
>   
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index e7384381cc..0580ac5762 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -95,11 +95,15 @@ static int __init parse_vwfi(const char *s)
>   }
>   custom_param("vwfi", parse_vwfi);
>   
> +static bool forward_smc = false;
> +boolean_param("forward_smc", forward_smc);
> +
>   register_t get_default_hcr_flags(void)
>   {
>       return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
>                (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
> -             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> +             (forward_smc ? 0 : HCR_TSC) |
> +             HCR_TID3|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);

A system wide option to turn off SMC trapping is a no-go because this 
would only be usable for debugging dom0 and not a guest.

So at the minimum this should be a per-domain option. Also, I think we 
still want to integrate with the rest of the SMC users. So Xen should 
still trap the SMC and the forward should happen in vsmccc_handle_call().

This would cover my first point. For the second and third point, I still 
like to understand how this is going to help the developer to fully port 
the board/OS to Xen with this option disabled?

Cheers,

-- 
Julien Grall

