Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFD4ED9EF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296958.505674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZuK1-0001ME-W7; Thu, 31 Mar 2022 12:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296958.505674; Thu, 31 Mar 2022 12:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZuK1-0001Jz-Sj; Thu, 31 Mar 2022 12:54:41 +0000
Received: by outflank-mailman (input) for mailman id 296958;
 Thu, 31 Mar 2022 12:54:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZuK0-0001Jt-Qo
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:54:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZuJz-0005or-8o; Thu, 31 Mar 2022 12:54:39 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.7.236.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZuJz-0007bA-1n; Thu, 31 Mar 2022 12:54:39 +0000
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
	bh=XrUQi50OBIysnvci1CkzI038oEyD9Hwr7ltiR14Jv6A=; b=O+e9P1C0HhGYpzGW02dQOJz2AN
	bmei2wgNNnKJkris3phkYnoK79HqKpWpizm/ifWXEOrFIcfY+xqIAkN32yQFe7mkFk5pjWbLef6BC
	ifuVf8cdtt/2TzX06CxwRpIHlXZ+MtK6KNWrLHJSZe/lk0Q1EnfW+8E7G+c1B8pAoYoU=;
Message-ID: <bb93b930-8287-6e8f-98b5-4b3f3c8e6eaf@xen.org>
Date: Thu, 31 Mar 2022 13:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-3-dpsmith@apertussolutions.com>
 <YkWijXX9P1FSs61W@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YkWijXX9P1FSs61W@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 31/03/2022 13:46, Roger Pau Monné wrote:
> On Wed, Mar 30, 2022 at 07:05:49PM -0400, Daniel P. Smith wrote:
>> It is now possible to promote the idle domain to privileged during setup.  It
>> is not desirable for the idle domain to still be privileged when moving into a
>> running state. If the idle domain was elevated and not properly demoted, it is
>> desirable to fail at this point. This commit adds an assert for both x86 and
>> Arm just before transitioning to a running state that ensures the idle is not
>> privileged.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/arm/setup.c | 3 +++
>>   xen/arch/x86/setup.c | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 7968cee47d..3de394e946 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -973,6 +973,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>       /* Hide UART from DOM0 if we're using it */
>>       serial_endboot();
>>   
>> +    /* Ensure idle domain was not left privileged */
>> +    ASSERT(current->domain->is_privileged == false) ;
>> +
>>       system_state = SYS_STATE_active;
>>   
>>       create_domUs();
> 
> Hm, I think you want to use the permission promotion of the idle
> domain in create_domUs() likely?
> 
> At which point the check should be after create_domUs, and it would
> seem that logically SYS_STATE_active should be set after creating the
> domUs.
> 
> Also, FWIW, I'm not seeing this create_domUs() call in my context,
> maybe you have other patches on your queue?
I think the code is based on an old version of Xen (looks like 4.14). In 
newer version create_domUs() is called before just before 
discard_initial_modules() (see XSA-372 for the rationale).

Daniel, can you please rebase this series to the latest staging?

Cheer,

-- 
Julien Grall

