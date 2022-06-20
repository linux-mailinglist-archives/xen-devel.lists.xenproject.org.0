Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94B5514F5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352681.579521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E7a-0000ji-Fe; Mon, 20 Jun 2022 09:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352681.579521; Mon, 20 Jun 2022 09:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E7a-0000gi-Br; Mon, 20 Jun 2022 09:55:02 +0000
Received: by outflank-mailman (input) for mailman id 352681;
 Mon, 20 Jun 2022 09:55:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3E7Y-0000gc-Ne
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:55:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E7X-0000s1-UI; Mon, 20 Jun 2022 09:54:59 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.1.39])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E7X-0000n6-OK; Mon, 20 Jun 2022 09:54:59 +0000
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
	bh=EACjZ5nszWO2S7RNDVIetvYM8dzOo869XQxUcB9sUPg=; b=NcPscIHZBA+5KplLEy6it8wjuQ
	YBye6Of/hZoTSZFfqAGWE9LcucXX/k0EaMzBtW7du6Yjzyav554dpR8VIJorPa60vubRPHcB5a3v2
	RK8cV86eeIh/ht/7QGF8Sva+GxFoix78niJ2+6uRghMQRFuvPayH25lhMBexZ20xPxwQ=;
Message-ID: <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
Date: Mon, 20 Jun 2022 10:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620070245.77979-6-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/06/2022 08:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Bump sysctl interface version.

The sysctl version should only be bumped if the ABI has changed. AFAICT 
switching from "unsigned" to "unsigned" will not modify it, so I don't 
think this is necessary.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/include/public/physdev.h |  4 ++--
>   xen/include/public/sysctl.h  | 10 +++++-----
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
> index d271766ad0..a2ca0ee564 100644
> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -211,8 +211,8 @@ struct physdev_manage_pci_ext {
>       /* IN */
>       uint8_t bus;
>       uint8_t devfn;
> -    unsigned is_extfn;
> -    unsigned is_virtfn;
> +    unsigned int is_extfn;
> +    unsigned int is_virtfn;
>       struct {
>           uint8_t bus;
>           uint8_t devfn;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index b0a4af8789..a2a762fe46 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>   #include "domctl.h"
>   #include "physdev.h"
>   
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
>   
>   /*
>    * Read console content from Xen buffer ring.
> @@ -644,18 +644,18 @@ struct xen_sysctl_credit_schedule {
>       /* Length of timeslice in milliseconds */
>   #define XEN_SYSCTL_CSCHED_TSLICE_MAX 1000
>   #define XEN_SYSCTL_CSCHED_TSLICE_MIN 1
> -    unsigned tslice_ms;
> -    unsigned ratelimit_us;
> +    unsigned int tslice_ms;
> +    unsigned int ratelimit_us;
>       /*
>        * How long we consider a vCPU to be cache-hot on the
>        * CPU where it has run (max 100ms, in microseconds)
>       */
>   #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
> -    unsigned vcpu_migr_delay_us;
> +    unsigned int vcpu_migr_delay_us;
>   };
>   
>   struct xen_sysctl_credit2_schedule {
> -    unsigned ratelimit_us;
> +    unsigned int ratelimit_us;
>   };
>   
>   /* XEN_SYSCTL_scheduler_op */

Cheers,

-- 
Julien Grall

