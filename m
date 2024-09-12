Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7D97673A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797306.1207222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohm4-0005qf-SV; Thu, 12 Sep 2024 11:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797306.1207222; Thu, 12 Sep 2024 11:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohm4-0005oR-Pu; Thu, 12 Sep 2024 11:14:08 +0000
Received: by outflank-mailman (input) for mailman id 797306;
 Thu, 12 Sep 2024 11:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBhH=QK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sohm3-0005nP-A7
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:14:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f7daea8-70f8-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 13:14:05 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 992C84EE0CA5;
 Thu, 12 Sep 2024 13:14:04 +0200 (CEST)
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
X-Inumbo-ID: 1f7daea8-70f8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726139644; bh=iCTntylAWwmc2me5x1xK2rD2JoghxiTT+W4zuRJFUVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xXNWgPjGaZLJrF9qDnWpWuv7AXFrVyTRaBm+RMJyVN7Uwc9O0uswd3UIAPwNL7CkD
	 AUrLjBktzOpzv39jL9DqMCf1LymjeYF4/bNRp1VHxjfr9/9UvKH2jVf4C683jhkU1F
	 Winp1Type7o03NcIOe2xTm4xlf07Vn/wc6GmRCL1650JnbDmKucY6MPlt5T3q1xVV8
	 eb4aXGYyIvlHLr9yPh2YWc6p5yyWJ1JZ/plz9U/OUTXh3or5vrIxMYezCLf2zYnlvy
	 e409koT38gs/VBHdyaJMx6EeZ+iXM+PXDZwkDVLxG4AnHHC7H3w2wcKZ9x6XdHVoQs
	 lkkKZTBlsnwkA==
Message-ID: <b474cbfe-c1bb-460f-a84d-08a439b215c3@bugseng.com>
Date: Thu, 12 Sep 2024 13:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/12] x86/emul: address violations of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
 <1e6e2bb8-2a27-4cac-a888-7d785bc4c463@suse.com>
 <6b1ca033-4a6d-4f69-aa6a-54dbcb37e79e@bugseng.com>
 <992dbde2-a1fc-472d-9bb9-a4e11a2bc21b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <992dbde2-a1fc-472d-9bb9-a4e11a2bc21b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/24 12:01, Jan Beulich wrote:
> On 12.09.2024 11:17, Federico Serafini wrote:
>> On 11/09/24 14:42, Jan Beulich wrote:
>>> On 10.09.2024 12:09, Federico Serafini wrote:
>>>> --- a/xen/arch/x86/x86_emulate/fpu.c
>>>> +++ b/xen/arch/x86/x86_emulate/fpu.c
>>>> @@ -218,6 +218,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>>                 */
>>>>                if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>>>                    dst->type = OP_NONE;
>>>> +            break;
>>>>            }
>>>>            break;
>>>>    
>>>> @@ -296,6 +297,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>>                default:
>>>>                    generate_exception(X86_EXC_UD);
>>>>                }
>>>> +            break;
>>>>            }
>>>>            break;
>>>>    
>>>> @@ -386,6 +388,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>>                 */
>>>>                if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>>>                    dst->type = OP_NONE;
>>>> +            break;
>>>>            }
>>>>            break;
>>>>    
>>>> @@ -457,6 +460,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>>                case 7: /* fistp m64i */
>>>>                    goto fpu_memdst64;
>>>>                }
>>>> +            break;
>>>
>>> Aren't you swapping one violation for another here? Unlike in the earlier
>>> three cases, this new break is unreachable, because of the nature of the
>>> preceding switch() statement (cases being exhaustive and every case ending
>>> in "goto"; this is something even a static analyzer can [in principle]
>>> spot).
>>
>> You are right, but the resulting violation of Rule 2.1
>> ("A project shall not contain unreachable code") is deviated with the
>> following justification:
>> "The compiler implementation guarantees that the unreachable code is
>> removed.
> 
> I'm not convinced this is the case here in practice.
> 
> Instead of "break", wouldn't "unreachable()" be the better construct
> to use in situations like this one?
> 
>> Constant expressions and unreachable branches of if and switch
>> statements are expected."
> 
> This I don't think applies in this particular case?

I agree,
the ECLAIR configuration for the deviation covers
more cases than expected. I'll fix it.

-- 
Federico Serafini,

Ph.D. Student, Ca' Foscari University of Venice
Software Engineer, BUGSENG

