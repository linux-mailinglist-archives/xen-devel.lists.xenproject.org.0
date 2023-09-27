Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4E7AFD1D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 09:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608699.947359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPMg-00016E-0y; Wed, 27 Sep 2023 07:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608699.947359; Wed, 27 Sep 2023 07:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPMf-000142-UT; Wed, 27 Sep 2023 07:53:45 +0000
Received: by outflank-mailman (input) for mailman id 608699;
 Wed, 27 Sep 2023 07:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U53p=FL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qlPMe-00013w-Hk
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 07:53:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9edcc1b-5d0a-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 09:53:42 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6DBF24EE0737;
 Wed, 27 Sep 2023 09:53:41 +0200 (CEST)
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
X-Inumbo-ID: f9edcc1b-5d0a-11ee-878a-cb3800f73035
MIME-Version: 1.0
Date: Wed, 27 Sep 2023 09:53:41 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
In-Reply-To: <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
References: <20230908230318.1719290-1-sstabellini@kernel.org>
 <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
 <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

>> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>> > index 695d2fa1f1..2a8527cacc 100644
>> > --- a/xen/arch/arm/psci.c
>> > +++ b/xen/arch/arm/psci.c
>> > @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
>> >       }
>> >   }
>> >   +/* SAF-2-safe */
>> 
>> I think any use of SAF-2-safe should be accompanied with an 
>> attribute...
>> 
>> >   void call_psci_system_off(void)
>> 
>> ... noreturn for function or ...
>> 
>> >   {
>> >       if ( psci_ver > PSCI_VERSION(0, 1) )
>> > diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
>> > index 7619544d14..47e0f59024 100644
>> > --- a/xen/arch/x86/shutdown.c
>> > +++ b/xen/arch/x86/shutdown.c
>> > @@ -118,6 +118,7 @@ static inline void kb_wait(void)
>> >               break;
>> >   }
>> >   +/* SAF-2-safe */
>> >   static void noreturn cf_check __machine_halt(void *unused)
>> >   {
>> >       local_irq_disable();
>> > diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
>> > index e8a4eea71a..d47c54f034 100644
>> > --- a/xen/include/xen/bug.h
>> > +++ b/xen/include/xen/bug.h
>> > @@ -117,6 +117,7 @@ struct bug_frame {
>> >   #endif
>> >     #ifndef BUG
>> > +/* SAF-2-safe */
>> >   #define BUG() do {                                              \
>> >       BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
>> >       unreachable();                                              \
>> 
>> ... unreachable for macros. But the /* SAF-2-safe */ feels a little 
>> bit
>> redundant when a function is marked as 'noreturn'.
>> 
>> Is there any way to teach eclair about noreturn?
> 
> Actually I had the same thought while writing this patch. If we can
> adopt unreachable and noreturn consistently maybe we don't need
> SAF-2-safe. If the checker can support it.
> 
> Nicola, what do you think?

A couple of remarks:
- if you put the noreturn attribute on some functions, then surely the 
code after those is
reported as unreachable. ECLAIR should pick up all forms of noreturn 
automatically; otherwise, a simple configuration can be used.

- Note that the cause of unreachability in the vast majority of cases is 
the call to
__builtin_unreachable(), therefore a textual deviation on the definition 
of unreachable, plus
a bit of ECLAIR configuration, can deviate it (to be clear, just the SAF 
comment is not
sufficient, since deviations comments are meant to be applied at the top 
expansion location,
which is not on the macro definition).
This is what it should look like, roughly:

-config=MC3R1.R2.1,reports+={deliberate, 
"any_area(any_loc(text(^<REGEX>$, -1)))"}

#if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
/* SAF-2-safe */
#define unreachable() do {} while (1)
#else
/* SAF-2-safe */
#define unreachable() __builtin_unreachable()
#endif

where REGEX will match the translation of SAF-2-safe.

However, this will then entail that *some* SAF comments are treated 
specially and, moreover,
that some modification to the definition of unreachable won't work
(e.g.
#define M() __builtin_unreachable()
/* SAF-2-safe */
#define unreachable() M()

My opinion is that it's far easier for this to be an eclair 
configuration (which has the
advantage not to depend on the exact definition of unreachable) and then 
perhaps a comment
above it explaining the situation.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

