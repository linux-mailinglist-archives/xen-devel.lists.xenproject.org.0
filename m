Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C61886CA5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 14:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696872.1088068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnejI-00085u-Tb; Fri, 22 Mar 2024 13:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696872.1088068; Fri, 22 Mar 2024 13:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnejI-00083d-Qb; Fri, 22 Mar 2024 13:14:40 +0000
Received: by outflank-mailman (input) for mailman id 696872;
 Fri, 22 Mar 2024 13:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnejH-00083W-Fz
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 13:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnejF-0003L4-AQ; Fri, 22 Mar 2024 13:14:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnejE-0005r3-Vr; Fri, 22 Mar 2024 13:14:37 +0000
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
	bh=jMaKi0n4yIK1PcStwAtuO10QNCGMBlt76ynXjpkPTl4=; b=4emIvnmvk2/dnhDcjDzGiXCd9X
	bdeMcsgMOmwrYlPCtX40fPmFzuQDXdfMLfl/TAbkrR3n/iyzcZuYn2pC42ufOO4Sd+jTyjftQe2Q9
	4YzAZBt57X9U3zjpAQeJhWIIV5w1oOnkPwru1CZy6I/WO1LX86ddoL54w09nAivtLimU=;
Message-ID: <1afd8f2a-7a60-435c-8b60-21721e2e8a44@xen.org>
Date: Fri, 22 Mar 2024 13:14:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] EFI: Introduce inline stub for efi_enabled on !X86
 && !ARM
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <39069a589f9c4dc0db9b01b7412c1a99bea55f37.1710443965.git.sanastasio@raptorengineering.com>
 <3a98757d-998e-4731-a508-5e7e1fc5aef2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3a98757d-998e-4731-a508-5e7e1fc5aef2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/03/2024 08:01, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> --- a/xen/include/xen/efi.h
>> +++ b/xen/include/xen/efi.h
>> @@ -31,7 +31,15 @@ union compat_pf_efi_info;
>>   struct xenpf_efi_runtime_call;
>>   struct compat_pf_efi_runtime_call;
>>   
>> +#if defined(CONFIG_X86) || defined(CONFIG_ARM)
>>   bool efi_enabled(unsigned int feature);
>> +#else
>> +static inline bool efi_enabled(unsigned int feature)
>> +{
>> +    return false;
>> +}
>> +#endif
> 
> While fine as is for now, surely Arm32 could benefit from the inline stub,
> too.

At least for now, Arm32 provides efi_enabled(). It would be possible to 
rework, but I think this should be left in a follow-up.

Also, ideally, we would have a common CONFIG_EFI (rather than 
CONFIG_ARM_EFI).

Cheers,

-- 
Julien Grall

