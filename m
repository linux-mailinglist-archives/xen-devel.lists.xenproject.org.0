Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D74EC674
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 16:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296396.504492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZFH-0007EZ-AG; Wed, 30 Mar 2022 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296396.504492; Wed, 30 Mar 2022 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZZFH-0007CG-7G; Wed, 30 Mar 2022 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 296396;
 Wed, 30 Mar 2022 14:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x//1=UJ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nZZFF-0007C8-Qp
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 14:24:22 +0000
Received: from MTA-14-4.privateemail.com (mta-14-4.privateemail.com
 [198.54.118.206]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c38f10-b035-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 16:24:20 +0200 (CEST)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 06CA318000A4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 10:24:18 -0400 (EDT)
Received: from mail-oa1-f54.google.com (unknown [10.20.151.181])
 by mta-14.privateemail.com (Postfix) with ESMTPA id D574F18000A5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 10:24:17 -0400 (EDT)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-dacc470e03so22207390fac.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 07:24:17 -0700 (PDT)
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
X-Inumbo-ID: 15c38f10-b035-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648650258;
	bh=bNdhSLl/rMLoCuTDzNzWFZxT6NidsBqROXv4WuDE9JA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KVohziEoTwz7uTc2qA5unJWF4fTvIgpmx49+z00QZzSeaetxn/oxR6QiavCk55tF1
	 g1S1e+pJXF+s6yjU/iAvsu6HthHoMZWkGYCvIQKvOu2un1DdaOylF90BmGB3yza6QL
	 52gav/rf8D839fMo7QIaIHrwhYq3r5BS0PApMJTTAwkJ+zcHiscxQqRt3BfmHXfnW+
	 I63hQDWEdnjEIxpIxBHjNhy3hpCdaXK84lYwuyfTIQkgajOz9ndIAch2vtCkC6Ldc+
	 Ee6x9dBf3/atymRbScorSUZcHhuTJsfwut4xVgwg1tg1tGs+zpHYSJ17Q8RrLk/va1
	 FhJzOfZ7Fb6uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648650257;
	bh=bNdhSLl/rMLoCuTDzNzWFZxT6NidsBqROXv4WuDE9JA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i70PknU0XBO6jVUaS3iGtiEwj7hrokJRhKvSIsd3uTEoTTov4LQ6Wuu8cmBb0ju90
	 ePEHaO/gTf30YvdzGNlVZNSV/Aa/ZyFoyJ4BV0fDs56+rsr0fwTKz2W2qDXm7pDG8Y
	 PNo6Ba4mvV9FHxb68LjTv6weNf/O8AEijl0u6sqbUEw95NPkVx/ngq+f+4ptwydJ4y
	 DR46KwLn4qjKO+h8mHhrgXRU2sQ6HwnoH9gtpsVizlmssyn6paN12Cxcmssw6yahKp
	 U1/WueB0BMjw+vWVc6ijT7fGBAZbAcgv9D2V6Cedzefe+3Jsvk+v7ImHWS8KwBtcXd
	 T8tHaK8XLOAnw==
X-Gm-Message-State: AOAM530J43VlLXHHKDRqpSNfdTzSmFSgVlpKvBcDfA96okHPBEaSa9+p
	W7qfCstXKreJ/5q56T0+T2jrk1sjxB51+gSFO3k=
X-Google-Smtp-Source: ABdhPJwEUk7w2F82Tv6av+AzOvBISjGC28e7tQxZu0Vj47uTdoaT8K4W4pX4jnTX+/wnAbT8y4HV4Hl9nS3F1Uvziy4=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr2259246oap.9.1648650253236; Wed, 30 Mar
 2022 07:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <3ebadf898bf9e165d657a31c0aa98bbd300ffcb2.1648561546.git.tamas.lengyel@intel.com>
 <bdfbfe3e-66c5-3f99-8f50-16f38bfa78d1@suse.com> <CABfawhmxeK0RhXPzg9aqE8iytyNr72jekJ_FN9qWE1b32gxTkg@mail.gmail.com>
 <afabea4f-9497-726e-b5de-ee2df4391641@suse.com>
In-Reply-To: <afabea4f-9497-726e-b5de-ee2df4391641@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 30 Mar 2022 10:24:01 -0400
X-Gmail-Original-Message-ID: <CABfawhnxW9GQDRtVGYHcq1eMmExkHj9-OBEKifZkuKCKxw=KYg@mail.gmail.com>
Message-ID: <CABfawhnxW9GQDRtVGYHcq1eMmExkHj9-OBEKifZkuKCKxw=KYg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/mem_sharing: make fork_reset more configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000b4008405db704c23"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000b4008405db704c23
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022, 9:34 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 30.03.2022 15:19, Tamas K Lengyel wrote:
> > On Wed, Mar 30, 2022, 6:31 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 29.03.2022 16:03, Tamas K Lengyel wrote:
> >>> --- a/xen/arch/x86/include/asm/mem_sharing.h
> >>> +++ b/xen/arch/x86/include/asm/mem_sharing.h
> >>> @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct
> >> domain *d)
> >>>  int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
> >>>                            bool unsharing);
> >>>
> >>> +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> >>> +                           bool reset_memory);
> >>
> >> Please avoid passing multiple booleans, even more so when you already
> >> derive them from a single "flags" value. This would likely be easiest
> >> if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for
> >> XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to
> >> prove they're the same.
> >
> > I don't see why that would be an improvement in any way. I also don't
> want
> > to make VM_EVENT flags tied to the XENMEM ones as they are separate
> > interfaces. I rather just drop the changes to the XENMEM interface then
> do
> > that.
>
> If the function gained two or three more flags, how would that look to
> you? And how would you easily identify the correct order of all the
> booleans?
>

IMHO we can cross that bridge when and if that becomes necessary. Also not
sure what you mean by the order of the booleans - that's irrelevant since
the booleans are named?


> >>> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d,
> struct
> >> vm_event_domain *ved)
> >>>              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
> >>>                  p2m_mem_paging_resume(d, &rsp);
> >>>  #endif
> >>> +#ifdef CONFIG_MEM_SHARING
> >>> +            if ( mem_sharing_is_fork(d) )
> >>> +            {
> >>> +                bool reset_state = rsp.flags &
> >> VM_EVENT_FLAG_RESET_FORK_STATE;
> >>> +                bool reset_mem = rsp.flags &
> >> VM_EVENT_FLAG_RESET_FORK_MEMORY;
> >>> +
> >>> +                if ( reset_state || reset_mem )
> >>> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state,
> >> reset_mem));
> >>> +            }
> >>> +#endif
> >>
> >> Should the two flags be rejected in the "else" case, rather than
> >> being silently ignored?
> >
> > What do you mean by rejected? There is no feasible "rejection" that could
> > be done in this path other then skipping it.
>
> IOW no return value being handed back to the requester? The function
> does have an error return path, so I don't see why you couldn't return
> -EINVAL.
>

The way vm_event response flags are right now is "best effort". Error code
from this path never reaches the caller, which are usually callback
functions that return these flags. The best way for an error code to reach
the caller would be by making a separate vm_event on the ring and sending
that, but that's non-existent today and also hasn't been needed. It
certainly isn't needed here since there should be no feasable way for a
fork to fail a reset request (hence the assert).

Tamas

>

--000000000000b4008405db704c23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 30, 2022, 9:34 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 30.03.2022 15:19, Tamas K Lengyel wrote:<br>
&gt; On Wed, Mar 30, 2022, 6:31 AM Jan Beulich &lt;<a href=3D"mailto:jbeuli=
ch@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;=
 wrote:<br>
&gt;&gt; On 29.03.2022 16:03, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt; --- a/xen/arch/x86/include/asm/mem_sharing.h<br>
&gt;&gt;&gt; +++ b/xen/arch/x86/include/asm/mem_sharing.h<br>
&gt;&gt;&gt; @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const=
 struct<br>
&gt;&gt; domain *d)<br>
&gt;&gt;&gt;=C2=A0 int mem_sharing_fork_page(struct domain *d, gfn_t gfn,<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool unsharing);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +int mem_sharing_fork_reset(struct domain *d, bool reset_state=
,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool reset_memory);<br>
&gt;&gt;<br>
&gt;&gt; Please avoid passing multiple booleans, even more so when you alre=
ady<br>
&gt;&gt; derive them from a single &quot;flags&quot; value. This would like=
ly be easiest<br>
&gt;&gt; if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for<br>
&gt;&gt; XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to<=
br>
&gt;&gt; prove they&#39;re the same.<br>
&gt; <br>
&gt; I don&#39;t see why that would be an improvement in any way. I also do=
n&#39;t want<br>
&gt; to make VM_EVENT flags tied to the XENMEM ones as they are separate<br=
>
&gt; interfaces. I rather just drop the changes to the XENMEM interface the=
n do<br>
&gt; that.<br>
<br>
If the function gained two or three more flags, how would that look to<br>
you? And how would you easily identify the correct order of all the<br>
booleans?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">IMHO we can cross that bridge when and if that becomes necessary.=
 Also not sure what you mean by the order of the booleans - that&#39;s irre=
levant since the booleans are named?<br></div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt;&gt; @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain =
*d, struct<br>
&gt;&gt; vm_event_domain *ved)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( rsp.reaso=
n =3D=3D VM_EVENT_REASON_MEM_PAGING )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
p2m_mem_paging_resume(d, &amp;rsp);<br>
&gt;&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;&gt; +#ifdef CONFIG_MEM_SHARING<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( mem_sharing_is=
_fork(d) )<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool =
reset_state =3D rsp.flags &amp;<br>
&gt;&gt; VM_EVENT_FLAG_RESET_FORK_STATE;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool =
reset_mem =3D rsp.flags &amp;<br>
&gt;&gt; VM_EVENT_FLAG_RESET_FORK_MEMORY;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( =
reset_state || reset_mem )<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ASSERT(!mem_sharing_fork_reset(d, reset_state,<br>
&gt;&gt; reset_mem));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +#endif<br>
&gt;&gt;<br>
&gt;&gt; Should the two flags be rejected in the &quot;else&quot; case, rat=
her than<br>
&gt;&gt; being silently ignored?<br>
&gt; <br>
&gt; What do you mean by rejected? There is no feasible &quot;rejection&quo=
t; that could<br>
&gt; be done in this path other then skipping it.<br>
<br>
IOW no return value being handed back to the requester? The function<br>
does have an error return path, so I don&#39;t see why you couldn&#39;t ret=
urn<br>
-EINVAL.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">The way vm_event response flags are right now is &quot;best effor=
t&quot;. Error code from this path never reaches the caller, which are usua=
lly callback functions that return these flags. The best way for an error c=
ode to reach the caller would be by making a separate vm_event on the ring =
and sending that, but that&#39;s non-existent today and also hasn&#39;t bee=
n needed. It certainly isn&#39;t needed here since there should be no feasa=
ble way for a fork to fail a reset request (hence the assert).</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Tamas</div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b4008405db704c23--

