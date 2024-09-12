Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75B976402
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 10:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797076.1206873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soer6-0001yU-5G; Thu, 12 Sep 2024 08:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797076.1206873; Thu, 12 Sep 2024 08:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soer6-0001ve-1f; Thu, 12 Sep 2024 08:07:08 +0000
Received: by outflank-mailman (input) for mailman id 797076;
 Thu, 12 Sep 2024 08:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBhH=QK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1soer3-0001vB-B9
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 08:07:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf35b1d-70dd-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 10:07:00 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 790714EE0C98;
 Thu, 12 Sep 2024 10:06:59 +0200 (CEST)
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
X-Inumbo-ID: fcf35b1d-70dd-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726128419; bh=rVdjwtfGQfLfKfy5vfF8Lf/idGPEFClOro2/RPzIi2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pGbLgnx5rKQDZCDZZgHdrmzS+tZDcLzqoVxwMPvO7WAlFSq5Ym4AcQonbhjrgyWM6
	 rN2nKyGKxgBLGIJ/3MmxsafmPepFkcAjdgxyCAvURJzj0tP2xWj3JZUwCe3+i/jzgG
	 VnM9Y0vXWRdL7DdA1enV1BZLoM0HU/wEFVUEJ6WMmx/9j7tuqxUSkmLUAfFC3EAt/l
	 B+YA9N5P1FkGyL9DQMc8GTPz7ud9papscoZyXiet33I1ZfsAOYgYJ8hbvuKjj0VKkq
	 xIwOJJr0r7MNQYyRcpOQ9Q5ptukSmoPymo8c3f5HBWyZwa0mknO1P+KdFSbNFntW7p
	 HevuuAJHZoejw==
Message-ID: <0e04b0c1-4076-4260-9f2f-33f63732b0fe@bugseng.com>
Date: Thu, 12 Sep 2024 10:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, consulting@bugseng.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
 <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
 <a679972c919f4cf281f23b63ab98f312@bugseng.com>
 <60c4bdb6-ea84-495a-a8a9-9e887181f531@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <60c4bdb6-ea84-495a-a8a9-9e887181f531@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/09/24 16:57, Jan Beulich wrote:
> On 11.09.2024 16:27, Nicola Vetrini wrote:
>> On 2024-09-11 16:10, Jan Beulich wrote:
>>> On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
>>>> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>>>>> On 10.09.2024 21:06, Federico Serafini wrote:
>>>>>> Refactor the code to improve readability
>>>>>
>>>>> I question this aspect. I'm not the maintainer of this code anymore,
>>>>> so
>>>>> my view probably doesn't matter much here.
>>>>>
>>>>>> and address violations of
>>>>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>>>>> not contain any expression which has potential side effect").
>>>>>
>>>>> Where's the potential side effect? Since you move ...
>>>>>
>>>>>> --- a/xen/common/efi/runtime.c
>>>>>> +++ b/xen/common/efi/runtime.c
>>>>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union
>>>>>> xenpf_efi_info *info)
>>>>>>           info->cfg.addr = __pa(efi_ct);
>>>>>>           info->cfg.nent = efi_num_ct;
>>>>>>           break;
>>>>>> +
>>>>>>       case XEN_FW_EFI_VENDOR:
>>>>>> +    {
>>>>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>>>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>>>>
>>>>> .. this out, it must be the one. I've looked at it, yet I can't spot
>>>>> anything:
>>>>>
>>>>> #define guest_handle_cast(hnd, type) ({         \
>>>>>      type *_x = (hnd).p;                         \
>>>>>      (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>>>> })
>>>>>
>>>>> As a rule of thumb, when things aren't obvious, please call out the
>>>>> specific aspect / property in descriptions of such patches.
>>>>
>>>> I guess it's because guest_handle_cast() is a macro, yet it's
>>>> lowercase
>>>> so looks like a function?
>>>
>>> If Eclair didn't look at the macro-expanded code, it wouldn't even see
>>> the sizeof(). Hence I don't expect the thing to be mistaken for a
>>> function
>>> call.
>>>
>>
>> Looking at the fully preprocessed code [1], there is an assignment to
>> CHAR *_x inside a sizeof(), therefore compat_handle_cast is triggering
>> the violation when used in such a way to be inside the sizeof().
> 
> I can see a number of initializers, but no assignment.

+ Stefano in CC.

MISRA considers the initialization (even of a local variable)
a side effect. This is the reason of the violations.

I will send a V2 with a better description.

> 
>> if ( !((!!((((get_cpu_info()->current_vcpu))->domain)->arch.paging.mode
>> & ((1 << 4) << 10))) || (
>> __builtin_expect(!!(((n)) < (~0U / (sizeof(**(({ CHAR16 *_x =
>> (__typeof__(**(info->vendor.name)._) *)(full_ptr_t)(info->
>> vendor.name).c; (__compat_handle_CHAR16) { (full_ptr_t)_x };
>> }))._)))),1) && ((unsigned long)((unsigned long)((void *)(
>> full_ptr_t)(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._)
>> *)(full_ptr_t)(info->vendor.name).c; (
>> __compat_handle_CHAR16) { (full_ptr_t)_x }; })).c) + ((0 + ((n)) *
>> (sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->
>> vendor.name)._) *)(full_ptr_t)(info->vendor.name).c;
>> (__compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) ? (0 + ((n))
>> * (sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._)
>> *)(full_ptr_t)(info->vendor.name).c; (
>> __compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) - 1 : 0)) <
>> ((void)(((get_cpu_info()->current_vcpu))->domain), 0)))
>> ) )
> 

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

