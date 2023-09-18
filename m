Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5B7A4528
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 10:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603830.940921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9yi-0004pz-SZ; Mon, 18 Sep 2023 08:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603830.940921; Mon, 18 Sep 2023 08:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qi9yi-0004ny-Pl; Mon, 18 Sep 2023 08:51:36 +0000
Received: by outflank-mailman (input) for mailman id 603830;
 Mon, 18 Sep 2023 08:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pP1k=FC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qi9yh-0004ns-CT
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 08:51:35 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9129b0cb-5600-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 10:51:33 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so6969072e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 01:51:33 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t5-20020ac243a5000000b004ff973cb14esm1720528lfl.108.2023.09.18.01.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:51:32 -0700 (PDT)
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
X-Inumbo-ID: 9129b0cb-5600-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695027092; x=1695631892; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JgjQrr/bDClIWEtyHtfWT7bNcXAjFtXuTQipZsq38qw=;
        b=K1UePIcB7u85sf7djHOZr1g0dHzr3ZWNP0uWEGS77g6NkKamrJgMtAXIOTITmAoF6R
         mmGFx2lQleSdBpTSBmk6TWo7ysaF9jWyLTyTRUkY3fusLWNqBoikarsbigtjywbHxXsX
         baOPkhOjc807F9GFYL4qECueY4frjN86STXthtLjXdqPKY3+uBvleGH+98Nhu1yK6xSQ
         aDbP45nMstfR+Pfe1DVeIou0OgiVKIeJjr6Ve7d7En9XZLbUCHShxViwjNd7Q6efg8Nd
         dirjiRj/COFDYjolWWR2wDaBtHJACZz0N3FZ7+3Z1lHZ183C8AgE4SGr//m9jkwSqmKs
         B4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695027092; x=1695631892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgjQrr/bDClIWEtyHtfWT7bNcXAjFtXuTQipZsq38qw=;
        b=naevmJJxls30YhmIG+pZ0g5otC8FasQNjiQgHWIeL323cnni//gsQmT7RzVcl+H+99
         dJxqisOQ8cdHAGyOOglhm2uFYzG3h6gbCTAKm/0fmZw5qA8ZI42ooRmR6nh9olQUMEGA
         baqwXY2JsSs4vGyKM28gdU4GXMZxxTxE3KMrm1ybunpjINUPDIwa7g64bINhBfolrF0g
         HDC51+B1qQwk3hpV8hNvFTeZlg5Q4H8fKgAun+JzmtDpHGSu3WYfZnJ3d2omSjBuLpnH
         56k33JTxJ+0wb+dRLgrpD2CUQvXtehVJatiPx46WJeIgumQmbY7yz3zYwzxQlpJVssEV
         aZZg==
X-Gm-Message-State: AOJu0YzwBCz+C64+lmGLcSdqxOFr5Lpttl3QP64IDwDtaB65NZO3mpgo
	gpAbH+Nqj37a47LEvinXjrc=
X-Google-Smtp-Source: AGHT+IHZ2DV7EOWDrqSc43I0Jzj/AsIkUeCiwkTl6LfG1/KXSb2OCJcCjLWTYx3XKAbGH7MLF1FlfA==
X-Received: by 2002:a19:6756:0:b0:502:ffdf:b098 with SMTP id e22-20020a196756000000b00502ffdfb098mr4331955lfj.6.1695027092372;
        Mon, 18 Sep 2023 01:51:32 -0700 (PDT)
Message-ID: <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Mon, 18 Sep 2023 11:51:31 +0300
In-Reply-To: <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > Based on two patch series [1] and [2], the idea of which is to
> > provide minimal
> > amount of things for a complete Xen build, a large amount of
> > headers are the same
> > or almost the same, so it makes sense to move them to asm-generic.
> >=20
> > Also, providing such stub headers should help future architectures
> > to add
> > a full Xen build.
> >=20
> > [1]
> > https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@rapto=
rengineering.com/
> > [2]
> > https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko=
@gmail.com/
> >=20
> > Oleksii Kurochko (29):
> > =C2=A0 xen/asm-generic: introduce stub header spinlock.h
>=20
> At the example of this, personally I think this goes too far. Headers
> in
> asm-generic should be for the case where an arch elects to not
> implement
> certain functionality. Clearly spinlocks are required uniformly.
It makes sense. Then I will back to the option [2] where I introduced
all this headers as part of RISC-V architecture.=20

~ Oleksii

