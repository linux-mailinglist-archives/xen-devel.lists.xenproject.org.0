Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02749699439
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 13:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496540.767334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdIA-0001wx-01; Thu, 16 Feb 2023 12:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496540.767334; Thu, 16 Feb 2023 12:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSdI9-0001uB-SP; Thu, 16 Feb 2023 12:23:13 +0000
Received: by outflank-mailman (input) for mailman id 496540;
 Thu, 16 Feb 2023 12:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAGp=6M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pSdI8-0001u3-PJ
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 12:23:12 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id acf0f5fd-adf4-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 13:23:11 +0100 (CET)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by
 acd012ecd2cd with SMTP id 63ee202cb561427b110a86d6 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 16 Feb 2023 12:23:08 GMT
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-52ee632329dso22164227b3.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 04:23:08 -0800 (PST)
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
X-Inumbo-ID: acf0f5fd-adf4-11ed-933c-83870f6b2ba8
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676550189; x=1676557389; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=JkPN7yyeI8i3SiX0ZEYMPz/TaBdo9LUgHo8oQhyfgz0=;
 b=aqAxCfDWYozfbD2e9Y+HI0yP8FRFzPqxA1WDHzeTa6fAZlVgDOn89nKcUkXPPTW3SDAGRFWVAHwt0bYQ7EGbeezPB8bdUobSdB8uG/pKHJCS+H8pgKwtt4UeomHptfwC3HGSNPPKquVi61oHj8BL901z8RSLdDYfdBeIwlTa30znJhucMgRLxoS98XlD+zgLhLHhF2LzItXF5KbhnxsKfkzST5229p8t1hAZe5V06m+c3LidiYARjbILyqWADZlcIbFSBFvBqboDIq0xLJdcJrZgyuxVMm/NPRRkrU0pI1EnrseaqketqL8aNH+XF4TZXLK3QtS5TIIusbL7Bi4FRA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKWfsD14qk+gtWlsuMecKDTobjd3EEAMb6g3pwZQzHYWvW/Sy6LO
	jN7fyL9Q9ukT1JLlWoPy+aDEA+oQwz5u6UoZ+hU=
X-Google-Smtp-Source: AK7set/w0U1+3FzacuxJcSoZlJAgm3ntM/UR6VDvV1lWGeFbnXsWv5zMqTn3tNnrrOgbVJjZqbK3sXRzzujSK2IezpE=
X-Received: by 2002:a81:4f0b:0:b0:509:bd6:4d4b with SMTP id
 d11-20020a814f0b000000b005090bd64d4bmr547388ywb.282.1676550188368; Thu, 16
 Feb 2023 04:23:08 -0800 (PST)
MIME-Version: 1.0
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com> <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
 <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com>
In-Reply-To: <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Feb 2023 07:22:31 -0500
X-Gmail-Original-Message-ID: <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
Message-ID: <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006d0a0905f4d04210"

--0000000000006d0a0905f4d04210
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.02.2023 17:29, Tamas K Lengyel wrote:
> > On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> Did you consider the alternative of adjusting the ASSERT() in question
> >> instead? It could reasonably become
> >>
> >> #ifdef CONFIG_MEM_SHARING
> >>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
> > !atomic_read(&d->shr_pages));
> >> #endif
> >>
> >> now, I think. That would be less intrusive a change (helpful for
> >> backporting), but there may be other (so far unnamed) benefits of
pulling
> >> ahead the shared memory teardown.
> >
> > I have a hard time understanding this proposed ASSERT.
>
> It accounts for the various ways p2m_teardown() can (now) be called,
> limiting the actual check for no remaining shared pages to the last
> of all these invocations (on the host p2m with remove_root=true).
>
> Maybe
>
>     /* Limit the check to the final invocation. */
>     if ( p2m_is_hostp2m(p2m) && remove_root )
>         ASSERT(!atomic_read(&d->shr_pages));
>
> would make this easier to follow? Another option might be to move
> the assertion to paging_final_teardown(), ahead of that specific call
> to p2m_teardown().

AFAICT d->shr_pages would still be more then 0 when this is called before
sharing is torn down so the rearrangement is necessary even if we do this
assert only on the final invocation. I did a printk in place of this assert
without the rearrangement and afaict it was always != 0.

Tamas

--0000000000006d0a0905f4d04210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 15.02.2023 17:29, Tamas K Lengyel wrote:<br>&gt; &gt; On Wed, F=
eb 15, 2023 at 5:27 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com"=
>jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt; Did you consider the alt=
ernative of adjusting the ASSERT() in question<br>&gt; &gt;&gt; instead? It=
 could reasonably become<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; #ifdef CONFIG_ME=
M_SHARING<br>&gt; &gt;&gt; =C2=A0 =C2=A0 ASSERT(!p2m_is_hostp2m(p2m) || !re=
move_root ||<br>&gt; &gt; !atomic_read(&amp;d-&gt;shr_pages));<br>&gt; &gt;=
&gt; #endif<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; now, I think. That would be l=
ess intrusive a change (helpful for<br>&gt; &gt;&gt; backporting), but ther=
e may be other (so far unnamed) benefits of pulling<br>&gt; &gt;&gt; ahead =
the shared memory teardown.<br>&gt; &gt;<br>&gt; &gt; I have a hard time un=
derstanding this proposed ASSERT.<br>&gt;<br>&gt; It accounts for the vario=
us ways p2m_teardown() can (now) be called,<br>&gt; limiting the actual che=
ck for no remaining shared pages to the last<br>&gt; of all these invocatio=
ns (on the host p2m with remove_root=3Dtrue).<br>&gt;<br>&gt; Maybe<br>&gt;=
<br>&gt; =C2=A0 =C2=A0 /* Limit the check to the final invocation. */<br>&g=
t; =C2=A0 =C2=A0 if ( p2m_is_hostp2m(p2m) &amp;&amp; remove_root )<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(!atomic_read(&amp;d-&gt;shr_pages));<br>=
&gt;<br>&gt; would make this easier to follow? Another option might be to m=
ove<br>&gt; the assertion to paging_final_teardown(), ahead of that specifi=
c call<br>&gt; to p2m_teardown().<br><div><br></div><div>AFAICT d-&gt;shr_p=
ages would still be more then 0 when this is called before sharing is torn =
down so the rearrangement is necessary even if we do this assert only on th=
e final invocation. I did a printk in place of this assert without the rear=
rangement and afaict it was always !=3D 0. <br></div><div><br></div><div>Ta=
mas<br></div></div>

--0000000000006d0a0905f4d04210--

