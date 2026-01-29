Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ7lEVJ8e2kQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:27:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC0B16C5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216717.1526659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTv9-00087X-TF; Thu, 29 Jan 2026 15:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216717.1526659; Thu, 29 Jan 2026 15:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlTv9-000852-QT; Thu, 29 Jan 2026 15:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1216717;
 Thu, 29 Jan 2026 15:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUPs=AC=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vlTv8-00084w-QE
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:26:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f00c221f-fd26-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:26:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B270E1576;
 Thu, 29 Jan 2026 07:26:45 -0800 (PST)
Received: from [10.1.36.12] (unknown [10.1.36.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCFE83F73F;
 Thu, 29 Jan 2026 07:26:50 -0800 (PST)
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
X-Inumbo-ID: f00c221f-fd26-11f0-9ccf-f158ae23cfc8
Message-ID: <5b7d587b-e8db-4211-939a-48c4fcd4dc37@arm.com>
Date: Thu, 29 Jan 2026 15:26:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/mpu: implement setup_virt_paging for MPU system
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Hari Limaye <hari.limaye@arm.com>
References: <20260119105022.3616126-1-harry.ramsey@arm.com>
 <899a572a-1ba6-4bc6-806e-d049b4ac3ce3@amd.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <899a572a-1ba6-4bc6-806e-d049b4ac3ce3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.39 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: D6EC0B16C5
X-Rspamd-Action: no action

On 27/01/2026 10:14, Orzel, Michal wrote:

>> For MPU system, we could have the following memory translation regime:
>> - PMSAv8-64 at both EL1/EL0 and EL2
>> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
>> The default option will be the second, unless the platform could not support,
>> which could be checked against MSA_frac bit in Memory Model Feature Register 0(
>> ID_AA64MMFR0_EL1).
> What's the reasoning behind it? Why do we prefer VMSA at EL1 rather than PMSA?
> AFAICT PMSA is a default and VMSA is optional, so logically PMSA should be
> preffered. We should also make it configurable I think, so that a user has a choice.

Can we introduce this as a device tree parameter since we may want to 
run multiple guests with one guest to use PMSA such as Zephyr and Linux 
to use VMSA?


>> -    BUG_ON("unimplemented");
>> +    uint64_t vtcr_el2 = 0, vstcr_el2 = 0;
>> +    bool p2m_vmsa = true;
>> +
>> +    /* PA size */
>> +    const unsigned int pa_range_info[] = { 32, 36, 40, 42, 44, 48, 52, 0, /* Invalid */ };
> 80 chars exceeded.
> Do we still need 0 here to denote invalid value?

It is possible for the architecture to be expanded with new features 
which increase the potential PA range (requiring additional support). 
Additionally for consistency this is how it is defined in MMU. Is there 
another reason why we should remove it?

>> +        vtcr_el2 |= VTCR_VS;
>> +
>> +    p2m_vmid_allocator_init();
>> +
>> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
> Where do we set NSA bit?

On ARMv8-R EL0, EL1 and EL2 all run in the secure state so we do not set 
that bit in this context.

Regarding the other comments, I plan on reworking/cleaning up the patch 
to address them and make the code/intents clearer.


Thanks,
Harry Ramsey


