Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A849AA9FA2B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971101.1359595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ukw-00034j-L2; Mon, 28 Apr 2025 20:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971101.1359595; Mon, 28 Apr 2025 20:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ukw-00032S-Hl; Mon, 28 Apr 2025 20:07:10 +0000
Received: by outflank-mailman (input) for mailman id 971101;
 Mon, 28 Apr 2025 20:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9Uku-00030n-AV
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:07:09 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba99be6-246c-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 22:07:06 +0200 (CEST)
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
X-Inumbo-ID: 5ba99be6-246c-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745870825; x=1746130025;
	bh=syyr0ZTMJnjDywzOybdBLaYWDsgPjabS8M3+vZFWaXc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WQxj9l3Ywlr/4M6mwVg//zV23ICRlv9bWSfZXyt/x5hE2Knf5k1IIKGDVc5s754Fu
	 BPvdkzPB8SnyslPIpmP/u0qzo6MmN8vnL9E2A+hbVwQtTU2+PMSzzSRZ6lurO7Xp6r
	 MeI1LH2MIbfybd8qTseGMygXeUdZKIWx+s+rUwYlpm85WtM/9E+PKJxx6JdYvatHlw
	 MtCzlwZ2MmBEtko252PkEeIa9pApHZT71awoHHBxwFWVnqOYhDXpAB45HDQD3WMr5n
	 AFxCPKD3Yph5aeTzUDTKxjGdjCGb5sZZ93A3kt26WU6oKYVUJ9zyeffSa+cB96gILZ
	 O6O6KmawH8z6w==
Date: Mon, 28 Apr 2025 20:06:59 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] xen/console: cleanup conring management
Message-ID: <aA/f3+QEBhVlIVPF@kraken>
In-Reply-To: <cacff70d-5269-451d-b264-4d02b299e677@suse.com>
References: <20250426185021.100646-1-dmukhin@ford.com> <20250426185021.100646-2-dmukhin@ford.com> <cacff70d-5269-451d-b264-4d02b299e677@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4ac16eb9bc11de67ba0ee100acc73861059c6ac0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 08:50:52AM +0200, Jan Beulich wrote:
> On 26.04.2025 20:50, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move console_locks_busted handling inside conring_puts() to remove
> > tasklet code duplication.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes v1->v2:
> > - added Stefano's R-b
> > ---
> >  xen/drivers/char/console.c | 29 ++++++++++++++---------------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index c3150fbdb7..aaa97088aa 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -325,6 +325,17 @@ static void cf_check do_dec_thresh(unsigned char k=
ey, bool unused)
> >   * ********************************************************
> >   */
> >
> > +static void cf_check notify_dom0_con_ring(void *unused)
> > +{
> > +    send_global_virq(VIRQ_CON_RING);
> > +}
> > +
> > +static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
> > +                               notify_dom0_con_ring,
> > +                               NULL);
> > +
> > +static bool console_locks_busted;
> > +
> >  static void conring_puts(const char *str, size_t len)
> >  {
> >      ASSERT(rspin_is_locked(&console_lock));
> > @@ -334,6 +345,9 @@ static void conring_puts(const char *str, size_t le=
n)
> >
> >      if ( conringp - conringc > conring_size )
> >          conringc =3D conringp - conring_size;
> > +
> > +    if ( !console_locks_busted )
> > +        tasklet_schedule(&notify_dom0_con_ring_tasklet);
> >  }
>=20
> As before I'm unconvinced it is a good idea to have tasklet scheduling he=
re.
> You also didn't address that v1 comment of mine verbally, iirc.

Sorry, I did not mean to ignore the v1 comment.
I am preparing another iteration, which, I think looks better.

>=20
> Jan


