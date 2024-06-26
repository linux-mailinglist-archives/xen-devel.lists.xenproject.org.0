Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0CF917C55
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748564.1156308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOoz-0002LP-FI; Wed, 26 Jun 2024 09:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748564.1156308; Wed, 26 Jun 2024 09:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOoz-0002JJ-Ck; Wed, 26 Jun 2024 09:20:09 +0000
Received: by outflank-mailman (input) for mailman id 748564;
 Wed, 26 Jun 2024 09:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMOox-0002HF-5P
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:20:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46a5b478-339d-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:20:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9E1124EE0738;
 Wed, 26 Jun 2024 11:20:05 +0200 (CEST)
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
X-Inumbo-ID: 46a5b478-339d-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 26 Jun 2024 11:20:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 05/16] xen/x86: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <dd042e7d17e7833e12a5ff6f28dd560b5ff02cf7.1710145041.git.simone.ballarin@bugseng.com>
 <dce6c44d-94b7-43bd-858a-9337336a79cf@suse.com>
 <ef623bad297d016438b35bedc80f091d@bugseng.com>
 <ec92611e-6762-4b6c-af3e-999b748d1f1b@suse.com>
Message-ID: <797b00049612507d273facc581b2c2c5@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-26 11:06, Jan Beulich wrote:
> On 25.06.2024 21:31, Nicola Vetrini wrote:
>> On 2024-03-12 09:16, Jan Beulich wrote:
>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -258,18 +258,20 @@ $(obj)/asm-macros.i: CFLAGS-y += -P
>>>>  $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i
>>>> $(src)/Makefile
>>>>  	$(call filechk,asm-macros.h)
>>>> 
>>>> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
>>> 
>>> This wants to use :=, I think - there's no reason to invoke the shell
>>> ...
>> 
>> I agree on this
>> 
>>> 
>>>>  define filechk_asm-macros.h
>>>> +    echo '#ifndef ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>> +    echo '#define ASM_$(ARCHDIR)_ASM_MACROS_H'; \
>>>>      echo '#if 0'; \
>>>>      echo '.if 0'; \
>>>>      echo '#endif'; \
>>>> -    echo '#ifndef __ASM_MACROS_H__'; \
>>>> -    echo '#define __ASM_MACROS_H__'; \
>>>>      echo 'asm ( ".include \"$@\"" );'; \
>>>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>>>      echo '#if 0'; \
>>>>      echo '.endif'; \
>>>>      cat $<; \
>>>> -    echo '#endif'
>>>> +    echo '#endif'; \
>>>> +    echo '#endif /* ASM_$(ARCHDIR)_ASM_MACROS_H */'
>>>>  endef
>>> 
>>> ... three times while expanding this macro. Alternatively (to avoid
>>> an unnecessary shell invocation when this macro is never expanded at
>>> all) a shell variable inside the "define" above would want 
>>> introducing.
>>> Whether this 2nd approach is better depends on whether we anticipate
>>> further uses of ARCHDIR.
>> 
>> However here I'm not entirely sure about the meaning of this latter
>> proposal.
>> My proposal is the following:
>> 
>> ARCHDIR := $(shell echo $(SRCARCH) | tr a-z A-Z)
>> 
>> in a suitably generic place (such as Kbuild.include or maybe
>> xen/Makefile) as you suggested in subsequent patches that reused this
>> pattern.
> 
> If $(ARCHDIR) is going to be used elsewhere, then what you suggest is 
> fine.
> My "whether" in the earlier reply specifically left open for 
> clarification
> what the intentions with the variable are. The alternative I had 
> described
> makes sense only when $(ARCHDIR) would only ever be used inside the
> filechk_asm-macros.h macro.
> 

Yes, the intention is to reuse $(ARCHDIR) in the formation of other 
places, as you can tell from the fact that subsequent patches replicate 
the same pattern. This is going to save some duplication.
The only matter left then is whether xen/Makefile (around line 250, just 
after setting SRCARCH) would be better, or Kbuild.include. To me the 
former place seems more natural, but I'm not totally sure.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

