Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C993879C70
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 20:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692187.1079029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk8CU-0005l4-2q; Tue, 12 Mar 2024 19:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692187.1079029; Tue, 12 Mar 2024 19:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk8CU-0005ih-01; Tue, 12 Mar 2024 19:54:14 +0000
Received: by outflank-mailman (input) for mailman id 692187;
 Tue, 12 Mar 2024 19:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdFL=KS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rk8CS-0005ib-29
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 19:54:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a35eb77-e0aa-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 20:54:09 +0100 (CET)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id 670134EE073E;
 Tue, 12 Mar 2024 20:54:08 +0100 (CET)
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
X-Inumbo-ID: 4a35eb77-e0aa-11ee-a1ee-f123f15fe8a2
Message-ID: <4b62c3e6-0851-4cfe-87ca-06a22d6b8243@bugseng.com>
Date: Tue, 12 Mar 2024 20:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] xen: avoid grep fodder define and undef
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <0002f3df03aac283fa3dc7365e9040ab7ffaee2e.1710242950.git.federico.serafini@bugseng.com>
 <338db1b9-54f1-4687-ba9a-2eec282db1d5@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <338db1b9-54f1-4687-ba9a-2eec282db1d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/24 15:30, Jan Beulich wrote:
> On 12.03.2024 12:48, Federico Serafini wrote:
>> Place an "#if 0" before grep fodder definitions and remove the
>> "#undef".
>>
>> This addresses several violations of MISRA C:2012 Rule 5.5
>> ("Identifiers shall be distinct from macro names").
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Hello, I would like to know what you think about this change.
>> If you want to keep grep fodders as they are, an alternative could be to
>> deviate violations of Rule 5.5 involving the TYPE_SAFE macro.
> 
> I think the original intention was to allow for some (arch?) override.
> But we have lived without for long enough that I think we could do as
> you suggest. One question though: Wasn't there also a rule against the
> use of #undef, violations of which would then be eliminate here as well? > If so, I think that would want mentioning in the description. If not,
> I'd like to give it a couple of days before ack-ing, just in case other
> opinions would be voiced.

Yes, it is advisory Rule 20.5.

> 
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -33,13 +33,10 @@ TYPE_SAFE(uint64_t, dfn);
>>   #define PRI_dfn     PRIx64
>>   #define INVALID_DFN _dfn(~0ULL)
>>   
>> -#ifndef dfn_t
>> +#if 0
>>   #define dfn_t /* Grep fodder: dfn_t, _dfn() and dfn_x() are defined above */
>>   #define _dfn
>>   #define dfn_x
>> -#undef dfn_t
>> -#undef _dfn
>> -#undef dfn_x
>>   #endif
> 
> I have to admit that I'm a little surprised that Misra (Eclair) is
> happy with this: The #define-s are all still there, after all.

The #define-s after the #if 0 are skipped by the preprocessor and this
is something that MISRA takes into account.

As an example, Directive 4.4 states that code should not be commented
out and explicitly cites the use of #if and #ifdef to exclude code from
the compilation.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

