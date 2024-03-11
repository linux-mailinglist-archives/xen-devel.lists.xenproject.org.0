Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F001877F54
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691426.1077399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeBK-0008DU-Ty; Mon, 11 Mar 2024 11:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691426.1077399; Mon, 11 Mar 2024 11:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeBK-0008BY-QO; Mon, 11 Mar 2024 11:51:02 +0000
Received: by outflank-mailman (input) for mailman id 691426;
 Mon, 11 Mar 2024 11:51:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rjeBI-0008BS-Ms
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:51:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjeBE-0003RM-QR; Mon, 11 Mar 2024 11:50:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rjeBE-00007L-Ef; Mon, 11 Mar 2024 11:50:56 +0000
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
	bh=eQO21LfS/aY0RyIaasupQpvJMEvM6d5GN2Ya6wT5+tE=; b=q8SfdCxKFYpRoZq/DqJOCz/27L
	SetGpQYTsLk14R13W4jMnHRLjY3nEspl8SuJUFNUEJf6IOXELiX6XspTsOsdnCLtfqPDIm1CdfjD9
	insPoVJpDJ2i5boKsC+p53OoznLu00ZoWaQaD0u/OffIdKzxKExH74/lH2PaOb471ZeQ=;
Message-ID: <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
Date: Mon, 11 Mar 2024 11:50:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, federico.serafini@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/03/2024 11:32, George Dunlap wrote:
> On Sat, Mar 9, 2024 at 1:59 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> I would like to resurrect this thread and ask other opinions.
>>
>>
>> On Thu, 23 Nov 2023, Jan Beulich wrote:
>>> On 22.11.2023 22:46, Stefano Stabellini wrote:
>>>> Two out of three do_multicall definitions/declarations use uint32_t as
>>>> type for the "nr_calls" parameters. Change the third one to be
>>>> consistent with the other two.
>>>>
>>>> Link: https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
>>>> Link: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>> ---
>>>> Note that a previous discussion showed disagreement between maintainers
>>>> on this topic. The source of disagreements are that we don't want to
>>>> change a guest-visible ABI and we haven't properly documented how to use
>>>> types for guest ABIs.
>>>>
>>>> As an example, fixed-width types have the advantage of being explicit
>>>> about their size but sometimes register-size types are required (e.g.
>>>> unsigned long). The C specification says little about the size of
>>>> unsigned long and today, and we even use unsigned int in guest ABIs
>>>> without specifying the expected width of unsigned int on the various
>>>> arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
>>>> that's not written anywhere as far as I can tell.
>>>>
>>>> I think the appropriate solution would be to document properly our
>>>> expectations of both fixed-width and non-fixed-width types, and how to
>>>> use them for guest-visible ABIs.
>>>>
>>>> In this patch I used uint32_t for a couple of reasons:
>>>> - until we have better documentation, I feel more confident in using
>>>>    explicitly-sized integers in guest-visible ABIs
>>>
>>> I disagree with this way of looking at it. Guests don't invoke these
>>> functions directly, and our assembly code sitting in between already is
>>> expected to (and does) guarantee that (in the case here) unsigned int
>>> would be okay to use (as would be unsigned long, but at least on x86
>>> that's slightly less efficient), in line with what ./CODING_STYLE says.
>>>
>>> Otoh structure definitions in the public interface of course need to
>>> use fixed with types (and still doesn't properly do so in a few cases).
> 
> You didn't address the other argument, which was that all the other
> definitions have uint32_t; in particular,
> common/multicall.c:do_multicall() takes uint32_t.  Surely that should
> match the non-compat definition in include/hypercall-defs.c?
> 
> Whether they should both be `unsigned int` or `uint32_t` I don't
> really feel like I have a good enough grasp of the situation to form a
> strong opinion.

FWIW +1. We at least need some consistency.

Cheers,

-- 
Julien Grall

