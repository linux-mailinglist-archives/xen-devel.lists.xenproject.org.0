Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E396B2DAE23
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 14:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54157.93855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpAY5-0007Qu-NH; Tue, 15 Dec 2020 13:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54157.93855; Tue, 15 Dec 2020 13:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpAY5-0007QV-K0; Tue, 15 Dec 2020 13:39:29 +0000
Received: by outflank-mailman (input) for mailman id 54157;
 Tue, 15 Dec 2020 13:39:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpAY3-0007QI-Lp
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 13:39:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpAY2-0007P6-Nb; Tue, 15 Dec 2020 13:39:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpAY2-0007b5-CS; Tue, 15 Dec 2020 13:39:26 +0000
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
	bh=1o+B0RdPAD21aM1NMCkg2a5CbhmpI/re8qs3MXAAbvY=; b=H9toXEz6Id3SyuvO7Lm6eDVa4e
	9WwzgeYpoqUcbnnekDDLyL6z+4HuENyHXrIX9RcCf9QYyH/G3LnW88rgvDGq/JvI4SuyZSMCM10+l
	/AGeO+BwQXMOUMCoCKkkb6TmO312ju5eJBPr88YnzMdHV+sbpQ+XK+rHCyaO9aonvVBg=;
Subject: Re: [PATCH v5 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201215063319.23290-1-jgross@suse.com>
 <20201215063319.23290-2-jgross@suse.com>
 <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2ffa6302-5368-61c6-8564-6d3f828e2163@xen.org>
Date: Tue, 15 Dec 2020 13:39:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <94e85d88-b0f0-01f6-99e0-386326bc044a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/12/2020 09:02, Jan Beulich wrote:
> On 15.12.2020 07:33, Juergen Gross wrote:
>> --- a/xen/include/asm-arm/bug.h
>> +++ b/xen/include/asm-arm/bug.h
>> @@ -15,65 +15,62 @@
>>   
>>   struct bug_frame {
>>       signed int loc_disp;    /* Relative address to the bug address */
>> -    signed int file_disp;   /* Relative address to the filename */
>> +    signed int ptr_disp;    /* Relative address to the filename or function */
>>       signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>       uint16_t line;          /* Line number */
>>       uint32_t pad0:16;       /* Padding for 8-bytes align */
>>   };
>>   
>>   #define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
>> -#define bug_file(b) ((const void *)(b) + (b)->file_disp);
>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp);
>>   #define bug_line(b) ((b)->line)
>>   #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>>   
>> -#define BUGFRAME_warn   0
>> -#define BUGFRAME_bug    1
>> -#define BUGFRAME_assert 2
>> +#define BUGFRAME_run_fn 0
>> +#define BUGFRAME_warn   1
>> +#define BUGFRAME_bug    2
>> +#define BUGFRAME_assert 3
>>   
>> -#define BUGFRAME_NR     3
>> +#define BUGFRAME_NR     4
>>   
>>   /* Many versions of GCC doesn't support the asm %c parameter which would
>>    * be preferable to this unpleasantness. We use mergeable string
>>    * sections to avoid multiple copies of the string appearing in the
>>    * Xen image.
>>    */
>> -#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
>> +#define BUG_FRAME(type, line, ptr, msg) do {                                \
>>       BUILD_BUG_ON((line) >> 16);                                             \
>>       BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
>>       asm ("1:"BUG_INSTR"\n"                                                  \
>> -         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
>> -         "2:\t.asciz " __stringify(file) "\n"                               \
>> -         "3:\n"                                                             \
>> -         ".if " #has_msg "\n"                                               \
>> -         "\t.asciz " #msg "\n"                                              \
>> -         ".endif\n"                                                         \
>> -         ".popsection\n"                                                    \
>> -         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
>> -         "4:\n"                                                             \
>> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %%progbits\n"\
>> +         "2:\n"                                                             \
>>            ".p2align 2\n"                                                     \
>> -         ".long (1b - 4b)\n"                                                \
>> -         ".long (2b - 4b)\n"                                                \
>> -         ".long (3b - 4b)\n"                                                \
>> +         ".long (1b - 2b)\n"                                                \
>> +         ".long (%0 - 2b)\n"                                                \
>> +         ".long (%1 - 2b)\n"                                                \
>>            ".hword " __stringify(line) ", 0\n"                                \
>> -         ".popsection");                                                    \
>> +         ".popsection" :: "i" (ptr), "i" (msg));                            \
>>   } while (0)
> 
> The comment ahead of the construct now looks to be at best stale, if
> not entirely pointless. The reference to %c looks quite strange here
> to me anyway - I can only guess it appeared here because on x86 one
> has to use %c to output constants as operands for .long and alike,
> and this was then tried to use on Arm as well without there really
> being a need.

Well, %c is one the reason why we can't have a common BUG_FRAME 
implementation. So I would like to retain this information before 
someone wants to consolidate the code and missed this issue.

Regarding the mergeable string section, I agree that the comment in now 
stale. However,  could someone confirm that "i" will still retain the 
same behavior as using mergeable string sections?

Cheers,

-- 
Julien Grall

