Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E922485C421
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 19:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683711.1063282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcVJD-0000UP-NR; Tue, 20 Feb 2024 18:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683711.1063282; Tue, 20 Feb 2024 18:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcVJD-0000S2-J9; Tue, 20 Feb 2024 18:57:39 +0000
Received: by outflank-mailman (input) for mailman id 683711;
 Tue, 20 Feb 2024 18:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcVJC-0000Rw-Fk
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 18:57:38 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea16af28-d021-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 19:57:37 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso4777371e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 10:57:37 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b00511740efdd1sm1359588lfb.39.2024.02.20.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 10:57:36 -0800 (PST)
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
X-Inumbo-ID: ea16af28-d021-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708455457; x=1709060257; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWDibD0Fx2KzEZtfYZhxa0gkumK9CdCgWsdGtaVvLts=;
        b=ZmN10KgvnMrrbdSurRo/Jx8Ic6VKyJKX7wl14U5SJ0DQYd+m3EST2HvFW9FeVtB9oo
         WBby/Az1kSrH4/ysSYcbRc2WHanUBnHXyIiw+5Q4bTnTs5pAi3MKxlPRmdYejpGKo1vX
         6JT5w30C4UXMx9pQlQXRJ9pLG90OcC1Ux7f0ziPfbviFNGW/74F6ZpmvMXIVRz7I8GGk
         3nr7RhJHGspQJ8LhPEZed2Git/eN12pazMrK+anKPjwKJQ+BnrA8o4BgRMgLyYEkvCzA
         rcILmrPjTNB3C8cagrH9eHCnRGbnRO4l7QImU44aesFeo8BmRD+vD9N1lmf/vYAKBX2O
         CS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708455457; x=1709060257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWDibD0Fx2KzEZtfYZhxa0gkumK9CdCgWsdGtaVvLts=;
        b=g7TZ9Su1gruhsPPnOSDUDv1YTOZRET9ox1s+l2CjxeMkWpm1ugi6RktE+ZzuCOtlP2
         RQNP7+6QFtoskgofTUsvZ86xWf+Kprx4U77vGUcp7bZ598zl9GVjLFlvhUlecOFrUnsM
         KXwGqus+UNqQGDt9+kc2A+LQ8mBLdl4VmzdYmfes2qPwanDCRevA+F3VN8x4+Ww07R04
         r3t+mVH9lnvKJ+k7F75BwMBpckLx69xkqFubCZhK5ioGzxvCsQ5rpoMPz1pxdnknTygr
         b8yKtD2rje1qa99hKKhBb1udfaxyzEdpMfoVZfJrpm7h8qWyTEUphWnCWybjAlYn1D6j
         2Sbg==
X-Forwarded-Encrypted: i=1; AJvYcCUTxRXido6gpA0cYQAcNqVR7U8zLNJNZOlM8Wl5zkeeBF2uihHsv9qZ4x+4fvF6pbTS4hkSu09nwabSBnQenf2b5r52nfWnfNtIIk9Dv7E=
X-Gm-Message-State: AOJu0YyV37n8FaOJE2raYtLCrzi1TucBE9cb4WpIBCVgRTkMwLgbqwJP
	8y2m8Or7Y+ZIO8y3qNPKk41SU1fnher2+N1zgwILN8beBKdgU0hY
X-Google-Smtp-Source: AGHT+IGwH/Ldxke2P1hxqOEqYmORolFTk35OPOUwEzazEcurI1VcyKvFnRtxyTQHSfdW8VUPKxo+5g==
X-Received: by 2002:a05:6512:1024:b0:511:87b7:6d88 with SMTP id r4-20020a056512102400b0051187b76d88mr10469147lfr.32.1708455456771;
        Tue, 20 Feb 2024 10:57:36 -0800 (PST)
Message-ID: <35641c47eda255e74cf79a66d2e3d04020be261f.camel@gmail.com>
Subject: Re: [PATCH v4 02/30] xen/riscv: use some asm-generic headers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 20 Feb 2024 19:57:35 +0100
In-Reply-To: <5b8d6ff3-508c-49aa-8b25-3624d165eae1@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
	 <16baca98-44fe-42ba-b61d-ff1945e0d2b5@suse.com>
	 <d2cc798462de9e0d7a89777ea0743fe6dce4d061.camel@gmail.com>
	 <5b8d6ff3-508c-49aa-8b25-3624d165eae1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-02-14 at 11:03 +0100, Jan Beulich wrote:
> On 14.02.2024 10:54, Oleksii wrote:
> > On Mon, 2024-02-12 at 16:03 +0100, Jan Beulich wrote:
> > > On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > > > =C2=A0As [PATCH v6 0/9] Introduce generic headers
> > > > =C2=A0(
> > > > https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kuro=
chko@gmail.com
> > > > /)
> > > > =C2=A0is not stable, the list in asm/Makefile can be changed, but
> > > > the
> > > > changes will
> > > > =C2=A0be easy.
> > >=20
> > > Or wait - doesn't this mean the change here can't be committed
> > > yet? I
> > > know the cover letter specifies dependencies, yet I think we need
> > > to
> > > come
> > > to a point where this large series won't need re-posting again
> > > and
> > > again.
> > We can't committed it now because asm-generic version of device.h,
> > which is not commited yet.
> >=20
> > We can drop the change " generic-y +=3D device.h ", and commit the
> > current one patch, but it sill will require to create a new patch
> > for
> > using of asm-generic/device.h. Or as an option, I can merge
> > "generic-y
> > +=3D device.h" into PATCH 29/30 xen/riscv: enable full Xen build.
> >=20
> > I don't expect that the of asm-generic headers will changed in
> > riscv/include/asm/Makefile, but it looks to me that it is better to
> > wait until asm-generic/device.h will be in staging branch.
> >=20
> >=20
> > If you have better ideas, please share it with me.
>=20
> My main point was that the interdependencies here have grown too far,
> imo. The more that while having dependencies stated in the cover
> letter
> is useful, while committing (and also reviewing) I for one would
> typically only look at the individual patches.
>=20
> For this patch alone, maybe it would be more obvious that said
> dependency exists if it was last on the asm-generic series, rather
> than part of the series here (which depends on that other series
> anyway). That series now looks to be making some progress, and it
> being
> a prereq for here it may be prudent to focus on getting that one in,
> before re-posting here.
I'll be more specific next time regarding dependencies and specify what
a prereq changes are.

Considering that asm-generic/device.h was merged to staging branch. It
seems to me that there are no more additional prereqs for this patch.

~ Oleksii

