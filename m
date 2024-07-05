Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9383E9289F3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 15:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754296.1162645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPjBu-0000KX-Qn; Fri, 05 Jul 2024 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754296.1162645; Fri, 05 Jul 2024 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPjBu-0000Ik-OA; Fri, 05 Jul 2024 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 754296;
 Fri, 05 Jul 2024 13:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKH+=OF=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sPjBt-0000Ie-Jv
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 13:41:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4830a660-3ad4-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 15:41:29 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab8cso2748417a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 06:41:29 -0700 (PDT)
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
X-Inumbo-ID: 4830a660-3ad4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720186888; x=1720791688; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aex0E2jcu20sLLA0UR2Uzw5SPRTn13mJ04TL7pHoBJE=;
        b=gzBiJYAM58YPQdHsQ/htzrcw8OWJW351uoYPkMoD73pwFM6/CXwzajMlH+AmWIwt/h
         JVab4JpU6r72Oodr0AazwFFhIOtYOFn4rtdq4jSBK32Yw1TFLoxFsHjPVcRNsgdZD5st
         MhkjCR5Uyb14U8UyyPAfgpP4A+9rG3/fl6nB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720186888; x=1720791688;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aex0E2jcu20sLLA0UR2Uzw5SPRTn13mJ04TL7pHoBJE=;
        b=XxwHHsM12e4h40v2wozBL2z4xrnJZni+7+EZp9e6vxMG3s2ts4i5Xwib+UpQ2Lpmj+
         SZkQdyRVpMqmj7tVZyRGtBCWDWKnuG/qLOEgdZ6gwGx+7sl/mRv8MLUgc03B19rXqthQ
         0IBFpnILuHGgbWq7yGXuCLkxU2YguZC0Cf1JUGMRlthWVrv9J6gusO77eECg94cFUWhc
         6kK8n4ll0bnucOBpCv9T6Bc02rwsMPnSd0pIZLY8ysSErF0HAejuR0UfWVmSXiDhQewq
         cSBF0TS/xickElHPk98zv6+qzBgD3O7q1xWOPhh8csUcQtYymT1IHlOu9MIyZKfaQ2Mm
         dMpA==
X-Gm-Message-State: AOJu0YwU3v+04YjAHrSKFOheS6ze5jBsK+6l4kccSoQKe/bBBUpz+txq
	IQ4w6j/zKsaecmRGa46H15kJHtvsKMel97UPCeDrrWLsXnyZ1hJjdVz067nhy6uvrMY1H1Wcl+x
	6Sse6TNcvxdCu198QYG8P7tepy1892JfF1cw4EmJcCgNvizSFbavy/A==
X-Google-Smtp-Source: AGHT+IHslhLODQfxOjekxITHHpy1GHPaK9IyVSg3y1J0GAyXcuZ9fVRRGt/QlbeaSKKUq5mcw6rI6zWo8Km84e1ONG0=
X-Received: by 2002:a05:6402:1d4e:b0:57c:5fcf:b570 with SMTP id
 4fb4d7f45d1cf-58e5aecb1d7mr3354129a12.32.1720186887979; Fri, 05 Jul 2024
 06:41:27 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 5 Jul 2024 14:40:52 +0100
Message-ID: <CAO-mL=zEr=ade54O5LpFwKcZ3oQRgBN1zj8oREmDs3USZK+drw@mail.gmail.com>
Subject: [Job posting] Lead Software Engineer - Hypervisor
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000067ed9d061c8038b1"

--00000000000067ed9d061c8038b1
Content-Type: text/plain; charset="UTF-8"

Hi Xen Community,

Are you looking for a new challenge or know someone who you think will fit?

We have a job posting for a Lead Software Engineer - hypervisor
Location: Cambridge, UK.

More details: https://xenproject.org/about-us/community-jobs/

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000067ed9d061c8038b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Xen Community,<div><br><div>Are you looking for a new c=
hallenge or know someone who you think will fit?</div><div><br>We have a jo=
b posting for a Lead Software Engineer - hypervisor<br>Location: Cambridge,=
 UK.</div><div><br>More details: <a href=3D"https://xenproject.org/about-us=
/community-jobs/">https://xenproject.org/about-us/community-jobs/</a><br></=
div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><di=
v>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)"=
>Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=
=C2=A0<br></div></div></div></div></div></div></div></div>

--00000000000067ed9d061c8038b1--

