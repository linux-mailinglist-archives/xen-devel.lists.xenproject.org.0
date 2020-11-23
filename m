Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C22C016D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 09:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33647.64777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh7Fh-0001Di-QD; Mon, 23 Nov 2020 08:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33647.64777; Mon, 23 Nov 2020 08:31:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh7Fh-0001DM-Mz; Mon, 23 Nov 2020 08:31:13 +0000
Received: by outflank-mailman (input) for mailman id 33647;
 Mon, 23 Nov 2020 08:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kh7Fg-0001DH-4Y
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 08:31:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb9f1317-a422-4eb8-bffd-1882866552fe;
 Mon, 23 Nov 2020 08:31:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92EEDAFFB;
 Mon, 23 Nov 2020 08:31:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kh7Fg-0001DH-4Y
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 08:31:12 +0000
X-Inumbo-ID: fb9f1317-a422-4eb8-bffd-1882866552fe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fb9f1317-a422-4eb8-bffd-1882866552fe;
	Mon, 23 Nov 2020 08:31:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606120270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMEKD6XKjxxI1BMkdYnOKXh/k36eVZVR4ToH07KhWZg=;
	b=u5kdi7J8KUbzWBWlwC2aQe0MijDcrSAVwrzFo66McB9N1MHCGajVmnCEWIPNEbiHy8ueB2
	Tih5DrXxvF+xISCQcqx9UUGByFmh19ABGsIruY5iPcuUcCofIe0fUGhxTZri/vFtRKYmHN
	2vtnhAZgN52j06I9tRhETx3rvLoQCcc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92EEDAFFB;
	Mon, 23 Nov 2020 08:31:09 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Julien Grall <julien@xen.org>
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-2-julien@xen.org>
 <96a97d2f-90dd-c4a7-5747-825c832ce56d@suse.com>
 <dffb010c-c647-89e6-293a-0b2f4a910503@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d88f199-e8d0-0293-69ff-51b01da6caa7@suse.com>
Date: Mon, 23 Nov 2020 09:31:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <dffb010c-c647-89e6-293a-0b2f4a910503@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 18:44, Julien Grall wrote:
> Hi Jan,
> 
> On 20/11/2020 16:03, Jan Beulich wrote:
>> On 23.10.2020 17:41, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
>>> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
>>>
>>> Currently, the former are still containing x86 specific code.
>>>
>>> To avoid this rather strange split, the generic helpers are reworked so
>>> they are arch-agnostic. This requires the introduction of a new helper
>>> __acpi_os_unmap_memory() that will undo any mapping done by
>>> __acpi_os_map_memory().
>>>
>>> Currently, the arch-helper for unmap is basically a no-op so it only
>>> returns whether the mapping was arch specific. But this will change
>>> in the future.
>>>
>>> Note that the x86 version of acpi_os_map_memory() was already able to
>>> able the 1MB region. Hence why there is no addition of new code.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>>> Tested-by: Rahul Singh <rahul.singh@arm.com>
>>
>> This change breaks shutdown on x86. Either Dom0 no longer requests S5
>> (in which case I'd expect some data collection there to fail), or Xen
>> refuses the request. As a result, things go the machine_halt() path
>> instead. I've looked over the change again, but couldn't spot anything
>> yet which might explain the behavior. Yet reverting (just the non-Arm
>> parts, so I wouldn't have to revert multiple commits) made things
>> work again.
> 
> Thank you for the report and sorry for the breakage.
> 
> When changing the behavior of __acpi_map_table(), I failed to realize 
> that some x86 code will call it directly rather than 
> acpi_os_map_memory(). This is the case of acpi_fadt_parse_sleep_info() 
> which detects whether ACPI can be used to put the system in sleep state.
> 
> I am tempted to require all the callers requiring to map memory to use 
> the generic implementation acpi_os_{, un}map_memory().
> 
> However, AFAICT, some of the callers (such as acpi_sleep_prepare()) are 
> using __acpi_map_table() because the function never failed before. By 
> using the generic function, all mappings after boot will be using vmap() 
> which may fail.

The FACS mapping can (and perhaps should long have been) be switched
to acpi_os_map_memory(). The other two direct uses of the function,
however, will require more care. I'm in the process or making a
series, also noticing some further shortcomings of the FACS handling.

Jan

