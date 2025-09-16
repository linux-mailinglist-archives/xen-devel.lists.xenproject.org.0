Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C701AB59103
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 10:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124568.1466863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyRFg-00059l-V0; Tue, 16 Sep 2025 08:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124568.1466863; Tue, 16 Sep 2025 08:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyRFg-00057q-Rt; Tue, 16 Sep 2025 08:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1124568;
 Tue, 16 Sep 2025 08:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL7b=33=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyRFg-00057k-29
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 08:41:28 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea08e8f2-92d8-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 10:41:18 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f7cd8ec2cso6113860e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 01:41:18 -0700 (PDT)
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
X-Inumbo-ID: ea08e8f2-92d8-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758012078; x=1758616878; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=El3Ib6F1KjdsO1/Gdr5bPdBdPa3T/yY6demzLruzJfw=;
        b=lNStVW9MyLf8kgx02ZwdOmJJBSY+/xii0dRiZ/cwXK1Yye98VdR88G3zwKD77REe1+
         hnkXHy3m2s05Y9C/IbWjJZKJI4n5D/4UewfF0OR7cYyUBLWZylylQDm/2g/cJje/ZA2p
         5u2N1nSshkIE1MFW34Ivv4JBFqdpme8B4nZzOWu2AmqDUWMz31vLzSrf+gV4QnfhqQAC
         Y+mAT1odTBozrdRhYuNDoU4ahOfjiLiA4tg/4tpwW4cWHT7Qi2SMK5hevVk4BusLM+Kq
         UAbufB3YIsUXTlRvQ42fwLCMLKJcJebzjvl2zPHFFp+Y9y+L95LIEtPUWogreAwWCJ7H
         03Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758012078; x=1758616878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=El3Ib6F1KjdsO1/Gdr5bPdBdPa3T/yY6demzLruzJfw=;
        b=srZBJHhc4ivPKUnX+ED58V6nP0vfe4XA9f1XZbCmdFjuf6SoglxkXutox1n/qP5CUf
         od6AEt/09caCc9A16KYFDR7rp0elGZV2A7ypI+zyeWoGJ5XQloQDMLuuLzW77pqGuQ1Y
         s+4eeiZRx4xFx7Pgay/Lqh5PCUh/FB/QzXlYP37YQqWmEn3WSWr9GiTKzKxi86T93A/R
         2Ebzac3JpKFYanHlIXJ4PN/HZew9A5/rluX7dvgIoRPoHOfYQp3s7thHaoL+pzdb+Bp0
         3gev0zlV8V+kf+dOL3qSoNnmJi96BjC5vbvueo0s5QKp5xx+7+DSogLC/XwwtdD1xIIF
         ddpw==
X-Gm-Message-State: AOJu0Yzd9ByNGGt2ZSfvq5yHqBxO0sKNwjZH8zkj2rFXpMAiHnK4qbYN
	ESkohM0cU6C8C63mHaVp7XuaXC+0YLT/1Hhh3cJLNiuOFQdpMXAIzOrra7d9FKonLbDIj9lnG2D
	B53Q5qBOxulroVA9LLaVOa9UORu2JHJQ=
X-Gm-Gg: ASbGncuXccqXoQtxHIrG5UdmTtXFVIlmdQxLhHMCr3NLv8e42w7235x2YytYyrsppyU
	lcdKkoxYjNx9dchiiwHVU5BJ1Ir2PTTb3fq2qhM/o8FUOikw7pC1XuMOt4sT0YuI5wAdLPtno7N
	A9inaxBcbOX4vMkLJx0QAvuTtzLJlAUaeBRRwcCN0FAEoffsCayDmzmG9F3vk3RbjneUIN52H8v
	zq7DA==
X-Google-Smtp-Source: AGHT+IFSaoW0fYKvZs6OedwlNuCbz1iQIBfY3TuXQvtZsV1hP+Dxvwpur6g0eNfVOFEehd8QNJq+phDWME16ztcoAYo=
X-Received: by 2002:a05:6512:1352:b0:573:8044:a98f with SMTP id
 2adb3069b0e04-5738053edf1mr2306217e87.15.1758012077828; Tue, 16 Sep 2025
 01:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756803419.git.mykola_kvach@epam.com> <9dffe19e3ba29020a8f35c0fcf12f088de6b9eea.1756803419.git.mykola_kvach@epam.com>
 <95ac4fa9-3169-4285-874e-32ec58c247b2@xen.org>
In-Reply-To: <95ac4fa9-3169-4285-874e-32ec58c247b2@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 16 Sep 2025 11:41:06 +0300
X-Gm-Features: AS18NWBa8KS0uSO_0XMWmo8TIoQIp5xF1NRtRkSdVJherFpMzMuWNIOeEHlxmJI
Message-ID: <CAGeoDV_Z4Hu2v0Opa8bhORGDm630a=dhbn=qvLQ6stEJ1veM3g@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support
 for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sat, Sep 13, 2025 at 1:47=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 02/09/2025 10:03, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add a new entry under the "Virtual Hardware, QEMU" section documenting
> > support for the optional PSCI SYSTEM_SUSPEND function exposed to guests=
.
>
> AFAICT, this is added under "Virtual Hardware, Hypervisor".

My bad, thanks for catching that.

>
> >
> > This function is available via the virtual PSCI (vPSCI) interface and
> > allows guest domains (domUs) to initiate system suspend operations.
> >
> > The feature is currently marked as "Tech Preview".
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> With the above fixed:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

