Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A0D73693B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 12:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551528.861123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYZT-0002rp-U1; Tue, 20 Jun 2023 10:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551528.861123; Tue, 20 Jun 2023 10:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBYZT-0002pk-QS; Tue, 20 Jun 2023 10:26:47 +0000
Received: by outflank-mailman (input) for mailman id 551528;
 Tue, 20 Jun 2023 10:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FRxy=CI=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBYZS-0002pZ-LH
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 10:26:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4b62a46-0f54-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 12:26:45 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.46.142.235])
 by support.bugseng.com (Postfix) with ESMTPSA id 092CB4EE0737;
 Tue, 20 Jun 2023 12:26:43 +0200 (CEST)
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
X-Inumbo-ID: f4b62a46-0f54-11ee-b234-6b7b168915f2
Message-ID: <54c680d7-fa81-4940-6a0c-37d9c1a8d120@bugseng.com>
Date: Tue, 20 Jun 2023 12:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
 <alpine.DEB.2.22.394.2306161317340.897208@ubuntu-linux-20-04-desktop>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2306161317340.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/23 22:43, Stefano Stabellini wrote:
> On Fri, 16 Jun 2023, Roberto Bagnara wrote:
>>>> +   * - Implicit conversion from a pointer to an incompatible pointer
>>>> +     - ARM64, X86_64
>>>> +     - Non-documented GCC extension.
>>>
>>> Is this related to -Wincompatible-pointer-types?
>>
>> In my opinion, this does not specify what the result of the
>> conversion is.
> 
> Fair enough. However, if -Wincompatible-pointer-types and "Implicit
> conversion from a pointer to an incompatible pointer" are related, it
> would add -Wincompatible-pointer-types as extra info about it. See also
> below.
> 
> 
>>>> +   * - Pointer to a function is converted to a pointer to an object or a
>>>> pointer to an object is converted to a pointer to a function
>>>> +     - X86_64
>>>> +     - Non-documented GCC extension.
>>>
>>> Is this J.5.7 of n1570?
>>> https://www.iso-9899.info/n1570.html
>>
>> This says that function pointer casts are a common extension.
>> What we need here is documentation for GCC that assures us
>> that the extension is implemented and what its semantics is.
>>
>>> Or maybe we should link https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83584
>>
>> My opinion is that this might not be accepted by an assessor:
>> if I was an assessor, I would not accept it.
> 
> I understand your point and I think it is valid. My observation was
> that it is better to provide as much information for these undocumented
> extensions as we can. Not necessarily to help with an assessors, but for
> a new engineer working on this project, reading this document and
> understanding what can be done.
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83584 might not be an
> official documentation of the extension but it is better than no
> documentation at all. Even better might be a code example.
> 
> I am not saying we should document ourselves what GCC failed to
> document. I am only saying we should add enough description to
> understand what we are talking about.
> 
> For instance, I read "Pointer to a function is converted to a pointer to
> an object or a pointer to an object is converted to a pointer to a
> function" and I have an idea about what this is but I am not really
> sure. I googled the sentence and found information on Stackoverflow. I
> think it is better to link
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83584 or a couple of
> sentences from it, although it might not be official.
> 
> 
>>>> +   * - Ill-formed source detected by the parser
>>>
>>> As we are documenting compiler extensions that we are using, I am a bit
>>> confused by the name of this category of compiler extensions, and the
>>> reason why they are bundled together. After all, they are all separate
>>> compiler extensions? Should each of them have their own row?
>>
>> Agreed.
>>
>>>> +     - ARM64, X86_64
>>>> +     - token pasting of ',' and __VA_ARGS__ is a GNU extension:
>>>> +          see Section "6.21 Macros with a Variable Number of Arguments"
>>>> of GCC_MANUAL.
>>>> +       must specify at least one argument for '...' parameter of variadic
>>>> macro:
>>>> +          see Section "6.21 Macros with a Variable Number of Arguments"
>>>> of GCC_MANUAL.
>>>> +       void function should not return void expression:
>>>
>>> I understand that GCC does a poor job at documenting several of these
>>> extensions. In fact a few of them are not even documented at all.
>>> However, if they are extensions, they should be described for what they
>>> do, not for the rule they violate. What do you think?
>>
>> The point is that we don't know what they do.  We might make observations,
>> and our observations might substantiate what we believe they do.
>> But this would not allow us to generalize them.
>>
>>> For example, in this case maybe we should say "void function can return
>>> a void expression" ?
>>
>> We can certainly say that, but this might not convince an assessor.
>> One possibility would be to submit patches to the GCC manual and see
>> whether they are accepted.
> 
> I think we have two different target audiences for this document. One
> target is an assessors, and I understand that extra unofficial
> information might not help there.
> 
> However another target is the community. This document should help the
> Xen community write better code, not just the assessors raise red flags.
> Right? It should help us have better compiler compatibility, and making
> sure that we are clear about the C dialect we use. Actually, I think
> this document could be of great help. Do you agree?
> 
>  From that point of view "void function should not return void
> expression" is not understandable. At least I don't understand it.
> 
> A different approach would be to say:
> 
> - this is a MISRA C violation or compiler warning/error
> - it is not C99 compliant
> - it is not documented behavior by GCC
> 
> Not try to describe what the extension is at all, and instead focus on
> what the MISRA C violation or compiler warning is.
> 
> I think it is OK to go down that route, but in that case we need to
> reorganize the document so that:
> - all documented extensions are referred to as extensions
> - all undocumented extensions are referred to by the warning they
>    trigger
> 
> I think that we would be OK but honestly I prefer the current approach
> and we just need to add a few extra words to better explain what the
> undocumented extensions are. Not to replace the GCC manual but simply
> because otherwise we are not understanding each other (at least I am not
> understanding.)
> 
> 
>>>> +          see the documentation for -Wreturn-type in Section "3.8 Options
>>>> to Request or Suppress Warnings" of GCC_MANUAL.
>>>> +       use of GNU statement expression extension from macro expansion:
>>>> +          see Section "6.1 Statements and Declarations in Expressions" of
>>>> GCC_MANUAL.
>>>> +       invalid application of sizeof to a void type:
>>>> +          see Section "6.24 Arithmetic on void- and Function-Pointers" of
>>>> GCC_MANUAL.
>>>> +       redeclaration of already-defined enum is a GNU extension:
>>>> +          see Section "6.49 Incomplete enum Types" of GCC_MANUAL.
>>>> +       static function is used in an inline function with external
>>>> linkage:
>>>> +          non-documented GCC extension.
>>>
>>> I am not sure if I follow about this one. Did you mean "static is used
>>> in an inline function with external linkage" ?
>>
>> An inline function with external linkage can be inlined everywhere.
>> If that calls a static functions, which is not available everywhere,
>> the behavior is not defined.
> 
> Got it. Can we add this sentence you wrote to the doc?

Hi Stefano.

I think all the feedback received has been taken into account.
I will send a revised patch soon.
Kind regards,

    Roberto


