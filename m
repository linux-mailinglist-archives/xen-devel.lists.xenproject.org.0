Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6C54EC565
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296321.504358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYEr-0002dk-Od; Wed, 30 Mar 2022 13:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296321.504358; Wed, 30 Mar 2022 13:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYEr-0002bR-KJ; Wed, 30 Mar 2022 13:19:53 +0000
Received: by outflank-mailman (input) for mailman id 296321;
 Wed, 30 Mar 2022 13:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x//1=UJ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nZYEq-0002bA-6o
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:19:52 +0000
Received: from MTA-10-3.privateemail.com (mta-10-3.privateemail.com
 [198.54.127.62]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 137f9892-b02c-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 15:19:50 +0200 (CEST)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id C6F8818000AB
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 09:19:48 -0400 (EDT)
Received: from mail-ot1-f42.google.com (unknown [10.20.151.184])
 by mta-10.privateemail.com (Postfix) with ESMTPA id A0BDD18000A2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 09:19:48 -0400 (EDT)
Received: by mail-ot1-f42.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso14879720otf.12
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 06:19:48 -0700 (PDT)
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
X-Inumbo-ID: 137f9892-b02c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648646388;
	bh=KyUcjj5s5AMJWBEW/NACnpr0AVSd/qf/iSiPQnkUb3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bR2veZsjV4eiiRlvFrROYyyKoHmm2T57xQZ9Lce43ZOilzedw24yRHo+J4qCGVIeq
	 E7I43OWtw2qgs6NW1+9RSdkTItCsiMk4i1OZ9tPc9fqmRrfyisak992LSvpeae3QTy
	 LSdLj0Wl5qD43CqtA6x+4CeS8jxzCIuHc5jtzcGmegan9lPBytIMyAUiQ0JMb4H7RU
	 m+vbiQ2tYVG7SYFOUZRoEQ3DqUW5xSeC7xaj4+EG1iJeLilQa+flC3kll75Z2eryth
	 mIJJxPsO3Xup39PLBnepw500nuXX60av9ootx+TcFgbjW07ZkTZLnOtU62IhNXW6+O
	 EccgMsi0aoiNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648646388;
	bh=KyUcjj5s5AMJWBEW/NACnpr0AVSd/qf/iSiPQnkUb3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bR2veZsjV4eiiRlvFrROYyyKoHmm2T57xQZ9Lce43ZOilzedw24yRHo+J4qCGVIeq
	 E7I43OWtw2qgs6NW1+9RSdkTItCsiMk4i1OZ9tPc9fqmRrfyisak992LSvpeae3QTy
	 LSdLj0Wl5qD43CqtA6x+4CeS8jxzCIuHc5jtzcGmegan9lPBytIMyAUiQ0JMb4H7RU
	 m+vbiQ2tYVG7SYFOUZRoEQ3DqUW5xSeC7xaj4+EG1iJeLilQa+flC3kll75Z2eryth
	 mIJJxPsO3Xup39PLBnepw500nuXX60av9ootx+TcFgbjW07ZkTZLnOtU62IhNXW6+O
	 EccgMsi0aoiNQ==
X-Gm-Message-State: AOAM532cIGrO6xExO4PNlftFp1mgfX3m9CWMkLa33yGmOOFx413ndKDp
	LKS/mBZXxj6G5UAmF09HdYHFQcXpSdJ/YLrrulc=
X-Google-Smtp-Source: ABdhPJyFBzYJem6HZml9Sf9wKk8QbAQPaeDwJMB39sR/SV+ykCz/kF3SW0R0dmUwLwVEjNO+FCxJKGAAQ4vlw9rfjIw=
X-Received: by 2002:a05:6830:2b25:b0:5ce:bc2:f6ce with SMTP id
 l37-20020a0568302b2500b005ce0bc2f6cemr466652otv.157.1648646387784; Wed, 30
 Mar 2022 06:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <3ebadf898bf9e165d657a31c0aa98bbd300ffcb2.1648561546.git.tamas.lengyel@intel.com>
 <bdfbfe3e-66c5-3f99-8f50-16f38bfa78d1@suse.com>
In-Reply-To: <bdfbfe3e-66c5-3f99-8f50-16f38bfa78d1@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 30 Mar 2022 09:19:36 -0400
X-Gmail-Original-Message-ID: <CABfawhmxeK0RhXPzg9aqE8iytyNr72jekJ_FN9qWE1b32gxTkg@mail.gmail.com>
Message-ID: <CABfawhmxeK0RhXPzg9aqE8iytyNr72jekJ_FN9qWE1b32gxTkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/mem_sharing: make fork_reset more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000004ddfa905db6f66d9"
X-Virus-Scanned: ClamAV using ClamSMTP

--0000000000004ddfa905db6f66d9
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022, 6:31 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 29.03.2022 16:03, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/include/asm/mem_sharing.h
> > +++ b/xen/arch/x86/include/asm/mem_sharing.h
> > @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct
> domain *d)
> >  int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
> >                            bool unsharing);
> >
> > +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> > +                           bool reset_memory);
>
> Please avoid passing multiple booleans, even more so when you already
> derive them from a single "flags" value. This would likely be easiest
> if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for
> XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to
> prove they're the same.
>

I don't see why that would be an improvement in any way. I also don't want
to make VM_EVENT flags tied to the XENMEM ones as they are separate
interfaces. I rather just drop the changes to the XENMEM interface then do
that.


> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1890,15 +1890,24 @@ static int fork(struct domain *cd, struct domain
> *d, uint16_t flags)
> >   * footprints the hypercall continuation should be implemented (or if
> this
> >   * feature needs to be become "stable").
> >   */
> > -static int mem_sharing_fork_reset(struct domain *d)
> > +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> > +                           bool reset_memory)
> >  {
> > -    int rc;
> > +    int rc = 0;
> >      struct domain *pd = d->parent;
> >      struct p2m_domain *p2m = p2m_get_hostp2m(d);
> >      struct page_info *page, *tmp;
> >
> > +    ASSERT(reset_state || reset_memory);
> > +
> > +    if ( !d->arch.hvm.mem_sharing.fork_complete )
> > +        return -ENOSYS;
>
> Either EOPNOTSUPP (in case you think this operation could make sense
> to implement for incomplete forks) or e.g. EINVAL, but please not
> ENOSYS.
>
> > @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct
> vm_event_domain *ved)
> >              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
> >                  p2m_mem_paging_resume(d, &rsp);
> >  #endif
> > +#ifdef CONFIG_MEM_SHARING
> > +            if ( mem_sharing_is_fork(d) )
> > +            {
> > +                bool reset_state = rsp.flags &
> VM_EVENT_FLAG_RESET_FORK_STATE;
> > +                bool reset_mem = rsp.flags &
> VM_EVENT_FLAG_RESET_FORK_MEMORY;
> > +
> > +                if ( reset_state || reset_mem )
> > +                    ASSERT(!mem_sharing_fork_reset(d, reset_state,
> reset_mem));
> > +            }
> > +#endif
>
> Should the two flags be rejected in the "else" case, rather than
> being silently ignored?
>

What do you mean by rejected? There is no feasible "rejection" that could
be done in this path other then skipping it.


> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> >                  uint32_t gref;     /* IN: gref to debug         */
> >              } u;
> >          } debug;
> > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
>
> I consider the notation in the comment misleading - I would read it to
> mean OP_FORK and OP_RESET, supported by the earlier
> OP_SHARE/ADD_PHYSMAP. Commonly we write OP_FORK{,_RESET} in such cases.


Ack.

Tamas

>

--0000000000004ddfa905db6f66d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 30, 2022, 6:31 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 29.03.2022 16:03, Tamas K Lengyel wrote:<br>
&gt; --- a/xen/arch/x86/include/asm/mem_sharing.h<br>
&gt; +++ b/xen/arch/x86/include/asm/mem_sharing.h<br>
&gt; @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct =
domain *d)<br>
&gt;=C2=A0 int mem_sharing_fork_page(struct domain *d, gfn_t gfn,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool unsharing);<br>
&gt;=C2=A0 <br>
&gt; +int mem_sharing_fork_reset(struct domain *d, bool reset_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool reset_memory);<br>
<br>
Please avoid passing multiple booleans, even more so when you already<br>
derive them from a single &quot;flags&quot; value. This would likely be eas=
iest<br>
if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for<br>
XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to<br>
prove they&#39;re the same.<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">I don&#39;t see why that would be an improvement=
 in any way. I also don&#39;t want to make VM_EVENT flags tied to the XENME=
M ones as they are separate interfaces. I rather just drop the changes to t=
he XENMEM interface then do that.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; --- a/xen/arch/x86/mm/mem_sharing.c<br>
&gt; +++ b/xen/arch/x86/mm/mem_sharing.c<br>
&gt; @@ -1890,15 +1890,24 @@ static int fork(struct domain *cd, struct doma=
in *d, uint16_t flags)<br>
&gt;=C2=A0 =C2=A0* footprints the hypercall continuation should be implemen=
ted (or if this<br>
&gt;=C2=A0 =C2=A0* feature needs to be become &quot;stable&quot;).<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -static int mem_sharing_fork_reset(struct domain *d)<br>
&gt; +int mem_sharing_fork_reset(struct domain *d, bool reset_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool reset_memory)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 int rc;<br>
&gt; +=C2=A0 =C2=A0 int rc =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct domain *pd =3D d-&gt;parent;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct p2m_domain *p2m =3D p2m_get_hostp2m(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct page_info *page, *tmp;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 ASSERT(reset_state || reset_memory);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !d-&gt;arch.hvm.mem_sharing.fork_complete )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
<br>
Either EOPNOTSUPP (in case you think this operation could make sense<br>
to implement for incomplete forks) or e.g. EINVAL, but please not<br>
ENOSYS.<br>
<br>
&gt; @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, stru=
ct vm_event_domain *ved)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rsp.reason =3D=3D=
 VM_EVENT_REASON_MEM_PAGING )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_mem_=
paging_resume(d, &amp;rsp);<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_MEM_SHARING<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( mem_sharing_is_fork(d)=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool reset_st=
ate =3D rsp.flags &amp; VM_EVENT_FLAG_RESET_FORK_STATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool reset_me=
m =3D rsp.flags &amp; VM_EVENT_FLAG_RESET_FORK_MEMORY;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( reset_st=
ate || reset_mem )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
Should the two flags be rejected in the &quot;else&quot; case, rather than<=
br>
being silently ignored?<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">What do you mean by rejected? There is no feasible &=
quot;rejection&quot; that could be done in this path other then skipping it=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
&gt; --- a/xen/include/public/memory.h<br>
&gt; +++ b/xen/include/public/memory.h<br>
&gt; @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 gref;=C2=A0 =C2=A0 =C2=A0/* IN: gref to debug=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } u;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } debug;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mem_sharing_op_fork {=C2=A0 =C2=A0=
 =C2=A0 /* OP_FORK */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mem_sharing_op_fork {=C2=A0 =C2=A0=
 =C2=A0 /* OP_FORK/_RESET */<br>
<br>
I consider the notation in the comment misleading - I would read it to<br>
mean OP_FORK and OP_RESET, supported by the earlier<br>
OP_SHARE/ADD_PHYSMAP. Commonly we write OP_FORK{,_RESET} in such cases.</bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ack.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Tamas</div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000004ddfa905db6f66d9--

