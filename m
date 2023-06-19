Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CAD7358D9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 15:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551128.860483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFBQ-0005w3-Gt; Mon, 19 Jun 2023 13:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551128.860483; Mon, 19 Jun 2023 13:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBFBQ-0005tb-E4; Mon, 19 Jun 2023 13:44:40 +0000
Received: by outflank-mailman (input) for mailman id 551128;
 Mon, 19 Jun 2023 13:44:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8v/a=CH=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1qBFBO-0005tV-Cl
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 13:44:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de153c6-0ea7-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 15:44:36 +0200 (CEST)
Received: from [192.168.1.143] (unknown [151.37.186.123])
 by support.bugseng.com (Postfix) with ESMTPSA id 53CB14EE074F;
 Mon, 19 Jun 2023 15:44:34 +0200 (CEST)
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
X-Inumbo-ID: 6de153c6-0ea7-11ee-8611-37d641c3527e
Message-ID: <8f8545c1-02f8-6dfc-8320-8cc0175d5b37@bugseng.com>
Date: Mon, 19 Jun 2023 15:44:32 +0200
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
 <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
 <90eec636-7ae5-8e1b-1561-0de62e0bc799@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <90eec636-7ae5-8e1b-1561-0de62e0bc799@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/23 09:54, Jan Beulich wrote:
> On 16.06.2023 17:54, Roberto Bagnara wrote:
>> On 16/06/23 01:26, Stefano Stabellini wrote:
>>> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>>>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>>>> +     - X86_64
>>>> +     - \\m:
>>>> +          non-documented GCC extension.
>>>
>>> Are you saying that we are using \m and \m is not allowed by the C
>>> standard?
>>
>> The C standard does not specify that escape sequence, so what is
>> done with it, in particular by the preprocessor, is not specified.
> 
> Isn't it rather that gcc doesn't follow the spec to the word here?
> As per what preprocessing-token can be, anything that isn't (among
> other things) a string-literal or a character-constants falls under
> "each non-white-space character that cannot be one of the above".
> Hence since "\mode" doesn't form a valid string literal, it would
> need to become (using '' notation for separation purposes, not to
> indicate character constants) '"' '\' 'mode'. Which of course would
> break what subsequently are string literals, as the supposedly
> closing double-quote would now be an opening one. Which in turn is
> presumably the reason why gcc (and probably other compilers as well)
> behaves the way it does.

After a significant amount of work on the matter, we came to the
following conclusions:

1) In this matter, the C Standard is not at all clear regarding
    the conditions upon which it is legitimate placing undefined
    escape sequences in the sources.
2) The GNU C preprocessor manual says nothing in this regard.
3) Experimenting with a lot of compilers, it seems all implementers
    have filled the dots in the same way, that is: during translation
    phase 3, escape sequences are considered for the sole purpose
    of getting preprocessing tokens right; escape sequences, whether
    defined or undefined, are left untouched and passed over to translation
    phase 4.

Summarizing, we are now convinced that what we are facing is one
of the cases (there are many of them), where the C Standard is
not being clear, and not a case of undefined behavior.  Xen use
of \m guarded by __ASSEMBLY__ is thus correct and not problematic.
Indeed, the check for undefined escape sequences can only
be done after preprocessing.  I have asked that ECLAIR
is suitably amended.

Thank you all, and particularly to Jan, for the perseverance.
Kind regards,

    Roberto

