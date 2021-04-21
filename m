Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B310366F9E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 18:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114881.219020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFHw-00006r-I2; Wed, 21 Apr 2021 16:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114881.219020; Wed, 21 Apr 2021 16:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZFHw-00006U-E0; Wed, 21 Apr 2021 16:01:16 +0000
Received: by outflank-mailman (input) for mailman id 114881;
 Wed, 21 Apr 2021 16:01:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZFHu-00006P-Kj
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 16:01:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZFHt-0003Sm-IJ; Wed, 21 Apr 2021 16:01:13 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZFHt-0004j4-Ao; Wed, 21 Apr 2021 16:01:13 +0000
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
	bh=EPgZvzfKablW+4qSusQxEHmnHR6eBF3jPK4qYnAZ9dw=; b=udhsbI2OC43rGzI9ssWHDHmkTe
	AwLhvxmSAczO/yvnVX/bNvpsAUn4xqNMuwjtxS1DyGnGbCJO5mamQTvD469GYJwxYKCYfe+Lf3jWD
	YH+aT7e+ePdlN2p2dVBo8G2JnnP60sZjUfjP64Tx2YtWsFmKLF+WTlFVdfRdvs+zjm4U=;
Subject: Re: [PATCH 7/9] arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-8-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1f4788b6-d74a-f5e7-1bb0-5c25c126f171@xen.org>
Date: Wed, 21 Apr 2021 17:01:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify type of vtimer structure's member: ctl to register_t.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/time.c          | 28 ++++++++++++++--------------
>   xen/arch/arm/vtimer.c        | 10 +++++-----
>   xen/include/asm-arm/domain.h |  2 +-
>   3 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index b0021c2c69..e6c96eb90c 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -145,7 +145,7 @@ void __init preinit_xen_time(void)
>           preinit_acpi_xen_time();
>   
>       if ( !cpu_khz )
> -        cpu_khz = READ_SYSREG32(CNTFRQ_EL0) / 1000;
> +        cpu_khz = (unsigned long)(READ_SYSREG(CNTFRQ_EL0) / 1000);

 From the Arm Arm (DDI 0486 F.c), only the lower 32-bit represents the 
clock frequency. The rest are RES0 (IOW can have a different meaning in 
the future). So I think you want to mask it.

>   
>   static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, bool read)
> @@ -347,7 +347,7 @@ bool vtimer_emulate(struct cpu_user_regs *regs, union hsr hsr)
>   }
>   
>   static void vtimer_update_irq(struct vcpu *v, struct vtimer *vtimer,
> -                              uint32_t vtimer_ctl)
> +                              register_t vtimer_ctl)
>   {
>       bool level;
>   
> @@ -389,7 +389,7 @@ void vtimer_update_irqs(struct vcpu *v)
>        * but this requires reworking the arch timer to implement this.
>        */
>       vtimer_update_irq(v, &v->arch.virt_timer,
> -                      READ_SYSREG32(CNTV_CTL_EL0) & ~CNTx_CTL_MASK);
> +                      READ_SYSREG(CNTV_CTL_EL0) & ~CNTx_CTL_MASK);

AFAICT, CNTx_CTL_MASK is an unsigned int. This will not only mask IMASK 
but also the bits 32-63 for Armv8.

So I think you want to switch CTNx_CTL_MASK to return an unsigned long 
and explain it in the commit message.

Cheers,

-- 
Julien Grall

