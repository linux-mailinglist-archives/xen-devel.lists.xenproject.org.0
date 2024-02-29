Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8886CF70
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687308.1070601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjS1-0007dX-PC; Thu, 29 Feb 2024 16:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687308.1070601; Thu, 29 Feb 2024 16:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjS1-0007bS-Lf; Thu, 29 Feb 2024 16:40:05 +0000
Received: by outflank-mailman (input) for mailman id 687308;
 Thu, 29 Feb 2024 16:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfjRz-0007DF-RO
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:40:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3c2ac7-d721-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:40:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id AA2404EE0737;
 Thu, 29 Feb 2024 17:40:01 +0100 (CET)
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
X-Inumbo-ID: 2f3c2ac7-d721-11ee-afd8-a90da7624cb6
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 17:40:01 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
In-Reply-To: <26be05f7-7361-40d9-92f2-cf2e22da9d4e@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
 <26be05f7-7361-40d9-92f2-cf2e22da9d4e@suse.com>
Message-ID: <4143df23c3d1f8dcb7fcc2d97e077d01@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-02-29 17:25, Jan Beulich wrote:
> On 29.02.2024 16:27, Nicola Vetrini wrote:
>> --- a/xen/include/xen/kconfig.h
>> +++ b/xen/include/xen/kconfig.h
>> @@ -25,7 +25,7 @@
>>  #define __ARG_PLACEHOLDER_1 0,
>>  #define config_enabled(cfg) _config_enabled(cfg)
>>  #define _config_enabled(value) 
>> __config_enabled(__ARG_PLACEHOLDER_##value)
>> -#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 
>> 1, 0)
>> +#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 
>> (1), (0))
>>  #define ___config_enabled(__ignored, val, ...) val
> 
> In addition to what Andrew said, would you mind clarifying what exactly 
> the
> violation is here? I find it questionable that numeric literals need
> parenthesizing; they don't normally need to, aynwhere.
> 

This one's a little special. I couldn't parenthesize val further down, 
because then it would break the build:

In file included from ././include/xen/config.h:14,
                  from <command-line>:
./include/xen/kconfig.h:29:52: error: expected identifier or ‘(’ before 
‘)’ token
    29 | #define ___config_enabled(__ignored, val, ...) (val)
       |                                                    ^
./include/xen/kconfig.h:39:34: note: in expansion of macro 
‘___config_enabled’
    39 | #define _static_if(arg1_or_junk) ___config_enabled(arg1_or_junk 
static,)
       |                                  ^~~~~~~~~~~~~~~~~
./include/xen/kconfig.h:38:26: note: in expansion of macro ‘_static_if’
    38 | #define static_if(value) _static_if(__ARG_PLACEHOLDER_##value)
       |                          ^~~~~~~~~~
./include/xen/kconfig.h:41:27: note: in expansion of macro ‘static_if’
    41 | #define STATIC_IF(option) static_if(option)
       |                           ^~~~~~~~~
common/page_alloc.c:260:1: note: in expansion of macro ‘STATIC_IF’
   260 | STATIC_IF(CONFIG_NUMA) mfn_t first_valid_mfn = 
INVALID_MFN_INITIALIZER;
       | ^~~~~~~~~
make[2]: *** [Rules.mk:249: common/page_alloc.o] Error 1


>> --- a/xen/include/xen/list.h
>> +++ b/xen/include/xen/list.h
>> @@ -490,9 +490,9 @@ static inline void list_splice_init(struct 
>> list_head *list,
>>   * @member: the name of the list_struct within the struct.
>>   */
>>  #define list_for_each_entry(pos, head, member)                        
>>   \
>> -    for (pos = list_entry((head)->next, typeof(*pos), member);        
>>   \
>> -         &pos->member != (head);                                      
>>   \
>> -         pos = list_entry(pos->member.next, typeof(*pos), member))
>> +    for (pos = list_entry((head)->next, typeof(*(pos)), member);      
>>     \
>> +         &(pos)->member != (head);                                    
>>   \
>> +         pos = list_entry((pos)->member.next, typeof(*(pos)), 
>> member))
> 
> this ends up inconsistent, which I think isn't nice: Some uses of "pos"
> are now parenthesized, while others aren't. Applies further down as 
> well.
> 

Yeah, the inconsistency is due to the fact that a non-parenthesized 
parameter as lhs is already deviated. To keep it consistent here I can 
add parentheses, but then the deviation would be kind of pointless, 
wouldn't it?

> You may also want to take this as a strong suggestion to split 
> dissimilar
> changes, so uncontroversial parts can go in.
> 

Ok, that was an oversight.

>> @@ -977,4 +977,3 @@ static inline void hlist_add_after_rcu(struct 
>> hlist_node *prev,
>>            pos = pos->next)
>> 
>>  #endif /* __XEN_LIST_H__ */
>> -
> 
> Unrelated change?
> 

Oh, yes. Will drop it.

>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -94,7 +94,7 @@ struct lock_profile_qhead {
>>      int32_t                   idx;     /* index for printout */
>>  };
>> 
>> -#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = 
>> &lockname, }
>> +#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = 
>> &(lockname), }
> 
> This also may be viewed as falling in the same category, but is less
> problematic because the other use is stringification, when in principle
> some kind of expression would be passed in (albeit in practice I don't
> expect anyone would do that).
> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

