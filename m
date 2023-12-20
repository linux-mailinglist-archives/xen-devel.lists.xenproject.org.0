Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85381A2D2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658144.1027197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFydZ-0003We-60; Wed, 20 Dec 2023 15:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658144.1027197; Wed, 20 Dec 2023 15:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFydZ-0003Uc-3P; Wed, 20 Dec 2023 15:37:33 +0000
Received: by outflank-mailman (input) for mailman id 658144;
 Wed, 20 Dec 2023 15:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4Ro=H7=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rFydW-0003UW-L8
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 15:37:30 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad3dc224-9f4d-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 16:37:28 +0100 (CET)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172]) by mx.zohomail.com
 with SMTPS id 1703086642517653.2102363842461;
 Wed, 20 Dec 2023 07:37:22 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-da7ea62e76cso4973596276.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 07:37:22 -0800 (PST)
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
X-Inumbo-ID: ad3dc224-9f4d-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1703086644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lkCANh5Kxun4f8cObhv2Araq+bpUiTcmYgk6ijqpGcr+oyUw3kFQLpG1XuWj5puigVQZ0/7yQAPBau9XqlUJYLJ57LgITikukHZ+sz2xlwa/6GNWmZwMn3vH+SWbW4YInZ5UfgSuIxfYk5We3gU3Ml1eq7/8P7eIC5A998kHYvM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1703086644; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6U9a4uRDTNsmkYKcRYzRibfZvUVAXurmlYHaLYqv7Zs=; 
	b=eIlijL4kbLliyucm4H5oHIqpe9VqaSrBpabsj8JEL6GQs5nI3UdNoBRUfu8bhvAKFWdz1RRAf3GV+NKhSJbSmfOSsC/Pk7ADluXuHdp+40BNUuV+4FK8Yj964tKj5wPw2JDPJ4DJBRFwt46/bIKS+ba2HZAf4i52lba2vl5ZMlY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1703086644;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6U9a4uRDTNsmkYKcRYzRibfZvUVAXurmlYHaLYqv7Zs=;
	b=XVgsNa82xZDDpD+dm2dTA8C4mLNN/vSnfQQY26EdXbZtc4ftX+CfgNbupH8Hz2rU
	Bo6VFM6pu3Dri3xcMQCRBlxsYfy9lnhbxoe+hiElFGEXt5vU81AtcVvzkyN7NLNTkAo
	3i4QMygiiQePS50RoQB0UipF+GfZA97BDjK5mU54=
X-Gm-Message-State: AOJu0YxaKGf1hLAW8D86y3Wrro5YsljmvZncZkw4t0l0htMMGlWyXcMZ
	GJSfZBU8hA/PRK/NTZnz+Nezu9lfJR2b0/mZONc=
X-Google-Smtp-Source: AGHT+IFgcmKVzBP9rA8I7+nIm0AKmy3543ZK6MJ3Qu8cDNW8CYY2lotMOE4IjxxklurRltCDmAA1kCI8fVIkm4Chu+w=
X-Received: by 2002:a25:d749:0:b0:dbd:2f1:c6eb with SMTP id
 o70-20020a25d749000000b00dbd02f1c6ebmr4837888ybg.64.1703086641597; Wed, 20
 Dec 2023 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <d7a015aaa54fb4722d4970f0f40789efe4d994f9.1703066935.git.federico.serafini@bugseng.com>
 <929aea0c-722e-46fe-aee4-a5c87ad22bd4@xen.org>
In-Reply-To: <929aea0c-722e-46fe-aee4-a5c87ad22bd4@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 20 Dec 2023 10:36:44 -0500
X-Gmail-Original-Message-ID: <CABfawhnejjZ92Wt0sMVGS1F0ee5rEB9HDsDJ-wuw71h_GGtM-w@mail.gmail.com>
Message-ID: <CABfawhnejjZ92Wt0sMVGS1F0ee5rEB9HDsDJ-wuw71h_GGtM-w@mail.gmail.com>
Subject: Re: [XEN PATCH 4/7] xen/arm: mem_access: address violations of MISRA
 C:2012 Rule 16.3
To: Julien Grall <julien@xen.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>, xen-devel@lists.xenproject.org, 
	consulting@bugseng.com, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 6:53=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Federico,
>
> On 20/12/2023 11:03, Federico Serafini wrote:
> > Refactor of the code to have a break statement at the end of the
> > switch-clause. This addresses violations of Rule 16.3
> > ("An unconditional `break' statement shall terminate every
> > switch-clause").
> > No functional change.
> >
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > ---
> >   xen/arch/arm/mem_access.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
> > index 31db846354..fbcb5471f7 100644
> > --- a/xen/arch/arm/mem_access.c
> > +++ b/xen/arch/arm/mem_access.c
> > @@ -168,10 +168,10 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, un=
signed long flag,
> >            * If this was a read then it was because of mem_access, but =
if it was
> >            * a write then the original get_page_from_gva fault was corr=
ect.
> >            */
> > -        if ( flag =3D=3D GV2M_READ )
> > -            break;
> > -        else
> > +        if ( flag !=3D GV2M_READ )
> >               goto err;
> > +
> > +        break;
>
> On both hunks, I find the original version better as it is easier to
> match with the comment. I also understand that it wouldn't be great to
> add a deviation for this construct. So maybe we should tweak a bit the
> comment?

Simplifying the if-else to a single if is fine by me. Adjusting the
comment to reflect the new logic would help though, so +1 to Julien's
comment.

Thanks,
Tamas

