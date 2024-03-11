Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD2878489
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 17:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691534.1077574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rji8W-00014V-UL; Mon, 11 Mar 2024 16:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691534.1077574; Mon, 11 Mar 2024 16:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rji8W-00011u-R8; Mon, 11 Mar 2024 16:04:24 +0000
Received: by outflank-mailman (input) for mailman id 691534;
 Mon, 11 Mar 2024 16:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MnyG=KR=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1rji8U-00011o-JM
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 16:04:23 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04dc5da0-dfc1-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 17:04:20 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e94c12f33so1411626f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 09:04:20 -0700 (PDT)
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
X-Inumbo-ID: 04dc5da0-dfc1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1710173059; x=1710777859; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Fr8o0HYE1r5nGvdTOwaWJX0ACdCUNcwkOd1BS07tq4=;
        b=KRMBuk/skYNV+X57BzzX4ByCZNW4l7UqqZ92X4X4Q10I0mAa2LBl97F2Tqhtsv22sw
         BDLL/ErxGvi474OQSbsTBZcXEO2lPLPWEc7Uxc3jkWdhEZlvJ2MoEJE4ddtdCIUHDAUI
         4N6Su2LgjsNi3MYOfQsM6sHXxmJVABGfr13DvrDg0gZt0T+wNeSN8SVbw1TVjCH/Wu8m
         L8yTCw5NC36PSdDsbVfxWgcNE+8f+6KgIVXJddFEuGS4PxRDYQEvQJx+qMbysCkYQJBE
         jxwAj15WAvZrar/HMZ5CSkcoYP2nRon/C/lkFSJc/ycQPeqPJGewJtxchk+7nteXyQNd
         nuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173059; x=1710777859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Fr8o0HYE1r5nGvdTOwaWJX0ACdCUNcwkOd1BS07tq4=;
        b=GQrXtCIcoG0tWskjCpfa8NxgN38LsapI7KC1mhlBV4j64mLadkxq/fD+5m8KJvvlmu
         oI0IpJfMqdqnKKcBZvucz9+Eu3G+VBY7li+v/Xb8/1XEoo53Bc4ntQCd7cJWoOQ+oZvw
         26aolMfRfwn0fa2JZHvjHICEkTh0JD/2Rs43waCqpVHn4ujsqTquXJc7ym6aSVeWKgag
         /uEz1Y6wrurTQy3usYH7BLPYU9GsPiHkCiAn8VrqpNPpt7XsgA+VhXooJ0H/QGVXpaKk
         nhBW8BXzn+nX3nbrrhdn4AOTkDY3I5+tDmTvDRG9fW5t+xbEGJctBzHhoYO0XfmfaOX7
         09UQ==
X-Gm-Message-State: AOJu0Yz/nxHALiQ2aCZgsaykh9FFtutRBF7RfNhwf0tofGdwoyEItqUZ
	tATIX22M3h9hdzDmWY4xTNAd67vgzgCJW/OpnKVsvWsaEjolKJr1DifrhuG4dw686P8uSUw5hqV
	prrB4IyyO7gqoSRXCv0XPx5uGus0=
X-Google-Smtp-Source: AGHT+IGm3YGrBsha2YmM1pLIcxrpruCFHxGFn9mdqFLzRGv2HdccNMQWFD9IutsP1FuwId2lPrsIDVYGCGhm4vjcqwQ=
X-Received: by 2002:adf:f68c:0:b0:33e:800d:e87a with SMTP id
 v12-20020adff68c000000b0033e800de87amr4321535wrp.34.1710173059216; Mon, 11
 Mar 2024 09:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com> <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
In-Reply-To: <5b3f46f3-3c9f-57fb-00a5-94128f41e34a@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 11 Mar 2024 16:04:07 +0000
Message-ID: <CAFLBxZbSWEW4DK5tdi24cBBG7P06iGpORMXXevb_g50pgXzQKw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/PoD: move increment of entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@cloud.com>
Content-Type: multipart/alternative; boundary="000000000000b2ffc8061364b1fd"

--000000000000b2ffc8061364b1fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 4, 2022 at 10:58=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> When not holding the PoD lock across the entire region covering P2M
> update and stats update, the entry count should indicate too large a
> value in preference to a too small one, to avoid functions bailing early
> when they find the count is zero. Hence increments should happen ahead
> of P2M updates, while decrements should happen only after. Deal with the
> one place where this hasn't been the case yet.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Add comments.
> ---
> While it might be possible to hold the PoD lock over the entire
> operation, I didn't want to chance introducing a lock order violation on
> a perhaps rarely taken code path.
>

[No idea how I missed this 2 years ago, sorry for the delay]

Actually I think just holding the lock is probably the right thing to do.
We already grab gfn_lock() over the entire operation, and p2m_set_entry()
ASSERTs gfn_locked_by_me(); and all we have to do to trigger the check is
boot any guest in PoD mode at all; surely we have osstest tests for that?

 -George

--000000000000b2ffc8061364b1fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 4, 2022 at 10:58=E2=80=AFAM J=
an Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeul=
ich@suse.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">When not holding the PoD lock across=
 the entire region covering P2M<br>
update and stats update, the entry count should indicate too large a<br>
value in preference to a too small one, to avoid functions bailing early<br=
>
when they find the count is zero. Hence increments should happen ahead<br>
of P2M updates, while decrements should happen only after. Deal with the<br=
>
one place where this hasn&#39;t been the case yet.<br>
<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
---<br>
v2: Add comments.<br>
---<br>
While it might be possible to hold the PoD lock over the entire<br>
operation, I didn&#39;t want to chance introducing a lock order violation o=
n<br>
a perhaps rarely taken code path.<br></blockquote><div><br></div><div>[No i=
dea how I missed this 2 years ago, sorry for the delay]</div><div><br></div=
><div>Actually I think just holding the lock is probably the right thing to=
 do.=C2=A0 We already grab gfn_lock() over the entire operation, and p2m_se=
t_entry() ASSERTs gfn_locked_by_me(); and all we have to do to trigger the =
check is boot any guest in PoD mode at all; surely we have osstest tests fo=
r that?</div><div><br></div><div>=C2=A0-George</div></div></div>

--000000000000b2ffc8061364b1fd--

