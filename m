Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5E4BB6B5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 11:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275298.471112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL0KZ-0003nT-Vh; Fri, 18 Feb 2022 10:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275298.471112; Fri, 18 Feb 2022 10:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL0KZ-0003kX-SN; Fri, 18 Feb 2022 10:17:39 +0000
Received: by outflank-mailman (input) for mailman id 275298;
 Fri, 18 Feb 2022 10:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nL0KY-0003kR-8N
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 10:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nL0KW-00077N-5V; Fri, 18 Feb 2022 10:17:36 +0000
Received: from [54.239.6.187] (helo=[192.168.5.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nL0KV-0000Ex-V5; Fri, 18 Feb 2022 10:17:36 +0000
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
	bh=2ShuNqr5mAyxiQ7Lsz5GN1KJDBSZ8apPCs8GDRThhO0=; b=QS39UQ0+TUnUYgnu73Jegcn72o
	nMD5xFftB5p508MYWEDmnie9Ta5EwM4wMvV3SxpkwHKEaLpjOQYRHIRipUxNvLNxV9hDG5xdmcFyI
	5xBHV8ntq1Tbu5bzGQHFE9FqHlACtFo3Y1UrEZpnH9UvKdHX3bIS+hPnSknKBKvvwxsg=;
Message-ID: <15ada062-2ec5-d8ff-6bd7-5c580939accc@xen.org>
Date: Fri, 18 Feb 2022 10:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
 <ab6d8d13-30cf-d322-668e-f3f5aaa56824@xen.org>
 <20220218091632.GA1486420@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220218091632.GA1486420@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/02/2022 09:16, Oleksii Moisieiev wrote:
> Hi Julien,

Hi Oleksii,

> On Thu, Feb 17, 2022 at 03:20:36PM +0000, Julien Grall wrote:
>>>        xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>>> index 093bb4403f..f1f19bf711 100644
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>>        if ( iommu )
>>>        {
>>> -        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
>>> +        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )
>>
>> XEN_DOMCTL_IOMMU_MAX will be defined as:
>>
>> (1U << _XEN_DOMCTL_IOMMU_force_iommu)
>>
>> This means the shift will do the wrong thing. However, AFAICT, this new
>> option will only be supported by Arm and likely only for platform device for
>> the time being.
> 
> Thanks, I will fix that.
> 
>>
>> That said, I am not convinced this flag should be per-domain in Xen.
>> Instead, I think it would be better to pass the flag via the device assign
>> domctl.
> 
> Do you mean that it's better to set this flag per device, not per
> domain? > This will require setting this flag for each device which should
> require either changing the dtdev format in dom.cfg or setting
> xen,force-assign-without-iommu in partial device-tree.
> 
> Both of those ways will complicate the configuration. As was mentioned
> before, we don't want to make domain configuration more complicated.
> What do you think about that?

We have two interfaces here:
   1) User -> tools
   2) tools -> Xen

We can chose different policy for each interface.

For the tools -> Xen interface, I think this should be per device 
(similar to XEN_DOMCTL_DEV_RDM_RELAXED).

For the User -> tools, I am open to discussion. One advantage with per 
device is the user explicitely vet each device. So it is harder to 
passthrough a device wrongly.

But I agree this also complicates the interface. What do other thinks?

>>
>>>            return -EOPNOTSUPP;
>>> @@ -542,7 +545,7 @@ int iommu_do_domctl(
>>>    #endif
>>>    #ifdef CONFIG_HAS_DEVICE_TREE
>>> -    if ( ret == -ENODEV )
>>> +    if ( ret == -ENOSYS )
>>
>> AFAICT, none of the code (including callee) before ret have been modified.
>> So why are you modifying the check here?
>>
> 
> Because this check will fail if we have CONFIG_HAS_DEVICE_TREE define,
> but do not have CONFIG_HAS_PCI and iommu_do_dt_domctl will not be
> called.

Below the implementation of iommu_do_domctl() on staging:

int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
{
     int ret = -ENODEV;

     if ( !is_iommu_enabled(d) )
         return -EOPNOTSUPP;

#ifdef CONFIG_HAS_PCI
     ret = iommu_do_pci_domctl(domctl, d, u_domctl);
#endif

#ifdef CONFIG_HAS_DEVICE_TREE
     if ( ret == -ENODEV )
         ret = iommu_do_dt_domctl(domctl, d, u_domctl);
#endif

     return ret;
}

'ret' is initialized to -ENODEV. So for !CONFIG_HAS_PCI, then ret will 
not be changed. Therefore the current check is correct.

AFAICT, your patch is setting 'ret' so I don't expect any change here.

> Same thing if switch/case inside iommu_do_pci_domctl go to default and
> return -ENOSYS. This part looked strange for me. But I will definitely
> go through this part once again.
We use the same sub-op to assign/deassign a PCI and "DT" device. So we 
are not interested in -ENOSYS but -ENODEV that would be returned by the 
checks:

if ( domct->u.assign_device.dev != XEN_DOMCTL_DEV_PCI )

At the moment, there are no sub-op specific to "DT" device. So it is not 
necessary for us to check -ENOSYS yet.

I haven't looked at the rest of the series to see if we need it. But if 
we do, then I think the check should be extended in the patch that 
requires it.

Cheers,

-- 
Julien Grall

