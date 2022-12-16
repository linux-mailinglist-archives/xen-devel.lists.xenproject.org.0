Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E464E8BE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464303.722653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67Db-00011v-1y; Fri, 16 Dec 2022 09:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464303.722653; Fri, 16 Dec 2022 09:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67Da-0000zw-VG; Fri, 16 Dec 2022 09:41:26 +0000
Received: by outflank-mailman (input) for mailman id 464303;
 Fri, 16 Dec 2022 09:41:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p67DY-0000zq-Op
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:41:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67DY-0007Em-FN; Fri, 16 Dec 2022 09:41:24 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67DY-00089j-9O; Fri, 16 Dec 2022 09:41:24 +0000
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
	bh=d2tqAPzQt4IeVkRxaZPwK3RfYYRUMLSu7UrT8jpRXrQ=; b=KCAIsiLP15Ype749l+AceJiJh6
	0rq43LAZ40LYTyHfACerUi4xbwnKLbo0N4qbWWmVmlOF41RYi2qFb+RHEdRnL2NYWWaOFq+JD8zd0
	NJhGxPtFLsINQ0AwBHz5lOJrxDT674VnPUSU6k8e3FPAfJoLfZ8ACUJv/81HCOtqnLAM=;
Message-ID: <82edd7ec-b275-b15c-1889-88de154b3134@xen.org>
Date: Fri, 16 Dec 2022 09:41:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 1/9] xen/arm: Remove the extra assignment
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In the previous version, I have suggested the following title:

xen/ns16550: Remove unneeded truncation check in the DT init code

This would also address Jan's comment.

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> As "io_size" and "uart->io_size" are both u64, so there will be no truncation.
> Thus, one can remove the ASSERT() and extra assignment.
> 
> In an earlier commit (7c1de0038895),

Why is this line shorter than the others?

> "ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() was needed
> to check if the values are the same.
> However, in a later commit (c9f8e0aee507),
> "ns16550.io_size" was changed to u64. Thus, the ASSERT() became redundant.

You missed my comment here:

"Those two paragraphs are explaining why the truncation check is 
removed. So I think they should be moved first. Then you can add the 
initial paragraph to explain the resolution".

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
>   xen/drivers/char/ns16550.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index 01a05c9aa8..58d0ccd889 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1747,7 +1747,6 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>       struct ns16550 *uart;
>       int res;
>       u32 reg_shift, reg_width;
> -    u64 io_size;
>   
>       uart = &ns16550_com[0];
>   
> @@ -1758,14 +1757,10 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>       uart->parity    = UART_PARITY_NONE;
>       uart->stop_bits = 1;
>   
> -    res = dt_device_get_address(dev, 0, &uart->io_base, &io_size);
> +    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
>       if ( res )
>           return res;
>   
> -    uart->io_size = io_size;
> -
> -    ASSERT(uart->io_size == io_size); /* Detect truncation */
> -
>       res = dt_property_read_u32(dev, "reg-shift", &reg_shift);
>       if ( !res )
>           uart->reg_shift = 0;

Cheers,

-- 
Julien Grall

