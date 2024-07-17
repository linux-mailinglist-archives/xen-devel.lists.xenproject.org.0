Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B4934027
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 18:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760066.1169777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7Cb-0005ti-W5; Wed, 17 Jul 2024 16:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760066.1169777; Wed, 17 Jul 2024 16:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7Cb-0005rk-T8; Wed, 17 Jul 2024 16:08:25 +0000
Received: by outflank-mailman (input) for mailman id 760066;
 Wed, 17 Jul 2024 16:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rT7O=OR=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1sU7CZ-0005rD-Tp
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 16:08:23 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca764736-4456-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 18:08:23 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e05ebd3d607so903608276.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 09:08:23 -0700 (PDT)
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
X-Inumbo-ID: ca764736-4456-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721232502; x=1721837302; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJQN4PcAxApfhsADBsm+WUgj0Z0zHJ/SDxH8c314x/4=;
        b=ltMcXPDvO3MCtPrLWV3rvoNRS63IDAs/qmn9NjMNbV3Lscxe4QzjLaQDoifAX2uofJ
         UVRXvwtZQqbhqSNr0SDBkpfGZnniKvriRMTRsbWQWR+T3hIP8LaeNYrd7EpnQeNrKSfw
         NQLKIHwQ8XQL858pkQ6DldeGs3EPThX/L/DszUhy03fy7YiinRUaHhl8TWKpPLwgXJCu
         AhTsEnmxqUYudNH9+CjI50g7Ez5cNK4GsPl+M8/nTmRVbyAjb8XgqWNOWTYzFxQUoRRD
         J4DUd+3E5m+iX7NnTXtBREeHZFbTNubG5c+RvAb0KzXshoH0W4iWvI6e95FSVh1lH57k
         u7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721232502; x=1721837302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJQN4PcAxApfhsADBsm+WUgj0Z0zHJ/SDxH8c314x/4=;
        b=UItHxfmVtTuAqPle0faOVr0QzDeh6g/QPw1D/X2Kv623jemneDBrTb4MjKrB4tS2/l
         zggij0J4hXOHeHZH7G6Q5F4up+Mao1HTJpa/4qHnBv3f3tj1RAarr3XY2jGKd2zZK+xB
         GW5FoIOFcHk9lDLyP0gywVDEe1W+PqmF4Re3apTQ/GITIKBKSTPeshzJFhhAq7xg2GRV
         UQL/Dzuh7dxizVbZCS4H7RRvYRSRheBBPTu19v2zG58rTV83UzzJiIf+I5IaIKubfasn
         KwHeZo3XkfaKdWpz4lr3QM1Ri0akK2B7jkgDgqI+yCHUV86wKeeJUS4XJI6J9sEmtev1
         3/nQ==
X-Gm-Message-State: AOJu0Yz+dDxsOfYVZt+lNsADZtqbzGjBebXUKBiOwzpWFTswI4a6HB/c
	+G8x/FYRPzg2zKmkm7GgnkKyYDx/3k43Q5kbRtOy0EGXK7dCe+BF7M01/0ebr45t5xXb0pHTtoo
	NEpY6jOsIWoYW8w8i/Af/6w40HOvUALld7mw=
X-Google-Smtp-Source: AGHT+IGVCcW/5nYFEdEKMiSGub6UKQT0e4gaQUnHMhAsYJyuDrZo6xXyVMhil91lnf8BJ6ZR0n+qbb7vTvNschUQOek=
X-Received: by 2002:a05:6902:154f:b0:e02:bc1a:8ee1 with SMTP id
 3f1490d57ef6-e05ed6ee75amr2532208276.29.1721232502008; Wed, 17 Jul 2024
 09:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <lypzl0go.tk0dry5orda8@vates.tech>
In-Reply-To: <lypzl0go.tk0dry5orda8@vates.tech>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 17 Jul 2024 17:07:45 +0100
Message-ID: <CAF3u54AanxBtuZyhj9tjgB+7z8yRwveppkEZL32_z-vAE_-daA@mail.gmail.com>
Subject: Re: Pre-register now for the Xen Project Winter Meetup 2024!
To: Olivier Lambert <olivier.lambert@vates.tech>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Olivier,

Le mer. 17 juil. 2024 =C3=A0 16:33, Olivier Lambert
<olivier.lambert@vates.tech> a =C3=A9crit :
>
> Hello everyone,
>
> As discussed during our previous Xen Summit in the first design session, =
"The Future of Xen Events," we aim to create an event that is:
>
> Financially neutral for the Xen Project (0 cost, entirely supported by Va=
tes and sponsors)
> 100% branded as a Xen Event, similar to a regular Summit
> Featuring content akin to a normal summit (talks & design sessions)
> Attracting new contributors to the Xen dev community
> Utilizing our own tools to reduce costs and be free from the Linux Founda=
tion
> Serving as a test bed for future Xen meetings, proving we can manage with=
out the LF
>
>
> That's exactly what we are doing with the Xen Project Winter Meetup 2024!=
 More details are available at https://campaign.vates.tech/xen-project-wint=
er-meetup.
>
> Save the Date: The event will take place on January 30-31, 2024 (Tuesday =
to Friday) in Grenoble. Consider using the weekend to enjoy nearby ski reso=
rts! =F0=9F=98=87

I assume you mean 2025? :) But can you confirm the dates? Is it two
days or 4 days?

Cheers,

--=20
Julien Grall

