Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF76E6093
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522790.812376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pok3u-0002os-KI; Tue, 18 Apr 2023 12:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522790.812376; Tue, 18 Apr 2023 12:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pok3u-0002nA-GL; Tue, 18 Apr 2023 12:03:54 +0000
Received: by outflank-mailman (input) for mailman id 522790;
 Tue, 18 Apr 2023 12:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pok3t-0002n4-SQ
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:03:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1587bceb-dde1-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 14:03:51 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso566275e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Apr 2023 05:03:51 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056512098f00b004eb2f35045bsm2349851lft.269.2023.04.18.05.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:03:50 -0700 (PDT)
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
X-Inumbo-ID: 1587bceb-dde1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681819431; x=1684411431;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gdzMls3HJNd1Z6ea0WAmO/TGILNl6dtJ4Wnnghi4zco=;
        b=F9x8NXapKU9JO/swG205Rgh25VRJWKx8bYuBfLzwy8lFKTv7d2s7Fu+Ur7kfQF5T0u
         xsBZtZozFh81Jp1vcNtPY/urjicvqAPvf3dEydQQlMH7tiSLa4iBr6az5NorrGCqEu1L
         3gBY+rbKYx/ZhosH+kUWLUc9JvnaFcw0uZQCPoQEovc4Sqi/jGXDWYUuNyegC8vCvW/G
         q/vXKWsIh8xeQOwDazIw9vg+KZXHOBwf8+THQNCwu0qIKEVgSoPYAbsZBiBhUyG6Ur98
         sYpCj0Q8KEID3iX0J52zujO7EcY9dvmQulc3RP0XfUMUNRzKkTY3CjKnrI2vaI5tKKq1
         9XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819431; x=1684411431;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdzMls3HJNd1Z6ea0WAmO/TGILNl6dtJ4Wnnghi4zco=;
        b=dtlJkHBCLqH7DJwJF5/AE5WNHWnsFoNOsKSl70JeOGASRyvWjbmREidvUt9bUjWYP4
         csE0smysxYpgIjp1gXu31lIEC3MmsZjLLpABwIxvTIUJepl3cmVZI3hgvLHbO3BaOf5a
         9p0BhQdwEhtgXL+BBjnIHFlUrM6xM4LcClmJtrjzd8cg5jmn/ycINe2g0lm2Dngjg+ex
         b/D6qsNBuq4ZeOw20P6xdR6F7sdNBL676lc1T1fWaVIbsoHGv0YO1x7C1/RM1Lz/mzTx
         rvnS6un0CvXmlEXqByajlvhM/jQ6OLi1/6kz6zzpvAJuAveK4xYtYzsNHXgujuCy77Zp
         R2Ew==
X-Gm-Message-State: AAQBX9fHw9v1tRbekQmkAwSgVZmZlEyVrP7oKPZFS8bz0aKuOFkuJSmX
	yQkNAtwrUVUxJx/qBvCaBtU=
X-Google-Smtp-Source: AKy350aMnhEJFJ6UfyJ8uptzdRtE6nKJzzkk/AsO+RIMvs/l/JTWCB8PQ4me22FE9QI6J1BSuG2v4w==
X-Received: by 2002:ac2:46c9:0:b0:4ed:c537:d0ca with SMTP id p9-20020ac246c9000000b004edc537d0camr1702418lfo.59.1681819431140;
        Tue, 18 Apr 2023 05:03:51 -0700 (PDT)
Message-ID: <48a1fd97d34a37a2cdbdadf35811d31523b61a4e.camel@gmail.com>
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Tue, 18 Apr 2023 15:03:50 +0300
In-Reply-To: <b343d8c3-b23b-c67b-76f6-c25d5892328b@suse.com>
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
	 <b343d8c3-b23b-c67b-76f6-c25d5892328b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-04-17 at 16:12 +0200, Jan Beulich wrote:
> On 16.03.2023 14:22, Oleksii Kurochko wrote:
> > Oleksii Kurochko (2):
> > =C2=A0 xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
> > =C2=A0 xen/riscv: add explicit check that .got{.plt} is empty
> >=20
> > =C2=A0xen/arch/riscv/arch.mk=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0xen/arch/riscv/xen.lds.S | 13 +++++++++++++
> > =C2=A02 files changed, 15 insertions(+)
>=20
> Just to mention it in case you aren't aware: Hunting down the
> necessary acks
> is your responsibility, not one of the committers. You may want to
> ping Bob
> and Alistair (unless this response of mine is already enough of a
> ping).
> Provided of course the patches still apply as-is ...
>=20
Thanks. I'll take that into account.

I thought the only option I have wait for a response from a maintainer.

~ Oleksii



