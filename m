Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C3854DC9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681074.1059658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHqr-0004Ec-DC; Wed, 14 Feb 2024 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681074.1059658; Wed, 14 Feb 2024 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHqr-0004BR-82; Wed, 14 Feb 2024 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 681074;
 Wed, 14 Feb 2024 16:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HRx=JX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1raHqp-0004Au-Jb
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:11:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aacd8894-cb53-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:11:10 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A2EF4EE0737;
 Wed, 14 Feb 2024 17:11:10 +0100 (CET)
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
X-Inumbo-ID: aacd8894-cb53-11ee-8a4d-1f161083a0e0
Message-ID: <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
Date: Wed, 14 Feb 2024 17:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
 <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/24 09:43, Jan Beulich wrote:
> On 09.02.2024 10:50, Federico Serafini wrote:
>> On 08/02/24 12:14, Jan Beulich wrote:
>>> On 08.02.2024 11:45, Federico Serafini wrote:
>>>> On 07/02/24 17:19, Jan Beulich wrote:
>>>>> On 07.02.2024 16:58, Federico Serafini wrote:
>>>>>> On 07/02/24 16:24, Jan Beulich wrote:
>>>>>>> On 07.02.2024 16:08, Federico Serafini wrote:
>>>>>>>> On 07/02/24 15:16, Jan Beulich wrote:
>>>>>>>>> On 07.02.2024 14:51, Federico Serafini wrote:
>>>>>>>>>> On 07/02/24 08:38, Jan Beulich wrote:
>>>>>>>>>>> On 07.02.2024 02:08, Stefano Stabellini wrote:
>>>>>>>>>>>> On Tue, 6 Feb 2024, Jan Beulich wrote:
>>>>>>>>>>>>> On 26.01.2024 11:05, Federico Serafini wrote:
>>>>>>>>>>>>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>>>>>>>>>>>>            case 8:                                                                \
>>>>>>>>>>>>>>                put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>>>>>>>>>>>>                break;                                                             \
>>>>>>>>>>>>>> -    default: __put_user_bad();                                             \
>>>>>>>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>>>>>>>            }                                                                      \
>>>>>>>>>>>>>>            clac();                                                                \
>>>>>>>>>>>>>>        } while ( false )
>>>>>>>>>>>>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>>>>>>>>>>>>            case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>>>>>>>>>>>>            case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>>>>>>>>>>>>            case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>>>>>>>>>>>>> -    default: __get_user_bad();                                             \
>>>>>>>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>>>>>>>            }                                                                      \
>>>>>>>>>>>>>>            clac();                                                                \
>>>>>>>>>>>>>>        } while ( false )
>>>>>>>>>>>>>
>>>>>>>>>>>>> Related to my remark on patch 1 - how is one to know the macro this was
>>>>>>>>>>>>> invoked from, when seeing the resulting diagnostic?
>>>>>>>>>>>>
>>>>>>>>>>>> I am not sure what do you mean here... we do get an error like the
>>>>>>>>>>>> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
>>>>>>>>>>>>
>>>>>>>>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>>>>>>>>
>>>>>>>>>>> Right - and how do I know what _user_ of the macro actually triggered
>>>>>>>>>>> it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
>>>>>>>>>>> __FUNCTION__ here, for that specific purpose ...
>>>>>>>>>>
>>>>>>>>>> To test the macro and its diagnostics,
>>>>>>>>>> I modified the first "git grep" occurrence of ASSERT_UNREACHABLE()
>>>>>>>>>> on the x86 code with STATIC_ASSERT_UNREACHABLE(),
>>>>>>>>>> that is in file arch/x86/alternative.c, line 312,
>>>>>>>>>> function _apply_alternatives().
>>>>>>>>>>
>>>>>>>>>> What I got is the following build error:
>>>>>>>>>>
>>>>>>>>>> ...
>>>>>>>>>> arch/x86/alternative.c: Assembler messages:
>>>>>>>>>> arch/x86/alternative.c:312: Error: static assertion failed: unreachable
>>>>>>>>>>         CC      arch/x86/copy_page.o
>>>>>>>>>> make[2]: *** [Rules.mk:247: arch/x86/alternative.o] Error 1
>>>>>>>>>
>>>>>>>>> But that's not what my request was about. Here sufficient context is
>>>>>>>>> given, even if it would be nice if the function was also visible right
>>>>>>>>> away. But that's not the same as the case above, where the new macro
>>>>>>>>> is used inside another macro.
>>>>>>>>
>>>>>>>> An example of that is the get_unsafe_size() macro,
>>>>>>>> whose body uses STATIC_ASSERT_UNREACHABLE().
>>>>>>>> A wrong use of get_unsafe_size() at line n
>>>>>>>> leads to a build error pointing to the line n,
>>>>>>>> isn't this the desired behavior?
>>>>>>>
>>>>>>> Aiui this would point to the line in the header file, when what you need
>>>>>>> to spot the bad use of the macro is the line in the source file actually
>>>>>>> using the macro. Quoting from an earlier mail of yours:
>>>>>>>
>>>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>>>
>>>>>> It points to the header file uaccess.h because at line 262 there is
>>>>>> an intentional wrong use of put_guest_size(), within the body of
>>>>>> __copy_to_guest_pv() function.
>>>>>
>>>>> Yet that's again only a helper function being inlined into the ultimate
>>>>> caller. That ultimate caller is what wants identifying in the diag. Not
>>>>> the least because of ...
>>>>>
>>>>>> This example can be misleading because {get,put}_unsafe_size() are
>>>>>> defined in the same file but the diagnostics is doing the
>>>>>> right thing.
>>>>>
>>>>> ... this. And really __copy_to_guest_pv() is the wrong place to put a
>>>>> wrong put_guest_size() in, to try out how diagnostics would look like
>>>>> in reality: That function falls back to copy_to_guest_ll() for all
>>>>> cases it can't handle directly. You want to place a bogus put_guest()
>>>>> somewhere in a .c file to see what results.
>>>>
>>>> I added a bogus call to put_guest() at line 387 of
>>>> file xen/arch/x86/mm.c, inside function page_is_ram_type().
>>>> Assuming I did not choose another wrong place,
>>>> the diagnostic seems appropriate:
>>>>
>>>> arch/x86/mm.c: Assembler messages:
>>>> arch/x86/mm.c:387: Error: static assertion failed: unreachable
>>>
>>> Oh, okay, this looks appropriate then as to identifying where the
>>> source construct is. However, we then still don't know where the
>>> assertion in question is (there could be multiple in what the
>>> original construct expands to). So I'm still inclined to ask that
>>> __FILE__ / __LINE__ and/or the name of the invoking construct
>>> (macro or function) be made visible in the diagnostic.
>>
>> Any use of __FILE__ and __LINE__ results in obtaining
>> the same information already reported by the assembler error message.
> 
> Hmm, yes, since put_guest() is itself a macro.
> 
>> We could add an argument to the new macro to manually add some context
>> at every use of the macro, but I think this would be annoying.
> 
> That's a last resort. An alternative would be to see about converting
> from macros to inline functions, where this would make a difference
> here.

I did some tries with example programs
and the assembler error always points to file and line
of the most enclosing function that caused the failure.
If I am not missing something, using __FILE__ and __LINE__ does not add
any information.

Therefore, if the new macro is used within the body of other macros,
then the resulting assembler error will point to the source of
the problem (e.g., the site of a bogus call to put_guest()).

In my opinion, converting put_guest() &Co. to inline functions is not
convenient: the assembler error will point to the most enclosing
function that would be put_unsafe_size(), instead of pointing to the
source of the problem.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

