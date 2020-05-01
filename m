Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EF1C0F2C
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 10:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUQjs-0007kH-OJ; Fri, 01 May 2020 08:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUQjr-0007kB-3d
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 08:09:39 +0000
X-Inumbo-ID: 19eb30a2-8b83-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19eb30a2-8b83-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U3K9cTwT20CMFOnPsRqWmK3gfZUiU6P5nia29a8XCgM=; b=RTrPUJA5AM9B3Zu6hjKTrYCdhn
 wT3djYWuNcSex+tTrw1/f82OM1gorVGVu+1B8Pn34mE7VcvUfSqV/o23hHdthHMdzGqnUilPCig4k
 xQXbt0oBcFg46TwrkPg3ZXuxatFSuo3KEfD+Y2QPZLMFhLstKAY6OJE86jGp1gsdPQR8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUQjo-0004WA-DD; Fri, 01 May 2020 08:09:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUQjo-0000Em-6O; Fri, 01 May 2020 08:09:36 +0000
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native UART
 address for vPL011
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
 <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
 <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7176c924-eb16-959e-53cd-c73db88f65db@xen.org>
Date: Fri, 1 May 2020 09:09:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/05/2020 02:26, Stefano Stabellini wrote:
> On Wed, 15 Apr 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 15/04/2020 02:02, Stefano Stabellini wrote:
>>> We always use a fix address to map the vPL011 to domains. The address
>>> could be a problem for domains that are directly mapped.
>>>
>>> Instead, for domains that are directly mapped, reuse the address of the
>>> physical UART on the platform to avoid potential clashes.
>>
>> How do you know the physical UART MMIO region is big enough to fit the PL011?
> 
> That cannot be because the vPL011 MMIO size is 1 page, which is the
> minimum right?

No, there are platforms out with multiple UARTs in the same page (see 
sunxi for instance).

> 
> 
>> What if the user want to assign the physical UART to the domain + the vpl011?
> 
> A user can assign a UART to the domain, but it cannot assign the UART
> used by Xen (DTUART), which is the one we are using here to get the
> physical information.
> 
> 
> (If there is no UART used by Xen then we'll fall back to the virtual
> addresses. If they conflict we return error and let the user fix the
> configuration.)

If there is no UART in Xen, how the user will know the addresses 
conflicted? Earlyprintk?

Cheers,

-- 
Julien Grall

