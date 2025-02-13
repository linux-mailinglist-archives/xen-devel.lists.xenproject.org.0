Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A3A339F6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887192.1296731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUai-00038k-Ev; Thu, 13 Feb 2025 08:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887192.1296731; Thu, 13 Feb 2025 08:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUai-00036M-BI; Thu, 13 Feb 2025 08:29:00 +0000
Received: by outflank-mailman (input) for mailman id 887192;
 Thu, 13 Feb 2025 08:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bpFt=VE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiUag-0002vc-Rl
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:28:58 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 920c06ea-e9e4-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 09:28:58 +0100 (CET)
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
X-Inumbo-ID: 920c06ea-e9e4-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739435336; x=1739694536;
	bh=li2gBVQdC52ZqWP/BiAjYxuwjhQQdZy8L3agV51RMbA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JKyrMU7LOstcECQL00PWOVxrfQkQmsXMtvqimFztAFk83PqicbTjRttAifF2cPum9
	 7Nrn44fCxiWPDoncRbWyVG/AdK6UNGqlrvlqCYb46NKiEkbT/HtJY65piFDDOTlViZ
	 7FZcaWWRRcwbE/iLJ+dJt8LaJ87AeTmbmJDEaJeONi6V/ClO5TTptm1zZXjyqCrq1D
	 b+Vq4se2KIlbibXAO0oBgwdl3JFZjRFaVqSwk7OAC1oGrE84LACk5m9T2cZVlSiwnx
	 jHWMlguJK9xXqrXim6JJc+6awLU2PAgJ23aLsU3zn/OkihPdN0SjZ475TSk3GywNFp
	 QSdSijtDrij2g==
Date: Thu, 13 Feb 2025 08:28:51 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: add keyhandler to print Xen version
Message-ID: <VCBA0vRq3I9sQbIUtXx3WkWARGEDDm9p401Mk3yddMXzXHdA01Bp2dVxUnpV4FkyG5CB5Relc9eOBFKQLjO-IdAXGm61jrx6QRZQRrQ8GCU=@proton.me>
In-Reply-To: <ed268817-8120-4d83-9a6b-0c9bfa9fe728@suse.com>
References: <20250212235754.3686278-1-dmukhin@ford.com> <ed268817-8120-4d83-9a6b-0c9bfa9fe728@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: be4439e7c024875208519f2b1426f19c4643c4fb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, February 12th, 2025 at 11:25 PM, Jan Beulich <jbeulich@suse.c=
om> wrote:

>
>
> On 13.02.2025 00:58, dmkhn@proton.me wrote:
>
> > Add Xen version printout via keyhandler mechanism.
> >
> > That is useful for debugging systems that have been left intact for a l=
ong
> > time.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>
>
> First, +1 to what Andrew said.
>
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -974,6 +974,28 @@ void guest_printk(const struct domain *d, const ch=
ar *fmt, ...)
> > va_end(args);
> > }
> >
> > +static void xen_print_version(void)
> > +{
> > + const char *str =3D NULL;
> > + unsigned int str_len;
> > +
> > + printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> > + xen_major_version(), xen_minor_version(), xen_extra_version(),
> > + xen_compile_by(), xen_compile_domain(), xen_compiler(),
> > + xen_build_info(), xen_compile_date());
> > +
> > + printk("Latest ChangeSet: %s\n", xen_changeset());
> > +
> > + if ( !xen_build_id((const void **)&str, &str_len) )
>
>
> Why the cast? What wrong with "str" being const void *? The only thing
> is that it's then not really a good name for the variable, but that it
> isn't anyway. It's not really a string you get back.

Sorry, that's because I used xenver_varbuf_op() as a reference.
Fixed in v2.

>
> > @@ -1024,15 +1046,12 @@ void __init console_init_preirq(void)
> > nrspin_lock(&console_lock);
> > __putstr(xen_banner());
> > nrspin_unlock(&console_lock);
> > - printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> > - xen_major_version(), xen_minor_version(), xen_extra_version(),
> > - xen_compile_by(), xen_compile_domain(), xen_compiler(),
> > - xen_build_info(), xen_compile_date());
> > - printk("Latest ChangeSet: %s\n", xen_changeset());
> >
> > /* Locate and print the buildid, if applicable. */
> > xen_build_init();
> >
> > + xen_print_version();
>
>
> It may seem minor, but I'm not happy about the reordering. What's logged
> would better really be directly after the banner. Any present or future
> output from xen_build_init() should come afterwards. Simply add
> xen_print_buildid() along with xen_print_version()? And then have it in
> version.c, where you can use build_id_{p,len} directly, eliminating the
> point above regarding casts and naming.

Thanks!
Addressed in v2.

>
> Jan

