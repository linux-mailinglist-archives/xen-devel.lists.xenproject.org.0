Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I7xD5fP8GnDYwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:17:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885A5487AAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296461.1572871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkBo-0002w0-8Q; Tue, 28 Apr 2026 15:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296461.1572871; Tue, 28 Apr 2026 15:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHkBo-0002uS-5S; Tue, 28 Apr 2026 15:17:32 +0000
Received: by outflank-mailman (input) for mailman id 1296461;
 Tue, 28 Apr 2026 15:17:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wHkBn-0002uK-8Z
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:17:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wHkBm-00689m-2i;
 Tue, 28 Apr 2026 15:17:30 +0000
Received: from [2a02:8012:3a1:0:41a7:c05:58cb:6653]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wHkBm-006xf3-27;
 Tue, 28 Apr 2026 15:17:30 +0000
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
	bh=Szftq+YgYXu7Xtqxo3GkkEYoQPptF7lz71Be+Th/64g=; b=cfHdR8KUv4CV2gElmLaUuN2yGo
	gcGNBUTC7kneMCG9pUk5jMdb1ih4Xz3dh0eWLw8lIFlQtjLy2i9TMpN2I6lEwSxkELTUhtNiMAiak
	n9p1LL4hzi8NJatGfz7xusVA5hRVqEh4iRz+FgwylY3ubVdh4INfBhvzg0H7laWU86WU=;
Message-ID: <8653c501-a990-48cf-9e38-0a6eb99a1cd7@xen.org>
Date: Tue, 28 Apr 2026 16:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: "Halder, Ayan Kumar" <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
 <83786d8b-d57a-4c79-8e8b-7115d4276568@xen.org>
 <f834927b-a5a7-4b83-8e0a-d24263554e26@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <f834927b-a5a7-4b83-8e0a-d24263554e26@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 885A5487AAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,xen.org:dkim,xen.org:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Ayan,

On 18/04/2026 08:28, Halder, Ayan Kumar wrote:
> 
> On 14/04/2026 03:06, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 18/03/2026 23:09, Ayan Kumar Halder wrote:
>>> One key requirement of Xen functional safety is to reduce the number
>>> of lines of code to be safety certified. Besides, a safety certified
>>> Xen requires a static hardware configuration to be defined. This static
>>> hardware configuration is described as per the test hardware/emulator
>>> hardware configuration against which Xen is verified.
>>>
>>> Introduce GICV3_NR_LRS with the two aims in mind:
>>
>> Out of interest, why is this limited to GICv3?
> 
> This was just my starting point of investigation. My intention is to 
> have as much as a static defined hardware configuration, so that the 
> code that cannot be tested on the hardware can be eliminated by one of 
> the many ways (DCE, Kconfig or actual code removal).
> 
> The advantage of having a static defined configuration is that the 
> system integrator will have the full control on how to configure Xen for 
> a specific hardware platform. And we try to reduce as much as possible 
> any code that cannot be used due to hardware limitations.

Thanks for the answer. I was asking because I wonder whether the name of 
config should be more generic so it can be used for GICV2. But I guess 
we can rename it afterwards.

> 
>>
>>> 1. User should set the number of GICV3 list registers as per the test
>>> hardware so that the unwanted code can be removed using GCC's dead
>>> code elimination or preprocessor's config.
>>
>> We discussed this offline, I am not fully convinced you can rely on 
>> dead code elimination to always remove the BUG() in 
>> gicv3_ich_read_lr(). If you want to rely on dead code eliminitation, 
>> then you will want to call a function which have a prototype defined 
>> but not implemented (similar to what we do for bitops with 
>> __bad_atomic_read()) which would fail a link time if the compiler 
>> didn't remove the code.
> 
> If you are ok, we can break this into 2 patches
> 
> 1. Introduce GICV3_NR_LRS and make sure it is used consistently in the 
> code. IOW, it should address the comments that Luca and you provided.
> 
> 2. Implement a way for compiler to do DCE based on GICV3_NR_LRS.

Yes please, so we can merge patch #1 earlier.

> 
>>
>>> 2. By doing #1, one can ensure that there is no untested code due to
>>> unsupported hardware platform and thus there is no safety impact due
>>> to untested code.
>>>
>>> However if the user does not set GICV3_NR_LRS, then it is set to 0.
>>> Thus Xen will fallback to the default scenario (i.e. read the hardware
>>> register to determine the number of LRS).
>>>
>>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>>> This ensures that if the hardware does not support more than 4 LRs
>>> (for example), the code accessing LR 4-15 is never reached. The
>>> compiler can eliminate the unsupported cases as the switch case uses a
>>> constant conditional.
>>>
>>> 2. RAZ/WI for the unsupported LRs.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Changelog:
>>>
>>> v1 - 1. s/lrs/LRS
>>> 2. Implement RAZ/WI instead of panic
>>>
>>> Few comments which were not addressed
>>> 1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
>>> unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
>>> compiler from doing dead code elimination as the switch condition cannot
>>> be evaluated at compile time.
>>> I am not sure how to get around this issue.
>>>
>>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>>   xen/arch/arm/gic-v3.c | 14 ++++++++++++--
>>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 2f2b501fda..6540013f97 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>>     endmenu
>>>   +config GICV3_NR_LRS
>>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>>
>> Supported by who? The hardware? Xen? Asking, because I could forsee an 
>> integrator wanted to limit the number of LRs to something smaller than 
>> what the HW supports (in a lot of cases, 2 LRs is sufficient).
> 
> Ack
> 
>   ... "Number of GICv3 Link Registers used" if EXPERT
> 
> So it implies a decision to be taken by the system integrator. Does it 
> sound ok ?

Either "used" or "allowed" would be fine.

Cheers,

-- 
Julien Grall


