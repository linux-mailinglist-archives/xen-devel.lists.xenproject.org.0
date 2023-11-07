Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED017E4672
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 17:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628948.980919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0PN8-0004Ue-6s; Tue, 07 Nov 2023 16:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628948.980919; Tue, 07 Nov 2023 16:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0PN8-0004Se-42; Tue, 07 Nov 2023 16:56:14 +0000
Received: by outflank-mailman (input) for mailman id 628948;
 Tue, 07 Nov 2023 16:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0PN6-0004SY-PC
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 16:56:12 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bee6e4c-7d8e-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 17:56:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5437d60fb7aso9956215a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 08:56:08 -0800 (PST)
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
X-Inumbo-ID: 8bee6e4c-7d8e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699376168; x=1699980968; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S8wnXZd9n9mYNzK/2mBf3TewbU55dx3tSwnH/dRyiQ=;
        b=CnLxRlXPrJ1b+cJs0erohxVZJLCQRqAP1/VOUtmjLLp+JSOdqN6AEvPczUIaAK7Ss4
         dmOyp77H7m5BrX1SjVA+NtN8pCQFYrCqsPjUt7LzRPiSivoptEDup90TuttUIFW5SGpY
         iQD3E1VbhlOfPewB9XefS5bBivKY1miri55UpQ9niw/hgK2QRNd7COby0Sn1gXXOzxIw
         /BQIkM+WQpKgxZ3TaYnIRSamRblbvMnA4KhrSSWK5UasMg9JGyzm1ryPJWk4HdrH1a4S
         fV2D+RC2ZcyRiRMNY8hC+Q5Hcf9HdlsVBfnWo0PICmqc+NqNri0YJ9/peOjGzkfFwo81
         r/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699376168; x=1699980968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8S8wnXZd9n9mYNzK/2mBf3TewbU55dx3tSwnH/dRyiQ=;
        b=hfIzfG6Lm9xh86N/paH5Q6s5DgP3VtTqWs2E+wJlfuQyDEDIM9FtCD09Ds5KeVqnrK
         lDg7jc4+XKBWtqpEhL437Wjo0h3YRsh5fqgcdazhQnXtTf9zb+AgVL3ikyXQQjXrw8s5
         bJ9O5uEzpYkRt8CU2mojLSZXwHzv4ZW78q1ziMtE0q3GLWqAsrbP15n9SPnXBRY/8QJ3
         UU/IUrlxgbvkj6xdCL2E4zGsyZMFKKNGNPbiyieB9aHy6jxOkyqgKWT4mx9n0wgr2tN/
         1M6oKscEX34Q6S6LAFCE79SU2J9B+cQNtDGa04d5kPY7e4d2uoXN0l68/Zx5SEthywKn
         NbPw==
X-Gm-Message-State: AOJu0YwbK0mx89qSph5k/wizEVqatzqSPhlf1fMkyb8tRQpKZiv988jO
	WgK60Gj9V5CcJcWmecNTaUwwDw/QlX/lE3DfG58=
X-Google-Smtp-Source: AGHT+IH1V3m/FvGOeTQzeM4bN8ynXMjeeOzMmXRL+ppsYRTpqD+fCnx78sUTh8Cg2w4C6C2p0/l9IjWag3v9FFAMnT4=
X-Received: by 2002:a50:d483:0:b0:544:55c3:ccf9 with SMTP id
 s3-20020a50d483000000b0054455c3ccf9mr8553839edi.22.1699376167649; Tue, 07 Nov
 2023 08:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-17-jgross@suse.com>
In-Reply-To: <20231101093325.30302-17-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 11:55:55 -0500
Message-ID: <CAKf6xpsCb-20cj2pEQGk0LUwHw1cd0Wk7xRW01Y9=trtsRAVrw@mail.gmail.com>
Subject: Re: [PATCH 16/29] tools/xl: support new 9pfs backend xenlogd
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:41=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add support for the new 9pfs backend "xenlogd". For this backend type
> the tag defaults to "Xen" and the host side path to
> "/var/log/xen/guests/<dom-name>".
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index ed983200c3..346532e117 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c

> @@ -2242,6 +2256,27 @@ void parse_config_data(const char *config_source,
>
>              libxl_string_list_dispose(&pairs);
>
> +            if (p9->type =3D=3D LIBXL_P9_TYPE_UNKNOWN) {
> +                p9->type =3D LIBXL_P9_TYPE_QEMU;
> +            }
> +            if (p9->type =3D=3D LIBXL_P9_TYPE_QEMU &&
> +                (p9->max_space || p9->auto_delete)) {

Also check p9->max_open_files and p9->max_files?

Regards,
Jason

