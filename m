Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2zMLMfooUWrlAAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:16:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7E73CFA9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 19:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=NWXW7QLX;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359698.1613161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiEpx-00055S-PX; Fri, 10 Jul 2026 17:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359698.1613161; Fri, 10 Jul 2026 17:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiEpx-00053X-M2; Fri, 10 Jul 2026 17:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1359698;
 Fri, 10 Jul 2026 17:16:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wiEpw-00053P-D6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:16:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wiEpw-00H0pV-0u;
 Fri, 10 Jul 2026 17:16:28 +0000
Received: from [2a02:8012:3a1:0:d925:4a60:fbf0:3a64]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wiEpv-006nv3-2d;
 Fri, 10 Jul 2026 17:16:27 +0000
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
	bh=7pihEpx57uvvhpXTLxePHNtQ3/fCRkCSYnRA/aE4Ggw=; b=NWXW7QLXRNOq0pxSuNaFPRbf2w
	uBA9xTkJBrupahEEOfyW1I13qMhB1GAJ4Ko8dL4b0pw+jbH1CWvs52QiNofJvc6oj3uF51ofkko5D
	CCCH/aNcCaIUGEIYZ2nwDDlIFeDfUv8NgaPlrbpcaw1SBIyJHhbIc28yHswHXnHTeH6I=;
Message-ID: <e94b3893-d3e2-46c9-abbe-cc123e624e48@xen.org>
Date: Fri, 10 Jul 2026 18:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm/mpu: Save/restore VTCR_EL2 on vCPU context switch
To: "Halder, Ayan Kumar" <ayankuma@amd.com>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-9-luca.fancellu@arm.com>
 <5dd152dd-c70e-4979-9ff4-8bb027bb2da6@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <5dd152dd-c70e-4979-9ff4-8bb027bb2da6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:from_mime,xen.org:dkim,xen.org:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14C7E73CFA9

Hi,

On 10/07/2026 17:08, Halder, Ayan Kumar wrote:
>> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
>> index a1ec9fcd6195..350cbd7ae94c 100644
>> --- a/xen/arch/arm/arm64/mpu/p2m.c
>> +++ b/xen/arch/arm/arm64/mpu/p2m.c
>> @@ -3,8 +3,12 @@
>>   #include <xen/bug.h>
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>> +#include <xen/sched.h>
>>   #include <asm/p2m.h>
>> +/* VTCR_EL2 value to be configured for the boot CPU. */
>> +register_t __read_mostly vtcr;
>> +
>>   void __init setup_virt_paging(void)
>>   {
>>       register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
>> @@ -58,6 +62,7 @@ void __init setup_virt_paging(void)
>>       else
>>           vtcr_el2 &= ~VTCR_VS;
>> +    vtcr = vtcr_el2;
>>       WRITE_SYSREG(vtcr_el2, VTCR_EL2);
>>       p2m_vmid_allocator_init();
>> @@ -89,6 +94,16 @@ void __init setup_virt_paging(void)
>>       panic("Hardware with no PMSAv8-64 support in any translation 
>> regime\n");
>>   }
>> +void p2m_save_vtcr(struct vcpu *p)
>> +{
>> +    p->arch.vtcr_el2 = READ_SYSREG(VTCR_EL2);
>> +}
>> +
> VTCR_EL2 is an EL2 register the guest cannot touch, and set_v8r_vtcr_msa()
> already fixes each vCPU's value at creation. Reading it back on every 
> save is
> redundant
I would at least consider adding an ASSERT() to confirm the two matches. 
This will catch any issues during debug build.

Cheers,

-- 
Julien Grall


