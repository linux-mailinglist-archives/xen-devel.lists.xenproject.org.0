Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D072BB1A5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 18:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32539.63594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgASt-000121-PV; Fri, 20 Nov 2020 17:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32539.63594; Fri, 20 Nov 2020 17:44:55 +0000
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
	id 1kgASt-00011c-MF; Fri, 20 Nov 2020 17:44:55 +0000
Received: by outflank-mailman (input) for mailman id 32539;
 Fri, 20 Nov 2020 17:44:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kgASr-00011X-JS
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 17:44:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kgASp-0004hE-MG; Fri, 20 Nov 2020 17:44:51 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kgASp-00004y-9m; Fri, 20 Nov 2020 17:44:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kgASr-00011X-JS
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 17:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=GFHFypjQIAns7bCBdheatPzTqbbWDfglKgB92b6DICo=; b=MebDd2bjGxYXwYY02QoOy4dgtf
	mvaDpv7XJhjWUIQv4+YFAwu2Jxohw1nmXpr49IwhdaBhssdxSMCuCPk0ykqc4Eb/oCnsyoltXKqZd
	R+wmIZH7qFpMA3RYzJPUHz6kjU09HsntlzeYQGx0r89n//3syWTStlrztDaYUHniCzAw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kgASp-0004hE-MG; Fri, 20 Nov 2020 17:44:51 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kgASp-00004y-9m; Fri, 20 Nov 2020 17:44:51 +0000
Subject: Re: [PATCH v2 1/7] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Jan Beulich <jbeulich@suse.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <dffb010c-c647-89e6-293a-0b2f4a910503@xen.org>
Date: Fri, 20 Nov 2020 17:44:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <96a97d2f-90dd-c4a7-5747-825c832ce56d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/11/2020 16:03, Jan Beulich wrote:
> On 23.10.2020 17:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
>> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
>>
>> Currently, the former are still containing x86 specific code.
>>
>> To avoid this rather strange split, the generic helpers are reworked so
>> they are arch-agnostic. This requires the introduction of a new helper
>> __acpi_os_unmap_memory() that will undo any mapping done by
>> __acpi_os_map_memory().
>>
>> Currently, the arch-helper for unmap is basically a no-op so it only
>> returns whether the mapping was arch specific. But this will change
>> in the future.
>>
>> Note that the x86 version of acpi_os_map_memory() was already able to
>> able the 1MB region. Hence why there is no addition of new code.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>> Tested-by: Rahul Singh <rahul.singh@arm.com>
> 
> This change breaks shutdown on x86. Either Dom0 no longer requests S5
> (in which case I'd expect some data collection there to fail), or Xen
> refuses the request. As a result, things go the machine_halt() path
> instead. I've looked over the change again, but couldn't spot anything
> yet which might explain the behavior. Yet reverting (just the non-Arm
> parts, so I wouldn't have to revert multiple commits) made things
> work again.

Thank you for the report and sorry for the breakage.

When changing the behavior of __acpi_map_table(), I failed to realize 
that some x86 code will call it directly rather than 
acpi_os_map_memory(). This is the case of acpi_fadt_parse_sleep_info() 
which detects whether ACPI can be used to put the system in sleep state.

I am tempted to require all the callers requiring to map memory to use 
the generic implementation acpi_os_{, un}map_memory().

However, AFAICT, some of the callers (such as acpi_sleep_prepare()) are 
using __acpi_map_table() because the function never failed before. By 
using the generic function, all mappings after boot will be using vmap() 
which may fail.

Would this new behavior be acceptable to you?

Cheers,

-- 
Julien Grall

