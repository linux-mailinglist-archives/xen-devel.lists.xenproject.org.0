Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75E4AB1C4
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266354.460042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnOb-0006Br-FV; Sun, 06 Feb 2022 19:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266354.460042; Sun, 06 Feb 2022 19:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnOb-00069G-Bx; Sun, 06 Feb 2022 19:40:25 +0000
Received: by outflank-mailman (input) for mailman id 266354;
 Sun, 06 Feb 2022 19:40:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnOa-00069A-A5
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:40:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnOY-000667-Nd; Sun, 06 Feb 2022 19:40:22 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.100.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnOY-0008R6-H9; Sun, 06 Feb 2022 19:40:22 +0000
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
	bh=INA/C+kES4Jq6I2wN0+I8BSOO6aAG413dNpma96PzfE=; b=ByyK/SfhJ0cpXxoIX46AIGYBM5
	FtBef8iWoKba8MjGwKFvMHvCVikCfSxVBBQDqj9Y8VbT5ujH1H9vBb2lF8nTWD06eboC94HFZqnJ+
	NDRczi+NVu38X98InQ4abEfRjCY3MNne/W9YRxUB8mUvWivdtk8dj1dV1E9FOxx+y9H8=;
Message-ID: <9a67c97c-0c61-ecee-067a-f1bdd0280b8b@xen.org>
Date: Sun, 6 Feb 2022 19:40:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] xen/smp: Speed up on_selected_cpus()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220204203115.13290-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220204203115.13290-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/02/2022 20:31, Andrew Cooper wrote:
> cpumask_weight() is a horribly expensive way to find if no bits are set, made
> worse by the fact that the calculation is performed with the global call_lock
> held.

I looked at the archive because I was wondering why we were using 
cpumask_weight here. It looks like this was a left-over of the rework in 
ac3fc35d919c "x86: Fix flush_area_mask() and on_selected_cpus() to not 
race updates".

> 
> Switch to using cpumask_empty() instead, which will short circuit as soon as
> it find any set bit in the cpumask.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I have not done performance testing, but I would be surprised if this cannot
> be measured on a busy or large box.
> ---
>   xen/common/smp.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/xen/common/smp.c b/xen/common/smp.c
> index 781bcf2c246c..a011f541f1ea 100644
> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -50,8 +50,6 @@ void on_selected_cpus(
>       void *info,
>       int wait)
>   {
> -    unsigned int nr_cpus;
> -
>       ASSERT(local_irq_is_enabled());
>       ASSERT(cpumask_subset(selected, &cpu_online_map));
>   
> @@ -59,8 +57,7 @@ void on_selected_cpus(
>   
>       cpumask_copy(&call_data.selected, selected);
>   
> -    nr_cpus = cpumask_weight(&call_data.selected);
> -    if ( nr_cpus == 0 )
> +    if ( cpumask_empty(&call_data.selected) )
>           goto out;
>   
>       call_data.func = func;

-- 
Julien Grall

