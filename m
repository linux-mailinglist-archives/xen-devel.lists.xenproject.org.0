Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BBC1CC039
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 12:12:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXMSd-0003G9-9c; Sat, 09 May 2020 10:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYqh=6X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jXMSc-0003G4-38
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 10:11:58 +0000
X-Inumbo-ID: 840e224a-91dd-11ea-a0d8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 840e224a-91dd-11ea-a0d8-12813bfff9fa;
 Sat, 09 May 2020 10:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xuXBYx3OsRINyPoJ3zzADil0gvkKS1x7O3jX++2b3mA=; b=Rc93M1zRpGrI/2qbCX0nr9TkAA
 BOYVVTaYXKJr51QwTiROdacUGRfSzAKREN08kEEu1irIVi8PFeCS24XcXgfGqUc/R888p8/TjsWGO
 0CYEgiO2wyhW9qpbScuCI2eZoKpUVAw/iGSRUOT11W7sUAlcSRxvdVFkgfrDf9D/XN4c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jXMSb-00084G-F6; Sat, 09 May 2020 10:11:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jXMSb-0008Gf-8J; Sat, 09 May 2020 10:11:57 +0000
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native UART
 address for vPL011
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
 <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
 <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
 <7176c924-eb16-959e-53cd-c73db88f65db@xen.org>
 <alpine.DEB.2.21.2005081601400.26167@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <8c01cb1a-0745-3eca-a45d-09c9297163ce@xen.org>
Date: Sat, 9 May 2020 11:11:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005081601400.26167@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 09/05/2020 01:07, Stefano Stabellini wrote:
> On Fri, 1 May 2020, Julien Grall wrote:
>> On 01/05/2020 02:26, Stefano Stabellini wrote:
>>> On Wed, 15 Apr 2020, Julien Grall wrote:
>>>> Hi Stefano,
>>>>
>>>> On 15/04/2020 02:02, Stefano Stabellini wrote:
>>>>> We always use a fix address to map the vPL011 to domains. The address
>>>>> could be a problem for domains that are directly mapped.
>>>>>
>>>>> Instead, for domains that are directly mapped, reuse the address of the
>>>>> physical UART on the platform to avoid potential clashes.
>>>>
>>>> How do you know the physical UART MMIO region is big enough to fit the
>>>> PL011?
>>>
>>> That cannot be because the vPL011 MMIO size is 1 page, which is the
>>> minimum right?
>>
>> No, there are platforms out with multiple UARTs in the same page (see sunxi
>> for instance).
> 
> But if there are multiple UARTs sharing the same page, and the first one
> is used by Xen, there is no way to assign one of the secondary UARTs to
> a domU. So there would be no problem choosing the physical UART address
> for the virtual PL011.

AFAICT, nothing prevents a user to assign such UART to a dom0less guest 
today. It would not be safe, but it should work.

If you want to make it safe, then you would need to trap the MMIO access 
so they can be sanitized. For a UART device, I don't think the overhead 
would be too bad.

Anyway, the only thing I request is to add sanity check in the code to 
help the user diagnostics any potential clash.

Cheers,

-- 
Julien Grall

