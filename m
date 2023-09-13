Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6C79E4D5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601174.937107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgN48-00018o-BJ; Wed, 13 Sep 2023 10:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601174.937107; Wed, 13 Sep 2023 10:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgN48-000166-8Y; Wed, 13 Sep 2023 10:25:48 +0000
Received: by outflank-mailman (input) for mailman id 601174;
 Wed, 13 Sep 2023 10:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjWf=E5=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qgN47-000160-7B
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:25:47 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e68a753b-521f-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 12:25:46 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso114200131fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 03:25:46 -0700 (PDT)
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
X-Inumbo-ID: e68a753b-521f-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694600745; x=1695205545; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnVOd1OmPn26d0MyqQJvJzMKH46KhBt4Kite4K+jHvs=;
        b=Y18lJp2lxOaBcQ+FY5L0baO9/K4GP7zERATA7rI/kXTEoRtUBG7uEQWKjyozBVLqs9
         OiFLkQUOxsTQeSoCG63h7FIJ7e02J5qNo3gQzNZMVcdahGApjxSl3dHch6uKCgsvZNOM
         mflXMOH6ZZQFfxCuulmKEojZlP3UPjOYAmw1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694600745; x=1695205545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnVOd1OmPn26d0MyqQJvJzMKH46KhBt4Kite4K+jHvs=;
        b=v7LqSfuGL3GDsw/TSzUa6WL63wOcJkTsW83OGxC2yqDxtftgtu9rK9YYL28SuNURSP
         xtjMEyFw9Et1gDS1xGPda+rztCqowEQO+oDqsi9eIxR4G2phdcRqK6K+dvHERpN1RN55
         gZkTiwKkHENA2NhNB2kt6rd0x/QooghSlegfPgEQ9/rJad8SXvu33aJZF1YXe8WbHRH8
         KUvVGNlj2Hc9b88vBMYeRvdi25mqstUoIt2rI/cOOa5YDTQVV3i0uAP63NJ1vGLpq0SI
         tMclCRzet+K3InO7x8ZlKnE8Ok7Afo1JLneIGIyZv+U3nW3vKVJaYy33fhD005gTgn1k
         QpAg==
X-Gm-Message-State: AOJu0YzvPzgGap5BBTK5n+hAle7I37LR6Hq9TVtAcVQZaLgjm6m/eYE+
	tJ8hk0qrOa2Qe496bF0q6Tt5edfYBwV3k4YmTJ3NY7d4+Pa6QmsBy8MT1Q==
X-Google-Smtp-Source: AGHT+IE9olSIF3tW61dxmxgGzDefZsGkFax2HWCa/BNyXMFyNyZ3Vqf3pAte65Id+2VlvJ5UNiCG59ztpoJYwYJM+5U=
X-Received: by 2002:a2e:b0d6:0:b0:2bc:ffcc:6cc0 with SMTP id
 g22-20020a2eb0d6000000b002bcffcc6cc0mr1958349ljl.17.1694600745595; Wed, 13
 Sep 2023 03:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
 <CA+zSX=aCwR5gxk3jyPDoWRvoFAAjORWigtrbaO9ow5EvmT_tZg@mail.gmail.com> <ea6686a2-dfe3-4a6f-5d3c-a729f95520d1@suse.com>
In-Reply-To: <ea6686a2-dfe3-4a6f-5d3c-a729f95520d1@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Sep 2023 11:25:34 +0100
Message-ID: <CA+zSX=a1oyPOJLvwBq+YXGnumi7HAqk_XoL=Wat9iHnz7fTe6g@mail.gmail.com>
Subject: Re: [PATCH] timer: fix NR_CPUS=1 build with gcc13
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:05=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 13.09.2023 11:44, George Dunlap wrote:
> > On Wed, Sep 13, 2023 at 8:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
> >> is >=3D 1, and then (on x86) complains about "per_cpu(timers, new_cpu)=
"
> >> exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
> >> configuration). Make the code conditional upon there being at least 2
> >> CPUs configured (otherwise there simply is nothing to migrate [to]).
> >
> > Hmm, without digging into it, migrate_timer() doesn't seem like very
> > robust code: It doesn't check to make sure that new_cpu is valid, nor
> > does it give the option of returning an error if anything fails.
>
> Question is - what do you expect the callers to do upon getting back
> failure?

[snip]

> >  Would it make more sense to add `||
> > (new_cpu > CONFIG_NR_CPUS)` to the early-return  conditional at the
> > top of the first `for (; ; )` loop?
>
> But that would mean not doing what was requested without any indication
> to the caller. An out-of-range CPU passed in is generally very likely
> to result in a crash, I think.

If it's only off by a little bit, there's a good chance it might just
corrupt some other data, causing a crash further down the line, where
it's not obvious what went wrong.  Generally speaking, passing an
error up the stack, explicitly crashing, or explicitly doing nothing
with a warning to the console are all better options.

> > I guess if we don't expect it ever to be called, it might be better to
> > get rid of the code entirely; but maybe in that case we should add
> > something like the following?
> >
> > ```
> > #else
> >     WARN_ONCE("migrate_timer: Request to move to %u on a single-core
> > system!", new_cpu);
> >     ASSERT_UNREACHABLE();
> > #endif
> > ```
>
> With the old_cpu =3D=3D new_cpu case explicitly permitted (and that being
> the only legal case when NR_CPUS=3D1, which arguably is an aspect which
> makes gcc's diagnostic questionable), perhaps only
>
> #else
>     old_cpu =3D ...;
>     if ( old_cpu !=3D TIMER_CPU_status_killed )
>         WARN_ON(new_cpu !=3D old_cpu);
> #endif
>
> (I'm afraid we have no WARN_ON_ONCE() yet, nor WARN_ONCE())?

I think I was looking for `printk_once`.

If there's no reasonable way to fail more gracefully (or no real point
in making the effort to do so), what if we add the following to the
top of the function?  Does that make gcc13 happy?

```
if ( new_cpu >=3D CONFIG_NR_CPUS )
{
    printk_once(/* whatever */);
    ASSERT_UNREACHABLE();
    return;
}
```

Or, if we feel like being passed an invalid cpu means the state is so
bad it would be better to just crash and have done with it:

```
  BUG_ON(new_cpu >=3D CONFIG_NR_CPUS);
```

 -George

