Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F0877B9D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 09:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691237.1076963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjasw-0007ux-Eg; Mon, 11 Mar 2024 08:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691237.1076963; Mon, 11 Mar 2024 08:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjasw-0007t7-Ba; Mon, 11 Mar 2024 08:19:50 +0000
Received: by outflank-mailman (input) for mailman id 691237;
 Mon, 11 Mar 2024 08:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpO+=KR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rjasv-0007t1-1J
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 08:19:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eeb4061-df80-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 09:19:46 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 35DDC4EE0C90;
 Mon, 11 Mar 2024 09:19:46 +0100 (CET)
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
X-Inumbo-ID: 1eeb4061-df80-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Mon, 11 Mar 2024 09:19:46 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/7] xen/list: address violations of MISRA C Rule
 20.7
In-Reply-To: <0d3af110-773e-40bd-bd95-b385f49a7c47@suse.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
 <b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com>
 <0d3af110-773e-40bd-bd95-b385f49a7c47@suse.com>
Message-ID: <1215e0e44cc061e34c7da143e82a32e1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-11 08:48, Jan Beulich wrote:
> On 08.03.2024 12:21, Nicola Vetrini wrote:
>> --- a/xen/include/xen/list.h
>> +++ b/xen/include/xen/list.h
>> @@ -479,9 +479,9 @@ static inline void list_splice_init(struct 
>> list_head *list,
>>   * @n:      another &struct list_head to use as temporary storage
>>   * @head:   the head for your list.
>>   */
>> -#define list_for_each_backwards_safe(pos, n, head)              \
>> -    for ( pos = (head)->prev, n = pos->prev; pos != (head);     \
>> -          pos = n, n = pos->prev )
>> +#define list_for_each_backwards_safe(pos, n, head)                 \
>> +    for ( (pos) = (head)->prev, n = (pos)->prev; (pos) != (head);  \
>> +          (pos) = n, n = (pos)->prev )
> 
> I think this is worse than before and incomplete: At least the rhs use 
> of n
> also needs parenthesizing. Plus if pos is parenthesized even in lhs
> instances, imo n ought to be, too.
> 

You are right: this was simply an oversight.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

