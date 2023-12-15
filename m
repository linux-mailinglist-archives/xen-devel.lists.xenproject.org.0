Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E481462F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655024.1022663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE5yy-0008F2-Nc; Fri, 15 Dec 2023 11:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655024.1022663; Fri, 15 Dec 2023 11:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE5yy-0008Bs-Ko; Fri, 15 Dec 2023 11:03:52 +0000
Received: by outflank-mailman (input) for mailman id 655024;
 Fri, 15 Dec 2023 11:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqNh=H2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rE5yx-0008Bk-D0
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:03:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d773774-9b39-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 12:03:48 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id AE1D34EE073C;
 Fri, 15 Dec 2023 12:03:44 +0100 (CET)
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
X-Inumbo-ID: 9d773774-9b39-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Fri, 15 Dec 2023 12:03:44 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
In-Reply-To: <alpine.DEB.2.22.394.2312141418160.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
 <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
 <2b4eec7c-3657-4542-96b9-56b272e8723b@xen.org>
 <alpine.DEB.2.22.394.2312141418160.3175268@ubuntu-linux-20-04-desktop>
Message-ID: <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-12-14 23:32, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Julien Grall wrote:
>> Hi,
>> 
>> On 13/12/2023 14:02, Nicola Vetrini wrote:
>> > On 2023-12-12 16:49, Julien Grall wrote:
>> > > Hi,
>> > >
>> > > On 11/12/2023 12:32, Julien Grall wrote:
>> > > > Hi,
>> > > >
>> > > > On 11/12/2023 10:30, Nicola Vetrini wrote:
>> > > > > The branches of the switch after a call to 'do_unexpected_trap'
>> > > > > cannot return, but there is one path that may return, hence
>> > > > > only some clauses are marked with ASSERT_UNREACHABLE().
>> > > > I don't understand why this is necessary. The code should never be
>> > > > reachable because do_unexpected_trap() is a noreturn().
>> > >
>> > > From the matrix discussion, it wasn't clear what was my position on this
>> > > patch.
>> > >
>> > > I would much prefer if the breaks are kept. I could accept:
>> > >
>> > > ASSERT_UNREACHABLE();
>> > > break;
>> > >
>> > > But this solution is a Nack because if you are concerned about functions
>> > > like do_unexpected_trap() to return by mistaken, then it needs to also be
>> > > safe in production.
>> > >
>> > > The current proposal is not safe.
> 
> I re-read the email thread. I also do not think that this is useful:
> 
>          do_unexpected_trap("SVE trap at EL2", regs);
> -        break;
> +        ASSERT_UNREACHABLE();
> 
> I also do not think that we should be concerned about functions like
> do_unexpected_trap() to return by mistaken.
> 
> That said, what is the problem from MISRA point of view that we are
> trying to fix? Is the only problem the presence of break; after the 
> call
> to a noreturn function?
> 
> If that's not allowed, I would suggest to do this:
> 
> 
>          do_unexpected_trap("SVE trap at EL2", regs);
> -        break;
> +        /* break; */
> 
> 
> Or deviate "break" globally as it doesn't seem to be a safety risk in 
> my
> opinion. If nothing else, it should make the code a bit safer because 
> in
> case of mistakes in do_unexpected_trap, at least we would continue to
> follow a more reasonable code path rather than blindly falling through
> the next switch case by accident.
> 
> 

That doesn't seem like a good idea to deviate just "break". However, 
Julien's earlier proposal

ASSERT_UNREACHABLE();
break;

is ok, though it could be shrunk in a macro

#define unreachable_break ASSERT_UNREACHABLE(); break;

or just

#define unreachable_break break;

so that "unreachable_break" can be deviated.

>> > Ok. I wonder whether the should be applied here in vcpreg.c:
>> >
>> > diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>> > index 39aeda9dab62..089d2f03eb5e 100644
>> > --- a/xen/arch/arm/vcpreg.c
>> > +++ b/xen/arch/arm/vcpreg.c
>> > @@ -707,7 +707,8 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr
>> > hsr)
>> >           inject_undef_exception(regs, hsr);
>> >           return;
>> >       }
>> > -
>> > +
>> > +    ASSERT_UNREACHABLE();
>> >       advance_pc(regs, hsr);
>> >   }
>> >
>> > the rationale being that, should the switch somehow fail to return, the
>> > advance_pc would be called, rather than doing nothing.
>> 
>> To clarify, advance_pc(regs, hsr) would still be called in production 
>> build.
>> So if you are concerned about advance_pc() been called, then adding an
>> ASSERT_UNREACHABLE() is not going to help.
>> 
>> It took me a little while to confirm that none of the path effectively 
>> returns
>> due to the macros (in hindsight, it wasn't a good idea of mine to 
>> introduce
>> them).
>> 
>> Depending on what we are trying to solve there are 3 possible 
>> approach:
>>   1. Leave advance_pc(). This means we could potentially
>>      a. Advance the PC twice (if it was already called) and therefore 
>> skipping
>> an instruction
>>      b. Advance the PC once without an emulation
>>   2. Remove advance_pc(). If we already called the function, then 
>> there is no
>> problem. Otherwise, we would trap in a loop effectively rendering the 
>> guest
>> vCPU unusable.
>>   3. Replace with domain_crash()
>> 
>> Here it feels, that 3 is more suitable as this gives a clear 
>> indication
>> why/where the emulation gone wrong.
>> 
>> This may still need to be accompanied with a ASSERT_UNREACHABLE() to 
>> please
>> MISRA.
>> 
>> Bertrand, Michal, Stefano, what do you think?
> 
> Yes, I would go with 3., replace advance_pc with domain_crash. Assuming
> that it would also solve the violation in ECLAIR.

It needs to be prefixed with an ASSERT_UNREACHABLE(), though, because 
it's still a violation if there is no execution path leading to 
domain_crash(), but other than that it seems the safest choice.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

