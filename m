Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F96F51F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528977.822810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu769-0001od-K0; Wed, 03 May 2023 07:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528977.822810; Wed, 03 May 2023 07:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu769-0001mt-Gm; Wed, 03 May 2023 07:40:25 +0000
Received: by outflank-mailman (input) for mailman id 528977;
 Wed, 03 May 2023 07:40:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pu767-0001mX-Rl
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:40:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu767-0002pH-BV; Wed, 03 May 2023 07:40:23 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pu767-000695-56; Wed, 03 May 2023 07:40:23 +0000
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
	bh=kvXYVl/zAq6keySiHy5yktJ5q2UYOeC69zj7hcDPRlM=; b=OU8E/atPMu/WlYT4ZfpwHDKr+X
	1pvAl3d9oLRTtodR4Bj2+MwYN4Oq+ngKUeoLKCRmwzLQGkLL/bGJx3CHv4E/5qAyPQ7Ntbdkfwp2V
	pXG8gVfKCUufQXcAdo2KdgFcQJPB2tTs+SKXr+lLk0b7XhvMdXbIBUuyjVCCu+aLtpd0=;
Message-ID: <2d764f29-2eb9-ecff-84cd-9baf12961c54@xen.org>
Date: Wed, 3 May 2023 08:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: Did you mean "Enable spin table"?

On 02/05/2023 11:58, Ayan Kumar Halder wrote:
> On some of the Arm32 based systems (eg Cortex-R52), smpboot is supported.

Same here.

> In these systems PSCI may not always be supported. In case of Cortex-R52, there
> is no EL3 or secure mode. Thus, PSCI is not supported as it requires EL3.
> 
> Thus, we use 'spin-table' mechanism to boot the secondary cpus. The primary
> cpu provides the startup address of the secondary cores. This address is
> provided using the 'cpu-release-addr' property.
> 
> To support smpboot, we have copied the code from xen/arch/arm/arm64/smpboot.c

I would rather prefer if we don't duplicate the code but instead move 
the logic in common code.

> with the following changes :-
> 
> 1. 'enable-method' is an optional property. Refer to the comment in
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cpus.yaml
> "      # On ARM 32-bit systems this property is optional"

Looking at this list, "spin-table" doesn't seem to be supported
for 32-bit systems. Can you point me to the discussion/patch where this 
would be added?

> 
> 2. psci is not currently supported as a value for 'enable-method'.
> 
> 3. update_identity_mapping() is not invoked as we are not sure if it is
> required.

This is not necessary at the moment for 32-bit. This may change in the 
future as we make the 32-bit boot code more compliant. For now, I would 
not add it.

Cheers,

-- 
Julien Grall

