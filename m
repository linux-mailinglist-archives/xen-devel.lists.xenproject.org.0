Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2187B001
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 19:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692724.1080111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkTWI-0005gY-CF; Wed, 13 Mar 2024 18:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692724.1080111; Wed, 13 Mar 2024 18:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkTWI-0005ee-8X; Wed, 13 Mar 2024 18:40:06 +0000
Received: by outflank-mailman (input) for mailman id 692724;
 Wed, 13 Mar 2024 18:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z4Qo=KT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rkTWG-0005HF-Ik
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 18:40:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 192ac599-e169-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 19:40:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DD7368285572;
 Wed, 13 Mar 2024 13:39:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7zmn-BWPuRC4; Wed, 13 Mar 2024 13:39:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 498D982855AB;
 Wed, 13 Mar 2024 13:39:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X2Yxv9AQY8aF; Wed, 13 Mar 2024 13:39:59 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 954578285572;
 Wed, 13 Mar 2024 13:39:58 -0500 (CDT)
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
X-Inumbo-ID: 192ac599-e169-11ee-afdd-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 498D982855AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710355199; bh=vw3MDCIIKHd5BbVDxKjOW+av2xjw5+az38KnDYXRv/Q=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=mCfkWrMtFKJscjITJz12OSowB5MuRQIYg/Lz2tKz/WouqStoHCtNXl4Zoq3LqQ2VT
	 YNAJ043wyOnCpxeDBXbFpRnONc09G3ahPsjTmQqwz8AQ33lwALnCzH6CLBrSfw8pe5
	 6HwwlptPRu3LaL8WcRBObJqHhcgwH48MJzUbFKpI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <642f7eb8-3a44-4462-a199-4ee4bd24887e@raptorengineering.com>
Date: Wed, 13 Mar 2024 13:39:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/bitops: Cleanup ahead of rearrangements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240313172716.2325427-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 3/13/24 12:27 PM, Andrew Cooper wrote:
> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> new file mode 100644
> index 000000000000..4c07191b4030
> --- /dev/null
> +++ b/xen/common/bitops.c
> @@ -0,0 +1,41 @@
> +#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/init.h>
> +
> +/* Hide a value from the optimiser. */
> +#define HIDE(x) ({ typeof(x) _x = x; asm volatile ( "" : "+r" (_x) ); _x; })
> +
> +/*
> + * Check that fn(val) can be calcuated by the compiler, and that it gives the
> + * expected answer.
> + */
> +#define COMPILE_CHECK(fn, val, res)                                     \
> +    do {                                                                \
> +        if ( fn(val) != res )                                           \
> +            asm (".error \"Compile time check '" STR(fn(val) == res) "' failed\""); \
> +    } while ( 0 )
> +

For improved diagnostics, I think it might make sense to explicitly
check if the expression can be evaluated at compile time and emit a
different error if not. Perhaps something like the following:

#define COMPILE_CHECK(fn, val, res)                                     \
    do {                                                                \
        __typeof__(fn(val)) actual = fn(val);                           \
        if ( !__builtin_constant_p(actual) )                            \
            asm (".error \"Unable to evaluate '" STR(fn(val)) "' at
compile time\"\n"); \
        else if ( actual != res )                                       \
            asm (".error \"Compile time check '" STR(fn(val) == res) "'
failed\""); \
    } while ( 0 )


