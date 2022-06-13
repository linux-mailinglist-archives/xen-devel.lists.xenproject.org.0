Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABC547FCF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 08:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347747.574069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0dtR-0006pY-SF; Mon, 13 Jun 2022 06:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347747.574069; Mon, 13 Jun 2022 06:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0dtR-0006mG-PP; Mon, 13 Jun 2022 06:49:45 +0000
Received: by outflank-mailman (input) for mailman id 347747;
 Mon, 13 Jun 2022 06:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BxIL=WU=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o0dtR-0006mA-4F
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 06:49:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 009fb490-eae5-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 08:49:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC6D0D6E;
 Sun, 12 Jun 2022 23:49:41 -0700 (PDT)
Received: from [10.57.9.245] (unknown [10.57.9.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8B893F792;
 Sun, 12 Jun 2022 23:49:39 -0700 (PDT)
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
X-Inumbo-ID: 009fb490-eae5-11ec-8901-93a377f238d6
Message-ID: <b93bd7c0-0bb4-1837-b004-d687f1296db2@arm.com>
Date: Mon, 13 Jun 2022 08:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
 <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com>
 <295e9c7e-e0de-bbd3-eec4-0864cb2ef086@suse.com>
 <alpine.DEB.2.22.394.2206101630520.756493@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2206101630520.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11.06.2022 01:35, Stefano Stabellini wrote:
> On Fri, 10 Jun 2022, Jan Beulich wrote:
>> On 10.06.2022 11:51, Juergen Gross wrote:
>>> On 10.06.22 11:44, Jan Beulich wrote:
>>>> On 10.06.2022 10:33, Michal Orzel wrote:
>>>>> All the members of struct tm are defined as integers but the format tags
>>>>> used in console driver for snprintf wrongly expect unsigned values. Fix
>>>>> the tags to expect integers.
>>>>
>>>> Perhaps do things the other way around - convert field types to unsigned
>>>> unless negative values can be stored there? This would match our general
>>>> aim of using unsigned types when only non-negative values can be held in
>>>> variables / parameters / fields.
>>>
>>> Don't you think keeping struct tm in sync with the Posix definition should
>>> be preferred here?
>>
>> Not necessarily, no. It's not just POSIX which has a (imo bad) habit of
>> using plain "int" even for values which can never go negative.
> 
> I committed the other two patches in the series because already acked
> and straightforward.
> 
> In this case, I think the straightforward/mechanical fix is the one
> Michal suggested in this patch: fixing %u to be %d. We could of course
> consider changing the definition of tm, and there are valid reasons to
> do that as Jan pointed out, but I think this patch is valid as-in
> anyway.
> 
> So I am happy to give my reviewed-by for this version of the patch, and
> we can still consider changing tm to use unsigned if someone feels like
> proposing a patch for that.

It is not true that the members of struct tm cannot go negative.
Examples:
1) tm_year is used to store a number of years elapsed since 1900.
To express years before 1900, this value must be negative.
2) tm_isdst is used to inform whether DST is in effect. Negative value (-1)
means that no information is available.

The above rules are taken into account in a gmtime definition (common/time.c).

The signed/unsigned debate also applies to a calendar time defintion.
The concept of negative value is used to express the time before epoch.

Xen is using signed s_time_t for system time all over the codebase without
any valid reason other than to be coherent with POSIX definition of time_t.

> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Cheers,
> 
> Stefano

Cheers,
Michal

