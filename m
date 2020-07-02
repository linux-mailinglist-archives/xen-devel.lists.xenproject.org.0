Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCB12123BF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 14:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqyk3-0001mo-6o; Thu, 02 Jul 2020 12:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhfR=AN=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1jqyk1-0001mj-JQ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 12:55:01 +0000
X-Inumbo-ID: 3c7c397a-bc63-11ea-8823-12813bfff9fa
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c7c397a-bc63-11ea-8823-12813bfff9fa;
 Thu, 02 Jul 2020 12:54:59 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593694497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNvxqRrDBbz/jOt3So+sU7T7gZSGCFNrBBBNp3CZ8ak=;
 b=uFjYLcy3ORbpRJ1mNlx3oLoa/xhPpbmog/Rzoeck+yzRlpR+1qwqbSbNRNkICxTp+NeiZ4
 1/5ZodefKs3pCG7Dr1zT1PtRHOmyPIarZKu5JrBCFec29TFCTKV4lBvvX1zyGqDxQVdNtl
 7wZqz88O8OsL8c2ovz5KpEjSb9EmltKRcWqqYLCOA8Jx3IFGtHz5Xm9YkjG4K/yAPIpbFL
 nOuvXvfvXPZc2nVgqCg03DT4kNoEgAUypGBlx0yupqVkaseT4QedEj3mFGCU+u6uFTNjwQ
 QVhMC61GkmeCe60cHGtCwBAgYeCWmooqDxCAB9PFpGNbfZm6wHtyKqtva+msPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593694497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNvxqRrDBbz/jOt3So+sU7T7gZSGCFNrBBBNp3CZ8ak=;
 b=J83+q3jnPFCHhvohg6pU47S27J9wegJwqnwUYOrKe1OOWO7wE7bVIoC8hRvQ+vI0ktFeHt
 GchKFMnOfP9AxrCw==
To: Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH 3/6] x86/entry/64/compat: Fix Xen PV SYSENTER frame setup
In-Reply-To: <CALCETrVy-Q4K04wmEPe5VeU=at2BL4b-bSFkoSU-BPbTaTB2Yg@mail.gmail.com>
References: <cover.1593191971.git.luto@kernel.org>
 <947880c41ade688ff4836f665d0c9fcaa9bd1201.1593191971.git.luto@kernel.org>
 <CAMzpN2iW4XD1Gsgq0ZeeH2eewLO+9Mk6eyk0LnbF-kP3v=smLg@mail.gmail.com>
 <CALCETrVy-Q4K04wmEPe5VeU=at2BL4b-bSFkoSU-BPbTaTB2Yg@mail.gmail.com>
Date: Thu, 02 Jul 2020 14:54:57 +0200
Message-ID: <87k0zm9ivy.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andy Lutomirski <luto@kernel.org> writes:
> On Wed, Jul 1, 2020 at 8:42 AM Brian Gerst <brgerst@gmail.com> wrote:
> > On Fri, Jun 26, 2020 at 1:30 PM Andy Lutomirski <luto@kernel.org> wrote:
>> >
>> > The SYSENTER frame setup was nonsense.  It worked by accident
>> > because the normal code into which the Xen asm jumped
>> > (entry_SYSENTER_32/compat) threw away SP without touching the stack.
>> > entry_SYSENTER_compat was recently modified such that it relied on
>> > having a valid stack pointer, so now the Xen asm needs to invoke it
>> > with a valid stack.
>> >
>> > Fix it up like SYSCALL: use the Xen-provided frame and skip the bare
>> > metal prologue.
>> >
>> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> > Cc: Juergen Gross <jgross@suse.com>
>> > Cc: Stefano Stabellini <sstabellini@kernel.org>
>> > Cc: xen-devel@lists.xenproject.org
>> > Fixes: 1c3e5d3f60e2 ("x86/entry: Make entry_64_compat.S objtool clean")
>> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> > ---
>> >  arch/x86/entry/entry_64_compat.S |  1 +
>> >  arch/x86/xen/xen-asm_64.S        | 20 ++++++++++++++++----
>> >  2 files changed, 17 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
>> > index 7b9d8150f652..381a6de7de9c 100644
>> > --- a/arch/x86/entry/entry_64_compat.S
>> > +++ b/arch/x86/entry/entry_64_compat.S
>> > @@ -79,6 +79,7 @@ SYM_CODE_START(entry_SYSENTER_compat)
>> >         pushfq                          /* pt_regs->flags (except IF = 0) */
>> >         pushq   $__USER32_CS            /* pt_regs->cs */
>> >         pushq   $0                      /* pt_regs->ip = 0 (placeholder) */
>> > +SYM_INNER_LABEL(entry_SYSENTER_compat_after_hwframe, SYM_L_GLOBAL)
>>
>> This skips over the section that truncates the syscall number to
>> 32-bits.  The comments present some doubt that it is actually
>> necessary, but the Xen path shouldn't differ from native.  That code
>> should be moved after this new label.
>
> Whoops.  I thought I caught that myself, but apparently not.  I'll fix it.

Darn. I already applied that lot. Can you please send a delta fix?

Thanks,

        tglx

