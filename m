Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7AF6E0F47
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520778.808780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxOQ-0005NE-Pc; Thu, 13 Apr 2023 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520778.808780; Thu, 13 Apr 2023 13:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxOQ-0005JV-LV; Thu, 13 Apr 2023 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 520778;
 Thu, 13 Apr 2023 13:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxOP-0005J3-Q7
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:53:41 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98db509d-da02-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:53:40 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso14822555wmq.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 06:53:40 -0700 (PDT)
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
X-Inumbo-ID: 98db509d-da02-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681394020; x=1683986020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMNbENZ/an/kqDDNkeCv4pxr/53e2QvX/R0pQ4lykeQ=;
        b=oLq/2keE4B1A6VNLw5cBwA/8gYSagdHEiJZOPBxxVr82/z4v2zuE0jXWPOjiww/0WJ
         Y40CmAgf6nQvjhMXl/by94OXN6cgbO0cnZHo919qwd1Ho8uoCh5n1TpM/xWugZFVwi+D
         B4Hk7XVZgt5/OL0YS7yoz4Ki35lv7Jwlgxvvf8I0NMzuzhDX2b9kGphR0R4gv6D6pXUJ
         3pf7onvgb4iseYCuD59Ouxtfclf39UulFq5to/qz/YGOzyEaspVSGEdUDQSwbXrvhjXg
         klDSdBBZBeJe1e2kEiwjIoO8Bk8dMtC7ssgKq9fzWuJgm/T+yA9kDfZbxqlCnaba0nzs
         zAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394020; x=1683986020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMNbENZ/an/kqDDNkeCv4pxr/53e2QvX/R0pQ4lykeQ=;
        b=Koz+CMeqyqrcy55Cte1BNeXSzRMTjliDTisrl5pxh7w7fk7w5DQKXMVYVLtpE8QTfO
         AM6+NTgH8Z+31a1jkzz8/g5OaQGeu16PVbFWxO3M2/7TNBrFLQuuCv2km+YVcsbJgiN8
         jCx6nkw3Q/9+AwrtejBFrOnaZ37XPKo3op40NgssRrU8sq2H+3tgbTY/9+f9fLl907tr
         Fh5mI2VsON1fwGbGORGKGl680cOACX//cFRc4IThU6lyc87MuhV+KRRjbTb/ITxqz/ek
         bZfjqGQpFcRKO4ozL+GLnLSsOTXKZ2+NT2MqIQ2UeFU09lzeHaoRHuooyfQDdkBCC87k
         NdAg==
X-Gm-Message-State: AAQBX9ezfbz0BfqDIfQFo0NtVQ8JjCEle+HXkuq+6RWV7CEOgA7ubFXo
	mQcNabE4Dqy9ZoMQtjceznbzgOi4voaoijPVfElhyDVtWP4SeBTN
X-Google-Smtp-Source: AKy350a746AeL5Gds3W5jEKlBuDR4I4Al2+ghgojas/6QlIgOOyTOf0iG4jd9RBggZQzgLFsE4FISYcSBaLI9q4/pYc=
X-Received: by 2002:a1c:7901:0:b0:3ee:41a8:729a with SMTP id
 l1-20020a1c7901000000b003ee41a8729amr618534wme.4.1681394020360; Thu, 13 Apr
 2023 06:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-8-jens.wiklander@linaro.org> <AS8PR08MB7991C16F543C4B1C4611572F92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991C16F543C4B1C4611572F92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 15:53:29 +0200
Message-ID: <CAHUa44F-D20fPnFVbdQgO4+UqLqyiHkzOFqhvTZZ2_Kp0t7jFw@mail.gmail.com>
Subject: Re: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k pages
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 12:55=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wr=
ote:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 07/22] xen/arm: ffa: enforce dependency on 4k pa=
ges
> >
> > Adds a BUILD_BUG_ON() to assert the dependency on 4k pages in the FF-A
> > mediator since the current implementation only works if Xen page size i=
s
> > the same as the FFA page size.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I'll add that.

Thanks,
Jens

>
> Kind regards,
> Henry

