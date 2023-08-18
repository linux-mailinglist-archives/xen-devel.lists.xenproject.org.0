Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96E780A36
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585946.917167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwnn-0001mD-Vm; Fri, 18 Aug 2023 10:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585946.917167; Fri, 18 Aug 2023 10:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwnn-0001k6-T4; Fri, 18 Aug 2023 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 585946;
 Fri, 18 Aug 2023 10:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvKd=ED=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qWwnm-0001Th-9e
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:33:58 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcba842c-3db2-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 12:33:57 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe3b86cec1so1066314e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 03:33:57 -0700 (PDT)
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
X-Inumbo-ID: bcba842c-3db2-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692354837; x=1692959637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cpf3T1EVCoQlhfearFJ322Ifh6Uzb2D7iNOiRCsy4WI=;
        b=fP1QUwvcFWvVQj069CSyhJ77KFjAqDecrKN8jpyiuOTimB286/lqfX5vBVQvSOOrMv
         9QofIxbynKmCrrRRfTOhlee6E/tYGmVma4ONIow8CB+KtgPFCmbzqfysrjoUfp4xaDV/
         dH7DbMbLfVhldi9N9LJOWHLKKfhp6p0y/Xhns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692354837; x=1692959637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpf3T1EVCoQlhfearFJ322Ifh6Uzb2D7iNOiRCsy4WI=;
        b=clnL8SXoqqzyIZFCorcx1Z3JxQR1Wxs8PNTmEwHPjck0lDeDmHmia00S3sfceAShDg
         lzw/uo8kze18w2XNROJt/l0U/p6vUMABwibQjDIdiJSstCt/6HnhrbZHTr3MhcvcaVoR
         FySORfvPtWQrw4qUX7aWjNuLyy7cC0XvYgbokEAmok5LkcjD2IGpoyOo2Y6JTfpd+nw2
         50Hr1r/EG47ed37mtbRXpKYi2rTChBJ3ANQzKDyYVvjiGeTUTfVuvw+VP8rd5hvmMeoT
         4/A90iqnIdwsneJF+U2fkqVeI+8k9vAHFBubIYP8PIad7e+I7zQ/pH1928e3faARDZHZ
         SzMw==
X-Gm-Message-State: AOJu0YzMXQy6Va3iNCxrxjffnpud5zsRadT7/mq9uJrXj1RQoFKYnsHh
	tCFwHSaoLw2skThnwT/cR2Hwcd96D5DRzHFAz9rydTSfJr8vRZvE
X-Google-Smtp-Source: AGHT+IEYoTOPZ8C/jLACylfvONsjoqiiiY+64yATn8ve/FEkOQ03jXhpd8DVazvs9ibEwZKMZDFevmNKYW8co8wuhyc=
X-Received: by 2002:a05:6512:2202:b0:4fe:ef9:c8d0 with SMTP id
 h2-20020a056512220200b004fe0ef9c8d0mr1699578lfu.35.1692354836747; Fri, 18 Aug
 2023 03:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230818103236.51696-1-george.dunlap@cloud.com>
In-Reply-To: <20230818103236.51696-1-george.dunlap@cloud.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 18 Aug 2023 11:33:45 +0100
Message-ID: <CA+zSX=a2Z14uumar+V2VjY6nLCt41CxZ833YpfyGP3NYG5hH8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] code-of-conduct.rst: Remove Ian Jackson as a team member
To: xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com
Content-Type: multipart/alternative; boundary="000000000000e0eda9060330100b"

--000000000000e0eda9060330100b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 11:32=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com>
wrote:

> Ian Jackson is no longer involved with the Xen Project.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>

NB that I don't consider these changes as needing a full vote; I'll check
them in on Monday unless someone wants to argue otherwise.

Thanks,
 -George

--000000000000e0eda9060330100b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 18, 2023 at 11:32=E2=80=AFAM =
George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.dunlap@=
cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Ian Jackson is no longer involved with the Xen Project.<br>
<br>
Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com"=
 target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br></blockquote><div><br=
></div><div>NB that I don&#39;t consider these changes as needing a full vo=
te; I&#39;ll check them in on Monday unless someone wants to argue otherwis=
e.</div><div><br></div><div>Thanks,</div><div>=C2=A0-George</div></div></di=
v>

--000000000000e0eda9060330100b--

