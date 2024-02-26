Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CB867822
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685566.1066481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebur-0000IH-R1; Mon, 26 Feb 2024 14:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685566.1066481; Mon, 26 Feb 2024 14:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebur-0000Eh-NU; Mon, 26 Feb 2024 14:25:13 +0000
Received: by outflank-mailman (input) for mailman id 685566;
 Mon, 26 Feb 2024 14:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x/J1=KD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rebup-0000EW-Db
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:25:11 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8716594-d4b2-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 15:25:10 +0100 (CET)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-204235d0913so2289351fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:25:10 -0800 (PST)
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
X-Inumbo-ID: d8716594-d4b2-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708957509; x=1709562309; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzfpkFb4+SZoPluOOFxi152Tjd1q75L1p2cjJRfljzE=;
        b=TFK9aOIgH9kL1PPY6EPf5eNpTp08j8tQA0NHHI+xHzYDjxiUNsiDuUS3g9Y3jUd29y
         ziqJhu03FoQTvDDJ8KnlfV6Qu8LOPJ5oAT1f2dIkb7NUAjPQzcXng42kK7Jk36CxshLC
         g2LVYRPRSWfr5bMcYLsE4PvfcdM5Al4eWEB1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957509; x=1709562309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzfpkFb4+SZoPluOOFxi152Tjd1q75L1p2cjJRfljzE=;
        b=epFKrM5YSVJtTZz8ldyUwBUDuzK/DI/SpWqUuD26Q6yv0Qx5u9ixXtDuJovXVgOwPf
         Rdak1hOhReb021EmUx64ldikpAq97AmW03VDOeJQpTsjX/WrMT87+K7pzqdgbxVBapKt
         fCm4IQPoWNmdLSxGMOPe20OW7ARJVFjet9fZrciF9J6YuExAvTtRMMn5XX7JzvdesTUl
         Wa6eMMfZbKZ3BFE4XYbpkTxi1PAh2gDFPVpajhG6J1FNGxZ70sglAHsVwjNpMrTSUWrs
         Rgqri0m/2sbqc0rSaCm3xzu4/MD2rGuFFo29tOBjOkMj5CNpzz5gSB3hrK2P/WtT6k4d
         O5+Q==
X-Gm-Message-State: AOJu0YzAe1g2C1YEeoYtxwfd4+e+a5UFJz1SAT1TVTTCwOCCEDiqkte6
	cRiyLHPja/mO6R0OgJ8OqV3VwDqAbC2MEsFqOoUwb8VBoPnzQHB+oOUX1S0Ryw6x26bwEmJDL43
	WnPe0MUbcrPmrQa3v6TeNOPI1SsQ1Vm0KIJoc0w==
X-Google-Smtp-Source: AGHT+IFQLS0Ii3kv0wfg5KnLFK0KwTSnvQVdriSoXE56bvCemxHLlBKffQl+yYSM/qX5M+27ENlO1BVg4ECoiLiJ2+k=
X-Received: by 2002:a05:6870:3450:b0:21e:7e5d:4fde with SMTP id
 i16-20020a056870345000b0021e7e5d4fdemr8047989oah.52.1708957509013; Mon, 26
 Feb 2024 06:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20240226141211.1416866-1-fouad.hilly@cloud.com>
In-Reply-To: <20240226141211.1416866-1-fouad.hilly@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 26 Feb 2024 14:24:51 +0000
Message-ID: <CACHz=Zi=qvEq9seMrTq0p-oiLTx_fzNCPtsaWXokfFdep8pxYQ@mail.gmail.com>
Subject: Re: [PATCH] tools/xentop: Add VBD3 support to xentop
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 2:12=E2=80=AFPM Fouad Hilly <fouad.hilly@cloud.com>=
 wrote:
>
> From: Pritha Srivastava <pritha.srivastava@citrix.com>
>
> xl now knows how to drive tapdisk, so modified libxenstat to
> understand vbd3 statistics.
>
> Signed-off-by: Jorge Martin <jorge.martin@citrix.com>
> Signed-off-by: Pritha Srivastava <pritha.srivastava@citrix.com>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/stat/xenstat_linux.c | 69 ++++++++++++++++++++++++++++++++-
>  tools/libs/stat/xenstat_priv.h  | 16 ++++++++
>  tools/xentop/xentop.c           |  1 +
>  3 files changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_li=
nux.c
> index cbba54aa83ee..5a4a03634182 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -390,6 +390,39 @@ void xenstat_uninit_networks(xenstat_handle * handle=
)
>                 fclose(priv->procnetdev);
>  }
>
> +static int read_attributes_vbd3(char *vbd3_path, xenstat_vbd *vbd)
> +{
> +       FILE *fp;
> +       struct vbd3_stats vbd3_stats;
> +
> +       fp =3D fopen(vbd3_path, "rb");
> +
> +       if (fp =3D=3D NULL)
> +       {

The syntax of this if statement is different from the ones below.

> +               return -1;
> +       }
> +
> +       if (fread(&vbd3_stats, sizeof(struct vbd3_stats), 1, fp) !=3D 1) =
{
> +               fclose(fp);
> +               return -1;
> +       }
> +
> +       if (vbd3_stats.version !=3D 1) {
> +               fclose(fp);
> +               return -1;
> +       }
> +
> +       vbd->oo_reqs =3D vbd3_stats.oo_reqs;
> +       vbd->rd_reqs =3D vbd3_stats.read_reqs_submitted;
> +       vbd->rd_sects =3D vbd3_stats.read_sectors;
> +       vbd->wr_reqs =3D vbd3_stats.write_reqs_submitted;
> +       vbd->wr_sects =3D vbd3_stats.write_sectors;
> +
> +       fclose(fp);
> +
> +       return 0;
> +}
> +
>  static int read_attributes_vbd(const char *vbd_directory, const char *wh=
at, char *ret, int cap)
>  {
>         static char file_name[80];
> @@ -438,7 +471,7 @@ int xenstat_collect_vbds(xenstat_node * node)
>                 int ret;
>                 char buf[256];
>
> -               ret =3D sscanf(dp->d_name, "%3s-%u-%u", buf, &domid, &vbd=
.dev);
> +               ret =3D sscanf(dp->d_name, "%255[^-]-%u-%u", buf, &domid,=
 &vbd.dev);
>                 if (ret !=3D 3)
>                         continue;
>                 if (!(strstr(buf, "vbd")) && !(strstr(buf, "tap")))
> @@ -448,6 +481,8 @@ int xenstat_collect_vbds(xenstat_node * node)
>                         vbd.back_type =3D 1;
>                 else if (strcmp(buf,"tap") =3D=3D 0)
>                         vbd.back_type =3D 2;
> +               else if (strcmp(buf,"vbd3") =3D=3D 0)
> +                       vbd.back_type =3D 3;
>                 else
>                         vbd.back_type =3D 0;
>
> @@ -479,6 +514,38 @@ int xenstat_collect_vbds(xenstat_node * node)
>                                 vbd.error =3D 1;
>                         }
>                 }
> +               else if (vbd.back_type =3D=3D 3)
> +               {
> +
> +                       char *td3_pid;
> +                       char *path;
> +
> +                       vbd.back_type =3D 3;
> +                       vbd.error =3D 0;
> +
> +                       if (asprintf(&path, "/local/domain/0/backend/vbd3=
/%u/%u/kthread-pid", domid, vbd.dev) < 0)
> +                               continue;
> +
> +                       td3_pid =3D xs_read(node->handle->xshandle, XBT_N=
ULL, path, NULL);
> +
> +                       if (td3_pid =3D=3D NULL) {
> +                               free(path);
> +                               continue;
> +                       }
> +
> +                       free(path);

Why not freeing "path" unconditionally? We free it in all cases.

> +
> +                       if (asprintf(&path, "/dev/shm/td3-%s/vbd-%u-%u", =
td3_pid, domid, vbd.dev) < 0) {
> +                               free(td3_pid);
> +                               continue;
> +                       }
> +
> +                       if (read_attributes_vbd3(path, &vbd) < 0)
> +                               vbd.error =3D 1;
> +
> +                       free(td3_pid);
> +                       free(path);
> +               }
>                 else
>                 {
>                         vbd.error =3D 1;
> diff --git a/tools/libs/stat/xenstat_priv.h b/tools/libs/stat/xenstat_pri=
v.h
> index 4eb44a8ebb84..c3a9635240e9 100644
> --- a/tools/libs/stat/xenstat_priv.h
> +++ b/tools/libs/stat/xenstat_priv.h
> @@ -98,6 +98,22 @@ struct xenstat_vbd {
>         unsigned long long wr_sects;
>  };
>
> +struct vbd3_stats {
> +       uint32_t version;
> +       uint32_t __pad;
> +       uint64_t oo_reqs;
> +       uint64_t read_reqs_submitted;
> +       uint64_t read_reqs_completed;
> +       uint64_t read_sectors;
> +       uint64_t read_total_ticks;
> +       uint64_t write_reqs_submitted;
> +       uint64_t write_reqs_completed;
> +       uint64_t write_sectors;
> +       uint64_t write_total_ticks;
> +       uint64_t io_errors;
> +       uint64_t flags;
> +};
> +
>  extern int xenstat_collect_networks(xenstat_node * node);
>  extern void xenstat_uninit_networks(xenstat_handle * handle);
>  extern int xenstat_collect_vbds(xenstat_node * node);
> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
> index 0a2fab7f15a3..f5a456fd4dfd 100644
> --- a/tools/xentop/xentop.c
> +++ b/tools/xentop/xentop.c
> @@ -1124,6 +1124,7 @@ void do_vbd(xenstat_domain *domain)
>                 "Unidentified",           /* number 0 */
>                 "BlkBack",           /* number 1 */
>                 "BlkTap",            /* number 2 */
> +               "Tapdisk3"           /* number 3 */
>         };
>
>         num_vbds =3D xenstat_domain_num_vbds(domain);
> --
> 2.42.0
>
>

