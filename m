Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B52D7676EF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 22:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571567.895734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTyn-0006df-9m; Fri, 28 Jul 2023 20:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571567.895734; Fri, 28 Jul 2023 20:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTyn-0006bA-6y; Fri, 28 Jul 2023 20:22:29 +0000
Received: by outflank-mailman (input) for mailman id 571567;
 Fri, 28 Jul 2023 20:22:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q8mr=DO=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qPTyl-0006b4-KV
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 20:22:27 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7726f676-2d84-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 22:22:25 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9bb097c1bso38648141fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 13:22:25 -0700 (PDT)
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
X-Inumbo-ID: 7726f676-2d84-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690575745; x=1691180545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ohChoAcr8sjYWanMZ4eXeXwjFlk1LbuuQAkSOGNm7vA=;
        b=KpTT6vCHY6ugQdMFGv0kgSkb+G1lJ7OBYHfsdeoS0fNoItAD6E5XBcpXL1BO/3dCmt
         qvZBopoQaqMAylIwUPyZ76VoCijNSRT7Bgns02ch23gYzYx//g3cYS2YKuKYV5/GN/u/
         iN+cMjKGX95JTd5vVcIqb9j3QVCxe5pXrBSkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690575745; x=1691180545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohChoAcr8sjYWanMZ4eXeXwjFlk1LbuuQAkSOGNm7vA=;
        b=cIDgFgs5O6TBa3Lynm2WVy0xcbSjqXWlppd3sHQK8h83Dnee7gL3unvtj1r5W5hX5z
         Je5k1XiaE/DdKiiYZAV3+ce3kIPoJ/wd5o83om7Smxp40Oq1dPCBGiGQNf3ps/h6FOky
         BeOulQP9vZpF4BVgopxb8XuCL+a/SIe1b1/ByNQq7LppvLtqD+n0117AiUWN9iUDrpMT
         SnC8XUbg2cft1NBk5wZ0yqTJd7Vw3PQTEb3OQqn8fg1wIhMn5LDdpGKsy484R5F/rWk4
         5NcrgJQNK/zUHOZRxRFRZXWgPOmMYs4B4o8CKGNOEQur7QpB/esdl0RxeB4TiCXSvx4p
         BYrg==
X-Gm-Message-State: ABy/qLanp4ZokT+JUilVvGPe584ohNgQ5yt6Bo8w/BFuBWUTSWnB6Y/a
	WLjPV4hZQWi6kf0JbruGSN2odkYdgS35CAzd8+q2Gg==
X-Google-Smtp-Source: APBJJlE9HQUgPyeV8VjTMbiHOUs4aGNlvbO1anpzfJh6J+vjKbaEdbHwh91mbGMkPZEgEZl3uo7C7+F+B2ZIMSVitGY=
X-Received: by 2002:a2e:8912:0:b0:2b6:c16a:db06 with SMTP id
 d18-20020a2e8912000000b002b6c16adb06mr2792379lji.39.1690575744780; Fri, 28
 Jul 2023 13:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230601142742.15489-1-olaf@aepfle.de> <20230601142742.15489-4-olaf@aepfle.de>
In-Reply-To: <20230601142742.15489-4-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 28 Jul 2023 21:22:13 +0100
Message-ID: <CA+zSX=biggzVDhA5++3TEzdjuxvUmpD2T6wpnQFSY271zOTBVQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] xenalyze: sync with vmx.h, use EXIT_REASON_PENDING_VIRT_INTR
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000bbe111060191d65d"

--000000000000bbe111060191d65d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 3:28=E2=80=AFPM Olaf Hering <olaf@aepfle.de> wrote:

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

One can't help wondering if it would be better to arrange somehow not to
have these definitions duplicated.

--000000000000bbe111060191d65d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 1, 2023 at 3:28=E2=80=AFP=
M Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-of=
f-by: Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de" target=3D"_blank">o=
laf@aepfle.de</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Geor=
ge Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@clou=
d.com</a>&gt;</div><div><br></div><div>One can&#39;t help wondering if it w=
ould be better to arrange somehow not to have these definitions duplicated.=
</div></div></div>

--000000000000bbe111060191d65d--

