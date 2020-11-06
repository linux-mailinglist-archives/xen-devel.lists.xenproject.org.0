Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A662A9740
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 14:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20798.46812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb27t-0008Mw-Vv; Fri, 06 Nov 2020 13:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20798.46812; Fri, 06 Nov 2020 13:50:01 +0000
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
	id 1kb27t-0008Lb-Sp; Fri, 06 Nov 2020 13:50:01 +0000
Received: by outflank-mailman (input) for mailman id 20798;
 Fri, 06 Nov 2020 13:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kb27s-0008Ge-08
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:50:00 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 236f252f-8772-4165-9ad0-6ad73faa5ce8;
 Fri, 06 Nov 2020 13:49:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kb27n-0003r5-Pe; Fri, 06 Nov 2020 13:49:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kb27n-0001tn-Gf; Fri, 06 Nov 2020 13:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kb27s-0008Ge-08
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:50:00 +0000
X-Inumbo-ID: 236f252f-8772-4165-9ad0-6ad73faa5ce8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 236f252f-8772-4165-9ad0-6ad73faa5ce8;
	Fri, 06 Nov 2020 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gYQdDbfk1aRo4aL0nUewX53ao+8afLDZRoOioQFGaA0=; b=dGEDZlOucJiL/r7Z1DxXeJqdHf
	UuhrhX2arUyFOtx5C2fdM9eXJ7MI7VrDvw4SU70ydO70b1vquMMreGA/1YS052WPJ+tMmF64lIOL7
	8vMhRkHD4Gg9XAMp6Aj+3ymdqtw8qwoHqpHCvGvsYkUJ193JFE8ah/u0krS5HGHU3lOY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kb27n-0003r5-Pe; Fri, 06 Nov 2020 13:49:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kb27n-0001tn-Gf; Fri, 06 Nov 2020 13:49:55 +0000
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
 <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com>
 <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
 <73189992-EC5B-493D-BB23-6DFB2F11A580@arm.com>
 <b0f9c2db-a58c-b1d3-9e1a-09b994f1b1d3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <297e3080-316d-72fa-dd4e-7f858c6b9db8@xen.org>
Date: Fri, 6 Nov 2020 13:49:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b0f9c2db-a58c-b1d3-9e1a-09b994f1b1d3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 06/11/2020 12:48, Jan Beulich wrote:
> On 06.11.2020 12:43, Rahul Singh wrote:
>> Hello Jan,
>>
>>> On 4 Nov 2020, at 3:49 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 04.11.2020 16:43, Jan Beulich wrote:
>>>> On 03.11.2020 16:59, Rahul Singh wrote:
>>>>> --- a/xen/drivers/pci/Kconfig
>>>>> +++ b/xen/drivers/pci/Kconfig
>>>>> @@ -1,3 +1,12 @@
>>>>>
>>>>> config HAS_PCI
>>>>> 	bool
>>>>> +
>>>>> +config PCI_ATS
>>>>> +	bool "PCI ATS support"
>>>>> +	default y
>>>>> +	depends on X86 && HAS_PCI
>>>>> +	---help---
>>>>> +	 Enable PCI Address Translation Services.
>>>>> +
>>>>> +	 If unsure, say Y.
>>>>
>>>> Support for "---help---" having gone away in Linux, I think we'd
>>>> better not add new instances. Also indentation of help content
>>>> typically is by a tab and two spaces. With these two adjusted
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Initially I wanted to merely reply indicating I'd be fine making
>>> these changes while committing, but there are two more things
>>> (and I withdraw my R-b): For one, isn't strict pci_dev's ats
>>> field now unused when !PCI_ATS? If so, if should get an #ifdef
>>> added.
>>
>> Yes, I tried to #ifdef ats field in struct pci_dev but after doing that I found that I have to modify the
>> code related to x86  iotlb flush, as I have limited knowledge about how iotlb flush works for
>> x86 so I decided not to modify that part of the code.
>>
>> I already compiled the x86 with !PCI_ATS and is having same behaviour as command line options "ats=false” with unused struct pci_dev ats field.
>>
>>> And then, what exactly is it in ats.c that's x86-specific?
>>> Shouldn't the whole file instead be moved one level up, and be
>>> usable by Arm right away?
>>
>> Yes, you are right ats.c file is not x86 specific, but not tested for ARM so I thought we will move the ats.c file to common code once ATS code is tested/implemented for ARM.
>>
>> disable_ats_device() is referenced in common "passthrough/pci.c" file  and defined in "x86/ats.c" therefore I decided to introduce the PCI_ATS option for X86.
>> As I am not sure on ARM how the ATS functionality is going to be implemented.
>>
>> There are three ways to fix the compilation error for ARM related to disable_ats_device() function.
>>
>> 1. Introduce the PCI_ATS config option for x86 and enabled it by default for X86 and having same behaviour as  command line options for !PCi_ATS  as "ats=false”
> 
> I'll be happy to see the config option retained, but that's
> orthogonal to the goals here.
> 
>> 2. disable_ats_device() is called by iommu_dev_iotlb_flush_timeout () that is as per my understanding is x86 specific ( not sure please confirm).
>> Move iommu_dev_iotlb_flush_timeout () to "passthrough/x86/iommu.c” now and move the ats.c file to common code once ATS code is tested for ARM.
> 
> While the function is currently used by VT-d code only, I again
> don't see what's x86-specific about it. Hence ...
The ATS code looks arch-agnostic. So I agree with this statement.

> 
>> 3. Move x86/ats.c file one level up , fixed compilation error now and if on ARM platforms going to implement the ATS functionality different from
>> x86 we have to move ats.c file back to x86 directory
> 
> ... I view this as the only "option" among the ones you name.

+1.

Cheers,

-- 
Julien Grall

