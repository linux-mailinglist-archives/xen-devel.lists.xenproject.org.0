Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584AE220EA3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 16:04:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvhzv-0005Ya-2w; Wed, 15 Jul 2020 14:02:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEEU=A2=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jvhzt-0005YV-JF
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 14:02:57 +0000
X-Inumbo-ID: e1fbe842-c6a3-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1fbe842-c6a3-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 14:02:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so5962230wmo.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fFdxqI5g3k4kC0Cs/kmhn8G4+G4mXjZCQXUJFnALC6c=;
 b=lUXqaFYE4rAgO9L9Voumo+aDCDx/z1qFxobeSljmk4kiU5DdPj4MGyksmeF7Wbe9m1
 snuW7dzyEydLjfGt4SH+8zjfyAhJ0PbLJqiItIkLSL2mDfTz8WYsPogSnatxrAtn9FKg
 eIlF5fgR0sOoBqrKTFQJukyY+oIVawNXE95xKzJLjS7qYMDTqxLoQ88i4jF3g44m6rEH
 64yOy8W8cDnfIHTVu3CALVk681/fAPwBvnbf8E3BYIhAro1ABj7UxfKixc6J6Yw2Wa3g
 yVf7Ecse+DE92JxCy58E7JDzw4NLMvZrI+7SeM1qfWPpwqH3QRZm6Wf0rNJZQth4o9AC
 nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fFdxqI5g3k4kC0Cs/kmhn8G4+G4mXjZCQXUJFnALC6c=;
 b=BauJu2K3lvPgaR/HjPc9SaUqUreLW4EjuJdeBWMyZ7zGjAMhzEzcLzGeRevB/FCqc6
 njDqUdPkmnRAUnTINlM5UMJ+Bx1YjOmdRRXnqn5UJIHf64taWBtORGwJp7bThfUsYygn
 mDS6hHiqzMsO1GSvl+HpU+oTREHcuUV4USJ544uCHD8IhvT+WGZD1070l/3GLiTh95pU
 oUJ6/YVBzIrZ6ywbyd0XILK5rF3tb3rFZVM7Kv/jIaklRMMBeY7+27rfKlsXeDE9eoa+
 6ReE4tH/Gp2f/9EDWzfXBPQMdIkp/epf+2aWER+yN/aX8vyFh846NFGPf573L0PDaZfT
 /iFQ==
X-Gm-Message-State: AOAM532pGS3qGGIJZSN2tvCGJnPDGQcn3IcmEZMCOOMm9GIXZoRbR7W3
 6sHcBSed93azsecrxuEhQcsiNw9R0P/+TbtYKdo=
X-Google-Smtp-Source: ABdhPJxbv+JiGpWbOGxmA6Ap1a/KsDzNb4gmJbNp29ERmyMwMsJxF1Et28IEfkhAlqpptDK+wWBmHcyVgzPYfgAZY84=
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr8814981wmg.74.1594821775800; 
 Wed, 15 Jul 2020 07:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <e47a9ef5-5f4c-1ca6-1b31-f7b10516e5ed@suse.com>
 <CAJ=z9a1AWYYVGwHWOct9j3bVDhPtWG7R3tQY05+6BY-9g3C1kQ@mail.gmail.com>
 <005381d5-3fb5-640f-002c-106c628a77a2@suse.com>
In-Reply-To: <005381d5-3fb5-640f-002c-106c628a77a2@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 15 Jul 2020 16:02:43 +0200
Message-ID: <CAJ=z9a0LBhO7qJyF-WdBnkD52dXew-TgjTuUC7aeoS8rC13iwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] evtchn/fifo: don't enforce higher than necessary
 alignment
To: Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="0000000000006d3f0c05aa7b61d4"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000006d3f0c05aa7b61d4
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2020, 14:42 Jan Beulich, <jbeulich@suse.com> wrote:

> On 15.07.2020 12:46, Julien Grall wrote:
> > On Wed, 15 Jul 2020, 12:17 Jan Beulich, <jbeulich@suse.com> wrote:
> >
> >> Neither the code nor the original commit provide any justification for
> >> the need to 8-byte align the struct in all cases. Enforce just as much
> >> alignment as the structure actually needs - 4 bytes - by using alignof()
> >> instead of a literal number.
> >>
> >> Take the opportunity and also
> >> - add so far missing validation that native and compat mode layouts of
> >>   the structures actually match,
> >> - tie sizeof() expressions to the types of the fields we're actually
> >>   after, rather than specifying the type explicitly (which in the
> >>   general case risks a disconnect, even if there's close to zero risk in
> >>   this particular case),
> >> - use ENXIO instead of EINVAL for the two cases of the address not
> >>   satisfying the requirements, which will make an issue here better
> >>   stand out at the call site.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I question the need for the array_index_nospec() here. Or else I'd
> >> expect map_vcpu_info() would also need the same.
> >>
> >> --- a/xen/common/event_fifo.c
> >> +++ b/xen/common/event_fifo.c
> >> @@ -504,6 +504,16 @@ static void setup_ports(struct domain *d
> >>      }
> >>  }
> >>
> >> +#ifdef CONFIG_COMPAT
> >> +
> >> +#include <compat/event_channel.h>
> >> +
> >> +#define xen_evtchn_fifo_control_block evtchn_fifo_control_block
> >> +CHECK_evtchn_fifo_control_block;
> >> +#undef xen_evtchn_fifo_control_block
> >> +
> >> +#endif
> >> +
> >>  int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
> >>  {
> >>      struct domain *d = current->domain;
> >> @@ -523,19 +533,20 @@ int evtchn_fifo_init_control(struct evtc
> >>          return -ENOENT;
> >>
> >>      /* Must not cross page boundary. */
> >> -    if ( offset > (PAGE_SIZE - sizeof(evtchn_fifo_control_block_t)) )
> >> -        return -EINVAL;
> >> +    if ( offset > (PAGE_SIZE - sizeof(*v->evtchn_fifo->control_block))
> )
> >> +        return -ENXIO;
> >>
> >>      /*
> >>       * Make sure the guest controlled value offset is bounded even
> during
> >>       * speculative execution.
> >>       */
> >>      offset = array_index_nospec(offset,
> >> -                           PAGE_SIZE -
> >> sizeof(evtchn_fifo_control_block_t) + 1);
> >> +                                PAGE_SIZE -
> >> +                                sizeof(*v->evtchn_fifo->control_block)
> +
> >> 1);
> >>
> >> -    /* Must be 8-bytes aligned. */
> >> -    if ( offset & (8 - 1) )
> >> -        return -EINVAL;
> >> +    /* Must be suitably aligned. */
> >> +    if ( offset & (alignof(*v->evtchn_fifo->control_block) - 1) )
> >> +        return -ENXIO;
> >>
> >
> > A guest relying on this new alignment wouldn't work on older version of
> > Xen. So I don't think a guest would ever be able to use it.
> >
> > Therefore is it really worth the change?
>
> That's the question. One of your arguments for using a literal number
> also for the vCPU info mapping check was that here a literal number
> is used. The goal isn't so much relaxation of the interface, but
> making the code consistent as well as eliminating a (how I'd call it)
> kludge.
>

Your commit message lead to think the relaxation is the key motivation to
change the code.



> Guests not caring to be able to run on older versions could also make
> use of the relaxation (which may be more relevant in 10 y ears time
> than it is now).


That makes sense. However, I am a bit concerned that an OS developer may
not notice the alignment problem with older version.

I would suggest to at least document the alignment expected in the public
header.



> Jan
>

--0000000000006d3f0c05aa7b61d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 15 Jul 2020, 14:42 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com" rel=3D"noreferrer noreferrer" target=3D"_blank">=
jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 15.07.2020 12:46, Julien Grall wrote:<br>
&gt; On Wed, 15 Jul 2020, 12:17 Jan Beulich, &lt;<a href=3D"mailto:jbeulich=
@suse.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">jbeul=
ich@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Neither the code nor the original commit provide any justification=
 for<br>
&gt;&gt; the need to 8-byte align the struct in all cases. Enforce just as =
much<br>
&gt;&gt; alignment as the structure actually needs - 4 bytes - by using ali=
gnof()<br>
&gt;&gt; instead of a literal number.<br>
&gt;&gt;<br>
&gt;&gt; Take the opportunity and also<br>
&gt;&gt; - add so far missing validation that native and compat mode layout=
s of<br>
&gt;&gt;=C2=A0 =C2=A0the structures actually match,<br>
&gt;&gt; - tie sizeof() expressions to the types of the fields we&#39;re ac=
tually<br>
&gt;&gt;=C2=A0 =C2=A0after, rather than specifying the type explicitly (whi=
ch in the<br>
&gt;&gt;=C2=A0 =C2=A0general case risks a disconnect, even if there&#39;s c=
lose to zero risk in<br>
&gt;&gt;=C2=A0 =C2=A0this particular case),<br>
&gt;&gt; - use ENXIO instead of EINVAL for the two cases of the address not=
<br>
&gt;&gt;=C2=A0 =C2=A0satisfying the requirements, which will make an issue =
here better<br>
&gt;&gt;=C2=A0 =C2=A0stand out at the call site.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">jbeulich@suse.=
com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; I question the need for the array_index_nospec() here. Or else I&#=
39;d<br>
&gt;&gt; expect map_vcpu_info() would also need the same.<br>
&gt;&gt;<br>
&gt;&gt; --- a/xen/common/event_fifo.c<br>
&gt;&gt; +++ b/xen/common/event_fifo.c<br>
&gt;&gt; @@ -504,6 +504,16 @@ static void setup_ports(struct domain *d<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +#ifdef CONFIG_COMPAT<br>
&gt;&gt; +<br>
&gt;&gt; +#include &lt;compat/event_channel.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +#define xen_evtchn_fifo_control_block evtchn_fifo_control_block<b=
r>
&gt;&gt; +CHECK_evtchn_fifo_control_block;<br>
&gt;&gt; +#undef xen_evtchn_fifo_control_block<br>
&gt;&gt; +<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 int evtchn_fifo_init_control(struct evtchn_init_control *ini=
t_control)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct domain *d =3D current-&gt;domain;<br>
&gt;&gt; @@ -523,19 +533,20 @@ int evtchn_fifo_init_control(struct evtc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Must not cross page boundary. */<br>
&gt;&gt; -=C2=A0 =C2=A0 if ( offset &gt; (PAGE_SIZE - sizeof(evtchn_fifo_co=
ntrol_block_t)) )<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( offset &gt; (PAGE_SIZE - sizeof(*v-&gt;evtchn_=
fifo-&gt;control_block)) )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure the guest controlled value o=
ffset is bounded even during<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* speculative execution.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 offset =3D array_index_nospec(offset,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE -<br>
&gt;&gt; sizeof(evtchn_fifo_control_block_t) + 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE -<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*v-&gt;evtchn_fifo-=
&gt;control_block) +<br>
&gt;&gt; 1);<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 /* Must be 8-bytes aligned. */<br>
&gt;&gt; -=C2=A0 =C2=A0 if ( offset &amp; (8 - 1) )<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Must be suitably aligned. */<br>
&gt;&gt; +=C2=A0 =C2=A0 if ( offset &amp; (alignof(*v-&gt;evtchn_fifo-&gt;c=
ontrol_block) - 1) )<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
&gt;&gt;<br>
&gt; <br>
&gt; A guest relying on this new alignment wouldn&#39;t work on older versi=
on of<br>
&gt; Xen. So I don&#39;t think a guest would ever be able to use it.<br>
&gt; <br>
&gt; Therefore is it really worth the change?<br>
<br>
That&#39;s the question. One of your arguments for using a literal number<b=
r>
also for the vCPU info mapping check was that here a literal number<br>
is used. The goal isn&#39;t so much relaxation of the interface, but<br>
making the code consistent as well as eliminating a (how I&#39;d call it)<b=
r>
kludge.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Your commit message lead to think the relaxation is the key motivati=
on to change the code.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Guests not caring to be able to run on older versions could also make<br>
use of the relaxation (which may be more relevant in 10 y ears time<br>
than it is now).</blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">That makes sense. However, I am a bit concerned that an OS deve=
loper may not notice the alignment problem with older version.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I would suggest to at least document=
 the alignment expected in the public header.</div><div dir=3D"auto"></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Jan<br>
</blockquote></div></div></div>

--0000000000006d3f0c05aa7b61d4--

