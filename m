Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E1975ED83
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568487.887826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNquk-0001UB-Du; Mon, 24 Jul 2023 08:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568487.887826; Mon, 24 Jul 2023 08:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNquk-0001RZ-AU; Mon, 24 Jul 2023 08:27:34 +0000
Received: by outflank-mailman (input) for mailman id 568487;
 Mon, 24 Jul 2023 08:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNqui-0000Yk-Oc
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:27:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1215b6-29fb-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 10:27:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9923833737eso598944866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 01:27:32 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 xo18-20020a170907bb9200b0099b5a71b0bfsm6173112ejc.94.2023.07.24.01.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 01:27:30 -0700 (PDT)
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
X-Inumbo-ID: ef1215b6-29fb-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690187251; x=1690792051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oDM+O9TwQTPY83TgZyOpL4QH+TDWcxO4fMX5Irgc2Nc=;
        b=mGYIaghdHbxdLeAcjqF/WB4DcAECBxTMDXnyfnuQ4RSd9oib+Gibtv1hawU+08inep
         s8wuGiqq5TphUOam7uraxV08mZQmgzHePlLsGFvmc1ngdUq4SfZvvzJUFIaDkN3LuYKc
         yDGuN+KUly77S3va7rpPbYe+4i3+QmS/bcd9z6sBdSYPswsm6mwuQb7Ykv4A7/D0wviA
         WPV1Omw/TFf2xzv+meUW+DIql5iNc9mqr3peZFBVdu9B9GjVhZmbxXhj70KGWmfhEQ6D
         3JDhaJA/ilmh0Kug1/jBA74WIttHopTxCWAQMBfzDd5fs4aF1q23Tg+ls9xpdt1R6iwX
         LJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690187251; x=1690792051;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oDM+O9TwQTPY83TgZyOpL4QH+TDWcxO4fMX5Irgc2Nc=;
        b=kJnAPdwv3YSiyQVBxE/+E9XvWehW4fqLbUECF6xxxRJ+HLYylZnJyPbt9RTHyl9fkk
         TSKRzXwT7UbQewIEV30fuS9Z+uwVxCKVHzsOW4mHq2wjM+v3C+EHPcTEvyedirukJ+zh
         HN0uXjaFgHpjZWNKLPTfedhSeGojwsIJeyUSSpd7GTNKlzL6oVoywn/xG5ydjQf5yGOv
         h3kAq/0H+RkxtCHm4j0DcxUkoksr2L8A1JgN9DS29kxizCEfhY8T4f+b9qmz2aIT0lWv
         OdHOOHh/AEjDP74EMylzKPfk6ow7TwBlImrE/OCX0TvY3oFLmMvGr56XEbRGowkTQiBq
         apOQ==
X-Gm-Message-State: ABy/qLaaVc23O2MjRhdkyly2jYuK9OgyL5savKQHju/7X9dWYTKgMEl4
	Kv82H3fm2vavHUdrf8UKwXM=
X-Google-Smtp-Source: APBJJlG/J+qQBa2YvAtpv3uz1KuaXp3uqDWTGKbpHoLwWhDO0R1IIWbzDTDngJipkPdEMd9Qd5yb1Q==
X-Received: by 2002:a17:906:8a43:b0:99b:4bab:2839 with SMTP id gx3-20020a1709068a4300b0099b4bab2839mr9443885ejc.55.1690187251298;
        Mon, 24 Jul 2023 01:27:31 -0700 (PDT)
Message-ID: <ccfad0f751df1e498d1c5cea3eb373e263f91d00.camel@gmail.com>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Marek
	=?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>, andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	"committers@xenproject.org"
	 <committers@xenproject.org>
Date: Mon, 24 Jul 2023 11:27:30 +0300
In-Reply-To: <alpine.DEB.2.22.394.2307211811020.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
	 <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
	 <ZLVLaPeyOwDYYUXL@mail-itl>
	 <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>
	 <ZLsd3tdSvTLwIyt3@mail-itl>
	 <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>
	 <ZLshtl8KKgyR1wlY@mail-itl>
	 <alpine.DEB.2.22.394.2307211749270.3118466@ubuntu-linux-20-04-desktop>
	 <ZLsqSWXvwxBQK3NG@mail-itl>
	 <alpine.DEB.2.22.394.2307211811020.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi Stefano,

On Fri, 2023-07-21 at 18:18 -0700, Stefano Stabellini wrote:
> Hi Andrew, Oleksii,
>=20
> Please see below.
>=20
> It looks like you have configured your personal repositories to
> mirror
> upstream Xen:
>=20
> https://gitlab.com/xen-project/people/olkur/xen
> https://gitlab.com/xen-project/people/andyhhp/xen
>=20
> Make sure that the option "Trigger pipelines for mirror updates" is
> unselected.
>=20
> If you setup the mirror a long time ago, you might want to stop the
> mirror and start it again.
>=20
> I have just done the same for fusa/xen-integration: I had to go to
> settings->repository, stop the existing mirror, and create a new one
> making sure "Trigger pipelines for mirror updates" is off.
I checked the option is unselected.

But I have selected "Mirror all branches" in "Mirror branches".
I can use "Mirror specific branches" to avoid 'staging' mirroring.

Will it be enough?

~ Oleksii
>=20
>=20
>=20
> On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jul 21, 2023 at 05:49:49PM -0700, Stefano Stabellini wrote:
> > > On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Fri, Jul 21, 2023 at 05:14:01PM -0700, Stefano Stabellini
> > > > wrote:
> > > > > On Sat, 22 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano
> > > > > > Stabellini wrote:
> > > > > > > On Mon, 17 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper
> > > > > > > > wrote:
> > > > > > > > > On 17/07/2023 2:09 pm, Marek Marczykowski-G=C3=B3recki
> > > > > > > > > wrote:
> > > > > > > > > > "staging" branch is mirrored (automatically or
> > > > > > > > > > manually) to several
> > > > > > > > > > repositories. Avoid building it several times to
> > > > > > > > > > not waste runner
> > > > > > > > > > resources.
> > > > > > >=20
> > > > > > > Hi Marek,
> > > > > > >=20
> > > > > > > Let me try to understand the use-case a bit better. You
> > > > > > > would like the
> > > > > > > following "staging" branch to run a full pipeline:
> > > > > > > https://gitlab.com/xen-project/xen
> > > > > > >=20
> > > > > > > But if someone under xen-project/people is mirroring
> > > > > > > https://gitlab.com/xen-project/xen, this patch is
> > > > > > > attempting to skip the
> > > > > > > additional pipeline. For instance, if I am mirroring
> > > > > > > staging in my
> > > > > > > personal repo:
> > > > > > >=20
> > > > > > > https://gitlab.com/xen-project/people/sstabellini/xen
> > > > > > >=20
> > > > > > > We are skipping the additional pipeline there.
> > > > > >=20
> > > > > > Yes.
> > > > > >=20
> > > > > > > Is that correct? If so, it would be easier to ask
> > > > > > > everyone to make sure
> > > > > > > they have "Trigger pipelines for mirror updates"
> > > > > > > unselected:
> > > > > > >=20
> > > > > > > https://docs.gitlab.com/ee/user/project/repository/mirror/pul=
l.html#trigger-pipelines-for-mirror-updates
> > > > > >=20
> > > > > > If that's set in gitlab as pull mirror (instead of push
> > > > > > from somewhere
> > > > > > else), then that indeed may be enough. But is it really in
> > > > > > all those
> > > > > > cases?
> > > > >=20
> > > > > Yes, it is an option in the pull mirror, by default should be
> > > > > unselected
> > > > > I believe.
> > > >=20
> > > > Well, if that's the case, either it got manually enabled on
> > > > those 4 (?)
> > > > forks, or those are using something else for mirroring the
> > > > staging
> > > > branch (in which case, the setting would not help). I can't see
> > > > this
> > > > part of the settings in other's repositories, so I don't know.
> > >=20
> > > Do you know the name of those 4 forks? I can help figure it out.
> >=20
> > Looking at "activity" view on gitlab, I see those:
> > https://gitlab.com/xen-project/fusa/xen-integration
> > https://gitlab.com/xen-project/people/olkur/xen
> > https://gitlab.com/xen-project/people/andyhhp/xen
> >=20
> > There are few more that have staging branch almost up to date, but
> > seems
> > to be pushed manually (based on it being not fully up to date) and
> > less
> > often.
> >=20
> > --=20
> > Best Regards,
> > Marek Marczykowski-G=C3=B3recki
> > Invisible Things Lab


