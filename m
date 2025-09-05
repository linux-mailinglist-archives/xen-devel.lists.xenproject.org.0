Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF82B44EAC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111336.1460072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQVA-00035O-Rw; Fri, 05 Sep 2025 07:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111336.1460072; Fri, 05 Sep 2025 07:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQVA-00033v-OT; Fri, 05 Sep 2025 07:04:52 +0000
Received: by outflank-mailman (input) for mailman id 1111336;
 Fri, 05 Sep 2025 07:04:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuQV9-00033p-B6
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:04:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQV8-007otw-1N;
 Fri, 05 Sep 2025 07:04:50 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQV8-00GhXj-1M;
 Fri, 05 Sep 2025 07:04:50 +0000
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
	bh=hm+6mOUUCuI9jDi17Rwk/pp1Mc2zlId/fn8fNgio+lA=; b=yoO2wjcQAjW+TirBc4fPG7IiZC
	+0TDcf0CkMLTl/FRh7PQK6rufSwPVzjENw8BIOElr5e19+eHIdvRG2ZLY70GwJMG0wuGEG6PP3ymS
	saasFj0cXL5Z7HOroMI15g/E9AYJSUS6R0irfdIWooFdSJ/dye3gvC7K7b5CGb0pXZAE=;
Message-ID: <9e69e282-ea6b-4d4d-ae3c-27c4d3b7ccf4@xen.org>
Date: Fri, 5 Sep 2025 08:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250806094929.293658-4-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 06/08/2025 10:49, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Now Arm64 AArch32 guest support is always enabled and built-in while not
> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this

typo s/exmaple/example/

> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
> systems). 


 > More over, when focusing on safety certification, AArch32 related> 
code in Xen leaves a gap in terms of coverage that cannot really be
> justified in words. This leaves two options: either support it (lots of
> additional testing, requirements and documents would be needed) or compile
> it out.

To clarify my understanding, what you are removing is support for 32-bit 
EL1. But 32-bit EL0 will still be supported. Is that correct?

[...]

> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>    AArch32 is disabled.

A guest is not allowed to switch bitness. So I am not sure why we need 
to hide EL1. Depending on the answer above, you might need to hide EL0 
and have more code (TBC) to prevent 32-bit EL0 running.

Cheers,

-- 
Julien Grall


