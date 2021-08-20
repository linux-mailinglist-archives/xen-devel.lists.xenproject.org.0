Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D993F2E2B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 16:35:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169560.309748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5bb-0006py-3D; Fri, 20 Aug 2021 14:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169560.309748; Fri, 20 Aug 2021 14:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5ba-0006mr-Vs; Fri, 20 Aug 2021 14:34:46 +0000
Received: by outflank-mailman (input) for mailman id 169560;
 Fri, 20 Aug 2021 14:34:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH5bZ-0006ml-Hc
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 14:34:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH5bY-0004JY-GB; Fri, 20 Aug 2021 14:34:44 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH5bY-0003Sh-9N; Fri, 20 Aug 2021 14:34:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cF04O8AFn9oyP+EjTMf7BULsEC/mKak+muIdJIm4AA4=; b=ukkyumCVB0R1muBi74T1EnOiEX
	Atgw3Pz5J4/AUIVFuKTaY8bWL3W3deS8g2IGC5JHkMYXvFOyC9D/oJ0Hip9nHY/IFYy2x0PTEDzOy
	DIEYA/+YrgiE+v0iOhchmZibX4bGRQWuNS3iW6PQH8kiLAQ3Ihz/Z3j2pwWVJtaWKFcE=;
Subject: Re: [PATCH v1 09/14] xen/arm: Add cmdline boot option "pci=on"
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <e279636ea47b7d06056c2f70e76900b8d0b30ee9.1629366665.git.rahul.singh@arm.com>
 <731afb80-bb68-0c66-4f0f-341a46118770@xen.org>
 <DBFA6CEF-F8BC-4516-B609-99985F0C4698@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b17f7970-ec4c-96e8-1a1c-0d3039d4d43e@xen.org>
Date: Fri, 20 Aug 2021 15:34:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DBFA6CEF-F8BC-4516-B609-99985F0C4698@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/08/2021 13:19, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

> 
>> On 19 Aug 2021, at 1:31 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 19/08/2021 13:02, Rahul Singh wrote:
>>> Add cmdline boot option "pci=on" to enable/disable the PCI init during
>>> boot.
>>
>> I read this as "PCI" will be either disabled/enabled for the platform. Whereas, I think it will be used to decide whether Xen discover PCI and PCI passthrough is supported or not.
> 
> Yes. I will modify the option to "pci-passthrough== <boolean>"
>>
>> Can you also clarify why a user would want to select "pci=off"?
> 
> As pci-passthrough support emulate the PCI devices for DOM0 also, I thought if someone want to
> boot the DOM0 without emulating the PCI device in XEN and wants to have direct access to device.

Dom0 will always have direct access to the PCI device. The only 
difference is whether the access to the hostbridge and config space will 
be trapped by Xen. I expect the both to mainly happen during boot and 
therefore the overhead will be limited.

> 
> I am ok to drop this patch if you feel adding the option is not required at all.
One of the reason I could see this option to be useful is to figure out 
if an issue occurs because of the hostbridge emulation. Yet, I am still 
not fully convinced adding an option is worth it.

Jan and others, any opinions?

Cheers,

-- 
Julien Grall

