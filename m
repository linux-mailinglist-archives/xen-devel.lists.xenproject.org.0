Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37764EF92F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 19:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297540.506911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLT5-0000c0-0z; Fri, 01 Apr 2022 17:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297540.506911; Fri, 01 Apr 2022 17:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLT4-0000Z5-T3; Fri, 01 Apr 2022 17:53:50 +0000
Received: by outflank-mailman (input) for mailman id 297540;
 Fri, 01 Apr 2022 17:53:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLT3-0000Yt-N1
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 17:53:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLT3-0002c7-54; Fri, 01 Apr 2022 17:53:49 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLT2-0000xm-VK; Fri, 01 Apr 2022 17:53:49 +0000
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
	bh=Ie227fd6xRK/vVc6esJrm0lhmboy1+LECiAuDAW1Wwk=; b=1q1IcX+W+s1ot3MaalXQxTja9Q
	LuxeFkfeou5G8jxl7tQdJljNS4sjtn19ojuWglbPvCMHP8JgvJHSv3em8ftLXFDcildzBYwfNroTH
	mKbqAG08/GsE03Vcf6/e39nyRFZL7500iPNwd1MZ+A0e1jVKer/tjeb9wrPApKIN0GH4=;
Message-ID: <5c26e68b-8737-5f1c-9a03-c388a3d6e943@xen.org>
Date: Fri, 1 Apr 2022 18:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220330230549.26074-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 31/03/2022 00:05, Daniel P. Smith wrote:
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protected by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit introduces a pair
> of privilege escalation and demotion functions that will make a system domain
> privileged and then remove that privilege.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index e22d6160b5..157e57151e 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -189,6 +189,28 @@ struct xsm_operations {
>   #endif
>   };
>   
> +static always_inline int xsm_elevate_priv(struct domain *d)
> +{
> +    if ( is_system_domain(d) )
> +    {
> +        d->is_privileged = true;

The call for xsm_elevate_priv() cannot be nested. So I would suggest to 
check if d->is_privileged is already true and return -EBUSY in this case.

> +        return 0;
> +    }
> +
> +    return -EPERM;
> +}
> +
> +static always_inline int xsm_demote_priv(struct domain *d)
> +{
> +    if ( is_system_domain(d) )
> +    {
> +        d->is_privileged = false;
> +        return 0;
> +    }
> +
> +    return -EPERM;
> +}
> +
>   #ifdef CONFIG_XSM
>   
>   extern struct xsm_operations *xsm_ops;

Cheers,

-- 
Julien Grall

