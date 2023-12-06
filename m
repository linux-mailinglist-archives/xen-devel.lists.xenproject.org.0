Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23420807553
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649360.1013790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuvQ-0002KU-Lk; Wed, 06 Dec 2023 16:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649360.1013790; Wed, 06 Dec 2023 16:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAuvQ-0002I9-I6; Wed, 06 Dec 2023 16:39:04 +0000
Received: by outflank-mailman (input) for mailman id 649360;
 Wed, 06 Dec 2023 16:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uigp=HR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rAuvO-0002I1-Sq
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:39:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f635696d-9455-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 17:39:02 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54ca339ae7aso5405420a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 08:39:02 -0800 (PST)
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
X-Inumbo-ID: f635696d-9455-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701880741; x=1702485541; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85R6sL+gTap+ilOb4evLb16t6l8BFOI59a3XBVqZvO0=;
        b=cPug4vMykZUMVUlZnFSC9Zmjgb/S1jObKfdEv3yFLwH7x8s8FmJL5vpUBCdiT1vlVI
         +4mLX1xVjee/gDvyzYWpRr2cdLXEtZHQFog54WaKPtdSXhrfOY0cyGbHc4AOiecs7Nve
         me8zLdSc52QBc/k+IIkh338GFL4csswRRu7TgxD4TZSpzIssoB+HtyBJW+YNjSmKEsrT
         38D5o2e7HQG9m2pkL5vLZsvoJvX1H25ZBmBLY2+jLIbBrLISvXt00qXYjQqdVU09t6Q+
         +uWoQh5FE2zUAmIm3yHZWO1FUVRUUS805Hmgv/+UI/SxE5Had1JIUDfgAnLIa6K6NZb6
         /1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701880741; x=1702485541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85R6sL+gTap+ilOb4evLb16t6l8BFOI59a3XBVqZvO0=;
        b=MsFAOG5UE/IseBBbs56yhG3h2y1He3IGgNQx6DVY01u97oI+A1NOQSoZRrHs+YDKtr
         fN/CSATvvHtItJcv3VuNM9/U+MYg/0PwB+X6ZpljWfPxl5C+chTuvjYS4QLnjTSJh9kC
         ZG1xUboeuz/xKtOUNQyCKNGHONT5ruV+VIjT17p478dJKMOMV5kGZAouRfyj4x0maEih
         /3EQFoLBc5+FWdYZY4Z28EXifmElNbXDlOU6iGIsaVF1n9czni/AthWctEARLtDI/mzG
         YiFWQ/UXqywxaUMze1MGvQm5yw83QFkS35jv7xUdBll4c8s/AZUmeKmjq4OvkECx7Oyz
         3EKQ==
X-Gm-Message-State: AOJu0Yx0hc8YNxJP+xBYldTzzcscC8QRy8Nl+qGgIpzX1Fz3wuwf43o3
	ThDL0fL+KjC82Y/aKNJXeN4sQxOxtHX7MST8+PQ=
X-Google-Smtp-Source: AGHT+IE9oW1ghjHq/4apPyrKjm2LaL2ZCUAtwq8lLLeQI5bOeplCMv0n/k1iduFid0Ee0JxOjYOuAV0q0tIYcK5H61E=
X-Received: by 2002:a50:8a93:0:b0:54a:fb41:a294 with SMTP id
 j19-20020a508a93000000b0054afb41a294mr721702edj.15.1701880741285; Wed, 06 Dec
 2023 08:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20231206144009.29154-1-jgross@suse.com>
In-Reply-To: <20231206144009.29154-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Dec 2023 11:38:48 -0500
Message-ID: <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
Subject: Re: [PATCH] tools/libs/evtchn: drop assert()s in stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 9:40=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> In tools/libs/evtchn/minios.c there are assert()s for the current
> thread being the main thread when binding an event channel.
>
> As Mini-OS is supporting multiple threads, there is no real reason
> why the binding shouldn't be allowed to happen in any other thread.
>
> Just drop the assert()s.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/evtchn/minios.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> index 28743cb055..e33ddec7e7 100644
> --- a/tools/libs/evtchn/minios.c
> +++ b/tools/libs/evtchn/minios.c
> @@ -195,7 +195,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound_port=
(xenevtchn_handle *xce,
>      int ret;
>      evtchn_port_t port;
>
> -    assert(get_current() =3D=3D main_thread);
>      port_info =3D port_alloc(xce);

If multiple threads are allowed, does port_list need to gain a lock
protecting it?

Regards,
Jason

