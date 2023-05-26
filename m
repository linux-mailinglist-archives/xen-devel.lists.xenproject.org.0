Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2635712449
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 12:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540041.841472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UQd-0008Sc-8Q; Fri, 26 May 2023 10:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540041.841472; Fri, 26 May 2023 10:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2UQd-0008Pf-5j; Fri, 26 May 2023 10:12:11 +0000
Received: by outflank-mailman (input) for mailman id 540041;
 Fri, 26 May 2023 10:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X81t=BP=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1q2UQc-0008PZ-8T
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 10:12:10 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6433396-fbad-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 12:12:09 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2af225e5b4bso5346091fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 03:12:09 -0700 (PDT)
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
X-Inumbo-ID: c6433396-fbad-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685095929; x=1687687929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhfjEJJ7c5rJX0Z0KvcDFdNSqDnBAEJVFDchzhucJrg=;
        b=E7txLwawbdHK6MGzWi8eg+ugipVXzeRo9puMNyrpEF6yi/zF9QLmXM/Y+N2tSU7Hv6
         SP1ij1Y9sxVVm5Bh8Y+t3ea6YaGMWUowsf7Ul7aGmwdkrwVohcs4Zk3vBlZRX6/vhdaJ
         bzSmnFsc1H/Mqt/4cLzXaTpwMZON4kfCwl4ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685095929; x=1687687929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhfjEJJ7c5rJX0Z0KvcDFdNSqDnBAEJVFDchzhucJrg=;
        b=L+krsvL/PUYHqnWwTNSlfD9BTPGE7fGYrZpCT/0QR3iXmXvlvrId3KYpq2tyTcG4DO
         BCyDnDa4LrSM99dehSxNHY84L9wcL8SFlLyrmv+YDaYoq9anLc4TyEV1XjN1kwzinQsa
         yqHNPAd9RsU4B7VDVqcgH4KuW0d2fCmbF931zCWzt2s+0vuBsOrltynpK0XBMmuTFsWV
         V4dcqVODGU142KWLJKSAuE0k04K2Q5OoUgs4hL1QIgdO52v6tX3XWVhsk0t5C3AvnhFx
         7L6M4mBgIsHU0S2RQqLQDWLUpc0Ps0ou8T/XOa9xlp9a90WGSwsVCqkWd5zo2JuFmgPh
         ktEA==
X-Gm-Message-State: AC+VfDwjRZuLDXojqNlFhFEwKESORvI7+P5s/uvEz+rUnF1b16tU0wS1
	3P5SRog6NstbWbaq4mNL/U2aHVQSNPiAbNdPdSWy+A==
X-Google-Smtp-Source: ACHHUZ4NukaulJo1fdhHjOKKMY3Npa/RoLZeIraFM4Azlf9Vu5CjA887KiEfG1dZlespbB0Z7UIZSuQWQWKzdiXqyUc=
X-Received: by 2002:a2e:9c9a:0:b0:2a7:7b8e:5888 with SMTP id
 x26-20020a2e9c9a000000b002a77b8e5888mr669610lji.27.1685095928855; Fri, 26 May
 2023 03:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230526072916.7424-1-olaf@aepfle.de> <20230526072916.7424-3-olaf@aepfle.de>
In-Reply-To: <20230526072916.7424-3-olaf@aepfle.de>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 May 2023 11:11:58 +0100
Message-ID: <CA+zSX=ZNZD2qQ1HGtqauoJdU_g1T45_gLq6XCG2Sn9VJJTNnbg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] xentrace: remove return value from monitor_tbufs
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000040a09f05fc95f87b"

--00000000000040a09f05fc95f87b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 8:29=E2=80=AFAM Olaf Hering <olaf@aepfle.de> wrote:

> The function always returns zero.
>

I think a better argument (which I propose to replace the content of the
commit message) would be something like this:

---
The program is structured so that fatal errors cause exit() to be called
directly, rather than being passed up the stack; returning a value here may
mislead people into believing otherwise.
---

With that change:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

If that sounds OK to you I'll modify it on check-in.

 -George

--00000000000040a09f05fc95f87b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 26, 2023 at 8:29=E2=80=AF=
AM Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@aepfle.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The func=
tion always returns zero.<br></blockquote><div><br></div><div>I think a bet=
ter argument (which I propose to replace the content of the commit message)=
 would be something like this:</div><div><br></div><div>---</div><div>The p=
rogram is structured so that fatal errors cause exit() to be called directl=
y, rather than being passed up the stack; returning a value here may mislea=
d people into believing otherwise.<br></div><div>---</div><div><br></div><d=
iv>With that change:</div><div><br></div><div>Reviewed-by: George Dunlap &l=
t;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt=
;</div><div><br></div><div>If that sounds OK to you I&#39;ll modify it on c=
heck-in.</div><div><br></div><div>=C2=A0-George</div><div><br></div></div><=
/div>

--00000000000040a09f05fc95f87b--

