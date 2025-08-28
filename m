Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4EB39C61
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098609.1452615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbSt-0000vW-2O; Thu, 28 Aug 2025 12:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098609.1452615; Thu, 28 Aug 2025 12:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbSs-0000sq-VH; Thu, 28 Aug 2025 12:10:50 +0000
Received: by outflank-mailman (input) for mailman id 1098609;
 Thu, 28 Aug 2025 12:10:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1urbSr-0000rb-N3
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:10:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbSq-00AuPg-35;
 Thu, 28 Aug 2025 12:10:49 +0000
Received: from [15.248.2.24] (helo=[10.24.67.148])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1urbSq-005lJn-2k;
 Thu, 28 Aug 2025 12:10:49 +0000
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
	bh=vNuInm1iRMHm4Qfo1IxLpf2Ro3owrA/EYLJyBF7LeKc=; b=v3EQ+16r+hiEiZZwr0PwLtGOpG
	GBamKaseFhn+p0EfzgfR7RxJo0shEX3bog/kNVv8ykRBHaUVi05vz8XQXUPTIdCw3kF50ZPlMFDCB
	v4HRNrrZp1xKI1SjYNCvg+NNcACqXeDsdHNqnhZgn3xf//uksbuXtIB4mfjnrqjbCk1A=;
Message-ID: <1221fa50-0e17-405e-88fe-c57db905fa4a@xen.org>
Date: Thu, 28 Aug 2025 13:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <684757e6710826200bcc153e4c711b27483ee796.1756317702.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <684757e6710826200bcc153e4c711b27483ee796.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 27/08/2025 19:24, Leonid Komarianskyi wrote:
> Introduced two new helper functions: gic_is_valid_line and
> gic_is_spi. The first function helps determine whether an IRQ
> number is less than the number of lines supported by hardware. The
> second function additionally checks if the IRQ number falls within the
> SPI range. Also, updated the appropriate checks to use these new helper
> functions.
> 
> The current checks for the real GIC are very similar to those for the
> vGIC but serve a different purpose. For GIC-related code, the interrupt
> numbers should be validated based on whether the hardware can operate
> with such interrupts. On the other hand, for the vGIC, the indexes must
> also be verified to ensure they are available for a specific domain. The
> first reason for introducing these helper functions is to avoid
> potential confusion with vGIC-related checks. The second reason is to
> consolidate similar code into separate functions, which can be more
> easily extended by additional conditions, e.g., when implementing
> extended SPI interrupts.
> 
> The changes, which replace open-coded checks with the use of the new
> helper functions, do not introduce any functional changes, as the helper
> functions follow the current IRQ index verification logic.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes in V4:
> - removed redundant parentheses
> - added reviewed-by from Volodymyr Babchuk
> 
> Changes in V3:
> - renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
>    gic_is_spi
> - updated commit message
> 
> Changes in V2:
> - introduced this patch
> 
> Changes for V4:
> 
> Changes in V4:
> - removed redundant parentheses
> - added reviewed-by from Volodymyr Babchuk
> ---
>   xen/arch/arm/gic.c             | 2 +-
>   xen/arch/arm/include/asm/gic.h | 9 +++++++++
>   xen/arch/arm/irq.c             | 2 +-
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..9220eef6ea 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -111,7 +111,7 @@ static void gic_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>   void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>   {
>       ASSERT(priority <= 0xff);     /* Only 8 bits of priority */
> -    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that don't exist */
> +    ASSERT(gic_is_valid_line(desc->irq));/* Can't route interrupts that don't exist */

As you are touching the line. It is over 80 characters. Can you move the 
command in a separate line?

>       ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>       ASSERT(spin_is_locked(&desc->lock));

Cheers,

-- 
Julien Grall


