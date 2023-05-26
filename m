Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58071242C
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 12:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540025.841443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UIe-0005nk-T4; Fri, 26 May 2023 10:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540025.841443; Fri, 26 May 2023 10:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UIe-0005lV-Ox; Fri, 26 May 2023 10:03:56 +0000
Received: by outflank-mailman (input) for mailman id 540025;
 Fri, 26 May 2023 10:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X81t=BP=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1q2UId-0005lP-5E
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 10:03:55 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e78084a-fbac-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 12:03:53 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso576406e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 03:03:53 -0700 (PDT)
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
X-Inumbo-ID: 9e78084a-fbac-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685095432; x=1687687432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PKW6t5nq5lV7zUztAetBNtiLiZfpIF4x4clPqehH+eI=;
        b=j7uzly3VQWJsx8ht1fSi4RoY+xYlatMyz/7sXzjTXcaEl1rwxRcP/lL7IpZGjhJeZA
         lS9fUQNB46mxxYta236sQrTzoFIky6UMl6xs3rpbeYl4KuxwXnFwjV3+w9An7WH2jLZy
         AToKm6dsNto6wyMYsafzjg6bsdloKp4jbbRcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685095432; x=1687687432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKW6t5nq5lV7zUztAetBNtiLiZfpIF4x4clPqehH+eI=;
        b=A7jYV+IguLroVf3vFAcOaExaTnKhrbXrWKe3qL4c7irVxsM0+ESqfCfRbUMMChYD3b
         HSOJOF8EVa2i9hocH4uqII0HBjgcQd23XdO/bjezxdJ6YeXfOGWP8V0EEO16bLZ5tMP8
         /NiewgRvJxJuQn/FBiQHdT7sZJ7KhyjuLVLB2IHYJHYoMcCUairpuv6vSb8YQeg50L03
         0gfnHgJgpNHIsXc3hEyH5zXW9vY7919Q5wXHmpcMvLj9hMw4Wrsc8NWnGCLv+M24GlGA
         jD40CSgYYednQ1UPbBiE60okXQKmJvD71MRggI7OmL+TZHEI41CRx59sLsn95gz/GlNc
         T2dA==
X-Gm-Message-State: AC+VfDxMINotkRC0BNgy0G8UNzwoST7Ib0mamIlmgF4rLkGr0cGtC6SR
	yqNLaFRanVlGx3bz/t2a7PNFdCT56+rjAyxLbwuNig==
X-Google-Smtp-Source: ACHHUZ6QdcG0BJFUGgKCosYtaP+IGY3RtVwHe+eD4t4d7eoqkbBDKZXIllr32kPaFsJF9GKs6ABRxIPUWs34oAdHQ9k=
X-Received: by 2002:ac2:5227:0:b0:4f2:455d:18bd with SMTP id
 i7-20020ac25227000000b004f2455d18bdmr348743lfl.16.1685095432597; Fri, 26 May
 2023 03:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230526072916.7424-1-olaf@aepfle.de> <20230526072916.7424-4-olaf@aepfle.de>
In-Reply-To: <20230526072916.7424-4-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 May 2023 11:03:41 +0100
Message-ID: <CA+zSX=Z+p8CmB_=r6LKJeDjg3wdq4AzMgK0qs2GQLYRLwbe0QQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] xentrace: close output file in the function which
 opened it
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000ac4c0705fc95dac8"

--000000000000ac4c0705fc95dac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 8:29=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrote:

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Wow, this file is ugly.

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

--000000000000ac4c0705fc95dac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 8:29=E2=80=AF=
AM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-o=
ff-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_blank">=
olaf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Wow, this file i=
s ugly.<div><br></div><div>Reviewed-by: George Dunlap &lt;<a href=3D"mailto=
:george.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt;</div></div><div>=
=C2=A0</div></div></div>

--000000000000ac4c0705fc95dac8--

