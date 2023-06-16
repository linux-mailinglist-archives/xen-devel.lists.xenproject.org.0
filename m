Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D97334AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 17:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550281.859267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABJ8-0008PL-3W; Fri, 16 Jun 2023 15:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550281.859267; Fri, 16 Jun 2023 15:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qABJ8-0008M1-0H; Fri, 16 Jun 2023 15:24:14 +0000
Received: by outflank-mailman (input) for mailman id 550281;
 Fri, 16 Jun 2023 15:24:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twrt=CE=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qABJ6-0008Lv-9I
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 15:24:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d410202c-0c59-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 17:24:04 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.35.105.218])
 by support.bugseng.com (Postfix) with ESMTPSA id 9981A4EE073A;
 Fri, 16 Jun 2023 17:24:03 +0200 (CEST)
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
X-Inumbo-ID: d410202c-0c59-11ee-8611-37d641c3527e
Message-ID: <180c2497-1ff0-1230-76b1-08c1c578912f@bugseng.com>
Date: Fri, 16 Jun 2023 17:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <7eaadcb4-8580-b240-4451-5a98c66ebe5a@suse.com>
 <47325b0b-2ccc-6485-da59-2c0a367c2bf0@bugseng.com>
 <5a7fe98d-28de-dd7a-addb-9122226d5419@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <5a7fe98d-28de-dd7a-addb-9122226d5419@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/23 12:03, Jan Beulich wrote:
> On 16.06.2023 09:45, Roberto Bagnara wrote:
>> On 16/06/23 08:53, Jan Beulich wrote:
>>> On 16.06.2023 01:26, Stefano Stabellini wrote:
>>>>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>>>>> +     - X86_64
>>>>> +     - \\m:
>>>>> +          non-documented GCC extension.
>>>>
>>>> Are you saying that we are using \m and \m is not allowed by the C
>>>> standard?
>>>
>>> This exists in the __ASSEMBLY__ part of a header, and I had previously
>>> commented on Roberto's diagnosis (possibly derived from Eclair's) here.
>>> As per that I don't think the item should be here, but I'm of course
>>> open to be shown that my understanding of translation phases is wrong.
>>
>> I was not convinced by your explanation but, as I think I have said already,
>> I am not the one to be convinced.  In the specific case, independently
>> from __ASSEMBLY__ or any other considerations, that thing reaches the C
>> preprocessor and, to the best of my knowledge, the C preprocessor documentation
>> does not say how that would be handled.  I have spent a lot of time in the
>> past 10 years on the study of functional-safety standards, and what I
>> am providing is a honest opinion on what I believe is compliant
>> and what is not.  But I may be wrong of course: if you or anyone else feels
>> like they would not have any problems in arguing a different position
>> from mine in front of an assessor, then please go for it, but please
>> do not ask me to go beyond my judgment.
> 
> Well, disagreement on purely a technical matter can usually be resolved,
> unless something is truly unspecified. Since you referred to translation
> phases, and since I pointed out that preprocessing directives are carried
> out before escape sequences are converted to the execution character set
> (which is the point where unknown escape sequences would matter afaict),
> there must be something you view differently in this process. It would be
> helpful if you could point out what this is, possibly leading to me
> recognizing a mistake of mine.
> 
> Actually, maybe I figured what you're concerned about: Already at the
> stage of decomposing into preprocessing-token-s there is an issue, as
> e.g. "\mode" doesn't form a valid string-literal. For other, unquoted
> \m I would assume though that the final "each non-white-space character
> that cannot be one of the above" (in the enumeration of what a
> preprocessing-token is) would catch it.

Yes but, more generally, my concern is that the behavior in presence
of unspecified escape sequences is not specified in the C99 standard
and it is not a documented extension according to the documentation
I have examined.  For this reason, I don't think that feature is
usable for safety-related development unless other (potentially
quite expensive) activities are performed (such as prescribing
extra validation activities for the preprocessor).

> Furthermore it is entirely unclear to me what it is that you suggest we
> do instead. It can't reasonably be "name all you assembler macro
> parameters such that they start with a, b, f, n, r, t, or v". Splitting
> headers also wouldn't be very nice - we try to keep related things
> together, after all. It also doesn't look like __stringify(\mode) would
> be okay, as macro expansion shares a translation phase with execution
> of preprocessing directives (so in principle the body of "#if 0" could
> be macro-expanded before being discarded). (Plus I think this would
> result in "\\mode", i.e. also wouldn't work in the first place. But it
> would rule out other possible C macro trickery as well.)

My suggestion is avoiding the use of the C preprocessor
outside its specification.  This includes, among other
possibilities:

a) using a different preprocessor or substitution mechanism;
b) amend the preprocessor specification by, e.g., submitting
    patches with suitable additions for "The C Preprocessor"
    manual of GCC.

In view of that, naming macro parameters so that you never
have an unspecified escape sequence is probably the cheapest
(yet bulletproof) solution.
Kind regards,

    Roberto

