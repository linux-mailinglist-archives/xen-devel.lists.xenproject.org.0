Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274D4FBA4C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302973.516900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrkk-0001wG-Oc; Mon, 11 Apr 2022 10:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302973.516900; Mon, 11 Apr 2022 10:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrkk-0001u7-Ls; Mon, 11 Apr 2022 10:58:38 +0000
Received: by outflank-mailman (input) for mailman id 302973;
 Mon, 11 Apr 2022 10:58:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrkj-0001u1-4x
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:58:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrki-0004L8-FT; Mon, 11 Apr 2022 10:58:36 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrki-0004k1-8k; Mon, 11 Apr 2022 10:58:36 +0000
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
	bh=ribuK56o4egzHboNH7gsIvacwzqN9X5h/7ibu9ACjwI=; b=4QV/zRkxypODTMN8Qhk3Y6Hmwe
	nXxIP3Go/OH//T+oFyrZ+xAJBo4za13hPa8xrGddO51pgvJQxO2HS+jaOK/3zLoC6ouJj2AnWFNbv
	EGbqzwu5c0yFrBYhISml1J4qQJow8lg2v9c5xpU95NcZjpLFnglrFDWAgMAa51rxzOJM=;
Message-ID: <a052e26c-2142-bf51-bc80-449476ed0854@xen.org>
Date: Mon, 11 Apr 2022 11:58:33 +0100
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
> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
> new file mode 100644
> index 000000000000..40cc8135c66f
> --- /dev/null
> +++ b/docs/misc/arm/device-tree/cpupools.txt
> @@ -0,0 +1,140 @@
> +Boot time cpupools
> +==================
> +
> +When BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is possible to
> +create cpupools during boot phase by specifying them in the device tree.
> +ACPI is not supported for this feature.
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
> +    boot argument for allowed values [1]. When this property is omitted, the Xen
> +    default scheduler will be used.
> +
> +
> +Constraints
> +===========
> +
> +If no cpupools are specified, all cpus will be assigned to one cpupool
> +implicitly created (Pool-0).
> +
> +If cpupools node are specified, but not every cpu brought up by Xen is assigned,
> +all the not assigned cpu will be assigned to an additional cpupool.
> +
> +If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
> +stop.
> +
> +The boot cpu must be assigned to Pool-0, so the cpupool containing that core
> +will become Pool-0 automatically.
> +
> +
> +Examples
> +========
> +
> +A system having two types of core, the following device tree specification will
> +instruct Xen to have two cpupools:
> +
> +- The cpupool with id 0 will have 4 cpus assigned.
> +- The cpupool with id 1 will have 2 cpus assigned.

AFAIK, there are no guarantee that Xen will parse cpupool_a first. So it 
would be possible that the ID are inverted here.

This could happen if you want to keep the boot CPU in pool 0 and it is 
not cpu@0 (some bootloaders allows you to change the boot CPU).

Also, here you write "The cpupool with id X" but ...

> +A system having the cpupools specification below will instruct Xen to have three
> +cpupools:
> +
> +- The cpupool Pool-0 will have 2 cpus assigned.
> +- The cpupool Pool-1 will have 2 cpus assigned.
> +- The cpupool Pool-2 will have 2 cpus assigned (created by Xen with all the not
> +  assigned cpus a53_3 and a53_4).

here you write "The cpupool Pool-X". Can you be consistent?

On a separate topic, I think dom0_max_vcpus() needs to be updated to by 
default (i.e when opt_dom0_max_vcpus == 0) the number of vCPUs match the 
number of vCPUs in the cpupool (I think 0) used to created dom0.

Cheers,

-- 
Julien Grall

