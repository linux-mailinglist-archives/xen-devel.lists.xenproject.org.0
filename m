Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516B7CF151
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618939.963291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNWP-0003C2-GW; Thu, 19 Oct 2023 07:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618939.963291; Thu, 19 Oct 2023 07:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNWP-000393-DR; Thu, 19 Oct 2023 07:32:45 +0000
Received: by outflank-mailman (input) for mailman id 618939;
 Thu, 19 Oct 2023 07:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQIi=GB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtNWO-00038x-AL
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:32:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7007c1-6e51-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 09:32:41 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4CD9B4EE0739;
 Thu, 19 Oct 2023 09:32:41 +0200 (CEST)
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
X-Inumbo-ID: af7007c1-6e51-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 19 Oct 2023 09:32:41 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 andrew.cooper3@citrix.com
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
In-Reply-To: <5b44bf79-24fa-abe3-1759-da1dd5d3e5de@suse.com>
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com>
 <35abc556-2f66-4498-b567-87e6a3216d50@citrix.com>
 <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
 <5b44bf79-24fa-abe3-1759-da1dd5d3e5de@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a098b894455fa0da64d91882d3aa2f3d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 19/10/2023 09:03, Jan Beulich wrote:
> On 19.10.2023 02:54, Stefano Stabellini wrote:
>> On Thu, 19 Oct 2023, andrew.cooper3@citrix.com wrote:
>>> On 18/10/2023 2:42 pm, Nicola Vetrini wrote:
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index ee7aed0609d2..1b00e4e3e9b7 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>>>>         See automation/eclair_analysis/deviations.ecl for the full 
>>>> explanation.
>>>>       - Tagged as `safe` for ECLAIR.
>>>> 
>>>> +   * - R11.9
>>>> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check 
>>>> if a type is
>>>> +       scalar, therefore its usage for this purpose is allowed.
>>> 
>>> This is still deeply misleading.
>>> 
>>> There is an integer, which happens to be 0 but could be anything, 
>>> used
>>> for a compile time typecheck[1].  In some cases this may be 
>>> interpreted
>>> as a pointer constant, and is permitted for this purpose.
>>> 
>>> ~Andrew
>>> 
>>> [1] I know I wrote scalar typecheck in the comment, but I suspect 
>>> that
>>> what I actually meant was non-compound-type typecheck.
>> 
>> To help Nicola find the right wording do you have a concrete 
>> suggestion
>> for the text to use?
>> 
>> Reading your reply, I am guessing it would be:
>> 
>> * - R11.9
>>   - __ACCESS_ONCE uses an integer, which happens to be zero, as a
>>     non-compound-type typecheck. The typecheck uses a cast. The usage 
>> of
>>     zero or other integers for this purpose is allowed.
> 
> "non-compound" isn't correct either: __int128_t, for example, isn't a
> compound type but may not be used with ACCESS_ONCE(). Furthermore
> certain compound types are, as indicated earlier, in principle okay
> to use with ACCESS_ONCE(). Both are shortcomings of the present
> implementation, which imo shouldn't propagate into this document. I'd
> say just "as a compile time check".
> 
> Jan

Ok, I'll amend it

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

