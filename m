Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBE3014DC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 12:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73253.132039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3H5z-0005Y3-7y; Sat, 23 Jan 2021 11:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73253.132039; Sat, 23 Jan 2021 11:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3H5z-0005Xe-4V; Sat, 23 Jan 2021 11:28:47 +0000
Received: by outflank-mailman (input) for mailman id 73253;
 Sat, 23 Jan 2021 11:28:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l3H5y-0005XZ-KV
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 11:28:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3H5x-0005B7-2z; Sat, 23 Jan 2021 11:28:45 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l3H5w-0005z3-Nd; Sat, 23 Jan 2021 11:28:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3YKIo5VfLKEiZHqC6s58urPznFjQZv1DFY/eeE3ktzk=; b=Y/JcNYHZmjGtx+OPpZt0V3sg8p
	BgXSyn7r7dYd/6y21ki4GYz95JWWtJ/dfamsTXA8gfV1lmsHpFDCSop9e2xQIvSAhMBBtClPlKe4d
	8xLQteBwZwJZ3z8xljZFdWKElZfILm6DOQAlL6mBcOZdTO2+jIF5vZo5U1qSnvzLqmds=;
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
 <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
 <2bb155b0-52ec-e1c7-a511-3285646c0ed8@xen.org>
 <2b11249a-4a5d-3fcd-b208-74f1f264e3b9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dd08dbd5-f5d1-18b8-4f08-f859ec490e36@xen.org>
Date: Sat, 23 Jan 2021 11:28:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2b11249a-4a5d-3fcd-b208-74f1f264e3b9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/01/2021 10:06, Jan Beulich wrote:
> On 21.01.2021 10:50, Julien Grall wrote:
>> Hi Jan,
>>
>> On 21/01/2021 07:55, Jan Beulich wrote:
>>> On 20.01.2021 19:20, Julien Grall wrote:
>>>> On 16/01/2021 10:33, Juergen Gross wrote:
>>>>> Add support to run a function in an exception handler for Arm. Do it
>>>>> as on x86 via a bug_frame, but pass the function pointer via a
>>>>> register (this needs to be done that way, because inline asm support
>>>>> for 32-bit Arm lacks the needed functionality to reference an
>>>>> arbitrary function via the bugframe).
>>>>
>>>> I was going to commit the series, but then realized the commit message
>>>> and comment needs some tweaking because technically GCC is supporting
>>>> 'i' (I managed to get it working with -fno-pie).
>>>>
>>>> So how about:
>>>>
>>>> "This is needed to be done that way because GCC complains about invalid
>>>> constraint when using a function pointer with "i" and PIE is enabled
>>>> (default on most of GCC shipped with distro). Clang happily accepts it,
>>>> so it may be a bug in GCC."
>>>
>>> May I ask why you think it's a bug in gcc? I'd rather consider it
>>> a bug in clang. Taking the address of a symbol doesn't yield a
>>> constant in PIC or PIE code, aiui.
>>
>> I consider it a bug because we were using it as:
>>
>> .pushsection .bug.frame
>> 2b:
>> .long (%0 - 2b)
>>
>> So I expect the compiler to be able to find the displacement in both
>> cases as we don't need to know the exact address.
>>
>> I think Clang is just clever enough to figure out we want a displacement.
> 
> If they take apart the contents of the asm(), this may be possible,
> yes. (Did you try with -no-integrated-as, btw?).

Clang will be able to build the code with and without -no-integrated-as. 
The dump of the structure will show that the address of the function 
will be stored (I used this small snippet [1]).

[...]

>> Do you have a suggestion of constraint that could resolve the issue?
> 
> No. Don't use -fpie (but I guess that's not an option for other
> reasons).

Yes, we need to have Xen code relocatable for at least UEFI. In the 
future we will need to be able to change at runtime the Xen virtual 
address in order to address memory issues (we can't switch page-tables 
with MMU enabled).

Linux Arm64 supports KASLR, yet, they are building with -fno-pie. I need 
to figure out how they deal with relocating the kernel and see if we can 
re-use it in Xen.

I have revised the comment to not suggest this is a bug and commit the 
series.

Cheers,

[1]

int test(void)
{
	return 0;
}

int main(void)
{
     asm volatile (".pushsection .bug_frames, \"aw\"\n"
               ".quad %0\n"
               ".popsection\n"
               :: "i"(test));

     return 0;
}



-- 
Julien Grall

