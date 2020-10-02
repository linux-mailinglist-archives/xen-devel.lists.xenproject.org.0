Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278612810B2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1871.5686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIYH-0006hl-Ps; Fri, 02 Oct 2020 10:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1871.5686; Fri, 02 Oct 2020 10:44:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIYH-0006hI-MA; Fri, 02 Oct 2020 10:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1871;
 Fri, 02 Oct 2020 10:44:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOIYF-0006h7-T1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:44:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1740d6cf-db0f-45f5-8233-8873f8171feb;
 Fri, 02 Oct 2020 10:44:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0ADE9ACAD;
 Fri,  2 Oct 2020 10:44:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOIYF-0006h7-T1
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:44:35 +0000
X-Inumbo-ID: 1740d6cf-db0f-45f5-8233-8873f8171feb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1740d6cf-db0f-45f5-8233-8873f8171feb;
	Fri, 02 Oct 2020 10:44:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601635473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xgE+nqyEaQw5Ij1Kk5qp+kgeR+fceHPDhKSaD2W3teE=;
	b=aZUVPBCbfgEWLTEN/wSEYWzQ74GMA7uuGOeOecWow50KfllG8Sht9FfcfyU607ivYVXGi5
	hAz01rr56zHfu9VnfQ+eefrHkxJ4H+R8Js7gttRs7mUwPLoLuZYkgXh1vTrteczmQAh6Nz
	peygP0ENhdfeObyld8dmZeIKzcKslSw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0ADE9ACAD;
	Fri,  2 Oct 2020 10:44:33 +0000 (UTC)
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
 <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
 <8ddad01e-cf1a-7752-1371-a505fb26dc47@suse.com>
 <90a39759-63c1-28b9-f112-d8b3cc083565@suse.com>
 <558774ab-92cb-90ae-3936-4f9cc9d56fd0@suse.com>
 <5B52FDF2-18DA-4342-9280-0D497FAB6532@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <75346ac2-20f3-c868-4ac9-0d5a2e65d436@suse.com>
Date: Fri, 2 Oct 2020 12:44:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5B52FDF2-18DA-4342-9280-0D497FAB6532@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.20 12:12, Bertrand Marquis wrote:
> Hi,
> 
>> On 2 Oct 2020, at 08:25, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 02.10.20 08:59, Jan Beulich wrote:
>>> On 02.10.2020 08:51, Jürgen Groß wrote:
>>>> On 02.10.20 08:20, Jan Beulich wrote:
>>>>> On 02.10.2020 06:50, Jürgen Groß wrote:
>>>>>> On 01.10.20 18:38, Bertrand Marquis wrote:
>>>>>>> Hi Juergen,
>>>>>>>
>>>>>>>> On 14 Sep 2020, at 11:58, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>>>>>>>>
>>>>>>>>> Making getBridge() static triggered a build error with some gcc versions:
>>>>>>>>>
>>>>>>>>> error: 'strncpy' output may be truncated copying 15 bytes from a string of
>>>>>>>>> length 255 [-Werror=stringop-truncation]
>>>>>>>>>
>>>>>>>>> Fix that by using a buffer with 256 bytes instead.
>>>>>>>>>
>>>>>>>>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>>>
>>>>>>> Sorry i have to come back on this one.
>>>>>>>
>>>>>>> I still see an error compiling with Yocto on this one:
>>>>>>> |     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
>>>>>>> | xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Werror=stringop-truncation]
>>>>>>> |    81 |      strncpy(result, de->d_name, resultLen);
>>>>>>> |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>>>
>>>>>>> To solve it, I need to define devBridge[257] as devNoBrideg.
>>>>>>
>>>>>> IMHO this is a real compiler error.
>>>>>>
>>>>>> de->d_name is an array of 256 bytes, so doing strncpy() from that to
>>>>>> another array of 256 bytes with a length of 256 won't truncate anything.
>>>>>
>>>>> That's a matter of how you look at it, I think: If the original array
>>>>> doesn't hold a nul-terminated string, the destination array won't
>>>>> either, yet the common goal of strncpy() is to yield a properly nul-
>>>>> terminated string. IOW the warning may be since the standard even has
>>>>> a specific foot note to point out this possible pitfall.
>>>>
>>>> If the source doesn't hold a nul-terminated string there will still be
>>>> 256 bytes copied, so there is no truncation done during strncpy().
>>>>
>>>> In fact there is no way to use strncpy() in a safe way on a fixed sized
>>>> source array with the above semantics: either the target is larger than
>>>> the source and length is at least sizeof(source) + 1, resulting in a
>>>> possible read beyond the end of source, or the target is the same length
>>>> leading to the error.
>>> I agree with all of what you say, but I can also see why said foot note
>>> alone may have motivated the emission of the warning.
>>
>> The motivation can be explained, yes, but it is wrong. strncpy() is not
>> limited to source arrays of unknown length. So this warning is making
>> strncpy() unusable for fixed sized source strings and -Werror. And that
>> is nothing a compiler should be allowed to do, hence a compiler bug.
> 
> I do agree that in this case the compiler is doing to much.

It is plain wrong here. Rendering a Posix defined function unusable for
a completely legal use case is in no way a matter of taste or of "doing
to much". It is a bug.

> We could also choose to turn off the warning either using pragma (which
> i really do not like) or by adding a cflag for this specific file (but this might
> hit us later in other places).
> 
> All in all this currently makes Xen master and staging not possible to
> compile with Yocto so we need to find a solution as this will also
> come in any distribution using a new compiler,

A variant you didn't mention would be open coding of strncpy() (or
having a related inline function in a common header). This route would
be the one I'd prefer in case the compiler guys insist on the behavior
being fine.

You didn't tell us which compiler is being used and whether it really is
up to date. A workaround might be to set EXTRA_CFLAGS_XEN_TOOLS to
"-Wno-stringop-truncation" for the build.


Juergen


