Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C786B8C9518
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 16:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725666.1130074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8hvs-0000Pa-Uh; Sun, 19 May 2024 14:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725666.1130074; Sun, 19 May 2024 14:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8hvs-0000Nc-Rn; Sun, 19 May 2024 14:54:40 +0000
Received: by outflank-mailman (input) for mailman id 725666;
 Sun, 19 May 2024 14:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2wXv=MW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s8hvr-0000NU-Ud
 for xen-devel@lists.xenproject.org; Sun, 19 May 2024 14:54:39 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c58a25-15ef-11ef-909f-e314d9c70b13;
 Sun, 19 May 2024 16:54:38 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so7217463a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 19 May 2024 07:54:38 -0700 (PDT)
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
X-Inumbo-ID: b6c58a25-15ef-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716130477; x=1716735277; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1IbXT6s+TDvE5Z/rvchiR3mdtk/BquEIjBA3qg8iRs=;
        b=Qfs7EQZFGCn6Ms7QiFD4Bl9voW35iA1qFYUNsEiTjS5aJ/GniyWIkUlICKP4jxb6H3
         GcldIlhQbv/C+yQeJrygqDAHHTPgikSSLiafNH/buQZBPdRcY+6gRuA7gvP2tQ+06iOK
         H/aMoGatSTHuui6Avu5ZI45SZsA83k53WlMBvl1PaIV1JlfLDeUBP+hv0KuDxLamK/R/
         iX1Jcr0eTLAZkWAA/dw2GNrBDI/5bvKaBS7LiDN6zXj6F4XpGZeDwRr3zknm/aypdxsu
         kGDqLXhZXQWv71DFqY26pZx7sgtbHDa0BlaPRWkIgHgbdffzvOlyEx3aNsObniuJrgOh
         uAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716130477; x=1716735277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1IbXT6s+TDvE5Z/rvchiR3mdtk/BquEIjBA3qg8iRs=;
        b=iUehUYfP989h4Onov9C7KF4lPO7gV6odIbVzN4x0otIM0iuafaSc0DAUjXayGHT+CS
         J7qy9cUt+JFrCI8z+vy12WZOgPpw3ik0pQbC75JqZEik5R5/Uyt+tfUt3IlHvgmzSOCK
         CotFkvouY4yCbMdqrnJd3Tl28TzO5pFhI8ALF0nZyy6blo5ppWSFAmBWw5GYc1eREV8x
         cakBhsvV2fEiKx+VXZJpYT+tP7jmVZxxNC5veVpInqQeHPYXg92ItK8ercakW5lidObs
         Y54OlkbTMRPSlEuw3rvgynbS/9JxxDpzyTXwTkaeeseAv519rP9WOq91k06617qNx/K/
         QI6g==
X-Gm-Message-State: AOJu0Yxdf9JVXeZgyhp1PjJGr3NyXPLCdI4LEp8hrAiQmraP4eRacz7R
	+maNeEO8zqsbNuWlToBvYZGNfVnXn6+QTJYK/U2PVnJhgT+9L0vE/hm9U6/eGC6BsBCQCaDBfP4
	KDK5MDnx1NBlIcjxMFyeqdkzhyVc=
X-Google-Smtp-Source: AGHT+IF6SVaVB8uwtc+vUaOu52y3ePi8uNN3pRmTrw7uUZ0C5e6Lxu9ZcS62VS+ukK9f05SJNv8dd3AfxKp2PkaQA3Q=
X-Received: by 2002:a50:9ec5:0:b0:568:8e22:4eff with SMTP id
 4fb4d7f45d1cf-5734d6df0d5mr17248259a12.37.1716130477350; Sun, 19 May 2024
 07:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240517140506.8460-1-leigh@solinno.co.uk> <20240517140506.8460-3-leigh@solinno.co.uk>
In-Reply-To: <20240517140506.8460-3-leigh@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 19 May 2024 10:54:25 -0400
Message-ID: <CAKf6xpsHhe1v1evHOaRE_EBqAnC3vN2URsXkUwTu1dzWXP6BHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tools/examples: Example Linux bridge VLAN config
To: Leigh Brown <leigh@solinno.co.uk>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 10:05=E2=80=AFAM Leigh Brown <leigh@solinno.co.uk> =
wrote:
>
> Add a new directory linux-bridge-vlan with example files showing
> how to configure systemd-networkd to support a bridge VLAN
> configuration.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

The systemd network config looks like it matches the the systemd man pages,=
 so:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

