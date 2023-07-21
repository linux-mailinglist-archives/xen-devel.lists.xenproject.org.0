Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C275C1BA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567403.886389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlYc-0003YL-Ai; Fri, 21 Jul 2023 08:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567403.886389; Fri, 21 Jul 2023 08:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMlYc-0003VI-7P; Fri, 21 Jul 2023 08:32:14 +0000
Received: by outflank-mailman (input) for mailman id 567403;
 Fri, 21 Jul 2023 08:32:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S9Zc=DH=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qMlYa-0003VC-1C
 for xen-devel@lists.xen.org; Fri, 21 Jul 2023 08:32:12 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 146841d8-27a1-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 10:32:08 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9540031acso24281261fa.3
 for <xen-devel@lists.xen.org>; Fri, 21 Jul 2023 01:32:08 -0700 (PDT)
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
X-Inumbo-ID: 146841d8-27a1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689928327; x=1690533127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PcXYr1vGbRUlETdz1rHapduxUlSSjbwTocp8ZuDsRpM=;
        b=jZV62k+23IfylgoWfzzewQJYJ946lrwT58CYZH8wagy5NFy+Gr03XsY2p89+sI2dTx
         vqRHv/d9GKR16K/n2/nRIYnfJwGTZjeb0G6i1CAUtgjBtsC9DRKWw8Y34PF9PAWeB/Eb
         9u+l6B2Z+CO9irWaEm7K30Xxw3nr5LcCG4FSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928327; x=1690533127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcXYr1vGbRUlETdz1rHapduxUlSSjbwTocp8ZuDsRpM=;
        b=R7LZKBEGoMxBI4jbNrJnWVTZ4P8ogX7s66OfVLVfMnke2ysfFSthkecldU42AzvuQr
         eI3j5gRz0ORDmQ0/+iP49GA+n7UjDzJegMKFAv7FTYR35mUCKemTKDglueT65j0yi2R8
         CTRQ/QCaM5i83PdO2Kw0RVeifx7fmBldD2ckqM38rZkkBEcTS1OMgWLPSwt9uqCGB7gJ
         7ZOuYvis+EkXrXiYMDzqcx7GbFGtPBPqC7SchAgszKZBxR2DpFzZ3hzGHAmIkP9ECqJi
         ck9UJO9Ae5yNKu+145l7en4QRv6fuesiYmLcTKo5O2dMh3Kya+3ogH04ZoZ0/xtq8OtH
         xstQ==
X-Gm-Message-State: ABy/qLY90VrZc+UVFXLaMMGqapmruAVjcOQsSPc6FoJVQv0G+5Ko8ewp
	cZGT5eSVswtLeXVZs7jlveQiwOz7CO9nmpKXSI3Seg==
X-Google-Smtp-Source: APBJJlE++yChMN7RWhyMy44K6b7oUZlK4aEkKviRgq9buPW2ugP1ZZobPUN4+AXM92dDJUQdSvYaXMw3SyeQrPGSntM=
X-Received: by 2002:a2e:3002:0:b0:2b6:a3a0:5f7 with SMTP id
 w2-20020a2e3002000000b002b6a3a005f7mr1148653ljw.9.1689928327607; Fri, 21 Jul
 2023 01:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <144a57807d6f3e6c1e9b45215cb4fa5fa4535f10.1688628006.git.viresh.kumar@linaro.org>
In-Reply-To: <144a57807d6f3e6c1e9b45215cb4fa5fa4535f10.1688628006.git.viresh.kumar@linaro.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 21 Jul 2023 09:31:56 +0100
Message-ID: <CA+zSX=bfhtk6mTeR83-3vC2CU=Y5EnaGok_JH8_-62u_wCd9DA@mail.gmail.com>
Subject: Re: [PATCH V4] libxl: arm: Add grant_usage parameter for virtio devices
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a9c9470600fb1942"

--000000000000a9c9470600fb1942
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 8:29=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:

> Currently, the grant mapping related device tree properties are added if
> the backend domain is not Dom0. While Dom0 is privileged and can do
> foreign mapping for the entire guest memory, it is still desired for
> Dom0 to access guest's memory via grant mappings and hence map only what
> is required.
>
> This commit adds the "grant_usage" parameter for virtio devices, which
> provides better control over the functionality.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>

Golang bits:
Acked-by: George Dunlap <george.dunlap@cloud.com>

--000000000000a9c9470600fb1942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 6, 2023 at 8:29=E2=80=AFA=
M Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Currently, the grant mapping related device tree properties are =
added if<br>
the backend domain is not Dom0. While Dom0 is privileged and can do<br>
foreign mapping for the entire guest memory, it is still desired for<br>
Dom0 to access guest&#39;s memory via grant mappings and hence map only wha=
t<br>
is required.<br>
<br>
This commit adds the &quot;grant_usage&quot; parameter for virtio devices, =
which<br>
provides better control over the functionality.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
Reviewed-by: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com=
" target=3D"_blank">anthony.perard@citrix.com</a>&gt;<br></blockquote><div>=
<br></div><div>Golang bits:</div><div>Acked-by: George Dunlap &lt;<a href=
=3D"mailto:george.dunlap@cloud.com">george.dunlap@cloud.com</a>&gt;</div><d=
iv><br></div></div></div>

--000000000000a9c9470600fb1942--

