Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505C699877
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496620.767466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfum-0005Pi-3k; Thu, 16 Feb 2023 15:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496620.767466; Thu, 16 Feb 2023 15:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfum-0005O1-0e; Thu, 16 Feb 2023 15:11:16 +0000
Received: by outflank-mailman (input) for mailman id 496620;
 Thu, 16 Feb 2023 15:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAGp=6M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pSfuk-0005Ms-SJ
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:11:15 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 2561a5a4-ae0c-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:11:11 +0100 (CET)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) by
 1b35c470b1bf with SMTP id 63ee478db73c8700b7f308a0 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 16 Feb 2023 15:11:09 GMT
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-530b9a0a789so28350257b3.13
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 07:11:09 -0800 (PST)
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
X-Inumbo-ID: 2561a5a4-ae0c-11ed-93b5-47a8fe42b414
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676560269; x=1676567469; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=FKVuTGQ3B8oxZrxnnEeLotaCE3qjOVR1G5a49QRLZDA=;
 b=33GI9LoJsE/v4LQWhjLHQ5q5wAPtB5ovlGZgLQvVUSa4gmVfgKNu533h/c2+/PZMWBzmXrdPzrcSajBY9dlFShEqhgeW/1qVfB6+B+FAZDKk6E37u7TMdKErc2AQQERCXojaVUMUCg3i0vE7hizGLrw4tk/SgFipX1vg5aARfkKjana4NHdfj5sTUXOUnQFRH31S4hpkQEcVQrxvB8t+toy6C/EKRlLikE/jYm5pi2D6PZbGKnzVGa1TWM+KAGjKXi72CapCRb7VPo/oqyxo8HxvCbu/JOcX6imFYN1UULCk0cKy4bl3M1/u4092lWxNfDQqhbzX7gxBPkMDYkq6XA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKWTG21vIMiMOkAQXkPcuXw6uM+lcVmJodzHP7GqwzpAk5nn021N
	GbZRSOJoiyo0kQPH9VRMSqNj9gZv/N1HGLNuk1Q=
X-Google-Smtp-Source: AK7set/s2Q8m75pGnKyEEPG7DyZ9J+Oa+z5h32WY7TkB5KyVA9KENx6o59dAseVlIxvMu7m29HUaDBkwKczkjXv7BBo=
X-Received: by 2002:a0d:ea4c:0:b0:4fe:5d55:368 with SMTP id
 t73-20020a0dea4c000000b004fe5d550368mr773620ywe.407.1676560268723; Thu, 16
 Feb 2023 07:11:08 -0800 (PST)
MIME-Version: 1.0
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <e9e26bfe-3b17-bc35-9d93-ac291ab6b710@suse.com> <CABfawhmYjCmOjiLkvMB7DQz0eWVSm7vdy5HRCGxzNmg0nr13SQ@mail.gmail.com>
 <25bc4c74-f36e-2969-2b7c-c5acd115ebaf@suse.com> <CABfawh=y+K1GXOfKLJ6HbSxrVXPSd9GJWxpy4dusEWxh2PxeoQ@mail.gmail.com>
 <000badbf-cd94-76b6-1f60-faa720a5407f@suse.com>
In-Reply-To: <000badbf-cd94-76b6-1f60-faa720a5407f@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Feb 2023 10:10:31 -0500
X-Gmail-Original-Message-ID: <CABfawhkyomrcKDgcMTvpfyTQVYX9zEo4SUBC4m99RXX=ZcBE5g@mail.gmail.com>
Message-ID: <CABfawhkyomrcKDgcMTvpfyTQVYX9zEo4SUBC4m99RXX=ZcBE5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000430cb305f4d29b60"

--000000000000430cb305f4d29b60
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 9:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.02.2023 13:22, Tamas K Lengyel wrote:
> > On Thu, Feb 16, 2023 at 3:31 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.02.2023 17:29, Tamas K Lengyel wrote:
> >>> On Wed, Feb 15, 2023 at 5:27 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> Did you consider the alternative of adjusting the ASSERT() in
question
> >>>> instead? It could reasonably become
> >>>>
> >>>> #ifdef CONFIG_MEM_SHARING
> >>>>     ASSERT(!p2m_is_hostp2m(p2m) || !remove_root ||
> >>> !atomic_read(&d->shr_pages));
> >>>> #endif
> >>>>
> >>>> now, I think. That would be less intrusive a change (helpful for
> >>>> backporting), but there may be other (so far unnamed) benefits of
> > pulling
> >>>> ahead the shared memory teardown.
> >>>
> >>> I have a hard time understanding this proposed ASSERT.
> >>
> >> It accounts for the various ways p2m_teardown() can (now) be called,
> >> limiting the actual check for no remaining shared pages to the last
> >> of all these invocations (on the host p2m with remove_root=true).
> >>
> >> Maybe
> >>
> >>     /* Limit the check to the final invocation. */
> >>     if ( p2m_is_hostp2m(p2m) && remove_root )
> >>         ASSERT(!atomic_read(&d->shr_pages));
> >>
> >> would make this easier to follow? Another option might be to move
> >> the assertion to paging_final_teardown(), ahead of that specific call
> >> to p2m_teardown().
> >
> > AFAICT d->shr_pages would still be more then 0 when this is called
before
> > sharing is torn down so the rearrangement is necessary even if we do
this
> > assert only on the final invocation. I did a printk in place of this
assert
> > without the rearrangement and afaict it was always != 0.
>
> Was your printk() in an if() as above? paging_final_teardown() runs really
> late during cleanup (when we're about to free struct domain), so I would
> be somewhat concerned if by that time the count was still non-zero.

Just replaced the assert with a printk. Without calling relinquish shared
pages I don't find it odd that the count is non-zero, it only gets
decremented when you do call relinquish. Once the order is corrected it is
zero.

Tamas

--000000000000430cb305f4d29b60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 16, 2023 at 9:27 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 16.02.2023 13:22, Tamas K Lengyel wrote:<br>&gt; &gt; On Thu, F=
eb 16, 2023 at 3:31 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com"=
>jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On 15.0=
2.2023 17:29, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Wed, Feb 15, 2=
023 at 5:27 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulic=
h@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt; Did you consider the alt=
ernative of adjusting the ASSERT() in question<br>&gt; &gt;&gt;&gt;&gt; ins=
tead? It could reasonably become<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&=
gt;&gt; #ifdef CONFIG_MEM_SHARING<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0 AS=
SERT(!p2m_is_hostp2m(p2m) || !remove_root ||<br>&gt; &gt;&gt;&gt; !atomic_r=
ead(&amp;d-&gt;shr_pages));<br>&gt; &gt;&gt;&gt;&gt; #endif<br>&gt; &gt;&gt=
;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; now, I think. That would be less intrusi=
ve a change (helpful for<br>&gt; &gt;&gt;&gt;&gt; backporting), but there m=
ay be other (so far unnamed) benefits of<br>&gt; &gt; pulling<br>&gt; &gt;&=
gt;&gt;&gt; ahead the shared memory teardown.<br>&gt; &gt;&gt;&gt;<br>&gt; =
&gt;&gt;&gt; I have a hard time understanding this proposed ASSERT.<br>&gt;=
 &gt;&gt;<br>&gt; &gt;&gt; It accounts for the various ways p2m_teardown() =
can (now) be called,<br>&gt; &gt;&gt; limiting the actual check for no rema=
ining shared pages to the last<br>&gt; &gt;&gt; of all these invocations (o=
n the host p2m with remove_root=3Dtrue).<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; =
Maybe<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; =C2=A0 =C2=A0 /* Limit the check to=
 the final invocation. */<br>&gt; &gt;&gt; =C2=A0 =C2=A0 if ( p2m_is_hostp2=
m(p2m) &amp;&amp; remove_root )<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ASSERT(!atomic_read(&amp;d-&gt;shr_pages));<br>&gt; &gt;&gt;<br>&gt; &g=
t;&gt; would make this easier to follow? Another option might be to move<br=
>&gt; &gt;&gt; the assertion to paging_final_teardown(), ahead of that spec=
ific call<br>&gt; &gt;&gt; to p2m_teardown().<br>&gt; &gt;<br>&gt; &gt; AFA=
ICT d-&gt;shr_pages would still be more then 0 when this is called before<b=
r>&gt; &gt; sharing is torn down so the rearrangement is necessary even if =
we do this<br>&gt; &gt; assert only on the final invocation. I did a printk=
 in place of this assert<br>&gt; &gt; without the rearrangement and afaict =
it was always !=3D 0.<br>&gt;<br>&gt; Was your printk() in an if() as above=
? paging_final_teardown() runs really<br>&gt; late during cleanup (when we&=
#39;re about to free struct domain), so I would<br>&gt; be somewhat concern=
ed if by that time the count was still non-zero.<br><div><br></div><div>Jus=
t replaced the assert with a printk. Without calling relinquish shared page=
s I don&#39;t find it odd that the count is non-zero, it only gets decremen=
ted when you do call relinquish. Once the order is corrected it is zero.</d=
iv><div><br></div><div>Tamas<br></div></div>

--000000000000430cb305f4d29b60--

