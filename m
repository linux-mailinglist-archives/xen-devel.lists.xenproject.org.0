Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990BC860EF9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684747.1064825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSZ4-0007xz-QZ; Fri, 23 Feb 2024 10:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684747.1064825; Fri, 23 Feb 2024 10:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSZ4-0007v1-NV; Fri, 23 Feb 2024 10:13:58 +0000
Received: by outflank-mailman (input) for mailman id 684747;
 Fri, 23 Feb 2024 10:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdSZ2-0007ut-Pj
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:13:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd2ae7a-d234-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 11:13:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41294136c27so2080565e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:13:54 -0800 (PST)
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
X-Inumbo-ID: 3fd2ae7a-d234-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708683234; x=1709288034; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYx/i9GrfI+eJBfQvx0CCnnCR908o5f36pXd3cbpKyA=;
        b=INL/6K6LjkIUR2mlE1/A3n3O0GoNVEWt8cZCu2l2Um9L/EzBgaNHJdoB1E1DCQ9lZG
         aqu0lDblNSI5zoGqZg8tFrfq0InwU7IzgL+iAjR42hmys9gwpZB3eJZSk2H8UVocN2zq
         5E6f11jBppILulbtWZRr/RoboyF0D9aniHCEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683234; x=1709288034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYx/i9GrfI+eJBfQvx0CCnnCR908o5f36pXd3cbpKyA=;
        b=r+1boFtagkk6jvCsf26t5u/uEDjJrl1TmNc3oYfJpd0/nxSSvcliQcIpqdDjWQvpso
         JP/mVy9pzkjRdfjvMB3oGtW5L3OShSjOMnXOnZN83QqvgPe1H7z5e6gju4Z47fKuf6hY
         V+1j/l/wzeYt6YvkX5RIFN4wYYnkzHREqQdgtWZXhxA/rRyFZkzY9KRX9wDpO3RnGFEa
         5KWtaGiJQ7iRJPF3kpGvl3bOf07PeJQ21OdKZ4COeUaG8OwelGgFB55ytt/ACyFsN6Ne
         3tX9uWntM7Rnem4HQAGx9OcuPoIHPuBPEbxtSHkGBOACWEuQPWPtEGjCtyING0t9rz4X
         JGVA==
X-Gm-Message-State: AOJu0YyIvRezktUt2y+1oqP0FDqA1v8LEWICMWhvrNy3MQHK1RuklNXL
	VeR/8JkxK4Jtyc7N0OzpbFU6gquQEXl4pm3FcFiI8HPURoCcpgjDbkEF8Vz2owkN/Rh+kQL1DTI
	e5OeZsAin2+QXIrnZFNgs6jji8ZKGAYQ/kOluMlqFpXBnZ0mGA3Tm
X-Google-Smtp-Source: AGHT+IF8ULCnUOBOfC87fhhptkF1WEfmbUh5b+9+pjyiUNGEXy7rRztjkyMx8yd6nnoQ1bzMK61SCnQgfG0jlXufxFA=
X-Received: by 2002:a05:600c:524f:b0:412:8fef:7f with SMTP id
 fc15-20020a05600c524f00b004128fef007fmr938713wmb.1.1708683234388; Fri, 23 Feb
 2024 02:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20231130142944.46322-1-roger.pau@citrix.com> <20231130142944.46322-5-roger.pau@citrix.com>
In-Reply-To: <20231130142944.46322-5-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 23 Feb 2024 10:13:43 +0000
Message-ID: <CAG7k0EpTaMiZthxdGGRm6mgxCKFw+g7JaAtCmRM3z+PzAQyKyQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] xen/livepatch: fix norevert test hook setup typo
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 2:31=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> The test code has a typo in using LIVEPATCH_APPLY_HOOK() instead of
> LIVEPATCH_REVERT_HOOK().
>
> Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state =
tracking marker')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/test/livepatch/xen_action_hooks_norevert.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/li=
vepatch/xen_action_hooks_norevert.c
> index 074f8e1d56ce..cdfff156cede 100644
> --- a/xen/test/livepatch/xen_action_hooks_norevert.c
> +++ b/xen/test/livepatch/xen_action_hooks_norevert.c
> @@ -108,7 +108,7 @@ static void post_revert_hook(livepatch_payload_t *pay=
load)
>      printk(KERN_DEBUG "%s: Hook done.\n", __func__);
>  }
>
> -LIVEPATCH_APPLY_HOOK(revert_hook);
> +LIVEPATCH_REVERT_HOOK(revert_hook);
>
>  LIVEPATCH_PREAPPLY_HOOK(pre_apply_hook);
>  LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
> --

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

