Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F312F691F3E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 13:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493401.763351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQSlr-0003YE-SO; Fri, 10 Feb 2023 12:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493401.763351; Fri, 10 Feb 2023 12:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQSlr-0003Vw-PV; Fri, 10 Feb 2023 12:44:55 +0000
Received: by outflank-mailman (input) for mailman id 493401;
 Fri, 10 Feb 2023 12:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQSlq-0003Vh-9S
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 12:44:54 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3056868-a940-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 13:44:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 462F62015B;
 Fri, 10 Feb 2023 13:44:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h12om-dWo-29; Fri, 10 Feb 2023 13:44:46 +0100 (CET)
Received: from begin (p-gweduroam01.u-bordeaux.fr [147.210.179.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EB59120158;
 Fri, 10 Feb 2023 13:44:45 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQSlg-005qZZ-0w;
 Fri, 10 Feb 2023 13:44:44 +0100
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
X-Inumbo-ID: b3056868-a940-11ed-93b5-47a8fe42b414
Date: Fri, 10 Feb 2023 13:44:44 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
Message-ID: <20230210124444.bc7siuuj5dwgf3pb@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-4-jgross@suse.com>
 <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
 <8c007a9a-1466-f200-d7f6-27c81622ef27@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c007a9a-1466-f200-d7f6-27c81622ef27@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 13:14:20 +0100, a ecrit:
> On 10.02.23 12:43, Andrew Cooper wrote:
> > On 10/02/2023 10:46 am, Juergen Gross wrote:
> > > diff --git a/lib/sys.c b/lib/sys.c
> > > index 2f33c937..dc8a8c69 100644
> > > --- a/lib/sys.c
> > > +++ b/lib/sys.c
> > > @@ -339,7 +339,14 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
> > >       return fd;
> > >   }
> > > -static struct mount_point mount_points[] = {
> > > +#ifdef CONFIG_CONSFRONT
> > > +#define STATIC_MNTS   4
> > > +#else
> > > +#define STATIC_MNTS   2
> > > +#endif
> > 
> > This ought to be
> > 
> > #define STATIC_MNTS (2 + (IS_ENABLED(CONFIG_CONSFRONT) * 2))
> > 
> > because it shows where the parts come from, and is much cleaner to add a
> > 3rd one to in due course.
> 
> In principle fine, but I'm not sure it is worth the effort to add
> IS_ENABLED() support to Mini-OS.
> 
> > That said, it would be simpler to just have a total mounts set at 16 or
> > so?  Does a difference of two dynamic mounts depending on CONSFRONT
> > actually matter?
> 
> Probably not. Samuel, any thoughts on that?

We can probably as well just have 16 mount entries indeed.

Samuel

