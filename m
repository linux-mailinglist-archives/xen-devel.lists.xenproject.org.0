Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22501424F23
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203399.358521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOeh-0000Lq-50; Thu, 07 Oct 2021 08:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203399.358521; Thu, 07 Oct 2021 08:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOeh-0000K2-1e; Thu, 07 Oct 2021 08:21:31 +0000
Received: by outflank-mailman (input) for mailman id 203399;
 Thu, 07 Oct 2021 08:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1KR=O3=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mYOef-0000Jw-Kv
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:21:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c4a58857-e691-442f-9f5f-acc310020ccf;
 Thu, 07 Oct 2021 08:21:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9C01FB;
 Thu,  7 Oct 2021 01:21:27 -0700 (PDT)
Received: from [10.57.18.238] (unknown [10.57.18.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2993F766;
 Thu,  7 Oct 2021 01:21:23 -0700 (PDT)
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
X-Inumbo-ID: c4a58857-e691-442f-9f5f-acc310020ccf
Subject: Re: [PATCH v2 3/3] xen: Expose the PMU to the guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-4-michal.orzel@arm.com>
 <45bcc00d-95f1-fe20-a68b-de2eb793dc5e@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <8682dadb-cb7d-8291-33eb-4988d0d2227f@arm.com>
Date: Thu, 7 Oct 2021 10:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <45bcc00d-95f1-fe20-a68b-de2eb793dc5e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07.10.2021 10:03, Jan Beulich wrote:
> On 06.10.2021 12:58, Michal Orzel wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>  
>> +    if ( config->flags & XEN_DOMCTL_CDF_vpmu )
>> +    {
>> +        dprintk(XENLOG_INFO, "vpmu support not ready yet\n");
>> +        return -EINVAL;
>> +    }
> 
> I consider this message potentially misleading (as x86 does have vPMU
> support, it merely doesn't get enabled this way). But isn't this redundant
> with ...
> 
>> @@ -534,6 +535,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>  
>> +    if ( vpmu && !vpmu_is_available )
>> +    {
>> +        dprintk(XENLOG_INFO, "vpmu requested but not available\n");
>> +        return -EINVAL;
>> +    }
> 
> ... this? (This message is again potentially misleading.)
> 
Ok. vpmu_is_available is false for x86 so the check in x86's arch_sanitise_domain_config is redundant.
I will fix it. When it comes to the message itself "vpmu requested but not available".
Does the following sound better for you?
"vpmu requested but the platform does not support it"
If not, can you please suggest a better message?
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
>>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>>  #define _XEN_DOMCTL_CDF_nested_virt   6
>>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>> +/* Should we expose the vPMU to the guest? */
>> +#define _XEN_DOMCTL_CDF_vpmu           7
>> +#define XEN_DOMCTL_CDF_vpmu            (1U << _XEN_DOMCTL_CDF_vpmu)
> 
> Like for the earlier patch, I think we should stop with the bad habit of
> defining both the bit position and the mask separately.
> 
Ok. I can change it. However there are lots of other places in Xen (e.g. asm-x86/hvm/irq.h)
when such methodology is used. But I agree with you and I will change it.

> Jan
> 
Cheers,
Michal

