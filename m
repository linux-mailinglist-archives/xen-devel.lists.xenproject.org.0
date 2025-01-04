Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C5A01251
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:48:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865349.1276652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTw5Y-0003og-Dw; Sat, 04 Jan 2025 04:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865349.1276652; Sat, 04 Jan 2025 04:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTw5Y-0003me-Ae; Sat, 04 Jan 2025 04:48:40 +0000
Received: by outflank-mailman (input) for mailman id 865349;
 Sat, 04 Jan 2025 04:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTw5X-0003mY-B2
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:48:39 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290bbc07-ca57-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:48:37 +0100 (CET)
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
X-Inumbo-ID: 290bbc07-ca57-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735966116; x=1736225316;
	bh=P6uwmuIvQV7K8UAC+yyJsz5cBd/6YK3hUCy+0rjhRdo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cqfwOpMuZorFJMrhOrA35XJES0Y5uFJiE3xXnotT2oe43Fe9E6Ozh7yGXX1hCve96
	 sxSNAduqb6Yav8RMUKJSvEgT6cF2QoRVnRArOY6YA248mYgcsYjWvtqu2j0TqY9Ay7
	 UqaxU3mQrPJYfCvDtGTHI5OdwZh3f5WkI+dWfwOe02nHSdzhLg3Eo+KvGUJ3IA5uJx
	 zoaqjh+zV5wLNRfoDfHpfLEIGdlwROTiqlhlJU0eBCBWnHzurS9mif/fZOtStZtoUq
	 j/9iwaEXfJ02YejKeyg7Yyph2uTgdt/UeXss+DB9eM7nFpihkkPyTx8Uwn8gVg2Rbw
	 hB+55XnuDaFyQ==
Date: Sat, 04 Jan 2025 04:48:31 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 24/35] xen/console: introduce hwdom_crashconsole=
Message-ID: <f1ydmZYqXWIwEzxitfa-ISv4hUrzb_m_9QLywWnzjbqsIlLdIaGdiev8lh5_UPZ8MsmOm_DebjAZ8EoYmyzpptaPj3uUtZHWjDfcjZB8ih8=@proton.me>
In-Reply-To: <Z1rXEtHPjjjEPKw3@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-24-e9aa923127eb@ford.com> <Z1rXEtHPjjjEPKw3@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 467dc90b3fcb019879975b1c07f1e30b5f29c3c2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, December 12th, 2024 at 4:29 AM, Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:54PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > The new command line switch `hwdom_crashconsole=3DBOOL` allows to switc=
h serial
> > console input focus to xen for machine state inspection using keyhandle=
r
> > mechanism after the hardware domain crashes.
> >
> > The new command line switch is aliased via `dom0=3D...,crashconsole` kn=
ob.
> >
> > Such functionality can be useful while debugging dom0 bringup.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > docs/misc/xen-command-line.pandoc | 5 +++++
> > xen/arch/x86/dom0_build.c | 2 ++
> > xen/common/domain.c | 14 +++++++++++++-
> > xen/include/xen/domain.h | 1 +
> > 4 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 293dbc1a957ba6e668fd4d55d58e84f643822126..fb77d7dca1ea517f79d6713=
aa6909422f31e7724 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -806,6 +806,7 @@ Specify the bit width of the DMA heap.
> >
> > ### dom0
> > =3D List of [ pv | pvh, shadow=3D<bool>, verbose=3D<bool>,
> > + crashconsole=3D<bool>,
> > cpuid-faulting=3D<bool>, msr-relaxed=3D<bool> ] (x86)
> >
> > =3D List of [ sve=3D<integer> ] (Arm64)
> > @@ -839,6 +840,10 @@ Controls for how dom0 is constructed on x86 system=
s.
> > information during the dom0 build. It defaults to the compile time choi=
ce
> > of `CONFIG_VERBOSE_DEBUG`.
> >
> > +* The `crashconsole` boolean instructs Xen to drop into emergency cons=
ole
> > + in case of dom0 crash. May be useful for dom0 bringup on a custom
>
>
> I think the 'a' is unneeded -> "on custom hardware."

Yep. Thank you.

>
>
> I think however this would be clearer as:
>
> "The `crashconsole` boolean instructs Xen to switch input console
> focus to the hypervisor when dom0 shuts down and avoid performing
> dom0 domain destruction. Should only be used for debugging
> purposes."

Fixed.

>
> It's IMO not clear what "instructs Xen to drop into emergency console"
> implies for Xen.
>
> > + hardware.
> > +
> > * The `cpuid-faulting` boolean is an interim option, is only applicable=
 to
> > PV dom0, and defaults to true.
> >
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index e8f5bf5447bc47a6daa3d95787106a4c11e80d31..706aeec0ecbb565a415edbf=
b33ca2fd72967c560 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -286,6 +286,8 @@ int __init parse_arch_dom0_param(const char *s, con=
st char *e)
> > opt_dom0_cpuid_faulting =3D val;
> > else if ( (val =3D parse_boolean("msr-relaxed", s, e)) >=3D 0 )
> > opt_dom0_msr_relaxed =3D val;
> > + else if ( (val =3D parse_boolean("crashconsole", s, e)) >=3D 0 )
> > + opt_hwdom_crashconsole =3D !!val;
> > else
> > return -EINVAL;
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index aab546c0a8535e4f007cbbc9c5c552bcf66b5807..4fe69f294158dda7b2e0b9d=
98d49c34e04131cb8 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -56,6 +56,13 @@ unsigned int xen_processor_pmbits =3D XEN_PROCESSOR_=
PM_PX;
> > bool opt_dom0_vcpus_pin;
> > boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
> >
> > +/*
> > + * Hardware domain crash handler: if true, do not halt machine, but sw=
itch to
> > + * Xen console for debugging.
> > + */
> > +bool opt_hwdom_crashconsole;
>
>
> __ro_after_init.

Done.

>
> > +boolean_param("hwdom_crashconsole", opt_hwdom_crashconsole);
>
>
> This option doesn't seem to be documented at all in
> xen-command-line.pandoc?

Thanks; fixed.

>
> > +
> > /* Protect updates/reads (resp.) of domain_list and domain_hash. */
> > DEFINE_SPINLOCK(domlist_update_lock);
> > DEFINE_RCU_READ_LOCK(domlist_read_lock);
> > @@ -1138,7 +1145,12 @@ int domain_shutdown(struct domain *d, u8 reason)
> > reason =3D d->shutdown_code;
> >
> > if ( is_hardware_domain(d) )
> > - hwdom_shutdown(reason);
> > + {
> > + if ( opt_hwdom_crashconsole )
> > + console_set_owner(DOMID_XEN);
>
>
> Don't you need to pause all domain vCPUs and return early here to
> avoid executing the rest of the function, that will likely destroy the
> domain?
>
> Maybe there's something I'm missing that prevents the hardware domain
> destruction.

The point of this change is to drop the user to Xen console on crash instea=
d
of unconditional system restart. TBH, I did not plan for "freezing" the dom=
ain
state. I also tested w/ non-hyperlaunch PV dom0 only (I used kexec to
start PV dom0 which was crashing).

My understanding, if I followed the code correctly, all is fine.
domain_destroy() is not called because asm_domain_crash_synchronous(), whic=
h
handles the crash, just spins around do_softirq():

void asm_domain_crash_synchronous(unsigned long addr)
{
...

    __domain_crash(current->domain); // that will call domain_crash()

    for ( ; ; )
        do_softirq();
}

>
> Thanks, Roger.



