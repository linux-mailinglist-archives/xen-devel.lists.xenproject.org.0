Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419372255A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 14:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543697.848883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q697W-0003k1-VK; Mon, 05 Jun 2023 12:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543697.848883; Mon, 05 Jun 2023 12:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q697W-0003iH-Rk; Mon, 05 Jun 2023 12:15:34 +0000
Received: by outflank-mailman (input) for mailman id 543697;
 Mon, 05 Jun 2023 12:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/oe=BZ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q697U-0003iB-QG
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 12:15:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa21ae99-039a-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 14:15:31 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.37.78.171])
 by support.bugseng.com (Postfix) with ESMTPSA id CB90A4EE073A;
 Mon,  5 Jun 2023 14:15:29 +0200 (CEST)
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
X-Inumbo-ID: aa21ae99-039a-11ee-b232-6b7b168915f2
Message-ID: <4dd8c759-8257-740a-1fd4-d61376350d6e@bugseng.com>
Date: Mon, 5 Jun 2023 14:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <def81409-a328-7b13-8dc9-a791d8328d39@citrix.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <def81409-a328-7b13-8dc9-a791d8328d39@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/06/23 10:58, Andrew Cooper wrote:
> On 05/06/2023 6:28 am, Roberto Bagnara wrote:
>> U10) \m escape sequence.
>>       Is this an undocumented GCC extension or just a typo?
> 
> Where are you seeing this?
> 
> The only examples I see are in asm macros, and they're all parameter
> substitutions.
> 
> This includes the one in x86's bug.h where it's a parameter substitution
> into an .ascii string literal, not an escaped special character in the
> literal.

The point is that escape sequences must be considered for tokenization,
which happens in translation phase 3, as they are relevant for phase 4,
which is where preprocessing directives are processed and removed.

See C99 Section "5.1.1.2 Translation phases" for the definition of the
phases.  So \m is non-compliant even in areas guarded by

#if defined(__ASSEMBLY__)

and a conforming compiler should flag it.  On this, see footnote 65 to 6.4.4.4p8,
where the 'm' in '\m' is one of "any other character":

   65) The semantics of these characters were discussed in 5.2.2.
       If any other character follows a backslash, the result is not a token
       and a diagnostic is required. See ‘‘future language directions’’ (6.11.4).

Kind regards,

    Roberto

P.S. Note on passing that the comments on the preprocessing directives
      are a bit misleading due to the use of the exclamation mark
      (IMHO "defined(__ASSEMBLY__)" would be better than "!__ASSEMBLY__"):

#ifndef __ASSEMBLY__

...

#else  /* !__ASSEMBLY__ */

...

#endif /* !__ASSEMBLY__ */


