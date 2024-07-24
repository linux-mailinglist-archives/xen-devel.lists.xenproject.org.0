Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166093B3DE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764378.1174820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe38-0006wb-4t; Wed, 24 Jul 2024 15:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764378.1174820; Wed, 24 Jul 2024 15:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe38-0006ug-2I; Wed, 24 Jul 2024 15:37:06 +0000
Received: by outflank-mailman (input) for mailman id 764378;
 Wed, 24 Jul 2024 15:37:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWe36-0005XQ-LM
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:37:04 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93083a68-49d2-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:37:03 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso5688582e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:37:03 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef5571e54sm1926821e87.201.2024.07.24.08.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:37:02 -0700 (PDT)
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
X-Inumbo-ID: 93083a68-49d2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835422; x=1722440222; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xwhjoxlxMG+4UFTMGiDrbv+iUC/5fTZUmfSjb0fcIrc=;
        b=TI1yJ74m4yshLdls81eW/CRxNRitaqvseE6ErMeHy3zcIUofZID3Qbad0ZehqeuqDV
         MOkKVq8yX/ZG0pvjD+OdfsuxQbkmWIO1aX79YOZ1oB0rJ3fpiBlyMpfHXM9ntDydLgae
         XhD3sD1L6ndJHX4hW4sE0uf+WO5UoqXlX8oMSpTS6rACKQBd+AWn9llbrF2XTrUEDLJV
         ZrPGz7vqVdd7FTsa8yU5kkP6pdh+DVpeOY4601Ar9+YwLHSHPaEswiNdxLQb0wCsvknr
         RyNPgTywhn/uTjKcZG2ExXGJWQYfXm95WnJ7LFq8vkBn0zDejbSwJteNfxH7jywulY0G
         XGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835422; x=1722440222;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwhjoxlxMG+4UFTMGiDrbv+iUC/5fTZUmfSjb0fcIrc=;
        b=FCnsFPF2VgNgsKL0whHg2o0R649CcupFEGNla+m0wRbEwHHGlLrbhUS2pWSzgby7uK
         rVdWSARIncKKHvmcxnyGQzBaYhA6h5BtB6FDyFuashTFD/Yuvr5bC1mf7vfrCSBc6ZC6
         e6mX0KXlPwoF/z80kBC49zYumAoCZfoyQSfKYrZ5ak93ocyTssoRt8TTIzYiSNPs9N4R
         aJtZvoCaEIm86nuPdzl018Cz+u56B7UNbnT91NZg5VFXVYEuuMu5cqKMgS0qh1muUQ4r
         jkjAWQwIFKa1fpSebEb3bs9BQJCKGx5NrqrEzAztaSrXSlp9h4JO2PAeZiMkwlt5BM5s
         tXOA==
X-Forwarded-Encrypted: i=1; AJvYcCX+q6DiBKJXvqbvyPJ9HLuzzROqguqXyrgHCmhq3wOlj5TukO2gd9RLLbGMSV8xrIcJssfW8ZAQdj1QDnyJfPUZqjANWPly5UGwEvtRMkE=
X-Gm-Message-State: AOJu0YxmKdpVBUA9vdSYGQMmmu8cRttyvkw1DQfKlZx5ucaZunLv2IVT
	WUUO9tR3AFadMp0Hfg6Oit9Ufu0ARo89VA9bEE5TyMgFugL6/CgMaj7+B0BE
X-Google-Smtp-Source: AGHT+IFDceC437g+qwBiulIxDWfM5hGskr0tnjtoW1ZWxgm3Y129gpGd8HiZipfg5+4y+sm8BBirgA==
X-Received: by 2002:a05:6512:10cf:b0:52e:fa35:15a4 with SMTP id 2adb3069b0e04-52fd3f1f72dmr49560e87.33.1721835422379;
        Wed, 24 Jul 2024 08:37:02 -0700 (PDT)
Message-ID: <3dd8e6e3934279f4a9afff7c88da57777ecec633.camel@gmail.com>
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
From: oleksii.kurochko@gmail.com
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Jason Andryuk <jason.andryuk@amd.com>, Jason Andryuk
 <jandryuk@gmail.com>,  xen-devel@lists.xenproject.org
Date: Wed, 24 Jul 2024 17:37:01 +0200
In-Reply-To: <ZqDqcoY4e0p2UJ3v@l14>
References: <20240715234631.4468-1-jandryuk@gmail.com>
	 <Zp/GcCUVPX/d/7qx@l14> <ac3d7bcd-6ed8-4ded-bb5d-ab9c228e9579@amd.com>
	 <8a185aeabe4b3928906036590affbec8658bf226.camel@gmail.com>
	 <ZqDqcoY4e0p2UJ3v@l14>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-24 at 11:50 +0000, Anthony PERARD wrote:
> On Tue, Jul 23, 2024 at 07:31:58PM +0200,
> oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-07-23 at 11:04 -0400, Jason Andryuk wrote:
> > > Oleksii, this is a fix (for an incomplete fix) for 4.19.=C2=A0
> > > 76a484193d=20
> > > broke compatibility for block-tap with the blktap2 kernel model
> > > (when
> > > adding support for tapback).=C2=A0 This finishes restoring blktap2
> > > support.
> > >=20
> > > I realize it's late in the release if you don't want to take it.
> > It's pretty late but I just wanted to clarify:
> > 1. Is so critical that we should have this in 4.19?
>=20
> I don't think it's critical enough to justify delaying the release.
> blktap2 is I think an out-of-tree kernel module so probably not very
> used.
> We might want to at least put a note in "known issue" about blktap2
> support by the "block-tap" script been broken.
It was merged and I think it won't delay a release as this feature is
disabled by default.

~ Oleksii

>=20
> > 2. If we won't take it now, then will it be backported anyway?
>=20
> Yes, we want to backport that as soon as 4.19 tree is open for
> backports, to have the fix in 4.19.1.
>=20
> Cheers,
>=20


