Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9FA651CD5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466779.725716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YbH-000639-Iu; Tue, 20 Dec 2022 09:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466779.725716; Tue, 20 Dec 2022 09:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YbH-00060b-FQ; Tue, 20 Dec 2022 09:07:51 +0000
Received: by outflank-mailman (input) for mailman id 466779;
 Tue, 20 Dec 2022 09:07:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7YbF-00060V-Gt
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:07:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YbF-0003Ak-2f; Tue, 20 Dec 2022 09:07:49 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YbE-0007Dc-RY; Tue, 20 Dec 2022 09:07:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Jog5KNJvlx6mRvLesF3blEBfUbss7M/vG1fW0gRszTk=; b=ecef44EBsqhoJ0Ol1TLoaG3FdX
	oZzwWYUwN+sF6vsckD+jcG5WN+G5vKlSzoss9k7BSPZbfkBuG68Si2THck8b1p1aWSaoXvaCMD8f6
	JynbbKcRXHvnYWNJYSVKjz+warpHBgm1hINfykhl/veCB3dHA2sVSqd93xrndL1TQH7M=;
Message-ID: <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
Date: Tue, 20 Dec 2022 09:07:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/18] arm: cppcheck: misra rule 20.7 deviations for
 alternative.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221220085100.22848-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 20/12/2022 08:50, Luca Fancellu wrote:
> Cppcheck reports violations of rule 20.7 in two macros of
> alternative.h.
> 
> The first one is in the __ALT_PTR macro where cppcheck wants to have
> parentheses on the second operand of a member access operator, which
> is not allowed from the c language syntax, furthermore, the macro
> parameter is never used as an expression, hence we can suppress the
> finding.

Looking at the Misra Rule 20.7 examples [1], this looks similar to 
GET_MEMBER(). So I don't understand why cppcheck is complaining.

> 
> The second finding is in the __ALTERNATIVE_CFG macro, where cppcheck
> wants to have parentheses on the macro arguments, but the macro
> parameters are never used as expressions and are used only for text
> substitution, so cppcheck is not taking into account the context of
> use of the macro arguments and adding parenthesis would break the
> code, so we can suppress the finding.

This reads like you want to report a bug against cppcheck.

> 
> No error was shown by eclair and coverity for those lines.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/misra/false-positive-cppcheck.json | 14 ++++++++++++++
>   xen/arch/arm/include/asm/alternative.h  |  2 ++

This file is meant to be close to Linux. From my understanding of the 
discussion yesterday, we didn't want to add deviation there.

>   2 files changed, 16 insertions(+)
> 
> diff --git a/docs/misra/false-positive-cppcheck.json b/docs/misra/false-positive-cppcheck.json
> index 5d4da2ce6170..5e7d9377f60b 100644
> --- a/docs/misra/false-positive-cppcheck.json
> +++ b/docs/misra/false-positive-cppcheck.json
> @@ -3,6 +3,20 @@
>       "content": [
>           {
>               "id": "SAF-0-false-positive-cppcheck",
> +            "violation-id": "misra-c2012-20.7",
> +            "tool-version": "2.7",
> +            "name": "R20.7 second operand of member-access operator",
> +            "text": "The second operand of a member access operator shall be a name of a member of the type pointed to, so in this particular case it is wrong to use parentheses on the macro parameter."
> +        },
> +        {
> +            "id": "SAF-1-false-positive-cppcheck",
> +            "violation-id": "misra-c2012-20.7",
> +            "tool-version": "2.7",
> +            "name": "R20.7 C macro parameters used only for text substitution",
> +            "text": "The macro parameters used in this case are not part of an expression, they are used for text substitution."
> +        },
In both cases the constructs are commonly used in Xen to generate code. 
So I am a bit concerned to have to add deviation everywhere cppcheck is 
wrong.

More generally, we are still at the beginning of MISRA in Xen and I 
don't think we should start with adding deviations from bugs in the 
tools. Instead, we should report those bugs and hopefully by the time 
Xen is mostly MISRA complaint the tools will not report the false positive.

If they are still then we can decide to add deviations.

Cheers,

[1] 
https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c

-- 
Julien Grall

