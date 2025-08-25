Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE1B33AE9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092802.1448430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTT5-0002db-L1; Mon, 25 Aug 2025 09:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092802.1448430; Mon, 25 Aug 2025 09:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTT5-0002bf-ID; Mon, 25 Aug 2025 09:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1092802;
 Mon, 25 Aug 2025 09:26:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uqTT5-0002bZ-08
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:26:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqTT3-005nj2-2e;
 Mon, 25 Aug 2025 09:26:22 +0000
Received: from [2a02:8012:3a1:0:7981:7aa1:9b9b:8488]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uqTT3-0009oK-2K;
 Mon, 25 Aug 2025 09:26:21 +0000
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
	bh=4NXcscV5TTGwpg1wUZFHfeGWe7vtzzOq6F5Jhr809mA=; b=CYWdQlkDzDz0x0KPuz7aAGkFYL
	Kp4wNQp2r22hpofTLRWypv1MvnKfRsu0rb+yZ81ST0h+7YS3zNHfaol/uliLttKk6BNu5nAbnX/aU
	16iCzAU2YjCtQdwVqJRs5NUH3GVe1007cbTOMokyjVeD3X+VZEM0nudBwUlf9E+eOdIk=;
Message-ID: <0e0c9d9b-87ee-47e2-a2ac-42f183c674dd@xen.org>
Date: Mon, 25 Aug 2025 10:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] xen: Make the maximum number of altp2m views
 configurable for x86
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1753953832.git.w1benny@gmail.com>
 <d8ce4bd614e240aebc2dd09930af0c2c474acf50.1753953832.git.w1benny@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d8ce4bd614e240aebc2dd09930af0c2c474acf50.1753953832.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/07/2025 10:27, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
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
> Accesses to the altp2m_p2m array are modified to respect the new nr_altp2m
> value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
> these arrays always have fixed size of MAX_EPTP.
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
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


