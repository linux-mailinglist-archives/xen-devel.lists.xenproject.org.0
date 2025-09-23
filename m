Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B1B97369
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 20:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128647.1468936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17uF-0007UV-AR; Tue, 23 Sep 2025 18:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128647.1468936; Tue, 23 Sep 2025 18:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v17uF-0007Sr-6t; Tue, 23 Sep 2025 18:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1128647;
 Tue, 23 Sep 2025 18:38:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v17uD-0007Sl-RY
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 18:38:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v17uD-006RJg-0k;
 Tue, 23 Sep 2025 18:38:25 +0000
Received: from [2a02:8012:3a1:0:5196:5816:243d:dc7b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v17uD-009qei-0f;
 Tue, 23 Sep 2025 18:38:25 +0000
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
	bh=diiNjytD3faZaiTuTJ1+UiQGdUtcCjkghMbVBigeUX4=; b=PXFJKOyL/oEqnCLfQNuto/tL4A
	L0Kc+KKB+gsBMW7mSmh+bgdeaM5VsG6MC70pos+xnpA5zAw5If63Em9aH5ZdJv+KDAeCh06P/nrWz
	IbvgdVpPQFxracipTnJxS2adNU7jrv2QS7vTx6AXBvEneWvpzaZl7Lp3S9YuN3X0MNlc=;
Message-ID: <16c461a0-cbfc-4979-9513-4528d6b78463@xen.org>
Date: Tue, 23 Sep 2025 19:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Implement CPU hotplug on Arm
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <0e69a741-b6e1-4315-91f0-581f72092c68@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0e69a741-b6e1-4315-91f0-581f72092c68@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Grygorii,

On 23/09/2025 17:09, Grygorii Strashko wrote:
> On 18.09.25 15:16, Mykyta Poturai wrote:
>> This series implements support for CPU hotplug/unplug on Arm. To 
>> achieve this,
>> several things need to be done:
>>
>> 1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
>> 2. timer and GIC maintenance interrupts switched to static irqactions 
>> to remove
>> the need for freeing them during release_irq.
>> 3. Enabled the build of xen-hptool on Arm.
>>
>> Tested on QEMU.
>>
>> Mykyta Poturai (4):
>>    arm/time: Use static irqaction
>>    arm/gic: Use static irqaction
>>    arm/sysctl: Implement cpu hotplug ops
>>    tools: Allow building xen-hptool without CONFIG_MIGRATE
>>
>>   config/arm64.mk                  |  1 +
>>   config/x86_32.mk                 |  1 +
>>   config/x86_64.mk                 |  1 +
>>   tools/libs/guest/Makefile.common |  4 +-
>>   tools/misc/Makefile              |  2 +-
>>   xen/arch/arm/gic.c               | 10 ++++-
>>   xen/arch/arm/sysctl.c            | 67 ++++++++++++++++++++++++++++++++
>>   xen/arch/arm/time.c              | 20 ++++++++--
>>   8 files changed, 98 insertions(+), 8 deletions(-)
>>
> 
> Hence you introducing new feature for ARM I'd very much appreciated if you
> add corresponding documentation under docs/hypervisor-guide/arm/.

I think some documentation is good. But why does this need to be Arm 
specific?

Cheers,

-- 
Julien Grall


