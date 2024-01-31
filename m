Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B088843F6C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674016.1048669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9j6-0004ru-6K; Wed, 31 Jan 2024 12:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674016.1048669; Wed, 31 Jan 2024 12:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9j6-0004pu-3j; Wed, 31 Jan 2024 12:30:00 +0000
Received: by outflank-mailman (input) for mailman id 674016;
 Wed, 31 Jan 2024 12:29:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rV9j4-0004oU-I2
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:29:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV9iy-0004fz-Hd; Wed, 31 Jan 2024 12:29:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rV9iy-0004EH-9q; Wed, 31 Jan 2024 12:29:52 +0000
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
	bh=Pqsq+F6BtqshjlmZpexArMn64gGrl9JSDX8n/8YyMiQ=; b=2QLWK999Pt/PkT7rdha0PaI8oW
	QdgC21KmpMgFcSGNNn42EJZM69p89lNeiBu5hwxl/F3Gv0jWmjJEoLOpSWAEggSRAR1hawWVfuaLY
	EyvimbVeOV+Yoaxn6quw1S5l93FeBzmDmzd3QYIP6qDs2ULf/RCEeDhZxa8CNBrABDac=;
Message-ID: <04bd90d9-4cfd-4f76-a2fc-26a432b4c1c9@xen.org>
Date: Wed, 31 Jan 2024 12:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/drivers: imx-lpuart: Add iMX8QXP compatible
Content-Language: en-GB
To: John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-3-john.ernberg@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240131114952.305805-3-john.ernberg@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

On 31/01/2024 11:50, John Ernberg wrote:
> Allow the uart to probe also with iMX8QXP. The ip-block is the same as in the QM,
> only the compatible is needed.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/drivers/char/imx-lpuart.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
> index 77f70c2719..c85e81109a 100644
> --- a/xen/drivers/char/imx-lpuart.c
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -257,6 +257,7 @@ static int __init imx_lpuart_init(struct dt_device_node *dev,
>   static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
>   {
>       DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> +    DT_MATCH_COMPATIBLE("fsl,imx8qxp-lpuart"),

IIUC the binding, the Device-Tree node compatible should have both 
fsl,imx8qm-lpuart and fsl,imx8qxp-lpuart. In fact, the Linux driver 
doesn't recognize the first compatible.

So maybe we can remove the first one.

Cheers,

-- 
Julien Grall

