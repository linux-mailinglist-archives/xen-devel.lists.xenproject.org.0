Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEADA97664
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963514.1354498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JoA-0004gP-Hw; Tue, 22 Apr 2025 20:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963514.1354498; Tue, 22 Apr 2025 20:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7JoA-0004eh-EG; Tue, 22 Apr 2025 20:01:30 +0000
Received: by outflank-mailman (input) for mailman id 963514;
 Tue, 22 Apr 2025 20:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pc5Z=XI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7Jo9-0004eZ-1A
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:01:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89099c37-1fb4-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:01:10 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 592DA4EE3BFD;
 Tue, 22 Apr 2025 22:01:09 +0200 (CEST)
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
X-Inumbo-ID: 89099c37-1fb4-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745352069;
	b=KEY4VHgwMLcp4QYqo6h79iYS5pAsuAn2Q7AAGgRfuLJz2R2xVaxgtQJ2s43ZhZVPwfri
	 NYUajcxReU8lsD5lnjq3ovxp+Ez9hgaJU31hSQFn7TtqhKIp+MOoV2mNDdI0pRoja5eVv
	 WwgdsDmKr98lWF7JXWn8Yi3GiADRPpR5cDRolM2Cu4//GG0kg+QU3LSPpYkgeqiP0oUBV
	 46nf07WdWrEIZQJxyy7QjvU5qfHFAuSA+m+rUyiFqq0lq/ltZcUoAb/Teqj59JD8ZU7KW
	 keTrJfj0L/YzqSCWblJp/EKFlV2a9ta4uHN3liNvn5Cpi+2+rYj0ZI1Ha04wP++0XyS/D
	 M94/W7MKpKPutbp/i5GWw8/0GPegK6CBrkt5/cevrYaF+xCV3fCSwGaoF4uUXStDaV3LG
	 /cE6VJ2gKEWy3NqB/3J7QQkcOWKsbSR4O+7q0gwpac5pXG7B9CSAzGUn3uqsNH00watfl
	 K1Q31NcV+sxJsWACkc5cOxew1cd31+iAmuIYsQGG4jWS8OnKi30DG+2Lbn/B2xv2ak/pp
	 /I7sPX+GZRRU5Fzh55dltyZDDESS3uilIPSf1pgFBiskPnkrxaRMci504W59+StOqWd9B
	 EuyGqC1kg92dnEmfeVguo3I2UpaJI2UO9eLOdseACiraiS/cUGjZlqUu+yE/3Og=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745352069;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ezr7LE1ZKebIk4F/uzS1ggyeJ30f3cfbqylG5CaobAM=;
	b=hncIkLGXfO3pBvQguQKUedYaJ1NhfOfVsOJLN5exTW1AOYSerD9giT87dRRBmaE8Hwbb
	 nUF6QQwFNMVx6D15bYCVLuaNK98/IxrWaZbc63qEqSV9jPf6gDObHx7v+wamDEX4ftqWl
	 kGjbTGQOucj3Uf7nDayNUeS0QoU7AMBDQxdZzG8sNgb3dID83AC1fjl+Vjy2Chj4oDI3n
	 EdMGIeWUgwAE1q+NkiTrhtL235CD2z+E1eWBGa00bQApfBTWr4A/tScXIUziEkXUgfGmJ
	 p/6Fr1ylK+hFdMc5PGGeB63yE6s++sv2+mGtts2SNqSWD73v0r5AKM+SKm0V/SDgIa0Qo
	 U1MBQMVtROb8wYZ8KzCMcQ35ngfyjEf+T0H4KDczYgUCDxLWFbSujB4h8Yw+rjRqcLI+5
	 gyqnFxMh/udFY+t5ClBOqpVLarsIYmDBEiXEBJlAlgBTKuoF1qC+ceDPfArpukBUme4wK
	 2DGSjPeIBOGIIKBBkPwVylDKQU3pOyV8Rgmj55UI83v1m6u1r0f9TwXRSb1qZFn5hz/cL
	 VhhCUm9u8o1qX4U7jAeK4KoQJZ5R4TlZoYnH8wEC/Ri8s+BE7A9jGdRy5YLd0nFnVJ882
	 QQZeRYZgxhWoWaXrhkKgn7kmYRwG+dioaMTXgUQu4sUCMrLxUuuqcEqh6iy/A2U=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745352069; bh=62GCsUr3yZ8xhHobo1L8VEWXhdW5YIn5+eLe3c1D2hk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sJr4ptNyqMD/TwVXWps2l4oSjdkYEQCwdFFfhttZpYW/z+a5nVAt9lAANjuvjO4xv
	 rINqFPdeeRBEkIFrrKqBnLZH/CzqouYlbmBco84lH/MrzIVWZFyvA6jZ+ASVZqKiBZ
	 +IeCmDayiMGEE+WQ7RK8rgNVLzGTCRh2mhsLMgRJ5s+Q9LrEyg6SppxXHFRgBrvwTQ
	 rOvu/CyL+uZN4ViJwpDKcA8kb6fjFXzooKIvNd/sgjjIISdQ/sn7JfvOR6utM40BVI
	 fJCYc3VJqf5NQ7kFyzhoyPjQ+0zmb1PKIpAMiFn/9mztZLK7J2k7s/JrC+xZKJcj3V
	 TEruel0S7UuQw==
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 22:01:09 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
In-Reply-To: <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504221244360.785180@ubuntu-linux-20-04-desktop>
 <0570b0ed-607c-49fa-b82e-29ffac60f873@citrix.com>
 <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
Message-ID: <f315f38e20432bc9f62ae2d4b04582a4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-22 21:58, Stefano Stabellini wrote:
> On Tue, 22 Apr 2025, Andrew Cooper wrote:
>> On 22/04/2025 8:46 pm, Stefano Stabellini wrote:
>> > On Tue, 22 Apr 2025, Andrew Cooper wrote:
>> >> Compilers estimate the size of an asm() block for inlining purposes.
>> >>
>> >> Constructs such as ALTERNATIVE appear large due to the metadata, depsite often
>> >> only being a handful of instructions.  asm inline() overrides the estimation
>> >> to identify the block as being small.
>> >>
>> >> This has a substantial impact on inlining decisions, expected to be for the
>> >> better given that the compiler has a more accurate picture to work with.
>> >>
>> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> > Hi Andrew,
>> >
>> > If we are going to use asm_inline, please add a note to
>> > docs/misra/C-language-toolchain.rst where we keep record of all the
>> > language extensions we use.
>> 
>> It's just asm(), and that's already discussed.
>> 
>> I'm not sure what else you think is warranted.
> 
> 
> If it is just asm() then there is nothing to do. We only need to
> document extensions to the language, nothing else. Many of them are
> already documented under docs/misra/C-language-toolchain.rst (see for
> instance asm and __asm__).
> 
> I see the critical part of the patch for this question is:
> 
>> +#if CONFIG_CC_HAS_ASM_INLINE
>> +# define asm_inline asm __inline
>> +#else
>> +# define asm_inline asm
>> +#endif
> 
> it looks like __inline is an extension ?

I see. It was added to the tool configuration, but not there in the rst 
(__inline__ as well), hence why there are no CI failures.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

