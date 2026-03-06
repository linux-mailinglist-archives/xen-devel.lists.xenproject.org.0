Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA8WHVKtqmlTVQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:32:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2865821ECB9
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247583.1546145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySTj-000459-F4; Fri, 06 Mar 2026 10:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247583.1546145; Fri, 06 Mar 2026 10:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vySTj-00042I-CS; Fri, 06 Mar 2026 10:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1247583;
 Fri, 06 Mar 2026 10:32:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vySTh-00042A-Mj
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:32:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vySTd-008Cpu-2G;
 Fri, 06 Mar 2026 10:32:13 +0000
Received: from [2a02:8012:3a1:0:f0b8:207:419e:3d8a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vySTd-001jf1-1V;
 Fri, 06 Mar 2026 10:32:13 +0000
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
	bh=n2AQlK3H/NFh5jofcWFAoU3IfOBmTD8L1HI07DoC2Lg=; b=rgh54blBDGiLEWYwioO3k4AFbF
	BjNOpd2hSzOraBZHZdYU59MTgiPfX+E4Dueu5z5fcCMJMrPZf8CcBF+uXjQuzKwLmNVQO4BBfehXQ
	OwH+DMTj+JYyncaDUZ+O5bJbC+FDQFU03tjQazMvcmzh9/HHLaxXJzfyA+9aqSs24juI=;
Message-ID: <c360674d-2776-4c0e-9d65-7d70d593e23f@xen.org>
Date: Fri, 6 Mar 2026 10:32:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
Content-Language: en-GB
To: "Halder, Ayan Kumar" <ayankuma@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <9e222b10-f63a-4a5a-981c-36c438e3071c@suse.com>
 <0f775788-2637-4cfa-8ab0-a1e60d4d470b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0f775788-2637-4cfa-8ab0-a1e60d4d470b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2865821ECB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:jbeulich@suse.com,m:ayan.kumar.halder@amd.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 06/03/2026 10:09, Halder, Ayan Kumar wrote:
> Hi Jan,
> 
> On 06/03/2026 08:49, Jan Beulich wrote:
>> On 05.03.2026 20:57, Ayan Kumar Halder wrote:
>>> --- a/xen/arch/arm/include/asm/gic.h
>>> +++ b/xen/arch/arm/include/asm/gic.h
>>> @@ -237,7 +237,15 @@ enum gic_version {
>>>       GIC_V3,
>>>   };
>>> +/*
>>> + * GICv3 supports up to 16 LRs (4 bits in ICH_VTR_EL2), can use 
>>> uint16_t
>>> + * GICv2 supports up to 64 LRs (6 bits in GICH_VTR), requires uint64_t
>>> + */
>>> +#ifdef CONFIG_GICV3
>>> +DECLARE_PER_CPU(uint16_t, lr_mask);
>>> +#else
>>>   DECLARE_PER_CPU(uint64_t, lr_mask);
>>> +#endif
>> But GICV2 and GICV3 can be enabled at the same time, at which point 
>> you'd still
>> need 64 bits, I suppose.
> 
> I see. However, a safety certified Xen which is meant to support GICv3 
> hardware, will only have GICv3 enabled.
> 
> IOW having both GICV2 =y && GICV2 = y is out of scope for the safety use 
> cases.

If the patch is indented to be merged in mainline Xen, then you need to 
support the case where both GICV2 = y && GICV3 = y.

If the patch is not intended to be merged in mainline then it should 
have been marked as such so we can adjust our review.

Cheers,

-- 
Julien Grall


