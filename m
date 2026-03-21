Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPuJGKJ0vmmZQAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2026 11:36:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4992E4C49
	for <lists+xen-devel@lfdr.de>; Sat, 21 Mar 2026 11:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258611.1552410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3tff-0000WW-KH; Sat, 21 Mar 2026 10:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258611.1552410; Sat, 21 Mar 2026 10:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3tff-0000Tx-Ct; Sat, 21 Mar 2026 10:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1258611;
 Sat, 21 Mar 2026 10:35:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1w3tfd-0000To-Qq
 for xen-devel@lists.xenproject.org; Sat, 21 Mar 2026 10:35:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w3tfc-002AZW-2i;
 Sat, 21 Mar 2026 10:35:04 +0000
Received: from [2a02:8012:3a1:0:46:5a6f:bd3e:6c81]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w3tfc-005B2F-1o;
 Sat, 21 Mar 2026 10:35:04 +0000
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
	bh=jUpMezpGODoFu+Hi3WjVWW5R4Eqn42nXq8qQmVCK5Kw=; b=NouUXY45Rx0bB4Qll9ZPSn93cj
	LX7FLd1WXZ7kuJaw6J4j+2onA0r7o2cDFoFljqMPaV21BnyjyHBi4j7luUNVnzU5Wpy21Ccz0ILT3
	ABraHDVTnlIfwq3L3pokr0kgFaW20N2AAPHxt+ww4dI3vq5KZRKpkXmxeAPAQGfP1HPY=;
Message-ID: <91968fdb-e0fb-43aa-9f8c-994ed733de6e@xen.org>
Date: Sat, 21 Mar 2026 10:34:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <3a3180b0f77d815e92c0c232a8f854d34ab7c2ea.1773860069.git.mykola_kvach@epam.com>
 <F2AB3928-C65E-43DC-80F0-1F2F4DDC8037@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F2AB3928-C65E-43DC-80F0-1F2F4DDC8037@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:email,xen.org:mid,patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE4992E4C49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On 19/03/2026 07:47, Bertrand Marquis wrote:
> Hi Mykola,
> 
>> On 18 Mar 2026, at 19:56, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
>> using Wn, only the least significant 32 bits are significant and the
>> upper 32 bits must be ignored by the implementation.
>>
>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
>> argument registers as an error. Instead, they should be discarded when
>> decoding the arguments.
>>
>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
>> implementation defined when entering from AArch32. Xen zeros them on
>> entry, but that guarantee is only relevant for 32-bit domains.
>>
>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
>> arguments via PSCI_ARG32(), while keeping the SMC64 handling unchanged.
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
>> ---
>> xen/arch/arm/vpsci.c | 15 +++++++++------
>> 1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
>> index 7ba9ccd94b..1e844ed571 100644
>> --- a/xen/arch/arm/vpsci.c
>> +++ b/xen/arch/arm/vpsci.c
>> @@ -303,9 +303,10 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>>      case PSCI_0_2_FN32_CPU_ON:
>>      case PSCI_0_2_FN64_CPU_ON:
>>      {
>> -        register_t vcpuid = PSCI_ARG(regs, 1);
>> -        register_t epoint = PSCI_ARG(regs, 2);
>> -        register_t cid = PSCI_ARG(regs, 3);
>> +        bool smc32 = (fid == PSCI_0_2_FN32_CPU_ON);
>> +        register_t vcpuid = smc32 ? PSCI_ARG32(regs, 1) : PSCI_ARG(regs, 1);
>> +        register_t epoint = smc32 ? PSCI_ARG32(regs, 2) : PSCI_ARG(regs, 2);
>> +        register_t cid = smc32 ? PSCI_ARG32(regs, 3) : PSCI_ARG(regs, 3);
> 
> It might be nicer to modify PSCI_ARG to take a convention argument instead of
> redoing the same test everywhere, this would make the code nicer and ensure no PSCI_ARG
> would have been forgotten.

I would definitely agree with that. But...

> 
> At the end all those conventions are coming from smccc so we could:
> - use smccc_is_conv_64(fid) from smccc.h to get 32 vs 64
> - use smccc_get_fn to get the function id without the convention and reduce the number of entries
> in the switch

I am not sure about this suggestion. Not all 32-bit call have a matching 
64-bit call (e.g. PSCI_VERSION).

Also, it seems that so far the function ID is always matching between 
the two convention, it is unclear whether this is guaranteed.

Cheers,

-- 
Julien Grall


