Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA269F667
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 15:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499513.770677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUpzk-0008Ot-Dj; Wed, 22 Feb 2023 14:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499513.770677; Wed, 22 Feb 2023 14:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUpzk-0008MF-At; Wed, 22 Feb 2023 14:21:20 +0000
Received: by outflank-mailman (input) for mailman id 499513;
 Wed, 22 Feb 2023 14:21:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9L7y=6S=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pUpzj-0008M9-Cn
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 14:21:19 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 29f2daf6-b2bc-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 15:21:15 +0100 (CET)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178]) by
 a36d55857b8a with SMTP id 63f624d9fde7ddb1513bcded (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 22 Feb 2023 14:21:13 GMT
Received: by mail-yb1-f178.google.com with SMTP id z95so8488834ybh.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 06:21:13 -0800 (PST)
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
X-Inumbo-ID: 29f2daf6-b2bc-11ed-93b6-47a8fe42b414
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1677075673; x=1677082873; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=X/L2/m+Rl0wKXf1ngv8ZpwZ0FVqxiDepHcL0dqCUoEE=;
 b=VYdWKsdBfpwV15rjDtceHfxJ6samnxqQ75xJOvxKXSpuVtMKnKHu3BKp4MTKF9VPYWsKgRYJFgEggqZAwdAOHXXxE8OEhZI3D60FdZlnOP640cVNjn/TInC6N6jprRodPlwx1v1r2DD408tL9ERphyOmsW2Xtcy0KV65f/g0gDnWZHJk5JSkbUrlEVCw0vDFAZMpCaI4ISLh02YsfrQ4gT6bXcTbZ89s1UM4hyFJz1zOyVEwHlpmKVybOk9j5fxiFYRN0peUWcBAT5Te+M63W243O6lglsCbNX7QNxYE19DQ9D8IT0S06kiCOre+ROqr+d0/kDTZLuC8C7FcEXUwoA==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKUzSLdigl2uULVTo8OM5FHeQqyWN+aqaqDccyk+lYfv+IaRw2/O
	59qpwuNiUlVH1WRlhrIWr5Y2mIFLzZ5pqolUtkw=
X-Google-Smtp-Source: AK7set9E2kW/UnZ9qFyYabcgRUR3bGDgIlsBLrCguKu364k6DUMmJcEeFuJF+OvkjolBO6t2iZqyRX8TMl1RAb74iPo=
X-Received: by 2002:a25:908e:0:b0:891:8ebc:309c with SMTP id
 t14-20020a25908e000000b008918ebc309cmr1161769ybl.555.1677075673341; Wed, 22
 Feb 2023 06:21:13 -0800 (PST)
MIME-Version: 1.0
References: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
 <2692e97d-b3d6-6512-bff7-c13941c10cd4@suse.com> <CABfawhkvb6EmW7HPd+sfNBwtbmFyEvnSG2vK=4_o9oYs=8OQjg@mail.gmail.com>
 <3dc23c64-8058-c9a0-55e2-68f99a6235da@suse.com>
In-Reply-To: <3dc23c64-8058-c9a0-55e2-68f99a6235da@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Feb 2023 09:20:35 -0500
X-Gmail-Original-Message-ID: <CABfawhkj3kfXbxDOp+GLMF-pV9TeZnsbo_5VbHi9=KK=BiydJA@mail.gmail.com>
Message-ID: <CABfawhkj3kfXbxDOp+GLMF-pV9TeZnsbo_5VbHi9=KK=BiydJA@mail.gmail.com>
Subject: Re: [PATCH v2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c564e905f54a9ba3"

--000000000000c564e905f54a9ba3
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 5:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.02.2023 16:59, Tamas K Lengyel wrote:
> > On Tue, Feb 21, 2023 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.02.2023 18:07, Tamas K Lengyel wrote:
> >>> An assert failure has been observed in p2m_teardown when performing vm
> >>> forking and then destroying the forked VM (p2m-basic.c:173). The
assert
> >>> checks whether the domain's shared pages counter is 0. According to
the
> >>> patch that originally added the assert (7bedbbb5c31) the p2m_teardown
> >>> should only happen after mem_sharing already relinquished all shared
> > pages.
> >>>
> >>> In this patch we flip the order in which relinquish ops are called to
> > avoid
> >>> tripping the assert.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool
> > preemptively")
> >>
> >> Especially considering the backporting requirement I'm disappointed to
> >> find that you haven't extended the description to explain why this
> >> heavier code churn is to be preferred over an adjustment to the
offending
> >> assertion. As said in reply to v1 - I'm willing to accept arguments
> >> towards this being better, but I need to know those arguments.
> >
> > The assert change as you proposed is hard to understand and will be thus
> > harder to maintain. Conceptually sharing being torn down makes sense to
> > happen before paging is torn down.
>
> This is (perhaps) the crucial thing to say. Whereas ...
>
> > Considering that's how it has been
> > before the unfortunate regression I'm fixing here I don't think more
> > justification is needed.
>
> ... I disagree here - that's _not_ how it has been before:
paging_teardown()
> has always been called first. The regression was with how much of teardown
> is performed from there vs at the final stage of domain cleanup.
>
> I'd be fine adding the "Conceptually ..." sentence to the description when
> committing, of course provided you agree.

Perfectly fine by me.

Thanks,
Tamas

--000000000000c564e905f54a9ba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Feb 22, 2023 at 5:48 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 21.02.2023 16:59, Tamas K Lengyel wrote:<br>&gt; &gt; On Tue, F=
eb 21, 2023 at 8:54 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com"=
>jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On 15.0=
2.2023 18:07, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; An assert failure=
 has been observed in p2m_teardown when performing vm<br>&gt; &gt;&gt;&gt; =
forking and then destroying the forked VM (p2m-basic.c:173). The assert<br>=
&gt; &gt;&gt;&gt; checks whether the domain&#39;s shared pages counter is 0=
. According to the<br>&gt; &gt;&gt;&gt; patch that originally added the ass=
ert (7bedbbb5c31) the p2m_teardown<br>&gt; &gt;&gt;&gt; should only happen =
after mem_sharing already relinquished all shared<br>&gt; &gt; pages.<br>&g=
t; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; In this patch we flip the order in whi=
ch relinquish ops are called to<br>&gt; &gt; avoid<br>&gt; &gt;&gt;&gt; tri=
pping the assert.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Signed-off-by: =
Tamas K Lengyel &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengyel.=
com</a>&gt;<br>&gt; &gt;&gt;&gt; Fixes: e7aa55c0aab3 (&quot;x86/p2m: free t=
he paging memory pool<br>&gt; &gt; preemptively&quot;)<br>&gt; &gt;&gt;<br>=
&gt; &gt;&gt; Especially considering the backporting requirement I&#39;m di=
sappointed to<br>&gt; &gt;&gt; find that you haven&#39;t extended the descr=
iption to explain why this<br>&gt; &gt;&gt; heavier code churn is to be pre=
ferred over an adjustment to the offending<br>&gt; &gt;&gt; assertion. As s=
aid in reply to v1 - I&#39;m willing to accept arguments<br>&gt; &gt;&gt; t=
owards this being better, but I need to know those arguments.<br>&gt; &gt;<=
br>&gt; &gt; The assert change as you proposed is hard to understand and wi=
ll be thus<br>&gt; &gt; harder to maintain. Conceptually sharing being torn=
 down makes sense to<br>&gt; &gt; happen before paging is torn down.<br>&gt=
;<br>&gt; This is (perhaps) the crucial thing to say. Whereas ...<br>&gt;<b=
r>&gt; &gt; Considering that&#39;s how it has been<br>&gt; &gt; before the =
unfortunate regression I&#39;m fixing here I don&#39;t think more<br>&gt; &=
gt; justification is needed.<br>&gt;<br>&gt; ... I disagree here - that&#39=
;s _not_ how it has been before: paging_teardown()<br>&gt; has always been =
called first. The regression was with how much of teardown<br>&gt; is perfo=
rmed from there vs at the final stage of domain cleanup.<br>&gt;<br>&gt; I&=
#39;d be fine adding the &quot;Conceptually ...&quot; sentence to the descr=
iption when<br>&gt; committing, of course provided you agree.<br><div><br><=
/div><div>Perfectly fine by me.</div><div><br></div><div>Thanks,</div><div>=
Tamas<br></div></div>

--000000000000c564e905f54a9ba3--

