Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE82A966C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 13:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20733.46745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1AQ-0002aV-SF; Fri, 06 Nov 2020 12:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20733.46745; Fri, 06 Nov 2020 12:48:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb1AQ-0002a6-P7; Fri, 06 Nov 2020 12:48:34 +0000
Received: by outflank-mailman (input) for mailman id 20733;
 Fri, 06 Nov 2020 12:48:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kb1AP-0002a1-61
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:48:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abb86215-f62f-47e1-b118-499187f904a3;
 Fri, 06 Nov 2020 12:48:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 103F5ABDE;
 Fri,  6 Nov 2020 12:48:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kb1AP-0002a1-61
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 12:48:33 +0000
X-Inumbo-ID: abb86215-f62f-47e1-b118-499187f904a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id abb86215-f62f-47e1-b118-499187f904a3;
	Fri, 06 Nov 2020 12:48:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604666911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QjH8qlKKtvwtdr/8PQ5bf4BBJvKDVNwlvbztpTDPSrQ=;
	b=ZDYhx+cOt3tVxiRISqyJtKuCaWqIcf81w7EQPjreEiZxFmvufGYYA5ktXWzJB12eva8eDD
	vNSITNdNtVdPJNmpIXHUN7LUTpc+DDl8EQvnCpUVRXto9HvWBZKQu5ANwx+KvDzoqrgIBb
	zBOQYYbAwFrmrXZY6jlhE6G6dsNYHac=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 103F5ABDE;
	Fri,  6 Nov 2020 12:48:31 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
 <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com>
 <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
 <73189992-EC5B-493D-BB23-6DFB2F11A580@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0f9c2db-a58c-b1d3-9e1a-09b994f1b1d3@suse.com>
Date: Fri, 6 Nov 2020 13:48:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <73189992-EC5B-493D-BB23-6DFB2F11A580@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.11.2020 12:43, Rahul Singh wrote:
> Hello Jan,
> 
>> On 4 Nov 2020, at 3:49 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.11.2020 16:43, Jan Beulich wrote:
>>> On 03.11.2020 16:59, Rahul Singh wrote:
>>>> --- a/xen/drivers/pci/Kconfig
>>>> +++ b/xen/drivers/pci/Kconfig
>>>> @@ -1,3 +1,12 @@
>>>>
>>>> config HAS_PCI
>>>> 	bool
>>>> +
>>>> +config PCI_ATS
>>>> +	bool "PCI ATS support"
>>>> +	default y
>>>> +	depends on X86 && HAS_PCI
>>>> +	---help---
>>>> +	 Enable PCI Address Translation Services.
>>>> +
>>>> +	 If unsure, say Y.
>>>
>>> Support for "---help---" having gone away in Linux, I think we'd
>>> better not add new instances. Also indentation of help content
>>> typically is by a tab and two spaces. With these two adjusted
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Initially I wanted to merely reply indicating I'd be fine making
>> these changes while committing, but there are two more things
>> (and I withdraw my R-b): For one, isn't strict pci_dev's ats
>> field now unused when !PCI_ATS? If so, if should get an #ifdef
>> added.
> 
> Yes, I tried to #ifdef ats field in struct pci_dev but after doing that I found that I have to modify the 
> code related to x86  iotlb flush, as I have limited knowledge about how iotlb flush works for 
> x86 so I decided not to modify that part of the code. 
> 
> I already compiled the x86 with !PCI_ATS and is having same behaviour as command line options "ats=false” with unused struct pci_dev ats field.
> 
>> And then, what exactly is it in ats.c that's x86-specific?
>> Shouldn't the whole file instead be moved one level up, and be
>> usable by Arm right away?
> 
> Yes, you are right ats.c file is not x86 specific, but not tested for ARM so I thought we will move the ats.c file to common code once ATS code is tested/implemented for ARM.
> 
> disable_ats_device() is referenced in common "passthrough/pci.c" file  and defined in "x86/ats.c" therefore I decided to introduce the PCI_ATS option for X86. 
> As I am not sure on ARM how the ATS functionality is going to be implemented. 
> 
> There are three ways to fix the compilation error for ARM related to disable_ats_device() function.
> 
> 1. Introduce the PCI_ATS config option for x86 and enabled it by default for X86 and having same behaviour as  command line options for !PCi_ATS  as "ats=false”

I'll be happy to see the config option retained, but that's
orthogonal to the goals here.

> 2. disable_ats_device() is called by iommu_dev_iotlb_flush_timeout () that is as per my understanding is x86 specific ( not sure please confirm).
> Move iommu_dev_iotlb_flush_timeout () to "passthrough/x86/iommu.c” now and move the ats.c file to common code once ATS code is tested for ARM.

While the function is currently used by VT-d code only, I again
don't see what's x86-specific about it. Hence ...

> 3. Move x86/ats.c file one level up , fixed compilation error now and if on ARM platforms going to implement the ATS functionality different from
> x86 we have to move ats.c file back to x86 directory 

... I view this as the only "option" among the ones you name.

Jan

