Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBCD25587F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 12:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBbYq-0003cF-PM; Fri, 28 Aug 2020 10:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X//y=CG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kBbYq-0003c9-2o
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 10:24:44 +0000
X-Inumbo-ID: 5e6c0dfe-cac0-4748-9dc8-3e43f446e51d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e6c0dfe-cac0-4748-9dc8-3e43f446e51d;
 Fri, 28 Aug 2020 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=MfXR1SG0uZuMEAIMbnpko3twDpWLxmbTAUDwjf2o9YE=; b=tBL0VEFgriWa0whdvoQSAmuZmU
 +E/iy7y3hb1LSGINUPVgEKzuNsXooA6OnNfDDEQXc8DEdo489Uc82Ymcj5pMkaVxiAOdVWQC7EX3u
 sDVnnXm3Ukqq9/RHseRcr4bXC3GmDQFmywn3pfCZmA5/WArpIPNAcBF34PNQFRiJD6QQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBbYp-00084F-3m; Fri, 28 Aug 2020 10:24:43 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBbYo-0003DC-SG; Fri, 28 Aug 2020 10:24:43 +0000
Subject: Re: [PATCH v5 0/2] Fix Guest random crash on Cortex-N1/A76/A75 cores
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Penny.Zheng@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20200828023404.28638-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <48d57d61-e051-6fbd-51ab-8c282363d7d5@xen.org>
Date: Fri, 28 Aug 2020 11:24:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828023404.28638-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Wei,

On 28/08/2020 03:34, Wei Chen wrote:
> On latest Arm Cortex-N1/A76/A75 cores, Xen guests will encouter random
> crash when they have wordloads. It's because Xen will ignore FP/SIMD
> registers in vCPU context switch (see patch#1 for more details).
> 
> This patch set fix guest random crash on these new cores, and throw
> messages when Xen detects known FP/SIMD features.
> 
> ---
>   v4 --> v5:
>    1. Fix typos.

For future reference, the committers are generally happy to fix the 
typoes on commit if you ask them nicely :).

I will commit the two patches later today.

Cheers,


> 
>   v3 --> v4:
>    1. Use open-code instead of new cpu_has_unknown_{fp,simd} macros.
> 
>   v2 --> v3:
>    1. Improve the warning messages to give clear meanings
>    2. Fix typos
> 
>   v1 --> v2:
>    1. Use "< 8" instead of "<= 1" to detect FP/SIMD features.
>    2. Give messages for unknown FP/SIMD features.
>    3. Fix typos.
>   
>   v1:
>    https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00857.html
> 
> Wei Chen (2):
>    xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
>    xen/arm: Throw messages for unknown FP/SIMD implement ID
> 
>   xen/arch/arm/setup.c             | 12 ++++++++++++
>   xen/include/asm-arm/cpufeature.h |  4 ++--
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 

-- 
Julien Grall

