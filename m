Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CA7FAA7F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642433.1001857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hR2-0000fb-CV; Mon, 27 Nov 2023 19:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642433.1001857; Mon, 27 Nov 2023 19:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hR2-0000cH-8d; Mon, 27 Nov 2023 19:38:24 +0000
Received: by outflank-mailman (input) for mailman id 642433;
 Mon, 27 Nov 2023 19:38:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7hR0-0000cB-Pb
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:38:22 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85909d29-8d5c-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:38:21 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so56392871fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 11:38:21 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2e7a13000000b002c87132d618sm1421346ljc.91.2023.11.27.11.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:38:20 -0800 (PST)
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
X-Inumbo-ID: 85909d29-8d5c-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701113901; x=1701718701; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y7ym5EEv0/qhi2tFDB8t3lmkWrG2Zwe9T6aXR1Ng7lU=;
        b=laFL2c7bfpkYaS/B56rzgTfUJ9nEgIse44vPvlhZNV6dC8zwCNpaqh777CENbyZHJ8
         AHNW7HMYBTLVm/W6ZP3EYEebNJ1hu7VBLV18Vq+M8AIeRv+WbQWAfJQctb1vtpSCuJmY
         u60xEIJgyfntSq7VgE0tuqWy2Od38Xa4I3PERG0RmmR8qWStt4CZd6vwsWH+IXAVT9k9
         Jx28LOL9i3V1T9IP795sCQMwZFGjRCTUEBHN7bwdt/WgpfH1vPn/RpHbFU/vUz+lXQcG
         1dKeKpAxKaIZ09ghrDnIDXIV4MRQH0WAbZ/+Qnup1Xq5Kc6Iv6eNZntnyhZrPsjzJKI5
         6ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113901; x=1701718701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7ym5EEv0/qhi2tFDB8t3lmkWrG2Zwe9T6aXR1Ng7lU=;
        b=gqW7wejJAfpH6k4Exoyd/QaGDm+Y628h64XNQTxQGt6D6BCwQvUSBZO/5GnGJIHdet
         FUQCmX4iB+qXPg8HqPsogb5uOowpPJr4lcHfCxWqcjLrgtA5VmarA/AAfzTwLYRvqExl
         vDCjVTP6xkKD0bUXAvgv/EKE36t8eg6KQArsPn70XsUzRgv2eRAKFJCP9tX4ii9tMc9a
         cCn21IgsSKTtYSLltqNuzA9PJeALQPM7uhWLjGkUo1z9Gf915NJmvPtbPVWVtED+yFm9
         6rAJTi3XlQIjKWHxuzHoVILfEQPHR1W2eRXasG7AdMGBaPpBo0inn99XZZT+XPbYaZIf
         AHxw==
X-Gm-Message-State: AOJu0YwXEyYl0XKzD6fsRCMI1oBQhoaHOlZjd4miYIXc7BpSVlF2+Bb9
	AYDCK4H2mEMP1b//nct9r7Gdj8r//Z6Wow==
X-Google-Smtp-Source: AGHT+IG6TModd5iRVCGWHNckKn89o1Zhswr6HPzAlWFjYodMnx11gTbkg7kOGDyg4cFEFvopnzJQdQ==
X-Received: by 2002:a2e:8602:0:b0:2c5:128c:fae7 with SMTP id a2-20020a2e8602000000b002c5128cfae7mr8779998lji.38.1701113900431;
        Mon, 27 Nov 2023 11:38:20 -0800 (PST)
Message-ID: <6543c6aec8f69878e37912924b6d6208136a02af.camel@gmail.com>
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 27 Nov 2023 21:38:19 +0200
In-Reply-To: <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
	 <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-11-27 at 15:41 +0100, Jan Beulich wrote:
> On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > --- a/xen/arch/ppc/include/asm/grant_table.h
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -#ifndef __ASM_PPC_GRANT_TABLE_H__
> > -#define __ASM_PPC_GRANT_TABLE_H__
> > -
> > -#endif /* __ASM_PPC_GRANT_TABLE_H__ */
>=20
> Removing this header would be correct only if GRANT_TABLE had a
> "depends on
> !PPC", I'm afraid. Recall that the earlier randconfig adjustment in
> CI was
> actually requested to be undone, at which point what an arch's
> defconfig
> says isn't necessarily what a randconfig should use.
We can do depends on !PPC && !RISCV but shouldn't it be enough only to
turn CONFIG_GRANT_TABLE off in defconfig and set CONFIG_GRANT_TABLE=3Dn
in EXTRA_XEN_CONFIG?

Some time ago I also tried to redefine "Config GRANT_TABLE" in arch-
specific Kconfig + defconfig + EXTRA_XEN_CONFIG and it works for me.
Could it be solution instead of "depends on..." ?

One more question I have do we really need this randconfig? On RISC-V
side, I launched several time this patch series ( from v1 to v4 + runs
during test of patch series ) and I haven't faced case
when CONFIG_GRANT_TABLE=3Dn. ( but I turned the config off in defconfig +
EXTRA_XEN_CONFIG ). Also when it "Config GRANT_TABLE" was re-defined in
arch-specific KConfig I haven't face an issue with CONFIG_GRANT_TABLE
too.

~ Oleksii

