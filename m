Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD97B1B88
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 13:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609529.948653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpds-0002UN-H7; Thu, 28 Sep 2023 11:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609529.948653; Thu, 28 Sep 2023 11:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpds-0002Sb-E4; Thu, 28 Sep 2023 11:57:16 +0000
Received: by outflank-mailman (input) for mailman id 609529;
 Thu, 28 Sep 2023 11:57:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlpdq-0002SS-Vu
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 11:57:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlpdp-00047l-Lo; Thu, 28 Sep 2023 11:57:13 +0000
Received: from [15.248.3.2] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlpdp-0003Am-DT; Thu, 28 Sep 2023 11:57:13 +0000
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
	bh=dqCjwjtHEpYaOq6H0DOZDkxxn7AhxPtK/RcyzrrmEYU=; b=CN88CP7fTEsytQWjjYOJF2m6al
	dN7+Eq8hewAp326wBgMH+fmwQFOVTfIdITqxP7//CYxbe+6L9i1uLQVVCND5ynOhgmrM2ud1JoObf
	CQLyyClPcLkMny0auYvjmRCF3XXDsL7xAn3NVmLJv2aF4kjTMX0V1Wx5yope2d5TdmJM=;
Message-ID: <42527c3c-2c47-4feb-ae96-37c6ac9547a8@xen.org>
Date: Thu, 28 Sep 2023 12:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v1] xen: arm: procinfo.h: Fixed a typo
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com
References: <20230928114835.2592187-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230928114835.2592187-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ayan,

On 28/09/2023 12:48, Ayan Kumar Halder wrote:
> Change VPCU to VCPU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/include/asm/procinfo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
> index 02be56e348..8b8dae3dd4 100644
> --- a/xen/arch/arm/include/asm/procinfo.h
> +++ b/xen/arch/arm/include/asm/procinfo.h
> @@ -24,7 +24,7 @@
>   #include <xen/sched.h>
>   
>   struct processor {
> -    /* Initialize specific processor register for the new VPCU*/
> +    /* Initialize specific processor register for the new VCPU*/

As you are modifying the line, can you also add the missing space before */?

I have also a slight preference for using vCPU over VCPU.

With that addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

