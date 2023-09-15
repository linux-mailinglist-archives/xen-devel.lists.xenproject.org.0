Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D57A1C8C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 12:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602993.939855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6Gh-0004Tq-Tb; Fri, 15 Sep 2023 10:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602993.939855; Fri, 15 Sep 2023 10:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6Gh-0004RM-QX; Fri, 15 Sep 2023 10:41:47 +0000
Received: by outflank-mailman (input) for mailman id 602993;
 Fri, 15 Sep 2023 10:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpI5=E7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qh6Gf-0004RE-N7
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 10:41:45 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7670fb7c-53b4-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 12:41:44 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bfd3790178so12335061fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 03:41:44 -0700 (PDT)
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
X-Inumbo-ID: 7670fb7c-53b4-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694774504; x=1695379304; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMWAkYUk1U0nK/8co63nzgeHTy5j4ysC+68EOWXmTVI=;
        b=KugrUfNdTfLXZN7TqdXpaLiqwbSmMY3IjYuOopLqsX36TIdnXUgc7aCTC/sVXdl7C0
         cglbq9nyhV1b/ws1InSqBJKkFUrFpSVE/eiI4/cBLnNBqlotpLGlqZrR3XL7NN8vj0OM
         yMmKwIvhT9+6zfDTsdVbO0UfWYPctPD2yOASU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694774504; x=1695379304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMWAkYUk1U0nK/8co63nzgeHTy5j4ysC+68EOWXmTVI=;
        b=wUc12LcTmvuE80ILmRCpHgYzF7hnB/DD0k66vvnt27Jk8xWg5UbI4KpuHp0Tv3htLW
         7v+89Qnqb8rUtPE0FH4RBxbUFvAzYJXgMAhYB7xMfHojUmk5lnBFwWGM+SBpxU27e5X4
         4iaAI+jE0bWQ83KUMPoUKHqzH2z8BOLzgR7C6F/hNqECe1LUHTXyXZqzA21lIAJjo5/r
         N7iOAiRBhb9pE6r+2rGj0dfPYMbZJZ0WOxTAqmT7PRQmpEu3l+g3ZLmU3d+GmkDq3hmN
         pmNcyU94xqFuDaH62GsnnGLr/WReA5RVHJfVprd/RY6gkZ2ZXN5T9KxzA0CEoBAm4xSL
         DdRw==
X-Gm-Message-State: AOJu0YwpoNtr9M8l/XARu8rtzigCy+p5FoZQpq7MpdQ+sijvcf7t5amf
	yUvRVr+4u8fEOMX71757ZRDGeYjK5RwW7NlMVz9acg==
X-Google-Smtp-Source: AGHT+IHAPqaqZBgoeeotd8jYnb4JXeFaDQw35/SbmYG9UV+j21gJzKQ3G7QLjsjkMc2U4GuyFt1tGxgloGsT1E8uh/E=
X-Received: by 2002:a2e:3202:0:b0:2bc:d464:1a36 with SMTP id
 y2-20020a2e3202000000b002bcd4641a36mr1197308ljy.46.1694774503681; Fri, 15 Sep
 2023 03:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com> <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com> <874jjz3juk.ffs@tglx>
 <CA+zSX=awNgMH1+5s9u9=Ai9ior4bt6iDvsoMWQrbx1szDxkLsQ@mail.gmail.com> <alpine.DEB.2.22.394.2309131616450.2295162@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2309131616450.2295162@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Sep 2023 11:41:32 +0100
Message-ID: <CA+zSX=bc6RRgAA4nqL-C2YVZhwgktvgnyUiv2hZVGFp_ngKB-w@mail.gmail.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Simon Gaiser <simon@invisiblethingslab.com>, 
	"committers@xenproject.org" <committers@xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 12:18=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 13 Sep 2023, George Dunlap wrote:
> > On Tue, Sep 12, 2023 at 8:57=E2=80=AFAM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> > >
> > > On Mon, Sep 11 2023 at 19:24, Andrew Cooper wrote:
> > > > Furthermore, cursory testing that Thomas did for the Linux topology=
 work
> > > > demonstrates that it is broken anyway for reasons unrelated to ACPI=
 parsing.
> > > >
> > > > Even furthermore, it's an area of the Xen / dom0 boundary which is
> > > > fundamentally broken for non-PV cases, and undocumented for the PV =
case,
> > > > hence why it's broken in Linux.
> > > >
> > > > Physical CPU Hotplug does not pass the bar for being anything more =
than
> > > > experimental.  It's absolutely not tech-preview level because the o=
nly
> > > > demo it has had in an environment (admittedly virtual) which does
> > > > implement the spec in a usable way demonstrates that it doesn't fun=
ction.
> > > >
> > > > The fact no-one has noticed until now shows that the feature isn't =
used,
> > > > which comes back around full circle to the fact that Intel never ma=
de it
> > > > work and never shipped it.
> > >
> > > OTOH it _is_ used in virtualization. KVM supports it and it just
> > > works. That's how I found out that XEN explodes in colourful ways :)
> >
> > It should be pointed out that there's currently a start-up selling a
> > product that specifically runs Xen under cloud providers -- Exostellar
> > (was Exotanium) [1].  If cloud providers do use ACPI hotplug to allow
> > on-the-fly adjustments of the number of vcpus, Exostellar will
> > probably want support at some point.  (Perhaps it would be good to
> > rope them into testing / maintaining it.)
>
> Supporting CPU hotplug in a nested virtualization setting is a different
> proposition compared to supporting Physical CPU Hotplug. Typically
> virtual firmware (hypervisor-provided firmware) has less unexpected
> behaviors compared to baremetal firmware.
>
> Could you make the distinction in SUPPORT.md?

People say at the moment it doesn't actually work, even under QEMU; so
"Experimental" is probably the right status.

But if someone got it working, we might add "supported, with caveats"
and specify things in a comment.

 -George

