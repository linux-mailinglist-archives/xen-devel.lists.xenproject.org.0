Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC8C767724
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571573.895763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUG5-0001pf-6f; Fri, 28 Jul 2023 20:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571573.895763; Fri, 28 Jul 2023 20:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPUG5-0001mf-43; Fri, 28 Jul 2023 20:40:21 +0000
Received: by outflank-mailman (input) for mailman id 571573;
 Fri, 28 Jul 2023 20:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPUG3-0001mZ-Mx
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:40:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59b1373-2d86-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:40:16 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe07f0636bso4407359e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:40:16 -0700 (PDT)
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
X-Inumbo-ID: f59b1373-2d86-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690576816; x=1691181616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pCGCTqjvNfijuEdCDapoDKUJntymKMHLXX3/sqNqZps=;
        b=NL0UfX1+Dtcxp+L9/tsTqrf5MeiZUFGZSPqGNDLus2xv7CrS8GJr+D77woY9tsgrPe
         4hkWWY82Ogxl8ALgmyqZ70r0J8YGv9gE0EN6nqZy4HtXpqhXM11feBtJhwy6E8Pgphj3
         KxzyQPbHcPyen7WDqhhfyOI+L0asxVEWS+Sng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690576816; x=1691181616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCGCTqjvNfijuEdCDapoDKUJntymKMHLXX3/sqNqZps=;
        b=AjCbZaeK6/STUOT/GIU542anpXuveIIV8Bj8T0qTjGlY7AAiyNk4gpTNjbSqt/dFfN
         HMo0+fuc+3RyLID7pHt1LrEWCR6CMi70NPD2bKF8C2T7CwIFD1coA88l0ZPGap02c6/T
         Hp/WJXD64gW6iA+Yf5PNrMrvFTIwcV4O+Kh08DkX1saaHD6/icHq83zMNVisC7WyR6/N
         Qsl33leG8bXxNd9csQ0JL3X1S1rdp2cO700tGrrD4tRdymcAkV3xhj8signoPKM2D0IK
         sLzJNtDpBnXZ1jg1mA6dDebQ7BO9M9zDrl12iTP95MiPHyNACBJdPRUl0F4cul4Yj7kQ
         7w2w==
X-Gm-Message-State: ABy/qLZx2I426waKXYtIUXrzSMSjij2jv/cgZksGfGtRwrlkDac67UVD
	WyVSA1Hko8s1zL1ra2OIhqr+3qZypSyBvPsgLN/dTA==
X-Google-Smtp-Source: APBJJlEAXzj8rTp/9CYQeFhJJLoPjA1NztAipwcD+XPg2iCN1rCPJmN1aZ2v00YuWRg45+EzmXFK+0hN4sastbP8Q4s=
X-Received: by 2002:a19:4f5c:0:b0:4fe:c6c:ac95 with SMTP id
 a28-20020a194f5c000000b004fe0c6cac95mr2214716lfk.35.1690576816095; Fri, 28
 Jul 2023 13:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-7-olaf@aepfle.de>
 <CA+zSX=ak5RdN7x7Q_NA7wvdAELkqUhrFpvJBidK+yi4omyKDdQ@mail.gmail.com>
In-Reply-To: <CA+zSX=ak5RdN7x7Q_NA7wvdAELkqUhrFpvJBidK+yi4omyKDdQ@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:40:05 +0100
Message-ID: <CA+zSX=aPCk3MUWA_hm-hpRH7QV+7KxLx0LPTitJJjY0TE0QCXg@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] xenalyze: sync with vmx.h, use EXIT_REASON_MCE_DURING_VMENTRY
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000096e0d20601921695"

--00000000000096e0d20601921695
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 9:25=E2=80=AFPM George Dunlap <george.dunlap@cloud.=
com>
wrote:

>
>
> On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote=
:
>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>>
>
> Patches 4-7:
>
> Reviewed-by: George Dunlap <george.dunlap@cloud.com>
>

Sorry, this should have said patches 4-6.

At any rate, I've pushed patches 1-6 now.  Thanks again for the cleanup.

  -George

--00000000000096e0d20601921695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 28, 2023 at 9:25=E2=80=AF=
PM George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunl=
ap@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:=
28=E2=80=AFPM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_=
blank">olaf@aepfle.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Signed-off-by: Olaf Hering &lt;<a href=3D"mailto:olaf@=
aepfle.de" target=3D"_blank">olaf@aepfle.de</a>&gt;<br></blockquote><div><b=
r></div><div>Patches 4-7:</div><div><br></div><div>Reviewed-by: George Dunl=
ap &lt;<a href=3D"mailto:george.dunlap@cloud.com" target=3D"_blank">george.=
dunlap@cloud.com</a>&gt;</div></div></div></blockquote><div><br></div><div>=
Sorry, this should have said patches 4-6.</div><div><br></div><div>At any r=
ate, I&#39;ve pushed patches 1-6 now.=C2=A0 Thanks again for the cleanup.</=
div><div><br></div><div>=C2=A0 -George</div><div>=C2=A0</div></div></div>

--00000000000096e0d20601921695--

