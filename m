Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE702886838
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696710.1087840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnaHv-0005yc-BM; Fri, 22 Mar 2024 08:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696710.1087840; Fri, 22 Mar 2024 08:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnaHv-0005v4-7O; Fri, 22 Mar 2024 08:30:07 +0000
Received: by outflank-mailman (input) for mailman id 696710;
 Fri, 22 Mar 2024 08:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jC2=K4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rnaHt-0005o0-Rs
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:30:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61ed1463-e826-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 09:30:04 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 6B3434EE0742;
 Fri, 22 Mar 2024 09:30:03 +0100 (CET)
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
X-Inumbo-ID: 61ed1463-e826-11ee-afe0-a90da7624cb6
Message-ID: <ba647120-9c53-48ff-82b6-c8047b4248ea@bugseng.com>
Date: Fri, 22 Mar 2024 09:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen: address violations of MISRA C Rule 17.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
 <f7c2f12ab1b62301cfea3a28707178950f480932.1710923235.git.simone.ballarin@bugseng.com>
 <4ce30a38-5b5c-4d4c-a0c4-8c1a63759203@suse.com>
 <alpine.DEB.2.22.394.2403201847140.1569010@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2403201847140.1569010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/24 02:47, Stefano Stabellini wrote:
> On Wed, 20 Mar 2024, Jan Beulich wrote:
>> On 20.03.2024 09:51, Simone Ballarin wrote:
>>> MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used"
>>>
>>> The Xen community wants to avoid using variadic functions except for
>>> specific circumstances where it feels appropriate by strict code review.
>>>
>>> Functions hypercall_create_continuation and hypercall_xlat_continuation
>>> are special hypercalls made to break long running hypercalls into multiple
>>> calls.
>>
>> Here and below: These aren't "special hypercalls". They're internal helper
>> functions.
> 
> +1
> 
> 
>>> They take a variable number of arguments depending on the original
>>> hypercall they are trying to continue.
>>
>> Am I misremembering or did Andrew outline a plan to eliminate the variadic-
>> ness from these? From certifiability perspective avoiding the need for a
>> deviation would likely be preferable?
> 
> For sure, it would be preferable. In the meantime we can have the SAF
> comment?

I agree in using the SAF comments as a temporary measure.
I'll propose a new patch with the fix requested by Jan.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


