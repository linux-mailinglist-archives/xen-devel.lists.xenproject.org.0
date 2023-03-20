Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5A6C1D71
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 18:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512033.791615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJ3c-0001HB-Je; Mon, 20 Mar 2023 17:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512033.791615; Mon, 20 Mar 2023 17:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJ3c-0001FT-Gj; Mon, 20 Mar 2023 17:12:28 +0000
Received: by outflank-mailman (input) for mailman id 512033;
 Mon, 20 Mar 2023 17:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkzI=7M=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1peJ3b-0001FN-UO
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:12:27 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62b6cddd-c742-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 18:12:25 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id x3so49534321edb.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 10:12:25 -0700 (PDT)
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
X-Inumbo-ID: 62b6cddd-c742-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679332345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGN6e1q74LQ5QCSwzWx/x0h7n+AXpgaDAdt+Y9beFxw=;
        b=TduIEY4FulqwkNzsly48VAc2YnHBventC0+oFJDHznhXB7JKnXmemV3h7CrJ/BNOLG
         OcwUaAzr2YwslVMHQ74Ray9WhDoATGC6iRMGV8CP/ZBciWKp0pDluXtyVel54RRRZINk
         Rt1/2a0y9ZIWV5LI15jxIicVhaGUREbEoGCrn0Cj70ywb2A2ttAyF+x2ysAtS2z3m9CP
         dbzjuGTgJP/Impc5wE0RDSBe2kIUefb+QuqGIebMm0Iai1y4NIyHPuECp4+PFnZxjq79
         ST3o0p2hYrjTuYBbrXy1Huv2DEpqHnVgFVgDEjoPFSVqwoOQdZ6kMV9IKVeytvGA925G
         rqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGN6e1q74LQ5QCSwzWx/x0h7n+AXpgaDAdt+Y9beFxw=;
        b=MMTAzGvvqP1cNygEPtKXFoR8Z/LVZZimhQ4b0zyoyu867mg5djNipD+6p19k/4y6ci
         ptidwLhKy5L7xFiqWczNP/kYnqZ8+I9DR5PoSfpRL7DN843VdbNZ9OBMG7owUfGYF4mV
         xqg62F1khoMSFxOuoxwR0NBHF3eBwnEOZ7O8rnDAheYTCwnUoObpInPadLbGwmfPpC0A
         wEYdNMb8UFr+pL9Vn7oBiF+ajezS212OZH7E9SNlYcfUf4nCvatHH2WAE/KDkM5+VLFq
         q1/p/ktvnb5VlBnjHhXfZ26O+6gh5oWtPYExxvJhSQqoGMTacAtOP/JClLKHTB+6kxLh
         II/w==
X-Gm-Message-State: AO0yUKXCvkkBUp86WQjNQriM+oV5bEO1Yc+bFHjPhCrk/RLYg3bDVccl
	6kCIufW3te7Xipb81A3aOt172ziz/Xf+lCLsM1s=
X-Google-Smtp-Source: AK7set+y2Ayhl0AQddHC3jf3Mkig6zRhs0nQIwphp8tRgFFr7PmS8d7T/yBQvDF/Z7w/tSmIbzcBZybCsUbUBBnXu30=
X-Received: by 2002:a50:d55d:0:b0:4ad:6052:ee90 with SMTP id
 f29-20020a50d55d000000b004ad6052ee90mr150308edj.7.1679332345189; Mon, 20 Mar
 2023 10:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230317111546.18061-1-jgross@suse.com> <20230317111546.18061-3-jgross@suse.com>
In-Reply-To: <20230317111546.18061-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Mar 2023 13:12:13 -0400
Message-ID: <CAKf6xpuaXyPqP72QwjaZZM2ana68ZG9kXQyHr9Vd7Y-_1YDV2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 7:16=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Rework the config parsing of a p9 device to use the
> split_string_into_pair() function instead of open coding it.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/xl/xl_parse.c | 72 ++++++++++++++++++++++-----------------------
>  1 file changed, 35 insertions(+), 37 deletions(-)
>
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 2f9dfea05c..715e14f95f 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2111,54 +2111,52 @@ void parse_config_data(const char *config_source,
>
>      if (!xlu_cfg_get_list(config, "p9", &p9devs, 0, 0)) {
>          libxl_device_p9 *p9;
> -        char *security_model =3D NULL;
> -        char *path =3D NULL;
> -        char *tag =3D NULL;
> -        char *backend =3D NULL;
> -        char *p, *p2, *buf2;
>
>          d_config->num_p9s =3D 0;
>          d_config->p9s =3D NULL;
>          while ((buf =3D xlu_cfg_get_listitem (p9devs, d_config->num_p9s)=
) !=3D NULL) {
> +            libxl_string_list pairs;
> +            int len;
> +
>              p9 =3D ARRAY_EXTEND_INIT(d_config->p9s,
>                                     d_config->num_p9s,
>                                     libxl_device_p9_init);
>              libxl_device_p9_init(p9);
>
> -            buf2 =3D strdup(buf);
> -            p =3D strtok(buf2, ",");
> -            if(p) {
> -               do {
> -                  while(*p =3D=3D ' ')
> -                     ++p;
> -                  if ((p2 =3D strchr(p, '=3D')) =3D=3D NULL)
> -                     break;
> -                  *p2 =3D '\0';
> -                  if (!strcmp(p, "security_model")) {
> -                     security_model =3D strdup(p2 + 1);
> -                  } else if(!strcmp(p, "path")) {
> -                     path =3D strdup(p2 + 1);
> -                  } else if(!strcmp(p, "tag")) {
> -                     tag =3D strdup(p2 + 1);
> -                  } else if(!strcmp(p, "backend")) {
> -                     backend =3D strdup(p2 + 1);
> -                  } else {
> -                     fprintf(stderr, "Unknown string `%s' in 9pfs spec\n=
", p);
> -                     exit(1);
> -                  }
> -               } while ((p =3D strtok(NULL, ",")) !=3D NULL);
> -            }
> -            if (!path || !security_model || !tag) {
> -               fprintf(stderr, "9pfs spec missing required field!\n");
> -               exit(1);
> +            split_string_into_string_list(buf, ",", &pairs);
> +            len =3D libxl_string_list_length(&pairs);
> +            for (i =3D 0; i < len; i++) {
> +                char *key, *value;
> +                int rc;
> +
> +                rc =3D split_string_into_pair(pairs[i], "=3D", &key, &va=
lue,
> +                                            isspace);
> +                if (rc !=3D 0) {
> +                    fprintf(stderr, "failed to parse 9pfs configuration:=
 %s",
> +                            pairs[i]);
> +                    exit(1);
> +                }
> +
> +                if (!strcmp(key, "security_model")) {
> +                    replace_string(&p9->security_model, value);
> +                } else if (!strcmp(key, "path")) {
> +                    replace_string(&p9->path, value);
> +                } else if (!strcmp(key, "tag")) {
> +                    replace_string(&p9->tag, value);
> +                } else if (!strcmp(key, "backend")) {
> +                    replace_string(&p9->backend_domname, value);
> +                } else {
> +                    fprintf(stderr, "Unknown 9pfs parameter '%s'\n", key=
);
> +                    exit(1);
> +                }
> +                free(key);
> +                free(value);
>              }
> -            free(buf2);

I think you need libxl_string_list_dispose(&pairs); somewhere around here?

The rest looks good.

Regards,
Jason

