Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF422709B13
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537156.836016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01rA-0000lA-SA; Fri, 19 May 2023 15:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537156.836016; Fri, 19 May 2023 15:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01rA-0000iO-PS; Fri, 19 May 2023 15:17:24 +0000
Received: by outflank-mailman (input) for mailman id 537156;
 Fri, 19 May 2023 15:17:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q01r9-0000iG-5h
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:17:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q01r8-0006Mn-S2; Fri, 19 May 2023 15:17:22 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.127]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q01r8-0000Ns-M8; Fri, 19 May 2023 15:17:22 +0000
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
	bh=Vaf9tYYMa/4VADQCkHAr+y9FmmnTjGo2uTwPzNEJPNM=; b=do2HzavNi+xEV/PrJweg34P7tt
	EZ6imFs08P3QheOOqkuoxuAXV2HKhek/dcgItGqNYeNK6l40MDKpybQpZIQsvGhHorH50MlXHK1iT
	dX+Y6Q6YzTLuV8bvAazSSWSxH/r0W0oVEB5UCtqSKAopfgER/kqJLWTYBpKp2l4RZrJE=;
Message-ID: <751c0d88-ee5e-7bc6-7d66-a478b9411fa4@xen.org>
Date: Fri, 19 May 2023 16:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
 <AAE00F7D-612B-47AC-82F9-BEEE9CB17804@arm.com>
 <b7bb99fb-c8d5-8852-9f35-3430a61d39b7@xen.org>
 <13FF90CF-22ED-4A7E-AAEB-633FF8CAF999@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <13FF90CF-22ED-4A7E-AAEB-633FF8CAF999@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/05/2023 16:13, Luca Fancellu wrote:
>> On 19/05/2023 15:51, Luca Fancellu wrote:
>>> /* Control Registers */
>>> /*
>>> * CPTR_EL2 needs to be written before calling vfp_restore_state, a
>>> * synchronization instruction is expected after the write (isb)
>>> */
>>> WRITE_SYSREG(n->arch.cptr_el2, CPTR_EL2);
>>> WRITE_SYSREG(n->arch.cpacr, CPACR_EL1);
>>> /*
>>> * This write to sysreg CONTEXTIDR_EL1 ensures we don't hit erratum
>>> * #852523 (Cortex-A57) or #853709 (Cortex-A72).
>>> * I.e DACR32_EL2 is not correctly synchronized.
>>> */
>>> WRITE_SYSREG(n->arch.contextidr, CONTEXTIDR_EL1);
>>> WRITE_SYSREG(n->arch.tpidr_el0, TPIDR_EL0);
>>> WRITE_SYSREG(n->arch.tpidrro_el0, TPIDRRO_EL0);
>>> WRITE_SYSREG(n->arch.tpidr_el1, TPIDR_EL1);
>>> if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
>>> {
>>> WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
>>> WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
>>> }
>>> #ifdef CONFIG_ARM_32
>>> WRITE_CP32(n->arch.joscr, JOSCR);
>>> WRITE_CP32(n->arch.jmcr, JMCR);
>>> #endif
>>> isb();
>>> /* VFP - call vfp_restore_state after writing on CPTR_EL2 + isb */
>>> vfp_restore_state(n);
>>> Maybe I misunderstood your preference, do you want me to put the write to CPTR_EL2
>>> right before the isb() that precedes vfp_restore_state?
>>
>> Yes please. Unless there is a reason to keep it "far away". The comments look good to me.
> 
> Ok, a question regarding README.LinuxPrimitives, is it some file taken from an automated tool?

I am not aware of any automated tools using it. All the re-syncs I have 
seen recently were manual.

> Because I see there is some kind of structure, how can I know if my syntax is correct?

There are some commands to help syncing when the file is very similar to 
Linux. In your case, I would follow what we did for the atomics as only 
some functions are the same.

Cheers,

-- 
Julien Grall

