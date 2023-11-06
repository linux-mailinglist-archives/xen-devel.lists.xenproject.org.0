Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3FA7E2067
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627943.978878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzy9V-0002N7-Vn; Mon, 06 Nov 2023 11:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627943.978878; Mon, 06 Nov 2023 11:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzy9V-0002Jw-T0; Mon, 06 Nov 2023 11:52:21 +0000
Received: by outflank-mailman (input) for mailman id 627943;
 Mon, 06 Nov 2023 11:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wfGl=GT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qzy9U-0002Jq-LJ
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:52:20 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f08ae62e-7c9a-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 12:52:19 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c4fdf94666so57993261fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:52:19 -0800 (PST)
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
X-Inumbo-ID: f08ae62e-7c9a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699271539; x=1699876339; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JolvOm92yOZ1uSPHZ4lckHErC5pIJP7wH73mtN8LrOA=;
        b=W4oTxf9VWcueWQxlnev7BSSmplc4A5OTGoc1AcekWKYzWg8lBHFA32kXA+Vel8c+FH
         X0t0S/9KPyZ8fRm+8QLfgbdCGDpcSmBVeOsvnyfsp5H4OvULslopew6eLpuOVx+nQfEY
         eQsrnlh8rvRNhm8Nmc6eQUFkg/Wwon7VChji0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271539; x=1699876339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JolvOm92yOZ1uSPHZ4lckHErC5pIJP7wH73mtN8LrOA=;
        b=VNjI0H+3EMu64TPbsQj1GI2anL8u0QbzTe/MYdZzqttJ0hAC2f6pcw7hjzEp6KXEqh
         ItJxkrJi5CC0Kt0ermmCiGrfFMdH/BoykrSrXzU4JEntJH/5uz6NKZtHiY8KSzNh0tx4
         7uIk7kCu10rfuP77yTc7limfyX6oMCpl/NHCEnfl2iP4j6MqUxc20cfgWlgnONf0SMeW
         6Jq6mrsZsQl/jqqB2Mdt3iIvwQM88LO+bpw+u8stRAH2NfJX3XU6qu3LXlCMFZOGdikX
         sWY3wP8S6OT/zzKaINNNARLk66NVMR8aslha3Kz+APjwDk9Y8aTL78bB4I/4dan0QAeT
         71LA==
X-Gm-Message-State: AOJu0YyKFkkLeX1FjdDojU1kvHgDSNHU1Dttx46Dm6xeQ1j9IT1qHBF5
	t2NI1V+ZxkD3IF2fTu4HFuT/RnA6UG2vz8W+jyvSDg==
X-Google-Smtp-Source: AGHT+IG7qNjAO4YMznVsDeDdDfA0+mTM77BRHg8YkB2I5SXXILOUEQxRAlmZT8dnYWsLiYP8AHsOP9iCEynp+uk5iP0=
X-Received: by 2002:a05:651c:221c:b0:2bc:dcdb:b5dc with SMTP id
 y28-20020a05651c221c00b002bcdcdbb5dcmr27658540ljq.39.1699271539333; Mon, 06
 Nov 2023 03:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com>
In-Reply-To: <20231103194551.64448-1-jandryuk@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 6 Nov 2023 11:52:08 +0000
Message-ID: <CA+zSX=aoRoGY3--7uLZjvVeGQbQ+ns+Lio=voWr88o4j8j-d6A@mail.gmail.com>
Subject: Re: [PATCH for-4.18 0/2] golang: Binding fixes
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 7:46=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com> w=
rote:
>
> These two patches refresh the bindings which have gone a little stale.
> I used two separate patches since the XSA-443 one may want backporting.

Thanks for these.  Out of curiosity, do you use the golang bindings,
and if so, are you happy with how you're consuming them now?  We had
talked at some point about exposing the bindings somewhere on xenbits
(or maybe gitlab) such that people should simply add the path to their
golang projects and have it download & build like "normal".  Is that
something you'd find useful?

Peace,
 -George

