Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295CF6B930B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 13:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509568.785548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3YS-00067z-SV; Tue, 14 Mar 2023 12:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509568.785548; Tue, 14 Mar 2023 12:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3YS-000650-Pc; Tue, 14 Mar 2023 12:15:00 +0000
Received: by outflank-mailman (input) for mailman id 509568;
 Tue, 14 Mar 2023 12:14:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfqj=7G=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pc3YR-00064u-At
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 12:14:59 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67cefd3-c261-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 13:14:58 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id x13so13850567edd.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 05:14:58 -0700 (PDT)
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
X-Inumbo-ID: d67cefd3-c261-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678796098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsXnuyICvUl1227+tce79CZhvcJfDMFSYkv5VedTOY4=;
        b=FpWLxj4JS94iM/KXdCYDSkxHP7+gMAp4cHi0f+cz6/ZjEjC4WpJmunD+l7RKLQZhuC
         ASuqLoN5DXZ571m8lURRaaX9azUeGiwPq+zw5KylwY2xQFYftyLWy1dtPgIl0MyUgEfr
         aSJU5xwQl2FxNsycszHxrvflqrm97MKnaxu3hA0Zsm3pfyHHf5pb8yRU3wtojqqM2sFe
         KKBDhA3IotNNL3M9R1cND/Q/ViLXEi4IL0vckRUb9Ry4NyJxbmAPnjEqda1NQemDYLw9
         5YovPQ+L03uFBhoDGUJM1RTmuGhwD0SrpytmKIEaFYCkh9eeWfN37o35zpdNbu+4ZOgp
         tJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsXnuyICvUl1227+tce79CZhvcJfDMFSYkv5VedTOY4=;
        b=yYkdMoiTmSLanSl5tCjgmIUv7QWTRKhBZ2O90EnbFC0Dk04S6w/ri+Vivb1+T1Ja0H
         eJTRWZWBG/4NgdGI/xr/GZkmRvYP978gyjAFK5xkew+Ttbcmd1swm4wsQ9JE6ELU4kj0
         yJmKv/oUyQeOw+Theq+TpxtquoYHO7aQ7njDJ/9feIyymgGJQGg66BSVcJZmxf4ux6K/
         VptpILT3x4TS/kBNbszS4tEfSwMs/HyfUPARmLWMQDz/JBF7UBLqmIJUL08h76E+51RW
         lsHQk2BNzvoE4LBCOg5SNNXL9WWFWurXemsBk+0AQhNjyVPW4nA7SMMEO8ageUGafy83
         VMww==
X-Gm-Message-State: AO0yUKVQGMEEz45+Y06CmaUAVIdSws7Km/1PIA/5XUTzHp8SlN+VuWXN
	EGoebybOVOrDhoqYuEszxwK2XGkSDgCaUiMcsDy++2TH
X-Google-Smtp-Source: AK7set9YGAYGqoNTBevmb6HEb4HvuqRGqEAhz+2SVaITGHpot3iPv9HyzQk+V14+NF0hMk8zN8NN7yiL9Awdlrk4mW0=
X-Received: by 2002:a17:907:e91:b0:924:32b2:e3d1 with SMTP id
 ho17-20020a1709070e9100b0092432b2e3d1mr1220567ejc.3.1678796098022; Tue, 14
 Mar 2023 05:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230313175103.20778-1-jandryuk@gmail.com> <593392ae-91ce-3499-1aa7-fcfe664025cd@suse.com>
In-Reply-To: <593392ae-91ce-3499-1aa7-fcfe664025cd@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 08:14:46 -0400
Message-ID: <CAKf6xpvdOz2eYXqsxLN879NtMYZvuGWXk7bgcCwnbRfAGofL4Q@mail.gmail.com>
Subject: Re: [PATCH] xen/cpufreq: Remove <asm/bug.h>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 6:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.03.2023 18:51, Jason Andryuk wrote:
> > The header is unneeded - there are no uses of BUG() or WARN() in these
> > cpufreq files.  Remove the include.  It is still include transitively
> > from xen/lib.h.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> This, in a way, is a review comment on Oleksii's "xen: change <asm/bug.h>
> to <xen/bug.h>". We can certainly put in the change as you have it (for
> him to drop the touching of the two files), but I'd find it more logical
> to continue to be part of his change, just with the xen/bug.h replacement
> includes dropped. Thoughts, either of you?

Yes, Oleskii's work brought it to my attention.  I submitted it this
way to follow the "one change per commit" rule of thumb, seeing it as
distinct from, though related to, the asm -> xen rename.  If you
prefer to have it rolled into Oleksii's change, that is fine by me.

> Things would be different if it was clear that the change here was droppi=
ng
> all unnecessary includes from the cpufreq files. But that doesn't look to
> be the case, as I think ...

Correct, I did not inspect other includes.

Regards,
Jason

