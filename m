Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25E2FE5A3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 09:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71934.129195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VlG-00053x-KT; Thu, 21 Jan 2021 08:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71934.129195; Thu, 21 Jan 2021 08:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2VlG-00053b-H7; Thu, 21 Jan 2021 08:56:14 +0000
Received: by outflank-mailman (input) for mailman id 71934;
 Thu, 21 Jan 2021 08:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2VlF-00053V-7p
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 08:56:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b5648bf-b22e-40ba-87c6-b70dccb2d2dd;
 Thu, 21 Jan 2021 08:56:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E886AAAE;
 Thu, 21 Jan 2021 08:56:10 +0000 (UTC)
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
X-Inumbo-ID: 3b5648bf-b22e-40ba-87c6-b70dccb2d2dd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611219370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctdzKACCzSsKQ/Uy2JCO53wQQCIxY0lqZS54XaJzHT8=;
	b=c38D4eZJwDt0X4szn9/yR/3kHIuiB6QmLTXU4IqQOTGOuzLQBvte1D24evdkCbawOZaG0D
	EPm3nygm4TI306hgGXeWSut+pnno8W1cwhW1Ujpjq6xUWm2eFg+5cj1ws+qyQLwJU4YtTj
	uJ3agCr/l/pvyDeAS0c3vyQ2S/jnsew=
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
 <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
 <ea98e8d3-e28a-6bd3-d211-7d37741040cf@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23be37d3-49cf-ed9f-eb1b-3bd2b24e1018@suse.com>
Date: Thu, 21 Jan 2021 09:56:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ea98e8d3-e28a-6bd3-d211-7d37741040cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.01.2021 09:00, Jürgen Groß wrote:
> On 21.01.21 08:55, Jan Beulich wrote:
>> On 20.01.2021 19:20, Julien Grall wrote:
>>> On 16/01/2021 10:33, Juergen Gross wrote:
>>>> Add support to run a function in an exception handler for Arm. Do it
>>>> as on x86 via a bug_frame, but pass the function pointer via a
>>>> register (this needs to be done that way, because inline asm support
>>>> for 32-bit Arm lacks the needed functionality to reference an
>>>> arbitrary function via the bugframe).
>>>
>>> I was going to commit the series, but then realized the commit message
>>> and comment needs some tweaking because technically GCC is supporting
>>> 'i' (I managed to get it working with -fno-pie).
>>>
>>> So how about:
>>>
>>> "This is needed to be done that way because GCC complains about invalid
>>> constraint when using a function pointer with "i" and PIE is enabled
>>> (default on most of GCC shipped with distro). Clang happily accepts it,
>>> so it may be a bug in GCC."
>>
>> May I ask why you think it's a bug in gcc? I'd rather consider it
>> a bug in clang. Taking the address of a symbol doesn't yield a
>> constant in PIC or PIE code, aiui.
> 
> Maybe we should just not add the suspect of a bug in the compiler to
> either commit message or a comment.
> 
> It could be a bug in gcc, or just a shortcoming (feature combination
> not supported).
> 
> It could be a bug in clang, or clang is clever enough to produce
> correct code for "i" + PIE.

I think the last option can be excluded. There simply is no room
for cleverness. If an insn requires an immediate operand, the
compiler has to find a compile time constant (possibly needing a
relocation, but only PC-relative ones are permitted then). The
compiler may in particular not inspect the insn(s) specified and
try to substitute them.

"i" (with a symbol ref) and PIE (or PIC) simply are incompatible
with one another. One could imagine trickery requiring agreement
between programmer and compiler, where the programmer would be
to specify the relocation to use (and then do the necessary
calculations to yield the actual symbol address), but that's not
applicable here.

I've experimented a little with gcc10 on x86-64. It behaves quite
strangely, accepting some symbol references but not others (see
example below). None of them get accepted with -fpic, and the ones
that do get accepted with -fpie don't result in position
independent code (or my understanding thereof is wrong), or to be
precise in relocations that will have to be carried into the final
executable because of being dependent upon the resulting program's
load address. I'm pondering whether to open a bug ...

Jan

void efn(void);
void(*efp)(void);

void*test(int i) {
	void*res;

	efn();
	efp();

	switch(i) {
	case 0:
		asm("mov %1,%0" : "=r" (res) : "i" (test));
		break;
#ifndef __PIE__
	case 1:
		asm("mov %1,%0" : "=r" (res) : "i" (efn));
		break;
#endif
	case 2:
		asm("mov %1,%0" : "=r" (res) : "i" (&efp));
		break;
	default:
		res = (void*)0;
		break;
	}

	return res;
}

