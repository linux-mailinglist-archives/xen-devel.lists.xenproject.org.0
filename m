Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74D733532
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 17:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550302.859296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABm3-0004YC-UF; Fri, 16 Jun 2023 15:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550302.859296; Fri, 16 Jun 2023 15:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABm3-0004W2-RZ; Fri, 16 Jun 2023 15:54:07 +0000
Received: by outflank-mailman (input) for mailman id 550302;
 Fri, 16 Jun 2023 15:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twrt=CE=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qABm1-0004Vw-SF
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 15:54:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04d43ccd-0c5e-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 17:54:04 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.35.105.218])
 by support.bugseng.com (Postfix) with ESMTPSA id 20F854EE073A;
 Fri, 16 Jun 2023 17:54:03 +0200 (CEST)
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
X-Inumbo-ID: 04d43ccd-0c5e-11ee-b232-6b7b168915f2
Message-ID: <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
Date: Fri, 16 Jun 2023 17:54:02 +0200
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
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/23 01:26, Stefano Stabellini wrote:
> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>> This document specifies the C language dialect used by Xen and
>> the assumptions Xen makes on the translation toolchain.
>>
>> Signed-off-by: Roberto Bagnara <roberto.bagnara@bugseng.com>
> 
> Thanks Roberto for the amazing work of research and archaeology.
> 
> I have a few comments below, mostly to clarify the description of some
> of the less documented GCC extensions, for the purpose of having all
> community members be able to understand what they can and cannot use.
>> +   * - Arithmetic operator on void type
>> +     - ARM64, X86_64
>> +     - See Section "6.24 Arithmetic on void- and Function-Pointers" of GCC_MANUAL."
>> +
>> +   * - GNU statement expression
> 
> "GNU statement expression" is not very clear, at least for me. I would
> call it "Statements and Declarations in Expressions".

Agreed.

>> +   * - Empty declaration
>> +     - ARM64, X86_64
>> +     - Non-documented GCC extension.
> 
> For the non-documented GCC extensions, would it be possible to add a
> very brief example or a couple of words in the "References" sections?
> Otherwise I think people might not understand what we are talking about.

Ok.

>> +   * - Incomplete enum declaration
>> +     - ARM64
>> +     - Non-documented GCC extension.
> 
> Is this 6.49 of the GCC manual perhaps?

Indeed, on a second reading, I think that section covers also the case
of an enum declaration that is never completed in the course of the
translation unit.

>> +   * - Implicit conversion from a pointer to an incompatible pointer
>> +     - ARM64, X86_64
>> +     - Non-documented GCC extension.
> 
> Is this related to -Wincompatible-pointer-types?

In my opinion, this does not specify what the result of the
conversion is.

>> +   * - Pointer to a function is converted to a pointer to an object or a pointer to an object is converted to a pointer to a function
>> +     - X86_64
>> +     - Non-documented GCC extension.
> 
> Is this J.5.7 of n1570?
> https://www.iso-9899.info/n1570.html

This says that function pointer casts are a common extension.
What we need here is documentation for GCC that assures us
that the extension is implemented and what its semantics is.

> Or maybe we should link https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83584

My opinion is that this might not be accepted by an assessor:
if I was an assessor, I would not accept it.

>> +   * - Ill-formed source detected by the parser
> 
> As we are documenting compiler extensions that we are using, I am a bit
> confused by the name of this category of compiler extensions, and the
> reason why they are bundled together. After all, they are all separate
> compiler extensions? Should each of them have their own row?

Agreed.

>> +     - ARM64, X86_64
>> +     - token pasting of ',' and __VA_ARGS__ is a GNU extension:
>> +          see Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.
>> +       must specify at least one argument for '...' parameter of variadic macro:
>> +          see Section "6.21 Macros with a Variable Number of Arguments" of GCC_MANUAL.
>> +       void function should not return void expression:
> 
> I understand that GCC does a poor job at documenting several of these
> extensions. In fact a few of them are not even documented at all.
> However, if they are extensions, they should be described for what they
> do, not for the rule they violate. What do you think?

The point is that we don't know what they do.  We might make observations,
and our observations might substantiate what we believe they do.
But this would not allow us to generalize them.

> For example, in this case maybe we should say "void function can return
> a void expression" ?

We can certainly say that, but this might not convince an assessor.
One possibility would be to submit patches to the GCC manual and see
whether they are accepted.

>> +          see the documentation for -Wreturn-type in Section "3.8 Options to Request or Suppress Warnings" of GCC_MANUAL.
>> +       use of GNU statement expression extension from macro expansion:
>> +          see Section "6.1 Statements and Declarations in Expressions" of GCC_MANUAL.
>> +       invalid application of sizeof to a void type:
>> +          see Section "6.24 Arithmetic on void- and Function-Pointers" of GCC_MANUAL.
>> +       redeclaration of already-defined enum is a GNU extension:
>> +          see Section "6.49 Incomplete enum Types" of GCC_MANUAL.
>> +       static function is used in an inline function with external linkage:
>> +          non-documented GCC extension.
> 
> I am not sure if I follow about this one. Did you mean "static is used
> in an inline function with external linkage" ?

An inline function with external linkage can be inlined everywhere.
If that calls a static functions, which is not available everywhere,
the behavior is not defined.

>> +       struct may not be nested in a struct due to flexible array member:
>> +          see Section "6.18 Arrays of Length Zero" of GCC_MANUAL.
>> +       struct may not be used as an array element due to flexible array member:
>> +          see Section "6.18 Arrays of Length Zero" of GCC_MANUAL.
>> +       ISO C restricts enumerator values to the range of int:
>> +          non-documented GCC extension.
> 
> Should we call it instead "enumerator values can be larger than int" ?

Yes, I have rephrased that entry.

>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>> +     - X86_64
>> +     - \\m:
>> +          non-documented GCC extension.
> 
> Are you saying that we are using \m and \m is not allowed by the C
> standard?

The C standard does not specify that escape sequence, so what is
done with it, in particular by the preprocessor, is not specified.

>> +   * - Non-standard type
> 
> Should we call it "128-bit Integers" ?

I have rephrased this as suggested by Jan.

Thanks for your review.  I will submit a revised patch
on Monday.
Kind regards,

     Roberto

