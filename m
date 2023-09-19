Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14C7A62BE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 14:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604655.942141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiZk1-0007ZM-R6; Tue, 19 Sep 2023 12:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604655.942141; Tue, 19 Sep 2023 12:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiZk1-0007XQ-ON; Tue, 19 Sep 2023 12:22:09 +0000
Received: by outflank-mailman (input) for mailman id 604655;
 Tue, 19 Sep 2023 12:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiZk0-0007XK-Gt
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 12:22:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiZjz-0001ss-Py; Tue, 19 Sep 2023 12:22:07 +0000
Received: from [15.248.3.4] (helo=[10.24.67.44])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiZjz-0001OF-KR; Tue, 19 Sep 2023 12:22:07 +0000
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
	bh=+HlKPrfN3dbsX+xf8n0wkj+YoqETofBM6Hah/AwTfy0=; b=NxNFUVCEMw47ilaKB5Y5T0lFSz
	OyGUnLTJ86SGdDNHBnqVBuMPKLfZb7YrHMHDcwUt5AA59IRdNESrz1aF4xkpncdY/LLolONYG6k9f
	9Xz5QUytXrfH3AzQvAFMmeIaGsOixsxDSIxVrr4J6TPXUp+qYpy7kY/KVqL1GgsLIyHo=;
Message-ID: <613dc688-0336-4f9e-b0e8-db67e3987a74@xen.org>
Date: Tue, 19 Sep 2023 13:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ARM: GICv3 ITS: issue INVALL command after mapping
 host events
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230919112827.1001484-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 19/09/2023 12:28, Volodymyr Babchuk wrote:
> Implement TODO by calling the INVALL command.

I think the TODO was meant to be an optimization because AFAICT we are 
already sending an INV command per event.

>  It is working on real
> HW, so there is no sense in not doing this.

A patch should be justified based from the spec or an errata. Not that 
fact it works on a real HW. At the moment, I don't quite understand why 
you need one because as said above, we are technically already sending 
an INV per event so we should be covered.

Removing the INV and using INVALL would make sense as an optimization. 
Yet given the current code doesn't seem to work, I would like to 
understand what's the problem of using INV.

> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/gic-v3-its.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 3aa4edda10..a9c971a55f 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -236,6 +236,19 @@ static int its_send_cmd_inv(struct host_its *its,
>       return its_send_command(its, cmd);
>   }
>   
> +static int its_send_cmd_invall(struct host_its *its,
> +                               uint32_t collection_id)
> +{
> +    uint64_t cmd[4];
> +
> +    cmd[0] = GITS_CMD_INVALL;
> +    cmd[1] = 0x00;
> +    cmd[2] = collection_id;
> +    cmd[3] = 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
>   /* Set up the (1:1) collection mapping for the given host CPU. */
>   int gicv3_its_setup_collection(unsigned int cpu)
>   {
> @@ -593,7 +606,9 @@ static int gicv3_its_map_host_events(struct host_its *its,
>               return ret;
>       }
>   
> -    /* TODO: Consider using INVALL here. Didn't work on the model, though. */
> +    ret = its_send_cmd_invall(its, 0);
> +    if ( ret )
> +        return ret;
>   
>       ret = its_send_cmd_sync(its, 0);
>       if ( ret )

Cheers,

-- 
Julien Grall

