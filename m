Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671D3425F0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 20:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99375.188974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNKZu-00019c-CX; Fri, 19 Mar 2021 19:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99375.188974; Fri, 19 Mar 2021 19:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNKZu-00019D-95; Fri, 19 Mar 2021 19:14:34 +0000
Received: by outflank-mailman (input) for mailman id 99375;
 Fri, 19 Mar 2021 19:14:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNKZs-000198-CG
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 19:14:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNKZs-000240-2P; Fri, 19 Mar 2021 19:14:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNKZr-0007f6-Qh; Fri, 19 Mar 2021 19:14:31 +0000
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
	bh=JOhUg8bR9Vk5ydA3hCDnEtFp1auHpIkAhcpi/2PSF80=; b=DpruOTWrDeRGjyMt3nqOVnrwro
	NptjmFBI7c3Lez9NHL3Hc4KQGofTIMTJAMt/qHwLINXf39nSoqT7z6BGdwUeUJDMruWPSL6/eH9GY
	Qv0sX3ZcF/v8nD25poTkmpK46Qrl7jUU0Sbb0sdV6HrJlTyOPBTJulXfQdqZ74ho+eCk=;
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210225235158.24001-1-sstabellini@kernel.org>
 <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com>
 <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s>
 <47d6b423-5414-f14a-2730-74834bfa18f5@oracle.com>
 <alpine.DEB.2.21.2103191050120.439@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <93f1fd99-456e-f7d9-aeda-d69ef0738761@xen.org>
Date: Fri, 19 Mar 2021 19:14:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103191050120.439@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/03/2021 17:53, Stefano Stabellini wrote:
> On Fri, 19 Mar 2021, Boris Ostrovsky wrote:
>> On 3/18/21 7:28 PM, Stefano Stabellini wrote:
>>>
>>> So, I'll follow you suggestion, keep the x86 side named as it is today,
>>> and provide a tiny wrapper so that we can still have an arch-neutral
>>> xen_swiotlb_detect function (on x86 just calls pci_xen_swiotlb_detect.)
>>
>>
>> But now on x86 side we end up with a routine that noone calls. And pci_xen_swiotlb_detect() becomes not __init and so it will have to stick around after boot for no good reason. (You could have made it __ref btw).
>>
>>
>> I think we should leave x86 alone. And if there is a declaration in include/xen/swiotlb-xen.h that's only relevant to ARM --- well, so be it. Or perhaps you can create arch/arm/include/asm/xen/swiotlb-xen.h
> 
> Yeah I wanted to avoid creating arch/arm/include/asm/xen/swiotlb-xen.h

If the header is going to be useed by arch/arm and arch/arm64, then it 
should be defined in include/xen/arm/ to avoid any packaging issue.

Cheers,

-- 
Julien Grall

