Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E66598428B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 11:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802522.1212782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st299-0007Fq-Cq; Tue, 24 Sep 2024 09:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802522.1212782; Tue, 24 Sep 2024 09:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st299-0007DH-9u; Tue, 24 Sep 2024 09:47:51 +0000
Received: by outflank-mailman (input) for mailman id 802522;
 Tue, 24 Sep 2024 09:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4h8=QW=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1st297-00076e-RE
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 09:47:49 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0df12f89-7a5a-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 11:47:48 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d8b96c18f0so4235980a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 02:47:48 -0700 (PDT)
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
X-Inumbo-ID: 0df12f89-7a5a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727171266; x=1727776066; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VPcPPDMEs7HiLMzVX3TzNE2Bvst0ep9NH1ZFZPMCUY=;
        b=HVY6sQ7Zn/jJW7LDoIFkpmLtD2QbnoO1ZU2xG8PzoxYYD9Q5kaX/y5aXVK6RZ09PPr
         aupbu865X3svz2x+Vp1JfGHJ4YQk3PfBLsY1fEww3DaMFdpxnrYLfBJMo7mhVJRYMym2
         6sixvE9ve1x3WxY6sbPI72MSZHOwFj8l19BvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727171266; x=1727776066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VPcPPDMEs7HiLMzVX3TzNE2Bvst0ep9NH1ZFZPMCUY=;
        b=GHydNeApma44ndZtZMGBZeeX3cajoaf2tDgCSM/PW2LHeOwKef05itoKKsavMM9M0G
         rqAdjC1rfM5f6vmpWKLkVdbVnVFPrax7NoQ2OCu8U+RVD9h/lc0Wou1gBQs6Rkgwl8Fa
         VdyHCV9gQ4DgucXdz6DRfap6FlckVi0UJUn4x5Sde2ZFRS5XLTj4GrcFn5GHoLc+4Dm/
         BPTeCc5bF5+F7nfvQmvKnNX3pVYuROtVESA/pQd349vYohgkFwIIHbFNbxihkx8uHNz/
         eflQ/ktAr0fd7l2rZOh+bU9GU0Fr19mveLTqRPxkciTvxD3/AIhBYWY+QyQGymQRI6Kz
         RGew==
X-Gm-Message-State: AOJu0Ywpb6mxx4USrF+xXpo7cyBSAUPwRPryVqnq1/4+Z9+ocYvaTyAY
	t/BoGyRtgESZzPCEQM2cwaK0fRpfysfKFyngh4xM257dU5ZEv7CF5lQ6PrA7CvimuFq/at5y4q5
	v4EKRHmnzhdsObYT3isoX9yLGby6LsUeiej2D
X-Google-Smtp-Source: AGHT+IHZhZVZWXKoZd5Q+D6x/zzPi7EXrD2l4lUkWPU6R7jTEuYHJ08jnJI6XSHIDZKxOAWZVRgWx2cjI+5rIis61Jk=
X-Received: by 2002:a17:90b:881:b0:2d8:aa9c:e386 with SMTP id
 98e67ed59e1d1-2dd80c178ecmr18011422a91.14.1727171266497; Tue, 24 Sep 2024
 02:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <ab2d325e-0d91-4308-b4d1-06314ad5ba0c@suse.com> <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
In-Reply-To: <a6126dc2-a10f-4a90-9d2f-80f6f32f1386@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 24 Sep 2024 10:47:06 +0100
Message-ID: <CAG7k0EqX8uK7VL87Wsn1TwcfXKB48QaeisSMNyM26CwS26bxZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] types: replace remaining uses of s64
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 1:20=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> ... and move the type itself to linux-compat.h.
>
> While doing so
> - correct the type of union uu's uq field in lib/divmod.c,
> - switch a few adjacent types as well, for (a little bit of)
>   consistency.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---

Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com>

