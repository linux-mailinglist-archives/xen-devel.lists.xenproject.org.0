Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB7690600
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 12:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492331.761829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4fu-0007QQ-R6; Thu, 09 Feb 2023 11:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492331.761829; Thu, 09 Feb 2023 11:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4fu-0007Nh-NU; Thu, 09 Feb 2023 11:01:10 +0000
Received: by outflank-mailman (input) for mailman id 492331;
 Thu, 09 Feb 2023 11:01:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ4ft-0007Nb-Eh
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 11:01:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4fn-0001Oh-SN; Thu, 09 Feb 2023 11:01:03 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ4fn-0004zR-Lu; Thu, 09 Feb 2023 11:01:03 +0000
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
	bh=RW106rl1fQFXuUIoFYfUQuUJuq0X/pDgQA2BjdR4iCc=; b=SVpGzDQZgqqy60qrbYCq7Ts67a
	0BEOPV5it88qYHoDXwyxoRoAx3eUOJVFyijmFJpIE0SwUsWeQjGSpCyUtZND/EOOZYppq9+KdJ6J+
	s8DaiTqwgm2suqW/pZEQddMCGH6GlHlF3bb0FOFj4NUfybi/Y8BmOp801Mm9d1E7Oaq0=;
Message-ID: <76b615ea-f899-76fb-6e50-98bd071ebf60@xen.org>
Date: Thu, 9 Feb 2023 11:01:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 31/40] xen/mpu: disable FIXMAP in MPU system
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-32-Penny.Zheng@arm.com>
 <a19dba22-1e75-473d-dba8-cc676b6594aa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a19dba22-1e75-473d-dba8-cc676b6594aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 10:10, Jan Beulich wrote:
> On 13.01.2023 06:29, Penny Zheng wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -13,9 +13,10 @@ config ARM
>>   	def_bool y
>>   	select HAS_ALTERNATIVE if !ARM_V8R
>>   	select HAS_DEVICE_TREE
>> +	select HAS_FIXMAP if !ARM_V8R
>>   	select HAS_PASSTHROUGH
>>   	select HAS_PDX
>> -	select HAS_PMAP
>> +	select HAS_PMAP if !ARM_V8R
>>   	select IOMMU_FORCE_PT_SHARE
>>   	select HAS_VMAP if !ARM_V8R
> 
> Thinking about it - wouldn't it make sense to fold HAS_VMAP and HAS_FIXMAP
> into a single HAS_MMU?

I think it would make sense.

Furthermore, this patch would be better towards the start of the series.

Cheers,

-- 
Julien Grall

