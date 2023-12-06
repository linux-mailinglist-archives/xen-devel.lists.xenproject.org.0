Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE244807A03
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 22:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649436.1013979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAz2u-00054Q-3r; Wed, 06 Dec 2023 21:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649436.1013979; Wed, 06 Dec 2023 21:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAz2u-00052Q-11; Wed, 06 Dec 2023 21:03:04 +0000
Received: by outflank-mailman (input) for mailman id 649436;
 Wed, 06 Dec 2023 21:03:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uigp=HR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rAz2s-00052I-GB
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 21:03:02 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c24675-947a-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 22:03:00 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54c64316a22so320268a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 13:03:00 -0800 (PST)
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
X-Inumbo-ID: d6c24675-947a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701896580; x=1702501380; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVWKpze7ca/3XUJO9A/TSawlQir11npa9h6eTs/M9Os=;
        b=QpQrddHlukykH5K1RJg7FD40agOS6lCtraEO3yJHlK1nlCqWLQuj+sA7tB1dQ3fpmj
         eKZyXs5YtI9/ok+Cu549Bh3YKSVom4MBInofmDhdIprrGew0nIcedVmDhnusbhBZ7pZf
         xERN7mKfqhW5mQh9lDQbyuQJeVJ3X1b7rTQKXp9vjGuQpHnC6Mlxl/tBm1ru7KsGK+QJ
         vaA0aIWzmQt6FsryMN4o769YYmEkbyyBvszNqWQnfQfx5NpDDGhuBWnxPQzpbhwSHDeV
         SOqMfd70b/CWC07to0x5H6H9iYbEXVyMDktkemB6mHe2Ptrhf4rWE6m+DxD7lRw1h6Sd
         NIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701896580; x=1702501380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVWKpze7ca/3XUJO9A/TSawlQir11npa9h6eTs/M9Os=;
        b=t9pQcMoNpRWrHM9KBQCzMowye0VrphmevcOrHm0Z+Ek/njTEQ4pWvj/ACUdyJ6RPjX
         Dg/V32dkmhQSLS0M7iA8CMIJidwli8B5c4GlFxhdPLvKdpb0i1n/B3D39g375GDAYMjo
         WuvhIb0hiUj/fW+x24nU58F1piYv4qpiDbSQu3YCko3ogiYwsJXwfdlJfbksnt/vcO1D
         3jdxdfgNXuCKTz5q4l7u2FLxkNoilvBAbZYm4oNcqw3WV6JkHWqo6D5jiDHz8ORcAAHy
         9FfDWP4Kl9r4xoxVpmUzfQHcZXpRTTwbhQ4eb5A5Y+ZOxB6yVXb6iCLKUabYVTzdCfQE
         +JNg==
X-Gm-Message-State: AOJu0YytbK9GnMlpJOFtOw9Tt0pS7fOTHXs1lW9WzVFoHtgLCVrFSMOW
	IsiUGxkpkCXroDf19136BIjHbJuIG0l8N0FICh0=
X-Google-Smtp-Source: AGHT+IG8mkdpAW+8nMRqYe0nVpGQJsGUVcISVm9bEAzeXsmA5EHupe+/XbJBYzNr8lbm1eDxf65X0lqg5p5ILIY9HrE=
X-Received: by 2002:a05:6402:3139:b0:54c:4837:7594 with SMTP id
 dd25-20020a056402313900b0054c48377594mr869511edb.64.1701896579947; Wed, 06
 Dec 2023 13:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20231206144009.29154-1-jgross@suse.com> <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
 <b5b74155-e086-425d-8f5a-e9878d5d2da2@suse.com>
In-Reply-To: <b5b74155-e086-425d-8f5a-e9878d5d2da2@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Dec 2023 16:02:47 -0500
Message-ID: <CAKf6xpvR1sOGCeH5PgdPGCuwAtLCH=J8c0C_V-DXopmw46=onQ@mail.gmail.com>
Subject: Re: [PATCH] tools/libs/evtchn: drop assert()s in stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 11:44=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 06.12.23 17:38, Jason Andryuk wrote:
> > On Wed, Dec 6, 2023 at 9:40=E2=80=AFAM Juergen Gross <jgross@suse.com> =
wrote:
> >>
> >> In tools/libs/evtchn/minios.c there are assert()s for the current
> >> thread being the main thread when binding an event channel.
> >>
> >> As Mini-OS is supporting multiple threads, there is no real reason
> >> why the binding shouldn't be allowed to happen in any other thread.
> >>
> >> Just drop the assert()s.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   tools/libs/evtchn/minios.c | 3 ---
> >>   1 file changed, 3 deletions(-)
> >>
> >> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> >> index 28743cb055..e33ddec7e7 100644
> >> --- a/tools/libs/evtchn/minios.c
> >> +++ b/tools/libs/evtchn/minios.c
> >> @@ -195,7 +195,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_p=
ort(xenevtchn_handle *xce,
> >>       int ret;
> >>       evtchn_port_t port;
> >>
> >> -    assert(get_current() =3D=3D main_thread);
> >>       port_info =3D port_alloc(xce);
> >
> > If multiple threads are allowed, does port_list need to gain a lock
> > protecting it?
>
> I thought of that, too.
>
> The answer is: maybe
>
> Any other list operation on the list isn't protected by an assert(), so
> technically there is no real new aspect added in this regard.

Yes.

> I believe adding a lock would make sense, but it is orthogonal to this
> patch.

The assert() feels like it was an attempt to avoid introducing
locking, so I'm not sure it is really orthogonal.

I was kinda waiting to see if anyone else would lend an opinion.

Since the asserts haven't been tripping there doesn't seem to be an
issue with the code as-is, so:

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

