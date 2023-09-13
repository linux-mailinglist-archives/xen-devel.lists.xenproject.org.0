Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C5679E477
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601152.937076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMhM-0003zD-Uh; Wed, 13 Sep 2023 10:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601152.937076; Wed, 13 Sep 2023 10:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMhM-0003vy-RU; Wed, 13 Sep 2023 10:02:16 +0000
Received: by outflank-mailman (input) for mailman id 601152;
 Wed, 13 Sep 2023 10:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjWf=E5=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qgMhL-0003vs-83
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:02:15 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4e42a8-521c-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 12:02:13 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2be5e2a3c86so9500691fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 03:02:13 -0700 (PDT)
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
X-Inumbo-ID: 9c4e42a8-521c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694599332; x=1695204132; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NwSmEBgqO3nEc2/0A4axNCk/gA8cPgJ5LCtiK++GnA=;
        b=E8D3XGrqcOZQisTavheXjxxaZycan6CufZPzuLbO1x3GpW/Yc0oZ3gaEJJ2TGC+3Db
         OUSxclJriyrds7JpA0vZksDK5PdC5r1qIXXknsHk2h4RznfG7OYfPntsqwqdKVJ/84/E
         kuaB1ejZK2PcjR08avcApW61NGWo3I+huUdfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599332; x=1695204132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NwSmEBgqO3nEc2/0A4axNCk/gA8cPgJ5LCtiK++GnA=;
        b=l8jvNhPejx+TJ9lm0+XDjW9ZRfwhjlxznNA87AOrtO2oFf2M9zhTGCuLN1Qltk04LH
         2bcFBRJQHh3cPc2iunXHGtevNqwo6O5Eq9MFkjaePLU4pPqlnXeJR1aeMKpqX834GWAR
         5qP/j1VVIj29W3T5ByFvMQSEJfbPhus0mT3+OJ8MsmGDosz+T5PVJBVIbikhK81Z8emU
         Uz2iEYT7vERjL3PBC1SJcfEWIdLxT7J6MpayAObvXt/jknc0Dquvff5wcJ6Jep3M18x+
         hS0Ud1LYHNvvtr4A3hILcHXpDB8gkSo3ePKwzGGrN9UrScoLggfCXwZsVHculEpU9I6W
         D8LA==
X-Gm-Message-State: AOJu0YwpdHpHki7WxgC9pzrSIuGpr7zPxEm/vlNh+SYEMy1NtUL8f/xD
	HQIQq9ekCggfDSggntcV8NoBtZyfEi//XyvPd8cUpOpH09orojDx6MbzjA==
X-Google-Smtp-Source: AGHT+IEBxpCe7+j+BhVMKC5GA7m6a/LW+ce+w6KJW73G7Zo1/LFcEI/ySF3ZW+8pLKS9TnxX7CPisQUycsqPtOwNrQE=
X-Received: by 2002:a2e:b4ab:0:b0:2b6:9f95:8118 with SMTP id
 q11-20020a2eb4ab000000b002b69f958118mr1747686ljm.7.1694599332562; Wed, 13 Sep
 2023 03:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com> <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com> <874jjz3juk.ffs@tglx>
In-Reply-To: <874jjz3juk.ffs@tglx>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Sep 2023 11:02:01 +0100
Message-ID: <CA+zSX=awNgMH1+5s9u9=Ai9ior4bt6iDvsoMWQrbx1szDxkLsQ@mail.gmail.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Jan Beulich <jbeulich@suse.com>, Simon Gaiser <simon@invisiblethingslab.com>, 
	"committers@xenproject.org" <committers@xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 8:57=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Mon, Sep 11 2023 at 19:24, Andrew Cooper wrote:
> > Furthermore, cursory testing that Thomas did for the Linux topology wor=
k
> > demonstrates that it is broken anyway for reasons unrelated to ACPI par=
sing.
> >
> > Even furthermore, it's an area of the Xen / dom0 boundary which is
> > fundamentally broken for non-PV cases, and undocumented for the PV case=
,
> > hence why it's broken in Linux.
> >
> > Physical CPU Hotplug does not pass the bar for being anything more than
> > experimental.  It's absolutely not tech-preview level because the only
> > demo it has had in an environment (admittedly virtual) which does
> > implement the spec in a usable way demonstrates that it doesn't functio=
n.
> >
> > The fact no-one has noticed until now shows that the feature isn't used=
,
> > which comes back around full circle to the fact that Intel never made i=
t
> > work and never shipped it.
>
> OTOH it _is_ used in virtualization. KVM supports it and it just
> works. That's how I found out that XEN explodes in colourful ways :)

It should be pointed out that there's currently a start-up selling a
product that specifically runs Xen under cloud providers -- Exostellar
(was Exotanium) [1].  If cloud providers do use ACPI hotplug to allow
on-the-fly adjustments of the number of vcpus, Exostellar will
probably want support at some point.  (Perhaps it would be good to
rope them into testing / maintaining it.)

 -George

[1] https://exostellar.io/

