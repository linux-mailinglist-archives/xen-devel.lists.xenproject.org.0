Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5C5B33D3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404001.646299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaIJ-0001M5-MY; Fri, 09 Sep 2022 09:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404001.646299; Fri, 09 Sep 2022 09:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaIJ-0001JC-IV; Fri, 09 Sep 2022 09:27:27 +0000
Received: by outflank-mailman (input) for mailman id 404001;
 Fri, 09 Sep 2022 09:27:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWaII-0001J6-Tn
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:27:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaII-0005vC-FR; Fri, 09 Sep 2022 09:27:26 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaII-0008Pg-9C; Fri, 09 Sep 2022 09:27:26 +0000
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
	bh=+MshMKp5wy0LTvlN+g4l+lhQ7Yy6sESqRFmzSc/zp3c=; b=sFYWp3FIC50ZGjjtgWA7pLNiRQ
	j8WoYTRTdNPuPHfvh648/cdn/IkuQzXFW8e2+78YLmOhfSXV+p7WHSSqPwrbW8sFmzyvY8QT3xgGT
	Lr7T7SBto4Nfh2Ki9lTB5kXzXOnzgUG6WmVZG/ZSXNdfx8XgvVI8y4TeNgtStH9dqOjw=;
Message-ID: <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
Date: Fri, 9 Sep 2022 10:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com>
 <20220908135513.1800511-8-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop>
 <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/09/2022 08:45, Bertrand Marquis wrote:
>>
>> It should be:
>>
>> /*
>> * TODO:
>> *
>>
>> I think this is good to go. The two minor style issues could be fixed on
>> commit. I haven't committed to give Julien & Bertrand another chance to
>> have a look.
> 
> I think that it is ok to fix those on commit and I am ok with the rest so:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

This series doesn't build without !CONFIG_STATIC_SHM:

   UPD     include/xen/compile.h
  Xen 4.17-unstable
make[1]: Nothing to be done for `include'.
make[1]: `arch/arm/include/asm/asm-offsets.h' is up to date.
   CC      common/version.o
   LD      common/built_in.o
   CC      arch/arm/domain_build.o
arch/arm/domain_build.c: In function ‘make_shm_memory_node’:
arch/arm/domain_build.c:1445:1: error: no return statement in function 
returning non-void [-Werror=return-type]
  }
  ^
cc1: all warnings being treated as errors
make[2]: *** [arch/arm/domain_build.o] Error 1
make[1]: *** [arch/arm] Error 2
make: *** [xen] Error 2

This is because...

>>> +         * - xen,offset: (borrower VMs only)
>>> +         *   64 bit integer offset within the owner virtual machine's shared
>>> +         *   memory region used for the mapping in the borrower VM
>>> +         */
>>> +        res = fdt_property_u64(fdt, "xen,offset", 0);
>>> +        if ( res )
>>> +            return res;
>>> +
>>> +        res = fdt_end_node(fdt);
>>> +        if ( res )
>>> +            return res;
>>> +    }
>>> +
>>> +    return res;
>>> +}
>>> +#else
>>> +static int __init make_shm_memory_node(const struct domain *d,
>>> +                                       void *fdt,
>>> +                                       int addrcells, int sizecells,
>>> +                                       const struct meminfo *mem)
>>> +{
>>> +    ASSERT_UNREACHABLE();

... there is a missing 'return -ENOTSUPP' here. While this is simple 
enough to fix, this indicates to me that this version was not tested 
with !CONFIG_STATIC_SHM.

As this is the default option, I will not commit until I get 
confirmation that some smoke was done.

Cheers,

-- 
Julien Grall

