Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492141D84C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 13:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199777.354036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtp0-0002gw-NK; Thu, 30 Sep 2021 11:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199777.354036; Thu, 30 Sep 2021 11:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtp0-0002e7-Iv; Thu, 30 Sep 2021 11:01:50 +0000
Received: by outflank-mailman (input) for mailman id 199777;
 Thu, 30 Sep 2021 11:01:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlQV=OU=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVtoy-0002e1-MM
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 11:01:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ce596c9c-21dd-11ec-bd45-12813bfff9fa;
 Thu, 30 Sep 2021 11:01:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38CD7106F;
 Thu, 30 Sep 2021 04:01:47 -0700 (PDT)
Received: from [10.57.19.250] (unknown [10.57.19.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED71A3F793;
 Thu, 30 Sep 2021 04:01:44 -0700 (PDT)
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
X-Inumbo-ID: ce596c9c-21dd-11ec-bd45-12813bfff9fa
Subject: Re: [PATCH] xen/arm: Expose the PMU to the guests
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Julien Grall <jgrall@amazon.com>
References: <20210930092651.1350-1-michal.orzel@arm.com>
 <17d393c9-b249-cccf-e360-054b66466143@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <6d9738c8-eadd-b85c-fd3c-1d48dc52ecf0@arm.com>
Date: Thu, 30 Sep 2021 13:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17d393c9-b249-cccf-e360-054b66466143@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 30.09.2021 12:40, Andrew Cooper wrote:
> On 30/09/2021 10:26, Michal Orzel wrote:
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 4b1e3028d2..4a75203b9f 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -2843,6 +2843,18 @@ Currently, only the "sbsa_uart" model is supported for ARM.
>>  
>>  =back
>>  
>> +=item B<vpmu=BOOLEAN>
>> +
>> +Specifies whether to enable the access to PMU registers by disabling
>> +the PMU traps.
>> +
>> +This change does not expose the full PMU to the guest.
>> +Currently there is no support for virtualization, interrupts, etc.
>> +
>> +Enabling this option may result in potential security holes.
>> +
>> +If this option is not specified then it will default to B<false>.
> 
> There are rather better ways of phrasing this...
> 
> It isn't "maybe security holes".  There are two salient points.
> 
> 1) vPMU, by design and purpose, exposes system level performance
> information to the guest.  Only to be used by sufficiently privileged
> domains (however the system admin cares to draw this particular line).
> 
> 2) Feature is experimental, and thus might explode on you.  Bugfixes
> welcome.
> 
Ok I will provide more description.
>> +
>>  =head3 x86
>>  
>>  =over 4
>> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
>> index b9ba16d698..c6694e977d 100644
>> --- a/tools/include/libxl.h
>> +++ b/tools/include/libxl.h
>> @@ -502,6 +502,13 @@
>>   */
>>  #define LIBXL_HAVE_X86_MSR_RELAXED 1
>>  
>> +/*
>> + * LIBXL_HAVE_ARM_VPMU indicates the toolstack has support for enabling
>> + * the access to PMU registers by disabling the PMU traps. This is done
>> + * by setting the libxl_domain_build_info arch_arm.vpmu field.
>> + */
>> +#define LIBXL_HAVE_ARM_VPMU 1
> 
> Please make this generic, not ARM-specific.
> 
Ok, I will.
> The domctl flag is (correctly) common, and x86 could do with this too,
> as well as other architectures.
> 
> Don't worry about plumbing the x86 side to work - that's a little more
> involved, and can be done at a later date.
> 
> 
> However, you do need Xen to report the availability of vPMU on the
> hardware as a prerequisite.  The toolstack needs to be able to know
> whether XEN_DOMCTL_CDF_pmu will be accepted so it can error out in a
> useful way on hardware lacking the capabilities.
> 
> You probably want to follow the example in
> a48066d25c652aeecafba5a3f33e77ad9a9c07f6
> 
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 96696e3842..a55ceb81db 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
>>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>>  #define _XEN_DOMCTL_CDF_nested_virt   6
>>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>> +/* Should we expose the vPMU to the guest? */
>> +#define _XEN_DOMCTL_CDF_pmu           7
>> +#define XEN_DOMCTL_CDF_pmu            (1U << _XEN_DOMCTL_CDF_pmu)
>>  
>>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
>> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_pmu
> 
> Without an adjustment in the Ocaml bindings, the ABI check will fail.
> 
You're right. I forgot about that. 
> ~Andrew
> 

Cheers,
Michal

