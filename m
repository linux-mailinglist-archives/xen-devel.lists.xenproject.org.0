Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E9F69E41C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499003.769981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUV3s-0006kR-4O; Tue, 21 Feb 2023 16:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499003.769981; Tue, 21 Feb 2023 16:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUV3s-0006hl-1T; Tue, 21 Feb 2023 16:00:12 +0000
Received: by outflank-mailman (input) for mailman id 499003;
 Tue, 21 Feb 2023 16:00:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li4P=6R=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pUV3q-0006hc-NW
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:00:10 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id d01e2cb5-b200-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:00:08 +0100 (CET)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170]) by
 9d1469203088 with SMTP id 63f4ea86403d4a45c7fb71a4 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Tue, 21 Feb 2023 16:00:06 GMT
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-536c2a1cc07so55136737b3.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Feb 2023 08:00:06 -0800 (PST)
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
X-Inumbo-ID: d01e2cb5-b200-11ed-a089-e9535cc0f9c3
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676995206; x=1677002406; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=A8FosNzblNVltvtSuxm7lOrbAJOLJey346OrMJVjX3o=;
 b=ZtoC/fYUH9adJ+pmMBG6Uequau5oeXYHYTKUHZetddIcUu9x7xUi1wlXrtpczpDTLo6OjroXohW7glyuIAZnft8s4v/8BNy3pwoqm9iQXmqn188043bjnz5FegZVvZ215cOATIsI2VuAJzb/JohlAHfSgau/NFzIC5Tpg5iGHt5bAVqL7UmPKq6vfpZQMEAoJgtgtw8bo0UN8rwxd4WB1jpGyMXa3X4uriXuv6qxOm8T68X3szghNeK1mXprhzRkNtdpfSC1XwBm4KGX1eiXk8wDsDLs7fkhUK1VbtairF8MF6ssE7MTy4alSFmMcS/HiNauS2Q7o0yIOciCcr4ulQ==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKX8pSnPvb6ZB2qvLgzbcVE8Pib82gLBNr/wP5vKKXZ1vTixu4Fy
	HuKitqOxdN5oOjNN/JYWrN2NoENZbs4R23uYXR4=
X-Google-Smtp-Source: AK7set8dafSHJWIbgA+Vkkn/dIDjiTpcPdnEhnciLOSnuisnWrygos4O5fjXFvkb4kquohtto+8121aw3cAntcV/Xbk=
X-Received: by 2002:a81:72c1:0:b0:525:1590:32ef with SMTP id
 n184-20020a8172c1000000b00525159032efmr2111911ywc.221.1676995200523; Tue, 21
 Feb 2023 08:00:00 -0800 (PST)
MIME-Version: 1.0
References: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
 <2692e97d-b3d6-6512-bff7-c13941c10cd4@suse.com>
In-Reply-To: <2692e97d-b3d6-6512-bff7-c13941c10cd4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 21 Feb 2023 10:59:24 -0500
X-Gmail-Original-Message-ID: <CABfawhkvb6EmW7HPd+sfNBwtbmFyEvnSG2vK=4_o9oYs=8OQjg@mail.gmail.com>
Message-ID: <CABfawhkvb6EmW7HPd+sfNBwtbmFyEvnSG2vK=4_o9oYs=8OQjg@mail.gmail.com>
Subject: Re: [PATCH v2] x86: Perform mem_sharing teardown before paging teardown
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000037a42b05f537dfba"

--00000000000037a42b05f537dfba
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.02.2023 18:07, Tamas K Lengyel wrote:
> > An assert failure has been observed in p2m_teardown when performing vm
> > forking and then destroying the forked VM (p2m-basic.c:173). The assert
> > checks whether the domain's shared pages counter is 0. According to the
> > patch that originally added the assert (7bedbbb5c31) the p2m_teardown
> > should only happen after mem_sharing already relinquished all shared
pages.
> >
> > In this patch we flip the order in which relinquish ops are called to
avoid
> > tripping the assert.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool
preemptively")
>
> Especially considering the backporting requirement I'm disappointed to
> find that you haven't extended the description to explain why this
> heavier code churn is to be preferred over an adjustment to the offending
> assertion. As said in reply to v1 - I'm willing to accept arguments
> towards this being better, but I need to know those arguments.

The assert change as you proposed is hard to understand and will be thus
harder to maintain. Conceptually sharing being torn down makes sense to
happen before paging is torn down. Considering that's how it has been
before the unfortunate regression I'm fixing here I don't think more
justification is needed. The code-churn is minimal anyway.

Tamas

--00000000000037a42b05f537dfba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Feb 21, 2023 at 8:54 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 15.02.2023 18:07, Tamas K Lengyel wrote:<br>&gt; &gt; An assert=
 failure has been observed in p2m_teardown when performing vm<br>&gt; &gt; =
forking and then destroying the forked VM (p2m-basic.c:173). The assert<br>=
&gt; &gt; checks whether the domain&#39;s shared pages counter is 0. Accord=
ing to the<br>&gt; &gt; patch that originally added the assert (7bedbbb5c31=
) the p2m_teardown<br>&gt; &gt; should only happen after mem_sharing alread=
y relinquished all shared pages.<br>&gt; &gt;<br>&gt; &gt; In this patch we=
 flip the order in which relinquish ops are called to avoid<br>&gt; &gt; tr=
ipping the assert.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Tamas K Lengyel=
 &lt;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengyel.com</a>&gt;<br>=
&gt; &gt; Fixes: e7aa55c0aab3 (&quot;x86/p2m: free the paging memory pool p=
reemptively&quot;)<br>&gt;<br>&gt; Especially considering the backporting r=
equirement I&#39;m disappointed to<br>&gt; find that you haven&#39;t extend=
ed the description to explain why this<br>&gt; heavier code churn is to be =
preferred over an adjustment to the offending<br>&gt; assertion. As said in=
 reply to v1 - I&#39;m willing to accept arguments<br><div>&gt; towards thi=
s being better, but I need to know those arguments.</div><div><br></div><di=
v>The assert change as you proposed is hard to understand and will be thus =
harder to maintain. Conceptually sharing being torn down makes sense to hap=
pen before paging is torn down. Considering that&#39;s how it has been befo=
re the unfortunate regression I&#39;m fixing here I don&#39;t think more ju=
stification is needed. The code-churn is minimal anyway.</div><div><br></di=
v><div>Tamas<br></div></div>

--00000000000037a42b05f537dfba--

