Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AE200630
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 12:26:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmEDO-0008Kl-10; Fri, 19 Jun 2020 10:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4t/=AA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jmEDM-0008Kg-OT
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 10:25:40 +0000
X-Inumbo-ID: 3901a3bc-b217-11ea-bb5e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3901a3bc-b217-11ea-bb5e-12813bfff9fa;
 Fri, 19 Jun 2020 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gXfD+L0aycXZvm7GG3dvd8WMtQK0meque3tAx6JuIgU=; b=blRaPhUkAtp1Bk7I0GDz4runvB
 Fszv3xFSDuVW/6bOd5UTybeIHltDvdegfih2lcQrI9euwCLseqRNs3A5XvPdi2kTC/nR7OjaUsRIm
 3B+odK6olwy+35+k7ZULxk+LEVOjccXTliDgQOV0fI5UrGOsCL8dzje5GLh/+juh1BrU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmEDL-0004JV-Im; Fri, 19 Jun 2020 10:25:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmEDL-0002UK-Bf; Fri, 19 Jun 2020 10:25:39 +0000
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org> <878sgk2bst.fsf@epam.com>
 <8d2f3475-4191-fa80-f476-e72af73e0559@xen.org> <87h7v71ixf.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c5af5b0c-eb18-04a5-80e9-99054eeb192e@xen.org>
Date: Fri, 19 Jun 2020 11:25:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87h7v71ixf.fsf@epam.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Volodymyr,

On 19/06/2020 10:52, Volodymyr Babchuk wrote:
>>>>> OP-TEE represents this null memory reference as a TMEM parameter with
>>>>> buf_ptr == NULL. This is the only case when we should allow TMEM
>>>>> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
>>>>
>>>> IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the buffer
>>>> at address 0" but with the flag cleared, it would mean "return the
>>>> size". Am I correct?
>>>
>>> Not exactly. This flag does not affect behavior for buffers with address
>>> NULL. In any case, this would not mean "return the size" to
>>> OP-TEE. This is because OP-TEE works as a transport between CA and TA
>>> and it does not assign any meaning to client buffers. But certainly,
>>> null buffer will mean "return the size" for some TAs, as described in
>>> GlobalPlatform specification.
>>
>> Does it mean a guest TA may potentially access address 0?
> 
> TA is running in S-EL0. That buffer with PA=0x0 will be not mapped in TA
> address space at all. So, if TA will try to access address 0, it
> will be terminated with data abort.
> 
>> I am asking that because 0 can be a valid host physical address. We
>> are currently carving out 0 from the heap allocator to workaround a
>> bug, but there is no promise this address will be used by the boot
>> allocator and therefore Xen.
>>
> 
> Well, this is a potential issue in OP-TEE. It does not treat 0 as a
> valid address. So, in that rare case, when REE will try to use 0
> as a correct address for data buffer, OP-TEE will not map it into
> TA address space, instead it will pass NULL to TA, so TA will think that
> no buffer was provided.

Thanks! That's reassuring. Although, I think we may still need to 
prevent MFN 0 to be allocated for a guest using OP-TEE. So they don't 
end up with weird failure.

I don't think this is an issue so far, but this may change with 
Stefano's dom0less series to support direct mapping.

Cheers,

-- 
Julien Grall

