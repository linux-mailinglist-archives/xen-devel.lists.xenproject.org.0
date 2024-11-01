Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89599B9309
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 15:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829186.1244288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sXt-0008Vu-Hp; Fri, 01 Nov 2024 14:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829186.1244288; Fri, 01 Nov 2024 14:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6sXt-0008TR-F1; Fri, 01 Nov 2024 14:22:37 +0000
Received: by outflank-mailman (input) for mailman id 829186;
 Fri, 01 Nov 2024 14:22:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t6sXs-0008TD-2p
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 14:22:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sXr-00F3Vs-2Y;
 Fri, 01 Nov 2024 14:22:35 +0000
Received: from [2a02:8012:3a1:0:4ddd:1dd:c52d:25b6]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1t6sXr-009fKJ-1o;
 Fri, 01 Nov 2024 14:22:35 +0000
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
	bh=Y6yHDwxgHU5sPInrG6m72geb5DEJCsFJvyeT05/Azqc=; b=Ztbs4D/3gEUNqQMys4GxhO19zL
	JzwLJ0PQdNKT2OPF5ZLkBDZ5h2eKBVPgkdFEXFQeP4TgmXdwO6PZeuxGYj42u+YYltLqMCwBicYkN
	tiexATBRaLJ/OT60dF71ktB2cUvinNei92OonaOLGKTlX1uId1b8e1T9N4DR3zuAR+2U=;
Message-ID: <3d49c15a-64bf-4088-9210-018adec2b72f@xen.org>
Date: Fri, 1 Nov 2024 14:22:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Enable early bootup of AArch64 MPU systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 28/10/2024 12:45, Ayan Kumar Halder wrote:
> We have enabled early booting of R82.
> 
> Changes from v2 :-
> 1. Added a new patch "xen/arm: Skip initializing the BSS section when it is empty".
> 2. Split "xen/arm: mpu: Create boot-time MPU protection regions" into 2 patches.
> 
> Changes from v3 :-
> 1. Removed some of the R-b as the patches have been modified.
> 
> Ayan Kumar Halder (6):
>    xen/arm: Skip initializing the BSS section when it is empty
>    xen/arm: mpu: Introduce choice between MMU and MPU
>    xen/arm: mpu: Define Xen start address for MPU systems

I have committed the first 3 patches. I think the others need a respin.

Cheers,

-- 
Julien Grall


