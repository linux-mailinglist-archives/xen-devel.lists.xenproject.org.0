Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB57EC28D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633625.988653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FAq-00079l-Ga; Wed, 15 Nov 2023 12:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633625.988653; Wed, 15 Nov 2023 12:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FAq-00077p-DN; Wed, 15 Nov 2023 12:39:16 +0000
Received: by outflank-mailman (input) for mailman id 633625;
 Wed, 15 Nov 2023 12:39:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3FAo-00076F-Kb
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:39:14 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb4c77b4-83b3-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 13:39:13 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5094727fa67so9782433e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 04:39:13 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a19ac4d000000b00507a3b0eb34sm1621241lfc.264.2023.11.15.04.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 04:39:12 -0800 (PST)
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
X-Inumbo-ID: fb4c77b4-83b3-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700051953; x=1700656753; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3+kmdK5+vTbYRyctZ13aQlZSzFG0gBuTt98+lVX8nrM=;
        b=O/7PiNtZQxQtpgCUsud2D6X6EjBOK8i8NLBLbuG7K4o7FzsRHTCQatEGaRsblZ6O6K
         9BgiIsgi4OaXD4u6chsstjJrhGVQtGKcliIQvMigIuHOjYafGQDMCjhSDnJN6t9TXvxt
         Bm7A+eTK/HD4i4JGdfPfEd1ZRS/pXC3E/R1NDRPFMvdsf2bH4Ro3o0HVvDMpWLdp2Qla
         5VYHPG86dxL48ZOsyBiU+bpw4ZswLElHAAGgJSrRW+mlh2pVojhP5HsaLaviQ6kx2VQw
         KNVLbBpqiubQiFCo4Rnz/v8ewUgDf88oicuW95nm8OHUy8kUfXcOGiVgKUN8xv0gFoJP
         zItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700051953; x=1700656753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+kmdK5+vTbYRyctZ13aQlZSzFG0gBuTt98+lVX8nrM=;
        b=jq67L1OKyEog3vhND2bxs61M/0jxdgx1pOUlnOR75UxrLhsHHdNWaSlbrWFtxRno1B
         kGuyyFecOLmfz3INn6w+UbDJQOH9g3fGwjzjRj/2H/d4R0xYUrtOdrVCTQ/Tz2zyEB/n
         SXMSXgnpFNxzA4I0pIUfiQOuIOICjTZ8ddJbeKOOpyUGjg4SWDSCD3j1CFJliyLHNQ7T
         hhAWOObJZ8q0zrWZ83A+DCvppK6zXmrpJs2TNj3Cw+PwOommsowIDX3J6g5IOtlqV9Gr
         MbZK7/nW/qMPaQW8a4bPYXlrVpZ1vLKepiVL1Ij9JpC7lPsDZIrXwNzTKZhWHqkfyUdA
         fGTg==
X-Gm-Message-State: AOJu0YxU5HrwQxDFizVgcN/f9Qx4X+VSriPbzCB8Tp8pU6X3EIqsP3Ww
	0zfbPLK04JXK+tMOdlDK5vU=
X-Google-Smtp-Source: AGHT+IEg/4fJp0eGgFBOViqR5zRBv4kHQ6etdU7aeMh35xBl2EL7gX8WY+JEs3SgMh10Wy0Wa9yp9g==
X-Received: by 2002:a19:521a:0:b0:507:a8cd:6c90 with SMTP id m26-20020a19521a000000b00507a8cd6c90mr8218590lfb.51.1700051952557;
        Wed, 15 Nov 2023 04:39:12 -0800 (PST)
Message-ID: <e3a2f0699c8476e98c2c1dba0ba92e25e3f14915.camel@gmail.com>
Subject: Re: [PATCH v2 07/15] xen/asm-generic: introduce stub header
 <asm/random.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 14:39:11 +0200
In-Reply-To: <8f5f9a74-cf90-4a65-8195-ededf00da9f4@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <2464c6b984d187207fe76453bd05502d288af4f9.1699633310.git.oleksii.kurochko@gmail.com>
	 <8f5f9a74-cf90-4a65-8195-ededf00da9f4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-11-15 at 10:56 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > <asm/random.h> is common for Arm, PPC and RISC-V thereby it
> > is moved to asm-generic.
>=20
> When you say "moved", ...
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0- update the commit messages
> > ---
> > =C2=A0xen/include/asm-generic/random.h | 20 ++++++++++++++++++++
> > =C2=A01 file changed, 20 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/random.h
>=20
> ... you also want to actually move things.
Sure, I'll delete Arm and PPC's random.h in the next patch series
version.

>=20
> Since the above comment matches ones on earlier patches, yet otoh in
> your
> submissions of two individual patches you mentioned you sent them
> separately because this series wasn't fully reviewed yet, would you
> mind
> clarifying whether further going through this version of the series
> is
> actually going to be a good use of time?
I think it still makes sense to review this series.

I probably have to stop sending patches from this series separately. I
thought merging almost-ready patches would be a little faster if they
moved outside the patch series.

If it is possible to merge approved patches separately without getting
approved for the whole patch series, then what I did before doesn't
make sense, and I am sorry for this inconvenience.

I can return the patches I sent separately to this patch series.

~ Oleksii


