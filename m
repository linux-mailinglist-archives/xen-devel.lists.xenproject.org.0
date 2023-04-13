Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6186E162B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 22:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520971.809169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn40C-0000kr-46; Thu, 13 Apr 2023 20:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520971.809169; Thu, 13 Apr 2023 20:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn40C-0000iR-0y; Thu, 13 Apr 2023 20:57:08 +0000
Received: by outflank-mailman (input) for mailman id 520971;
 Thu, 13 Apr 2023 20:57:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn409-0000iH-Vf
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 20:57:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn409-0005c3-Jv; Thu, 13 Apr 2023 20:57:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn409-0006AB-E1; Thu, 13 Apr 2023 20:57:05 +0000
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
	bh=/JVyhFgWOemJ/AtWKESvxq6p/h54T4vD7UzVanZl1Qs=; b=aM0jXWcfgUMfqUhSB3ANVS/cvF
	Ilm+D9VQ4Q7hgcbZGEjNwLiQe9CSncvP1bk2FwW/bDvJ7LuV5gymFowHSn1EXZsckZWMwgMkZoffR
	rXXHMy4S85y/zrajzXv235WlSaKMOoml+2q3pIsk+Vd8Mnegz0XWwKzSul73m3keJlTM=;
Message-ID: <c2ef841e-fe3a-a283-2c83-225e02d588d2@xen.org>
Date: Thu, 13 Apr 2023 21:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-22-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230413071424.3273490-22-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 13/04/2023 08:14, Jens Wiklander wrote:
> Adds a comments with a list of unsupported FF-A interfaces and
> limitations in the implemented FF-A interfaces.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   xen/arch/arm/tee/ffa.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0948cc636871..6424c222c885 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -13,6 +13,38 @@
>    *                https://developer.arm.com/documentation/den0077/e
>    * TEEC-1.0C: TEE Client API Specification version 1.0c available at
>    *            https://globalplatform.org/specs-library/tee-client-api-specification/
> + *
> + * Notes on the the current implementstion.
> + *
> + * Unsupported FF-A interfaces:
> + * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
> + * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
> + * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
> + *   or access of a memory readion
> + * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
> + * o FFA_MSG_YIELD
> + * o FFA_INTERRUPT - Used to report preemption
> + * o FFA_RUN
> + *
> + * Limitations in the implemented FF-A interfaces:
> + * o FFA_RXTX_MAP_*:
> + *   - Maps at most 32 4k pages large RX and TX buffers
> + *   - RT/TX buffers must be normal RAM

Can you explain why this is a problem?

> + *   - Doesn't support forwarding this call on behalf of an endpoint
> + * o FFA_MEM_SHARE_*: only supports sharing
> + *   - from a VM to an SP
> + *   - with one borrower
> + *   - with the memory transaction descriptor in the RX/TX buffer
> + *   - normal memory
> + *   - at most 512 kB large memory regions
> + *   - at most 32 shared memory regions per guest
> + * o FFA_MSG_SEND_DIRECT_REQ:
> + *   - only supported from a VM to an SP
> + *
> + * There are some large locked sections with ffa_tx_buffer_lock and
> + * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> + * around share_shm() is a very large locked section which can let one VM
> + * affect another VM.
>    */
>   
>   #include <xen/bitops.h>

Cheers,

-- 
Julien Grall

