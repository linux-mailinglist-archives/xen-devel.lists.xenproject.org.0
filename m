Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE47738B3D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552982.863270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0jQ-0006Qf-63; Wed, 21 Jun 2023 16:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552982.863270; Wed, 21 Jun 2023 16:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0jQ-0006Ov-3F; Wed, 21 Jun 2023 16:30:56 +0000
Received: by outflank-mailman (input) for mailman id 552982;
 Wed, 21 Jun 2023 16:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i6F=CJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qC0jO-0006Op-E2
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:30:54 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3112e8-1050-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 18:30:52 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51a2661614cso7935487a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 09:30:52 -0700 (PDT)
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
X-Inumbo-ID: fd3112e8-1050-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687365052; x=1689957052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3MJUGb+fDkP6Z6i5IHVBHg7BbJ798H5n/H0dPPUYt4=;
        b=ba+iO5iH+7lxC2J8yQmcq/lQMltYDhFikHJkZ9TGCU9XeeaHB3YVSkaeL03UzX/fN0
         VFsg1sj+iYc75mc0dSdkWlyD5qZaWwjU0hTV/TxG2BTMDB9cJ/KzmnGwOjr8CUng77px
         QJnYYjj85g9oonevtNJRQjeF0HcB2D88Q0mLC5Eo6r0IDCRz3zUXg82w1nVVr9A821q9
         f8eOHHelNHLs8xRJMNrE0CLa87hN2eDX5NdhhCiDOrXC60a+6GojhtMg9aD341+Udgz2
         JDxvohdI5zNgSACyQ+wdupJQzOEpz7pOCaGbVBH8X027IvLsaMRYr9Y+mJaCJqGuwmPK
         wAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687365052; x=1689957052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3MJUGb+fDkP6Z6i5IHVBHg7BbJ798H5n/H0dPPUYt4=;
        b=Si0YiUbrCSzB64ERVrJcev72IoViLbjz3js4GW/ObwRN4P7smJ+SiglRTEaplbusVF
         Wg6WT/0Nioc+6DwYU6Z6/7UdrXmpKImZWjyfrwPjjpvpDM2WhuSHylp8C69j+krfpPUa
         K0O/BxtxzxMeq85XQTfoBDLy2g6Oqx5GcVbdoAYNaP74J82JOQqX+ZUEzQqncltnCFH2
         H0b0qt6Q6qNrh1aq5HmwjFFu2hTn3gnCtE2eKmGcWK6GN9rEw0p2eGpnARaKMJURl6Gt
         /nR9+67i9/wP1sScBh76BpBc4JN/LVRyrEpYIG8n9kHYyEXDca4j5ifP+6VUipGgOg+0
         GZ1g==
X-Gm-Message-State: AC+VfDwFd+KlGOaI+nVwRg8a/FNVOc6wupNmxGFA+DWg+gpa9KtFZf3I
	tcOSvudRmwUznj/bjmhNvpCKUuUt51GQYIRvWPs=
X-Google-Smtp-Source: ACHHUZ5CGw/iNxIwcAGqpDnXgGYCXYTGunogXUqLJGksWEGA62I0xWtndl3pzws5uYZ+Xr8PsYCqtEoDYF6NmBD8abg=
X-Received: by 2002:a50:ee96:0:b0:51a:3307:8ec6 with SMTP id
 f22-20020a50ee96000000b0051a33078ec6mr12067541edr.11.1687365052096; Wed, 21
 Jun 2023 09:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
 <20230621161959.1061178-2-anthony.perard@citrix.com> <CAKf6xpuUUQ06KKA2NdE_Vp_rjJ0Z2RG+rm2ZnvM+DcxRouzzgA@mail.gmail.com>
In-Reply-To: <CAKf6xpuUUQ06KKA2NdE_Vp_rjJ0Z2RG+rm2ZnvM+DcxRouzzgA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Jun 2023 12:30:40 -0400
Message-ID: <CAKf6xpu-OgV+VKgicmM-83xTU3fgj=BgxMALCBPR1yXMubmbhg@mail.gmail.com>
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 12:27=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com>=
 wrote:
>
> On Wed, Jun 21, 2023 at 12:20=E2=80=AFPM Anthony PERARD
> <anthony.perard@citrix.com> wrote:
> >
> > Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
> > immediate evaluation variable type.
> >
> > ARCH and SRCARCH depends on value defined in Config.mk and aren't used
> > TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
> > sub-make or a rule.
> >
> > This will help reduce the number of times the shell rune is been
> > run.
> >
> > With GNU make 4.4, the number of execution of the command present in
> > these $(shell ) increased greatly. This is probably because as of make
> > 4.4, exported variable are also added to the environment of $(shell )
> > construct.
> >
> > Also, `make -d` shows a lot of these:
> >     Makefile:39: not recursively expanding SRCARCH to export to shell f=
unction
> >     Makefile:38: not recursively expanding ARCH to export to shell func=
tion
> >
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Tested-by: Jason Andryuk <jandryuk@gmail.com>

Tested-by: for the whole series, FYI.

Thanks,
Jason

