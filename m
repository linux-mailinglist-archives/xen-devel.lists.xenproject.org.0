Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752437B2D1D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610210.949546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm84j-00033G-MM; Fri, 29 Sep 2023 07:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610210.949546; Fri, 29 Sep 2023 07:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm84j-00031a-JB; Fri, 29 Sep 2023 07:38:13 +0000
Received: by outflank-mailman (input) for mailman id 610210;
 Fri, 29 Sep 2023 07:38:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm84h-00031U-Lr
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:38:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm84h-0008Di-8R; Fri, 29 Sep 2023 07:38:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm84h-0001lK-2m; Fri, 29 Sep 2023 07:38:11 +0000
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
	bh=inFTXOSGih0pzzXbhKFdO70QzhmdWdhrVd+vsphXbks=; b=CI+NXh4u4TzYElN6msQ6FkGWQk
	jkdJeDh8B2iEKe/7OaeVD16FqdywdFXnyJCZTauKdwShprCfjR486EztSS4ca2qkgDX6QkaWORsEe
	WNS1MJ1VyJ1QW+IYcNBH5A1gxWg3mcdOBUgB/fLHe+6ULaObqCWLdOGK9vNqKYgwTPk4=;
Message-ID: <d406c4c6-07f7-442f-8bef-8ba42308ae93@xen.org>
Date: Fri, 29 Sep 2023 08:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Validate generic timer frequency
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230928123435.2802-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230928123435.2802-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 28/09/2023 13:34, Michal Orzel wrote:
> Generic timer dt node property "clock-frequency" (refer Linux dt binding
> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml) is used to
> override the incorrect value set by firmware in CNTFRQ_EL0. If the value
> of this property is 0 (i.e. by mistake), Xen would continue to work and
> use the value from the sysreg instead. The logic is thus incorrect and
> results in inconsistency when creating timer node for domUs:
>   - libxl domUs: clock_frequency member of struct xen_arch_domainconfig
>     is set to 0 and libxl ignores setting the "clock-frequency" property,
>   - dom0less domUs: "clock-frequency" property is taken from dt_host and
>     thus set to 0.
> 
> Property "clock-frequency" is used to override the value from sysreg,
> so if it is also invalid, there is nothing we can do and we shall panic
> to let user know about incorrect setting. Going even further, we operate
> under assumption that the frequency must be at least 1KHz (i.e. cpu_khz
> not 0) in order for Xen to boot. Therefore, introduce a new helper
> validate_timer_frequency() to verify this assumption and use it to check
> the frequency obtained either from dt property or from sysreg.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

