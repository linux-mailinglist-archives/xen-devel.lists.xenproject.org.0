Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41508ADDD4D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 22:38:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018517.1395400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd4U-0006Nl-Jt; Tue, 17 Jun 2025 20:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018517.1395400; Tue, 17 Jun 2025 20:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRd4U-0006LU-GW; Tue, 17 Jun 2025 20:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1018517;
 Tue, 17 Jun 2025 20:38:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uRd4S-0006LO-Jj
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 20:38:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRd4S-006MSj-0k;
 Tue, 17 Jun 2025 20:38:16 +0000
Received: from [2a02:8012:3a1:0:e9a3:882d:7e0:8b9]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRd4S-008qNI-0G;
 Tue, 17 Jun 2025 20:38:16 +0000
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
	bh=1cARaKhBjDmYXDKwyZtM+IVdgNvnTgjM3ZgkmDc2aTY=; b=uvCYoZ/ItubvCLSZYPogx0+1w8
	Ps6SzAKSHVDGE/xic+V/TeBYKyDdW8f7MifO3D+rNAKuB4435kGPn75UwM07/X/RnNutj7B7fXlHv
	s7VfGbI7yurWGYYh/qgIgBSBM9O78vWyimo2LB1ulTYf0/CYSBT4a2pdpl2agw+qrtIM=;
Message-ID: <4ee07b7b-9c75-4e19-8594-803b9edec5d7@xen.org>
Date: Tue, 17 Jun 2025 21:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
Content-Language: en-GB
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250617171358.670642-1-agarciav@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250617171358.670642-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

Sorry I didn't see there was a v2.

On 17/06/2025 18:13, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
> 
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v2:
>    * Added missing `break` on the `case 2:` branch and added ASSERT_UNREACHABLE() to the deafult path
> ---
>   xen/include/xen/device_tree.h | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..2ec668b94a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
>   /* Helper to read a big number; size is in cells (not bytes) */
>   static inline u64 dt_read_number(const __be32 *cell, int size)
>   {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +        break;
> +    default:
> +        // Nonsensical size. default to 1.
> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size\n", size);

I think this needs to at least be a XENLOG_ERR.

Cheers,

-- 
Julien Grall


