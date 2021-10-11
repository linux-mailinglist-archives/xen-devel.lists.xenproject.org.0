Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B5428C14
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205825.361229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtVL-0002EE-Gr; Mon, 11 Oct 2021 11:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205825.361229; Mon, 11 Oct 2021 11:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtVL-0002Bv-Dv; Mon, 11 Oct 2021 11:30:03 +0000
Received: by outflank-mailman (input) for mailman id 205825;
 Mon, 11 Oct 2021 11:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tf9x=O7=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mZtVJ-0001wn-GH
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:30:01 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a8fb7d6f-80a9-4867-95c1-b152ec312d12;
 Mon, 11 Oct 2021 11:30:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2A83ED1;
 Mon, 11 Oct 2021 04:29:59 -0700 (PDT)
Received: from [10.57.19.78] (unknown [10.57.19.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A823F66F;
 Mon, 11 Oct 2021 04:29:57 -0700 (PDT)
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
X-Inumbo-ID: a8fb7d6f-80a9-4867-95c1-b152ec312d12
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
 <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
 <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <8a58a981-f474-cf6d-f16a-46805384a776@arm.com>
Date: Mon, 11 Oct 2021 13:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 08.10.2021 23:46, Stefano Stabellini wrote:
> On Fri, 8 Oct 2021, Julien Grall wrote:
>> Hi Andrew,
>>
>> On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:
>>       On 06/10/2021 18:40, Rahul Singh wrote:
>>       > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>>       > Reject the use of this new flag for x86 as VPCI is not supported for
>>       > DOMU guests for x86.
>>       >
>>       > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>       > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>       > Acked-by: Christian Lindig <christian.lindig@citrix.com>
>>
>>       I'm afraid this logic is broken.
>>
>>       There's no matching feature to indicate to the toolstack whether
>>       XEN_DOMCTL_CDF_vpci will be accepted or not.  The usual way of doing
>>       this is with a physinfo_cap field.
>>
>>
>> I am slightly puzzled by this. I am assuming you are referring to XENVER_get_features which AFAICT is a stable interface. So why should we
>> use it to describe the presence of an unstable interface?
>>
>>
>>       This flag needs using in Patch 10 to reject attempts to create a VM with
>>       devices when passthrough support is unavailable.
>>
>>
>> May I ask why we can't rely on the hypervisor to reject the flag when suitable?
>>
>>
>>       Ian, for the 4.16 release, this series either needs completing with the
>>       additional flag implemented, or this patch needs reverting to avoid us
>>       shipping a broken interface.
>>
>>
>> I fail to see how the interface would be broken... Would you mind to describe a bit more what could go wrong with this interface?
> 
> 
> After chatting with Andrew on IRC, this is my understanding.
> 
> Today if pci=[] is specified in the VM config file then
> XEN_DOMCTL_CDF_vpci is added. If Xen doesn't support it, Xen returns
> an error but libxl/xl won't be able to tell exactly why it fails. So xl
> will end up printing a generic VM creation failure. Andrew would like to
> see something like the following in libxl:
> 
> if ( PCI_devices && !cap.vcpi )
>     error("Sorry - PCI not supported")
> 
> So that the user gets a clear informative error back rather than a
> generic VM creation failure. Also, this is a requirement for the stable
> hypercall interface.
> 
> 
> I think that's fine and we can implement this request easily by adding
> XEN_SYSCTL_PHYSCAP_vpci. Rahul or Bertrand, are you guys happy with
> doing that? Otherwise I could take it on.
> 
> 
> As a side note, given that PCI passthrough support is actually not yet
> complete on ARM, we could even just do the following in xl/libxl:
> 
> if ( PCI_devices )
>     error("Sorry - PCI not supported")
> 
> or temporarily remove XEN_DOMCTL_CDF_vpci until PCI passthrough gets
> finalized.
> 
As Rahul is on leave:
I'm ok to introduce XEN_SYSCTL_PHYSCAP_vpci. I did the same for vpmu so it's ok.
However the problem I have is about setting this cap.
On arm it is easy as we are not supporting vpci at the moment so the cap can be set to false.
But how to deal with this cap in x86 code? I'm not familiar with x86 so I'm asking for advice.

Cheers,
Michal

