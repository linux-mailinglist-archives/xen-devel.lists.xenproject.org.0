Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB63ADE485
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018904.1395780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRnE8-0003uA-Br; Wed, 18 Jun 2025 07:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018904.1395780; Wed, 18 Jun 2025 07:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRnE8-0003rh-8W; Wed, 18 Jun 2025 07:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1018904;
 Wed, 18 Jun 2025 07:28:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uRnE6-0003rZ-Sr
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:28:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRnE6-007n1S-0e;
 Wed, 18 Jun 2025 07:28:54 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uRnE5-009N5a-37;
 Wed, 18 Jun 2025 07:28:54 +0000
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
	bh=sGZjI4tbZbPBWUj9naF9XCrtdWBwG8WfLSjdxottyYc=; b=YSO8a4yGan0zatsEnxsEgW+26q
	FQuKLLu6M14uK0c/2VcvqxqbUc2Ae1IKiAML9lbCNxqsLltG905mlypAXaE2gyCemJAkCR8nntEJL
	k/lgEHsruBAJ0yts2pEoiuigfUe1F6oBtW/JSCIWenlOvDnygwTCsk/EQ7LTdpIMPspw=;
Message-ID: <13d95459-ea77-46ea-84e4-cccece4cd496@xen.org>
Date: Wed, 18 Jun 2025 08:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 19/05/2025 16:50, Oleksii Moisieiev wrote:
> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> (TF-A) which provides SCMI interface with multi-agnet support, as shown

s/multi-agnet/multi-agent/

> below.
> 
>    +-----------------------------------------+
>    |                                         |
>    | EL3 TF-A SCMI                           |
>    +-------+--+-------+--+-------+--+-------++
>    |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
>    +-----+-+  +---+---+  +--+----+  +---+---+
> smc-id0 |        |         |           |
> agent0  |        |         |           |
>    +-----v--------+---------+-----------+----+
>    |              |         |           |    |
>    |              |         |           |    |
>    +--------------+---------+-----------+----+
>           smc-id1 |  smc-id2|    smc-idX|
>           agent1  |  agent2 |    agentX |
>                   |         |           |
>              +----v---+  +--v-----+  +--v-----+
>              |        |  |        |  |        |
>              | Dom0   |  | Dom1   |  | DomX   |
>              |        |  |        |  |        |
>              |        |  |        |  |        |
>              +--------+  +--------+  +--------+
> 
> The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
> memory transport for every Agent in the system.
> 
> The SCMI Agent transport channel defined by pair:
>   - smc-id: SMC/HVC id used for Doorbell
>   - shmem: shared memory for messages transfer, Xen page aligned,
>   p2m_mmio_direct_nc.

It is not clear why we nention Xen page aligned and p2m_mmio_direct_nc. 
Is this multi-agent protocol tied to Xen?

That said... p2m_mmio_direct_nc is a type used in the stage 2 
page-tables to indicate how we restrict access from the domain.

The resulting memory attribute will be a combination of stage-1 + 
stage-2. In the future, we may decide to use FWB which will allow Xen to 
force a specific memory attribute.

This is also purely internal decision. In the documentation, you should 
spell out the memory attribute that should be used. From the discussion 
on this patch, it is still unclear whether the region should be mapped 
as Device nGnRE or normal memory non-cacheabl.

Cheers,

-- 
Julien Grall


