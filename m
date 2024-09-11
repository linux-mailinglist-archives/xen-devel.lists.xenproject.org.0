Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9401974F1E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796350.1205905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK4x-0000hY-V4; Wed, 11 Sep 2024 09:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796350.1205905; Wed, 11 Sep 2024 09:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK4x-0000g1-SM; Wed, 11 Sep 2024 09:56:03 +0000
Received: by outflank-mailman (input) for mailman id 796350;
 Wed, 11 Sep 2024 09:56:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1soK4v-0000fI-W1
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:56:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soK4v-0007fu-Eu; Wed, 11 Sep 2024 09:56:01 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soK4v-0004ai-6X; Wed, 11 Sep 2024 09:56:01 +0000
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
	bh=s0gBBxcl24SWKS4wXbs6kss+TRvrMoPl9fx8+bi3Nic=; b=XVhKbPFHjrlXRQU2XzX00lH7iC
	rFneeR1LYQxCcOxWnRBqkvVk/sKzY/QALe96aQ2D8zNrZK5ouYVqGAr38+zWBk1D5ciPmSIs937l9
	LdWR1i2qVuwvz2nqVGXU8IkwfvTldSMxeWuQbAFOh8M1kQDbOGEMTg/0d/2AdvOoWVtM=;
Message-ID: <918755fd-ef73-4dd5-b77d-f386f8f74ac6@xen.org>
Date: Wed, 11 Sep 2024 10:55:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add Assumption of Use (AoU)
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20240911094456.2156647-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240911094456.2156647-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2024 10:44, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> AoU are the assumptions Xen relies on other components (eg platform, domains)
> to fulfill its requirements. In our case, platform means a combination of
> hardware, firmware and bootloader.
> 
> We have defined AoU in the intro.rst and added AoU for the generic timer.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. Removed the part of requirement which states that Xen exposes the
> frequency of the system timer by reading the "clock-frequency" property.
> 
> 2. Added a rationale for AoU.
> 
> 3. Reworded the AoU.
> 
>   .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
>   docs/fusa/reqs/intro.rst                      | 10 ++++++++
>   2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> index f2a0cd7fb8..86d84a3c40 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -30,7 +30,7 @@ Read system counter frequency
>   
>   Description:
>   Xen shall expose the frequency of the system counter to the domains in
> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" property.
> +CNTFRQ_EL0 register.

This either wants to be split or explained in the commit message.

>   
>   Rationale:
>   
> @@ -116,6 +116,28 @@ Rationale:
>   
>   Comments:
>   
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Assumption of Use on the Platform
> +=================================
> +
> +Expose system timer frequency via register
> +------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_plat_program_cntfrq_el0~1`
> +
> +Description:
> +Underlying platform shall program CNTFRQ_EL0 register with the value of system
> +timer frequency.
> +
> +Rationale:
> +Xen reads the CNTFRQ_EL0 register to get the value of system timer frequency.
> +While there is a provision to get this value by reading the "clock-frequency"
> +dt property [2], the use of this property is strongly discouraged.
> +
> +Comments:
> +
>   Covers:
>    - `XenProd~emulated_timer~1`
>   
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index 245a219ff2..aa85ff821c 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>   OpenFastTrace parses through the requirements and generates a traceability
>   report.
>   
> +Assumption of Use
> +=================
> +
> +To fulfill one or more design requirements, there may be underlying assumptions
> +on one or more components that Xen interacts with directly or indirectly. For
> +eg, there may be assumptions on the underlying platform (hardware + firmware +
> +bootloader) to set certain registers, etc. The important thing here is that
> +anyone who validates these requirements, need to consider the assumption on the
> +other components.
> +
>   The following is the skeleton for a requirement.
>   
>   Title of the requirement

Cheers,

-- 
Julien Grall


