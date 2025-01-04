Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6BA01229
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865200.1276492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvHF-0004kt-8f; Sat, 04 Jan 2025 03:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865200.1276492; Sat, 04 Jan 2025 03:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvHF-0004iq-5R; Sat, 04 Jan 2025 03:56:41 +0000
Received: by outflank-mailman (input) for mailman id 865200;
 Sat, 04 Jan 2025 03:56:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvHD-0004gB-SZ
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:56:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e60edd08-ca4f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:56:38 +0100 (CET)
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
X-Inumbo-ID: e60edd08-ca4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735962997; x=1736222197;
	bh=OW3mpVxgA5P0XA8d7fgN/ejoe4Kv6q6qpvueYgRNz88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=M9nMosIj0vPXpCd0ocd0IDmMvElBDsenW7ewKNXLrfcXv9MmnUKJyYUo4NBk7D1Ui
	 PJS2dh3MLsG0qCx7VpZT0EFaC67pnaarbIWvs8m7vHibb+xsyjO7afwS3XF1su8t89
	 6lUlWqDHOCiSYrtoQcC9QdwVdxtVsqxmjDaNsrlxbLEffzoKMIwcUBTF/YDasXaHFZ
	 S5p+xJ2kNukvqCcTq+nW2Q6T1i0GKpfO7p+z1yiHD4LjZT4m91T9yFgTUUuMcXuyjQ
	 S1zbqV1AXH7dx3m8e7QbnjVkI9p+I4OMxfeb2MvFhB8EvVGfYCTtrrxMmfTkTjOH9p
	 UnMUqMsqkEmTA==
Date: Sat, 04 Jan 2025 03:56:31 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
Message-ID: <G87oAGpbL2OPT38kjS-Ja1fei-pmN1WYmfJMWCu-P_Qj-N8hbBEx0UCCELxZvWQTdK5T028HMxmtfRzdiQPDsUMpEOfoBmBFDy4b8N7NvP0=@proton.me>
In-Reply-To: <Z1mtigiI-5wkgzhK@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com> <Z1mtigiI-5wkgzhK@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 52e0835f2729680d59acc7872130ff488a77c438
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, December 11th, 2024 at 7:19 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:39PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Print d->arch.emulation_flags on the console for better traceability wh=
ile
> > debugging in-hypervisor hardware emulators.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/domain.c | 8 ++++++--
> > 1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 78a13e6812c9120901d0a70fb3bc1bd6a8b6917d..c88d422a64544531c1e1058=
fa484364bb4277d1e 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
> >
> > if ( !emulation_flags_ok(d, emflags) )
> > {
> > - printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> > + printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
>
>
> gprintk(XENLOG_ERR, "...
>
> Might be more natural now that we have the macro (together with Jan's
> suggestion to use %pd (same below).
>
> > "with the current selection of emulators: %#x\n",
> > - d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> > + d->domain_id,
> > + is_hvm_domain(d) ? "HVM" : "PV",
> > + is_hardware_domain(d) ? "(hardware) " : "",
> > + emflags);
> > return -EOPNOTSUPP;
> > }
> > + printk(XENLOG_G_INFO "d%d: emulation_flags %#x\n", d->domain_id, emfl=
ags);
>
>
> This would need to be a dprintk at least, and the log level should be
> XENLOG_DEBUG.

I moved emulation_flags printout to 'q' handler.

>
> Maybe it would be better if you could print this information as part
> of some debug key, for not having to print it for every guest
> creation. Maybe as part of the 'q' debug key?

Thank you for suggestion!
Fixed.

>
> Thanks, Roger.



