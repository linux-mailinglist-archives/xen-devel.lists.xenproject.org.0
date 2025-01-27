Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756CA1DA91
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 17:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878080.1288255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRy8-0000nD-JT; Mon, 27 Jan 2025 16:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878080.1288255; Mon, 27 Jan 2025 16:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcRy8-0000lF-G5; Mon, 27 Jan 2025 16:28:12 +0000
Received: by outflank-mailman (input) for mailman id 878080;
 Mon, 27 Jan 2025 16:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zo7v=UT=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tcRy7-0000l9-Em
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 16:28:11 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b13e875b-dccb-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 17:28:08 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso3720263f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 08:28:08 -0800 (PST)
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
X-Inumbo-ID: b13e875b-dccb-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737995288; x=1738600088; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxvar//qrbUI6q4rPrdTNpFfIopLXSamQzfZIfBFkDw=;
        b=Y/afrIbK6dVUhTN6FsUSxA1Jy9l49d9fYzYMed4hBVOqc0GJPjNW1mx1+Kh7yVpm4s
         YynPXA/0xgOyUDZ4X6AkSG7LJ87rf35KSwiijyOnckZxjEu04y/zbBY7idpwbyOdDS+k
         jWrrovFokv4u2D07ObEX+bZmNCxbAu80Tx2LTF85UBV+VCcRoz5BPgHWEbtbDVDAggGJ
         gm7o4t5dk1+X1MBLpWL2m6OG7bt2lXyyeeCXIX4uvcZt3BXr73q15HhZt5PdAqw2Izqp
         aZPu/rFirBQ35ZzOfwQfSbBhWu/M51j7Jf12Dy0lpAQDOZw+LlXuOdgLnQhOmdM5GtYy
         cP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995288; x=1738600088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxvar//qrbUI6q4rPrdTNpFfIopLXSamQzfZIfBFkDw=;
        b=UAEOUxpEkIZzfpOkjjACfuhdA2WDMk6w5ELJsu1+KV8dYpJuANdPq690lH6c1ldUEU
         3DkSTVJicBf9EKZe7EU9swcIgTWV5zRMVThqcW5PFi2nBbIytxzRm774WdNmmRQ01NsG
         f2bKgEJxHcmRU7zy4dhI50qnVNXrBh4Rliz++5/ilG1jkR31rAI9uAIhrTXgtuf8cw0y
         gCvtai8a+XMgTK89M+UiQowkx0gA4w4zcElG2JU//GSYGuGvtDZ7v+gVGmes/CMWeGJh
         0eTmI9TJqr4wIu0o4I0A2sjo4IydA8LtJjf8VFCG1oFhYucsXE8bNVZrvbEeYwxjLJmq
         pZfA==
X-Gm-Message-State: AOJu0Yxrhou9hU7RhGtj0vw4xfsBbu+zEWTQqSzqg+K0tWWf7pbEOQnu
	ZoBdQA9eSTrDJiYvBph+d6hO6xi+7av6PwpUBSvv7uavz9ckvutcjGyhiNUgropdJ0v+/XPP/pJ
	e9mhjMWVYPY35boW7LGUwjMXyhUXwASGa
X-Gm-Gg: ASbGnctwnxpRkEPf8/gjuzfhKAM0aflhLJ9vr5uVB4xF1p1XAxApww1QIrm38lLXm7w
	eeNObFq5Zu3ixg3mMiy7h84yMCkgrmD7fWQdcH3lM95mJK/he0qA9PRUcbuOr
X-Google-Smtp-Source: AGHT+IHlQJg9IUyWq5KlgJoUKUSYcgPP3qFoPWnTLjzjGmj666QkddFqrq+b5uyqAp1y5X+kHw3kQZUlw5+VLsR/444=
X-Received: by 2002:a05:6000:1f85:b0:385:e374:be1 with SMTP id
 ffacd0b85a97d-38bf5662b18mr39288527f8f.13.1737995287266; Mon, 27 Jan 2025
 08:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20250127104556.175641-1-michal.orzel@amd.com> <20250127104556.175641-2-michal.orzel@amd.com>
 <CAJ=z9a24=PE-3bhmZvfTaTgpdCXp9iDTWfoH-9F9-_OdkEf4Tg@mail.gmail.com> <32d42df5-08d9-4670-a571-ef315897514b@amd.com>
In-Reply-To: <32d42df5-08d9-4670-a571-ef315897514b@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 27 Jan 2025 13:27:55 -0300
X-Gm-Features: AWEUYZmP-NHuOkusriDWnQSxy2T953O9I2IZglvnbEdNvhSG2GxYdtYS6Hb2j1o
Message-ID: <CAJ=z9a3gN0NyuvVQfEW2v9H9F5ZUhHB9+LvK4viQhSm6A=hauA@mail.gmail.com>
Subject: Re: [for-4.20][PATCH 1/2] device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	oleksii.kurochko@gmail.com
Content-Type: multipart/alternative; boundary="000000000000b80ee6062cb28f53"

--000000000000b80ee6062cb28f53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jan 2025 at 09:52, Michal Orzel <michal.orzel@amd.com> wrote:

>
>
> On 27/01/2025 12:19, Julien Grall wrote:
> >
> >
> >
> >
> >
> > On Mon, 27 Jan 2025 at 07:46, Michal Orzel <michal.orzel@amd.com
> <mailto:michal.orzel@amd.com>> wrote:
> >
> >     On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is
> observed:
> >     common/device-tree/bootfdt.c: In function 'build_assertions':
> >     ./include/xen/macros.h:47:31: error: static assertion failed:
> "!(alignof(struct membanks) !=3D 8)"
> >        47 | #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!("
> #cond ")"); })
> >           |                               ^~~~~~~~~~~~~~
> >     common/device-tree/bootfdt.c:31:5: note: in expansion of macro
> 'BUILD_BUG_ON'
> >        31 |     BUILD_BUG_ON(alignof(struct membanks) !=3D 8);
> >
> >     When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned
> long,
> >     therefore the struct membanks alignment is 4B. Fix it.
> >
> >
> > Usually, we add a BUILD_BUG_ON when other parts of the code rely on a
> specific property (in this case alignment). Can you explain in the commit
> message why the new check is still ok?
> Well, the change itself reflects the change in alignment requirement.
> When paddr_t is 64b (Arm64, Arm32 with PA=3D40b) the alignment is 8B.
> On Arm32 with PA=3D32b, the alignment is 4B because paddr_t is 4B.
>
> AFAICT you requested this check back then, because struct membanks
> contains flexible array member 'bank' of type struct membank.
> The alignment requirement of struct membanks becomes the requirement of
> struct membank whose largest type is paddr_t.


Reading this, it sounds like you want to check against the alignment of =C2=
=AB
struct membank =C2=BB. This is because the structure could gain a 64-bit fi=
eld
in the future and this would not be caught by the BUILD_BUG_ON.


> Let me know how you would like to have this written in commit msg.


I think it needs to be rephrased to make clear the alignment of  struct
membanks should be the same as struct membank.

Cheers,


>
> ~Michal
>
>

--000000000000b80ee6062cb28f53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Jan 2025 at 09:52, Michal Or=
zel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 27/01/2025 12:19, Julien Grall wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, 27 Jan 2025 at 07:46, Michal Orzel &lt;<a href=3D"mailto:micha=
l.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a> &lt;mailto:<a h=
ref=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.com<=
/a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a buil=
d failure is observed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0common/device-tree/bootfdt.c: In function &#39;buil=
d_assertions&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0./include/xen/macros.h:47:31: error: static asserti=
on failed: &quot;!(alignof(struct membanks) !=3D 8)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A047 | #define BUILD_BUG_ON(cond) ({ _St=
atic_assert(!(cond), &quot;!(&quot; #cond &quot;)&quot;); })<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0common/device-tree/bootfdt.c:31:5: note: in expansi=
on of macro &#39;BUILD_BUG_ON&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A031 |=C2=A0 =C2=A0 =C2=A0BUILD_BUG_ON(a=
lignof(struct membanks) !=3D 8);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defin=
ed as unsigned long,<br>
&gt;=C2=A0 =C2=A0 =C2=A0therefore the struct membanks alignment is 4B. Fix =
it.<br>
&gt; <br>
&gt; <br>
&gt; Usually, we add a BUILD_BUG_ON when other parts of the code rely on a =
specific property (in this case alignment). Can you explain in the commit m=
essage why the new check is still ok?<br>
Well, the change itself reflects the change in alignment requirement.<br>
When paddr_t is 64b (Arm64, Arm32 with PA=3D40b) the alignment is 8B.<br>
On Arm32 with PA=3D32b, the alignment is 4B because paddr_t is 4B.<br>
<br>
AFAICT you requested this check back then, because struct membanks contains=
 flexible array member &#39;bank&#39; of type struct membank.<br>
The alignment requirement of struct membanks becomes the requirement of str=
uct membank whose largest type is paddr_t.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Reading this, it sounds like you want to check ag=
ainst the alignment of =C2=AB struct membank =C2=BB. This is because the st=
ructure could gain a 64-bit field in the future and this would not be caugh=
t by the BUILD_BUG_ON.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
Let me know how you would like to have this written in commit msg.</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it needs to be re=
phrased to make clear the alignment of =C2=A0struct membanks should be the =
same as struct membank.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Cheers,</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
~Michal<br>
<br>
</blockquote></div></div>

--000000000000b80ee6062cb28f53--

