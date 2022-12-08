Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C064754E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 19:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457384.715278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LH7-0000mE-AW; Thu, 08 Dec 2022 18:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457384.715278; Thu, 08 Dec 2022 18:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LH7-0000jt-7S; Thu, 08 Dec 2022 18:05:37 +0000
Received: by outflank-mailman (input) for mailman id 457384;
 Thu, 08 Dec 2022 18:05:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3LH5-0000jl-Qp
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 18:05:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3LH0-0008Ci-Pa; Thu, 08 Dec 2022 18:05:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3LH0-0000js-JK; Thu, 08 Dec 2022 18:05:30 +0000
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
	bh=j/Z/DqItcAL8GWKE6V5wfBGPMSb7evRy2sHrbM9SOB4=; b=XG88EdDs1hzgArLTuP5m/0PgC1
	lb2oqdmwtObTpsXx+9EWk9BbIu6kZqmo1vCpJMU/6tSSKSRhuKg3foYZZuB+YdNjCnXhOVEMolmur
	b8ytjdl4Acdo6yulp5Mn9eglcxN9cyzNTmXhq0Z9lKe8ANJDl00SVKoprkKKBFnb3py8=;
Message-ID: <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
Date: Thu, 8 Dec 2022 18:05:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2022 08:53, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
>>
>> On 07.12.2022 23:42, Demi Marie Obenour wrote:
>>> A previous patch tried to get Linux to use the ESRT under Xen if it is
>>> in memory of type EfiRuntimeServicesData.  However, EfiRuntimeServices*
>>> memory needs to be included in the EFI page tables, so it is best to
>>> minimize the amount of memory of this type.  Since EFI runtime services
>>> do not need access to the ESRT, EfiACPIReclaimMemory is a better choice.
>>>
>>> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-
>> 09/msg01365.html
>>> Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
>>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>>> Should this be included in 4.17?  It is a bug fix for a feature new to
>>> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.  The code
>>> is identical to v2, but I have improved the commit message.
>>
>> It may be too late now, looking at the state of the tree. Henry, Julien?
> 
> Like I said in v2, I don't object the change if you would like to include this patch
> to 4.17, so if you are sure this patch is safe and want to commit it, feel free to add:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> 
> Since we also need to commit:
> "[PATCH for-4.17] SUPPORT.md: Define support lifetime" so from my side
> I am no problem. Julien might have different opinion though, if Julien object
> the change I would like to respect his opinion and leave this patch uncommitted.

I have committed it after SUPPORT.md. So if for some reasons we are seen 
any issues with Osstest, then I can tag the tree without this patch 
(that said, I would rather prefer if we have staging-4.17 == stable-4.17).

My plan is to prepare the tarball tomorrow.

Cheers,

-- 
Julien Grall

