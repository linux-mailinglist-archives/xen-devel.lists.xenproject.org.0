Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24A7DE175
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 14:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626491.976759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBE7-0004eN-3R; Wed, 01 Nov 2023 13:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626491.976759; Wed, 01 Nov 2023 13:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBE6-0004cT-WD; Wed, 01 Nov 2023 13:25:43 +0000
Received: by outflank-mailman (input) for mailman id 626491;
 Wed, 01 Nov 2023 13:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyBE6-0004cN-At
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 13:25:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2610608a-78ba-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 14:25:39 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54366784377so3245336a12.3; 
 Wed, 01 Nov 2023 06:25:39 -0700 (PDT)
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
X-Inumbo-ID: 2610608a-78ba-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698845139; x=1699449939; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCF1zhy11/Fe+hN4rd/81bLCejebXRQWfFR6ycCtA9k=;
        b=SQOffq+ZciLTEQM6PYnhmVqaSeVajWbQtf9fXddiU9cj+9JzoHPdpnkZqe3SEXg1b2
         8bKNWf5EIcmYESufSs/k2j1o8Po4owdR+ViG/FAEf/yVstt2MY9sjUVL2HPrQPrPu20h
         AIClMbbwKGG+0lJB76yGPj9QLr2ABKIdGDE3wpVWUMV0JNsA8QBB/65oydsz17kdIXbp
         Ljc3sJeX9azUSz+G8EpsPxuRCPajrq8Uc2kXzBUXgAfOBxnhi4qOlAMiWWqR2fCz2gzE
         8cNWidCyHr32LvbWElvOxBFBrCVAJXtGv1Jhk58nmpvgNLPuhIoRCQMhfFv0dAjDfTnr
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698845139; x=1699449939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCF1zhy11/Fe+hN4rd/81bLCejebXRQWfFR6ycCtA9k=;
        b=cWd7x69TejbtP8Qvym8BeY+PWLSw8rqezO+qYYpr99jeOkWP1Wf9ZT8f080lmVncta
         v0rzlWoXKtEVj1cYGMxLaibX3xxvzgo6SUQywwZhAJ4pO0ueCrSaenF3xdr9CJfoiWgX
         lll0wUo6LcHr5hhopAewpBTXpJ41KisZs0wVgy1xWGkMJSYlLpiZK62eL1FZGRMKOYYB
         vf6CPFlvDotwyJvmJcmyzntZCR2imEWyi90gU8AfUETfDzx8de3KBTKCzpcMziqQjH3s
         nTpM0FXpu34ziyEktk1AkaWkimR2ssJ5frNgl9icXG4W/6hns50avK6f/wktan31tJ+n
         PEgQ==
X-Gm-Message-State: AOJu0YzQiZn0qAf7qAsassW4VG7cOHZX87hHiymMshWHTyXTOP68yv/u
	UnSDdV6cg/+tQbTFiEnQQnEY+8jMAHqKDge2q0M=
X-Google-Smtp-Source: AGHT+IF1axa/MKEsPRAOd1R9uRwuGn035Um1vtposdppp9lk1lRuoboHM+BnS+xmXTW1qUC2rF0DDtuARXqX3L9nMf8=
X-Received: by 2002:a50:950f:0:b0:543:7401:88b0 with SMTP id
 u15-20020a50950f000000b00543740188b0mr3769398eda.16.1698845138762; Wed, 01
 Nov 2023 06:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231101090024.28934-1-jgross@suse.com> <20231101090024.28934-4-jgross@suse.com>
In-Reply-To: <20231101090024.28934-4-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 09:25:27 -0400
Message-ID: <CAKf6xpuo3RTdf9aPZ6_jZ42cbwD=5NzDE59OYorK9OZe2zyVDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] Mini-OS: fix 9pfs stat receive format
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org, wl@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:14=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> The format string of the received data for the 9pfs stat command is
> missing the initial 2 byte total length specifier. Add it.
>
> Fixes: 2d1dfccd3aa3 ("Mini-OS: add read and write support to 9pfsfront")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  9pfront.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/9pfront.c b/9pfront.c
> index 5da8a365..43c7409f 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -711,6 +711,7 @@ static int p9_create(struct dev_9pfs *dev, uint32_t f=
id, char *path,
>  static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *s=
tat)
>  {
>      struct req *req =3D get_free_req(dev);
> +    uint16_t total;
>      int ret;
>
>      if ( !req )
> @@ -719,10 +720,10 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t f=
id, struct p9_stat *stat)
>      memset(stat, 0, sizeof(*stat));
>      req->cmd =3D P9_CMD_STAT;
>      send_9p(dev, req, "U", fid);
> -    rcv_9p(dev, req, "uuUQUUULSSSSSUUU", &stat->size, &stat->type, &stat=
->dev,
> -           stat->qid, &stat->mode, &stat->atime, &stat->mtime, &stat->le=
ngth,
> -           &stat->name, &stat->uid, &stat->gid, &stat->muid, &stat->exte=
nsion,
> -           &stat->n_uid, &stat->n_gid, &stat->n_muid);
> +    rcv_9p(dev, req, "uuuUQUUULSSSSSUUU", &total, &stat->size, &stat->ty=
pe,
> +           &stat->dev, stat->qid, &stat->mode, &stat->atime, &stat->mtim=
e,
> +           &stat->length, &stat->name, &stat->uid, &stat->gid, &stat->mu=
id,
> +           &stat->extension, &stat->n_uid, &stat->n_gid, &stat->n_muid);

total is unused by the linux frontend end as well.  Looks like QEMU
hard codes the value as 0.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

