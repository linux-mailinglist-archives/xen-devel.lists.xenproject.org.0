Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B0975541
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796699.1206457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOK5-0005lc-Ld; Wed, 11 Sep 2024 14:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796699.1206457; Wed, 11 Sep 2024 14:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soOK5-0005jq-J2; Wed, 11 Sep 2024 14:27:57 +0000
Received: by outflank-mailman (input) for mailman id 796699;
 Wed, 11 Sep 2024 14:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAZH=QJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1soOK3-0005bK-LZ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:27:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0847ac8e-704a-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 16:27:54 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 773824EE0C8F;
 Wed, 11 Sep 2024 16:27:53 +0200 (CEST)
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
X-Inumbo-ID: 0847ac8e-704a-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1726064873; bh=cOjw/BSru2u3rudH3l50tW1MhLnlrrniyU31C8k3HhQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QXo4wRS1vZOWKhGDSP9BfEUNl0WakkgqfF8QqPw9hwsUWj1oLAEMB/V6t7K8D0Apb
	 CGtBxj3Q6ZUpZNdgSHcy4Q0Cs0MwWG8qVZ7D7xvH84hQcj47s7fq/ZaQarQPTiliHB
	 6AgHUO/C+f1b527h5FgemhRTLZzeMdVOnfw2ppyzyrPdGx12nj8wp8DHN09NE/O61q
	 dJSsz/61dkJGet65V6GIsmb/eWrKqUrmiM1i2k8XYoR/2D30ge4sImfyxVAdJZEZFY
	 GPb+tHJKhJM/1Z2BMizqRfpntl4ljOtXzNOrtUsM2n5BXSDHjW0wxk/wiTndNpStvs
	 kOoVaGp6RwfqQ==
MIME-Version: 1.0
Date: Wed, 11 Sep 2024 16:27:53 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Federico Serafini
 <federico.serafini@bugseng.com>, consulting@bugseng.com, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
In-Reply-To: <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com> <ZuGYOldX55_ZfJCv@mail-itl>
 <0a36284e-4b99-413c-bc12-0328b12da0d2@suse.com>
Message-ID: <a679972c919f4cf281f23b63ab98f312@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-09-11 16:10, Jan Beulich wrote:
> On 11.09.2024 15:16, Marek Marczykowski-Górecki wrote:
>> On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
>>> On 10.09.2024 21:06, Federico Serafini wrote:
>>>> Refactor the code to improve readability
>>> 
>>> I question this aspect. I'm not the maintainer of this code anymore, 
>>> so
>>> my view probably doesn't matter much here.
>>> 
>>>> and address violations of
>>>> MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
>>>> not contain any expression which has potential side effect").
>>> 
>>> Where's the potential side effect? Since you move ...
>>> 
>>>> --- a/xen/common/efi/runtime.c
>>>> +++ b/xen/common/efi/runtime.c
>>>> @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union 
>>>> xenpf_efi_info *info)
>>>>          info->cfg.addr = __pa(efi_ct);
>>>>          info->cfg.nent = efi_num_ct;
>>>>          break;
>>>> +
>>>>      case XEN_FW_EFI_VENDOR:
>>>> +    {
>>>> +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =
>>>> +            guest_handle_cast(info->vendor.name, CHAR16);
>>> 
>>> .. this out, it must be the one. I've looked at it, yet I can't spot
>>> anything:
>>> 
>>> #define guest_handle_cast(hnd, type) ({         \
>>>     type *_x = (hnd).p;                         \
>>>     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>> })
>>> 
>>> As a rule of thumb, when things aren't obvious, please call out the
>>> specific aspect / property in descriptions of such patches.
>> 
>> I guess it's because guest_handle_cast() is a macro, yet it's 
>> lowercase
>> so looks like a function?
> 
> If Eclair didn't look at the macro-expanded code, it wouldn't even see
> the sizeof(). Hence I don't expect the thing to be mistaken for a 
> function
> call.
> 

Looking at the fully preprocessed code [1], there is an assignment to 
CHAR *_x inside a sizeof(), therefore compat_handle_cast is triggering 
the violation when used in such a way to be inside the sizeof().

if ( !((!!((((get_cpu_info()->current_vcpu))->domain)->arch.paging.mode 
& ((1 << 4) << 10))) || (
__builtin_expect(!!(((n)) < (~0U / (sizeof(**(({ CHAR16 *_x = 
(__typeof__(**(info->vendor.name)._) *)(full_ptr_t)(info->
vendor.name).c; (__compat_handle_CHAR16) { (full_ptr_t)_x }; 
}))._)))),1) && ((unsigned long)((unsigned long)((void *)(
full_ptr_t)(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._) 
*)(full_ptr_t)(info->vendor.name).c; (
__compat_handle_CHAR16) { (full_ptr_t)_x }; })).c) + ((0 + ((n)) * 
(sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->
vendor.name)._) *)(full_ptr_t)(info->vendor.name).c; 
(__compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) ? (0 + ((n))
* (sizeof(**(({ CHAR16 *_x = (__typeof__(**(info->vendor.name)._) 
*)(full_ptr_t)(info->vendor.name).c; (
__compat_handle_CHAR16) { (full_ptr_t)_x }; }))._))) - 1 : 0)) < 
((void)(((get_cpu_info()->current_vcpu))->domain), 0)))
) )

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/latest/PROJECT.ecd;/by_service/MC3R1.R13.6.html#{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":true,"kind":0,"domain":"message","inputs":[{"enabled":true,"text":"^.*xen/common/efi/runtime\\.c:258\\.15-258\\.31: 
`sizeof' expression trait"}]}}}

>> Wasn't there some other MISRA rule about lowercase/uppercase for macro 
>> names?
> 

There isn't one imposing this restriction (at least in MISRA C:2012, I 
haven't checked earlier editions).

> I can't recall having run into one, but I also haven't memorized them 
> all.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

