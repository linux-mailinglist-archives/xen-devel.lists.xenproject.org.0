Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43F51BD77
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 12:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321971.543132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZ1M-0005G1-5h; Thu, 05 May 2022 10:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321971.543132; Thu, 05 May 2022 10:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZ1M-0005Ds-2G; Thu, 05 May 2022 10:47:44 +0000
Received: by outflank-mailman (input) for mailman id 321971;
 Thu, 05 May 2022 10:47:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmZ1K-0005Di-EN
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:47:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZ1J-0003gC-6k; Thu, 05 May 2022 10:47:41 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZ1I-0000ht-W7; Thu, 05 May 2022 10:47:41 +0000
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
	bh=X8ImuXUO53Htv8l3X5EVFCQdHO2x9Eep1S4ThuF+gu0=; b=BYIkbOY8jsAaoR4B6mNVzG5qQc
	e1UIqnLFmbugjnakQ914CowfRie6liZNakGAVWHjj4eGlxshb45424XBgxZ6aqjBruT0SIjRBrg01
	peZzOs0gHcgs7yaJ5ds73qxAwgld5prNh+AO2zeHNUU9uHcmeerAeN3+RP7FkWLXVr6E=;
Message-ID: <29821df5-ff10-381f-f4ab-6d25ae1815bb@xen.org>
Date: Thu, 5 May 2022 11:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] SUPPORT.MD: Correct the amount of physical memory
 supported for Arm
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220427132246.52715-1-julien@xen.org>
 <2AFEFEE2-DDF7-42EB-A1AD-88642596152C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2AFEFEE2-DDF7-42EB-A1AD-88642596152C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2022 14:51, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 27 Apr 2022, at 14:22, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> As part of XSA-385, SUPPORT.MD gained a statement regarding the amount
>> of physical memory supported.
>>
>> However, booting Xen on a Arm platform with that amount of memory would
>> result to a breakage because the frametable area is too small.
>>
>> The wiki [1] (as of April 2022) claims we were able to support up to
>> 5 TiB on Arm64 and 16 GiB. However, this is not the case because
>> the struct page_info has always been bigger than expected (56 bytes
>> for 64-bit and 32-bytes for 32-bit).
>>
>> I don't have any HW with such amount of memory. So rather than
>> modifying the code, take the opportunity to use the limit that should
>> work on Arm (2 TiB for 64-bit and 12 GiB for 32-bit).
> 
> Sadly I have no hardware either even remotely near this capacity and
> I think those limits are right for now so...
> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm part

Thanks! The changes requested by Jan are easy to fix. So instead of 
resubmitting, I have done the modifications and committed the patch 
directly.

Cheers,

-- 
Julien Grall

