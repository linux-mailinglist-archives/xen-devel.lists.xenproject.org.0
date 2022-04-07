Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDE4F7AA2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300544.512699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNyi-0001ai-Tw; Thu, 07 Apr 2022 08:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300544.512699; Thu, 07 Apr 2022 08:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNyi-0001YZ-Qj; Thu, 07 Apr 2022 08:58:56 +0000
Received: by outflank-mailman (input) for mailman id 300544;
 Thu, 07 Apr 2022 08:58:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncNyh-0001YT-N1
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:58:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncNyg-0003TP-Dw; Thu, 07 Apr 2022 08:58:54 +0000
Received: from [54.239.6.189] (helo=[192.168.11.175])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncNyg-00082z-6p; Thu, 07 Apr 2022 08:58:54 +0000
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
	bh=sP38xVjOooTtw2CuuAOwWKLsRja/GbMoQ43bwGgG10A=; b=bAH8+NcKjqnMPYH7G7lU1tbMt1
	tn24Y4tO2eoRjkkT4PykUpWQxCwoxREmnAdMj2E7w7NNmKUZB0hT/T6nJ7tgD29upyP8JcOHYTOcz
	KjK9TNs8B2NiN2ePHBw9QSEt843bQAoOCLx0VFUDED6/v+ifl6kMJTCF+PSfuD6iKGio=;
Message-ID: <deffb58a-984a-1016-4ac8-c3badc946ea0@xen.org>
Date: Thu, 7 Apr 2022 09:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/6] xen/cpupool: Create different cpupools at boot
 time
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220405085741.18336-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 05/04/2022 09:57, Luca Fancellu wrote:
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.

How will this work for ACPI? Note that I am not suggesting to add suport 
right now. However, we probably want to clarify that this is not yet 
supported.

[...]

> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
> new file mode 100644
> index 000000000000..5dac2b1384e0
> --- /dev/null
> +++ b/docs/misc/arm/device-tree/cpupools.txt
> @@ -0,0 +1,136 @@
> +Boot time cpupools
> +==================
> +
> +When BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is possible to
> +create cpupools during boot phase by specifying them in the device tree.

How about ACPI?

> +
> +Cpupools specification nodes shall be direct childs of /chosen node.
> +Each cpupool node contains the following properties:
> +
> +- compatible (mandatory)
> +
> +    Must always include the compatiblity string: "xen,cpupool".
> +
> +- cpupool-cpus (mandatory)
> +
> +    Must be a list of device tree phandle to nodes describing cpus (e.g. having
> +    device_type = "cpu"), it can't be empty.
> +
> +- cpupool-sched (optional)
> +
> +    Must be a string having the name of a Xen scheduler. Check the sched=<...>
> +    boot argument for allowed values.

I would clarify what would be the scheduler if cpupool-sched is not 
specified.

Also, I would give a pointer to xen-command-line.pandoc so it is easier 
to know where 'sched' is described.

[...]

> +void __init btcpupools_dtb_parse(void)
> +{
> +    const struct dt_device_node *chosen, *node;
> +
> +    chosen = dt_find_node_by_path("/chosen");
> +    if ( !chosen )
> +        return;
Aside when using ACPI, the chosen node should always be there. So I 
think we should throw/print an error if chosen is not present.

Also, I would check that we haven't booted using ACPI rather than 
relying on dt_find_node_by_path("/chosen") to return NULL.

Cheers,

-- 
Julien Grall

