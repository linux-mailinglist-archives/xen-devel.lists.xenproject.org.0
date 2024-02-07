Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65384CE79
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677797.1054646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkJc-000178-8C; Wed, 07 Feb 2024 15:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677797.1054646; Wed, 07 Feb 2024 15:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkJc-00015L-4R; Wed, 07 Feb 2024 15:58:24 +0000
Received: by outflank-mailman (input) for mailman id 677797;
 Wed, 07 Feb 2024 15:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Py/x=JQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rXkJb-00015D-9t
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:58:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b74df7d8-c5d1-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 16:58:21 +0100 (CET)
Received: from [192.168.1.15] (host-87-16-84-78.retail.telecomitalia.it
 [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id 44D0D4EE0738;
 Wed,  7 Feb 2024 16:58:20 +0100 (CET)
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
X-Inumbo-ID: b74df7d8-c5d1-11ee-98f5-efadbce2ee36
Message-ID: <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
Date: Wed, 7 Feb 2024 16:58:19 +0100
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
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/24 16:24, Jan Beulich wrote:
> On 07.02.2024 16:08, Federico Serafini wrote:
>> On 07/02/24 15:16, Jan Beulich wrote:
>>> On 07.02.2024 14:51, Federico Serafini wrote:
>>>> On 07/02/24 08:38, Jan Beulich wrote:
>>>>> On 07.02.2024 02:08, Stefano Stabellini wrote:
>>>>>> On Tue, 6 Feb 2024, Jan Beulich wrote:
>>>>>>> On 26.01.2024 11:05, Federico Serafini wrote:
>>>>>>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>>>>>>         case 8:                                                                \
>>>>>>>>             put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>>>>>>             break;                                                             \
>>>>>>>> -    default: __put_user_bad();                                             \
>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>         }                                                                      \
>>>>>>>>         clac();                                                                \
>>>>>>>>     } while ( false )
>>>>>>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>>>>>>         case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>>>>>>         case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>>>>>>         case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>>>>>>> -    default: __get_user_bad();                                             \
>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>         }                                                                      \
>>>>>>>>         clac();                                                                \
>>>>>>>>     } while ( false )
>>>>>>>
>>>>>>> Related to my remark on patch 1 - how is one to know the macro this was
>>>>>>> invoked from, when seeing the resulting diagnostic?
>>>>>>
>>>>>> I am not sure what do you mean here... we do get an error like the
>>>>>> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
>>>>>>
>>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>>
>>>>> Right - and how do I know what _user_ of the macro actually triggered
>>>>> it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
>>>>> __FUNCTION__ here, for that specific purpose ...
>>>>
>>>> To test the macro and its diagnostics,
>>>> I modified the first "git grep" occurrence of ASSERT_UNREACHABLE()
>>>> on the x86 code with STATIC_ASSERT_UNREACHABLE(),
>>>> that is in file arch/x86/alternative.c, line 312,
>>>> function _apply_alternatives().
>>>>
>>>> What I got is the following build error:
>>>>
>>>> ...
>>>> arch/x86/alternative.c: Assembler messages:
>>>> arch/x86/alternative.c:312: Error: static assertion failed: unreachable
>>>>      CC      arch/x86/copy_page.o
>>>> make[2]: *** [Rules.mk:247: arch/x86/alternative.o] Error 1
>>>
>>> But that's not what my request was about. Here sufficient context is
>>> given, even if it would be nice if the function was also visible right
>>> away. But that's not the same as the case above, where the new macro
>>> is used inside another macro.
>>
>> An example of that is the get_unsafe_size() macro,
>> whose body uses STATIC_ASSERT_UNREACHABLE().
>> A wrong use of get_unsafe_size() at line n
>> leads to a build error pointing to the line n,
>> isn't this the desired behavior?
> 
> Aiui this would point to the line in the header file, when what you need
> to spot the bad use of the macro is the line in the source file actually
> using the macro. Quoting from an earlier mail of yours:
> 
> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable

It points to the header file uaccess.h because at line 262 there is
an intentional wrong use of put_guest_size(), within the body of
__copy_to_guest_pv() function.
This example can be misleading because {get,put}_unsafe_size() are
defined in the same file but the diagnostics is doing the
right thing.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

