Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131147AA8AF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 08:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606713.944725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjZDd-0007Ma-LY; Fri, 22 Sep 2023 06:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606713.944725; Fri, 22 Sep 2023 06:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjZDd-0007KP-Iv; Fri, 22 Sep 2023 06:00:49 +0000
Received: by outflank-mailman (input) for mailman id 606713;
 Fri, 22 Sep 2023 06:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6t7=FG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qjZDc-0007KI-Db
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 06:00:48 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fb2fef2-590d-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 08:00:47 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c038a1e2e6so27071941fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 23:00:47 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z6-20020ac25de6000000b00503555aa934sm598764lfq.11.2023.09.21.23.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 23:00:45 -0700 (PDT)
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
X-Inumbo-ID: 5fb2fef2-590d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695362446; x=1695967246; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y/Tq2bMRE4SHQEWwl4v3TwpscyHnBwMQzkwXRyf3+jQ=;
        b=M9f5atU1VK/ZQ7feHsAjqKumN4mIkWEZYkkhwZqBi/gAhHVFw0C4rOMCrdmnaV0iRE
         hBOghfi73YUfSBKbAqKmc2YVj0ZECYpI6UIYrb3TldN3zEmjGXqvWApSrcLgpw/TdFuC
         q0PzpSJzMjCQd5fC9eEYv1qKMl9WOaxKwFkr+x4guxq0vkNAG/wdVKNXNBWEjo7zuka0
         Ay5d87UoHiOUsGNN0zKUCrgZ8Xbc7ReIZxHggpYLBvAlZAuFoCSS+eljUN3pdV/Fq1VQ
         X37+6tP7ieqEgakPGQt04tP2QkPIZ2uRNqKDyHcR6usC3wQhFmyaitf6n5u/sfnldfYA
         YL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695362446; x=1695967246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/Tq2bMRE4SHQEWwl4v3TwpscyHnBwMQzkwXRyf3+jQ=;
        b=hDPCUcrFfh05+VoKlA3qpmdHrM8NKzxddj305h6lqYFommMOjPkqbQo6BBgaDbQnd4
         QLcsekh3ywIDBzDa0Q1BXQn0RA+LoFHwyV+z1FOiZrN82kazfRMFU3RR/tMyUtbCXKMT
         hljvUuw7O/P/4GIyQyCjrh+Tpp3eXnx7USgzs3CvoW+b3LSbKWU1HCDYs2gmP7wktEg/
         KFSp5u3kZvG2Rw0gigaKIhV/GYrCoq4wZ+lVsGfScTBi7X7udRQX++uWIlFuztZt+Z8C
         7KwcT27DPLXW7oiJHSbKMoHanIN9PyDO95rNYqh1WEWC5lciEHj/AyBsL+nY9SRelaz9
         Rr/w==
X-Gm-Message-State: AOJu0YwP+CNW9UK0aZ87IrgoZz66OOiKxSBHh6i4kw7PZjGc6Khq+wLW
	9OaVnpBLarxnjyCqtUNR6os=
X-Google-Smtp-Source: AGHT+IGnELsHNkP2GOzjUMu1XF0JKcPCEUHkc0iuoamrbiJskJPNushLsk1EaXIJI7CFQkU8L71YLw==
X-Received: by 2002:a19:915a:0:b0:4ff:ae42:19e2 with SMTP id y26-20020a19915a000000b004ffae4219e2mr5775712lfj.58.1695362446215;
        Thu, 21 Sep 2023 23:00:46 -0700 (PDT)
Message-ID: <a05c39b64004398fbb42ec83a452fa7af6603f95.camel@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Fri, 22 Sep 2023 09:00:44 +0300
In-Reply-To: <7d59acfd-26d0-bb9b-568e-d273252d1f2c@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
	 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
	 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
	 <09d0449004162ccd339e9e8559b7efad3e2335bb.camel@gmail.com>
	 <7d59acfd-26d0-bb9b-568e-d273252d1f2c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-09-18 at 14:38 +0200, Jan Beulich wrote:
> On 18.09.2023 14:05, Oleksii wrote:
> > On Mon, 2023-09-18 at 11:29 +0200, Jan Beulich wrote:
> > > On 18.09.2023 10:51, Oleksii wrote:
> > > > On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
> > > > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > > > Based on two patch series [1] and [2], the idea of which is
> > > > > > to
> > > > > > provide minimal
> > > > > > amount of things for a complete Xen build, a large amount
> > > > > > of
> > > > > > headers are the same
> > > > > > or almost the same, so it makes sense to move them to asm-
> > > > > > generic.
> > > > > >=20
> > > > > > Also, providing such stub headers should help future
> > > > > > architectures
> > > > > > to add
> > > > > > a full Xen build.
> > > > > >=20
> > > > > > [1]
> > > > > > https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastas=
io@raptorengineering.com/
> > > > > > [2]
> > > > > > https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.=
kurochko@gmail.com/
> > > > > >=20
> > > > > > Oleksii Kurochko (29):
> > > > > > =C2=A0 xen/asm-generic: introduce stub header spinlock.h
> > > > >=20
> > > > > At the example of this, personally I think this goes too far.
> > > > > Headers
> > > > > in
> > > > > asm-generic should be for the case where an arch elects to
> > > > > not
> > > > > implement
> > > > > certain functionality. Clearly spinlocks are required
> > > > > uniformly.
> > > > It makes sense. Then I will back to the option [2] where I
> > > > introduced
> > > > all this headers as part of RISC-V architecture.=20
> > >=20
> > > You did see though that in a reply to my own mail I said I take
> > > back
> > > the
> > > comment, at least as far as this header (and perhaps several
> > > others)
> > > are
> > > concerned.
> > >=20
> > I missed that comment on the patch about spinlock.
> >=20
> > Well, then, I don't fully understand the criteria.
> >=20
> > What about empty headers or temporary empty headers?
> >=20
> > For example, asm/xenoprof.h is empty for all arches except x86, so
> > it
> > is a good candidate for asm-generic.
>=20
> That's an example where I think it is wrong (or at least unnecessary)
> for
> the xen/ header to include the asm/ one irrespective of the
> controlling
> CONFIG_* setting. From what I can tell common code would build fine
> with
> the #include moved; x86 code may require an adjustment or two. IOW
> this
> is a case where I think preferably presence of an arch header was
> required only when XENOPROF can actually be yet to y in Kconfig.
>=20
> > But asm/grant_table.h is empty for PPC and RISC-V for now but won't
> > be
> > empty in the future. Does it make sense to put them to asm-generic?
> > The
> > only benefit I see is that in future architecture if they follow
> > the
> > same way of adding support for the arch to Xen, they will face the
> > same
> > issue: building full Xen requires this empty header.
>=20
> Here I can see different ways of looking at it. Personally I'd prefer
> stub headers to be used only if, for the foreseeable future, they are
> intended to remain in use. grant_table.h pretty clearly doesn't fall
> in
> this category. (You may want to peek at what's being done on the PPC
> side. Nevertheless some of what's done there could likely benefit
> from
> what you're doing here.)
>=20
> > So, should I wait for some time on other patches of the patch
> > series?
>=20
> Well, afaic I'd prefer if I got a chance to look over at least some
> more
> of the patches in this series. But you're of course free to submit a
> v2
> at any time.
I think that it will be better to wait for some time not to produce
unnecessary patches.

~ Oleksii

