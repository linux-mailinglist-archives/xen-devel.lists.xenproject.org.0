Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68234B4A785
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:23:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116009.1462444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuZ4-0006Jg-Tz; Tue, 09 Sep 2025 09:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116009.1462444; Tue, 09 Sep 2025 09:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuZ4-0006HY-RP; Tue, 09 Sep 2025 09:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1116009;
 Tue, 09 Sep 2025 09:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i4f=3U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvuZ3-0005TO-R2
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:23:01 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94249bc5-8d5e-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 11:23:00 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-336dc57f562so46876701fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 02:23:00 -0700 (PDT)
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
X-Inumbo-ID: 94249bc5-8d5e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757409779; x=1758014579; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJyj+hFKDpc6wM9Ol3UGAzK2l2BetfGoSNjvrhxxzio=;
        b=R5Ucl98O+r7DOmSGCarqBf0S5fE+IslvA8l4ej2DVT3Cz69iq5jbu/nitVv5OV97Np
         mP66TAMeeYDIiLH9ePohRyes4ZXzE4jSGbdTXNe4CMAh5zhjbyXWZ4A//QSpZPLI18xX
         dMoYEivwHdgIfcVQEt1qMIY1xiDm8UDDdGsqBiGwsig1iUUhvYqVVrwe2flnhofsa0yA
         rRXXCJzVzrFOlVVM7Eyc/nCULhbzRF+EhcW9Ie/DfFarsLXLFfImnaBnzg6Ho3B3Cl4w
         KqNyQ4cpLWa7k88cHqVHcy7dUVGJj5zgPF3qURVgCciWpszpUGcMIUSKQ0GLqU/M7xix
         iQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409779; x=1758014579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJyj+hFKDpc6wM9Ol3UGAzK2l2BetfGoSNjvrhxxzio=;
        b=mQkG3FLIfGyLkvi/JRCZnrPn/BDcAB09NcilHzssO4Vsiu8gVh+Jzou3LMEHMyk6K3
         NQzEAiqFMMJwlBWszrK+5QhLWvsozae1YVmD82EKQS1nXrTR/FOkEmPf9xI0iuc7KJQL
         oVnQdKEFsYzljgophvwqi3Pg2o4dFNc/roiRk8oxTGvBZdsMerPHrAYd0c/R1VVLpD6I
         +AyCu6leYu6f7xNhBvtagMLImo2dVmVYu9fZmHursCoPGeCALl6ziSC5jjhaDglxOdj8
         ZVB+e4mh3pscXwDnjtQBskb6dYvE5umTTQzzCCesPH7OoHWppbr2kQMLFlesWw+NxoBU
         SfgA==
X-Gm-Message-State: AOJu0Ywtgvt+pIcC2KRTmJx59NZ8pv6jEutSRpDRHDLu9cf2gpQv9Pri
	ReKaKOo4+mvcVk1eGu9C8v1+F0ybXXew6Z2BalcYxJuhWb3sv1qyGc/j6764e4dGWpKL8MQr+G4
	YIpSp+KhYh44ICRnzGpfhKyIUfQDAPqNKU+i4
X-Gm-Gg: ASbGncsjIprq9sMOgZQHZGlkwKba5jUDNyejByogaLc+ejpj1eNX+Kw0618bSbG8bLC
	Pz7vNosXyFaQ5n3gKMxfyWcJeCxq25jkG/wOZSKQaEtQ90xI1Vvx/ngCV9mPxPK0TPFb9jtxcER
	7p0RAg8hCnRU7rdq9kMki+sE+6PlwXcYRiDAfidqLB1irJWmPCOraHmUhdVQP5eedI2CalBiXuB
	8jXMftNJUyIP50Q
X-Google-Smtp-Source: AGHT+IEQvbgwfZ7T3cFvFrIpxppRoaNArl7mF0+jrhXYxSL3eytsIk6K1cWZnjJddyR0zhqYfWliz+FyUJrQ64LE6/s=
X-Received: by 2002:a2e:a418:0:b0:336:9d4e:6b8b with SMTP id
 38308e7fff4ca-3381e790afemr33075311fa.20.1757409779062; Tue, 09 Sep 2025
 02:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250909074141.7356-1-michal.orzel@amd.com>
In-Reply-To: <20250909074141.7356-1-michal.orzel@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 9 Sep 2025 12:22:48 +0300
X-Gm-Features: Ac12FXzzPJYHh1OI-G5Y1M6tyRSYDBIKJQAqLI1tolsbBptoNvb-LRfQzO94YfA
Message-ID: <CAGeoDV8zpHc0Rqmo4Vra5sZSh-mOjsTVPvursqZ42S=4HcRRYg@mail.gmail.com>
Subject: Re: [ImageBuilder] Use LOAD_CMD by default if not specified in load_file()
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thank you for the patch and the detailed explanation.

On Tue, Sep 9, 2025 at 10:42=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> Commit 061d6782756f modified load_file() to take load command as
> argument but did not change all the invocations (e.g. loading standalone
> Linux, bitstream, etc.) which broke the output script (load command
> empty). Fix it by defaulting to LOAD_CMD if not specified.
>
> Fixes: 061d6782756f ("Add config option to use separate load commands for=
 Xen, DOM0 and DOMU binaries")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  scripts/uboot-script-gen | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 849b8f939e81..4f9261035d73 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -736,6 +736,12 @@ function load_file()
>      local base=3D"$(realpath $PWD)"/
>      local relative_path=3D${absolute_path#"$base"}
>
> +    # Default to LOAD_CMD if not specified
> +    if test -z "${load_cmd}"
> +    then
> +        load_cmd=3D"${LOAD_CMD}"
> +    fi
> +

I was wondering if we could use a slightly more concise notation here, like=
:
: "${load_cmd:=3D$LOAD_CMD}"

It does the same thing but is a bit more idiomatic for Bash scripts.

>      if test "$FIT"
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOUR=
CE
> --
> 2.43.0
>
>

Thanks again for your work on this!

Best regards,
Mykola

