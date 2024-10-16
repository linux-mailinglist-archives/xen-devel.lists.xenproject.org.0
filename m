Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EC9A0848
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 13:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819981.1233476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t12A2-0001eo-It; Wed, 16 Oct 2024 11:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819981.1233476; Wed, 16 Oct 2024 11:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t12A2-0001bd-Ft; Wed, 16 Oct 2024 11:25:50 +0000
Received: by outflank-mailman (input) for mailman id 819981;
 Wed, 16 Oct 2024 11:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWiC=RM=bounce.vates.tech=bounce-md_30504962.670fa2b9.v1-617380f4ef9047b9a2ff0952e96cae54@srs-se1.protection.inumbo.net>)
 id 1t12A0-0001bX-T6
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 11:25:49 +0000
Received: from mail186-1.suw21.mandrillapp.com
 (mail186-1.suw21.mandrillapp.com [198.2.186.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 634709a8-8bb1-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 13:25:47 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4XT7tx48x3zBsThTc
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 11:25:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 617380f4ef9047b9a2ff0952e96cae54; Wed, 16 Oct 2024 11:25:45 +0000
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
X-Inumbo-ID: 634709a8-8bb1-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729077945; x=1729338445;
	bh=xJdBvOy+EJclUvodEoCbHDm83MOH2e9hpSmOv6TJ0lM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=01Xclioh1M8PVMW99432jMHypcISQv5d+WkV0/FoEg/wTBmAM43MzTs4V8soSHSvr
	 0NHohCdZ+AS7FObGnjiQ+eyuLO0VkYtTgQcjSfS5oqU3Mzm+5xlX9OCKdQNm4RRqLn
	 9Pe9gDoLb/GR0C7iLjz5UMEXFsGgjDViZOgOGKKZ+KsT5AQIZ0IHp6XhPdoLOdem4q
	 diasKgE6/62x8z01YXt/5pflBdv5+EiLcJCm12jqSRZHvrWMJ5OBCUrYAIO/uJ98JG
	 7REpWdL6BJjo9hg5ax7GDzyQEN6SltAs0ZiqW9Q1r3VCOY9f9aV9r68bn/TGgF13Y/
	 zu2skHgt50zYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729077945; x=1729338445; i=anthony.perard@vates.tech;
	bh=xJdBvOy+EJclUvodEoCbHDm83MOH2e9hpSmOv6TJ0lM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=f2u9GbUvE1+khvzJy5q8ZLMFWy5F445yj43QIgRoWoW4G1KhCoYXLMTTQgPNqXiqk
	 Vwjljc5Yh0jy6JNUpaEqTCKqIQDyVmAX/8QP9tPkcEsOe+moVM1F21H5KQNt+0bytM
	 QsszMeZKd2v8fjqyiC3DlZiQLWJQdkCHtfxBDKE6j+JZxAArpDCpGjjZWpkB8yCTdM
	 dy8DDvc5RTsFcgq4C9sNuR951o+6p17vSBDzsy/J38B200xySyBE+vxaqm7OiwLdA9
	 Yy5UXpVyXsjVA1WT5CuCn9NCKHYF97otfCE5BBiNzbZmIqIBlVZYs+ywSGvFX41K3s
	 HPfs3Bifdsvdg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/6]=20x86/boot:=20create=20a=20C=20bundle=20for=2032=20bit=20boot=20code=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729077944295
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zw+it8oVVTrS62wx@l14>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com> <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14> <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com> <Zw5zSURbpInM5oBY@l14> <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
In-Reply-To: <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.617380f4ef9047b9a2ff0952e96cae54?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241016:md
Date: Wed, 16 Oct 2024 11:25:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 09:33:32AM +0100, Frediano Ziglio wrote:
> On Tue, Oct 15, 2024 at 2:51=E2=80=AFPM Anthony PERARD <anthony.perard@va=
tes.tech> wrote:
> > On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
> > > On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD <anthony.perar=
d@vates.tech> wrote:
> > > > On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:

> > BTW, do we need the rules that generate the input of this rules
> > (built_in_32.tmp.o that is), or can this one takes all 32bit objects as
> > input?
> >
> 
> Better not to do it In some conditions it can generate slightly
> different results (like different object alignments) making the
> algorithm fail.

Ok. Thanks for the explanation.

> > > > > +# generate final object file combining and checking above binari=
es
> > > > > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_=
in_32.final.bin
> > > >
> > > > So, "other" isn't part of "final", I don't really know what those t=
wo
> > > > things contains so naming wise I can't suggest anything useful.
> >
> > Instead of "other", is "control" (like in science experiment where you
> > have a control group), or "offseted" (which seems to be how this second
> > binary is constructed) would be better names for this *.bin? It seems
> > the script take both input and play the game of the 7 differences, to
> > find clues about the location of some symbols, right?.
> >
> 
> I don't know the game and I think people not familiar with it won't
> find new names more readable but less.

Sorry, the "game" as nothing to do with the name I've proposed. I was
just asking if the script take both *.bin and was looking for
differences.

(The game of 7 differences is simple: there's two similar pictures and
you just look for the 7 differences between them, that's it.)

> Not saying that current names are good, they just need to be located
> at different addresses with some "magic" in the middle.

Well to me "other" evoke a binary that contains functions that are not
in "final", but instead they both contain the sames functions with
slight variation of placement in the file (with added offset, gap), as I
understand. But if you don't like my proposal, so be it.

> > I can think of one example where $(if_changed,) is going to really help=
,
> > by looking at this command line:
> >     One does update the .c file to add a function that they like to
> >     export, run `make`, realize they forgot to update the makefile so
> >     update it, run `make`, it's still doesn't work...
> >     Maybe run `make clean; make`, or something else...
> >
> > So, could you use $(if_changed,) ?
> > Probably:
> > quiet_cmd_combine =3D GEN     $@
> > cmd_combine =3D $(PYTHON) ...
> > $(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.f=
inal.bin FORCE
> >     $(call if_changes,combine)
> > targets +=3D built_in_32.S
> >
> > GEN, for generate, or it could be PY instead, because python script can
> > be slow to compile which could explain why the build system output is
> > making a pause on this target (on slow machines that is). Or it could b=
e
> > COMBINE, or something else, but it's not really necessary to explain,
> > the target name is often enough to figure out what's happening, when
> > needed.
> >
> 
> It just looks more complicated to me.

I'm sorry if writing makefile is complicated. GNU make doesn't help with
writing build system that work well, especially when doing incremental
builds. So we need to use more complicated construction, especially for
a complex project like Xen.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


