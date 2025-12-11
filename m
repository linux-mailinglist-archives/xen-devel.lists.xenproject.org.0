Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858ACB4FFE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 08:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183584.1506218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbGp-00029j-BG; Thu, 11 Dec 2025 07:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183584.1506218; Thu, 11 Dec 2025 07:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbGp-00028I-8b; Thu, 11 Dec 2025 07:39:27 +0000
Received: by outflank-mailman (input) for mailman id 1183584;
 Thu, 11 Dec 2025 07:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTbGm-00028C-LT
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 07:39:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8227d142-d664-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 08:39:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8B1094EEBF88;
 Thu, 11 Dec 2025 08:39:20 +0100 (CET)
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
X-Inumbo-ID: 8227d142-d664-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765438760;
	b=DypkyhLfR5cJF6uDWANQJRAlQRWLOh0+bHCA4TKcawofcWTnSKQ7xInvjPAohYuhGbH5
	 tsnD9F40QThk286l3ArKMeQwaqXKL8c9Et/beqtySy7LwcpdJ935k2lAZDmhV15LNxNlw
	 GSymwn9t03ljx/G0wc0mRdp9H9Vu+ejNpYAZ5OCmzWpncKxK0AhX76/fKQNBbyO1ZGaWQ
	 rcHVh5uiOWdCXz82JTxGUBsSI9rGrC7my6/whDXMO01qU/rS1JuDvncezmhch8EqhwUPm
	 4q0wkfp/0UeLom9I8ebqdiN20UW70GgAPjb+5Jw4WjzyBD5alnkcWP+NWU4iufzs3GLCQ
	 rlhvHks14iq4r1dpON+v/MEPKA5DD3qkTEGzAWe+jTUP2yPBOBmcCL/Ods0qWGJlFcf6s
	 4J6qjzfSTCfbett2KiEugwlSxyr+VBcitHY+oYaNbvkKEWmeMxBgqKue1fC+79DJCIQSp
	 +Pmm1V7tS2fCQKYHsDJY+PvndIxGcadp/zkwBpBdniNjfZH3zb2Eg3Am/OX4ZrjyQXNgQ
	 IJUNZmA3mX2xIDbv9x/dFQze164qmLzYU0WZdNtYUKNhoXXlFqDqK4a8xyUUd+eSyYsrT
	 edOuhWx3TdEoxvcN5cD2ym6SMn2Of1ycVwjY/Pq6X7oFO6Rk0lJb8d52rUgpb8U=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765438760;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=L9WU1G5zKbxi4Cn3+3HW95CjXgBsCbejbcW+mkFs/nI=;
	b=iOi2/LI2B2bVid/7vEBLJ2AQK8B8GWLw0CZQXdj0G2GV9V+aUNv42ByVq+EujP548cRk
	 YK80dCToLqlrQv1jUS4Ii0J1j2+3Hc8T8+YkQC11m2jzOFAkDmlyST954Wd0o7cp2xblV
	 dk+p5QMRp49e54fVLcfJ+bWZybOcH2hO6I7RjSxUtYsWHg5JBpioJahFqOKY8BF79tlv1
	 a6A9IY18eBlCaUhGD9vaEQjTS4jSb3JJ1srSOGzn/dle/+i1aelTNR3WxjKOfpqtsBFrN
	 JkuSBJ2oPaulKgwh+ybM3DNSZirRMmae9txNx+dEpzcIOwwu4d414ZoFOqL5kJbUTkLaf
	 H8aCzFufTFN3ERoWqxntDOXVvh+nV9AC1q9o9ND9belYRhGJWuYKvyN/1q9CzkV6t3tK2
	 rVA5qHkEu4Bf3RaMQM4yoPJp9gowx3A6Jbp+Q3ZBEQaj9Bk1gFX2mYzSCbze5XMb5T+vu
	 DZ0eFcwJCEge0BQI4H+OmO9CGoVjzKd30wFmq5YVAYOdEiCOz2TKFgZDhVvpBrsgEDGV6
	 KKL14eFZGbdLkYEqaW0O+0cvYMk87GA2l9C+nO9oL3zkPiILHE56CSafvnVy1v0LAtSL/
	 B+cB8Hp3ObXnlDnSe3p6cI4LJZnB/+rNENBHarGzWv/VTxAtRrCyiX92wWREaYE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765438760; bh=E+HldCsOnG2PoKHFcpvLXYZ79+DuZZiscDTPs+aOWRM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CkCZ2DDGipQ7NHQvYfdJxNDdd1Y0n48+7T7+Up2fYRNtVdtlDKWpeYM/p2Cw6ZLrv
	 GSfRBJl/BkJfO6WsxaZoCiBQ2AI4V9b+I015WvvjaYAVQXABM41zGq7vg95kb4iJhk
	 i5VNtmIiun7U9Tw0dqwk6Rvs58S5nkA5Zk9iI/uEeLtFwFIc6dLBdyW4bGVL8kgOyJ
	 u0VguTseGwivQnY+6/ua+T8d5cmvWJNo+jao0rbck5Owpwp+33S83cFnFEF8npW3TB
	 tlXpMWr7FUtFnWU4BVPwzyZhyeQKNVRLrpKAVZLy6NYezxcgfC+hl5BZ4CM9dcB/6e
	 gH0aaqBjJXJXA==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 08:39:20 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 1/5] x86: Misra fixes for U/L suffixes
In-Reply-To: <673e625a-4df9-45fe-a45d-49d988197da8@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-2-andrew.cooper3@citrix.com>
 <c9c7deeecc839295d04c5374691f848d@bugseng.com>
 <aa03d225a116bbb5db0e7a0df61161b5@bugseng.com>
 <673e625a-4df9-45fe-a45d-49d988197da8@citrix.com>
Message-ID: <a9cd462f7210e12a307b492c85e249b1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 00:48, Andrew Cooper wrote:
> On 10/12/2025 8:31 pm, Nicola Vetrini wrote:
>> On 2025-12-10 21:09, Nicola Vetrini wrote:
>>> On 2025-12-10 19:30, Andrew Cooper wrote:
>>>> diff --git a/xen/include/xen/elfstructs.h
>>>> b/xen/include/xen/elfstructs.h
>>>> index eb6b87a823a8..8770e7454672 100644
>>>> --- a/xen/include/xen/elfstructs.h
>>>> +++ b/xen/include/xen/elfstructs.h
>>>> @@ -360,7 +360,7 @@ typedef struct {
>>>>  } Elf64_Rela;
>>>> 
>>>>  #define    ELF64_R_SYM(info)    ((info) >> 32)
>>>> -#define    ELF64_R_TYPE(info)    ((info) & 0xFFFFFFFF)
>>>> +#define    ELF64_R_TYPE(info)    ((uint32_t)(info))
>> 
>> Actually I think this doesn't build:
>> 
>> arch/x86/livepatch.c: In function ‘arch_livepatch_perform_rela’:
>> ././include/xen/config.h:55:24: error: format ‘%lu’ expects argument
>> of type ‘long unsigned int’, but argument 3 has type ‘unsigned int’
>> [-Werror=format=]
>>    55 | #define XENLOG_ERR     "<0>"
>>       |                        ^~~~~
>> arch/x86/livepatch.c:332:20: note: in expansion of macro ‘XENLOG_ERR’
>>   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled
>> relocation %lu\n",
>>       |                    ^~~~~~~~~~
>> arch/x86/livepatch.c:332:69: note: format string is defined here
>>   332 |             printk(XENLOG_ERR LIVEPATCH "%s: Unhandled
>> relocation %lu\n",
>>      
>> |                                                                  
>>  ~~^
>>      
>> |                                                                     
>> |
>>      
>> |                                                                    
>> long unsigned int
>>      
>> |                                                                   %u
>> 
>> the error location is a bit unclear, but the cast is the culprit
> 
> Yeah, I spotted that just as I heading out, and ran
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2207521982
> instead.
> 
> I've swapped back to using 0xFFFFFFFFU.  info ends up being long, and
> the result of the expression needs to stay that way.
> 
> However, looking at the report for that, I still missed one.  I've
> folded in this hunk too.
> 
> diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
> index 8c44dea12330..e741e686c1af 100644
> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -37,7 +37,7 @@ int pv_emul_read_descriptor(unsigned int sel, const 
> struct vcpu *v,
>      if ( !(desc.b & _SEGMENT_L) )
>      {
>          *base = ((desc.a >> 16) + ((desc.b & 0xff) << 16) +
> -                 (desc.b & 0xff000000));
> +                 (desc.b & 0xff000000U));
>          *limit = (desc.a & 0xffff) | (desc.b & 0x000f0000);
>          if ( desc.b & _SEGMENT_G )
>              *limit = ((*limit + 1) << 12) - 1;
> 

Makes sense, feel free to retain my R-by with these two changes.

> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

