Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE279F6A02
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860587.1272598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvyC-0001fY-3S; Wed, 18 Dec 2024 15:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860587.1272598; Wed, 18 Dec 2024 15:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvyC-0001d4-0M; Wed, 18 Dec 2024 15:28:16 +0000
Received: by outflank-mailman (input) for mailman id 860587;
 Wed, 18 Dec 2024 15:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLCT=TL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tNvyB-0001cy-2o
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:28:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1180822-bd54-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:28:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734535682440665.1168973887374;
 Wed, 18 Dec 2024 07:28:02 -0800 (PST)
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
X-Inumbo-ID: b1180822-bd54-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1734535683; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QbEyCQaNltU3ja0SNrrdCtt+739ev9qitNiiGK2ST4MfryDitVYcR8ogGk4/nZpOgH95Ek580WJvLO6fDNUFVHmMxoiTJ3Okwp6JJIXem7GgLSpH9N9eItjvuVKUa67h5BR+Voc5KRdeHF8rElgCQWTI6TgxeoW0Z63fKX1RHhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734535683; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+Rqs0nzbS1vWrlNelABBlpbx4rCRCOleHHNNPrWHr6w=; 
	b=FiP/Gk5GRSavKf/zPWNKgrPQdpDz2eZWyFjFpB+DhbvttGo+0Sx/9xYmsY7+g+ozXo8AJbW8k/fay1jubbNiAF2Yv9JByITDgJJyDDBScN3SigPLt1oa92JQEkRKcnJct9MyecFp7HEU8oajKRK9IGYTzyzN4lSQ0t9+afQFqmU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734535683;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+Rqs0nzbS1vWrlNelABBlpbx4rCRCOleHHNNPrWHr6w=;
	b=dplNTrnhllkp2iu55uu9kyEwhJeGVOjgSdIMRtADC54yyCq2g5bw6Mt7Se/eW0wu
	ohGBEABZQMrpHAroObi2eZBBNs7fxPvtdhmp+1lqjRt3zo/exBJhKfu1hEXjnLHZyju
	oqIc+mAsMvkQE8qLatsYjxfykfpi+bG86zcuVWQ0=
Message-ID: <bb6f2e52-6e9b-4a09-9e07-23f813e548dc@apertussolutions.com>
Date: Wed, 18 Dec 2024 10:27:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <44db9406-f835-425f-b7b2-c86d14eb53d9@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <44db9406-f835-425f-b7b2-c86d14eb53d9@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/18/24 05:24, Andrew Cooper wrote:
> On 17/12/2024 11:47 am, Sergiy Kibrik wrote:
>> Allow to build ARM configuration with support for initializing hardware domain.
>> On ARM it is only possible to start hardware domain in multiboot mode, so
>> dom0less support is required. This is reflected by dependency on DOM0LESS_BOOT
>> instead of directly depending on ARM config option.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>>   xen/common/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 90268d9249..7368ca8208 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -374,7 +374,7 @@ endchoice
>>   config LATE_HWDOM
>>   	bool "Dedicated hardware domain"
>>   	default n
>> -	depends on XSM && X86
>> +	depends on XSM && (X86 || DOM0LESS_BOOT)
>>   	help
>>   	  Allows the creation of a dedicated hardware domain distinct from
>>   	  domain 0 that manages devices without needing access to other
> 
> To ask a questions not asked elsewhere on this thread.
> 
> We are expecting Hyperlaunch to supersede and entirely replace what is
> currently x86's idea of split control/hwdom, to this point where this
> symbol is even removed.
> 
> Has this plan changed?

In the long term, no. In the short term, the multi-domain builder 
introduces the means to differentiate, but there is still discussion to 
be had around how the dummy policy should/would need to be updated.

v/r,
dps

