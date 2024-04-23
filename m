Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EE8AF9C5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 23:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710974.1110565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzNv8-0002E3-7B; Tue, 23 Apr 2024 21:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710974.1110565; Tue, 23 Apr 2024 21:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzNv8-0002Bd-42; Tue, 23 Apr 2024 21:43:22 +0000
Received: by outflank-mailman (input) for mailman id 710974;
 Tue, 23 Apr 2024 21:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNrv=L4=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rzNv7-0002BX-Fj
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 21:43:21 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d343e5c-01ba-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 23:43:16 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1713908590324224.72219716572988;
 Tue, 23 Apr 2024 14:43:10 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-de54c2a4145so1568752276.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 14:43:10 -0700 (PDT)
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
X-Inumbo-ID: 7d343e5c-01ba-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1713908592; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I2CKrchAbM9+Re4wxzNCDdQx2tLJKrH5HzPMESLh9jk1daem1Qi+CBDgsgX0Kw87Krz4KQZaGsm5JiEzWsT2C/IHLyDKEiVB6fBrAsUNhFxguJJy7Us8T5sF4OG2cfMRI/JG875L/uwgXB+12PgprpfPSapT25iUKyfdIO9UWyM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713908592; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+ho+z/vBG8zzBJL47nvqisaOHcKNvWKmal8g+lRcZKM=; 
	b=G2ZoATUQDlXAIvSpGfxLzC2fsZvrjRs/4nBScukhfPWOlYnznzH9VlHvynBOMB6HgOpUZ5zqGu4oDN8H1GbN3sJWaIw3k/CtGXYQyJieshnFOLFPaR1Ku0eCMgLW3pFaWz4NIbKj/DjytI7EDRLhuxJVPomEpdedbJYDG/C8W2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713908592;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+ho+z/vBG8zzBJL47nvqisaOHcKNvWKmal8g+lRcZKM=;
	b=BwJEtua6PL+yMPPv3U+uh6djrn6kg4y5gLGGciykaaw7SfWP9y5HiJmdboSoubCn
	LM8XH6NCkukorgsIuv9GmCPIyRQhpiXOQYTwsqMunPXRRX5vWcvJJIG3mVJPjrDtLHt
	MtuaCgfirgAjEHtMO3otNL8YvwfmTBN0gXkaa6DY=
X-Gm-Message-State: AOJu0YzudI8f4bzj8o3Thqlmr/B16YwG8ot4+CCF0scWwoLMuuU2hm0O
	GGRbj1gR3iWMNIGkwTcEACD1iV0tLAAJAy67sDQzhmBLKxCSkzeHPNPRm1sPV1J2iCtKPfwO97E
	Tm40nhhCmp4VNuXjpUUasa3hPXW8=
X-Google-Smtp-Source: AGHT+IFWzMTVvkoHyyM5NzNLxXi5UNAgxgz/Z4LgJxcFaTdNRDYCd59hDJ0ol8oj9WdEjpaEwkWcaLsoTszlWV+VhrA=
X-Received: by 2002:a05:6902:728:b0:de4:5c94:f58f with SMTP id
 l8-20020a056902072800b00de45c94f58fmr1061133ybt.15.1713908589437; Tue, 23 Apr
 2024 14:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <4dfbc4c3cfdd36601e0b9b100fa6cd02682be3c6.1713118660.git.w1benny@gmail.com>
In-Reply-To: <4dfbc4c3cfdd36601e0b9b100fa6cd02682be3c6.1713118660.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 23 Apr 2024 17:42:30 -0400
X-Gmail-Original-Message-ID: <CABfawh=T-Ca6JLzF8c_J=k+DnyvzzH3B-Pa=dKWT4-bCZ878DA@mail.gmail.com>
Message-ID: <CABfawh=T-Ca6JLzF8c_J=k+DnyvzzH3B-Pa=dKWT4-bCZ878DA@mail.gmail.com>
Subject: Re: [PATCH] x86/monitor: allow fast-singlestepping without enabling
 singlestep monitor
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 2:21=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Reorder the condition checks within the HVM_MONITOR_SINGLESTEP_BREAKPOINT
> case to enable fast singlestepping independently of the singlestep monito=
r
> being enabled. Previously, fast singlestepping required the singlestep
> monitor to be explicitly enabled through xc_monitor_singlestep, even thou=
gh
> it operates entirely within Xen and does not generate external events.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

