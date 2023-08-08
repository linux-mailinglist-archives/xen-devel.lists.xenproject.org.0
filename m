Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905FA773AFB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580057.908337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOa9-0008IG-C1; Tue, 08 Aug 2023 15:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580057.908337; Tue, 08 Aug 2023 15:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOa9-0008Fk-8z; Tue, 08 Aug 2023 15:25:13 +0000
Received: by outflank-mailman (input) for mailman id 580057;
 Tue, 08 Aug 2023 15:25:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTOa7-0008ED-9h
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:25:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTOa6-0007wL-DC; Tue, 08 Aug 2023 15:25:10 +0000
Received: from [15.248.2.255] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTOa6-0000Vm-6e; Tue, 08 Aug 2023 15:25:10 +0000
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
	bh=mhSkcYjKzdM1A8cSCbo8QWS/K4QuN9VbXSR/mvklOw0=; b=FdHsyD3E6xSLTW03K+nKX2/lT/
	lGroxu7TRFv0oGe1YVXZyZE5C/mPnNs6+GWVkp9Po9wD8QIJAk4QskEWrwtFc/k8wQTJCQ6dN2RFb
	73/leSvX2hRG+GsDJYk25VaSmXj4QhzKLUFvLBXiyva4tV/Sq4RLHVzuoRSRdZIqEw2o=;
Message-ID: <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org>
Date: Tue, 8 Aug 2023 16:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2023 15:38, Nicola Vetrini wrote:
> The break statement after the return statement is definitely unreachable.
> As such, an call to the ASSERT_UNREACHABLE() macro is added to signal
> the intentionality of such construct.

How about using unreachable() rather than ASSERT_UNREACHABLE()? The main 
difference is the later will hint the compiler that the code cannot be 
reached and will not crash Xen in debug build (this could be changed).

> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> The break in the clause is mandated by Required Rule 16.3, which is
> not yet an accepted rule for Xen, but may be in the future.
> ---
>   xen/common/sched/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 022f548652..fcee902b4e 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int cpu)
>           /* fallthrough */
>       case TASKLET_enqueued|TASKLET_scheduled:
>           return true;
> +        ASSERT_UNREACHABLE();
>           break;
>       case TASKLET_scheduled:
>           clear_bit(_TASKLET_scheduled, tasklet_work);

Cheers,

-- 
Julien Grall

