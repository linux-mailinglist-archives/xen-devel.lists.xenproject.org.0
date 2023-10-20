Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C857D0D87
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 12:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619748.965331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtmvt-0003c3-Lu; Fri, 20 Oct 2023 10:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619748.965331; Fri, 20 Oct 2023 10:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtmvt-0003ZO-Im; Fri, 20 Oct 2023 10:40:45 +0000
Received: by outflank-mailman (input) for mailman id 619748;
 Fri, 20 Oct 2023 10:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtmvs-0003ZG-RC
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 10:40:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1edb37da-6f35-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 12:40:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5CA8F4EE073C;
 Fri, 20 Oct 2023 12:40:43 +0200 (CEST)
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
X-Inumbo-ID: 1edb37da-6f35-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 20 Oct 2023 12:40:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org, Luca.Fancellu@arm.com
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
In-Reply-To: <9ab86d00-b539-25d1-4830-80932babcfbc@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
 <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
 <9ab86d00-b539-25d1-4830-80932babcfbc@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <0b87c8229ad041d62360ac39d58ada00@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 08:00, Jan Beulich wrote:
> On 19.10.2023 21:58, Stefano Stabellini wrote:
>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>> @@ -8,8 +8,10 @@
>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>> 
>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>> 
>>>>>> a SAF-<n>-safe comment here?
>>>>>> 
>>>>> 
>>>>> One reason is that now that violations only belonging to tool
>>>>> configurations
>>>>> and similar are documented in docs/misra/deviations.rst (committed 
>>>>> in
>>>>> Stefano's
>>>>> branch for-4.19 [1]).
>>>> 
>>>> But tool configuration means every analysis tool needs configuring
>>>> separately. That's why the comment tagging scheme was decided to be
>>>> preferred, iirc.
>>>> 
>>>>> Also, there were disagreements on the SAF naming
>>>>> scheme, and
>>>>> patches like those would not be accepted at the moment.
>>>> 
>>>> Well, that needs resolving. The naming there shouldn't lead to 
>>>> patches
>>>> being accepted that later may need redoing.
>>>> 
>>>> Jan
>>> 
>>> While this is true, in this case I'm not willing to deviate with a 
>>> SAF, given
>>> that
>>> some ECLAIR-specific configuration would be needed anyways, given 
>>> that I'm
>>> deviating a macro definition, rather than the line where it's 
>>> actually used
>>> (and maybe other tools would need
>>> that as well).
>> 
>> Did I get it right that the problem with using SAF in this case is 
>> that
>> it wouldn't be sufficient to add a SAF comment on top of the MACRO
>> definition, but we would need a SAF comment on top of every MACRO
>> invocation?
>> 
>> If so, then not just for this MACRO but in general basically we have 
>> to
>> use deviations.rst.
> 
> That would be pretty sad.
> 
> Jan
> 

Local deviation comments are for local deviations; deviating patterns is 
a tool configuration.

>> Luca, do you know what would be the behavior for cppcheck and/or
>> Coverity? I imagine it will be the same and they would also need a
>> deviation at every MACRO invocation, not just the definition?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

