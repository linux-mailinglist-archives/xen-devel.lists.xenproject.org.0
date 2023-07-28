Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B530767741
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571579.895783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUSh-0003zs-H6; Fri, 28 Jul 2023 20:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571579.895783; Fri, 28 Jul 2023 20:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUSh-0003xS-EI; Fri, 28 Jul 2023 20:53:23 +0000
Received: by outflank-mailman (input) for mailman id 571579;
 Fri, 28 Jul 2023 20:53:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPUSg-0003xK-CA
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:53:22 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c97e5b83-2d88-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 22:53:21 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so4364253e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:53:21 -0700 (PDT)
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
X-Inumbo-ID: c97e5b83-2d88-11ee-b24e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690577601; x=1691182401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMiw203K4J1QqbZR+FNDuty6xspMnbX3FwOLTg82wGA=;
        b=h5vHC/+8lHP1RoI/jqV9bsErZSl9ocnpgGEbknaIQjJb4sCy1T9UPLjz9276ZXZ6Pn
         JGR2NB0xb4UbsDRYv+jWITA3cs5YuNGzc90KOSVo1JfxpG7NivrJvL3GL5h+qGyRF2U7
         kg8hJ+GV9h4P+fb1UJb4IBtlOla/ZjcCrf6LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690577601; x=1691182401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMiw203K4J1QqbZR+FNDuty6xspMnbX3FwOLTg82wGA=;
        b=XnVyEXy2lRU9jMBczHfw9FcvCK3odDk4T6MF1MKGtbJNCqYdD2QChWwXe0OFDvYXoi
         C+K/7MYBeSPPuW9LcZ0UfZE0GY6Fd2awMJD65C1AK+/q+iDZz3ABDO94a3ofCDrB9AnP
         NK8FbdCFYi+XyuMiB4LViekcxibk3wWXsmcQJOj7Vga3zRWw/TlN6+dqXtXFBtTxqjal
         g7IAL60mayi9snKnkQxwHBGm8qgT7qt98HXfN/n5XPM4+por7ZGIaSr6KV6AN8aN7ZOj
         H5uFRvrmKQbvN19Rdq2VqIdPHXESdUzZy6nxEqEzLhkYBK6ng+1XMwsIKidWU86h3RB1
         GliA==
X-Gm-Message-State: ABy/qLZjhFD+bnn5Mgu7a1bwTmPBqVB3LWY+rffe4AYXeFS2qpcZcxZg
	C2L8BI+eGqmluzb/azS8L1LJhl0R8JDeuVFjiKUaDFIstq87mOLfJDs=
X-Google-Smtp-Source: APBJJlGQg1YwmJcRLDOuMx7U4NuJQhXCse9SAZPGaR4K3+Bjndl8v3teM1r7RhKLpdVvi2SrweZeMJQ8BJgfGYbfxiM=
X-Received: by 2002:a19:670d:0:b0:4f9:5a61:194f with SMTP id
 b13-20020a19670d000000b004f95a61194fmr2670970lfc.11.1690577601132; Fri, 28
 Jul 2023 13:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230526123810.23210-1-olaf@aepfle.de>
In-Reply-To: <20230526123810.23210-1-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:53:10 +0100
Message-ID: <CA+zSX=ZphEOw0_1pZKRUPJ7aeNMAeMGTiM8rSprt9vX=NLT1Hg@mail.gmail.com>
Subject: Re: [PATCH v1] xentrace: adjust exit code for --help option
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000006192e4060192457c"

--0000000000006192e4060192457c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 1:38=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> Invoking the --help option of any tool should not return with an error,
> if that tool does have a documented and implemented help option.
>
> Adjust the usage() function to exit with either error or success.
> Handle the existing entry in the option table to call usage accordingly.
>
> Adjust the getopt value for help. The char '?' is returned for unknown
> options. Returning 'h' instead of '?' allows to handle --help.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--0000000000006192e4060192457c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 1:38=E2=80=AF=
PM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Invoking=
 the --help option of any tool should not return with an error,<br>
if that tool does have a documented and implemented help option.<br>
<br>
Adjust the usage() function to exit with either error or success.<br>
Handle the existing entry in the option table to call usage accordingly.<br=
>
<br>
Adjust the getopt value for help. The char &#39;?&#39; is returned for unkn=
own<br>
options. Returning &#39;h&#39; instead of &#39;?&#39; allows to handle --he=
lp.<br>
<br>
Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"=
_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed=
-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.du=
nlap@cloud.com</a>&gt;</div></div></div>

--0000000000006192e4060192457c--

