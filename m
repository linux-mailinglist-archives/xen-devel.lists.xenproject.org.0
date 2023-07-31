Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78687769704
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573026.897311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSXx-0001wM-Ae; Mon, 31 Jul 2023 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573026.897311; Mon, 31 Jul 2023 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSXx-0001tX-7j; Mon, 31 Jul 2023 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 573026;
 Mon, 31 Jul 2023 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQSXv-0001tQ-Vx
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:02:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b03a7cb-2fa2-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 15:02:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 71EA34EE0737;
 Mon, 31 Jul 2023 15:02:45 +0200 (CEST)
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
X-Inumbo-ID: 8b03a7cb-2fa2-11ee-b255-6b7b168915f2
MIME-Version: 1.0
Date: Mon, 31 Jul 2023 15:02:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/4] x86: mechanically rename to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <d7b55bb0-328f-b99b-71b8-708ad40b3d64@suse.com>
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <b169d1c682254e682e6ed34f33481a768209ce9b.1690788513.git.nicola.vetrini@bugseng.com>
 <bdd5376b-477f-71e1-94db-71a2e4cb716e@suse.com>
 <d7b55bb0-328f-b99b-71b8-708ad40b3d64@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <587b95a61d9ca41fa7544a79ed337226@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 31/07/2023 13:21, Jan Beulich wrote:
> On 31.07.2023 13:15, Jan Beulich wrote:
>> On 31.07.2023 09:33, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/save.h
>>> +++ b/xen/arch/x86/include/asm/hvm/save.h
>>> @@ -49,21 +49,21 @@ void _hvm_read_entry(struct hvm_domain_context 
>>> *h,
>>>   */
>>>  #define _hvm_load_entry(_x, _h, _dst, _strict) ({                    
>>>    \
>>>      int r;                                                           
>>>    \
>>> -    struct hvm_save_descriptor *desc                                 
>>>    \
>>> +    struct hvm_save_descriptor *descriptor                           
>>>    \
>>>          = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];      
>>>    \
>>>      if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),              
>>>    \
>>>                 HVM_SAVE_LENGTH(_x), (_strict))) == 0 )               
>>>    \
>>>      {                                                                
>>>    \
>>>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));          
>>>    \
>>>          if ( HVM_SAVE_HAS_COMPAT(_x) &&                              
>>>    \
>>> -             desc->length != HVM_SAVE_LENGTH(_x) )                   
>>>    \
>>> -            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);       
>>>    \
>>> +             descriptor->length != HVM_SAVE_LENGTH(_x) )             
>>>    \
>>> +            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length); 
>>>    \
>>>      }                                                                
>>>    \
>>>      else if (HVM_SAVE_HAS_COMPAT(_x)                                 
>>>    \
>>>               && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),       
>>>    \
>>>                         HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 
>>> ) { \
>>>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));   
>>>    \
>>> -        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);           
>>>    \
>>> +        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);     
>>>    \
>>>      }                                                                
>>>    \
>>>      r; })
>> 
>> The macro-local variable gets too long for my taste, to be honest,
>> and it being improperly named anyway suggests it simply wants a
>> trailing underscore added. And then, since for a variable named "r"
>> the risk of shadowing is equally high, that one wants to gain a
>> trailing underscore as well imo. (And while at it, I personally
>> would also drop the leading underscores from the macro parameter
>> names. Furthermore I think it would be nice if at on the lines
>> touched anyway indentation was also corrected. Overall maybe best
>> if I submit a patch.)
> 
> In that replacement patch I would like to mention what "desc" this
> collides with, but your description didn't say so and I'm afraid I
> also haven't been able to spot it (grep-ing for "desc", even with
> a couple of extra restrictions, still yields way too many hits).
> 
> Jan

It's the local variable in 'xen/arch/x86/hvm/save.c:281', but since the 
macro
is used elsewhere quite a few times, doing a suitable rename inside it
(that does not shadow anything) prevents other users from possibly 
shadowing it
in the future. Your points are all agreeable in my opinion. Since your 
concerns
with this macro are also about issues other than MISRA violations, I 
agree that
this patch should be dropped.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

