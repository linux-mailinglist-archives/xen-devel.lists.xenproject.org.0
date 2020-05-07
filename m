Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FA1C956F
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 17:51:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWinB-0007en-V9; Thu, 07 May 2020 15:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53Et=6V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jWinA-0007ei-Gz
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 15:50:32 +0000
X-Inumbo-ID: 7ac3c85c-907a-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ac3c85c-907a-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 15:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588866631;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K6ZR3PXY4Dd0L8GPKdMvC5aZb+GvqcltHa0T2DMQd9k=;
 b=WVFpTEZgMM8d9STeEKQcEmkGLWa7nraVk/NIdPLGycGxooLnmQNnUwt4
 wQtkcGdn12xGiZ00qEDcmL3hDUTi8quk+cLK4tzLgO9iqJKVGpULgsTHT
 sGbI2SmoVqBIgDNZFiOUS/8+f2ngRYM+IBqzntdCeH+pt1DDYlTPXdBpy 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iFNkUIlYTvERwQDDESQtbzzPgDl/Qi+1+4Vrv83R7ryE58arRLw/vo9dRbseKkQa3FehAcaqX+
 9tcastObtS3ym4RMoVpMMEnxbbV+byx9sqH5L28FG8zwGITZKFStzLcG4CkEpU81dRj6AbnOng
 JIOKbiRO75Sa9s5+wfImQrR/ionsQRlVTQt7yoI2VB4AFG2iK0ou4mbVlnJQdSLEJQtrA0Co0Y
 8f/wmoQxB5+SOLruUm6hyXgDaoun3JHXOaknQVWdkRKMex0qW4lCyghQuv72oG3xfeW78NKQBL
 O0o=
X-SBRS: 2.7
X-MesageID: 17273235
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,364,1583211600"; d="scan'208";a="17273235"
Subject: Re: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-16-andrew.cooper3@citrix.com>
 <2df78612-2c24-32de-186a-c402e188478c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <70d7b0e0-a599-6a19-5ace-af4f169545b3@citrix.com>
Date: Thu, 7 May 2020 16:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2df78612-2c24-32de-186a-c402e188478c@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/05/2020 15:12, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> The SYSCALL/SYSEXIT paths need to use {SET,CLR}SSBSY.
> I take it you mean SYSRET, not SYSEXIT.

I do, sorry.

> I do think though that you
> also need to deal with the SYSENTER entry point we have.

Oh - so we do.

>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -198,7 +198,7 @@ ENTRY(cr4_pv32_restore)
>>  
>>  /* See lstar_enter for entry register state. */
>>  ENTRY(cstar_enter)
>> -        /* sti could live here when we don't switch page tables below. */
>> +        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
> I don't see why you delete the comment here (or elsewhere). While
> I recall you not really wanting them there, I still think they're
> useful to have, and they shouldn't be deleted as a side effect of
> an entirely unrelated change. Of course they need to live after
> your insertions then.

Do you not remember Juergen performance testing results concerning this
comment?  The results were provably worse.

It is a useless comment.  Sure, its technically accurate, but so are an
arbitrarily large number of other comments about how we could permute
the code.

It has already been concluded that we won't be making the suggested
change.  Having a /* TODO - doing X will make the system slower */ isn't
something we should have adding to the complexity of the code, and
tricking people into thinking that something should be done.

>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -194,6 +194,15 @@ restore_all_guest:
>>          movq  8(%rsp),%rcx            # RIP
>>          ja    iret_exit_to_guest
>>  
>> +        /* Clear the supervisor shadow stack token busy bit. */
>> +.macro rag_clrssbsy
>> +        push %rax
>> +        rdsspq %rax
>> +        clrssbsy (%rax)
>> +        pop %rax
>> +.endm
>> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
> In principle you could get away without spilling %rax:
>
>         cmpl  $1,%ecx
>         ja    iret_exit_to_guest
>
>         /* Clear the supervisor shadow stack token busy bit. */
> .macro rag_clrssbsy
>         rdsspq %rcx
>         clrssbsy (%rcx)
> .endm
>         ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
>         movq  8(%rsp),%rcx            # RIP
>         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
>         movq  32(%rsp),%rsp           # RSP
>         je    1f
>         sysretq
> 1:      sysretl
>
>         ALIGN
> /* No special register assumptions. */
> iret_exit_to_guest:
>         movq  8(%rsp),%rcx            # RIP
>         andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
>         ...
>
> Also - what about CLRSSBSY failing? It would seem easier to diagnose
> this right here than when getting presumably #DF upon next entry into
> Xen. At the very least I think it deserves a comment if an error case
> does not get handled.

I did consider this, but ultimately decided against it.

You can't have an unlikely block inside a alternative block because the
jmp's displacement doesn't get fixed up.  Keeping everything inline puts
an incorrect statically-predicted branch in program flow.

Most importantly however, is that the SYSRET path is vastly less common
than the IRET path.  There is no easy way to proactively spot problems
in the IRET path, which means that conditions leading to a problem are
already far more likely to manifest as #DF, so there is very little
value in adding complexity to the SYSRET path in the first place.

> Somewhat similar for SETSSBSY, except there things get complicated by
> it raising #CP instead of setting EFLAGS.CF: Aiui it would require us
> to handle #CP on an IST stack in order to avoid #DF there.

Right, but having #CP as IST gives us far worse problems.

Being able to spot #CP vs #DF doesn't help usefully.  Its still some
arbitrary period of time after the damage was done.

Any nesting of #CP (including fault on IRET out) results in losing
program state and entering an infinite loop.

The cases which end up as #DF are properly fatal to the system, and we
at least get a clean crash out it.

>> @@ -877,6 +886,14 @@ handle_ist_exception:
>>          movl  $UREGS_kernel_sizeof/8,%ecx
>>          movq  %rdi,%rsp
>>          rep   movsq
>> +
>> +        /* Switch Shadow Stacks */
>> +.macro ist_switch_shstk
>> +        rdsspq %rdi
>> +        clrssbsy (%rdi)
>> +        setssbsy
>> +.endm
> Could you extend the comment to mention the caveat that you point
> out in the description?

Ok.

~Andrew

