Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FDB7B2D0B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610201.949526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7yN-0000oc-P4; Fri, 29 Sep 2023 07:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610201.949526; Fri, 29 Sep 2023 07:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm7yN-0000lr-MT; Fri, 29 Sep 2023 07:31:39 +0000
Received: by outflank-mailman (input) for mailman id 610201;
 Fri, 29 Sep 2023 07:31:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm7yM-0000ge-Hp
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:31:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm7yL-0007ww-0g; Fri, 29 Sep 2023 07:31:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm7yK-0001Jp-PA; Fri, 29 Sep 2023 07:31:36 +0000
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
	bh=cf3P6Xha10c6eZm5xMgDzFwpFIHGl/8qwjJB+boIC/o=; b=p3MhVSryteqY1a3XfGlycybWLB
	n3WuR3ynucfn3550/0sud70gFPOU73W2f3uYeJlfmZMAFhg0Xc353xoocMGX31UsgtLkGMiaTBLra
	Jy9V0j3xsxRMNaynPcpU/N/U+2WN9KrDPh6dedif3/QlWdiH/I/HtoKtFnp4QzfXD7OA=;
Message-ID: <e5815f93-80a4-4628-9eae-98c431c70dcc@xen.org>
Date: Fri, 29 Sep 2023 08:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpumask: fix integer type in cpumask_first
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, george.dunlap@citrix.com, wl@xen.org
References: <alpine.DEB.2.22.394.2309281629360.1996340@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2309281629360.1996340@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 29/09/2023 00:32, Stefano Stabellini wrote:
> nr_cpu_ids is unsigned int, but find_first_bit returns unsigned long (at
> least on arm).

find_* are meant to be used by common code. So I think the first step is 
to correct the return type so it is consistent across all architectures.

I don't have a strong opinion on whether they should all return 
'unsigned long'.

Then we can discuss if the MISRA rule is still violated.

> Use the larger type for min_t to avoid larger-to-smaller
> type assignments. This address 141 MISRA C 10.3 violations.

I find interesting you are saying this given that...
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> 
> diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
> index 9826707909..a6ed6a28e8 100644
> --- a/xen/include/xen/cpumask.h
> +++ b/xen/include/xen/cpumask.h
> @@ -208,7 +208,7 @@ static inline void cpumask_copy(cpumask_t *dstp, const cpumask_t *srcp)
>   
>   static inline int cpumask_first(const cpumask_t *srcp)
>   {
> -	return min_t(int, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));
> +	return min_t(unsigned long, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));

... cpumask_first() is return 'int'. So rather than fixing it, you seem 
to have just moved the violation.

>   }
>   
>   static inline int cpumask_next(int n, const cpumask_t *srcp)

Cheers,

-- 
Julien Grall

