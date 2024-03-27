Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA388DCF4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698479.1090191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRtV-0000Yh-Mo; Wed, 27 Mar 2024 11:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698479.1090191; Wed, 27 Mar 2024 11:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRtV-0000XA-JR; Wed, 27 Mar 2024 11:56:37 +0000
Received: by outflank-mailman (input) for mailman id 698479;
 Wed, 27 Mar 2024 11:56:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rpRtU-0000X2-1L
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:56:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpRtO-00058n-S2; Wed, 27 Mar 2024 11:56:30 +0000
Received: from [15.248.2.236] (helo=[10.24.67.40])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rpRtO-0007yZ-Jm; Wed, 27 Mar 2024 11:56:30 +0000
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
	bh=pDtxU+5Q9VsdwX7QM3fmDb6ACdB0DtdjTXvQ/YcxOUM=; b=IJbbxea2cQtW08nT+srVKerDRn
	dfDWbBi4sJSLCLR0AO1sZdXrKuHTdQWgI2jMO9CtT5tSsBWb929lt41tgs2Dn6AdNENTFffB/L3v6
	etTDhlwa+xb9HIMRNwFWKbxxKnSBI3MVoJKg+K+JwWPpnaAo6xHQhb+pMh5hJeHd8lwQ=;
Message-ID: <a12c4f8a-54d8-41b9-8ce8-6628a1d85c1c@xen.org>
Date: Wed, 27 Mar 2024 11:56:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech>
 <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
 <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
 <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
 <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com>
 <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/03/2024 11:39, Carlo Nonato wrote:
> On Fri, Mar 22, 2024 at 8:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 21.03.2024 18:31, Carlo Nonato wrote:
>>> On Thu, Mar 21, 2024 at 4:57 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 21.03.2024 16:04, Carlo Nonato wrote:
>>>>> On Tue, Mar 19, 2024 at 4:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>>>>>
>>>>>>>   Specify a list of IO ports to be excluded from dom0 access.
>>>>>>>
>>>>>>> +### dom0-llc-colors
>>>>>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>>>>>> +
>>>>>>> +> Default: `All available LLC colors`
>>>>>>> +
>>>>>>> +Specify dom0 LLC color configuration. This option is available only when
>>>>>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>>>>>>> +colors are used.
>>>>>>
>>>>>> My reservation towards this being a top-level option remains.
>>>>>
>>>>> How can I turn this into a lower-level option? Moving it into "dom0=" doesn't
>>>>> seem possible to me. How can I express a list (llc-colors) inside another list
>>>>> (dom0)? dom0=llc-colors=0-3,12-15,other-param=... How can I stop parsing
>>>>> before reaching other-param?
>>>>
>>>> For example by using a different separator:
>>>>
>>>> dom0=llc-colors=0-3+12-15,other-param=...
>>>
>>> Ok, but that would mean to change the implementation of the parsing function
>>> and to adopt this syntax also in other places, something that I would've
>>> preferred to avoid. Anyway I'll follow your suggestion.
>>
>> Well, this is all used by Arm only for now. You will want to make sure Arm
>> folks are actually okay with this alternative approach.
>>
>> Jan
> 
> Are you Arm maintainers ok with this?

Unfortunately no. I find the use of + and "nested" = extremely confusing 
to read.

There might be other symbols to use (e.g. s/=/:/ s#+#/#), but I am not 
entirely sure the value of trying to cram all the options under a single 
top-level parameter. So I right now, I would prefrr if we stick with the 
existing approach (i.e. introducing dom0-llc-colors).

Cheers,

-- 
Julien Grall

