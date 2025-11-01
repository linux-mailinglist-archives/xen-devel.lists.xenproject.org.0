Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83604C28536
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 19:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155098.1484682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFGGO-0002XC-D8; Sat, 01 Nov 2025 18:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155098.1484682; Sat, 01 Nov 2025 18:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFGGO-0002UX-AB; Sat, 01 Nov 2025 18:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1155098;
 Sat, 01 Nov 2025 18:23:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vFGGM-0002UR-7F
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 18:23:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFGGL-00Dl6m-1y;
 Sat, 01 Nov 2025 18:23:41 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFGGL-003mhD-1N;
 Sat, 01 Nov 2025 18:23:41 +0000
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
	bh=TMRuXbgCggR1YF7VDFbDu3l75eX6Jr1Ik5R/Hf++jQ4=; b=G0ONpZW4Fhp+1XNTf5IFb+MzDa
	abeAfBPv3cQUb2MeBA0JDL40U/lyF0AsbeJD1Fnjp7wvIoCoHobTIPKIQ9fISNF80aKhs/G/qsV2R
	rKevz14GpcJLUXCGyd7TFtGJBfSbx8TksHRZEl1J18PhYj4wfQLYm91kSTKmOvQx2zgc=;
Message-ID: <01527182-ccef-43a5-be55-a5450eb7919f@xen.org>
Date: Sat, 1 Nov 2025 18:23:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Limitations for Running Xen on KVM Arm64
Content-Language: en-GB
To: "haseeb.ashraf@siemens.com" <haseeb.ashraf@siemens.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "Bachtel, Andrew" <andrew.bachtel@siemens.com>,
 "fahad.arslan@siemens.com" <fahad.arslan@siemens.com>,
 "noor.ahsan@siemens.com" <noor.ahsan@siemens.com>,
 "brian.sheppard@siemens.com" <brian.sheppard@siemens.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <TYZPR06MB4580126B98C6A38AA710F597E6F8A@TYZPR06MB4580.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(+ the other Arm maintainers)

On 31/10/2025 13:01, haseeb.ashraf@siemens.com wrote:
> Hello,

Hi,

Before answering to the rest, would you be able to configure your e-mail 
client to quote with '>' and avoid top-posting? Otherwise, it will 
become quite difficult to follow the conversation after a few round.

> I have seen no such performance issue with nested KVM. For Xen, if this 
> can be relaxed from |vmalls12e1| to |vmalle1|, this would still be a 
> huge performance improvement. I used Ftrace to get execution time of 
> each of these handler functions:
> handle_vmalls12e1is() min-max = 1464441 - 9495486 us

To clarify, Xen is using the local TLB version. So it should be 
vmalls12e1. But it looks like KVM will treat it the same way and I 
wonder whether this could be optimized? (I don't know much about the KVM 
implementation though).

> 
> So, to summarize using HCR_EL2.FB (which Xen already enables?) and then 
> using vmalle1 instead of vmalls12e1 should resolve the issue-2 for vCPUs 
> switching on pCPUs.

I don't think HCR_EL2.FB would matter here.

> 
> Coming back to issue-1, what do you think about creating a batch version 
> of hypercall XENMEM_remove_from_physmap (other batch versions exist such 
> as for XENMEM_add_to_physmap) and doing the TLB invalidation only once 
> per this hypercall?

Before going into batching, do you have any data showing how often 
XENMEM_remove_from_physmap is called in your setup? Similar, I would be 
interested to know the number of TLBs flush within one hypercalls and 
whether the regions unmapped were contiguous.

In your previous e-mail you wrote:

 > During the creation of domu, first the domu memory is mapped onto 
dom0 domain, images are copied into it, and it is then unmapped. During 
unmapping, the TLB translations are invalidated one by one for each page 
being unmapped in XENMEM_remove_from_physmap hypercall. Here is the code 
snippet where the decision to flush TLBs is being made during removal of 
mapping.

Don't we map only the memory that is needed to copy the binaries? If 
not, then I would suggest to look at that first.

I am asking because even with batching, we may still send a few TLBs 
because:
    * We need to avoid long-running operations, so the hypercall may 
restart. So we will have to flush at mininum before every restart
    * The current way we handle batching is we will process one item at 
the time. As this may free memory (either leaf or intermediate 
page-tables), we will need to flush the TLBs first to prevent the domain 
accessing the wrong memory. This could be solved by keeping track of the 
list of memory to free. But this is going to require some work and I am 
not entirely sure this is worth it at the moment.

> I just realized that ripas2e1 is a range TLBI 
> instruction which is only supported after Armv8.4 indicated 
> by ID_AA64ISAR0_EL1.TLB == 2. So, on older architectures, full stage-2 
> invalidation would be required. For an architecture independent 
> solution, creating a batch version seems to be a better way.

I don't think we necessarily need a full stage-2 invalidation for 
processor not supporting range TLBI. We could use a series of TLBI 
IPAS2E1IS which I think is what TBLI range is meant to replace (so long 
the addresses are contiguous in the given space).

On the KVM side, it would be worth looking at whether the implementation 
can be optimized. Is this really walking block by block? Can it skip 
over large hole (e.g. if we know a level 1 entry doesn't exist, then we 
can increment by 1GB).

Cheers,

-- 
Julien Grall


