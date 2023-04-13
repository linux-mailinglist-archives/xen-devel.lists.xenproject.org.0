Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553836E0F3C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520774.808759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxMm-0004Wv-3z; Thu, 13 Apr 2023 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520774.808759; Thu, 13 Apr 2023 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxMm-0004Tw-1A; Thu, 13 Apr 2023 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 520774;
 Thu, 13 Apr 2023 13:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxMk-0004Tq-Tu
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:51:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab890de-da02-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:51:56 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id l16so8071206wms.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 06:51:56 -0700 (PDT)
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
X-Inumbo-ID: 5ab890de-da02-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681393916; x=1683985916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi8hFeyLb1wtgcL73aZmUI9/nlIn4MwZ/hV9h9PzSJA=;
        b=y9X7e5x3js+izG438LeC1AhCpvDq6t/rItKXY/kwYKAZKe/3cLmHpAfRJIQQxG+QuD
         FPYfNh3mJylLvT1Ty5H/7xtjnBOMa+QBejtHS6lF2aaLYc2Fey7b5mrBaKVD0EK/UL48
         3Ur3F2voxg5/HEXQmbF8/dLAKl0ehgegrxduvtKXJ2SPqSV50tS8+49XPi0GFPD5nZWL
         64/NYS3HYhpv3bZqcY1i5qdrqxs6T6yJdySvCBLDW2ql7IXp+plil79yVk44OeU0QY5a
         VHBY/PeAtHSp9ol50ehvIWYc6C06TfvzNYmNbRJggLItPc3e2qk4zueChijKBjQa2Vnv
         71VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681393916; x=1683985916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi8hFeyLb1wtgcL73aZmUI9/nlIn4MwZ/hV9h9PzSJA=;
        b=VWltT80G5jPTOPAB8LDghdSWngpKAsBvXLTdO8zrdk775Mj6bZPYAKaU03H44PDAMe
         bcUqt6DSEF1MWnpk2XxRVRju4x4I/seTc6PiFbYstDrP2d4hWRGiaJX7tSPmfIMaoKPl
         5FftV9MHKxZAxhBGADbGm0PNFCvzm9fWYkyFSses7cXsezn5OT7sHTvIXcwiptxmMoE3
         5Ii7R5hR+ui9tka3BM70cZolrkFrweUSJbbQq7+ACfww7XIMr8wv1a2WYJtG4cSS/t5G
         +SSalg6RAcRjGapg+1qA5ShG9vwJAHcujVubdFyoUU3RwPDKL2RwosdOPQrMOv+PaIQG
         ICkA==
X-Gm-Message-State: AAQBX9fJ6IpTbmbRrKOjhOaH1NficLU6Fgeq8DhZVy54IocLYS75lvhL
	sZRqPwwZKWDQN0BGOpVahABos//vNEhQILsqlsf/qg==
X-Google-Smtp-Source: AKy350YB6S6RKRB7rmgQ7y0ai4x80rdo5aGQytRTIaOdAgl7Ml5rxXp5ZfffiyiZPXt6jnNJtzGquxitYt+muVcJxlE=
X-Received: by 2002:a05:600c:b4e:b0:3ee:9c6d:832a with SMTP id
 k14-20020a05600c0b4e00b003ee9c6d832amr595980wmr.4.1681393916086; Thu, 13 Apr
 2023 06:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-7-jens.wiklander@linaro.org> <AS8PR08MB79916CDCB5DB7CA86E8077A592989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79916CDCB5DB7CA86E8077A592989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 15:51:45 +0200
Message-ID: <CAHUa44GUWvXneub-p=iw6ufbpUtv=zwEx0Oy-Ov8CTTVgX=7fw@mail.gmail.com>
Subject: Re: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework
 direct request/response messages
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 12:51=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wr=
ote:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 06/22] xen/arm: ffa: add defines for framework d=
irect
> > request/response messages
> >
> > Adds defines for framework direct request/response messages.
>
> Same here, it actually took me a while to find the related chapters
> about this patch, so I would suggest that we can add more details
> about where the values are from.
>
> From the spec that I referred to (DEN0077A version 1.1 REL0), they are
> in section 18.3, Table 18.{21, 25, 26, 27,28}.

OK, I'll add it.

>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> I confirm the values introduced by this patch are consistent with the
> above spec, hence:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks,
Jens

>
> Kind regards,
> Henry

