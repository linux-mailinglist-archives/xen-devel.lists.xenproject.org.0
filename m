Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A066C5A9E0A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396879.637249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTo5E-0008BI-T8; Thu, 01 Sep 2022 17:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396879.637249; Thu, 01 Sep 2022 17:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTo5E-00088l-Pp; Thu, 01 Sep 2022 17:34:28 +0000
Received: by outflank-mailman (input) for mailman id 396879;
 Thu, 01 Sep 2022 17:34:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTo5C-00088f-PI
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:34:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTo5C-0000ny-F2; Thu, 01 Sep 2022 17:34:26 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTo5C-0002Ki-7A; Thu, 01 Sep 2022 17:34:26 +0000
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
	bh=jJML3cTL7gnqvlEUKSuQiexy69p9vmBmLuGdbp6eSzU=; b=hCyoG0CKf8SRcvNQoM+9pBxuYW
	YvWkIvduDOX//CsjZfm4x9dtZI/xeKi9KPEYTeRN0HNMX8wm504V3GaY6yJWl/IWQcp+Weg4TbBnE
	V88+x0sqKPkQJtcES4QycRGBMM8QENF4z1OP9g5mQggeNVxZ5+Lok3ViILHOmM2f77PU=;
Message-ID: <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
Date: Thu, 1 Sep 2022 18:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/09/2022 18:08, Stefano Stabellini wrote:
>>> Also, what happen with UEFI? Is it easy to guarantee the region will not
>>> be used?
>>
>> For now I think it is not easy to guarantee that, do you have some ideas
>> in mind? I think I can follow this in above follow-up series to improve things.
> 
> For clarity, are we worried that the region is used by the bootloader
> for other things? For instance U-Boot or Tianocore placing some
> firmware tables inside the range specified for xenheap?

Yes. I think it would be difficult for an admin to figure out which 
regions are used. Although they are likely (?) going to be static for a 
given UEFI/U-boot build.

My major concern is such bug can be very difficult to root cause because 
we have no safety in Xen. The most likely symptom would be random 
corruption.

Cheers,

-- 
Julien Grall

