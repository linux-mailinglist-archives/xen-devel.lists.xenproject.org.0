Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107219B2F78
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826418.1240658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OOj-0004as-Fr; Mon, 28 Oct 2024 11:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826418.1240658; Mon, 28 Oct 2024 11:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OOj-0004Yu-CE; Mon, 28 Oct 2024 11:59:01 +0000
Received: by outflank-mailman (input) for mailman id 826418;
 Mon, 28 Oct 2024 11:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnZV=RY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t5OOi-0004Yo-FM
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:59:00 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0371bd02-9524-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 12:58:59 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5ec1ee251b8so1204311eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:58:59 -0700 (PDT)
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
X-Inumbo-ID: 0371bd02-9524-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730116737; x=1730721537; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB5w5jPqcBk6gV9hhuFmtBkUwDm3u8UHz4d/0yp+3u4=;
        b=LuxJX0hXtj7H0/DOl7ixiib+aryPsy25lc4IIQXGhzxp/zlrSnu4aDY6+mybzlYAMy
         61nk6XDAhlxW4xw+Ffhn7wSuRxV4TC+YzASowamHqcSFLnSqEdMXKR3hq3420iLh1xjt
         onsG8ilOH7zF4PwmEE7+25nhEmWhks/VgjxxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116737; x=1730721537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB5w5jPqcBk6gV9hhuFmtBkUwDm3u8UHz4d/0yp+3u4=;
        b=jPFdEKJfWKSqF1VnhZ/lIaQSvg1h5jiiFa/y6ZAoYuCVHYS0sH02saoZyVNl7wZNOt
         9lahTZTw8xPqDFKxCQSWHMU7yNgV+O3o+DNIvweKitWyqceOZQnn/9FmDIJZM/usEIHE
         g9vAfd5d63JgfAk6gel2JkkVS+dWwcuNGWxm581+MZklXAB4TE+4UoeYRqBc7ChDRUb4
         gKilKQj/fGQfuq444ntI0V0Za1tzJpV114ZSmS/V5CWCj6f4XuF7/Xt9BhKi/1wlHSO3
         Q2hJHhlpEJtQl5LfS48tG9BzCNR0S82bEQLQBDmopvTN3XGxYsNM+aS6AgCE6yw01x3q
         VXdA==
X-Gm-Message-State: AOJu0YxJw4dB7xA8oeYXStIL1XRp8axvgDPQ2hoVZ3geBfKZ1n/DsFK9
	ice6n91nQXSOCnah0hzY5CWlbqHvxrCcyKezuGIIidUDCSna091w/kOtP372aMeX6CBUe7lfS0r
	83LBuhaPhnnRr+s1sMXuIsNvv1q7dushkDrdnpA==
X-Google-Smtp-Source: AGHT+IEAjqTQtm60v/8Qqdmw3qFuuVUxOOcwQhN2MHJtmllRErOlYEniDteVUkhEYJzZm9u8d4m7uoLw1hkXZ1qv8xQ=
X-Received: by 2002:a05:6820:610:b0:5d6:ab0:b9a6 with SMTP id
 006d021491bc7-5ec22ec2c73mr4868380eaf.4.1730116735940; Mon, 28 Oct 2024
 04:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241028114831.27487-1-roger.pau@citrix.com>
In-Reply-To: <20241028114831.27487-1-roger.pau@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Oct 2024 11:58:45 +0000
Message-ID: <CACHz=Zh8exkDyYpNzwoef5i=ZevAAiDtgssxqAtB+0DYHzyjsA@mail.gmail.com>
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 11:48=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.=
com> wrote:
>
> Clang 19 complains with the following error when building libxl:
>
> libxl_utils.c:48:15: error: variable length array folded to constant arra=
y as an extension [-Werror,-Wgnu-folding-constant]
>    48 |     char path[strlen("/local/domain") + 12];
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
> string length to be known at build time.  Note ARRAY_SIZE() accounts for =
the
> NUL terminator while strlen() didn't, hence subtract 1 from the total siz=
e
> calculation.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/libs/light/libxl_utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_util=
s.c
> index 10398a6c8611..b3f5e751cc3f 100644
> --- a/tools/libs/light/libxl_utils.c
> +++ b/tools/libs/light/libxl_utils.c
> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned=
 long maxmem_kb, unsigned
>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>  {
>      unsigned int len;
> -    char path[strlen("/local/domain") + 12];
> +    char path[ARRAY_SIZE("/local/domain") + 11];
>      char *s;
>
>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *c=
tx, const char *p,
>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>  {
>      unsigned int len;
> -    char path[strlen("/local/pool") + 12];
> +    char path[ARRAY_SIZE("/local/pool") + 11];
>      char *s;
>
>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);

Minor: why not sizeof instead of ARRAY_SIZE ?

Not a regression, but looking at final strings and size added, it
looks like the numbers should be more uint16_t than uint32_t.
Maybe we want something like

    char path[sizeof("/local/pool//name") + 12];

BTW,

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

