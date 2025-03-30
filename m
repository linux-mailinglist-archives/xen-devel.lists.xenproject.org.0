Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA9A75D12
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 00:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931833.1334017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0pQ-0005Uo-NO; Sun, 30 Mar 2025 22:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931833.1334017; Sun, 30 Mar 2025 22:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz0pQ-0005T5-KF; Sun, 30 Mar 2025 22:08:28 +0000
Received: by outflank-mailman (input) for mailman id 931833;
 Sun, 30 Mar 2025 22:08:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tz0pP-0005Sz-8E
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 22:08:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0pO-000Wo1-21;
 Sun, 30 Mar 2025 22:08:26 +0000
Received: from [2a02:8012:3a1:0:51d5:4bad:16b9:5cff]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tz0pO-00AX2r-1J;
 Sun, 30 Mar 2025 22:08:26 +0000
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
	bh=5ApVMM7/7eXOCKmkZLdnTIgDIMf4d5sJTEufyKzl6sk=; b=bhDqpv0f99mtywnfoAqm8aEZU6
	8zl409mGOSjxff+2dHgXlWUEM8C+ak5ShmIaBcKpPTW13FGjlf5USssABnm42OvTDvcHBgZEWev1D
	RwauGUaUDAlkYtQNS+OlID6FYeHJHztBrEyjsBsk/Ie4M1ozH5jErnPMQDTSY50HzXZE=;
Message-ID: <bfe213a6-9dd8-4ac9-9552-46090517e224@xen.org>
Date: Sun, 30 Mar 2025 23:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 2/2] xen/arm: check read handler behavior
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
 <20250325172727.600716-3-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250325172727.600716-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steward,

On 25/03/2025 17:27, Stewart Hildebrand wrote:
> We expect mmio read handlers to leave the bits above the access size
> zeroed. Add an ASSERT to check this aspect of read handler behavior.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

With one question below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v17->v18:
> * no change
> 
> v16->v17:
> * new patch
> 
> See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/
> 
> Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")
> 
> Also see xen/arch/arm/ioreq.c:handle_ioserv()
> ---
>   xen/arch/arm/io.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 653428e16c1f..68b5dca70026 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>       if ( !handler->ops->read(v, info, &r, handler->priv) )
>           return IO_ABORT;
>   
> +    ASSERT((r & ~GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0)) == 0);

OOI, I was expecing GENMASK to be sufficient because "r" is effectively 
an "unsigned long". So any reason to use GENMASK_ULL?

Cheers,

-- 
Julien Grall


