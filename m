Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2007BD5D2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 10:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614237.955222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qplzg-0006nk-45; Mon, 09 Oct 2023 08:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614237.955222; Mon, 09 Oct 2023 08:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qplzg-0006lr-03; Mon, 09 Oct 2023 08:52:04 +0000
Received: by outflank-mailman (input) for mailman id 614237;
 Mon, 09 Oct 2023 08:52:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qplze-0006ll-C9
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 08:52:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qplzc-0001Ze-Qi; Mon, 09 Oct 2023 08:52:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qplzc-0001sw-Hw; Mon, 09 Oct 2023 08:52:00 +0000
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
	bh=dYVH9cxkNtdZNrCkQT+3SHTAgDwcyiRMGkQ4Z86jDbc=; b=a3hNh4kjFuY8bRBGF7ipQ/wnNL
	gIY/+GjjUgU2eQCixwDa2W89DoGarhjpT7i94yAtMnDg9iHgffmTPJyb88ad1lmdNl1FExEe1eeZd
	W36oNSVCckdij79jkkqGGxSNqLQWD9KL0EUpkZZVyqDgqkSLtcPJe+wfjtKo7zlhEhi8=;
Message-ID: <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
Date: Mon, 9 Oct 2023 09:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/10/2023 01:43, Stefano Stabellini wrote:
> On Fri, 6 Oct 2023, Luca Fancellu wrote:
>>> On 6 Oct 2023, at 02:02, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> On Thu, 5 Oct 2023, Luca Fancellu wrote:
>>>>> On 5 Oct 2023, at 00:32, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>
>>>>> On Wed, 4 Oct 2023, Luca Fancellu wrote:
>>>>>>> On 4 Oct 2023, at 11:29, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>>>>> On 04/10/2023 12:06, Luca Fancellu wrote:
>>>>>>>> Hi Nicola,
>>>>>>>>> On 4 Oct 2023, at 10:56, andrew.cooper3@citrix.com wrote:
>>>>>>>>> On 03/10/2023 9:46 pm, Stefano Stabellini wrote:
>>>>>>>>>> On Tue, 3 Oct 2023, Nicola Vetrini wrote:
>>>>>>>>>>> As specified in rules.rst, these constants can be used
>>>>>>>>>>> in the code.
>>>>>>>>>>> Their deviation is now accomplished by using a SAF comment,
>>>>>>>>>>> rather than an ECLAIR configuration.
>>>>>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>>>> "SAF" discussion aside that can be resolved elsewhere:
>>>>>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>>>>> Well no.  "SAF" aside (and SAF does need fixing before reposting this patch, otherwise it's just unnecessary churn), ...
>>>>>>>>>>> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
>>>>>>>>>>> index d2a781fc3fb5..d0623b72ccfa 100644
>>>>>>>>>>> --- a/xen/arch/x86/hvm/svm/svm.h
>>>>>>>>>>> +++ b/xen/arch/x86/hvm/svm/svm.h
>>>>>>>>>>> @@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>>>>>>>>>>> #define INSTR_INT3 INSTR_ENC(X86EMUL_OPC( 0, 0xcc), 0)
>>>>>>>>>>> #define INSTR_ICEBP INSTR_ENC(X86EMUL_OPC( 0, 0xf1), 0)
>>>>>>>>>>> #define INSTR_HLT INSTR_ENC(X86EMUL_OPC( 0, 0xf4), 0)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_XSETBV INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_VMRUN INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_VMCALL INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_VMLOAD INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_VMSAVE INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_STGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_CLGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_INVLPGA INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
>>>>>>>>>>> +/* SAF-2-safe */
>>>>>>>>>>> #define INSTR_RDTSCP INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
>>>>>>>>>>> #define INSTR_INVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>>>>>>>>> #define INSTR_WBINVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>>>>>>>>> ... this has broken a tabulated structure to have comments ahead of lines with octal numbers, while ...
>>>>>>>>>>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
>>>>>>>>>>> index aa2c61c433b3..c5e3341c6316 100644
>>>>>>>>>>> --- a/xen/arch/x86/hvm/svm/emulate.c
>>>>>>>>>>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>>>>>>>>>>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>>>>>>>>>>> if ( !instr_modrm )
>>>>>>>>>>> return emul_len;
>>>>>>>>>>> - if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) &&
>>>>>>>>>>> - (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>>>>>>>> - (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) )
>>>>>>>>>>> + if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
>>>>>>>>>>> + (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
>>>>>>>>>>> + (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) ) /* SAF-2-safe */
>>>>>>>>>>> return emul_len;
>>>>>>>>>>> }
>>>>>>>>> ... this has comments at the end of lines with octal numbers.
>>>>>>>>> So which is it?
>>>>>>>> I agree with Andrew here in this sense: the in-code comment is
>>>>>>>> supposed to be on the line *before* the violation,
>>>>>>>> not on the same line, so I’m also wondering how it is fixing the very
>>>>>>>> first violation.
>>>>>>>> Cheers,
>>>>>>>> Luca
>>>>>>>
>>>>>>
>>>>>> Hi Nicola,
>>>>>>
>>>>>>> Actually it justifies what is on either the previous line or the same because it's
>>>>>>> translated to /* -E> safe MC3R1.R7.1 1 */, where the last number is how many lines besides
>>>>>>> the current one are to be deviated (e.g. you can have 0 deviate only the current line).
>>>>>>
>>>>>> Just to understand, does this way:
>>>>>>
>>>>>> <line A>
>>>>>> /* -E> safe MC3R1.R7.1 1 */
>>>>>> <line B>
>>>>>>
>>>>>> Justifies only line B? Because I thought so, but now I want to be sure, otherwise it doesn’t act
>>>>>> as intended.
>>>>>>
>>>>>>
>>>>>>> Most of the times the current form is what's needed, as you would put the comment on a line
>>>>>>> of its own. In the case of the if that would break the formatting. The downside of doing the same thing on the table is that the first entry not to be deviated would actually be deviated.
>>>>>>>
>>>>>>> #define INSTR_INVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>>>>>
>>>>>>> This may not be problematic, since 0 could be considered an octal constant, but is an
>>>>>>> exception explicitly listed in the MISRA rule.
>>>>>>> For the same reason the line
>>>>>>>
>>>>>>> return emul_len;
>>>>>>>
>>>>>>> is deviated by the above comment, but putting an octal constant there would for sure
>>>>>>> be the result of a deliberate choice. There's the alternative of:
>>>>>>>
>>>>>>>                         /* SAF-2-safe */
>>>>>>> if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>>>>>>>                         /* SAF-2-safe */
>>>>>>>      (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>>>>                         /* SAF-2-safe */
>>>>>>>      (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
>>>>>>>
>>>>>>> to make it consistent with the table and avoid any "hidden" deviated line or, again,
>>>>>>> the modification of the translation script so that it doesn't use a fixed "1" offset, which
>>>>>>> is motivated by what you wrote on the thread of the modification of xen_analysis.py.
>>>>>>
>>>>>>  From the documentation:
>>>>>>
>>>>>>    In the Xen codebase, these tags will be used to document and suppress findings:
>>>>>>
>>>>>>    - SAF-X-safe: This tag means that the next line of code contains a finding, but
>>>>>>      the non compliance to the checker is analysed and demonstrated to be safe.
>>>>>>
>>>>>> I understand that Eclair is capable of suppressing also the line in which the in-code suppression
>>>>>> comment resides, but these generic Xen in-code suppression comment are meant to be used
>>>>>> by multiple static analysis tools and many of them suppress only the line next to the comment
>>>>>> (Coverity, cppcheck).
>>>>>
>>>>> As we see more realistic examples, it turns out that this is limiting.
>>>>>
>>>>> Given that the SAF-2-safe comment needs to go through xen-analysis.py
>>>>> translations anyway, could we implement something a bit more flexible in
>>>>> xen-analysis.py?
>>>>>
>>>>> For instance, could we implement a format with the number of lines of
>>>>> code like this as we discussed in a previous thread?
>>>>>
>>>>> /* SAF-2-safe start */
>>>>> if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>>>>>    (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>>    (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
>>>>> /* SAF-2-safe end */
>>>>>
>>>>> Firstly, let ask Andrew, do you prefer this?
>>>>>
>>>>>
>>>>> And also this second format:
>>>>>
>>>>> if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
>>>>>    (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
>>>>>    (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) ) /* SAF-2-safe */
>>>>>
>>>>>
>>>>> Could we implement in xen-analysis.py a conversion that would turn the
>>>>> two formats above that are not understood by cppcheck into:
>>>>>
>>>>> /* cppcheck tag */
>>>>> if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>>>>> /* cppcheck tag */
>>>>>    (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>> /* cppcheck tag */
>>>>>    (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
>>>>>
>>>>> Or this is a problem because it would end up changing lines of code
>>>>> numbers in the source file?
>>>>
>>>> Yes this is the real issue why we didn’t do the /* ... start */ code /* ... end */
>>>
>>> Right so the results would be all off by a few lines of code so when
>>> you go to read the report generated by cppcheck, the references
>>> wouldn't match anymore.
>>>
>>> Before giving up and accepting that we are constrained to only formats
>>> that don't change the LOC numbers, can we check what Coverity supports?
>>>
>>> I am asking because we could get away with implementing the formats
>>> above in cppcheck, given that cppcheck is open source. But for Coverity
>>> we need to stay with what is already supported by it.
>>>
>>> Does Coverity support anything other than:
>>>
>>> <tag on previous line>
>>> <next line is code with deviation>
>>
>> Unfortunately not, from its documentation I can’t see anything apart from the above,
>> I can ask someone from synopsys though to double check.
> 
> I wonder how people would feel to have an exception to our coding style
> in these cases and have longer than 80 chars lines. I am asking because
> this is better than many of the other options above:

I am not sure this is better. This is a long line to read. But this is a 
personal opinion.

On the technical side, can we easily teach a tool to format this kind of 
exception? If not, then this should not be an exception we should implement.

> 
> /* SAF-x-safe */
> if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) && (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
> 
> Any other ideas?

Could we have a number in the comment to indicate the number of lines 
the comment applies to?

Cheers,

-- 
Julien Grall

