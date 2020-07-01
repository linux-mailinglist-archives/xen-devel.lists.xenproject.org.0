Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B928F21106C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 18:18:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqfR2-0001gq-6u; Wed, 01 Jul 2020 16:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rv6a=AM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqfR0-0001gZ-Rj
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 16:18:06 +0000
X-Inumbo-ID: 72259240-bbb6-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72259240-bbb6-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGcLBPxqIUkrZiJIKx9/dwoobGuMd2YvL+03LZJ/0oQ=; b=JmAYMD18ljQ3t0+trXLv7LAABV
 Rabo8k5AFuq3iO6bEcSFBxEGyWowskNMIeZ+mndLUOo15giIH1f0qN/0hNgui7KHaoo+VULMBjden
 +zPXC77vkcszVy9dawmJAKMJghoH9IST6/WzQGz2YpUDuN5/0ThnU94fNUAIhMy/uEg4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqfQu-0006UL-Lw; Wed, 01 Jul 2020 16:18:00 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqfQu-0002tH-Bs; Wed, 01 Jul 2020 16:18:00 +0000
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
 <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f2aa4cf9-0689-82c0-cb6c-55d55ecbd5c1@xen.org>
Date: Wed, 1 Jul 2020 17:17:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/07/2020 17:06, Andrew Cooper wrote:
> On 01/07/2020 16:12, Julien Grall wrote:
>> On 30/06/2020 13:33, Michał Leszczyński wrote:
>>> @@ -305,7 +311,6 @@ static int vmx_init_vmcs_config(void)
>>>                   SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
>>>                   SECONDARY_EXEC_XSAVES |
>>>                   SECONDARY_EXEC_TSC_SCALING);
>>> -        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>            if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
>>>                opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
>>>            if ( opt_vpid_enabled )
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 7cc9526139..0a33e0dfd6 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>>>      vcpu_info_t dummy_vcpu_info;
>>>    +bool_t vmtrace_supported;
>>
>> All the code looks x86 specific. So may I ask why this was implemented
>> in common code?
> 
> There were some questions directed specifically at the ARM maintainers
> about CoreSight, which have gone unanswered.

I can only find one question related to the size. Is there any other?

I don't know how the interface will look like given that AFAICT the 
buffer may be embedded in the HW. We would need to investigate how to 
differentiate between two domUs in this case without impacting the 
performance in the common code.

So I think it is a little premature to implement this in common code and 
always compiled in for Arm. It would be best if this stay in x86 code.

Cheers,

-- 
Julien Grall

