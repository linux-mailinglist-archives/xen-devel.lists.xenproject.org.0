Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B03220A67
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:47:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvewH-0002Th-BQ; Wed, 15 Jul 2020 10:47:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEEU=A2=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jvewF-0002Tc-FB
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:46:59 +0000
X-Inumbo-ID: 818fe4ba-c688-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 818fe4ba-c688-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 10:46:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a6so2091154wrm.4
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2020 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8JVmAnFYLZBWhHKTRFwTsF7Zq5AURrqOGdvr7wu65vE=;
 b=A10uFI79EE+EDA4GobzYM2NQlMjG2gGA7DqoZZZ8bsDTGsqeuuee0cUBhNmISjRPWZ
 btfigjttIz5aJ5jM2H0weO5F1ZmoMFUoqZTra+FFLC2anUBX3TWqkFiBf2aqu+WsxgqX
 rU2DTdHOhmYn2zK1SdrDLWVXI0NqpmXXkTlmhqKxfQ9gp7vJNfIjLKEKIshBCWX/8GN6
 U1hJCK+byhWxpblxwkW7dsu7VjPPv5XB/ojdomTtOy2gfmimiT0VIAciGW7lf4S24Z3U
 hJoo6znuteS/jn1XqTztnxZqWsXkgb0JTkQ46CMnXtKR1/EIDcPiSDUi8VZkeVNTEFVP
 9Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8JVmAnFYLZBWhHKTRFwTsF7Zq5AURrqOGdvr7wu65vE=;
 b=NaJvRSCGSzBV7WozkRq6mNw0tFhfmPtBOqRH4b3txZKrWLeo5eSrDpo8qJsUTYs2fg
 Y+QfFddTyzoIelsdGqusKTp0rk+haroFkU1CIjFyK8d+Fix4YiujAXlTS3sqtI6xIDCQ
 jIFox1USa7HrF/tpXDs9Q2yN0GqA5CFVYmJYcikhLMrR/oJIbZqKfmH/3b1lITN8d0Be
 gY3+eTMzZDSvBgUi7+B/5KoFOH4IhhNSK1p/HACECDZ5giW6lvcfN2E+0Jq/78wT8OW4
 mm/p6IxMYY/UBxYHzGX49y+jDh4uWS+e5c+e1JLiVPmpYUVcR3Cugj+bbXy9bpBDGYQo
 1LHg==
X-Gm-Message-State: AOAM532yrUGmJGi9sprMwJ7x/yvwFdnyG+bC9nXL/v5HHWqooKx3tDJj
 zSXcunvv5WM6GUwNkoXe0fRq6LX0e+cQuUS8dSA=
X-Google-Smtp-Source: ABdhPJxA1dqLdZU5PkabR+qwX90PSPzTbNQLCt47AeXPzQPFOEErRXn0boqOR9FXaxXC5ScHqtZgrmOixKMKEmKQ/Cc=
X-Received: by 2002:adf:e850:: with SMTP id d16mr10999443wrn.426.1594810017559; 
 Wed, 15 Jul 2020 03:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <e47a9ef5-5f4c-1ca6-1b31-f7b10516e5ed@suse.com>
In-Reply-To: <e47a9ef5-5f4c-1ca6-1b31-f7b10516e5ed@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 15 Jul 2020 12:46:45 +0200
Message-ID: <CAJ=z9a1AWYYVGwHWOct9j3bVDhPtWG7R3tQY05+6BY-9g3C1kQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] evtchn/fifo: don't enforce higher than necessary
 alignment
To: Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/alternative; boundary="00000000000094b88c05aa78a428"
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

--00000000000094b88c05aa78a428
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2020, 12:17 Jan Beulich, <jbeulich@suse.com> wrote:

> Neither the code nor the original commit provide any justification for
> the need to 8-byte align the struct in all cases. Enforce just as much
> alignment as the structure actually needs - 4 bytes - by using alignof()
> instead of a literal number.
>
> Take the opportunity and also
> - add so far missing validation that native and compat mode layouts of
>   the structures actually match,
> - tie sizeof() expressions to the types of the fields we're actually
>   after, rather than specifying the type explicitly (which in the
>   general case risks a disconnect, even if there's close to zero risk in
>   this particular case),
> - use ENXIO instead of EINVAL for the two cases of the address not
>   satisfying the requirements, which will make an issue here better
>   stand out at the call site.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I question the need for the array_index_nospec() here. Or else I'd
> expect map_vcpu_info() would also need the same.
>
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -504,6 +504,16 @@ static void setup_ports(struct domain *d
>      }
>  }
>
> +#ifdef CONFIG_COMPAT
> +
> +#include <compat/event_channel.h>
> +
> +#define xen_evtchn_fifo_control_block evtchn_fifo_control_block
> +CHECK_evtchn_fifo_control_block;
> +#undef xen_evtchn_fifo_control_block
> +
> +#endif
> +
>  int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
>  {
>      struct domain *d = current->domain;
> @@ -523,19 +533,20 @@ int evtchn_fifo_init_control(struct evtc
>          return -ENOENT;
>
>      /* Must not cross page boundary. */
> -    if ( offset > (PAGE_SIZE - sizeof(evtchn_fifo_control_block_t)) )
> -        return -EINVAL;
> +    if ( offset > (PAGE_SIZE - sizeof(*v->evtchn_fifo->control_block)) )
> +        return -ENXIO;
>
>      /*
>       * Make sure the guest controlled value offset is bounded even during
>       * speculative execution.
>       */
>      offset = array_index_nospec(offset,
> -                           PAGE_SIZE -
> sizeof(evtchn_fifo_control_block_t) + 1);
> +                                PAGE_SIZE -
> +                                sizeof(*v->evtchn_fifo->control_block) +
> 1);
>
> -    /* Must be 8-bytes aligned. */
> -    if ( offset & (8 - 1) )
> -        return -EINVAL;
> +    /* Must be suitably aligned. */
> +    if ( offset & (alignof(*v->evtchn_fifo->control_block) - 1) )
> +        return -ENXIO;
>

A guest relying on this new alignment wouldn't work on older version of
Xen. So I don't think a guest would ever be able to use it.

Therefore is it really worth the change?



>      spin_lock(&d->event_lock);
>
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -46,6 +46,7 @@
>  ?      evtchn_bind_vcpu                event_channel.h
>  ?      evtchn_bind_virq                event_channel.h
>  ?      evtchn_close                    event_channel.h
> +?      evtchn_fifo_control_block       event_channel.h
>  ?      evtchn_op                       event_channel.h
>  ?      evtchn_send                     event_channel.h
>  ?      evtchn_status                   event_channel.h
>
>

--00000000000094b88c05aa78a428
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 15 Jul 2020, 12:17 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Neither the code nor the original commit provide a=
ny justification for<br>
the need to 8-byte align the struct in all cases. Enforce just as much<br>
alignment as the structure actually needs - 4 bytes - by using alignof()<br=
>
instead of a literal number.<br>
<br>
Take the opportunity and also<br>
- add so far missing validation that native and compat mode layouts of<br>
=C2=A0 the structures actually match,<br>
- tie sizeof() expressions to the types of the fields we&#39;re actually<br=
>
=C2=A0 after, rather than specifying the type explicitly (which in the<br>
=C2=A0 general case risks a disconnect, even if there&#39;s close to zero r=
isk in<br>
=C2=A0 this particular case),<br>
- use ENXIO instead of EINVAL for the two cases of the address not<br>
=C2=A0 satisfying the requirements, which will make an issue here better<br=
>
=C2=A0 stand out at the call site.<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
---<br>
I question the need for the array_index_nospec() here. Or else I&#39;d<br>
expect map_vcpu_info() would also need the same.<br>
<br>
--- a/xen/common/event_fifo.c<br>
+++ b/xen/common/event_fifo.c<br>
@@ -504,6 +504,16 @@ static void setup_ports(struct domain *d<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+#ifdef CONFIG_COMPAT<br>
+<br>
+#include &lt;compat/event_channel.h&gt;<br>
+<br>
+#define xen_evtchn_fifo_control_block evtchn_fifo_control_block<br>
+CHECK_evtchn_fifo_control_block;<br>
+#undef xen_evtchn_fifo_control_block<br>
+<br>
+#endif<br>
+<br>
=C2=A0int evtchn_fifo_init_control(struct evtchn_init_control *init_control=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d =3D current-&gt;domain;<br>
@@ -523,19 +533,20 @@ int evtchn_fifo_init_control(struct evtc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Must not cross page boundary. */<br>
-=C2=A0 =C2=A0 if ( offset &gt; (PAGE_SIZE - sizeof(evtchn_fifo_control_blo=
ck_t)) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 if ( offset &gt; (PAGE_SIZE - sizeof(*v-&gt;evtchn_fifo-&gt;=
control_block)) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Make sure the guest controlled value offset is bound=
ed even during<br>
=C2=A0 =C2=A0 =C2=A0 * speculative execution.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0offset =3D array_index_nospec(offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE - sizeof(evtchn_fifo_control_block_t) + 1=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE -<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*v-&gt;evtchn_fifo-&gt;contro=
l_block) + 1);<br>
<br>
-=C2=A0 =C2=A0 /* Must be 8-bytes aligned. */<br>
-=C2=A0 =C2=A0 if ( offset &amp; (8 - 1) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 /* Must be suitably aligned. */<br>
+=C2=A0 =C2=A0 if ( offset &amp; (alignof(*v-&gt;evtchn_fifo-&gt;control_bl=
ock) - 1) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">A guest relying on this new alig=
nment wouldn&#39;t work on older version of Xen. So I don&#39;t think a gue=
st would ever be able to use it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Therefore is it really worth the change?</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;d-&gt;event_lock);<br>
<br>
--- a/xen/include/xlat.lst<br>
+++ b/xen/include/xlat.lst<br>
@@ -46,6 +46,7 @@<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_bind_vcpu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 event_channel.h<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_bind_virq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 event_channel.h<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_close=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_channel.h<br>
+?=C2=A0 =C2=A0 =C2=A0 evtchn_fifo_control_block=C2=A0 =C2=A0 =C2=A0 =C2=A0=
event_channel.h<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_op=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_channel.h<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_send=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_channel.h<br>
=C2=A0?=C2=A0 =C2=A0 =C2=A0 evtchn_status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_channel.h<br>
<br>
</blockquote></div></div></div>

--00000000000094b88c05aa78a428--

