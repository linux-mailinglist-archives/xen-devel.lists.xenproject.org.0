Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DAC4D8F49
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 23:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290473.492626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsqR-0006I5-PX; Mon, 14 Mar 2022 22:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290473.492626; Mon, 14 Mar 2022 22:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTsqR-0006F7-MB; Mon, 14 Mar 2022 22:07:15 +0000
Received: by outflank-mailman (input) for mailman id 290473;
 Mon, 14 Mar 2022 22:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTsqQ-0006Ez-9o
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 22:07:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTsqP-00064s-Ol; Mon, 14 Mar 2022 22:07:13 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTsqP-00084d-HE; Mon, 14 Mar 2022 22:07:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=b5rG/0rd0ntDk4bfE98IN9mCR1FrVs+Kcr900eCZF7I=; b=mgvpEyfm9tt0kZPVMq8yawhdKs
	S6SH/diUu8RowaCzJx74uy6eR38LlU4sOBbHJ0mGmrRiQe8NumuTA8DzH0aps7ZHUitPTb+nhorLg
	5yer4iG/8QBptiR5eBQYagRLGS1NrNZYVNKSprPErPX/VkeHKcjBQVdgDZGdwKngTYqg=;
Message-ID: <e55e0377-dba1-aac3-6628-b1b371269815@xen.org>
Date: Mon, 14 Mar 2022 22:07:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-34-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 33/36] doc, xen-command-line: introduce coloring options
In-Reply-To: <20220304174701.1453977-34-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Four additional parameters in the Xen command line are used to define
> the underlying coloring policy, which is not directly configurable
> otherwise.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   docs/misc/xen-command-line.pandoc | 51 +++++++++++++++++++++++++++++--
>   1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index efda335652..a472d51cf9 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>       cause Xen not to use Indirect Branch Tracking even when support is
>       available in hardware.
>   
> +### buddy\_size (arm64)
> +> `= <size in megabyte>`
> +
> +> Default: `64 MB`
> +
> +Amount of memory reserved for the buddy allocator when colored allocator is
> +active. This options is useful only if coloring support is enabled.
> +The colored allocator is meant as an alternative to the buddy allocator,
> +since its allocation policy is by definition incompatible with the
> +generic one. Since the Xen heap systems is not colored yet, we need to
> +support the coexistence of the two allocators for now. This parameter, which is
> +optional and for expert only, is used to set the amount of memory reserved to
> +the buddy allocator.

A few questions:
   - How did you chose the default?
   - How can a user decide the size of the buddy_size?

> +
>   ### clocksource (x86)
>   > `= pit | hpet | acpi | tsc`
>   
> @@ -884,7 +898,17 @@ Controls for the dom0 IOMMU setup.
>   
>       Incorrect use of this option may result in a malfunctioning system.
>   
> -### dom0_ioports_disable (x86)

This change sounds unrelated to the patch itself. I would also expect 
that we would want to backport it. So can this be backported.

> +### dom0\_colors (arm64)
> +> `= List of <integer>-<integer>`
> +
> +> Default: `All available colors`
> +
> +Specify dom0 color configuration. If the parameter is not set, all available
> +colors are chosen and the user is warned on Xen's serial console. This color
> +configuration acts also as the default one for all DomUs that do not have any
> +explicit color assignment in their configuration file.
> +
> +### dom0\_ioports\_disable (x86)
>   > `= List of <hex>-<hex>`
>   
>   Specify a list of IO ports to be excluded from dom0 access.
> @@ -2625,6 +2649,20 @@ unknown NMIs will still be processed.
>   Set the NMI watchdog timeout in seconds.  Specifying `0` will turn off
>   the watchdog.
>   
> +### way\_size (arm64)
> +> `= <size in byte>`
> +
> +> Default: `Obtained from the hardware`
> +
> +Specify the way size of the Last Level Cache. This parameter is only useful with
> +coloring support enabled. It is an optional, expert-only parameter and it is
> +used to calculate what bits in the physical address can be used by the coloring
> +algorithm, and thus the maximum available colors on the platform. It can be
> +obtained by dividing the total LLC size by the number of associativity ways.
> +By default, the value is also automatically computed during coloring
> +initialization to avoid any kind of misconfiguration. For this reason, it is
> +highly recommended to use this boot argument with specific needs only.

Given the last two sentences, why would someone wants to use it?

> +
>   ### x2apic (x86)
>   > `= <boolean>`
>   
> @@ -2642,7 +2680,16 @@ In the case that x2apic is in use, this option switches between physical and
>   clustered mode.  The default, given no hint from the **FADT**, is cluster
>   mode.
>   
> -### xenheap_megabytes (arm32)

Same here.

> +### xen\_colors (arm64)
> +> `= List of <integer>-<integer>`
> +
> +> Default: `0-0: the lowermost color`
> +
> +Specify Xen color configuration.
> +Two colors are most likely needed on platforms where private caches are
> +physically indexed, e.g. the L1 instruction cache of the Arm Cortex-A57.

How can someone decide the number of colors to be used for Xen?

Cheers,

-- 
Julien Grall

