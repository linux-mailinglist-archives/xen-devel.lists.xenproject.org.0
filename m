Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F42FD824
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 19:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71713.128653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2I5m-0001aO-1u; Wed, 20 Jan 2021 18:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71713.128653; Wed, 20 Jan 2021 18:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2I5l-0001Zz-V2; Wed, 20 Jan 2021 18:20:29 +0000
Received: by outflank-mailman (input) for mailman id 71713;
 Wed, 20 Jan 2021 18:20:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2I5k-0001Zu-6p
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 18:20:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2I5h-0006t7-UN; Wed, 20 Jan 2021 18:20:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2I5h-0003Jp-M9; Wed, 20 Jan 2021 18:20:25 +0000
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
	bh=ojQlBruuLx0KuV3n0WgowvgB3GXL8aO4Ea58rni+Oe4=; b=4iRNUvBpU+PIYl1DdUR93LHTp4
	9QTFr+q/F5UtdboPFYhhEGBpOYYa5pBDqr2kKt4WiKpp8ydZfGSvu27JmckflSaEVPqlR3ZX3sTgs
	2GTjVRw0w4v3QuMg7nwm6tJp4KKFR0FadyDyYEHZbATNBXhg67xA8Nt7oTGVGQXJUDVA=;
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
Date: Wed, 20 Jan 2021 18:20:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116103339.21708-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 16/01/2021 10:33, Juergen Gross wrote:
> Add support to run a function in an exception handler for Arm. Do it
> as on x86 via a bug_frame, but pass the function pointer via a
> register (this needs to be done that way, because inline asm support
> for 32-bit Arm lacks the needed functionality to reference an
> arbitrary function via the bugframe).

I was going to commit the series, but then realized the commit message 
and comment needs some tweaking because technically GCC is supporting 
'i' (I managed to get it working with -fno-pie).

So how about:

"This is needed to be done that way because GCC complains about invalid 
constraint when using a function pointer with "i" and PIE is enabled 
(default on most of GCC shipped with distro). Clang happily accepts it, 
so it may be a bug in GCC."


> +/*
> + * Unfortunately gcc for arm 32-bit doesn't support the "i" constraint, so
> + * the easiest way to implement run_in_exception_handler() is to pass the
> + * to be called function in a fixed register.
> + */

This comment should also be updated.

I can update both while committing if you are happy with the change.

> +#define  run_in_exception_handler(fn) do {                                  \
> +    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
> +         "1:"BUG_INSTR"\n"                                                  \
> +         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
> +         "             \"a\", %%progbits\n"                                 \
> +         "2:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 2b)\n"                                                \
> +         ".long 0, 0, 0\n"                                                  \
> +         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
> +} while (0)
> +
>   #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
>   
>   #define BUG() do {                                              \
> @@ -73,7 +91,8 @@ struct bug_frame {
>   extern const struct bug_frame __start_bug_frames[],
>                                 __stop_bug_frames_0[],
>                                 __stop_bug_frames_1[],
> -                              __stop_bug_frames_2[];
> +                              __stop_bug_frames_2[],
> +                              __stop_bug_frames_3[];
>   
>   #endif /* __ARM_BUG_H__ */
>   /*
> 

Cheers,

-- 
Julien Grall

