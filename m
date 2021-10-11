Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D745D42899D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 11:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205569.360914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrYD-0007i1-00; Mon, 11 Oct 2021 09:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205569.360914; Mon, 11 Oct 2021 09:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZrYC-0007fb-Sv; Mon, 11 Oct 2021 09:24:52 +0000
Received: by outflank-mailman (input) for mailman id 205569;
 Mon, 11 Oct 2021 09:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZrYB-0007fV-OL
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 09:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZrY9-0001bU-2x; Mon, 11 Oct 2021 09:24:49 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZrY8-0006vh-SA; Mon, 11 Oct 2021 09:24:49 +0000
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
	bh=tiD73+zFhx9HEa6ct08nchW05Eha72SmOGHTNdR7MzI=; b=Wjo7gii/Ku3QLODHOf3LhJCIJZ
	cNu+RuYKsnlFFcRX4S0iJE/8rf8pXtTqDCzRghxZQyHGGZm227cDUxQ+mV9Jdp64BDIUDhEADaWcN
	15gu6nRL/nkZ4/BMNERJOTc/TctusUbZKUz6jz/fO/bMXq4HKpnLIFJIZX7DShgt6I6Q=;
Message-ID: <d3794451-63c6-cba0-fcbf-d76b124aca29@xen.org>
Date: Mon, 11 Oct 2021 10:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 08/10/2021 22:46, Stefano Stabellini wrote:
> On Fri, 8 Oct 2021, Julien Grall wrote:
>> Hi Andrew,
>>
>> On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:
>>        On 06/10/2021 18:40, Rahul Singh wrote:
>>        > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>>        > Reject the use of this new flag for x86 as VPCI is not supported for
>>        > DOMU guests for x86.
>>        >
>>        > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>        > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>        > Acked-by: Christian Lindig <christian.lindig@citrix.com>
>>
>>        I'm afraid this logic is broken.
>>
>>        There's no matching feature to indicate to the toolstack whether
>>        XEN_DOMCTL_CDF_vpci will be accepted or not.  The usual way of doing
>>        this is with a physinfo_cap field.
>>
>>
>> I am slightly puzzled by this. I am assuming you are referring to XENVER_get_features which AFAICT is a stable interface. So why should we
>> use it to describe the presence of an unstable interface?
>>
>>
>>        This flag needs using in Patch 10 to reject attempts to create a VM with
>>        devices when passthrough support is unavailable.
>>
>>
>> May I ask why we can't rely on the hypervisor to reject the flag when suitable?
>>
>>
>>        Ian, for the 4.16 release, this series either needs completing with the
>>        additional flag implemented, or this patch needs reverting to avoid us
>>        shipping a broken interface.
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
>      error("Sorry - PCI not supported")
> 
> So that the user gets a clear informative error back rather than a
> generic VM creation failure. 

I can understand this request. However...

Also, this is a requirement for the stable
> hypercall interface.

... leaving aside the fact that domctl is clearly not stable today, the 
flag would be rejected on hypervisor not supporting vPCI. So I don't 
really see how this is a requirement for the stable hypercall interface.

Would you mind providing more details?

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
>      error("Sorry - PCI not supported")
> 
> or temporarily remove XEN_DOMCTL_CDF_vpci until PCI passthrough gets
> finalized.

Cheers,


> 

-- 
Julien Grall

