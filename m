Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42025902629
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737425.1143733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhN7-0000RK-4w; Mon, 10 Jun 2024 15:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737425.1143733; Mon, 10 Jun 2024 15:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhN7-0000Pp-1w; Mon, 10 Jun 2024 15:55:49 +0000
Received: by outflank-mailman (input) for mailman id 737425;
 Mon, 10 Jun 2024 15:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRC9=NM=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sGhN5-0000Ph-H4
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:55:47 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61a7610-2741-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 17:55:46 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3d220039bc6so1057186b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:55:46 -0700 (PDT)
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
X-Inumbo-ID: e61a7610-2741-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718034945; x=1718639745; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2w6PSj8mpMLLY7MVOid/n75KZdOEiDxsszO1eh6e0g=;
        b=Ql/XYO3+/p47O2QKtUA1Ppok1QrJYjUsGt4OXJhhLdOf+12naZQWgvBGmy8kclERLl
         PgJ7Mu/cfRK15BqoUgkef4fomjmi85ChBB174+OzW0D07a4R9bMOTHRf0/Op+HztWUQ2
         zEiEKSuIwLbT2Svsx4KFyFuOj4iAnx83oFrSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718034945; x=1718639745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2w6PSj8mpMLLY7MVOid/n75KZdOEiDxsszO1eh6e0g=;
        b=hPkpIdbOdZd+0OcgT+tql8dsk9zkDU4W7Ox6Tc2bM2BOx9bSlW47SzVkUPPqEJUIb7
         W4/pc7XTeqxFbc1gVkwU11KDMuO6SekCQEnUkMSZmTRnSu67eIru+6/ReD61Jx/Qhv1d
         7YoCH1OW0KQTcrLM3i2inqpXlk33f4Ua2aZFbpYFFs7w7AYUqyYTonI5f04B4uvRo1WK
         NgPDDDWpDVqBAsg9VomC7kjgvfHyZ+ZqTJhY7qiokc/fJOWUnukputqzRtgUm+3w/kzm
         eP3phIUXm0NRpTboZ+htuX1rrXV5waG14tFsE5KGaKTWVxLF6LjevQwa4jtzwww8lslk
         FvnA==
X-Gm-Message-State: AOJu0YxjV60RRLjXmGEoLxVk2fPiWVAY/5M9dgb/391qXHETPZIxeK6J
	06+C1W0cB5Mutu6AQHgEI5mmBSpbGPGeYodRX/FV2PGixpcMd/xLDVamZyjAfVe5N84JQPFhYVh
	KamgLS+mwKiuHbEccaEHX0Nm3GOtmq9iXKHHWbQ==
X-Google-Smtp-Source: AGHT+IENT19HJ9VMpxwSIhvqeehdG66MzmQ9GZSYhsx1RsJWD1gBssMaOM+lYSnB1G+tQ7LnNq2JFnk9z7VTbWWAqwA=
X-Received: by 2002:a05:6870:93cb:b0:250:7a8d:1756 with SMTP id
 586e51a60fabf-25464b78e32mr10900044fac.12.1718034945272; Mon, 10 Jun 2024
 08:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240610085052.8499-1-roger.pau@citrix.com>
In-Reply-To: <20240610085052.8499-1-roger.pau@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 10 Jun 2024 16:55:34 +0100
Message-ID: <CA+zSX=Z3O_b44Jum3s9rRJ_h+BKjJzd11gAr249wFOxQCcFKEQ@mail.gmail.com>
Subject: Re: [PATCH for-4.19 v2] x86/pvh: declare PVH dom0 supported with caveats
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 9:50=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> PVH dom0 is functionally very similar to PVH domU except for the domain
> builder and the added set of hypercalls available to it.
>
> The main concern with declaring it "Supported" is the lack of some featur=
es
> when compared to classic PV dom0, hence switch it's status to supported w=
ith
> caveats.  List the known missing features, there might be more features m=
issing
> or not working as expected apart from the ones listed.
>
> Note there's some (limited) PVH dom0 testing on both osstest and gitlab.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v1:
>  - Remove boot warning.
> ---
>  CHANGELOG.md                  |  1 +
>  SUPPORT.md                    | 15 ++++++++++++++-
>  xen/arch/x86/hvm/dom0_build.c |  1 -
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 201478aa1c0e..1778419cae64 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>     - HVM PIRQs are disabled by default.
>     - Reduce IOMMU setup time for hardware domain.
>     - Allow HVM/PVH domains to map foreign pages.
> +   - Declare PVH dom0 supported with caveats.
>   - xl/libxl configures vkb=3D[] for HVM domains with priority over vkb_d=
evice.
>   - Increase the maximum number of CPUs Xen can be built for from 4095 to
>     16383.
> diff --git a/SUPPORT.md b/SUPPORT.md
> index d5d60c62ec11..711aacf34662 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -161,7 +161,20 @@ Requires hardware virtualisation support (Intel VMX =
/ AMD SVM).
>  Dom0 support requires an IOMMU (Intel VT-d / AMD IOMMU).
>
>      Status, domU: Supported
> -    Status, dom0: Experimental
> +    Status, dom0: Supported, with caveats
> +
> +PVH dom0 hasn't received the same test coverage as PV dom0, so it can ex=
hibit
> +unexpected behavior or issues on some hardware.

What's the criteria for removing this paragraph?

FAOD I'm OK with it being checked in as-is, but I feel like this
paragraph is somewhat anomalous, and would at least like to have an
idea what might trigger its removal.

 -George

