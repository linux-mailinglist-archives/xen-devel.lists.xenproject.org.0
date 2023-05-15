Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E519E702AD7
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 12:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534706.831998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyVgD-0003Mg-7O; Mon, 15 May 2023 10:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534706.831998; Mon, 15 May 2023 10:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyVgD-0003KF-3m; Mon, 15 May 2023 10:43:49 +0000
Received: by outflank-mailman (input) for mailman id 534706;
 Mon, 15 May 2023 10:43:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyVgB-0003K9-Fv
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 10:43:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyVgB-0004OY-4k; Mon, 15 May 2023 10:43:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyVgA-0007Dw-Ti; Mon, 15 May 2023 10:43:47 +0000
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
	bh=LNoOzTB0CC3lyktdTwz+xxTG0I9DDNmDJw1pgKuSVhc=; b=Iz8seSAh5Nqoa3BnGgQk43W9aH
	zbaF0yl6xpOC1m7cN+ddCs39C5c8QIXTK9HAfmgPbJEw+K/2OZSh8MhQ85hHKoF0lQf3wH0IKfauj
	399InR3tXnfBSdjTxThwdwHGj3qEotFeGLpO4wLSrbde27acO3RCCb/XiSktnfAjPbFM=;
Message-ID: <701fb2b6-d552-0e3d-d108-a73863160b25@xen.org>
Date: Mon, 15 May 2023 11:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
 <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
 <175d5e01-6258-edcc-bddd-05ff9e1eb547@xen.org>
 <72fa0686-2703-6682-fe06-2fca14ff1986@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <72fa0686-2703-6682-fe06-2fca14ff1986@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/05/2023 11:30, Ayan Kumar Halder wrote:
>> AFAICT, this approach would be incorrect because we wouldn't take into 
>> account any restriction from the SMMU susbystem (it may support less 
>> than what the processor support).
> 
> By the restriction from SMMU subsystem, I think you mean 
> p2m_restrict_ipa_bits().

Yes.

> 
> As I can see, p2m_restrict_ipa_bits() gets invoked much later than 
> setup_virt_paging().

I am afraid this is not correct. If you look at setup.c, you will notice 
that iommu_setup() is called before setup_virt_paging(). There is a 
comment on top of the former call explaining the ordering.

Cheers,

-- 
Julien Grall

