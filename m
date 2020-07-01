Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9B2111E7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 19:27:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqgV5-0007eR-PL; Wed, 01 Jul 2020 17:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xe6U=AM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqgV4-0007dZ-R0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 17:26:22 +0000
X-Inumbo-ID: fb16a39d-bbbf-11ea-874c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb16a39d-bbbf-11ea-874c-12813bfff9fa;
 Wed, 01 Jul 2020 17:26:21 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7x2vJkvdfqzPxkWHWzUVXJZqP+KkxFI2dqA03j03LrwtWNdSlG5NGzq0ZzOefKaDy3ReGrEjV+
 FHj2KszmViTo1Tpuk+0liUsCpHf9HvoGUfjyiBGb70huTnSutly0JkRzx79ZJFiCnKgQfjBQ2l
 aOPvhRSiDEfNLzHFkXrzOxJXZs8R5MNMYz2o+OOtlLQiZStV18GE0qqvmPR8zrL8a0/v8p1bsG
 L2vzRYoL75HurC0a+4c6ebwVlKkVyyaoi7wLBJ/b4bwouIQpET+W+SaQJGdMlCcgqvG+VIaXLl
 o/w=
X-SBRS: 2.7
X-MesageID: 21628612
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,301,1589256000"; d="scan'208";a="21628612"
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <7302dbfcd07dfaad9e50bb772673e588fcc4de67.1593519420.git.michal.leszczynski@cert.pl>
 <85416128-a334-4640-7504-0865f715b3a2@xen.org>
 <48c59780-bedb-ff08-723c-be14a9b73e6b@citrix.com>
 <f2aa4cf9-0689-82c0-cb6c-55d55ecbd5c1@xen.org>
 <a9a33ba1-b121-5e6f-b74c-7d2a60c84b13@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a7187837-495f-56a5-a8d0-635a53ac9234@citrix.com>
Date: Wed, 1 Jul 2020 18:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a9a33ba1-b121-5e6f-b74c-7d2a60c84b13@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 01/07/2020 17:18, Julien Grall wrote:
>
>
> On 01/07/2020 17:17, Julien Grall wrote:
>>
>>
>> On 01/07/2020 17:06, Andrew Cooper wrote:
>>> On 01/07/2020 16:12, Julien Grall wrote:
>>>> On 30/06/2020 13:33, Michał Leszczyński wrote:
>>>>> @@ -305,7 +311,6 @@ static int vmx_init_vmcs_config(void)
>>>>>                   SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
>>>>>                   SECONDARY_EXEC_XSAVES |
>>>>>                   SECONDARY_EXEC_TSC_SCALING);
>>>>> -        rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>>>>            if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
>>>>>                opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
>>>>>            if ( opt_vpid_enabled )
>>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>>>> index 7cc9526139..0a33e0dfd6 100644
>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -82,6 +82,8 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>>>>>      vcpu_info_t dummy_vcpu_info;
>>>>>    +bool_t vmtrace_supported;
>>>>
>>>> All the code looks x86 specific. So may I ask why this was implemented
>>>> in common code?
>>>
>>> There were some questions directed specifically at the ARM maintainers
>>> about CoreSight, which have gone unanswered.
>>
>> I can only find one question related to the size. Is there any other?
>>
>> I don't know how the interface will look like given that AFAICT the
>> buffer may be embedded in the HW. We would need to investigate how to
>> differentiate between two domUs in this case without impacting the
>> performance in the common code.
>
> s/in the common code/during the context switch/
>
>> So I think it is a little premature to implement this in common code
>> and always compiled in for Arm. It would be best if this stay in x86
>> code.

I've just checked with a colleague.  CoreSight can dump to a memory
buffer - there's even a decode library for the packet stream
https://github.com/Linaro/OpenCSD, although ultimately it is platform
specific as to whether the feature is supported.

Furthermore, the choice isn't "x86 vs ARM", now that RISCv support is
on-list, and Power9 is floating on the horizon.

For the sake of what is literally just one byte in common code, I stand
my original suggestion of this being a common interface.  It is not
something which should be x86 specific.

~Andrew

