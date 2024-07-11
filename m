Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8492E3A1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757236.1166025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqJK-0003w2-1e; Thu, 11 Jul 2024 09:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757236.1166025; Thu, 11 Jul 2024 09:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRqJJ-0003tp-VM; Thu, 11 Jul 2024 09:41:57 +0000
Received: by outflank-mailman (input) for mailman id 757236;
 Thu, 11 Jul 2024 09:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRqJI-0003tj-Az
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:41:56 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceb04af9-3f69-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 11:41:54 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77e6dd7f72so81042966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:41:54 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7985483a9bsm101025266b.109.2024.07.11.02.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:41:53 -0700 (PDT)
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
X-Inumbo-ID: ceb04af9-3f69-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720690914; x=1721295714; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U4WxI0+QsJ290d4ck/Bl8pUCYOeiMnbr0rArZs+hpa4=;
        b=bhiDjeh18g6rvR+wxA59ND43zxqJV7tsDow4VuMjp+6iRlwuYb44+0NDRk3RsrI6gh
         G35cu8eWLuC4MAbNpzyrUZFCMeIvvyYDmRqXXl/fpPlSD+AggcAQ6P+js0j06XCarQTC
         oxrbRrXB9HGITy3ANj9d7zWsUdSz6d1SBAaUNdC2dlA42Yk12MKp47iu4yPBOWLMuqaq
         S6fZAVsgsNKFpTep6nAdRXEYBwwokSe3su7UbYj5OCFW4xaYHxn9VXNZZWE/g/u1KFuz
         m3EmHWCh3uTwSqtDVBP4nVFhxR1mIwEZtC6aozNjzQ75wjrLfVuotzr2F+XQqgpYKaDN
         oGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720690914; x=1721295714;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4WxI0+QsJ290d4ck/Bl8pUCYOeiMnbr0rArZs+hpa4=;
        b=ulNjylj5v88VGk8P2/GrSH2SF4jt9W+p8xh3bSTRwUWAxDkKvCHnXKLkzyrojk0bTg
         ITf4rn6W65s9EU5B8eZMfp39VOuLD9wHm7a6RltpSDiAYosyPHm1yMERbaHLdNUpwPHB
         1eEQT2IdQm8cbE/QwO7jz0tqcMJUthXqVwvS9PpJyWDAcgdzaiPhrLBo/+PV2dPCEfQN
         aJ4cF4wTr3ghH9rUy5CMBVVyP+4ZZ8ZOc2J34lpFI1oCsnx4wzoXgIp4IKVqmeZ30gjR
         NoLko/q80a6FcKCB0YR6sBefLf0UnUP4h9kxkP/1dCdtk3q9+1oO0UeTJ103bcS4D4zf
         JX3g==
X-Forwarded-Encrypted: i=1; AJvYcCWspB6TVct4YK0ahpCne5ZTNqnM0F0s0bY3VQ6bf0hKM5Dq+NLuugKbDR2q7A2oT8x+KFWz/whqXBlv7wVOvBhG7Lmvr9xT5TbO6ydUVjk=
X-Gm-Message-State: AOJu0YyFps5aP6pSXIRNGwBTG4g7McM2iKE3PxoC0LCANY7dbw6FWpWd
	2nIt+SE0qZzSvHjLbkaEuNmDo1snE+yGGK4n8Kp/BdkfQJP6SkXn
X-Google-Smtp-Source: AGHT+IG4gK1LIbfa3BVOQAYPscAc+jT6mrpXMdyyOhuUH9RDDLqq3kvCLrVqS3FEGZXoJxQpkFeZ0w==
X-Received: by 2002:a17:906:f189:b0:a77:cca9:b216 with SMTP id a640c23a62f3a-a780b6fd816mr505858866b.33.1720690913869;
        Thu, 11 Jul 2024 02:41:53 -0700 (PDT)
Message-ID: <6777e78ac090c78a5f6778804b0527f39347dec3.camel@gmail.com>
Subject: Re: [PATCH v1 1/5] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 11:41:52 +0200
In-Reply-To: <600ad88a-8880-485b-be1e-43942a1b8615@suse.com>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <c656f0d08d4c4b515c99848b84db4171ab132f19.1720002425.git.oleksii.kurochko@gmail.com>
	 <b3c5b6d3-561d-46d0-bc1b-1b2e3cbeeba2@suse.com>
	 <d3b9070442e0ebca82ce0dd5257fe91eef4755cf.camel@gmail.com>
	 <600ad88a-8880-485b-be1e-43942a1b8615@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 11:21 +0200, Jan Beulich wrote:
> On 11.07.2024 11:00, Oleksii wrote:
> > On Wed, 2024-07-10 at 12:23 +0200, Jan Beulich wrote:
> > > On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > > > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> > > >=20
> > > > Arm's setup.c contains a collection of functions for parsing
> > > > memory
> > > > map
> > > > and other boot information from a device tree. Since these
> > > > routines
> > > > are
> > > > generally useful on any architecture that supports device tree
> > > > booting,
> > > > move them into xen/common/device-tree.
> > > >=20
> > > > Suggested-by: Julien Grall <julien@xen.org>
> > > > Signed-off-by: Shawn Anastasio
> > > > <sanastasio@raptorengineering.com>
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V5:
> > > > =C2=A0- add xen/include/xen/bootfdt.h to MAINTAINERS file.
> > > > =C2=A0- drop message "Early device tree parsing and".
> > > > =C2=A0- After rebase on top of the current staging the following
> > > > changes
> > > > were done:
> > > > =C2=A0=C2=A0 - init bootinfo variable in <common/device-tree/bootin=
fo.c>
> > > > with
> > > > BOOTINFO_INIT;
> > > > =C2=A0=C2=A0 - update the code of dt_unreserved_regions():
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related chan=
ges and getting of
> > > > reserved_mem
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() ??
> > > > =C2=A0=C2=A0 - update the code of meminfo_overlap_check():
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add check ( INVALID_PADDR =3D=
=3D bank_start ) to if case.
> > > > =C2=A0=C2=A0 - update the code of check_reserved_regions_overlap():
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related chan=
ges.
> > > > =C2=A0=C2=A0 - struct bootinfo was updated ( CONFIG_STATIC_SHM chan=
ges )
> > > > =C2=A0=C2=A0 - add shared_meminfo ( because of CONFIG_STATIC_SHM )
> > > > =C2=A0=C2=A0 - struct struct membanks was update with __struct grou=
p so
> > > > <xen/kernel> is
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 neeeded to be included in bootfdt.h
> > > > =C2=A0=C2=A0 - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT,
> > > > BOOTINFO_INIT to
> > > > generic bootfdt.h
> > > > =C2=A0=C2=A0 - bootinfo_get_reserved_mem(), bootinfo_get_mem(),
> > > > bootinfo_get_acpi(),
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() and bootinfo_get_shme=
m_extra() were
> > > > moved
> > > > to xen/bootfdt.h
> > > > =C2=A0- s/arm32/CONFIG_SEPARATE_XENHEAP/
> > > > =C2=A0- add inclusion of <xen/macros.h> because there are function
> > > > in
> > > > <xen/bootfdt.h> which
> > > > =C2=A0=C2=A0 are using container_of().
> > >=20
> > > Just to mention it: This is confusing. The series is tagged "v1".
> > > I
> > > understand
> > > you took Shawn's work, which had already undergone revisions. But
> > > then imo you
> > > want to at least clarify how your v1 relates to his v4 or v5,
> > > i.e.
> > > then making
> > > clear to the reader whether all of the changes above were
> > > actually
> > > done by you
> > > on top of an earlier v4, or whether you took the earlier v5
> > > verbatim.
> > That is why I wrote "Changes in v5" to show that these changes were
> > done on top of v4 version of Shawn's series, so what is mentioned
> > in v5
> > here it is what was done by me.
>=20
> Except that what you sent is v1, not v5.
>=20
> > I'll reword that and probably I shouldn't drop "Changes in
> > v4,3,2,1"
> > from Shawn's patch.
>=20
> I don't think you should drop anything. You want to clarify
> relationship
> of the version of your series with that of Shawn's earlier one. Or
> you'd
> want to continue numbering from what the previous series had, yet
> that
> may then also end up confusing if Shawn resumed work there.
Oh, I understood now what you meant. The Patch should be with the name:
[PATCH *v5* 1/5] xen/device-tree: Move Arm's setup.c bootinfo functions
to common

I will update that. Thanks.

~ Oleksii

