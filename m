Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94957676F7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571569.895744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPU1s-0007EY-Nw; Fri, 28 Jul 2023 20:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571569.895744; Fri, 28 Jul 2023 20:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPU1s-0007CF-L9; Fri, 28 Jul 2023 20:25:40 +0000
Received: by outflank-mailman (input) for mailman id 571569;
 Fri, 28 Jul 2023 20:25:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPU1r-0007C9-DE
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:25:39 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9aaeb9e-2d84-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:25:37 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so37786031fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:25:37 -0700 (PDT)
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
X-Inumbo-ID: e9aaeb9e-2d84-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690575937; x=1691180737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sjcxNDU48TbSBGONzyRDPQKzT3nlElPmfCA1SEfUiuI=;
        b=Lx1+s+AJd+zR8IU5XW7Fx6m+kJnfbDEGB5V+mH7nJeo7Tf6+G+/5A0fEzf58T/xOFS
         2IqX6CzwnPWZnDlPDDCY+Yev+n9zz85bCgsmEuS58dVXgB/RP8EH5etWJLVHBkRDI7s5
         MfiOaY+sCUVVlhCdBxu2Jw1graMcmlpf20wak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690575937; x=1691180737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjcxNDU48TbSBGONzyRDPQKzT3nlElPmfCA1SEfUiuI=;
        b=duuhDyO3MKdxoJL6dDWxaLqSqWtCL2dU49QGMDYI9LabSbTeg/Pt6ZOIIHnFnukEVV
         k55OBhF5y33gtDcfin5934zu3qm4s/8Sz5jqYRcH8urtQ3RGo1UOZA9U6YJoPzUnCIXM
         Q5NtegwPxypD0Irv0idUMRDo3UPP+veXKsNDFKz1m0PUdKY0lKEU+YmSd2wldLE8zsip
         y2UG3sOb4N5MrqSOBCTtKQZXnjsAq1EsbgSDN4n4IKni/SkeJ9G8ZHULYAnPklFUklDy
         npKpO+ZTHSV+qymMrRyuc51t/wx8ksC9T527p1esNDBypM6IuoYI03sWcqJx2Y3l/KnG
         3Gzw==
X-Gm-Message-State: ABy/qLbew/aLi9EkZIOa3gizlLDSeFvhfEi7WNj2uLxbnvLCSuLrU0yk
	vxOctvM/tpIvN2SMkZwLeeqtgWN/Q3c+7u3qEaRZXA==
X-Google-Smtp-Source: APBJJlElmPJ1tiKKlu6UBKwBvyYvMPwMLZwQfGsKFG/2uusfdNVMcyWVhCWS93KbeO7Aq4oIZ7f2fLY1180lTvsL9E8=
X-Received: by 2002:a2e:9050:0:b0:2b1:ed29:7c47 with SMTP id
 n16-20020a2e9050000000b002b1ed297c47mr2653179ljg.8.1690575936953; Fri, 28 Jul
 2023 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-7-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-7-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:25:26 +0100
Message-ID: <CA+zSX=ak5RdN7x7Q_NA7wvdAELkqUhrFpvJBidK+yi4omyKDdQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] xenalyze: sync with vmx.h, use EXIT_REASON_MCE_DURING_VMENTRY
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000303465060191e2b3"

--000000000000303465060191e2b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Patches 4-7:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--000000000000303465060191e2b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFP=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-of=
f-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_blank">o=
laf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Patches 4-7:</div=
><div><br></div><div>Reviewed-by: George Dunlap &lt;<a href=3D"mailto:georg=
e.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt;</div></div></div>

--000000000000303465060191e2b3--

