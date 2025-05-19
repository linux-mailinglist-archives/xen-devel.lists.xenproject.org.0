Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB76ABCAD7
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 00:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990340.1374309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8vq-0004yh-Qs; Mon, 19 May 2025 22:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990340.1374309; Mon, 19 May 2025 22:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8vq-0004va-O9; Mon, 19 May 2025 22:26:02 +0000
Received: by outflank-mailman (input) for mailman id 990340;
 Mon, 19 May 2025 22:26:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uH8vp-0004vU-5V
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 22:26:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uH8vo-001YaW-2D;
 Mon, 19 May 2025 22:26:00 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.106.212])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uH8vo-004D9c-0i;
 Mon, 19 May 2025 22:26:00 +0000
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
	bh=woruLJD2LWnopL5cJma92FZxj8lRihr/XJ7GhMIFMH8=; b=o8DhymMYr94PviBwNhsRTK8eZ5
	iriyjJauJUG1DS4dEuL8yPSfAfDZ2EU5uPJidB0zw8LO3tp97Sa7R5i87jdrCsta6uoz4xgldJugC
	oy81X1lLsXQMmYL08ZObky8mRZpOUsqGNEQsSpgPqP78iZ6GDnUkAgaixhnFlaPrQozw=;
Message-ID: <806f37b3-118f-4f13-9738-b27de24dff7d@xen.org>
Date: Mon, 19 May 2025 23:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/arm: add inclusion guards
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, jbeulich@suse.com,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-1-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250516232130.835779-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/05/2025 00:21, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Directive 4.10 states that:
> "Precautions shall be taken in order to prevent the contents of a
> header file being included more than once".
> 
> Add inclusion guards where missing to address violations of the
> guideline.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/efi/efi-boot.h        | 6 ++++++
>   xen/arch/arm/include/asm/efibind.h | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index dcad46ca72..d2a09ad3a1 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h

I always found weird that this file is treated as a header when in fact 
this is just a disguised source file. So in some way...

> @@ -3,6 +3,10 @@
>    * is intended to be included by common/efi/boot.c _only_, and
>    * therefore can define arch specific global variables.
>    */
> +
> +#ifndef ARM_EFI_BOOT_H
> +#define ARM_EFI_BOOT_H

... without the header guard, we could catch two inclusions of 
efi-boot.h. I would consider to use:

#ifdef ARM_EFI_BOOT_H
# error ...
#else
# define ...

#endif ...

Cheers,

-- 
Julien Grall


