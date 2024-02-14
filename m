Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6B854633
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:36:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680311.1058392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBgr-0000NE-T1; Wed, 14 Feb 2024 09:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680311.1058392; Wed, 14 Feb 2024 09:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBgr-0000Kg-Pz; Wed, 14 Feb 2024 09:36:29 +0000
Received: by outflank-mailman (input) for mailman id 680311;
 Wed, 14 Feb 2024 09:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBgq-0000KY-M7
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:36:28 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8636fc87-cb1c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:36:26 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5638c4a8d6eso118340a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:36:26 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a22-20020aa7d756000000b0056140d51b7asm4506800eds.83.2024.02.14.01.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:36:25 -0800 (PST)
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
X-Inumbo-ID: 8636fc87-cb1c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707903386; x=1708508186; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+McCBgeiVepxG0NOfFdl2eJgbLlMCg4Y4XQAubfVVc=;
        b=AdHfj2IK2mlixAXrW4YOobfuOaH/87jIHdM4Aum0Is+fXeoiHdWS4+xp7wu0KWIsQx
         EdBHoU1qLaheLGP5AiDUE4Wj4b4Jx/OHM40lAZFhFHzKinzai2/BPMTuuqvKyIq2HV8y
         xtRcj0my8WARrFzF10BLL02tTZ0cqIunyMZDJGEX8A15tdHNLuNawUdlTmWa2MxITBJh
         /DVfg97pn/mN24M7IM7RIcxvVQ88ReB4jD3K/6yMI+riebffTmWMJXODhQPgLXZBRTIJ
         h8aXdrReZnzJAx7HtH2eFZXXcIqEqeTM9SNKqVvgIC8RoY7+2/2gBPdjfSE3nQHHdAwr
         pWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903386; x=1708508186;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+McCBgeiVepxG0NOfFdl2eJgbLlMCg4Y4XQAubfVVc=;
        b=B1ceaIX8R40udD+L8k9RdiUa0uJ8RtTTQvJlUTI9KhNGf/i5031XJs/G2k3tEY9ERg
         d9sC2jZeHnkPJQ1BzbWQsyUSLBpamQq9yc3Ec4XWVWT39NKJqEWULvfqKSOs8e4VUnMT
         0wKSScXfhUufYI5NLWLJKvKXy6Rp4ZPSgdibJRaaFLwNzgHj6HJhYgKm1a3oyKn2KqwK
         YrbRI5+SJWgfJqE90f/Xg3+mfrwL29ygxHM8FzaScJ6DJLf1NFUHzfAfA36gjV4Crd3p
         Spg+DgvaneKxtbDJ396iEhnRBBnJSerli2Qlmpl2PY5iUhoUZh8B6Tk45FBzX6riBiwO
         bG0g==
X-Forwarded-Encrypted: i=1; AJvYcCWZuIhtbgc4WPaX83aTBZ8FvYxVsepDJ3UtJx+GoWqZ/BaNmdzCDHYqVa6yu3t+/8XKUWD7SyFOE5gJ+cQLuI6Rh8/LN7dJEW0gHPWluy4=
X-Gm-Message-State: AOJu0Yy0RwAMaqYFhSR1d0SmSZ6ojuATUN3G3w212vsoeGuR/EEXtwgi
	mRWroJS5HmDylcWnLxPjed9Hm/8W55VET8noPTK1Ai2pUfKxMCdK
X-Google-Smtp-Source: AGHT+IHm3+UnxFr/XtmNY2Vh2ClOPwNoU5a4saYaiCzlzcoiReXd+E6ytl0Y6xn9BGpcn3FNwmIJGw==
X-Received: by 2002:aa7:cf11:0:b0:561:c157:8074 with SMTP id a17-20020aa7cf11000000b00561c1578074mr1564869edy.0.1707903385298;
        Wed, 14 Feb 2024 01:36:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzCI9ocNyODcwb6gjPujWe1cnr5W9naUiY54RmP15a3iIOCg7dBspAo5qtfxXVyXpwt5sssK6vJM/vspZQ6wyzz+zWg+kNDnDN4HAjHPtWjl8H+7FgB0svm0Ybb62iBe6Uq19qnAXQKOlqbKmREYa1szcaO+6PeknOKi/RnOKdQPvgFiwsSnCPYliNLKDdg0xWqlerRvPFAlQ79HK6aipFsmEOygQI+DZKJjyKXwZndk+rJOXhzegGGLm84qOXUt7oNbcWYJQiNKe6V2kM6bcPA6SZWtbVeLLHw6oWZk6Xwa9ZdzMzL3hqy1e2gdU4q/w9CQE87Rg7GDz/gPQqaxw6UnCdfS1bDVYZnXZFtQ==
Message-ID: <e4c9c8133a993b3ca3beeae027ffc393457e7632.camel@gmail.com>
Subject: Re: [PATCH v2] xen/lib: introduce generic find next bit operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Wed, 14 Feb 2024 10:36:24 +0100
In-Reply-To: <01167c19-d1ff-41ea-8852-3eef307f2156@xen.org>
References: 
	<fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
	 <01167c19-d1ff-41ea-8852-3eef307f2156@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2024-02-13 at 17:18 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 09/02/2024 17:58, Oleksii Kurochko wrote:
> > find-next-bit.c is common for Arm64, PPC and RISCV64,
> > so it is moved to xen/lib.
> >=20
> > PPC has been transitioned to generic functions from find-next-bit.c
> > since it now shares the same implementation as the PPC-specific
> > code.
> >=20
> > The MISRA exclude list has been updated to verify
> > lib/find-next-bit.c instead of Arm's find_next_bit.c,
> > as Arm's find_next_bit.c has been relocated to xen/lib/.
> >=20
> > Despite CONFIG_GENERIC_FIND_FIRST_BIT not currently being used in
> > Xen and being removed from the Linux kernel [1], it could
> > theoretically
> > prove useful for Xen. This is because the Linux kernel transitioned
> > Arm to the generic version of find_first_bit() and
> > find_first_zero_bit() due to improvements [1] in both performance
> > and .text size.
> > It would be prudent to investigate whether [1] is applicable to Xen
> > as well and, if so, implement the necessary changes in a separate
> > patch.
> >=20
> > [1]
> > https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@g=
mail.com/
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Thanks for review.

~ Oleksii

