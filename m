Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1630280DA9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 08:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1704.5178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOEuQ-0007RT-UP; Fri, 02 Oct 2020 06:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1704.5178; Fri, 02 Oct 2020 06:51:14 +0000
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
	id 1kOEuQ-0007R4-R6; Fri, 02 Oct 2020 06:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1704;
 Fri, 02 Oct 2020 06:51:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOEuP-0007Qz-4o
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:51:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03f8de42-74f4-4e01-9065-ab618b563f7d;
 Fri, 02 Oct 2020 06:51:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C769AB0E;
 Fri,  2 Oct 2020 06:51:10 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOEuP-0007Qz-4o
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 06:51:13 +0000
X-Inumbo-ID: 03f8de42-74f4-4e01-9065-ab618b563f7d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 03f8de42-74f4-4e01-9065-ab618b563f7d;
	Fri, 02 Oct 2020 06:51:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601621470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFRzX9trc5MZuk77g1cmRgU+ryMN3oMc3H5lrCMOHAg=;
	b=PsSiq5fnx183NixNZQzo+UT4dsKQJftGzpcB8/rMqZ6u1jlMkU8FOIaD79H75ZInIFkDfj
	AnSdrMkWu1AsvelDsAL4JbZhDoowlTHmvkIXp1RXARsDR9zd/7EDVl9vdCwRaYatqsoP7c
	rz6pIbxOIqh5hp06HvI73HHe1rJXXfE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2C769AB0E;
	Fri,  2 Oct 2020 06:51:10 +0000 (UTC)
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
 <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8ddad01e-cf1a-7752-1371-a505fb26dc47@suse.com>
Date: Fri, 2 Oct 2020 08:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.10.20 08:20, Jan Beulich wrote:
> On 02.10.2020 06:50, Jürgen Groß wrote:
>> On 01.10.20 18:38, Bertrand Marquis wrote:
>>> Hi Juergen,
>>>
>>>> On 14 Sep 2020, at 11:58, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>>>
>>>>
>>>>
>>>>> On 12 Sep 2020, at 14:08, Juergen Gross <jgross@suse.com> wrote:
>>>>>
>>>>> Making getBridge() static triggered a build error with some gcc versions:
>>>>>
>>>>> error: 'strncpy' output may be truncated copying 15 bytes from a string of
>>>>> length 255 [-Werror=stringop-truncation]
>>>>>
>>>>> Fix that by using a buffer with 256 bytes instead.
>>>>>
>>>>> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Sorry i have to come back on this one.
>>>
>>> I still see an error compiling with Yocto on this one:
>>> |     inlined from 'xenstat_collect_networks' at xenstat_linux.c:306:2:
>>> | xenstat_linux.c:81:6: error: 'strncpy' output may be truncated copying 255 bytes from a string of length 255 [-Werror=stringop-truncation]
>>> |    81 |      strncpy(result, de->d_name, resultLen);
>>> |       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> To solve it, I need to define devBridge[257] as devNoBrideg.
>>
>> IMHO this is a real compiler error.
>>
>> de->d_name is an array of 256 bytes, so doing strncpy() from that to
>> another array of 256 bytes with a length of 256 won't truncate anything.
> 
> That's a matter of how you look at it, I think: If the original array
> doesn't hold a nul-terminated string, the destination array won't
> either, yet the common goal of strncpy() is to yield a properly nul-
> terminated string. IOW the warning may be since the standard even has
> a specific foot note to point out this possible pitfall.

If the source doesn't hold a nul-terminated string there will still be
256 bytes copied, so there is no truncation done during strncpy().

In fact there is no way to use strncpy() in a safe way on a fixed sized
source array with the above semantics: either the target is larger than
the source and length is at least sizeof(source) + 1, resulting in a
possible read beyond the end of source, or the target is the same length
leading to the error.


Juergen

