Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706BCA8565
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179305.1502877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYUK-0007Pk-IT; Fri, 05 Dec 2025 16:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179305.1502877; Fri, 05 Dec 2025 16:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYUK-0007Nc-ED; Fri, 05 Dec 2025 16:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1179305;
 Fri, 05 Dec 2025 16:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBPq=6L=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vRYUJ-0007NS-4V
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:16:55 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf7c004d-d1f5-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 17:16:52 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-37ce27af365so20134571fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 08:16:52 -0800 (PST)
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
X-Inumbo-ID: cf7c004d-d1f5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764951412; x=1765556212; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRZGhjTlJYM8509l49dKV7EDaTkiZ7SIwBZWIFOR2Zg=;
        b=SEhQhwvamxNrscWIIwwTjxE3ZB/RCDooleJfT2SvVm5jUBuUpDlPIihnTBBT7J01Or
         ErV3XUX8nNHJC7FQsHAOOfe4iYc9KmY6XXFrdNZwmlhy2weQRP1TTkgUyGrxAdpZpjb0
         8oOYlC5LsIvTM190oWkfA6RPqWxRTzS/EyMhcMs4+M4tdfo+O7PBsiB9x5AN4DkdcUuj
         UHi2olGGZlfLDJiBIQLCGA89vtFLHhAagZ9Lu/d+W4fYyb8aDJEKivI4aid7zpQfNSEY
         r75+t23Uk7TvQBckzTdNwOJWapSgwYUYVHUYLq07g/DmOpuytXfKlZUzCWayYEJpmxFc
         SPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764951412; x=1765556212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRZGhjTlJYM8509l49dKV7EDaTkiZ7SIwBZWIFOR2Zg=;
        b=HGzSjX70u1F2/CsaftTLv0z23h06Xn6jNjk1HWBYCvXdTmydShFUM7Ocg4/8g0Z9Yk
         D9/7PWG+C1gqrqDHXY9TkZxfC6lb7rSSmeL2tbZiFi/+8tbUjLxcP1HlWLK7A6xLUKA1
         iJNzvVTIHpvJat2hylqse7/IevFZjG69Z2DVv3KGvQN24fKMVLjEuY43XETHmiligEuL
         hgCj0eACn7Tg0CeU36HLSmnezSHY5PEh8+I/qaRwNB5LMoicl/8LN5XmR2Wglg/OqPh2
         FoEH0FBc4aZ1/8knkfCWhiAYM0cQyfhUqq8fyKE5ZIAOxABEC6u1kKbVjeYfY8KVdJOx
         ZwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUovH9AsbIRJSp8lmaml/kAWx+VtDVE01xPAYmx5w+CHR15wMnNHIPA9DgDVfyoeJHX5RWrk2kn9rE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtqIq6MCtYD5E2rl7P1gVtmwBprliLFHD0PchcOExbVudw1UCR
	usQV/vZIpYtR17KzWu+JaxLAvxBlkR+sHe5PS6R3b9G+SUHg+u5cUIVsR81X9RBY442Ya8e0RuP
	U1omFgxdWqN9RnjG00IH/dFdhX/iKiak=
X-Gm-Gg: ASbGnctSqPGWLk++OOF7CK3hD/POnJrJU5nPMakUSqvqV7kjn97AGHgTDuE+CsZO2nq
	LORkMHQNvAoncLipw2D5VcowcXUUQz8S7JwyEU9y7wgFvk2hyGQBrDxOYXGzPmVS03/EPvS+4GV
	8MuF0T3e3CEkW7YRGb3fQtvg6kP1bm5bWM4tedx6AWuOqYn1jOxi3p5qtP/x6eaVqWo8wd/UgXi
	eGrqQ7DD7kjmlif514vjCy56u7iGouNClrPNpsTwjV7XE3xkLHWpogcBTS5jyXlXs+hyg==
X-Google-Smtp-Source: AGHT+IG69HWvrsu5KbvrMQYRGqN1TmXTsQTUmdsw42PQ7830rWUAMDzA+KtCI5ZXO6pPBXZZKuwS47pNARoYihy9CJc=
X-Received: by 2002:a2e:a9a1:0:b0:37b:a737:d42a with SMTP id
 38308e7fff4ca-37e637402a7mr30961021fa.5.1764951411980; Fri, 05 Dec 2025
 08:16:51 -0800 (PST)
MIME-Version: 1.0
References: <f03c8a2fe81527841966ed6c8ed603d1d90ee5c4.1764940296.git.mykola_kvach@epam.com>
 <aTLkwMpxchYSMnyT@mail-itl> <CAGeoDV8FnNxoqr18W82DhE=fLWJSQr68xr_vPew_z=hyt2BbeA@mail.gmail.com>
 <95799f50-12ec-48de-9847-cf46835f1a98@citrix.com>
In-Reply-To: <95799f50-12ec-48de-9847-cf46835f1a98@citrix.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 5 Dec 2025 18:16:40 +0200
X-Gm-Features: AWmQ_bk9xn5iaMpvyriE_gkMjRhkgLIeh495HvxnMhzVxLUu57FjrBqgtjHWWQE
Message-ID: <CAGeoDV89J4DztxfwXJO2n6KuVAXtJ47axJ7WvnDHkcVTUvkRKg@mail.gmail.com>
Subject: Re: [PATCH] systemd: default system-sleep dir without pkg-config
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for the review.

On Fri, Dec 5, 2025 at 4:57=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 05/12/2025 2:54 pm, Mykola Kvach wrote:
> > Hi,
> >
> > On Fri, Dec 5, 2025 at 3:57=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> >> On Fri, Dec 05, 2025 at 03:13:32PM +0200, Mykola Kvach wrote:
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> Using PKG_CHECK_VAR() to obtain SYSTEMD_SLEEP_DIR reintroduced a buil=
d-time
> >>> dependency on systemd-devel. This breaks --enable-systemd builds that=
 only
> >>> need the initscripts.
> >>>
> >>> Use the same defaulting scheme as other systemd paths: if SYSTEMD_SLE=
EP_DIR
> >>> isn't provided, set it to "$(prefix)/lib/systemd/system-sleep/".
> >>>
> >>> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog o=
n suspend/resume")
> >>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> ---
> >>> Build in which the regression was detected:
> >>> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
> >> Requires re-running autoconf, otherwise still fails:
> > Thanks for the note. I had assumed the Autoconf-generated files were re=
freshed
> > during release or at merge time, since this updates generated artifacts=
. If the
> > expectation is that contributors regenerate and include them with the p=
atch,
> > I will add the updated Autoconf outputs in the next revision of this se=
ries.
>
> We regenerate on commit, but that still needs a reminder to remember to
> do so.

Got it, thanks for the clarification.

>
> >
> >> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/12336879267
> >>
> >> With autoconf:
> >> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2198372=
475
> >>
> >> It's better now, so:
> >> Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks for the quick turnaround.  I'll queue this shortly.

Best regards,
Mykola

