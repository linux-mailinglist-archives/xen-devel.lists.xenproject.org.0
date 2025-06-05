Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FFACF9CD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 00:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007664.1386943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJJy-0006bm-8n; Thu, 05 Jun 2025 22:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007664.1386943; Thu, 05 Jun 2025 22:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJJy-0006Zi-5k; Thu, 05 Jun 2025 22:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1007664;
 Thu, 05 Jun 2025 22:44:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNJJx-0006Zc-C8
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 22:44:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNJJw-003mb4-2K;
 Thu, 05 Jun 2025 22:44:24 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNJJx-009MrP-00;
 Thu, 05 Jun 2025 22:44:24 +0000
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
	bh=Q1/hezIP1lWTTjViNwl+8ErXum4/EN7WBrCvfzxq4bk=; b=1qR8tAoA4ckC+ezUwQRnbIVsBW
	Dlv9h7kNYNFwyhb2fVjrNcLWoW75pUVxUqX6vRRkkLisXxjKoxd1e0Z2aXtvpnE93Xoga9vXvyUG+
	wjfMppocLABFT/FrrbfeDY5l6tO7CsnUOelK9kob0W6XxMOfZ5leEPIq7dVYGqmxUMPQ=;
Message-ID: <c130b081-4f6d-474b-850e-db4e8d07f22e@xen.org>
Date: Thu, 5 Jun 2025 23:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii & Stefano,

On 23/05/2025 21:06, Stefano Stabellini wrote:
>> +SCMI SMC multi-agent support
>> +============================
>> +
>> +For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_SMC_MA)
>> +the Xen specific SCMI Agent's configuration shell be provided in the Host DT
>> +according to the SCMI compliant EL3 Firmware specification with
>> +ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
>> +the top-level "chosen" node:
>> +
>> +- xen,scmi-secondary-agents
>> +
>> +    Defines a set of SCMI agents configuration supported by SCMI EL3 FW and
>> +    available for Xen. Each Agent defined as triple consisting of:
>> +    SCMI agent_id,
>> +    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
>> +    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem").
>> +
>> +As an example:
>> +
>> +chosen {
>> +    xen,scmi-secondary-agents = <
>> +        1 0x82000003 &scmi_shm_1
>> +        2 0x82000004 &scmi_shm_2
>> +        3 0x82000005 &scmi_shm_3
>> +        4 0x82000006 &scmi_shm_4>;
>> +}
> 
> NIT: it should be };
> 
> Looking at scmi_probe, collect_agents, and the following SCMI
> SCMI_BASE_DISCOVER_AGENT request, I wonder: do we actually need this
> information?
> 
> It looks like we can discover the agend_ids for every channel, I guess
> what we need to know is the shmem location for every channel? But the
> full list of shmem channel is available below thanks to the scmi-shmem
> nodes.
> 
> So, we have the list of scmi-shmem anyway, and we can probe the
> agent_id. The only parameter left is the smc_id/func_id.
> 
> Or maybe smc_id/func_id can be calculated from agent_id?
> 
> I am asking mostly because if a user is supposed to add this
> xen,scmi-secondary-agents property, where are they supposed to find the
> smc_id/func_id information?
> 
> It is important that we write down in this document how the user is
> expected to find out what 1 is 0x82000003 which is scmi_shm_1.

I was actually going to write something similar to what you wrote. I 
think this is error-prone to let the user specify the full SMC ID. It 
would be better if this can be computed from a base + an agent ID.

Cheers,

-- 
Julien Grall


