Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99493732920
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 09:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550032.858907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA492-0001H6-LJ; Fri, 16 Jun 2023 07:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550032.858907; Fri, 16 Jun 2023 07:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA492-0001DP-IC; Fri, 16 Jun 2023 07:45:20 +0000
Received: by outflank-mailman (input) for mailman id 550032;
 Fri, 16 Jun 2023 07:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twrt=CE=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qA491-0001DJ-Gx
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 07:45:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbf5973f-0c19-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 09:45:16 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.57.159.155])
 by support.bugseng.com (Postfix) with ESMTPSA id 826FB4EE0738;
 Fri, 16 Jun 2023 09:45:14 +0200 (CEST)
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
X-Inumbo-ID: bbf5973f-0c19-11ee-8611-37d641c3527e
Message-ID: <47325b0b-2ccc-6485-da59-2c0a367c2bf0@bugseng.com>
Date: Fri, 16 Jun 2023 09:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <7eaadcb4-8580-b240-4451-5a98c66ebe5a@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <7eaadcb4-8580-b240-4451-5a98c66ebe5a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/23 08:53, Jan Beulich wrote:
> On 16.06.2023 01:26, Stefano Stabellini wrote:
>> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>> I have a few comments below, mostly to clarify the description of some
>> of the less documented GCC extensions, for the purpose of having all
>> community members be able to understand what they can and cannot use.
> 
> What do you mean by "can and cannot use"? Is this document intended to
> forbid the use of any extensions we may not currently use, or we use
> but which aren't enumerated here?
> 
> One of the reasons that kept me from replying to this submission is
> that the full purpose of this new doc isn't stated in the description.

My full purpose was to give the community a starting point for the
discussion on the assumptions the project makes on the programming
language and the translation toolchains that are intended to be used
now or in the future.  As far as I know, no documentation is currently
provided on these topics, so I believe the document fills a gap and
I hope it is good enough as a starting point.

> Which in turn leaves open whether certain items actually need to be
> here (see e.g. the libc related remark below).

Because the analyzed build used to included some of the tools, which in turn
relied on libc for program termination.  Once confirmation is given
that the analyzed build is now what is intended, all references to
libc can be removed.

> Another is that it's
> hard to tell how to convince oneself of this being an exhaustive
> enumeration. One extension we use extensively yet iirc is missing here
> is omission of the middle operand of the ternary operator.

Not sure I understand: do you mean something different from the following
entry in the document?

    * - Binary conditional expression
      - ARM64, X86_64
      - See Section "6.8 Conditionals with Omitted Operands" of GCC_MANUAL.


>>> +Reference Documentation
>>> +_______________________
>>> +
>>> +The following documents are referred to in the sequel:
>>> +
>>> +GCC_MANUAL:
>>> +  https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gcc.pdf
>>> +CPP_MANUAL:
>>> +  https://gcc.gnu.org/onlinedocs/gcc-12.1.0/cpp.pdf
> 
> Why 12.1 when meanwhile there's 12.3 and 13.1?

For no special reason: as I said, my purpose is only to provide
a starting point for discussion and customization of the
assumptions.

>>> +ARM64_ABI_MANUAL:
>>> +  https://github.com/ARM-software/abi-aa/blob/60a8eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst
>>> +X86_64_ABI_MANUAL:
>>> +  https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build
>>> +ARM64_LIBC_MANUAL:
>>> +  https://www.gnu.org/software/libc/manual/pdf/libc.pdf
>>> +X86_64_LIBC_MANUAL:
>>> +  https://www.gnu.org/software/libc/manual/pdf/libc.pdf
> 
> How is libc relevant to the hypervisor?

See above.

>>> +   * - Empty declaration
>>> +     - ARM64, X86_64
>>> +     - Non-documented GCC extension.
>>
>> For the non-documented GCC extensions, would it be possible to add a
>> very brief example or a couple of words in the "References" sections?
>> Otherwise I think people might not understand what we are talking about.
>>
>> For instance in this case I would say:
>>
>> An empty declaration is a semicolon with nothing before it.
>> Non-documented GCC extension.
> 
> Which then could be confused with empty statements. I think in a document
> like this language needs to be very precise, to avoid ambiguities and
> confusion as much as possible. (Iirc from going over this doc yesterday
> this applies elsewhere as well.)

OK.

>>> +   * - Ill-formed source detected by the parser
>>
>> As we are documenting compiler extensions that we are using, I am a bit
>> confused by the name of this category of compiler extensions, and the
>> reason why they are bundled together. After all, they are all separate
>> compiler extensions? Should each of them have their own row?
> 
> +1

OK.

>>> +
>>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>>> +     - X86_64
>>> +     - \\m:
>>> +          non-documented GCC extension.
>>
>> Are you saying that we are using \m and \m is not allowed by the C
>> standard?
> 
> This exists in the __ASSEMBLY__ part of a header, and I had previously
> commented on Roberto's diagnosis (possibly derived from Eclair's) here.
> As per that I don't think the item should be here, but I'm of course
> open to be shown that my understanding of translation phases is wrong.

I was not convinced by your explanation but, as I think I have said already,
I am not the one to be convinced.  In the specific case, independently
from __ASSEMBLY__ or any other considerations, that thing reaches the C
preprocessor and, to the best of my knowledge, the C preprocessor documentation
does not say how that would be handled.  I have spent a lot of time in the
past 10 years on the study of functional-safety standards, and what I
am providing is a honest opinion on what I believe is compliant
and what is not.  But I may be wrong of course: if you or anyone else feels
like they would not have any problems in arguing a different position
from mine in front of an assessor, then please go for it, but please
do not ask me to go beyond my judgment.

>>> +   * - Non-standard type
>>
>> Should we call it "128-bit Integers" ?
> 
> Or better more generally "Extended integer types" (or something along
> these lines, i.e. as these are called in the spec)?

OK, "Extended integer types" is indeed a good summary of item 1 of
C99 Section "J.3.5 Integers", which is
"Any extended integer types that exist in the implementation (6.2.5)."


