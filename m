Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037536692BE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476923.739368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGAw-0004pe-7l; Fri, 13 Jan 2023 09:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476923.739368; Fri, 13 Jan 2023 09:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGAw-0004mF-44; Fri, 13 Jan 2023 09:16:38 +0000
Received: by outflank-mailman (input) for mailman id 476923;
 Fri, 13 Jan 2023 09:16:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGGAu-0004m8-OZ
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:16:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGAq-0005Fu-Bm; Fri, 13 Jan 2023 09:16:32 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGAq-0002uK-4q; Fri, 13 Jan 2023 09:16:32 +0000
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
	bh=ZGKf6fIGE2gy8ttV8y3ZORWY2suqBf57lLpjVK0Yhlc=; b=1zhs7qSpXsZ/RpAQu/u7YXdOtb
	gokDF5itbiwal6sAKol24GAZEPZJMRO/Awap2HuWGdKFIUe9IeBcDfuekGvwVdUfbtgRk92Wrmy0K
	kOcUYpPGwELNmPfTs52oZjw0p7dwqRYCVpx/FwFehrgF6Y6rgpj6Utkk94J+iHpbZzH0=;
Message-ID: <3e3b8ada-3fb0-2bbf-e6a2-1aea712132e1@xen.org>
Date: Fri, 13 Jan 2023 09:16:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/41] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <d88834a2-dde3-5438-e5a2-2bdfb25be4c3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d88834a2-dde3-5438-e5a2-2bdfb25be4c3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 08:54, Jan Beulich wrote:
> On 13.01.2023 06:28, Penny Zheng wrote:
>>   xen/arch/x86/Kconfig                      |    1 +
>>   xen/common/Kconfig                        |    6 +
>>   xen/common/Makefile                       |    2 +-
>>   xen/include/xen/vmap.h                    |   93 +-
> 
> I would like to take a look at these non-Arm changes, but I view it as not
> very reasonable to wade through 40 patches just to find those changes.

Right, but that's the purpose of the different CC list on each patch. 
AFAICT, Penny respected that and you should have been CC to the three 
patches (#30, #31, #32) touching common/x86 code.

> The
> titles don't look to help in that either. For such pretty large series,
> could you please help non-Arm folks by pointing out in some way where the
> non-Arm changes actually are?

See above. I am not entirely sure what else you are requested here. Do 
you want Penny to be explicit and list the patch modified in the cover 
letter?

Cheers,

-- 
Julien Grall

