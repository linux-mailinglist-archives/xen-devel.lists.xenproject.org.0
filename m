Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CC6E15E6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 22:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520963.809149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3do-00069N-1q; Thu, 13 Apr 2023 20:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520963.809149; Thu, 13 Apr 2023 20:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3dn-00066p-Ue; Thu, 13 Apr 2023 20:33:59 +0000
Received: by outflank-mailman (input) for mailman id 520963;
 Thu, 13 Apr 2023 20:33:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn3dm-00066h-S5
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 20:33:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3dm-0005Df-HR; Thu, 13 Apr 2023 20:33:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3dm-0005NF-CG; Thu, 13 Apr 2023 20:33:58 +0000
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
	bh=gB/jvbSDlfA0EMEcuLtzZFuh9OajfqJtkl3CYchv2yE=; b=S93GEsCUK1g3QR+3J7My1mZNw8
	Hqnj7mxAfragLCTnGmsuFuneY6hMKSWkdK5HPPPKgDTjg2f8zuG4JtK/ZvNMpOXNgd2eeFa+Tt7Nm
	rEjRX3Ud/7LYW/JEsn456EYUsFosilEldQoAzdQnQM3NY4OxNbFQmrs1GPJMxuO+4Jdg=;
Message-ID: <86b582a9-861c-7d8f-beeb-3469ea7948be@xen.org>
Date: Thu, 13 Apr 2023 21:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v8 13/22] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-14-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230413071424.3273490-14-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 13/04/2023 08:14, Jens Wiklander wrote:
> Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
> from a guest. The requests are forwarded to the SPMC and the response is
> translated according to the FF-A version in use by the guest.
> 
> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> caller (the guest in this case), so once it is done with the buffer it
> must be released using FFA_RX_RELEASE before another call can be made.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   xen/arch/arm/tee/ffa.c | 137 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 134 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 127397d8e448..74b8c517afb8 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -166,7 +166,18 @@
>   #define FFA_MSG_SEND                    0x8400006EU
>   #define FFA_MSG_POLL                    0x8400006AU
>   
> +/*
> + * Structs below ending with _1_0 are defined in FF-A-1.0-REL and
> + * struct ending with _1_1 are defined in FF-A-1.1-REL0.
> + */
> +
>   /* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
>   struct ffa_partition_info_1_1 {
>       uint16_t id;
>       uint16_t execution_context;
> @@ -183,7 +194,8 @@ struct ffa_ctx {
>       unsigned int page_count;
>       /* FF-A version used by the guest */
>       uint32_t guest_vers;
> -    bool tx_is_free;
> +    bool rx_is_free;

I am a bit confused why this is renamed. Did you introduce tx_is_free by 
mistake? If not, can you name the field correctly from when it is 
introduced?

Cheers,

-- 
Julien Grall

