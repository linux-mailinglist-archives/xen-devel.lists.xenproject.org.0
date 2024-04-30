Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0A8B6B32
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 09:14:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714588.1115857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1hfv-000449-7C; Tue, 30 Apr 2024 07:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714588.1115857; Tue, 30 Apr 2024 07:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1hfv-00041S-46; Tue, 30 Apr 2024 07:13:15 +0000
Received: by outflank-mailman (input) for mailman id 714588;
 Tue, 30 Apr 2024 07:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ppc=MD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s1hft-00041M-Ty
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 07:13:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a4b525f-06c1-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 09:13:11 +0200 (CEST)
Received: from [192.168.1.11] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id D3CF54EE0738;
 Tue, 30 Apr 2024 09:13:10 +0200 (CEST)
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
X-Inumbo-ID: 1a4b525f-06c1-11ef-909b-e314d9c70b13
Message-ID: <9a1716d2-8a67-4886-b763-ceabc4a28f3f@bugseng.com>
Date: Tue, 30 Apr 2024 09:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation of MISRA C:2012 Rule
 14.4
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <899a456dc9fcd9ceb55efdfb95e71d0abd997700.1713961291.git.federico.serafini@bugseng.com>
 <ea0d9bfa-8e1a-41ac-a2a3-ccd59096074e@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <ea0d9bfa-8e1a-41ac-a2a3-ccd59096074e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/24 14:38, Jan Beulich wrote:
> On 24.04.2024 14:23, Federico Serafini wrote:
>> Update ECLAIR configuration to take into account the deviations
>> agreed during MISRA meetings.
>>
>> Amend an existing entry of Rule 14.4 in deviations.rst:
>> it is not a project-wide deviation.
> 
> Who / how is it not? ->is_dying is a globally visible struct field.

Given a project and a guideline, we use the term "project-wide
deviation" when all violations of the given guideline are deviated.

> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -294,7 +294,13 @@ Deviations related to MISRA C:2012 Rules:
>>        - The XEN team relies on the fact that the enum is_dying has the
>>          constant with assigned value 0 act as false and the other ones as true,
>>          therefore have the same behavior of a boolean.
>> -     - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>> +   * - R14.4
>> +     - A controlling expression of 'if' and iteration statements having
>> +       integer, character or pointer type has a semantics that is well-known to
>> +       all Xen developers.
>> +     - Tagged as `deliberate` for ECLAIR.
> 
> I'm inclined to suggest that this more generic deviation be inserted ahead
> of the more specific ->is_dying one.

Ok.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

