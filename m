Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C315771242E
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 12:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540034.841463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UJc-0006eg-HW; Fri, 26 May 2023 10:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540034.841463; Fri, 26 May 2023 10:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UJc-0006c7-EE; Fri, 26 May 2023 10:04:56 +0000
Received: by outflank-mailman (input) for mailman id 540034;
 Fri, 26 May 2023 10:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X81t=BP=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1q2UJb-0006KH-3q
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 10:04:55 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2705a06-fbac-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 12:04:53 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so5409661fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 03:04:53 -0700 (PDT)
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
X-Inumbo-ID: c2705a06-fbac-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685095493; x=1687687493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rhHiPT1CszJKo1aBZSqdDVYp8Mb+er3glqmeqq9eATg=;
        b=hRcIVYFerwrgJ5fKQE1NlOqPrauqwyPkQrQ2a+yM/z6kZZ05CdXStzzTFad1xtJNbV
         /LNRHmP4wPK96zUTIhX0iKqakFl1oi4QfNxTlZSK5CZJvVKvzX/5H6YZ6JY0sn3lnLW6
         p98j7i2TWgOqV49UojL47qzkBOiNL/NlU1XQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685095493; x=1687687493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhHiPT1CszJKo1aBZSqdDVYp8Mb+er3glqmeqq9eATg=;
        b=AzoOGpa2u7QAPmk6WSmHeabkDIPkRl+TiMWNAVnv3bRL7FVvd6JGAcQb3tY9INaXwD
         wuSEUVerdRhZ42JoxEI6tUz8/B3IaA8gP0DZAt5EIyfhOgDlo/R41YY/It2WnYuZtYjo
         mf9ZLs6CbYZHsQrJn4FvC+8KEVe6LQlsV1SuEJKm/elJ8Ea3/9bHlDIDwA6d07FzrHey
         C2XTEKZ24qrvKc4otRKiXBh9AqceT7duVdhjdTpptaijYEGTZd2lVP/hkarhxQLHjjMU
         xW4Z0TaWOjYo3AyDJMgKeY2vpFzscJuJUiTuE6pODX+e7jIqpq4HpQykfx1V4rxeVBLA
         AvUw==
X-Gm-Message-State: AC+VfDxVxzoaSta4kv9o4KHMwQ6+HQHvjGchyA2b5bpK0pRuDrev/w7x
	2d/bTyx/vyjJlVx2+h7+Wjf1fcATb0bOWD0AxzmesQ==
X-Google-Smtp-Source: ACHHUZ4lhqvWR9UdWmKFj7cZVhxUQM6UX7dg1VM6yf4OE/MClMEvIrEV3GPQHTc94COuR1/2EezLGCAJ564Rq+agaxE=
X-Received: by 2002:a2e:c49:0:b0:2af:2786:2712 with SMTP id
 o9-20020a2e0c49000000b002af27862712mr525171ljd.25.1685095492954; Fri, 26 May
 2023 03:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230526072916.7424-1-olaf@aepfle.de> <20230526072916.7424-2-olaf@aepfle.de>
In-Reply-To: <20230526072916.7424-2-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 May 2023 11:04:42 +0100
Message-ID: <CA+zSX=ayTmoFY+jyyvnM9ug4pXGGz-NAcXj4F7YtWn1jmmYF8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] xentrace: allow xentrace to write to stdout
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000045450a05fc95de71"

--00000000000045450a05fc95de71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 8:29=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrote:

> The output file is optional. In case it is missing, xentrace is supposed
> to write to stdout - unless it is a tty, which is checked prior using it.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Acked-by: George Dunlap <george.dunlap@cloud.com>

--00000000000045450a05fc95de71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 8:29=E2=80=AF=
AM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The outp=
ut file is optional. In case it is missing, xentrace is supposed<br>
to write to stdout - unless it is a tty, which is checked prior using it.<b=
r>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Acked-by=
: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunla=
p@cloud.com</a>&gt;</div></div></div>

--00000000000045450a05fc95de71--

