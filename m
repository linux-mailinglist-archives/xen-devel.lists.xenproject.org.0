Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9E8FB0F5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 13:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735349.1141528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESDC-0007L5-Q9; Tue, 04 Jun 2024 11:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735349.1141528; Tue, 04 Jun 2024 11:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sESDC-0007Iu-ND; Tue, 04 Jun 2024 11:20:18 +0000
Received: by outflank-mailman (input) for mailman id 735349;
 Tue, 04 Jun 2024 11:20:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sESDB-0007Io-KU
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:20:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sESDA-0000Jr-SB; Tue, 04 Jun 2024 11:20:16 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sESDA-0002HI-Jc; Tue, 04 Jun 2024 11:20:16 +0000
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
	bh=NdVOdUXAH+pXckRWyHpVGO7EJZKUCsxPDmNeIaJEdJY=; b=YuG0HqvDpZsbO0JiJmoRAHRDqs
	f5dfRbR6DKjfrLF0SpSf8/He/JI+l4EuKd1JD4Pefcsghic0gkevP06WX+MtRjs2KTSnsi9ZvZiYT
	Cxv+PbyWBzvWVz7X6enaYemM3aNx7xvjFeQ/yDlvKj0WhJjmLHCmOkWsXE+sABvQuUeA=;
Message-ID: <91a15518-8211-457c-b716-226c2f89d278@xen.org>
Date: Tue, 4 Jun 2024 12:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1717356829.git.w1benny@gmail.com>
 <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Petr,

On 02/06/2024 21:04, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> x86: Make the maximum number of altp2m views configurable
> 
> This commit introduces the ability to configure the maximum number of altp2m
> views for the domain during its creation. Previously, the limits were hardcoded
> to a maximum of 10. This change allows for greater flexibility in environments
> that require more or fewer altp2m views.
> 
> The maximum configurable limit for nr_altp2m on x86 is now set to
> MAX_NR_ALTP2M (which currently holds the MAX_EPTP value - 512). This cap is
> linked to the architectural limit of the EPTP-switching VMFUNC, which supports
> up to 512 entries. Despite there being no inherent need for limiting nr_altp2m
> in scenarios not utilizing VMFUNC, decoupling these components would necessitate
> substantial code changes.
> 
> xen_domctl_createdomain::altp2m is extended for a new field `nr`, that will
> configure this limit for a domain. Additionally, previous altp2m.opts value
> has been reduced from uint32_t to uint16_t so that both of these fields occupy
> as little space as possible.
> 
> altp2m_get_p2m() function is modified to respect the new nr_altp2m value.
> Accessor functions that operate on EPT arrays are unmodified, since these
> arrays always have fixed size of MAX_EPTP.
> 
> A dummy hvm_altp2m_supported() function is introduced for non-HVM builds, so
> that the compilation won't fail for them.
> 
> Additional sanitization is introduced in the x86/arch_sanitise_domain_config
> to fix the altp2m.nr value to 10 if it is previously set to 0. This behavior
> is only temporary and immediately removed in the upcoming commit (which will
> disallow creating a domain with enabled altp2m with zero nr_altp2m).
> 
> The reason for this temporary workaround is to retain the legacy behavior
> until the feature is fully activated in libxl.
> 
> Also, arm/arch_sanitise_domain_config is extended to not allow requesting
> non-zero altp2ms.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

For the small change in Arm:

Acked-by: Julien Grall <jgrall@amazon.com> # arm

Cheers,

-- 
Julien Grall

