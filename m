Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tMbrE12sMWroowUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 22:04:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D36950E9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 22:04:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=gf3tpIvk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1339625.1600825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa1J-0007YB-JD; Tue, 16 Jun 2026 20:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339625.1600825; Tue, 16 Jun 2026 20:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZa1J-0007Vo-GJ; Tue, 16 Jun 2026 20:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1339625;
 Tue, 16 Jun 2026 20:04:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wZa1H-0007Vc-OF
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 20:04:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa1H-00Cmln-1o;
 Tue, 16 Jun 2026 20:04:23 +0000
Received: from [2a02:8012:3a1:0:adbb:f4c5:7acb:2fe1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wZa1G-00FgPM-26;
 Tue, 16 Jun 2026 20:04:23 +0000
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
	bh=BH2ZTDIPleMrEo1XxBTNQepvG47nd7ZF5On1M6/07Os=; b=gf3tpIvkevkNVM1Llh1g9jKAVs
	RoieNjE5EObZ+fLa0Ougu4VQR1cwM7Jn8b1FgIw7Z8Q3KXN1fUUkGOrmZwcF6KHILjxANldkiGxQ8
	vr7xPnODVfcabTG2QImXdXsHl6/s1+95nJsOipWKDBszq/P8mN3aqY+viMndS0Mpnt7w=;
Message-ID: <dd60f194-ab26-4287-98f8-e7a035ecf2e8@xen.org>
Date: Tue, 16 Jun 2026 21:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
 <6d1806aa-b009-407a-9a7a-476f9f4deb70@xen.org>
 <f7e7f42c-43f1-436a-9d06-ab44619f2da0@epam.com>
 <648f587f-8621-472d-9b2c-e88fe11444a4@xen.org>
 <8c57e619-7b37-49b9-ae55-67490956d12c@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c57e619-7b37-49b9-ae55-67490956d12c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,xen.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C47D36950E9

Hi Milan,

On 09/06/2026 00:06, Milan Djokic wrote:
>>>>> +#define DWORDS_BYTES        8
>>>>> +#define ARM_SMMU_IIDR_VAL   0x12
>>>>
>>>> I am not sure which implementer this is referring to. But how do you
>>>> plan to handle errata? Are we sure they can always be handled by Xen?
>>>>
>>>
>>> This is currently a dummy value used to avoid triggering guest driver
>>> errata/quirk paths. I will replace it with a more meaningful value.
>>> Using the Arm implementer ID with the remaining fields cleared should be
>>> sufficient.
>>
>> I am not sure to understand why would that value be unused. Do you have
>> more details?
>>
> 
> I think that the IIDR is always used by the guest driver during 
> initialization to identify the implementer/product revision and enable 
> any required workarounds.
> 
> If that is the usage you are referring to, then using a generic IIDR 
> value would prevent the guest driver from activating any implementer- 
> specific workaround paths.
> 
>>>
>>> My expectation is that errata handling should remain in Xen rather than
>>> the guest.
>>
>> I am not fully convinced you will be able to apply all the errata in the
>> hypervisor. At least with close to no cost.
>>
> 
> Yes, this is potentially problematic. However, at the moment I am not 
> sure what the alternative would be, as I think that guest-side errata 
> handling could be applied incorrectly due to the emulation layer.

I think the risk is limited. But we could always check whether Xen is 
running in the errata handler.

Anyway, I guess we could leave this for now. But this would want to a be 
a TODO as I think we want to address it before the stage-1 SMMU is 
(security) supported.

[...]

>>>>> +    }
>>>>> +
>>>>>         return IO_HANDLED;
>>>>>     }
>>>>>     static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>>>>                                  register_t *r, void *priv)
>>>>>     {
>>>>> +    struct virt_smmu *smmu = priv;
>>>>> +    uint64_t reg;
>>>>> +
>>>>> +    switch ( info->gpa & 0xffff )
>>>>> +    {
>>>>> +    case VREG32(ARM_SMMU_IDR0):
>>>>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
>>>>
>>>> As the page-table will be used by the HW, shouldn't TTF reflect what 
>>>> the
>>>> HW supports? This would allow the vIOMMU to work for 32-bit domains.
>>>>
>>>
>>> If my understanding is correct, Xen SMMU driver only supports AArch64
>>> table format, so I think that we can't advertise 32-bit table format in
>>> the emulation layer even if the hardware supports it.
>>
>> Do you mind pointing me to the code? The page-tables are shared between
>> the SMMU and the CPU. So we ought to support both.
>>
> 
> The reason I assumed only the AArch64 format should be advertised is 
> that the Xen SMMU driver currently appears to require AArch64 table 
> format support during device probe.
> 
> In arm_smmu_device_hw_probe() (xen/drivers/passthrough/arm/smmu-v3.c), 
> the handling is:
> 
> /* We only support the AArch64 table format at present */
> switch (FIELD_GET(IDR0_TTF, reg)) {
> case IDR0_TTF_AARCH32_64:
>      smmu->ias = 40;
>      fallthrough;

Wouldn't this allow 32-bit format? Even if we decide to disallow it what 
would prevent the guest to use it (we can't rely on the guest to follow 
the IDR)? Are we preventing configure the stage-1 SMMU for 32-bit domain?

-- 
Julien Grall


