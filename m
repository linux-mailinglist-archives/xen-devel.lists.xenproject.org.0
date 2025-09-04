Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B75B43CFA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110197.1459491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9uX-0004cY-C3; Thu, 04 Sep 2025 13:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110197.1459491; Thu, 04 Sep 2025 13:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu9uX-0004aT-7l; Thu, 04 Sep 2025 13:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1110197;
 Thu, 04 Sep 2025 13:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hTYN=3P=kernel.org=rafael@srs-se1.protection.inumbo.net>)
 id 1uu9uV-0004YW-MD
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 13:21:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7456b7-8992-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 15:21:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3CBC44236
 for <xen-devel@lists.xenproject.org>; Thu,  4 Sep 2025 13:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8522BC4CEF6
 for <xen-devel@lists.xenproject.org>; Thu,  4 Sep 2025 13:21:52 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-74572fb94b3so841333a34.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 06:21:52 -0700 (PDT)
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
X-Inumbo-ID: 1f7456b7-8992-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756992112;
	bh=qo4+GKLXGFiTNyOVP1QuBOi8BIKyb9sSiyMt3ybbC2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eeBjgvvhch4OWm+EspsXnXLs/o7YMHOSmgBmoqgtPdGUdyXiMV0vaXKJ9/999FwL7
	 xYnNZECKOcdKvFk2iksunSYqzVGLkoQBVweinX6P3KP2ORG6QfSVuvaeNaJiL0cqGp
	 MQ8dlBChywKAul9qx8/bFruLIbhVS4P8LG9KizpsrI7IuYuy+1Z9XfbsCpMYapM+cA
	 QbvFNL6VZorckg+NyMacmAkzPk/1lBUOLBF2oWUOjdsQSf4ZctiS5Qxzgc/aGm6iiE
	 Dn7sXNNHqcreStGTex+aJc/CoYjELH37LNeiucVfOyQvyAqACILDbJ4Cuat+m6Mc7R
	 yC9/FxWqFAQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWXiIOdAtKbMwp9ShmMsyyj2G3e1IQoH29hIYAzznd3Gj1ioTqZPBJ0bhUyw4qz7SpAYKLyU/yCK5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVMK9QEtuPCz2tZ0jHDBw4U3Me2QUADJPSozLLNz3yMeCKKRt8
	gBGqNDqV6ljIRIf5ctzez9v3q/Z+bV+u0N2dOcPuvXU9zyHullNKjRj1TRBiEZiORrwaxYAMcp9
	ayqjajL4IB2/JbjelSW+cYsh+cmeFzP0=
X-Google-Smtp-Source: AGHT+IHdGmlphfFGnt50ls1k7J1BDOKrtbE9wl3KpQcDoUFFaeFaf1j5/HssvVcWfRiAfoPn5J7l0vswcNJLXQD8K1s=
X-Received: by 2002:a05:6830:3c86:b0:745:4738:fc49 with SMTP id
 46e09a7af769-74569d94b2amr10619839a34.5.1756992111835; Thu, 04 Sep 2025
 06:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <22453676d1ddcebbe81641bb68ddf587fee7e21e.1756990799.git.lukas@wunner.de>
In-Reply-To: <22453676d1ddcebbe81641bb68ddf587fee7e21e.1756990799.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 4 Sep 2025 15:21:40 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jTUrCj6YkQd7ab1LdTaHGU-SGVswm=TUhmN0yDmRxkpA@mail.gmail.com>
X-Gm-Features: Ac12FXxuisaRR3J61UIxjJaNL4wSskbcFfNo2uvlzP8vHcRTSEW7Y5HYs2DQgBI
Message-ID: <CAJZ5v0jTUrCj6YkQd7ab1LdTaHGU-SGVswm=TUhmN0yDmRxkpA@mail.gmail.com>
Subject: Re: [PATCH] xen/manage: Fix suspend error path
To: Lukas Wunner <lukas@wunner.de>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 3:11=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> The device power management API has the following asymmetry:
> * dpm_suspend_start() does not clean up on failure
>   (it requires a call to dpm_resume_end())
> * dpm_suspend_end() does clean up on failure
>   (it does not require a call to dpm_resume_start())
>
> The asymmetry was introduced by commit d8f3de0d2412 ("Suspend-related
> patches for 2.6.27") in June 2008:  It removed a call to device_resume()
> from device_suspend() (which was later renamed to dpm_suspend_start()).
>
> When Xen began using the device power management API in May 2008 with
> commit 0e91398f2a5d ("xen: implement save/restore"), the asymmetry did
> not yet exist.  But since it was introduced, a call to dpm_resume_end()
> is missing in the error path of dpm_suspend_start().  Fix it.
>
> Fixes: d8f3de0d2412 ("Suspend-related patches for 2.6.27")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org  # v2.6.27

Thanks for catching this!

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
> kexec suffered from the same issue ever since it began using the
> device power management API in July 2008 with commit 89081d17f7bb
> ("kexec jump: save/restore device state").  It was fixed this year
> by commit 996afb6efd1a ("kexec_core: Fix error code path in the
> KEXEC_JUMP flow").  All other callers seem fine.
>
>  drivers/xen/manage.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
> index 841afa4..1f5a7a4 100644
> --- a/drivers/xen/manage.c
> +++ b/drivers/xen/manage.c
> @@ -110,7 +110,7 @@ static void do_suspend(void)
>         err =3D dpm_suspend_start(PMSG_FREEZE);
>         if (err) {
>                 pr_err("%s: dpm_suspend_start %d\n", __func__, err);
> -               goto out_thaw;
> +               goto out_resume_end;
>         }
>
>         printk(KERN_DEBUG "suspending xenstore...\n");
> @@ -150,6 +150,7 @@ static void do_suspend(void)
>         else
>                 xs_suspend_cancel();
>
> +out_resume_end:
>         dpm_resume_end(si.cancelled ? PMSG_THAW : PMSG_RESTORE);
>
>  out_thaw:
> --
> 2.50.1
>
>

