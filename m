Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50495299BB
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 08:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330492.553880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqqzT-0003Wp-S1; Tue, 17 May 2022 06:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330492.553880; Tue, 17 May 2022 06:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqqzT-0003TL-P5; Tue, 17 May 2022 06:47:31 +0000
Received: by outflank-mailman (input) for mailman id 330492;
 Tue, 17 May 2022 06:47:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6f+b=VZ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nqqzS-0003TF-2B
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 06:47:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 37bebdff-d5ad-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 08:47:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6AD61063;
 Mon, 16 May 2022 23:47:27 -0700 (PDT)
Received: from [10.57.3.238] (unknown [10.57.3.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EE7E3F718;
 Mon, 16 May 2022 23:47:26 -0700 (PDT)
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
X-Inumbo-ID: 37bebdff-d5ad-11ec-bd2c-47488cf2e6aa
Message-ID: <789c1899-7444-2e29-dfea-58c9fa446a8e@arm.com>
Date: Tue, 17 May 2022 08:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: gic-v3-lpi: Allocate the pending table while
 preparing the CPU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220516170246.19908-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220516170246.19908-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 16.05.2022 19:02, Julien Grall wrote:
> +static int cpu_callback(struct notifier_block *nfb, unsigned long action,
> +                        void *hcpu)
> +{
> +    unsigned long cpu = (unsigned long)hcpu;
As cpu does not change in this function, shouldn't we mark it as const?

> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_UP_PREPARE:
> +        rc = gicv3_lpi_allocate_pendtable(cpu);
> +        if ( rc )
> +            printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
%u requires unsigned int but cpu is unsigned long.
FWICS this will cause a compilation error, so you should change to %lu.

> +                   cpu);
> +        break;
>      }
>  
> -    return gicv3_lpi_set_proptable(rdist_base);
> +    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
>  }
>  

Cheers,
Michal

