Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F407E6E31
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 17:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629743.982136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17WC-0007qS-Pm; Thu, 09 Nov 2023 16:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629743.982136; Thu, 09 Nov 2023 16:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r17WC-0007o9-NB; Thu, 09 Nov 2023 16:04:32 +0000
Received: by outflank-mailman (input) for mailman id 629743;
 Thu, 09 Nov 2023 16:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lPpZ=GW=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1r17WB-0007o3-El
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 16:04:31 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa34c7c3-7f19-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 17:04:30 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5441ba3e53cso1605600a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 08:04:30 -0800 (PST)
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
X-Inumbo-ID: aa34c7c3-7f19-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699545870; x=1700150670; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wSAaFIMjbOUvTUCnLK9sawHNvp9MFTD1AlmSfBsbXN4=;
        b=CS3sjdLKbluN7jkuRrYgADK0UUBepbo4xzbPF13Jmpfk/woCR0sxSMEoatK3TTzQ2t
         2g6wtbF1ofkToChtOfj1ZNANJ03ECraz4X55RsW86vdJkOJxaCd3e62urau/zdhN6GkK
         18krNsnswh+IFSwez7mAcD0s/5eEIJppjgT02blisKM2CrX+JtyAC9ZDHFdiON/ycmjV
         P5URuOGcgcQ9Xa3Mp1Xy5G+BcfyqZW3KG/AvUtm0G2xhH4mVbx1vX4gfMI2t6H/5cnUD
         jVrOYv1TKGEg/Tv9iTWRyoWa0/tCvQUCybqOJv7C1aD8gsjqQsfNDeVSfR/uj9S+fuEe
         h+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699545870; x=1700150670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSAaFIMjbOUvTUCnLK9sawHNvp9MFTD1AlmSfBsbXN4=;
        b=Y2treCcVeakGqGDNWc/pPHoTBo90/83nWtmR05uBU23O1KsPlbs4k3+JsX9yMYMw+r
         TPO3bmtH+QYmtHq/LbIy3hrjye/XBFJlwCXQaGbeRg+FOnO5usf53xm1uh7EZEPCVTE1
         INVZP9gkB1Uc+C34nljCdMzO5IrK24IidbP6BMoo35dbR1ERLPECNOsxUeDoj47AZYBk
         uCYU/AM95BOYWKoEU3m569OKOfvVhfb/N1SpvQ68umew/vun1LBY2MKiGoRxMHFnjpDe
         7T07KhIXVRa+g1zYjm3n5JGuULp46das1JtcVzaAfdsaThtQznsu4+rNsDTM8sj2xUl0
         zVQQ==
X-Gm-Message-State: AOJu0YzKG3B7HPENtgT7ZKzhCpIZNF9hLTj+npXoliYm9wrqbfCNgCqI
	HmEcoBWkm7HiYiZvlb5uOt0JZFzZEfUbRrlJEbJGbQ==
X-Google-Smtp-Source: AGHT+IH91DbfT5A1++uWQudUX5J7BBSI6b3R6xnaRanCdVuJCpMkLk4MvNet2Fcb+7qsAoDuJOcpeYvli6nDyIDZP9w=
X-Received: by 2002:a50:d7dc:0:b0:53f:f908:eda8 with SMTP id
 m28-20020a50d7dc000000b0053ff908eda8mr4372874edj.4.1699545869428; Thu, 09 Nov
 2023 08:04:29 -0800 (PST)
MIME-Version: 1.0
References: <1c312ba88e0928527dad6bc2e1b73d8cfe4b7f48.camel@infradead.org>
In-Reply-To: <1c312ba88e0928527dad6bc2e1b73d8cfe4b7f48.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 16:04:17 +0000
Message-ID: <CAFEAcA9oyF1scfpmz-7wYX5j=nGgdG-7uD3nXw3dqhoMi8MHzg@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: clean up xen_block_find_free_vdev() to avoid
 Coverity false positive
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Nov 2023 at 15:30, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Coverity couldn't see that nr_existing was always going to be zero when
> qemu_xen_xs_directory() returned NULL in the ENOENT case (CID 1523906).
>
> Perhaps more to the point, neither could Peter at first glance. Improve
> the code to hopefully make it clearer to Coverity and human reviewers
> alike.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/block/xen-block.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 6d64ede94f..aed1d5c330 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -91,9 +91,27 @@ static bool xen_block_find_free_vdev(XenBlockDevice *blockdev, Error **errp)
>
>      existing_frontends = qemu_xen_xs_directory(xenbus->xsh, XBT_NULL, fe_path,
>                                                 &nr_existing);
> -    if (!existing_frontends && errno != ENOENT) {
> -        error_setg_errno(errp, errno, "cannot read %s", fe_path);
> -        return false;
> +    if (!existing_frontends) {
> +        if (errno == ENOENT) {
> +            /*
> +             * If the frontend directory doesn't exist because there are
> +             * no existing vbd devices, that's fine. Just ensure that we
> +             * don't dereference the NULL existing_frontends pointer, by
> +             * checking that nr_existing is zero so the loop below is not
> +             * entered.
> +             *
> +             * In fact this is redundant since nr_existing is initialized
> +             * to zero, but setting it again here makes it abundantly clear
> +             * to Coverity, and to the human reader who doesn't know the
> +             * semantics of qemu_xen_xs_directory() off the top of their
> +             * head.
> +             */
> +            nr_existing = 0;

You could alternatively assert(nr_existing == 0); here, but I
don't feel strongly about that.

> +        } else {
> +            /* All other errors accessing the frontend directory are fatal. */
> +            error_setg_errno(errp, errno, "cannot read %s", fe_path);
> +            return false;
> +        }
>      }
>
>      memset(used_devs, 0, sizeof(used_devs));
> --
> 2.34.1

thanks
-- PMM

