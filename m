Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E7817384
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656042.1023957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEbN-0005tt-9Z; Mon, 18 Dec 2023 14:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656042.1023957; Mon, 18 Dec 2023 14:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEbN-0005rZ-6o; Mon, 18 Dec 2023 14:28:13 +0000
Received: by outflank-mailman (input) for mailman id 656042;
 Mon, 18 Dec 2023 14:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FT9=H5=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFEbL-0005rT-Re
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:28:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab6ac118-9db1-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:28:10 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 48E354EE0742;
 Mon, 18 Dec 2023 15:28:09 +0100 (CET)
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
X-Inumbo-ID: ab6ac118-9db1-11ee-98eb-6d05b1d4d9a1
Message-ID: <2c4de29a-ec34-4261-bcd9-ee0db52ee09f@bugseng.com>
Date: Mon, 18 Dec 2023 15:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] xen: address violations of MISRA C:2012 Rule 11.8
To: Jan Beulich <jbeulich@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <3b3996fb-ec66-468e-8ee8-eb8e7648f59d@suse.com>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <3b3996fb-ec66-468e-8ee8-eb8e7648f59d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/23 13:36, Jan Beulich wrote:
> On 14.12.2023 13:07, Simone Ballarin wrote:
>> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
>> headline states:
>> "A conversion shall not remove any const, volatile or _Atomic
>> qualification from the type pointed to by a pointer".
>>
>> This patch amends or removes casts that unnecessarily drop
>> const and volatile qualifiers.
>>
>> Example:
>>
>>   static always_inline bool int_##name(volatile void *p)
>>   {
>>      volatile uint32_t *ptr = (uint32_t *)p;             /* Non-compliant */
>>      volatile uint32_t *ptr = (volatile uint32_t *)p;    /* Compliant, proposed change */
>>   }
> 
> Why would you further complicate things when here the cast can simply
> be dropped?
> 
> Jan

Of course, the example will be improved in v2.


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


