Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D927388DC20
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698429.1090050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRBZ-0004cq-Rw; Wed, 27 Mar 2024 11:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698429.1090050; Wed, 27 Mar 2024 11:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRBZ-0004aQ-Op; Wed, 27 Mar 2024 11:11:13 +0000
Received: by outflank-mailman (input) for mailman id 698429;
 Wed, 27 Mar 2024 11:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIpq=LB=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rpRBY-0004aK-15
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:11:12 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78d5e94-ec2a-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:11:10 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso9343286a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:11:10 -0700 (PDT)
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
X-Inumbo-ID: b78d5e94-ec2a-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711537870; x=1712142670; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tB1JBTc3Sa/3UHgZN/w40rgh8Kmgpaad1HGpMFu+FJs=;
        b=WlX6nwjBhaM5tGRaNQt30AhOnpnsDwPEdt+CufG3IW5HnzHYSiJuB4OxNzF8Yg7enN
         WaZG5RfTK21ufhjGBaVFXq806arK0kbQxbKWfvRtrogGbavHxwrOE1qUCSO0YWyX6HXt
         5kcVmkX2KS9JnIRcLuZP4s6vClnp1woEogPn8jA2NtWYY1H9Uvwocf7oPYRHN0HW7g5q
         qs7PQMvIBU9GScRBC6TWv/74Bf5NoQFFlewchVU2hr2PxIS3Ge+mlCeM7oAYHzWn5na4
         HwIp46zFL1AgIjbj3OEwxHS3ueNjByKDrIuQe72vWfP3/CfKBH8DSPcBS5btd4oc+/vy
         NrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537870; x=1712142670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB1JBTc3Sa/3UHgZN/w40rgh8Kmgpaad1HGpMFu+FJs=;
        b=a1CoWElDNs0xtDhDe3UZ6L5OJfBGJqJA73iX374fDDmN82f66fZGrzX7Nr4BvZtAMR
         D80f9GhEz4L8CcASWjW6J4BylhgK/BDyGao/xR1aWChYt62HQTLjzh4+wy8RotYU+uyV
         VzHffINfh0dZfZTWj1TQhXH0bm2FaQRzow0XnfP+1L6aqnUWoD4F7TbxU2jKbcHoiuJJ
         bYvDBJXkPXtG0cBJux3HB1uhUuvtAQR99dAZ3tW1V3H9RxxLQ7gPfH845zE/GaseiTBI
         0G5SZXXx71oxfWu+tLhBz+YbYSCZ/H1qci6Js6oJH/zgqQb4d0fkYaaJAjVsYCeZu686
         nKGg==
X-Forwarded-Encrypted: i=1; AJvYcCVZvA68d9oL2x4eaNzoByhpho4gnI0rlxqvo6LL1uchWOls3ykhjS+lwZwvzcs/mLEDmqgS1U7wKemGBFwcuugUyTzdcFwRmTWXTvf3Cd4=
X-Gm-Message-State: AOJu0YxohhoemS5mgBrM7hAG8Rle5mR22fL8xELJmt+65Lwk5R9PMcEQ
	ql1fCdt4EGaYKIjywlpZyMSh8aRZm4Ukc3WqZfTGW5xK7oIOrUvAFDnExsQ3TJSr1Q8R2fxtA12
	1JHHCeNqqgD6YqnGaX3e+wvLZSV2W/+r+nGELiA==
X-Google-Smtp-Source: AGHT+IHYXAz9RQpwNPdkU6z67nlRMkkEJWhlpnf/XShoq8md1Lljnx4UZkFFjzvOGjhnxdLRScB4t5n/Fmu5HLkkhwQ=
X-Received: by 2002:a17:906:338f:b0:a49:182d:f121 with SMTP id
 v15-20020a170906338f00b00a49182df121mr503555eja.74.1711537870391; Wed, 27 Mar
 2024 04:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech> <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org> <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
 <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com> <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
 <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com> <fbc17f7a-b07d-4508-902f-9fc021bc9a19@xen.org>
In-Reply-To: <fbc17f7a-b07d-4508-902f-9fc021bc9a19@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 27 Mar 2024 12:10:59 +0100
Message-ID: <CAG+AhRW2=kaxsAJ6JO+j6xy4C8Mv81j9hb=muZKT30O+Zdp0Vw@mail.gmail.com>
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags macro
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi guys,

> Question is: How would you justify such a change? IOW I'm not convinced
> (yet) this wants doing there.

You mean in this series?

> Looking at the code, the flag is originally set in
> alloc_domheap_pages(). So I guess it would make sense to do it in
> free_domheap_pages().

We don't hold the heap_lock there. Is it safe to change count_info without it?

Thanks.

> For PGC_static, I don't think we can reach free_domheap_pages() with the
> flag set (the pages should live in a separate pool). So I believe there
> is nothing to do for them.
>
> Cheers,
>
> --
> Julien Grall

