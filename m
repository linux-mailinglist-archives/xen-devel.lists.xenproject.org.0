Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39064F9BE3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301734.514983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsbq-00078e-PY; Fri, 08 Apr 2022 17:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301734.514983; Fri, 08 Apr 2022 17:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsbq-00075v-M7; Fri, 08 Apr 2022 17:41:22 +0000
Received: by outflank-mailman (input) for mailman id 301734;
 Fri, 08 Apr 2022 17:41:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncsbp-00075p-1t
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 17:41:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsbo-0007tC-LP; Fri, 08 Apr 2022 17:41:20 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsbo-0001h0-Ep; Fri, 08 Apr 2022 17:41:20 +0000
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
	bh=GGVoppc/A36pKW5+3cgl0r2udRWupLyOWMZWnQsnOZY=; b=O6zS3G5NvjDT03AC2iqC+XQcn3
	Be9r5MH6oc/rWtaEGDphk+hAADvSXlNqi9MhBFPn46hsdLQEa6qWVaVoVumsxKJd9/pmjOQ86CopZ
	+qSPg8AFPpx4ex0sAwOIuy574aLtyvoN+ctwd5j01XWxI9wemHbqiu1eWXqddhgR5ez0=;
Message-ID: <e3a732b6-33b2-a6fc-6d9f-5f7f7a1872d4@xen.org>
Date: Fri, 8 Apr 2022 18:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220408084517.33082-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/04/2022 09:45, Luca Fancellu wrote:
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
> 
> ACPI is not supported for this feature.
> 
> Documentation is created to explain the feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
> Changes in v6:
> - Changed docs, return if booted with ACPI in btcpupools_dtb_parse,
>    panic if /chosen does not exists. Changed commit message (Julien)

I went through the changes and they LGTM. Stefano has paid closer 
attention to this series, so I will leave him to do the full review.

Cheers,

-- 
Julien Grall

