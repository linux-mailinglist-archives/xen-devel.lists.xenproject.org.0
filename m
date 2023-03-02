Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A76A7BE6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 08:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504382.777027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdSd-0006rV-2R; Thu, 02 Mar 2023 07:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504382.777027; Thu, 02 Mar 2023 07:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdSc-0006oq-Vo; Thu, 02 Mar 2023 07:34:42 +0000
Received: by outflank-mailman (input) for mailman id 504382;
 Thu, 02 Mar 2023 07:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXdSa-0006oj-K1
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 07:34:40 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b046363b-b8cc-11ed-96a9-2f268f93b82a;
 Thu, 02 Mar 2023 08:34:38 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id s22so20923592lfi.9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 23:34:38 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 u12-20020ac2518c000000b004dc4bba8fa6sm2018653lfi.164.2023.03.01.23.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 23:34:37 -0800 (PST)
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
X-Inumbo-ID: b046363b-b8cc-11ed-96a9-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677742478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZmnKQ3RloZIRJndumLQzxh0LauPdJrZ1rvwxEFJRLk=;
        b=ZMvJek+l4Y3x42OuvdyGN2j5stXjg+hiVqwXW/Xkh5LLZfK09vLRUdW3z/LzVKuaHT
         h6kxcvWeriXgZJ07wmJJBVExDgol7wrl9BKBsqPNzir+pVATPrIosFX/xjZODZwb0E2W
         UIS/778f2hBy4jxmd80Jb2lyaH5y+OfVpNQwSwYSe+ROI2HX4egGI3MHrDZbjyMxCVMJ
         ciUn33lkwwMqRh0PBTfYWWQIbO8pzq8FAL3x4dikHUi8wvkVXTA8dk88DEUbiAQrP9gW
         z/LdUJwAr+1496+0tN1eI4FQSMARJ0nuBPBZ/dK0n9EzbnDtMVn2ZBcQBinrhx2bDzOe
         SKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677742478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZmnKQ3RloZIRJndumLQzxh0LauPdJrZ1rvwxEFJRLk=;
        b=KGXRIKirLhVZteN38HnsyHZBs2qudBaEQ0ZNWqK8bwWlZCfBK3ojj3Fj7epmyAtDWd
         Jsm/rB4Jmu/HFN7uybOH2D1O3AQbOtB7rb/mmxeKON00/RitTFroO4m7IEpiXoax5oBB
         +rt5dO4HGTObpnFVeMjvNNTs/5NqhD3vevQv/YTLKr1YOwlZBiK+gditzmXZ6YulpYDv
         32DEzmwkKZk0N87NCOwlSamHswYkzcrxQ0cIi1kILcqffEwMhAB3b0FNnuxSDinRKO6Y
         Hn0zQTeSYjNjf/VJ6zOtuNM24ftTINR1DJyGZrXQ7VhXSIQsh2SQYOsO9URcPjT4MN16
         8Kww==
X-Gm-Message-State: AO0yUKVvdLwhWqWh1Qiw+V3Ye6ivOhTgRSchxgrSmSYpkdD5CBmDN/Ms
	2MC/VlOoZ/G4OWa4XU/xLcBAP43ouBI=
X-Google-Smtp-Source: AK7set9FDxwAXhEPPnPIW4VArHuxU0QkkXOQEC6lHKGAMGTyQwhHgaNbk4TkN2V1oNH2bPRDW/Oz7w==
X-Received: by 2002:ac2:4828:0:b0:4a4:68b9:6085 with SMTP id 8-20020ac24828000000b004a468b96085mr2524484lft.16.1677742478107;
        Wed, 01 Mar 2023 23:34:38 -0800 (PST)
Message-ID: <472fee066070db9cb3c662bf5cc6f8cb681aeb1b.camel@gmail.com>
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Thu, 02 Mar 2023 09:34:36 +0200
In-Reply-To: <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
References: 
	<74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
	 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
	 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
	 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
	 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,
> > > On Wed, 2023-03-01 at 16:21 +0000, Julien Grall wrote:
> > > > Hi Oleksii,
> > > >=20
> > > > On 01/03/2023 16:14, Oleksii Kurochko wrote:
> > > > > During testing of bug.h's macros generic implementation
> > > > > yocto-
> > > > > qemuarm
> > > > > job crashed with data abort:
> > > >=20
> > > > The commit message is lacking some information. You are telling
> > > > us
> > > > that
> > > > there is an error when building with your series, but this
> > > > doesn't
> > > > tell
> > > > me why this is the correct fix.
> > > >=20
> > > > This is also why I asked to have the xen binary because I want
> > > > to
> > > > check
> > > > whether this was a latent bug in Xen or your series effectively
> > > > introduce a bug.
> > > >=20
> > > > Note that regardless what I just wrote this is a good idea to
> > > > align
> > > > __proc_info_start. I will try to have a closer look later and
> > > > propose
> > > > a
> > > > commit message and/or any action for your other series.
> > > Regarding binaries please take a look here:
> > > https://lore.kernel.org/xen-devel/aa2862eacccfb0574859bf4cda8f4992baa=
5d2e1.camel@gmail.com/
> > >=20
> > > I am not sure if you get my answer as I had the message from
> > > delivery
> > > server that it was blocked for some reason.
> >=20
> > I got the answer. The problem now is gitlab only keep the artifact
> > for=20
> > the latest build and it only provide a zImage (having the ELF would
> > be=20
> > easier).
> >=20
> > I will try to reproduce the error on my end.
>=20
> I managed to reproduce it. It looks like that after your bug patch,=20
> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch,
> all the messages will be in .rodata.str. Now they are in
> .bug_frames.*,=20
> so there some difference in .rodata.*.
>=20
> That said, it is not entirely clear why we never seen the issue
> before=20
> because my guessing there are no guarantee that .rodata.* will be=20
> suitably aligned.
>=20
> Anyway, here a proposal for the commit message:
>=20
> "
> xen/arm: Ensure the start *(.proc.info) of is 4-byte aligned
>=20
> The entries in *(.proc.info) are expected to be 4-byte aligned and
> the=20
> compiler will access them using 4-byte load instructions. On Arm32,
> the=20
> alignment is strictly enforced by the processor and will result to a=20
> data abort if it is not correct.
>=20
> However, the linker script doesn't encode this requirement. So we are
> at=20
> the mercy of the compiler/linker to have aligned the previous
> sections=20
> suitably.
>=20
> This was spotted when trying to use the upcoming generic bug=20
> infrastructure with the compiler provided by Yocto.
>=20
> Link:=20
> https://lore.kernel.org/xen-devel/6735859208c6dcb7320f89664ae298005f70827=
b.camel@gmail.com/
> "
>=20
> If you are happy with the proposed commit message, then I can update
> it=20
> while committing.
I am happy with the proposed commit message.

Thanks a lot.

~ Oleksii

